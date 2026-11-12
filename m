Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794493030;
	b=imnNY0sHWEsH/pxUdaq7lJHZoqCakP4147D62c1xcEAeqvn9qTX2d1EzBb0vePJogr0o
	 bRINlmiJQ94uxUjU3z6szeWhdyalsw6+qrCHqUB52dK64hTUVFiA+QBnmrGvoJQD/R/ca
	 +KXbZEZFdOdBSPjVXAbXaWKp3mHPCQmYjUgM5IGsVREg7uZxo40hQfLqUc32uTBNgVq1Q
	 59hkwzaJ1TCuTLVPWri2FWx15+8+Kemuq/iz5Em2LEFsjEjqylaq0s/BXE/VGLWI1QvED
	 IJ9Li3f75u8KHIjb3acuom4WTnhMD6idCAZErRyEisdNUNos+da0gIYv27mN1NiLhwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493030;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=boCA2daOQ+TyIVh3xMJHgQmUEAwZI0O8OGy6/w/qqJ8=;
	b=oogwhoJ7VjBTl9Bpa9U8aDR5v7Cg5Nxo8oYo+QaKOePSRDPX6fJEqNrK67VrGRpEQ9mO
	 yqw4hNPSJ9seTR4QS/Mj49Phb1kLfMbwVFubmERC27jQn9JdAvdbdxvxgyiJDdVGUarvA
	 ebPrPlXCHdZg+MbRQ1vaLkdB5Z11ixPiTEystPyCkITl+XEXwbaZ8/iF+c3a3D+2w67Ce
	 gzUGBAEsElviEKWDxzrZrBRQavo0FCVeiZoIpb39IPwDCgZKb/UwwRgoSJvJFGjl0/cs8
	 c3KdtZ2yFIUrhsIvnEj3DZesmnJl1f+QgvgO2mhdpVXQfRuKXvoj4rjKx1/VxfiZVmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyFRAuWk;
	arc=none smtp.remote-ip=209.85.218.52
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75EA3606A8BB
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:17:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 75EA3606A8BB
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=xyFRAuWk
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-c45551fa84eso664176866b.3
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 06:17:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794493028; x=1795097828; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=boCA2daOQ+TyIVh3xMJHgQmUEAwZI0O8OGy6/w/qqJ8=;
        b=xyFRAuWkrSr+nPmcZzlgciDKZv2aG6mJ1bVmCwmCRO5XJudRwHgmHy4bDhA0Q8MZn5
         X2Tk0oiQ0aEgud9lSAvNCQ+a18wWpv7lQ6miVtz7Opy5QU2Sw0x8bMbI9Iy2p4TwUqyT
         3xDzMOpF361V/wKjFM2TMe7IkQVQ2MCKiOgHVGDpcHKWyNH9fhIAsJCisWIM7OCvETaB
         q6gRCaZCgCCPehlD8YfrE/z/5AGosNoYnJDcp/Uxvx9A/Il9TcC67nfUyI3lGVdMBg01
         PGvRMc6YVLI8Pxizg1WaA53sBzYeIaD4xf8AHdgVGfvG54Q6bpqCgTH1Q8EbRy747yVl
         WkhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493028; x=1795097828;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=boCA2daOQ+TyIVh3xMJHgQmUEAwZI0O8OGy6/w/qqJ8=;
        b=OWq51GVSUXLUfVRKBRXyeAfgoOXm/p2N8I0KQrZ7ZOQfjeHXvY+50xXhWvmgtxAz46
         8Mj/xv239E177cRJsdLSpyzlowHG0yA6m+upXyRGUzZMLVfr3nHWaN3wykQtOdfKJie7
         wB6YuSmgT/Mh+lwLk1EKdkBh+Z4CVRuOGn3UIfPkS4PDw548U+xUvnV+76Bz3NQUSf1R
         G0ZWFkgG2BFOI6Z5oHtdj1p2s5ReqNA+1eS8YVfRbZmM5QI8eszTeavTC/JfeAklS/Yu
         nGwV39UdySONHYXaBYfL98YTEPeP550kN7PXdwTK1K++fsMEuRbr+JNLENOgHhAxEdOp
         f5Hg==
