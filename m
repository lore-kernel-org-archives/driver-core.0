Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=79.135.106.25
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793829368;
	b=hx99pfb8uYiHY9jsth3a36o4uzqSXkAga39O1PGUq3BFo8ZR1Qshk0oy2p3wi5vtPy9p
	 l6nQfncavAikiIw3BwSfMYaTvaaXSy3tibj1+jKQmMwQm71zO9mpsw5k2kjRhiZkoT5eW
	 tni1et8O0B9qpgyjZ1buUpXllq157zZ769pgWl9Aa/t/qqzSjZqOR2YO42yTtOSnRrfdo
	 4d9rXS71qKfW2GHPzXLz8p4S5ZTGgrcQ5PeHxc/cpJ4RKpsy7FpqFtCC0ApM1hTpHsJjs
	 CPOYkK4Gpq8Kjt6zM3QthQZtMSpnyDPr3DP+jsMT5p1RRQrDU8HMZpjTRBbj3WX8D0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793829368;
	h=DMARC-Filter:DKIM-Signature:Date:To:From:Cc:Subject:Message-ID:
	 In-Reply-To:References:Feedback-ID:X-Pm-Message-ID:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=D/YsceI1ZD4wK28mfxd3WkKTnNLn9kRMNBo92okJVB8=;
	b=hT2CS5T2i1Qi5SD50yq89B/4cf4kuwXndcdA+/OzBZNW+NMrm1MWCGmPf7iM9Lck8Hzx
	 Mal3r19fKzI367T04NI8wjee0/PvDyIDCWeep7pZJu2ynk52WDQdNCBb6KiSxX7kna9IG
	 U6zAK2hFkAI/muKRNPec9C+FPZu2CzwJVEBIjxf2eqRzZXnbUWfNgiBBmBXtj31b2t2En
	 IrTRuLKh1a9Clla+d8xBHU+9voUPnOuQ5+aLqySeJ1GcJ/jc0a6mBERAr53I0CMaIzOoF
	 1EkWIeOlwIFnOm9rWTtWR/fTCphEdSBuphFU2p5im2h+kv2rVCgcrF7HoZ7Ji9+4Wlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=modelmiser.com;
	spf=pass smtp.mailfrom=modelmiser.com;
	dkim=pass header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=XthgSATK;
	arc=none smtp.remote-ip=79.135.106.25
Received: from mail-10625.protonmail.ch (mail-10625.protonmail.ch [79.135.106.25])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3239260BF2ED
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 21:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3239260BF2ED
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=modelmiser.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=modelmiser.com header.i=@modelmiser.com header.a=rsa-sha256 header.s=protonmail header.b=XthgSATK
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=modelmiser.com;
	s=protonmail; t=1793829363; x=1794088563;
	bh=D/YsceI1ZD4wK28mfxd3WkKTnNLn9kRMNBo92okJVB8=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=XthgSATKLNfTYP2fx7+VGsIARJIst1MFW/Dfx2t0HwW+OYEXShIuD9XQBFLhIk7ar
	 GIohrMMj990TKfIy5EcvKYpTLJziMrXVqBzstLjzDb+2KWSDxXcHpXGkWNF73rX4NF
	 yftMowtzGw77Dt1mQdfeu3KmIUnVeeb2EQOkjQYRCMLr7q/uobSrOSU6tTvRbV7lKI
	 NIjbuWn9+BQqmO6jSU07bFo7u+3kzDrY6TkUMMZsVRisOXgch2jMYp6PlArzFyRVQz
	 7qPJsROsMVGwqLUEW94S2+zYWksCZqr1GXhu6of3p1xcSbqZf2b42R9I5moJjfLT7Y
	 Sqk0VQgKywjwg==
Date: Wed, 04 Nov 2026 21:55:58 +0000
To: linux-kernel@vger.kernel.org
From: Chad Aldreda <ca@modelmiser.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>, driver-core@lists.linux.dev, linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>, Hans Verkuil <hverkuil+cisco@kernel.org>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Nick Faro <yux50000@hotmail.com>
Subject: [RFC PATCH 1/4] debugfs: add debugfs_file_revoked() for debugging aids
Message-ID: <20261104215546.3990950-2-ca@modelmiser.com>
In-Reply-To: <20261104215546.3990950-1-ca@modelmiser.com>
References: <20261104215546.3990950-1-ca@modelmiser.com>
Feedback-ID: 232753253:user:proton
X-Pm-Message-ID: f98c9a637ac96e17d79d9b3452736028913ef461
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

