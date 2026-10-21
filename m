Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792587122;
	b=isR+afLu/z0LlmdNjIehPZpOeF/f9SRQYf+Jlqz4qjI5XGI+6ZOQi5XfNzG6vjV1Y42t
	 QCUzhtbUeeXa4VDmlD/DbZfZRgNjCw1VhZXMS6ygCfdSlMHLWOQOu58EfPQDhAd+u7555
	 yDuL4xscYQe6d9p8tstrBTnoFIoRkXLC9XQxK4wJyxyERbIrIi29oK4A6FHOuWQ+bCrGa
	 LbGdXz0dKyI5xEf6mocOx/ZM6B2xL09GcR4ERIu4lTgpAopmBWc0f2MRRE5AHcvI82jkO
	 EacNIhkoVF8xTTWVdnZQcIrfKnXfJMnB6tfrfRE1uJXDKB7QUEW1eeMG74p2vLfvYXg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792587122;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=KpfC3ycXKcDQY4YCk1HOWqaHxlwyq5m57lBpzL91NVs=;
	b=2wVGnTDW9zQJpvJvxd/t91G9aVkhuTLIr3KyUBRBxt/o4lH2N5UzSeS1HNWOTki7W1P9
	 lvc/PmSnVMJ2JQYz+ogQNZfGazv08dOEsGyycLpU4UdMVSkO+U+seHMGkxNOHibOSzrmV
	 P7SFL7ZIHyhTy+RonmSOxudPoHE+gqXqRtaJ5TlcVm5wwpJMWj87mdGPtuBrrOYH3uloS
	 guDCoqzLndViYgkQyNs9P8F/iKharVToBTBxhrq3DmN+WV3PAlCwT821sU9j6c5fYxwo2
	 9JR5Zsec1Se5WT1QKTxkWZLcq38B3JlpiKn9z2KIpJY8QxBCYVqCpIeFqDBDq30dIvA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bVSqFu20;
	arc=none smtp.remote-ip=209.85.218.51
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E26A606A329
	for <driver-core@lists.linux.dev>; Wed, 21 Oct 2026 12:52:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E26A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=bVSqFu20
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-c40e30c26a4so260589266b.0
        for <driver-core@lists.linux.dev>; Wed, 21 Oct 2026 05:52:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792587120; x=1793191920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KpfC3ycXKcDQY4YCk1HOWqaHxlwyq5m57lBpzL91NVs=;
        b=bVSqFu2085obRWBadZBzW6SIqSav/sx3MRLdcglXk2i3CK3j0bWWi0CHJlzLZQh7b8
         LYpwDdnX2GJ5UsXwHz+68/DDzhQ8JPs7kmZWHsFKHOO8JdlKPCWnQBRwl2aTptC+somG
         LITJfIPf4OgTRxIH6wNW79YNjgY7AdQgurvojhSUnjWuVh6zD1tXzjfrssPbVeF/zIg3
         91txuXxTQZqH6MutETahM7Hl4T3KZ2jL0BAlI3roiwIDrviEF0aFaUKBd8DPHbsTnvMN
         XAViZ7vmmzhwKh2GYMbQpRTM10Cs4/gxaP/5IVHTEey+PBaxYEK0UqrH6DEyplGlQs4e
         gyXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792587120; x=1793191920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KpfC3ycXKcDQY4YCk1HOWqaHxlwyq5m57lBpzL91NVs=;
        b=aKDI+7SaTJfyL3rXrvWFwv1jmn3d8b0pJAWmboy0sbQ+u4s4uTW2cmrJAC2eLv/HZN
         Av1ysEU0s6rkl8xRRS4Db64armZBN7H3pjKih3Jl23y9PLj9KWphc4XYAcVGR5mR2eNS
         80rEa0qKh1iZQovUKqj3ORVYHSD6x7G2JSf+Uir+KLlxT7UGLw7lRvrrV4aGtFmlvv2l
         ivvwcKKtuaVEb6zMkotIWjWY9gGTgHLvvd344Epzm6t1kzu3tpae/U649rfNlodIZTD/
         KFtmHueQ+sxpVt3iKv+n0R9nrC/d2FieF0VBtR74HrwUBSZkcst7fIcUSPBVYoCYHa87
         xlMg==
