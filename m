Received: from mail-vs2-f28.google.com (mail-vs2-f28.google.com [74.125.227.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2661139D3FD
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 19:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452746; cv=none; b=RyEgJjb3+XgFJdN030hxWcdpSZFhGqZX9nxQ+sGJTQR74iLsk5HA9/n+OekulpKmsD+3R/MVM41Q48r01G59Jp8GhTf9PmaSIpH7j/35OgAtKhCa//9ly+ASMVK4FDw5wdHKK6VuEVG3zbdRmbrOmIyHArPZaKUEJW2nFU1x8Jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452746; c=relaxed/simple;
	bh=pJiK7ZtLoIcftmOoWyXhNhrwyq68Wzdhbk2Nfje+Cic=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UFfAfh/AqyII1XEk8/g2ZpZHjXCBxbnMMrq24ZjRe6xkKnqnPwXDYAPcScCOUbkVuhkInek+O9QrraS/1riZUUj01CkxqJO2/z+8tc2+A5y1Ph/17t4AUTUqPMP6VScnt6omxr3iA1t2UBhAdxeKpIyqdUNQSqXqPkWRcl/2Cpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8P+589V; arc=none smtp.client-ip=74.125.227.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8P+589V"
Received: by mail-vs2-f28.google.com with SMTP id 71dfb90a1353d-5c9031e714dso644912e0c.3
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 12:59:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452743; x=1791057543; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2Ww3AExQEh492MzEx3J90ZjmI7uAFZp+mMSUVOyh4tk=;
        b=n8P+589VpLGLJJLEimwh/tueK9WytIn4ScudFOKtwfa0U3ytH/+jAFbFb4fTljpfyN
         Zldns1Jkx8oKv/3WZHbOPKw7eNjEQG3Mpd7FptGA+ep9M8qdO5P6+gzwPRTbKCDP+cd6
         FNqcHR2VLp0HlES/xokBDQrCAyb5i9useK6ecq/w4FPM8SEpjoo9fK9HsycsJrvumTDT
         Sbe4UPYeZ61dWA14S2wERwKDD8abWOL1AgeCyFgz4BrrPADgKQ3rPHKu8F/blRayMSoN
         JkDDrfW2ql545HfTlSkVg8rvSnBE7EMsitpbKKGISoSdtfD1YvXsV2hP35/d2VaujdWt
         u73Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452743; x=1791057543;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2Ww3AExQEh492MzEx3J90ZjmI7uAFZp+mMSUVOyh4tk=;
        b=Yb4ha0Eu71grHstPE6Zv2PBwE0ltiY9ZFOsAa1cRetvvbxBRjL75t4+K7WsNEM0pTI
         SSkvVOuyY0Mi81eWVbiDQRAIm0hEXabcpFdsw94cLF20t6YKjMYFz4iwoUrLcv63b1Lo
         5wqySad4zMe56iOBzWZbkvjJUEZxtUVjM22/MZ9kH2FwFWtOKtxTARgvSvtwgs+5LFwP
         DQVwMH5VZY/S1VXLD0OoEbqHl2N6O+IUMXrWD7JZAfCfJBuBE2lFUMiyvRZft3CC6jPD
         vwBqL/JrqMMmO/uyPQs8yDVb3MlTx52cST4+t0WdOV8p/UWLMDxDlW8yGtIS7Lbfvlhw
         +Q5w==
X-Forwarded-Encrypted: i=1; AKwUvBw4he1It/RmB2RcGPt+MkYrMK3NJPXJL5hxDfh94/nk+5r9HQkEcOjPPD6Vd923BHUjaK7JPU+aM5GHKA==@lists.linux.dev
X-Gm-Message-State: AFuF++ltTwvFia8nQsAIp2MM0xcyzzOFwQyXM9n7Xv3mr8utmN9mJaDy
	duRE+Op3/sM6hWU6j2o8a4+QhWYH9vIc5FoRIHUNHDnmqQPVMTvmbwE1
X-Gm-Gg: AYBFou18k1b8j8kerv82qxAcrHn4ukH8GB6523GjnoJWoNY9SBtVDOWUY/33cwihSTT
	l/OlTHtbKxaIZTX7Z4XoZjukx6R83mQPz5AmccxRdtb+VLdMP32KqzCAMt2LFJdkUQhqeV33i/r
	5YXJ0Mn66/eJn+Ih9Opy8E2VxsRNlGc4nBUyXJXYpQOScykA9B0oqCs5I9RyzJ/8TsKpN4j3pXw
	Ge3PBkBDy3yg5FZZKVDWF2VFJyKFp/Q7Y4HR/6oPoWiedWOr1FJXgef/2oHFtxeU2rGRzee5X5k
	/VDfCsCOm1hWuoR2uVDoGn6PZGVdiWloBG1FrkfOfRc25FBTNwoiNPb5fam3iipOpqRT48BoDOt
	XePkUMka3b7F8b/MkF9jkPKzEbi3thICbLYLVUeEL7fp/DFfojRE8SXqs+yFq1XwrRGrMNmiqaE
	leMRvUck2MlAv1iwdh4oOrigEruOpH2wrIF692r5n805OpwsQSj0sWcYrroHUUdNw=
X-Received: by 2002:a05:6102:8098:b0:7a7:1db6:c769 with SMTP id ada2fe7eead31-7b1c751f1e3mr1477646137.22.1790452743026;
        Sat, 26 Sep 2026 12:59:03 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afedba5sm7437742241.8.2026.09.26.12.58.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:59:02 -0700 (PDT)
From: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: johan@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	stable@vger.kernel.org,
	Aldo Ariel Panzardo <qwe.aldo@gmail.com>,
	"sashiko . dev" <sashiko-bot@kernel.org>
Subject: [PATCH v4 2/2] debugfs: serialize concurrent writers in debugfs_write_file_str()
Date: Sat, 26 Sep 2026 16:58:44 -0300
Message-ID: <20260926195844.1296333-3-qwe.aldo@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260926195844.1296333-1-qwe.aldo@gmail.com>
References: <DLPDB44JJRGJ.3K6JNS746M71C@kernel.org>
 <20260926195844.1296333-1-qwe.aldo@gmail.com>
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
concurrent writers through the same inode: two simultaneous calls can
both load the same `old` pointer before either publishes a replacement,
and when both later call kfree(old), the result is a double-free.

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
index f9a1f7739..7a9d33772 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1072,40 +1072,44 @@ static ssize_t debugfs_write_file_str(struct file *file, const char __user *user
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