X-Forwarded-Encrypted: i=1; AL+hErHy0LkEJCf3eTfMEDg3RVp8c4NlXpOk5S3m5Fqguk82dAaX9npkmvyaRoSx/+ib9Nw2IUmumOKdmCTtpw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+A/SvhE45qp/ZkGx1vqxXvQB6hyBH4E49kVI7UZzFqYN3B/ZVF
	kuTS6fNub4yf2FHcAXP+TcAz3JWpJTpCQAv8waDIzCgOs3Kks5+necrf
X-Gm-Gg: AYBFou3w0cHYW4PG19hQXk5kKifzsfS4IqjjRQKRVd0aa52fYzOWH3PGKx2bRteMEcG
	8HB9uLqQZBW/IdV+HZcQUKzJxWfdby1F8XiElHDBRFD0akvRiAElMs/ratZp+xJ4ysEnmSgMpJM
	H49o4zT6Chgb9dpJjTfABpaqLxjlvaiTixZpvfVvvpUxwCvbdhgiR6djuMDIoLJmEHEOA+bkL+X
	O/UHNRI1vzeGTuvldoZTGDPdHOr/49Kr5jLgsSdTqY92Rn3YXXVsEP6gXU/eu3gdqBytGrQbHq1
	QoJtpcHgQdjnSXhMky6/iiWP67Kmc9kIMxTkTy8OCOCOWQtSd7ZdB0tkb3lKTIMD+9nEk5xHLU7
	++bEWawGOfjdRzpgtnzQRWGzyqb+sC7VXBDoJs5tBARBKWsuIkrvtGvwcTywXsuQTYpU+L8ERN6
	hOnoi++KgOLtjJNLv+5VE55ZJKdHTtPMK3eA4xwm3PRCr7h4NIuvc45ITl/eYOEarpQfPqgtysG
	91uXSOrrnPfvc1CpGcWeT1UeLUcS1+AfDfotlyNk1HUq+CKySaPFgXTewophP5aMVjv8p/XFm9N
	t4QHINLpLXuicMhSwXPx7g2eo7+k/xZTXgS5IfmehXifvbhaiwHDHnV0in4mx1G3xVQnc6HCmFp
	iIESFAWw5IG5f2w1fZkvjXysg9aINSl/Tnz1OFF3FrMlrXhPhFVMipQsdFymblqfWgqwP61J9T+
	F2/LGOkeYbtKr3IfLel07KO28nLguwIvSDHeiYwF9VQsd8BHkMGMw=
X-Received: by 2002:a17:907:f816:b0:c49:b952:5425 with SMTP id a640c23a62f3a-c5066ce8350mr454392466b.45.1794493027762;
        Thu, 12 Nov 2026 06:17:07 -0800 (PST)
Received: from Ubuntu (87-205-15-91.static.ip.netia.com.pl. [87.205.15.91])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a56b772sm360156466b.16.2026.11.12.06.17.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 06:17:07 -0800 (PST)
From: Krystian Kaniewski <krystianmkaniewski@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tejun Heo <tj@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>
Cc: Ian Kent <raven@themaw.net>,
	Danilo Krummrich <dakr@kernel.org>,
	Johan Hovold <johan@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Pavel Machek <pavel@kernel.org>,
	Jens Axboe <axboe@kernel.dk>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>,
	Jan Kara <jack@suse.cz>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	autofs@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	syzbot+002fb7b2d0bc53bf7e75@syzkaller.appspotmail.com
Subject: [PATCH v3 1/2] kernfs, sysfs: add SYSFS_NO_SPLICE to refuse splice on writable opens
Date: Thu, 12 Nov 2026 15:17:01 +0100
Message-ID: <f9f3df7a60ecbbacc3186b700deb947d7dc23e9f.1794479968.git.krystianmkaniewski@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1794479968.git.krystianmkaniewski@gmail.com>
References: <cover.1794479968.git.krystianmkaniewski@gmail.com>
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

