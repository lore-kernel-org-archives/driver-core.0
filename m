Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BADB8319852;
	Wed, 18 Mar 2026 19:54:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773863656; cv=none; b=gIz6khSHLy02eWV5slFv9waG7vUb7xQM4zF4ySyupgnMopI5dDeM+W4HDw4Mhj5QoufPkBOEmTS8dydNFN2XPklMZ/3cnWeSMROJCZ2ct6Bg0pM3i67hzvHHRfxM8kdSkbJBS6acbMcp4LXyn5jXvtXh2tk0haxh/sI7PjnNroE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773863656; c=relaxed/simple;
	bh=VFYm78bHcffsCZuS77OCf78K71eXo2oflMbNCecz/I0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=pjz+YFea61RwDVNKqxMUWa0lt3ZBCrI7csbtxPxjzIulO4kL8F0fiVTgYd6Kc3NPm0kaTNwWf5RHx7gREN04JLLA5uj/YnEtxQhllTdK6QzwGnA3oN3XhlHk3+uCJ2vkCeyd8Ce4UCtFjfcTtNcan3wBPm76D62SGEtS0qPLQ90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pxK9DWFK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pxK9DWFK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E85DC19421;
	Wed, 18 Mar 2026 19:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773863656;
	bh=VFYm78bHcffsCZuS77OCf78K71eXo2oflMbNCecz/I0=;
	h=From:Date:Subject:To:Cc:From;
	b=pxK9DWFK8J0OWL9TDADWgE/3jXA3Ggr9seih7CmDQkHcNIbaye6za14ULJok3WqtT
	 qoXxmfLKMTTOyC4UIn1YKfU/ipEc362bMkpT7r0oGQB1vGwrNlrxJxyH4tRb2hRKsT
	 nhJ0mUytty5mSFOhqBINk5bk6qtomNMSLNbrl8lM28Km2D6HrO2JOfolKh/FFy6dvG
	 qPY/1zKir9H/GVqTmTfAWn1NFy9B0S0X59yKphFyEFbeImn3Xec1zwgGfPcXk5gb4t
	 p3AWYs+r0omYVgMXTW1OldCSgB7iEbDEMvx8G/fPCvdkc4v8wZFlz5ttYU9WRPRXGs
	 hFgyIK3WDR+kg==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Mar 2026 15:54:02 -0400
Subject: [PATCH v3] firmware_loader: allow firmware_class.path to take
 multiple paths
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fw-path-v3-1-a701a08bc025@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WMyw6CMBBFf4XM2ppOebWu/A/josAUGg0lLakaw
 r9bSDRx4fLc3HMWCOQtBThlC3iKNlg3JsgPGbSDHntitksMgouK51gz82CTngemuSranItS6RL
 Se/Jk7HMvXa6JBxtm5197OOK2fhry24jIkNVSFp1qTIXSnG/kR7ofne9hi0TxRxRJlBp5RY1Ca
 oofcV3XN1qKGovYAAAA
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=8788; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=VFYm78bHcffsCZuS77OCf78K71eXo2oflMbNCecz/I0=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpuwLhnWdALnCQu+catL1L4cK6IxSI0+ZuxaDq2
 uef/7PZ4XCJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCabsC4QAKCRAADmhBGVaC
 FYvoEAC2QwC+Dpd+5BDuq0W4FO20C+b3ky/uH1PWymrM4TVLQiZNMPwxMGxjI0GUDrwZs4+SJdQ
 /vawV6AV/Iks+8PSS8Yil8b1Uxotsx74+3D3fUsHvPB9hN3TdDL9UAOimnFDKj4qeFnRy8/xcp5
 ZLZzCeXOFrWjRckJFravWyH1lXeOf5Wq7o1+VA2/wXxhCj+vGNl5++O0qoQEs8fAsZA4JRSSvR9
 NfcI+e4Sz3j02th8TJOym1uUkE7gApP+ySUFTMD0W3RBRp9v6OwEWDJuv1ex+pg2eJRQmQEiS4m
 pWf4Cj6R4sR5nlJ2i+JIJ8zWsAuoTl5Es7v/p4NXTLa4e52h+4+q74ffWlMZQxbXtRyMyBRbfIW
 P9IjieW2IA2+ArOQibzLK69NXk9IeLUxyKLDACngibuHiAQ6ezvsmX1oSiD4HDG1x/xR9FrIwpm
 hVdDQjiN3NjmyQolOy6oInTmsVBRFQ819Gwwr4pKB3oupvWbeiQNdrHWtA2cD9U3ARise7UGch3
 9mbqU2Q5JCiC6DPXuuT1nqd9y5IO1hvBYfeYI9VwXBjdX8kYJHxV4gc2L3z17YdQ80a9RnTe45B
 97SDoQQFM4tC+rvzcDjFNxEmssrQzftk6RxDZXRSZWPEyHUMk5htLRi6QSkPZLDgmfjGq8VUile
 xa2L3n9fSvzGyUA==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Refactor fw_get_filesystem_firmware() by extracting the per-path