A debugging aid that finds a stale pointer behind an open debugfs file
needs to know whether debugfs itself has already cut that file off from
its driver, and if so which release callback close() will still run.
That knowledge is debugfs-internal: the proxy file_operations
identities, the removal state of the dentry, and which of debugfs's own
_unsafe helpers take the removal guard or copy their data at open.

Add debugfs_file_revoked(), built only with CONFIG_DEBUG_DEVRES_REFS
(added by the next patch, its only user) and not exported, since that
user is built in. It returns true for a removed file created through
the full proxy, the short proxy, or one of debugfs's guarded helpers
(the DEFINE_DEBUGFS_ATTRIBUTE() family, blobs, bools, strings) or one
that copies its data at open (u32 arrays), and hands back the
file_operations whose release callback will still run. A file created
with an _unsafe variant and the driver's own file_operations gets no
guard from debugfs, and the function returns false for it.

Written with Claude (Anthropic) under my direction; see the cover letter
for the disclosure required by Documentation/process/generated-content.rst.

Signed-off-by: Chad Aldreda <ca@modelmiser.com>
---
 fs/debugfs/file.c       | 112 ++++++++++++++++++++++++++++++++++++++++
 include/linux/debugfs.h |  29 +++++++++++
 2 files changed, 141 insertions(+)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 170feb7531..1673fd7e2e 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -11,6 +11,7 @@
=20
 #include <linux/module.h>
 #include <linux/fs.h>
+#include <linux/magic.h>
 #include <linux/seq_file.h>
 #include <linux/pagemap.h>
 #include <linux/debugfs.h>
@@ -1373,3 +1374,114 @@ void debugfs_create_devm_seqfile(struct device *dev=
, const char *name,
 =09=09=09    &debugfs_devm_entry_ops);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_devm_seqfile);
