Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.137.202.133
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793079480;
	b=bE53LArhPkTbAWXyRjxxJVZj8mBR/orWKyNJeeXTelTnXUKnePhm4eDDrYa3fWCx5pIs
	 O4QOBRectPoUtqnBb1eBIpTdvfKL//dtMta9HTfloLwrMBuJC3kaBwDmzsEtu4hv9wUul
	 MwDe5KDmW76mPz8N8h0B+nN0Dk4aIIdQal8RhZW3fRQxjSlQtVQHGELRezoxlelA06rwD
	 Qrd1oVe1x0GmQxmDQI2GntAluGBF/SQJJQFSM/NJvsolO7c5jRw4QlIWhxteDOsa7Vfqh
	 Cq2IdC/zMLeV2mSEZZxoU04s3JGz5gXEMeMpmY0HbCRMRK6GiQk4ugobj7HknwRuQrA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793079480;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=Nv/lnxPdAL8f7ZwBKC1/UYCMAS+CZk6z6IbxYlcIxfY=;
	b=oFK7iDkIqzkYKDtQ69nWTyF8+d5dgiZBuHBY1Vncgnn5Pf+1NK09vIZRrP2f9pvBQ0ek
	 aMRVSiFpc0yo+DabdSKFK6XsSBR5Lt51CvUDSc/AILkcc7eadi4Y2FnQQeYG7CzMSw8AS
	 fAcLMHkx9Hgsfwcq4msedr91v8dJGMP0cLDTlPICs9Utt/HAHJ4Aeeep1Dh9Hpq4qgXS2
	 gpaJgPmuRLSbl2f7t9gX9/eKBy5wwlli6PgmNH8Fo535A/JmPtw8oL4NWEsiUTUqEzEA7
	 yNclSLKVzXF2No6yKCG9YPPN9x+3TQSAce8JM/IczG8QDf9JBKv9ua9ZPnUwZ7nUEjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=infradead.org;
	spf=pass smtp.mailfrom=infradead.org;
	dkim=pass header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b="GAu/fsRT";
	arc=none smtp.remote-ip=198.137.202.133
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40A5E606A31A;
	Tue, 27 Oct 2026 05:37:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40A5E606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GAu/fsRT
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=Nv/lnxPdAL8f7ZwBKC1/UYCMAS+CZk6z6IbxYlcIxfY=; b=GAu/fsRTbB1eellz5tR+Gn9s5k
	xIiH14IW4fePVO1I9BdkXk3t4tX7Yvmw15sOldvBV11QOqNT1CqBbxOhoMK6z8RLii+hKwEyqzkfE
	9iXRqjQzJrC7IciBg3r4S/ghzy7Mwzk1oZLVvTQLya8+zPJafGq7xS7bpUK78yskQunzjrDxgsXFJ
	UyTfFaNJa8C8YIFeZZn3yeQrD18OTClP1ti6bTVxpoC+Umtl63rl8FUNxTAvBUVS52PlJdENw3D0C
	qLyTsvLC9Fcr8UZNPF6rw0IFa+aCykgGlfsbET846E4Uk6NSgKQkOV4dF/qZ21jIqGuj2LRLdDBZz
	trTI8prw==;
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLZsi-00000003moe-0ENF;
	Tue, 27 Oct 2026 05:37:56 +0000
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
Subject: [PATCH v2] debugfs: clarify return values when disabled
Date: Mon, 26 Oct 2026 22:37:54 -0700
Message-ID: <20261027053754.1339833-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.56.0
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

debugfs can be disabled at kconfig time (# CONFIG_DEBUG_FS is not set)
or by using "debugfs=off" on the kernel command line.

The return values for some debugfs functions in these 2 cases can be
different. Describe those differences.

No code changes.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
---
v2: remove one old leftover comment (Danilo)
    correct return values of some exported functions when debugfs
      is disabled on the command line (Danilo)
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
 fs/debugfs/inode.c                              |   24 +++++++++-----
 include/linux/debugfs.h                         |    5 +-
 5 files changed, 47 insertions(+), 15 deletions(-)

--- linux-next-20261026.orig/Documentation/admin-guide/kernel-parameters.txt
+++ linux-next-20261026/Documentation/admin-guide/kernel-parameters.txt
@@ -1205,7 +1205,8 @@ Kernel parameters
 			        get a -EPERM as result when trying to register files
 				or directories within debugfs.
 				This is equivalent of the runtime functionality if
-				debugfs was not enabled in the kernel at all.
+				debugfs was not enabled in the kernel at all,
+				except that the latter returns -ENODEV.
 			Default value is set in build-time with a kernel configuration.
 
 	debugpat	[X86] Enable PAT debugging
--- linux-next-20261026.orig/include/linux/debugfs.h
+++ linux-next-20261026/include/linux/debugfs.h
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
--- linux-next-20261026.orig/Documentation/filesystems/debugfs.rst
+++ linux-next-20261026/Documentation/filesystems/debugfs.rst
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
--- linux-next-20261026.orig/fs/debugfs/file.c
+++ linux-next-20261026/fs/debugfs/file.c
@@ -1144,8 +1144,10 @@ static const struct file_operations fops
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
--- linux-next-20261026.orig/fs/debugfs/inode.c
+++ linux-next-20261026/fs/debugfs/inode.c
@@ -339,8 +339,10 @@ MODULE_ALIAS_FS("debugfs");
  * doesn't exist or an error occurs, %NULL will be returned.  The returned
  * dentry must be passed to dput() when it is no longer needed.
  *
- * If debugfs is not enabled in the kernel, the value -%ENODEV will be
- * returned.
+ * If debugfs is not enabled in the kernel build, the value ERR_PTR(-ENODEV)
+ * will be returned. If debugfs is enabled in the kernel build but is disabled
+ * by using "debugfs=off" on the kernel command line, the value %NULL
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
@@ -818,8 +824,10 @@ EXPORT_SYMBOL_GPL(debugfs_lookup_and_rem
  *
  * This function will return 0 on success and -E... on failure.
  *
- * If debugfs is not enabled in the kernel, the value -%ENODEV will be
- * returned.
+ * If debugfs is not enabled in the kernel build, the value %-ENODEV
+ * will be returned. If debugfs is enabled in the kernel build but is disabled
+ * by using "debugfs=off" on the kernel command line, the value %0
+ * will be returned.
  */
 int __printf(2, 3) debugfs_change_name(struct dentry *dentry, const char *fmt, ...)
 {