firmware loading logic into a new fw_try_firmware_path() helper.

Use this helper to parse fw_path_para for ':'-separated paths,
trying each one before falling through to the default firmware
search paths. This allows users to specify multiple custom firmware
directories via firmware_class.path, e.g.:

  firmware_class.path=/custom/path1:/custom/path2

A backslash can be used as an escape character, allowing a literal
':' ("\:") or literal '\' ("\\") to be embedded in a pathname.

Suggested-by: Michal Grzedzicki <mge@meta.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
Michal privately pointed out that this didn't have provision to handle
an embedded ':' in the filename. This version adds support for escaping
':' and '\' in the filename via backslash characters.
---
Changes in v3:
- Allow '\' to escape a literal ':' or '\' in the string
- Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91eb4@kernel.org

Changes in v2:
- switch to using ':' as path delimiter
- Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org
---
 drivers/base/firmware_loader/main.c | 209 +++++++++++++++++++++++-------------
 1 file changed, 133 insertions(+), 76 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23be563bd55f25474ceff2153ddd667..7f35100ae1a7575deed57bdf9b5823f87ce5d115 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -470,7 +470,6 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
 /* direct firmware loading support */
 static char fw_path_para[256];
 static const char * const fw_path[] = {
-	fw_path_para,
 	"/lib/firmware/updates/" UTS_RELEASE,
 	"/lib/firmware/updates",
 	"/lib/firmware/" UTS_RELEASE,
@@ -480,10 +479,83 @@ static const char * const fw_path[] = {
 /*
  * Typical usage is that passing 'firmware_class.path=$CUSTOMIZED_PATH'
  * from kernel command line because firmware_class is generally built in
- * kernel instead of module.
+ * kernel instead of module. Multiple paths can be separated by ':'.
  */
 module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
-MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path");
+MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path, multiple paths can be separated by ':' (use '\\:' for literal ':', '\\\\' for literal '\\')");
+
+static int
+fw_try_firmware_path(struct device *device, struct fw_priv *fw_priv,
+		     const char *suffix,
+		     int (*decompress)(struct device *dev,
+				       struct fw_priv *fw_priv,
+				       size_t in_size,
+				       const void *in_buffer),
+		     const char *dir, int dirlen,
+		     char *path, void **bufp, size_t msize)
+{
+	size_t file_size = 0;
+	size_t *file_size_ptr = NULL;
+	size_t size;
+	int len, rc;
+
+	len = snprintf(path, PATH_MAX, "%.*s/%s%s",
+		       dirlen, dir, fw_priv->fw_name, suffix);
+	if (len >= PATH_MAX)
+		return -ENAMETOOLONG;
+
+	fw_priv->size = 0;
+
+	/*
+	 * The total file size is only examined when doing a partial
+	 * read; the "full read" case needs to fail if the whole
+	 * firmware was not completely loaded.
+	 */
+	if ((fw_priv->opt_flags & FW_OPT_PARTIAL) && *bufp)
+		file_size_ptr = &file_size;
+
+	/* load firmware files from the mount namespace of init */
+	rc = kernel_read_file_from_path_initns(path, fw_priv->offset,
+					       bufp, msize,
+					       file_size_ptr,
+					       READING_FIRMWARE);
+	if (rc < 0) {
+		if (!(fw_priv->opt_flags & FW_OPT_NO_WARN)) {
+			if (rc != -ENOENT)
+				dev_warn(device,
+					 "loading %s failed with error %d\n",
+					 path, rc);
+			else
+				dev_dbg(device,
+					"loading %s failed for no such file or directory.\n",
+					path);
+		}
+		return rc;
+	}
+	size = rc;
+
+	dev_dbg(device, "Loading firmware from %s\n", path);
+	if (decompress) {
+		dev_dbg(device, "f/w decompressing %s\n",
+			fw_priv->fw_name);
+		rc = decompress(device, fw_priv, size, *bufp);
+		/* discard the superfluous original content */
+		vfree(*bufp);
+		*bufp = NULL;
+		if (rc) {
+			fw_free_paged_buf(fw_priv);
+			return rc;
+		}
+	} else {
+		dev_dbg(device, "direct-loading %s\n",
+			fw_priv->fw_name);
+		if (!fw_priv->data)
+			fw_priv->data = *bufp;
+		fw_priv->size = size;
+	}
+	fw_state_done(fw_priv);
+	return 0;
+}
 
 static int
 fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
@@ -493,10 +565,9 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
 					     size_t in_size,
 					     const void *in_buffer))
 {
-	size_t size;
-	int i, len, maxlen = 0;
+	int i;
 	int rc = -ENOENT;
-	char *path, *nt = NULL;
+	char *path;
 	size_t msize = INT_MAX;
 	void *buffer = NULL;
 
@@ -511,83 +582,69 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
 		return -ENOMEM;
 
 	wait_for_initramfs();
-	for (i = 0; i < ARRAY_SIZE(fw_path); i++) {
-		size_t file_size = 0;
-		size_t *file_size_ptr = NULL;
-
-		/* skip the unset customized path */
-		if (!fw_path[i][0])
-			continue;
-
-		/* strip off \n from customized path */
-		maxlen = strlen(fw_path[i]);
-		if (i == 0) {
-			nt = strchr(fw_path[i], '\n');
-			if (nt)
-				maxlen = nt - fw_path[i];
-		}
 
-		len = snprintf(path, PATH_MAX, "%.*s/%s%s",
-			       maxlen, fw_path[i],
-			       fw_priv->fw_name, suffix);
-		if (len >= PATH_MAX) {
-			rc = -ENAMETOOLONG;
-			break;
-		}
+	/* Try each ':'-separated path in fw_path_para first */
+	if (fw_path_para[0]) {
+		const char *start = fw_path_para;
+		const char *p;
+		char *dir;
 
-		fw_priv->size = 0;
+		dir = __getname();
+		if (!dir) {
+			rc = -ENOMEM;
+			goto done;
+		}
 
-		/*
-		 * The total file size is only examined when doing a partial
-		 * read; the "full read" case needs to fail if the whole
-		 * firmware was not completely loaded.
-		 */
-		if ((fw_priv->opt_flags & FW_OPT_PARTIAL) && buffer)
-			file_size_ptr = &file_size;
-
-		/* load firmware files from the mount namespace of init */
-		rc = kernel_read_file_from_path_initns(path, fw_priv->offset,
-						       &buffer, msize,
-						       file_size_ptr,
-						       READING_FIRMWARE);
-		if (rc < 0) {
-			if (!(fw_priv->opt_flags & FW_OPT_NO_WARN)) {
-				if (rc != -ENOENT)
-					dev_warn(device,
-						 "loading %s failed with error %d\n",
-						 path, rc);
-				else
-					dev_dbg(device,
-						"loading %s failed for no such file or directory.\n",
-						path);
+		while (*start) {
+			int dirlen = 0;
+
+			/*
+			 * Parse the next path component. A backslash
+			 * escapes the following character, allowing
+			 * literal ':' ('\:') and literal '\' ('\\')
+			 * to be embedded in a path.
+			 */
+			for (p = start; *p && *p != ':'; p++) {
+				if (p[0] == '\\' && (p[1] == ':' || p[1] == '\\'))
+					p++;
+				if (dirlen < PATH_MAX - 1)
+					dir[dirlen++] = *p;
 			}
-			continue;
-		}
-		size = rc;
-		rc = 0;
-
-		dev_dbg(device, "Loading firmware from %s\n", path);
-		if (decompress) {
-			dev_dbg(device, "f/w decompressing %s\n",
-				fw_priv->fw_name);
-			rc = decompress(device, fw_priv, size, buffer);
-			/* discard the superfluous original content */
-			vfree(buffer);
-			buffer = NULL;
-			if (rc) {
-				fw_free_paged_buf(fw_priv);
-				continue;
+
+			/* strip trailing newline */
+			if (dirlen > 0 && dir[dirlen - 1] == '\n')
+				dirlen--;
+
+			if (dirlen > 0) {
+				dir[dirlen] = '\0';
+				rc = fw_try_firmware_path(device, fw_priv,
+							  suffix, decompress,
+							  dir, dirlen,
+							  path, &buffer,
+							  msize);
+				if (!rc) {
+					__putname(dir);
+					goto done;
+				}
 			}
-		} else {
-			dev_dbg(device, "direct-loading %s\n",
-				fw_priv->fw_name);
-			if (!fw_priv->data)
-				fw_priv->data = buffer;
-			fw_priv->size = size;
+
+			if (!*p)
+				break;
+			start = p + 1;
 		}
-		fw_state_done(fw_priv);
-		break;
+		__putname(dir);
 	}
+
+	/* Try default firmware paths */
+	for (i = 0; i < ARRAY_SIZE(fw_path); i++) {
+		rc = fw_try_firmware_path(device, fw_priv, suffix, decompress,
+					  fw_path[i], strlen(fw_path[i]),
+					  path, &buffer, msize);
+		if (!rc)
+			break;
+	}
+
+done:
 	__putname(path);
 
 	return rc;

---
base-commit: 2d1373e4246da3b58e1df058374ed6b101804e07
change-id: 20260317-fw-path-a094c30259a5

Best regards,
-- 
Jeff Layton <jlayton@kernel.org>

