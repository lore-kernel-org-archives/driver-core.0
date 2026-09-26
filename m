Received: from mail-vs2-f38.google.com (mail-vs2-f38.google.com [74.125.227.38])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4594839EF0F
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 19:59:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.38
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790452742; cv=none; b=ogjBQfT5BFpSX32nlqk5ly0C5ALcfGVf3lELqQDAIjbxEMtdfKL4zlDwt8ziT10QyKHjmXFQ+dHsw+ZrlybwEKmNDIX92r3hhtBXD4PWUce9I9V8UXP2UVnjQfBVq9HpwpYN3v8Nmdx80L1TGSEadrGpfOByCm6SN56aaciOpUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790452742; c=relaxed/simple;
	bh=8UOZbOPEi4Ge9a21iEwLQt5UuMD2DMDLNGwGB/guOUY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ccNIpliXoZeEi9fzd6RY3veYJycYixUyhtfMs4NiDGB5CKxuA4E8JEovy/334jLboTT8Mz23jWspq0MU07GF9lrlgL6NBMD6JvfafYq2Kz3eYqgkewBKOksavoU9d184TkWvLlFF8PxnUKiuq1bu9bHkYZVh86kq/9GAUpE2uaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YIX8HcoP; arc=none smtp.client-ip=74.125.227.38
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YIX8HcoP"
Received: by mail-vs2-f38.google.com with SMTP id 71dfb90a1353d-5cdb9cb7feeso299595e0c.2
        for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 12:59:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790452739; x=1791057539; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=BEHFYKvdtxBCG1FtsLCemOPEWS8unZFjNSw09BPKGlI=;
        b=YIX8HcoP8tK0lSXvEy6tWJP2LuTQMACp4fHbsUpLjvuu+A/f7PLw0Py/6COO+48kP+
         2fCBwyGNh7rDobexHBjf+pymT28p2QWAlwzZDnLNj0TqLa50T3Z9M7ZHzmsU//R9o11b
         y1u0dF0UNVPnsKa6Oo4aUGzIWw6BHy+QDk+UBs+leEkOwd1o0RmwuvVi3S54TvxfJCiL
         iFgfe1oNxviFv/FFdq/Hik+CuS/5g1Ldlmcsvkij5y4HaSKiymk6pFRn1EDQH2EdsFO+
         rbvir/0qo5b9cbRBiJn7HHVjF3ZOiFAD+0e4mr1pFZex5+mJr+/iLMMBHDqnLv7lifJw
         id9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790452739; x=1791057539;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=BEHFYKvdtxBCG1FtsLCemOPEWS8unZFjNSw09BPKGlI=;
        b=wTj3K1T+bypLEPGaEaW7/c9yGYLnLK8MoiM7b183b+m7X7SARbeexYdIGzBZQg/DNh
         qdR8FYixaFz/TlYUjUiJuZRPEaz9PKCgrqFBK6PgeAzoIS1/zGkevNiSrauVBexUEYJn
         Yw3Jg0S8/W1uFH90DhmIaxT9/hQ/l1XiXMwjW/kiRTPsJKbqScvMYXgZvJhQ/4hgnV/6
         q76HQ2cd5JFsvtMbet2VYtc9viSG/Gnc0bXsMkNZ5bdbF/Py4JVDoO9nPeQIAc5szob5
         xGZH68fauZMuKTYYgNnXFMDWTJ4529ItRh0P9/7izNcGAFlmfOBsqYc2yVaBDlSX0ace
         fFbw==
X-Forwarded-Encrypted: i=1; AKwUvBwJ9VpMIQs5IClRmrFvuNPf/s7J03b94Yo5cg2/C/gg6uFQB3cbM354l69VE87SYchkt9Z/qiXmpkAEGA==@lists.linux.dev
X-Gm-Message-State: AFuF++lrZP+I5uNNIlJtWb6v8RajpspvcYMUFyaYVPxYa215wvGSdPvt
	PcUzvb5ZmOyUwTPynOkQ75EJaFPVqpYPdodZJbv7lA53CnJQxhSsOgTT