X-Forwarded-Encrypted: i=1; AKwUvBxvumexQbssS7iKoMMYDkrruJj6C5OV7pJd9HNuVF/ca6QkGddbT1d7efXXH/IB28ZnWs9Ed5x/OIqb+Q==@lists.linux.dev
X-Gm-Message-State: AFq9FYKY7d9I0PdxcJtF+r4kE3k/XmpxlXQmdBzGl6B0OtmcntVNM2E/
	j19/O4YGpsDWl+4PSzrhL8c5sqRKAkaIg0gTXM+hjkhs5drnfYa5uJ/V
X-Gm-Gg: AYBFou3eBrtP346kEdhj/FQFtnq4ha4ONZNMm9RMbL+XL/7MWov/V2WswhxqPsUmZJm
	j8rB6rOYpMv4efst7VRifOQTzRMPK8BbHxW4hYuKarHSBe+bp6Bh1YEOnfJRclhdTygzfyoKVz3
	pxxFBE9FcfbPBovVAqL1/cj6Q8r/FhZBHcel4WgzXJRegZyGBQ/rB0AMtMHhS0qPajx0WIlhSDc
	K6jd8tt2ZvACITTOid1w0o81VD66bCDyANyEZN6C756+VjT3jKvVnLef0hHRBgsiek8Kp0Iyvy0
	WoOFlI186I4zXQP8IB03P7OeK1+bR5UC7Kn7MUtXeQvgpw7nE5yI8HowxJWzx0/NRQs1lGusJ86
	V5E87DEv93lbIbDYURiEfi55BrwQoO4cPw6qBLKLdpWenFQZGxtOAqGuj7USs++zJoC3RykkiEK
	TGN8F0+HskpPaRk69iTk4J1exqcu8BqB89Adjthz1ddbvSEEUTsYvcDZnRCKAwqtaAiDeHvXp8t
	lBl7skhQCcAUFz4YefMb5RhcIIKvk05Zqx6Y2RjlZVCCEn/F7hZRuBReaNYiJXz9TQLqXgurcUW
	+LJCRTOZ8bXC3csLq1o8FFARumvQ434Qx8F3WKj7ICRyZZ62pfhpyH2kjx2T0RVLaUAVSVXIWkN
	U2geCHdGnAp5w2MXKXUoWthXBzFRCdzVRAjObnOBeRgq+NUY3FH9Yf6n3I2iBbVJsLm3OzjdFeY
	y/pQ4RdDj//ZuWLi+ag1Ghp/ny
X-Received: by 2002:a17:907:97c9:b0:c42:4557:452c with SMTP id a640c23a62f3a-c460370cce2mr427858366b.8.1792587119735;
        Wed, 21 Oct 2026 05:51:59 -0700 (PDT)
Received: from Ubuntu.tail0f733b.ts.net (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4679004464sm73128366b.67.2026.10.21.05.51.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 05:51:59 -0700 (PDT)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Ian Kent <raven@themaw.net>
Cc: Tejun Heo <tj@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Jens Axboe <axboe@kernel.dk>,
	driver-core@lists.linux.dev,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH 1/2] kernfs: do not hold of->mutex across sysfs ->store()
Date: Wed, 21 Oct 2026 14:51:49 +0200
Message-ID: <cd417f2b7f3a978603853d5b0b85439fbbba4c15.1792577179.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1792577179.git.krystianmkaniewski@gmail.com>
References: <6aa23178.f81106d8.2ab401.0006.GAE@google.com> <cover.1792577179.git.krystianmkaniewski@gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Lockdep reports a circular dependency &pipe->mutex --> &of->mutex -->
&sbi->pipe_mutex. A splice between a pipe and a kernfs file calls
->write_iter() or ->read_iter() of the file with the pipe locked, and
kernfs takes of->mutex there. A write to /sys/power/resume runs
resume_store() under of->mutex, and its lookup_bdev() can trigger an
autofs mount request, whose autofs_write() takes sbi->pipe_mutex and then
the mutex of the daemon pipe.