Some sysfs stores look up a path written by the user, for example
/sys/power/resume through lookup_bdev(). When the path reaches an
autofs mount, autofs writes a mount request to its daemon pipe while
kernfs holds of->mutex. splice() enters kernfs files with a pipe mutex
held, and writable opens of all kernfs files without mmap share one
lockdep class for of->mutex, so lockdep sees

  &pipe->mutex --> &of->mutex --> &sbi->pipe_mutex --> &pipe->mutex

A splice into any writable kernfs file can add the first edge. A splice
from the autofs daemon pipe into a file whose store looks up the path
is a real deadlock, because autofs then waits for the mutex of the pipe
that the splice holds.

Add kernfs_ops->no_splice and SYSFS_NO_SPLICE for such files. Writable
opens of a marked file refuse both splice directions with -EINVAL
before the file callback runs, and their of->mutex and seq_file lock
get lockdep classes of their own. The seq_file lock needs its own class
as well, because a read through such an open takes of->mutex under it,
while a splice from any other seq_file takes the shared seq_file class
under a pipe mutex. Read-only opens keep splice support because they
cannot reach ->write().

Suggested-by: Tejun Heo <tj@kernel.org>
Link: https://lore.kernel.org/r/ec0c2add83f18d7a3c726d5d219dfe42@kernel.org
Signed-off-by: Krystian Kaniewski <krystianmkaniewski@gmail.com>
---
v3:
- Rename SYSFS_LOOKUP and ->may_lookup to SYSFS_NO_SPLICE and
  ->no_splice (Tejun).
- Drop the mmap, prealloc and binary attribute checks, document the
  limits in comments instead (Tejun).

v2:
- Replace the v1 locking changes with per-attribute splice control.
- Preserve splice on read-only opens.
- Split both the open-file mutex and seq_file lock classes.
- Reject incompatible mmap and preallocated-buffer combinations.
- Reject SYSFS_LOOKUP on binary attributes.
- Rebase onto v7.4-rc1.

 fs/kernfs/file.c       | 46 +++++++++++++++++++++++++++++++++++++++---
 fs/sysfs/file.c        | 18 +++++++++++++++++
 fs/sysfs/group.c       |  4 ++--
 include/linux/kernfs.h |  9 +++++++++
 include/linux/sysfs.h  | 22 ++++++++++++++------
 5 files changed, 88 insertions(+), 11 deletions(-)

diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
index cca9f83fc9b5..9a0640fb2959 100644
--- a/fs/kernfs/file.c
+++ b/fs/kernfs/file.c
@@ -649,6 +649,12 @@ static int kernfs_fop_open(struct inode *inode, struct file *file)
 	if (!of)
 		goto err_out;
 
+	/*
+	 * Splice callbacks need this before the iter paths acquire an active
+	 * reference, so cache it while @kn is active.
+	 */
+	of->no_splice = (file->f_mode & FMODE_WRITE) && ops->no_splice;
+
 	/*
 	 * The following is done to give a different lockdep key to
 	 * @of->mutex for files which implement mmap.  This is a rather
@@ -666,11 +672,17 @@ static int kernfs_fop_open(struct inode *inode, struct file *file)
 	 * lookup helpers for arbitrary paths and readonly files can be read by
 	 * overlayfs from vfs helpers when sysfs is a lower layer of overalyfs.
 	 *
-	 * All three cases look the same.  They're supposed to
+	 * Writable opens of ->no_splice files get a fourth key.  Their
+	 * ->write() may wait for userspace through a pipe, so splice, which
+	 * takes @of->mutex under a pipe mutex, is refused for them.
+	 *
+	 * All four cases look the same.  They're supposed to
 	 * look that way and give @of->mutex different static lockdep keys.
 	 */
 	if (has_mmap)
 		mutex_init(&of->mutex);