X-Gm-Gg: AYBFou29mqWmYiAShVC0bHHxDjiVsvmQkm3ytA13l7NVHl/RJsySBl0+TMyunsxeWSG
	mRtuXUn/7/eif2q/izBVooyZ3lG6ikNuncP2vo2u/QcfO5UqDRP/AgW5FEZYmJdPuXHRUa67S0q
	DKnbm26q/Cf8my3XXBERSHEnXSO4e9tDj9ipMXT93Q+bmcqjmxapq2gWRI7KQ6Xj7g1emfclT03
	w47oGF2v0kiJuWLz6UVkMGg3C5HH6r8J5AB6eKrVsDPZhIQwMtD+mT6ryC23GGU3FKkIoFEE0wX
	7BuSJTvFGbAVWvxuUkdrnpmp3QCTHMNfekZkw5+xBkfzlpbuK7y7V1CUeuAEcsZo0bXdbPZLrlR
	ZI4QStZ3qeslE/Eib1IM/XZHpPsGi5U5ihc0f6G+vExWIz8rGFWgTfI6BMtRjgKMUO5Nx5RzQHl
	nFhjKGZV5Lr+sCrngB0gwy2d0OPBVxGVibnTPIYA2/dqPcGa1OqX57ql4MuBcEYLAZ
X-Received: by 2002:a05:6102:41a9:b0:7a8:3fba:361a with SMTP id ada2fe7eead31-7af1f3f6a52mr3135256137.37.1790452739061;
        Sat, 26 Sep 2026 12:58:59 -0700 (PDT)
Received: from beelink.. ([187.13.30.172])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9861afedba5sm7437742241.8.2026.09.26.12.58.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 12:58:58 -0700 (PDT)
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
Subject: [PATCH v4 1/2] debugfs: fix use-after-free in debugfs_read_file_str()
Date: Sat, 26 Sep 2026 16:58:43 -0300
Message-ID: <20260926195844.1296333-2-qwe.aldo@gmail.com>
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

debugfs_write_file_str() publishes a new string pointer via
rcu_assign_pointer(), waits for a grace period with synchronize_rcu(),
then frees the old string.

debugfs_read_file_str() dereferences file->private_data without holding
an RCU read-side critical section: it loads the pointer, calls strlen()
on it, and then copies the string.  If a concurrent writer completes
synchronize_rcu() and kfree()s the old string between the load and the
use, the reader accesses freed memory.

Fix by measuring the string length under rcu_read_lock(), allocating
with GFP_KERNEL outside the critical section, and then copying with
strscpy() under a second rcu_read_lock().  If the current string no
longer fits the allocated buffer, retry with a PAGE_SIZE allocation
which is the upper bound enforced by the write path.

Cc: stable@vger.kernel.org
Assisted-by: sashiko.dev <sashiko-bot@kernel.org>
Signed-off-by: Aldo Ariel Panzardo <qwe.aldo@gmail.com>
---
 fs/debugfs/file.c | 39 +++++++++++++++++++++++++--------------
 1 file changed, 25 insertions(+), 14 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 08de6652a..f9a1f7739 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1018,7 +1018,7 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 			      size_t count, loff_t *ppos)
 {
 	struct dentry *dentry = F_DENTRY(file);
-	char *str, *copy = NULL;
+	char *str, *copy;
 	int copy_len, len;
 	ssize_t ret;
 
@@ -1026,26 +1026,37 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 	if (unlikely(ret))
 		return ret;
 
-	str = *(char **)file->private_data;
-	len = strlen(str) + 1;
-	copy = kmalloc(len, GFP_KERNEL);
-	if (!copy) {
-		debugfs_file_put(dentry);
-		return -ENOMEM;
-	}
+	len = 0;
+	for (;;) {
+		rcu_read_lock();
+		str = rcu_dereference(*(char __rcu **)file->private_data);
+		len = max_t(int, strlen(str) + 1, len);
+		rcu_read_unlock();
+
+		copy = kmalloc(len, GFP_KERNEL);
+		if (!copy) {
+			debugfs_file_put(dentry);
+			return -ENOMEM;
+		}
+
+		rcu_read_lock();
+		str = rcu_dereference(*(char __rcu **)file->private_data);
+		copy_len = strscpy(copy, str, len);
+		rcu_read_unlock();
+
+		if (copy_len >= 0)
+			break;
 
-	copy_len = strscpy(copy, str, len);
-	debugfs_file_put(dentry);
-	if (copy_len < 0) {
 		kfree(copy);
-		return copy_len;
+		len = PAGE_SIZE;
 	}
 
-	copy[copy_len] = '\n';
+	debugfs_file_put(dentry);
 
+	copy[copy_len] = '\n';
+	len = copy_len + 1;
 	ret = simple_read_from_buffer(user_buf, count, ppos, copy, len);
 	kfree(copy);
-
 	return ret;
 }
 
-- 
2.43.0

