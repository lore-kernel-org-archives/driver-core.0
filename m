Received: from mail-vs2-f39.google.com (mail-vs2-f39.google.com [74.125.227.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D43479889
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 14:09:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790431791; cv=none; b=FFDHbZyLkICkOxWdmFV4C+UxJ0AFHhiPSkZucqebWGwl+n7GUQmQYeLuzmnDv6mjqp3b/Zl2u6M7lC0M4hq37EfMTNszuJQdCVBa14/r8YiMW0hl7VJ5BuWgzxPgt2pyfx8q6G5finGzktxVwE+9L5bmRqWNVJAptOr8T/4LmO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790431791; c=relaxed/simple;
	bh=5NhOeMwcPL3cNQit8Uf28rrEJeSCa/+CpoNhBZRrIyA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WCgtha00Ng/njygiiqRQwujYXh4hJBvfc5q6pp37jM0z/9IeR/TTHKrOP8MAgRKL++OKG+6R/Nb6Z5kSKwnnWL3Dhq9jumc5pFp1zR7yPIvV1Hnhc+BUqDzwr9O5suTQaJhgg99EQZryhmi54s3CcGojtvlzxU++jv8dX43ov7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jId1KTge; arc=none smtp.client-ip=74.125.227.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jId1KTge"
Received: by mail-vs2-f39.google.com with SMTP id 71dfb90a1353d-5cd13e9ec34so500784e0c.3
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 07:09:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790431781; x=1791036581; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQMP576kCixbzoD00htnAcU/ItaFh/gYADgGL3x8irw=;
        b=jId1KTgeuYNrXamQx2qHN/E7x9unQuZ9sEkzaJaiAfPjpPysub2mmtrfy3rFpT+tWv
         jbFjMgLo/sjsU9cBponhBlYd1jEgwbeZqEASKjmbopSW8IIyjKhrVQ/nxyCoCQWlBeOy
         y6mysm269vNM8FtOdyke1BRmIDGbqXTJsXfyCgre9B5G1oFNzICShKiD8UkkwIv4tXM/
         PF++nXyCJlJVavs7O/qVwxhRJ8Exh7bHnQ6GUU7OK0BLBjSceiFDct5EFwyZm78Ww0c0
         nM9jf4+UXlEu2hp2kbq8IhvfscCjeQobSvHvAUlbq0KGpbJwClhCUWeBGQa8xbEEvefk
         vILQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790431781; x=1791036581;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=CQMP576kCixbzoD00htnAcU/ItaFh/gYADgGL3x8irw=;
        b=WXw7zch3bz1+5YjvQC1z9Y4F0BxRRnw1FvysABGvVyzAjZ3lwW9goYSozgbZuTXA8T
         bkPNw1FvqqcVPixJar+GXolu7YeDP5rFE3qBej4kUJ0eoXTGzshwcwAIZcGYzvEJFFrn
         jzefzVCqazPXie+nxCvExvkUQYEvByEmMqsHCuxA9oGldOjYNbJZaHwu1HNURBywjrIm
         frodCyBirto83rTQ7kOU//w0pscfbWQ5ECqpE4CUm1w8hefoJMLlIeahQHp8G1+GHc5k
         WZUujH6WZSnHjcSLoBiaYa6BamylXbXOrNh6qqCuuNufSWoyr0N7AvPDMEAOkw7leJfM
         j/LA==
X-Gm-Message-State: AFuF++nAchtvVNP448ECyCHTvg+xSLG5Yr4N3Gs9PwNixphCIM+ljAeh
	6kQKciqP5/ocnJ/1LLTMNOZj5BqQdTKStqSluDYcmKoHtEe1we/OYnPA
X-Gm-Gg: AYBFou3Qh0FeHp9+aGwlEmLtJZgAGncBCs6A5YpNInjvnG1vkoeQm4s6FZo87m2WNhX
	E3hONH7U5HE2W02SZjarykc/2NQ0Mw3Vlh9ChCROs09DWyK8ewJCejOtHfDWhpYC6rgPjsWQZQd
	yKFe90Txy5ZCkG8DBLnLBEaHU7Bj9KPSJRUfoAc+NS1xQKp6aNnrF/CXkCZaeMmKH/bRI+J2zPl
	YjUB3mgnBguMPgGJ48m+dpiikFNPvoqjEWC9rKrARc0PBt1BkSZTfgQr63FSI/6LK6yKtZzxW3O
	YcSduBRw5f6zHHcHb0ycstBxc5XP+p7MIMLudv9xYw+hSa2WIzJrMOh8clmrnu0z0JYFMockTPz
	rwnRtLWXdGcMM4DQwXD+kh9RZO61CdEpQO2kZx1VrgPN6FxscABb1oo29VDtRUiLO1kmQwefEaW
	F+MhjdhMVFYs1p0NmqpObHZskYfjf9sUVzhT9vz8Mw/Du7jmIRTNk4AyggNI6hS7A=
X-Received: by 2002:a05:6102:390f:b0:7a6:d3f5:3554 with SMTP id ada2fe7eead31-7af1ebf5867mr3357716137.26.1790431780695;
        Sat, 26 Sep 2026 07:09:40 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afb8343sm6580624241.5.2026.09.26.07.09.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 07:09:40 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	"sashiko . dev" <sashiko-bot@kernel.org>
Subject: [PATCH v3 2/2] debugfs: serialize concurrent writers in debugfs_write_file_str()
Date: Sat, 26 Sep 2026 11:09:30 -0300
Message-ID: <20260926140930.1077742-1-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <2026092647-ebony-unlatch-d3d0@gregkh>
References: <2026092647-ebony-unlatch-d3d0@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs_write_file_str() reads the current string pointer into `old`,
builds a replacement, publishes it with rcu_assign_pointer(), then frees
`old` after synchronize_rcu().  There is no mutual exclusion between
concurrent writers: two simultaneous calls can both load the same `old`
pointer before either publishes a replacement, and when both later call
kfree(old), the result is a double-free.

Serialize writers with inode_lock().  Use rcu_dereference_protected() to
load `old` under the held lock, satisfying lockdep annotation.  Release
the lock before synchronize_rcu() + kfree() so RCU readers are not
stalled during the grace period.

Tested on QEMU/KVM (7.3.0-rc4 + KASAN).  A reproducer that spawns
concurrent write() calls on a debugfs string file triggers the
double-free reliably (~3900 KASAN reports in a single run):

  BUG: KASAN: double-free in debugfs_write_file_str+0x194/0x200
  Free of addr ffff888104542ec0 by task poc/305

  Call Trace:
   kasan_report_invalid_free+0xb8/0xe0
   check_slab_allocation+0xd9/0x100
   kfree+0x163/0x510
   debugfs_write_file_str+0x194/0x200
   vfs_write+0x1ed/0x920
   ksys_write+0xe5/0x1a0

  Allocated by task 307:
   __kmalloc_noprof+0x264/0x680
   debugfs_write_file_str+0x106/0x200

  Freed by task 306:
   kfree+0x2e5/0x510
   debugfs_write_file_str+0x194/0x200

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 16 ++++++++++------
 1 file changed, 10 insertions(+), 6 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index ac4199e9f..c696fa44d 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1054,40 +1054,44 @@ static ssize_t debugfs_write_file_str(struct file *file, const char __user *user
 	if (unlikely(r))
 		return r;
 
-	old = *(char **)file->private_data;
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

