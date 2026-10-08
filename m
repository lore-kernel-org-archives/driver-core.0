Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C35D335AC14;
	Thu,  8 Oct 2026 17:15:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791479751; cv=none; b=m3E1VTbvh6MCTj0WgbrHdlUGPCZHOuNa5CQe1JTcBJGel/WxqGCNE1IvaxtIQa+Yff+8hCoAzalh4mQ0dzFX9CJ7CqGaXHWnzdQzp3IjzzOtCEGJQfwnz6ozXjwNKf3xkEOkwBlQUQMCbFhfpltYDZ0+QTYMDzXkiiYyRzvkhrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791479751; c=relaxed/simple;
	bh=xb2r/IkyqgT6gGpF/1a8pwyC7byCS/7+A2uLid+X95c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GDjkuNKC5uyq3kfYkvi1C1pdXoJopuOM2eK3YEGdk8yfI8dc/C5sZZqEvqaItLFOjL6dc5BCQPN6BIg3EFTDwFijuJ1s/YJbzrz42hp96PfP4RVhL7JvJ2hCp+6a1qcYym+VCqqRMGVMvDOsXtDmOZvJaYszGxCLBPnxujh6XT0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=gMs6p2vD; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="gMs6p2vD"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=2QcLlJa+83HOzijTUir6cj9m/GzKnWBVN1ni1/Xx+BQ=; b=gMs6p2vDbYMwLKQOs7hLWn4pkT
	fkrKmivJa5mcv78AXyzFEGiN10wPa4NIAify3GLGyrN0fDVAjtfCrUXIxjSvA53eFwM+BTjrziLUZ
	eQJC4KYIkcAz/y0tR1FWEiKQ70nPACgPVyuQkvTYC9oaqH79zi3HOxHkVx/U6idHs3FLaCaraTBsI
	tKqMq7tmOUiLhAy1F8jU9Uz0c4KB02O/sQDJQMY2w2564evz+D4SP4FykqcGEOCUAuWnhvrPcyA3k
	uBvTDobBEmL91Yqbz+q3IEDBaUoUYv2VTYL72Z2Cal+xJAv7UGOVGTy8KC3MVe5hgCxpt6HSWDbqo
	2gP9XW0g==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xErie-00000004lVR-0PPw;
	Thu, 08 Oct 2026 17:15:48 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-doc@vger.kernel.org
Subject: [PATCH] debugfs: clarify return values when disabled
Date: Thu,  8 Oct 2026 10:15:47 -0700
Message-ID: <20261008171547.3084466-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

debugfs can be disabled at kconfig time (# CONFIG_DEBUG_FS is not set)
or by using "debugfs=off" on the kernel command line.

The return values for some debugfs functions in these 2 cases can be
different. Describe those differences.

No code changes.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v1: drop RFC tag in Subject line

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-doc@vger.kernel.org

 Documentation/admin-guide/kernel-parameters.txt |    3 +
 Documentation/filesystems/debugfs.rst           |   24 ++++++++++++--
 fs/debugfs/file.c                               |    6 ++-
 fs/debugfs/inode.c                              |   22 +++++++++---
 include/linux/debugfs.h                         |    5 +-
 5 files changed, 47 insertions(+), 13 deletions(-)

--- linux-next-20260918.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20260918/Documentation/admin-guide/kernel-parameters.txt
@@ -1201,7 +1201,8 @@ Kernel parameters
 			        get a -EPERM as result when trying to register files
 				or directories within debugfs.
 				This is equivalent of the runtime functionality if
-				debugfs was not enabled in the kernel at all.
+				debugfs was not enabled in the kernel at all,
+				except that the latter returns -ENODEV.
 			Default value is set in build-time with a kernel configuration.
 
 	debugpat	[X86] Enable PAT debugging
--- linux-next-20260918.orig/include/linux/debugfs.h
+++ linux-next-20260918/include/linux/debugfs.h
@@ -110,8 +110,9 @@ struct dentry *debugfs_create_file_short
  * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value -%ENODEV will be
- * returned.
+ * If debugfs is not enabled in the kernel build, the value -%ENODEV will be
+ * returned. If debugfs is enabled in the kernel build but is disabled
+ * on the kernel command line, the value -%EPERM will be returned.
  *
  * If fops points to a struct debugfs_short_fops, then simple_open() will be
  * used for the open, and only read/write/llseek are supported and are proxied,
--- linux-next-20260918.orig/Documentation/filesystems/debugfs.rst
+++ linux-next-20260918/Documentation/filesystems/debugfs.rst
@@ -41,7 +41,17 @@ dentry pointer which can be used to crea
 clean it up at the end).  An ERR_PTR(-ERROR) return value indicates that
 something went wrong.  If ERR_PTR(-ENODEV) is returned, that is an
 indication that the kernel has been built without debugfs support and none