+
+#ifdef CONFIG_DEBUG_DEVRES_REFS
+/*
+ * debugfs's own file_operations for _unsafe files on which nothing after
+ * open can reach the driver's data: either every operation takes the
+ * removal guard (debugfs_file_get()), or the data is copied at open.
+ */
+static bool debugfs_unsafe_fops_safe_after_removal(const struct file_opera=
tions *fops)
+{
+=09if (fops =3D=3D &fops_blob || fops =3D=3D &fops_str ||
+=09    fops =3D=3D &fops_bool || fops =3D=3D &fops_bool_ro || fops =3D=3D =
&fops_bool_wo)
+=09=09return true;
+=09if (fops =3D=3D &u32_array_fops)=09/* copies the array at open */
+=09=09return true;
+=09/*
+=09 * DEFINE_DEBUGFS_ATTRIBUTE(): read/write go through
+=09 * debugfs_file_get(), release only frees the simple_attr, and the
+=09 * macro sets no other operation at all.
+=09 */
+=09return fops->read =3D=3D debugfs_attr_read &&
+=09       (fops->write =3D=3D debugfs_attr_write ||
+=09=09fops->write =3D=3D debugfs_attr_write_signed) &&
+=09       fops->release =3D=3D simple_attr_release &&
+=09       !fops->llseek && !fops->read_iter && !fops->write_iter &&
+=09       !fops->iopoll && !fops->iterate_shared && !fops->poll &&
+=09       !fops->unlocked_ioctl && !fops->compat_ioctl && !fops->mmap &&
+=09       !fops->mmap_prepare && !fops->flush && !fops->fsync &&
+=09       !fops->fasync && !fops->lock && !fops->get_unmapped_area &&
+=09       !fops->check_flags && !fops->flock && !fops->splice_write &&
+=09       !fops->splice_read && !fops->splice_eof && !fops->setlease &&
+=09       !fops->fallocate && !fops->show_fdinfo &&
+=09       !fops->copy_file_range && !fops->remap_file_range &&
+=09       !fops->fadvise && !fops->uring_cmd && !fops->uring_cmd_iopoll &&
+#ifndef CONFIG_MMU
+=09       !fops->mmap_capabilities &&
+#endif
+=09       !fops->init_dma_buf_io_ctx && !fops->fop_flags;
+=09/* Keep in step with struct file_operations in include/linux/fs.h. */
+}
+
+/**
+ * debugfs_file_release_safe - will close() of a removed file leave the
+ *                             driver's data alone?
+ * @fops: the file_operations debugfs_file_revoked() handed back, or NULL
+ *
+ * Return: true if @fops has no release callback, or one of the generic
+ * ones that only free what open() allocated (seq_file, simple_attr, u32
+ * array). A driver's own release may dereference i_private or
+ * private_data; full_proxy_release() documents that it must not, but
+ * nothing enforces it.
+ */
+bool debugfs_file_release_safe(const struct file_operations *fops)
+{
+=09if (!fops || !fops->release)
+=09=09return true;
+=09return fops->release =3D=3D single_release ||
+=09       fops->release =3D=3D seq_release ||
+=09       fops->release =3D=3D simple_attr_release ||
+=09       fops->release =3D=3D u32_array_release;
+}
+
+/**
+ * debugfs_file_revoked - has debugfs cut @file off from its driver?
+ * @file: an open file, held by the caller
+ * @real_fops: set to the file_operations close() will still consult, or
+ *             NULL for a short-fops proxy; callers must still test
+ *             ->release, which may be NULL
+ *
+ * For debugging aids that find a stale pointer behind an open debugfs fil=
e
+ * after the file was removed; not for use elsewhere.
+ *
+ * Return: true if @file is a removed debugfs file on which no further
+ * operation can reach the driver's data: one created through the full
+ * proxy (debugfs_create_file() and the helpers built on it), on which
+ * read/write/llseek/ioctl fail with -EIO and poll reports EPOLLHUP (see
+ * __debugfs_file_get()); or one of
+ * the _unsafe files whose read/write callbacks are debugfs's own guarded
+ * ones (the DEFINE_DEBUGFS_ATTRIBUTE() family, blobs, bools, strings) or
+ * which copy their data at open (u32 arrays). close() still runs the real
+ * release callback on such a file, through full_proxy_release() for
+ * proxied files and directly otherwise, so @real_fops names it. A file
+ * created with an _unsafe variant and the driver's own file_operations
+ * gets no guard from debugfs, and this returns false.
+ */
+bool debugfs_file_revoked(const struct file *file,
+=09=09=09  const struct file_operations **real_fops)
+{
+=09const struct debugfs_fsdata *fsd;
+
+=09*real_fops =3D NULL;
+
+=09if (!d_unlinked(file->f_path.dentry))
+=09=09return false;
+
+=09if (file->f_op =3D=3D &debugfs_full_proxy_file_operations) {
+=09=09/* Populated by full_proxy_open_regular(), pinned by the file. */
+=09=09fsd =3D READ_ONCE(file->f_path.dentry->d_fsdata);
+=09=09if (fsd)
+=09=09=09*real_fops =3D fsd->real_fops;
+=09=09return true;
+=09}
+=09if (file->f_op =3D=3D &debugfs_full_short_proxy_file_operations)
+=09=09return true;=09/* short fops: no release callback at all */
+=09if (file_inode(file)->i_sb->s_magic =3D=3D DEBUGFS_MAGIC &&
+=09    debugfs_unsafe_fops_safe_after_removal(file->f_op)) {
+=09=09*real_fops =3D file->f_op;
+=09=09return true;
+=09}
+=09return false;
+}
+#endif /* CONFIG_DEBUG_DEVRES_REFS */
diff --git a/include/linux/debugfs.h b/include/linux/debugfs.h
index 4177c47382..b2a63037d5 100644
--- a/include/linux/debugfs.h
+++ b/include/linux/debugfs.h
@@ -166,6 +166,23 @@ void *debugfs_get_aux(const struct file *file);
=20
 int debugfs_file_get(struct dentry *dentry);
 void debugfs_file_put(struct dentry *dentry);
+#ifdef CONFIG_DEBUG_DEVRES_REFS
+bool debugfs_file_revoked(const struct file *file,
+=09=09=09  const struct file_operations **real_fops);
+bool debugfs_file_release_safe(const struct file_operations *fops);
+#else
+static inline bool debugfs_file_revoked(const struct file *file,
+=09=09=09=09=09const struct file_operations **real_fops)
+{
+=09*real_fops =3D NULL;
+=09return false;
+}
+
+static inline bool debugfs_file_release_safe(const struct file_operations =
*fops)
+{
+=09return true;
+}
+#endif
=20
 ssize_t debugfs_attr_read(struct file *file, char __user *buf,
 =09=09=09size_t len, loff_t *ppos);
@@ -336,6 +353,18 @@ static inline int debugfs_file_get(struct dentry *dent=
ry)
 static inline void debugfs_file_put(struct dentry *dentry)
 { }
=20
+static inline bool debugfs_file_revoked(const struct file *file,
+=09=09=09=09=09const struct file_operations **real_fops)
+{
+=09*real_fops =3D NULL;
+=09return false;
+}
+
+static inline bool debugfs_file_release_safe(const struct file_operations =
*fops)
+{
+=09return true;
+}
+
 static inline ssize_t debugfs_attr_read(struct file *file, char __user *bu=
f,
 =09=09=09=09=09size_t len, loff_t *ppos)
 {
--=20
2.43.0