+	else if (of->no_splice)
+		mutex_init(&of->mutex);
 	else if (file->f_mode & FMODE_WRITE)
 		mutex_init(&of->mutex);
 	else
@@ -717,6 +729,16 @@ static int kernfs_fop_open(struct inode *inode, struct file *file)
 	of->seq_file = file->private_data;
 	of->seq_file->private = of;
 
+	/*
+	 * seq_read_iter() takes @of->mutex under the seq_file lock, whose key
+	 * is shared with seq_files that can be spliced. Separate it too.
+	 */
+	if (of->no_splice) {
+		static struct lock_class_key seq_no_splice_key;
+
+		lockdep_set_class(&of->seq_file->lock, &seq_no_splice_key);
+	}
+
 	/* seq_file clears PWRITE unconditionally, restore it if WRITE */
 	if (file->f_mode & FMODE_WRITE)
 		file->f_mode |= FMODE_PWRITE;
@@ -889,6 +911,24 @@ static __poll_t kernfs_fop_poll(struct file *filp, poll_table *wait)
 	return ret;
 }
 
+static ssize_t kernfs_fop_splice_read(struct file *in, loff_t *ppos,
+				      struct pipe_inode_info *pipe, size_t len,
+				      unsigned int flags)
+{
+	if (kernfs_of(in)->no_splice)
+		return -EINVAL;
+	return copy_splice_read(in, ppos, pipe, len, flags);
+}
+
+static ssize_t kernfs_fop_splice_write(struct pipe_inode_info *pipe,
+				       struct file *out, loff_t *ppos,
+				       size_t len, unsigned int flags)
+{
+	if (kernfs_of(out)->no_splice)
+		return -EINVAL;
+	return iter_file_splice_write(pipe, out, ppos, len, flags);
+}
+
 static loff_t kernfs_fop_llseek(struct file *file, loff_t offset, int whence)
 {
 	struct kernfs_open_file *of = kernfs_of(file);
@@ -1035,8 +1075,8 @@ const struct file_operations kernfs_file_fops = {
 	.release	= kernfs_fop_release,
 	.poll		= kernfs_fop_poll,
 	.fsync		= noop_fsync,
-	.splice_read	= copy_splice_read,
-	.splice_write	= iter_file_splice_write,
+	.splice_read	= kernfs_fop_splice_read,
+	.splice_write	= kernfs_fop_splice_write,
 };
 
 /**
diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index cd5bb0f9fee6..54f715fe57a8 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -252,6 +252,17 @@ static const struct kernfs_ops sysfs_prealloc_kfops_rw = {
 	.prealloc	= true,
 };
 
+static const struct kernfs_ops sysfs_no_splice_kfops_wo = {
+	.write		= sysfs_kf_write,
+	.no_splice	= true,
+};
+
+static const struct kernfs_ops sysfs_no_splice_kfops_rw = {
+	.seq_show	= sysfs_kf_seq_show,
+	.write		= sysfs_kf_write,
+	.no_splice	= true,
+};
+
 static const struct kernfs_ops sysfs_bin_kfops_ro = {
 	.read		= sysfs_kf_bin_read,
 };
@@ -296,6 +307,13 @@ int sysfs_add_file_mode_ns(struct kernfs_node *parent,
 			ops = &sysfs_prealloc_kfops_ro;
 		else if (sysfs_ops->store)
 			ops = &sysfs_prealloc_kfops_wo;
+	} else if (mode & SYSFS_NO_SPLICE) {
+		if (sysfs_ops->show && sysfs_ops->store)
+			ops = &sysfs_no_splice_kfops_rw;
+		else if (sysfs_ops->show)
+			ops = &sysfs_file_kfops_ro;
+		else if (sysfs_ops->store)
+			ops = &sysfs_no_splice_kfops_wo;
 	} else {
 		if (sysfs_ops->show && sysfs_ops->store)
 			ops = &sysfs_file_kfops_rw;
diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 4e1e4f18a166..ef4cd632ace2 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -74,11 +74,11 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 					continue;
 			}
 
-			WARN(mode & ~(SYSFS_PREALLOC | 0664),
+			WARN(mode & ~(SYSFS_PREALLOC | SYSFS_NO_SPLICE | 0664),
 			     "Attribute %s: Invalid permissions 0%o\n",
 			     (*attr)->name, mode);
 
-			mode &= SYSFS_PREALLOC | 0664;
+			mode &= SYSFS_PREALLOC | SYSFS_NO_SPLICE | 0664;
 			error = sysfs_add_file_mode_ns(parent, *attr, mode, uid,
 						       gid, NULL);
 			if (unlikely(error))
diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
index 73786b567ccd..2e8466d2c314 100644
--- a/include/linux/kernfs.h
+++ b/include/linux/kernfs.h
@@ -272,6 +272,7 @@ struct kernfs_open_file {
 	char			*prealloc_buf;
 
 	size_t			atomic_write_len;
+	bool			no_splice;
 	bool			mmapped:1;
 	bool			released:1;
 	const struct vm_operations_struct *vm_ops;
@@ -320,6 +321,14 @@ struct kernfs_ops {
 	 * ->prealloc.  Provide ->read and ->write with ->prealloc.
 	 */
 	bool prealloc;
+	/*
+	 * "no_splice" makes writable opens refuse splice and gives their
+	 * @of->mutex and seq_file lock separate lockdep classes.  Set it
+	 * for a ->write() that may wait for userspace, e.g. through a path
+	 * lookup that triggers an automount, so that the write never runs
+	 * under a pipe mutex.  Not supported with ->mmap or ->prealloc.
+	 */
+	bool no_splice;
 	ssize_t (*write)(struct kernfs_open_file *of, char *buf, size_t bytes,
 			 loff_t off);
 
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index b1a3a1e6ad09..574424760c23 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -75,12 +75,13 @@ do {							\
  * @is_visible:	Optional: Function to return permissions associated with an
  *		attribute of the group. Will be called repeatedly for
  *		each non-binary attribute in the group. Only read/write
- *		permissions as well as SYSFS_PREALLOC are accepted. Must
- *		return 0 if an attribute is not visible. The returned
- *		value will replace static permissions defined in struct
- *		attribute. Use SYSFS_GROUP_VISIBLE() when assigning this
- *		callback to specify separate _group_visible() and
- *		_attr_visible() handlers.
+ *		permissions as well as SYSFS_PREALLOC and SYSFS_NO_SPLICE
+ *		are accepted. Must return 0 if an attribute is not
+ *		visible. The returned value will replace static
+ *		permissions defined in struct attribute. Use
+ *		SYSFS_GROUP_VISIBLE() when assigning this callback to
+ *		specify separate _group_visible() and _attr_visible()
+ *		handlers.
  * @is_bin_visible:
  *		Optional: Function to return permissions associated with a
  *		binary attribute of the group. Will be called repeatedly
@@ -124,6 +125,8 @@ struct attribute_group {
 
 #define SYSFS_PREALLOC		010000
 #define SYSFS_GROUP_INVISIBLE	020000
+/* Writable opens refuse splice, not for prealloc or binary attributes */
+#define SYSFS_NO_SPLICE		040000
 
 /*
  * DEFINE_SYSFS_GROUP_VISIBLE(name):
@@ -251,6 +254,13 @@ struct attribute_group {
 	.store	= _store,						\
 }
 
+#define __ATTR_NO_SPLICE(_name, _mode, _show, _store) {			\
+	.attr = {.name = __stringify(_name),				\
+		 .mode = SYSFS_NO_SPLICE | VERIFY_OCTAL_PERMISSIONS(_mode) },\
+	.show	= _show,						\
+	.store	= _store,						\
+}
+
 #define __ATTR_RO_MODE(_name, _mode) {					\
 	.attr	= { .name = __stringify(_name),				\
 		    .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
-- 
2.53.0