-of the functions described below will work.
+of the functions described below will work. If the kernel was built with
+debugfs support but it has been disabled by using "debugfs=off" on the
+kernel command line, ERR_PTR(-EPERM) is returned.
+
+.. note::
+
+  It's expected that most callers should _ignore_ the errors returned
+  by this function. Other debugfs functions handle the fact that the "dentry"
+  passed to them could be an error and they don't crash in that case.
+  Drivers should generally work fine even if debugfs fails to init or is
+  disabled.
 
 The most general way to create a file within a debugfs directory is with::
 
@@ -57,7 +67,17 @@ implement the file's behavior.  At a min
 operations should be provided; others can be included as needed.  Again,
 the return value will be a dentry pointer to the created file,
 ERR_PTR(-ERROR) on error, or ERR_PTR(-ENODEV) if debugfs support is
-missing.
+missing.  If the kernel was built with debugfs support but it has been
+disabled by using "debugfs=off" on the kernel command line, ERR_PTR(-EPERM)
+is returned.
+
+.. note::
+
+  It's expected that most callers should _ignore_ the errors returned
+  by this function. Other debugfs functions handle the fact that the "dentry"
+  passed to them could be an error and they don't crash in that case.
+  Drivers should generally work fine even if debugfs fails to init or is
+  disabled.
 
 Create a file with an initial size, the following function can be used
 instead::
--- linux-next-20260918.orig/fs/debugfs/file.c
+++ linux-next-20260918/fs/debugfs/file.c
@@ -1205,8 +1205,10 @@ static const struct file_operations fops
  * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value ERR_PTR(-ENODEV) will
- * be returned.
+ * If debugfs is not enabled in the kernel build, the value ERR_PTR(-ENODEV)
+ * will be returned. If debugfs is enabled in the kernel build but is disabled
+ * by using "debugfs=off" on the kernel command line, the value ERR_PTR(-EPERM)
+ * will be returned.
  */
 struct dentry *debugfs_create_blob(const char *name, umode_t mode,
 				   struct dentry *parent,
--- linux-next-20260918.orig/fs/debugfs/inode.c
+++ linux-next-20260918/fs/debugfs/inode.c
@@ -339,8 +339,10 @@ MODULE_ALIAS_FS("debugfs");
  * doesn't exist or an error occurs, %NULL will be returned.  The returned
  * dentry must be passed to dput() when it is no longer needed.
  *
- * If debugfs is not enabled in the kernel, the value -%ENODEV will be
- * returned.
+ * If debugfs is not enabled in the kernel build, the value ERR_PTR(-ENODEV)
+ * will be returned. If debugfs is enabled in the kernel build but is disabled
+ * by using "debugfs=off" on the kernel command line, the value ERR_PTR(-EPERM)
+ * will be returned.
  */
 struct dentry *debugfs_lookup(const char *name, struct dentry *parent)
 {
@@ -562,8 +564,10 @@ EXPORT_SYMBOL_GPL(debugfs_create_file_si
  * you are responsible here.)  If an error occurs, ERR_PTR(-ERROR) will be
  * returned.
  *
- * If debugfs is not enabled in the kernel, the value -%ENODEV will be
- * returned.
+ * If debugfs is not enabled in the kernel build, the value ERR_PTR(-ENODEV)
+ * will be returned. If debugfs is enabled in the kernel build but is disabled
+ * by using "debugfs=off" on the kernel command line, the value ERR_PTR(-EPERM)
+ * will be returned.
  *
  * NOTE: it's expected that most callers should _ignore_ the errors returned
  * by this function. Other debugfs functions handle the fact that the "dentry"
@@ -660,8 +664,10 @@ EXPORT_SYMBOL(debugfs_create_automount);
  * unloaded, you are responsible here.)  If an error occurs, ERR_PTR(-ERROR)
  * will be returned.
  *
- * If debugfs is not enabled in the kernel, the value -%ENODEV will be
- * returned.
+ * If debugfs is not enabled in the kernel build, the value ERR_PTR(-ENODEV)
+ * will be returned. If debugfs is enabled in the kernel build but is disabled
+ * by using "debugfs=off" on the kernel command line, the value ERR_PTR(-EPERM)
+ * will be returned.
  */
 struct dentry *debugfs_create_symlink(const char *name, struct dentry *parent,
 				      const char *target)
@@ -820,6 +826,10 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_rem
  *
  * If debugfs is not enabled in the kernel, the value -%ENODEV will be
  * returned.
+ * If debugfs is not enabled in the kernel build, the value %-ENODEV
+ * will be returned. If debugfs is enabled in the kernel build but is disabled
+ * by using "debugfs=off" on the kernel command line, the value %-EPERM
+ * will be returned.
  */
 int __printf(2, 3) debugfs_change_name(struct dentry *dentry, const char *fmt, ...)
 {
