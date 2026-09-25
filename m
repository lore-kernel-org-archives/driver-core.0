Received: from mail-dy2-f42.google.com (mail-dy2-f42.google.com [74.125.229.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5742F4CE68D
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.229.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790359122; cv=none; b=tufI2kZCsvObtmRRzLlTU9g4XeOXyDVdP91kaSq3N4/sHjAw/D3hftfInfP11RcU0lT3OJ4562JccJ+JTH7frMawhVYmQCXJmHqnAlLJDON66w4ZUeLu4DcerO1QT0qaW0tmw+AvJHIGqLMR+94ky46tBDEaE+3u2C9GBNNv3i8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790359122; c=relaxed/simple;
	bh=tqYkFdlB+Gf3zGxRIPlgH5brUkSD/ZzDRxUCCGmPAVg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=cD3o5oDxdZJE0PlECmvc/f8FCxVl9PiWv5u18XHHzHr59aOFE4yd00hvxmQdPCZkhxwbGYG54NuL+mDXgC/0FEP9v91nWaOLoajfeu0NS9TPndr/GCUM+/VYDP9h/Xx6kkyynDpFWRX+VlU8EB1nm+p3wDCIGxmdPgHlA/bY7gI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nS9nGBOm; arc=none smtp.client-ip=74.125.229.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nS9nGBOm"
Received: by mail-dy2-f42.google.com with SMTP id 5a478bee46e88-3411e0ace58so1354225eec.0
        for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 10:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790359119; x=1790963919; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gZCZSkaZCcGJ3FNhL9nh22Z+U7H+uDG8KzVr1CK3Xzs=;
        b=nS9nGBOmWDjUv+7SwveCGppxuJEiGGBbDZDyWdDT80vxjb0OSgjOS4pi7ksfK0SDHh
         elv+qnHp7uLC7pFFTaKQpbfDtgLLsnqbNj3zn1/LRrvJ5Qp+4NAHASos46IcEkY+Smy4
         y6IWpnE2R5cAjR8G7rbWa00FUtaIye2nTF8wSmws5vd8ak+eyDpUvQyw8OqCwmlAGUSo
         Zg5Z55Q8MEYc0ZGThNtc3VI1LfJVKo9NTfLxjVVE+CJKWpsa2ZCqdrv+6g2I84eRg6kf
         HBPKoz5Pcyhna2L73x55yCOyG5hK+Z6IgRYvgLHnB1yvZyVB9tONxHJgIHyrr3GBdTqu
         TVbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790359119; x=1790963919;
        h=content-transfer-encoding:content-type:mime-version:message-id:date
         :subject:cc:to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gZCZSkaZCcGJ3FNhL9nh22Z+U7H+uDG8KzVr1CK3Xzs=;
        b=c6cpzG8y/sr3/k1NoXSPQwfsggumNFT6YU/99xpcyJpy1YPiYNx04qE8EsppmZkctK
         bVDfA6Hr4HyXdkuk+76y52c/trs2jyZDmbeLTCykJG6mI0ChsXOosi9OBpw5m+5pYLyJ
         PZ7F36XevLpIkQrcs6ShMQN2w45dnzFW/tFhN7HKsumQA8pRIO0tmoRXZ8s7jkhfMSAT
         31U8l3FqwrRwu9Yv6OVjiuX1PrwlM8D0JHiH3YNJzx1fRtMu1Mh3psHOYoBABLJZVkrq
         6/otv245kcjIVbYFHho/ltzFb+zk4qyg//2hG1d+9ssUvYrmuXa0UZtnEpGcTtLuiZu3
         xznw==
X-Gm-Message-State: AFuF++nM8dCkUu8rDBmgB6A8FZXBH4H/vStv7elTymFFb4/o7YSaYLog
	jYj5BPy9SGsUDPFU7vo5RjGrqIhLeeIE3RIsRBRLy4tnUyweAx4A/gFL
X-Gm-Gg: AYBFou02dC+f4BTMKObjmq+JTJ9S4hSmhTS6T83p65hKPzDZLW4+42pi8KOdwpN1iXy
	0W5y3AH68t0BemoCFpCO1Il6IIXFDkpzYOGDKOyhS+HDAO+kDillDQKaeMLBW14/8+/zHubDXiW
	3k0kciot22kfd+hazrnYV5L1Ka69ZlAiPRyyrfkmC25l4IZkFj+H40Bqh2FpRpvLaW/lB5gfek5
	o6I6dy43RBM5aVPCtOicb0pnuALsdi4own5aBeCLLqjgu0GjtyvOApLtc7jpfzffSr9E/nvQDov
	4fpmJUcjwgExGb36Sv0dCqTuOqqg5sxbmckelMDitQZivFSQKUTxyAfIYKciVTult8X+3oiyTYC
	ufG1N4edWHO8+bgj6AHvNhR2po7Jtdw7FgpU+THNugGgqX5b5wZsjnmZvvQZy5pPUxA1ASfYm92
	t1S3tvwxZkv2cHLt5aMREKb3FPkgKWm5QbgTEAnoIhjRSLgcF+NkS/aJZQ+84xFqk=
X-Received: by 2002:a05:7301:5804:b0:33b:e3c8:a757 with SMTP id 5a478bee46e88-342705b865cmr1251812eec.1.1790359118916;
        Fri, 25 Sep 2026 10:58:38 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-34144172d8asm7651125eec.5.2026.09.25.10.58.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 10:58:38 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>
Subject: [PATCH] debugfs: fix UAF and double-free in debugfs_str read/write
Date: Fri, 25 Sep 2026 14:58:27 -0300
Message-ID: <20260925175831.3701812-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

debugfs_write_file_str() stores the new string via rcu_assign_pointer()
and frees the old one after synchronize_rcu().  However,
debugfs_read_file_str() dereferences file->private_data without holding
an RCU read-side critical section, so synchronize_rcu() in a concurrent
writer can return—and kfree() the old pointer—before the reader finishes
using it (use-after-free).

Additionally, two concurrent writers both read the same `old` pointer
before either calls rcu_assign_pointer().  When both subsequently call
kfree(old) a double-free results.

Fix both issues:

 - Read path: wrap the pointer dereference and string copy inside
   rcu_read_lock()/rcu_read_unlock(), using rcu_dereference() and
   GFP_ATOMIC to keep the allocation within the critical section.

 - Write path: serialize concurrent writers with inode_lock(), and use
   rcu_dereference_protected() to read `old` under the held lock.  The
   lock is released before synchronize_rcu()+kfree() so readers are not
   blocked during the grace period.

Cc: stable@vger.kernel.org
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 50 ++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 22 deletions(-)

--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1018,34 +1018,32 @@
 			      size_t count, loff_t *ppos)
 {
 	struct dentry *dentry = F_DENTRY(file);
-	char *str, *copy = NULL;
-	int copy_len, len;
+	char *str, *copy;
+	int len;
 	ssize_t ret;
 
 	ret = debugfs_file_get(dentry);
 	if (unlikely(ret))
 		return ret;
 
-	str = *(char **)file->private_data;
+	/*
+	 * Pair with rcu_assign_pointer() in debugfs_write_file_str().
+	 * Without this critical section, synchronize_rcu() in a concurrent
+	 * writer can complete and free the string before we finish reading it.
+	 */
+	rcu_read_lock();
+	str = rcu_dereference(*(char __rcu **)file->private_data);
 	len = strlen(str) + 1;
-	copy = kmalloc(len, GFP_KERNEL);
-	if (!copy) {
-		debugfs_file_put(dentry);
-		return -ENOMEM;
-	}
+	copy = kmemdup(str, len, GFP_ATOMIC);
+	rcu_read_unlock();
 
-	copy_len = strscpy(copy, str, len);
 	debugfs_file_put(dentry);
-	if (copy_len < 0) {
-		kfree(copy);
-		return copy_len;
-	}
-
-	copy[copy_len] = '\n';
+	if (!copy)
+		return -ENOMEM;
 
+	copy[len - 1] = '\n';
 	ret = simple_read_from_buffer(user_buf, count, ppos, copy, len);
 	kfree(copy);
-
 	return ret;
 }
 
@@ -1061,40 +1059,48 @@
 	if (unlikely(r))
 		return r;
 
-	old = *(char **)file->private_data;
+	/*
+	 * Serialize concurrent writers: without this lock two simultaneous
+	 * calls can both read the same 'old' pointer and double-free it.
+	 */
+	inode_lock(file_inode(file));
+	old = rcu_dereference_protected(*(char __rcu **)file->private_data,
+					lockdep_is_held(&file_inode(file)->i_rwsem));
 
 	/* only allow strict concatenation */
 	r = -EINVAL;
 	if (pos && pos != strlen(old))
-		goto error;
+		goto unlock;
 
 	r = -E2BIG;
 	if (pos + count + 1 > PAGE_SIZE)
-		goto error;
+		goto unlock;
 
 	r = -ENOMEM;
 	new = kmalloc(pos + count + 1, GFP_KERNEL);
 	if (!new)
-		goto error;
+		goto unlock;
 
 	if (pos)
 		memcpy(new, old, pos);
 
 	r = -EFAULT;
 	if (copy_from_user(new + pos, user_buf, count))
-		goto error;
+		goto unlock;
 
 	new[pos + count] = '\0';
 	strim(new);
 
 	rcu_assign_pointer(*(char __rcu **)file->private_data, new);
+	inode_unlock(file_inode(file));
 	synchronize_rcu();
 	kfree(old);
 
 	debugfs_file_put(dentry);
 	return count;
 
-error:
+unlock:
+	inode_unlock(file_inode(file));
 	kfree(new);
 	debugfs_file_put(dentry);
 	return r;

-- 
2.43.0