of->mutex only has to keep the callbacks of one open file apart.
sysfs_kf_write() does not pass the open file to ->store(), and two opens
of the same attribute already run ->store() concurrently. Add a
write_unlocked flag to struct kernfs_ops, cache it in struct
kernfs_open_file next to atomic_write_len, and take of->mutex around
->write() only when the flag is clear. Set it for the regular sysfs
attributes. The preallocated buffer stays protected by
of->prealloc_mutex, and the other kernfs users keep of->mutex.

This does not remove every report through the autofs daemon pipe. A pipe
spliced straight into such an attribute stays locked while ->store()
looks up the path, and a ->store() that takes its own lock around a
lookup keeps that dependency.

Fixes: 1e8c813b083c ("PM: hibernate: don't use early_lookup_bdev in resume_store")
Assisted-by: Gemini:gemini-3.8-flash syzbot
Reported-by: syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Closes: https://syzkaller.appspot.com/bug?extid=002fb7b2d0bc53bf7e75
Link: https://syzkaller.appspot.com/ai_job?id=74fbf9ab-54e4-46c2-b9e9-7867573ff823
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
 fs/kernfs/file.c       | 52 +++++++++++++++++++++++++++---------------
 fs/sysfs/file.c        | 18 ++++++++++++++-
 include/linux/kernfs.h | 11 +++++++++
 3 files changed, 62 insertions(+), 19 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index 8e0e90c933720..c954543c1a583 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -291,6 +291,26 @@ static ssize_t kernfs_fop_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 	return kernfs_file_read_iter(iocb, iter);
 }
 
+/* Call the ->write() operation of @of under an active reference. */
+static ssize_t kernfs_write_active(struct kernfs_open_file *of, char *buf,
+				   size_t len, loff_t pos)
+{
+	const struct kernfs_ops *ops;
+	ssize_t ret;
+
+	if (!kernfs_get_active_of(of))
+		return -ENODEV;
+
+	ops = kernfs_ops(of->kn);
+	if (ops->write)
+		ret = ops->write(of, buf, len, pos);
+	else
+		ret = -EINVAL;
+
+	kernfs_put_active_of(of);
+	return ret;
+}
+
 /*
  * Copy data in from userland and pass it to the matching kernfs write
  * operation.
@@ -305,7 +325,6 @@ static ssize_t kernfs_fop_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct kernfs_open_file *of = kernfs_of(iocb->ki_filp);
 	ssize_t len = iov_iter_count(iter);
-	const struct kernfs_ops *ops;
 	char *buf;
 
 	if (of->atomic_write_len) {
@@ -330,25 +349,18 @@ static ssize_t kernfs_fop_write_iter(struct kiocb *iocb, struct iov_iter *iter)
 	buf[len] = '\0';	/* guarantee string termination */
 
 	/*
-	 * @of->mutex nests outside active ref and is used both to ensure that
-	 * the ops aren't called concurrently for the same open file.
+	 * @of->mutex nests outside active ref and keeps the ops of one open
+	 * file from running concurrently.  ->write() of files with
+	 * ->write_unlocked set does not need that and runs without it.
 	 */
