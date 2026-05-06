Received: from imap4.hz.codethink.co.uk (imap4.hz.codethink.co.uk [188.40.203.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58F733F23B3
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 16:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=188.40.203.114
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778086760; cv=none; b=o2AkCUkfmWuPLBg6ahdChFJ7Eyy2uYyVcHYuK6d90ybrtzM9Fka0H/QuQs83w5LG1FjpzOoV51iZP5Q2F6HK0Ezw4OnjOj2K+7Et1mESN8tHZorbh9s+sZ3pKQp64y1VGyuqa43eMVs32VuWA2GI32q43sKk9reR4uZ/R56eBWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778086760; c=relaxed/simple;
	bh=YAcfaB6+Dsdqk0ON7i6J+egUUrBcxMASIBERoWPx2FM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EMAEQHLKx/gKdfgCOtx6k+mCmfQqNs8MrIVL0VX3Um/zhOAfAa7sx35dFfVAAPSNgFNy9SV4CiINuCYYpfJvA+XwVUDLyxC9ywZDpPNkvOBcZyV2Phz2EDLa4TBC8gaH9PPnO2JMcIZxCZsqmyNOiFcPW6YHgP1dSN2Wqy5ccTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk; spf=pass smtp.mailfrom=codethink.co.uk; dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b=qEs2VFIQ; arc=none smtp.client-ip=188.40.203.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codethink.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codethink.co.uk header.i=@codethink.co.uk header.b="qEs2VFIQ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=codethink.co.uk; s=imap4-20230908; h=Sender:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:
	References; bh=smfL+H1njCyGKIFXXErVG/yxJ79+sxaMDLh7fTvzHJE=; b=qEs2VFIQDv8Y/q
	lpNqJs4U6m92+b/4uQP5rmjbvnjdHRSBC+5pcM2BicXbqOz71oZsr5amGFLlYFVJed8tuzftRqtbR
	MxLxfXg0tU0mIrViYSR8MlpfgZ9PKLxzS4JeL0lcCldJmdkPZlnkQlebQPDltZWyQ6aJCsnilaD3u
	Y10u4ru/dv+1HXBrs1pWUw8dzjuaeOvcFltgGxfkThNNahXNIr+tQv6nPaR2KPCkdXJTKBAZZthUN
	ATwK42SpXa46Ngaym/6MVjr79qKgAACnHTtesy4u4mjvGcX+1j+vP8I3Fz1/GaQ78kUq5tWveAlMB
	rmfly4/cxjNUXJxig8UQ==;
Received: from cust74-dsl93-89-132.idnet.net ([93.89.132.74] helo=pm-laptop2.codethink.co.uk)
	by imap4.hz.codethink.co.uk with esmtpsa  (Exim 4.94.2 #2 (Debian))
	id 1wKfaU-009qVV-8f; Wed, 06 May 2026 17:59:06 +0100
Received: from pm by pm-laptop2.codethink.co.uk with local (Exim 4.99.2)
	(envelope-from <paul.martin@codethink.co.uk>)
	id 1wKfaT-00000000FLa-1Dxu;
	Wed, 06 May 2026 17:59:05 +0100
From: Paul Martin <paul.martin@codethink.co.uk>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev
Cc: rafael@kernel.org,
	dakr@kernel.org,
	Paul Martin <paul.martin@codethink.co.uk>
Subject: [PATCH] Fix debugfs error returns to match documentation and vice versa
Date: Wed,  6 May 2026 17:58:19 +0100
Message-ID: <20260506165819.58974-1-paul.martin@codethink.co.uk>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: paul.martin@codethink.co.uk

Many of debugfs's exported functions call `debugfs_start_creating()`
and return the errors it returns.  These differ from the documentation
in that:

- `ERR_PTR(-EPERM)` is returned if debugfs is present in the kernel
  but has been disabled by configuration or boot option.

- `ERR_PTR(-ENOENT)` is returned if debugfs is not registered in the
  kernel.

At no point does it return `ERR_PTR(-ENODEV)`.

This patch fixes the returned error in the second scenario to match
the documentation and also the documentation to mention the returned
error for the first scenario.

The comment block above `debugfs_lookup()` says it returns
`ERR_PTR(-ENODEV)` if debugfs is not enabled, but instead it returns
NULL.  This patch fixes the code to match the documentation.
---
 Documentation/filesystems/debugfs.rst |  4 +++-
 fs/debugfs/inode.c                    | 13 +++++++++++--
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/debugfs.rst b/Documentation/filesystems/debugfs.rst
index 55f807293924..b092b0015b98 100644
--- a/Documentation/filesystems/debugfs.rst
+++ b/Documentation/filesystems/debugfs.rst
@@ -41,7 +41,9 @@ dentry pointer which can be used to create files in the directory (and to
 clean it up at the end).  An ERR_PTR(-ERROR) return value indicates that
 something went wrong.  If ERR_PTR(-ENODEV) is returned, that is an
 indication that the kernel has been built without debugfs support and none
-of the functions described below will work.
+of the functions described below will work.  If ERR_PTR(-EPERM) is returned
+debugfs support was compiled in but has been disabled by default in the
+kernel configuration or by passing ``debugfs=off`` on the kernel commandline.
 
 The most general way to create a file within a debugfs directory is with::
 
diff --git a/fs/debugfs/inode.c b/fs/debugfs/inode.c
index 4598142355b9..fc521bf9f191 100644
--- a/fs/debugfs/inode.c
+++ b/fs/debugfs/inode.c
@@ -346,7 +346,10 @@ struct dentry *debugfs_lookup(const char *name, struct dentry *parent)
 {
 	struct dentry *dentry;
 
-	if (!debugfs_initialized() || IS_ERR_OR_NULL(name) || IS_ERR(parent))
+	if (!debugfs_initialized() || !debugfs_enabled)
+		return ERR_PTR(-ENODEV);
+
+	if (IS_ERR_OR_NULL(name) || IS_ERR(parent))
 		return NULL;
 
 	if (!parent)
@@ -369,7 +372,7 @@ static struct dentry *debugfs_start_creating(const char *name,
 		return ERR_PTR(-EPERM);
 
 	if (!debugfs_initialized())
-		return ERR_PTR(-ENOENT);
+		return ERR_PTR(-ENODEV);
 
 	pr_debug("creating file '%s'\n", name);
 
@@ -562,6 +565,9 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_size);
  * If debugfs is not enabled in the kernel, the value -%ENODEV will be
  * returned.
  *
+ * If debugfs is enabled in the kernel but disabled by configuration,
+ * the value -%EPERM will be returned.
+ *
  * NOTE: it's expected that most callers should _ignore_ the errors returned
  * by this function. Other debugfs functions handle the fact that the "dentry"
  * passed to them could be an error and they don't crash in that case.
@@ -659,6 +665,9 @@ EXPORT_SYMBOL(debugfs_create_automount);
  *
  * If debugfs is not enabled in the kernel, the value -%ENODEV will be
  * returned.
+ *
+ * If debugfs is enabled in the kernel but disabled by configuration,
+ * the value -%EPERM will be returned.
  */
 struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 				      const char *target)
-- 
2.53.0