-	mutex_lock(&of->mutex);
-	if (!kernfs_get_active_of(of)) {
+	if (of->write_unlocked) {
+		len = kernfs_write_active(of, buf, len, iocb->ki_pos);
+	} else {
+		mutex_lock(&of->mutex);
+		len = kernfs_write_active(of, buf, len, iocb->ki_pos);
 		mutex_unlock(&of->mutex);
-		len = -ENODEV;
-		goto out_free;
 	}
 
-	ops = kernfs_ops(of->kn);
-	if (ops->write)
-		len = ops->write(of, buf, len, iocb->ki_pos);
-	else
-		len = -EINVAL;
-
-	kernfs_put_active_of(of);
-	mutex_unlock(&of->mutex);
-
 	if (len > 0)
 		iocb->ki_pos += len;
 
@@ -651,6 +663,8 @@ static int kernfs_fop_open(struct inode *inode, struct file *file)
 	 * lockdep key, because the writable file /sys/power/resume may call vfs
 	 * lookup helpers for arbitrary paths and readonly files can be read by
 	 * overlayfs from vfs helpers when sysfs is a lower layer of overalyfs.
+	 * (Note that regular sysfs attributes no longer run ->store() under
+	 * @of->mutex, but other kernfs users still do.)
 	 *
 	 * All three cases look the same.  They're supposed to
 	 * look that way and give @of->mutex different static lockdep keys.
@@ -666,10 +680,12 @@ static int kernfs_fop_open(struct inode *inode, struct file *file)
 	of->file = file;
 
 	/*
-	 * Write path needs to atomic_write_len outside active reference.
-	 * Cache it in open_file.  See kernfs_fop_write_iter() for details.
+	 * Write path needs atomic_write_len and write_unlocked outside
+	 * active reference.  Cache them in open_file.  See
+	 * kernfs_fop_write_iter() for details.
 	 */
 	of->atomic_write_len = ops->atomic_write_len;
+	of->write_unlocked = ops->write_unlocked;
 
 	error = -EINVAL;
 	/*
diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index cd5bb0f9fee6d..71a7faf434073 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -132,7 +132,19 @@ static ssize_t sysfs_kf_read(struct kernfs_open_file *of, char *buf,
 	return min_t(ssize_t, count, len);
 }
 
-/* kernfs write callback for regular sysfs files */
+/*
+ * kernfs write callback for regular sysfs files.
+ *
+ * Regular sysfs files set .write_unlocked = true and are called without
+ * holding of->mutex. Sysfs ->store() maintains no per-open-file state, and
+ * concurrent opens already execute ->store() concurrently without
+ * serialization. Calling ->store() without of->mutex avoids circular
+ * locking dependencies when ->store() performs operations like path
+ * lookups or automounts while a generic VFS lock is held (such as a pipe
+ * lock during splice). Preallocated attributes still serialize buffer
+ * access via of->prealloc_mutex. Existing autofs and callback-owned lock
+ * dependencies remain outside this narrow change.
+ */
 static ssize_t sysfs_kf_write(struct kernfs_open_file *of, char *buf,
 			      size_t count, loff_t pos)
 {
@@ -229,11 +241,13 @@ static const struct kernfs_ops sysfs_file_kfops_ro = {
 
 static const struct kernfs_ops sysfs_file_kfops_wo = {
 	.write		= sysfs_kf_write,
+	.write_unlocked	= true,
 };
 
 static const struct kernfs_ops sysfs_file_kfops_rw = {
 	.seq_show	= sysfs_kf_seq_show,
 	.write		= sysfs_kf_write,
+	.write_unlocked	= true,
 };
 
 static const struct kernfs_ops sysfs_prealloc_kfops_ro = {
@@ -244,12 +258,14 @@ static const struct kernfs_ops sysfs_prealloc_kfops_ro = {
 static const struct kernfs_ops sysfs_prealloc_kfops_wo = {
 	.write		= sysfs_kf_write,
 	.prealloc	= true,
+	.write_unlocked	= true,
 };
 
 static const struct kernfs_ops sysfs_prealloc_kfops_rw = {
 	.read		= sysfs_kf_read,
 	.write		= sysfs_kf_write,
 	.prealloc	= true,
+	.write_unlocked	= true,
 };
 
 static const struct kernfs_ops sysfs_bin_kfops_ro = {
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index 351a5101c8628..cbb09f9533e72 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -272,6 +272,7 @@ struct kernfs_open_file {
 	char			*prealloc_buf;
 
 	size_t			atomic_write_len;
+	bool			write_unlocked;
 	bool			mmapped:1;
 	bool			released:1;
 	const struct vm_operations_struct *vm_ops;
@@ -320,6 +321,16 @@ struct kernfs_ops {
 	 * ->prealloc.  Provide ->read and ->write with ->prealloc.
 	 */
 	bool prealloc;
+	/*
+	 * "write_unlocked" indicates that ->write() does not require
+	 * per-open-file serialization with of->mutex and can be called
+	 * concurrently for the same open file. Callbacks must handle
+	 * concurrent execution. Buffer access for preallocated attributes
+	 * is still protected by of->prealloc_mutex. Lock dependencies from
+	 * callers (such as pipe locks during splice) or within callbacks
+	 * remain outside this scope.
+	 */
+	bool write_unlocked;
 	ssize_t (*write)(struct kernfs_open_file *of, char *buf, size_t bytes,
 			 loff_t off);
 
-- 
2.53.0

