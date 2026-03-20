Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BCD282F1F;
	Fri, 20 Mar 2026 15:32:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774020761; cv=none; b=TQKM8QctW3Fp8xfQ0wETRQJP9X8LbHf37rZMLRKpf6R7pHlaz2Md5Qd7lZ2TZWlrE3qHf/Jkl3sKo1zYDw8dbHdhsD0aFV51ACeDnj1zPR3+u/QdfZRxiUQ/P9675CTb+UN+nmylDtzJy66KpKrVJFf4exSzvaXtJJeqvI09mKM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774020761; c=relaxed/simple;
	bh=JQFqRpWHzUfYayHmC0f4Lwr06zQPEuXP1xsc57AEVTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=O9g5DsgyFue/mA1jKcEK6fJb2u+UkOu0LPNMyXgGf24FKXzvDw7+Z2gY+G40kwdL/+D2uisyLVuV9nIXO6o6IxRFEj/S/1a0WJ8c67MUQ+Bznpo3SlXejRVVN5+Q9m1+x8/tTNfAFVxYvozopdBs29c9UHsXDoSiwfiUWNmnrvk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=geCdY4ZG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="geCdY4ZG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D62B1C4CEF7;
	Fri, 20 Mar 2026 15:32:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774020760;
	bh=JQFqRpWHzUfYayHmC0f4Lwr06zQPEuXP1xsc57AEVTo=;
	h=From:Date:Subject:To:Cc:From;
	b=geCdY4ZG+bXjGfoz6zeztK1KOm9+oLAnkjmNEdrjWPqdZR9Pu0ueofN7miDHQ4rH/
	 IP1YfZWtvJTT0cBChVUXZD+idMz7u/W/NtXGgcnwNlO43CEyjRq6DoNqyRImlvrrnY
	 tOqlZ+GyEXfOlkEEVU58SDVLqi+jQni4BQnSE4VQpyL9HIDEjpbTOwj3VZBtOQYCsP
	 RHc4zt+oa6BHKnYRszKNnNYNBGNNEWfyDNkmAGWG0DT/pbFIA677Urg9p2Pu0SZE7V
	 LF3i+ugGUHuJcw2VVHI3P9ZCA11bPQLbWhrIW6Aoq++f9ImfYghviHYlNFx7KNFm9b
	 nkqAGhPNjVoNQ==
From: Jeff Layton <jlayton@kernel.org>
Date: Fri, 20 Mar 2026 11:32:29 -0400
Subject: [PATCH v4] firmware_loader: add search= module option for
 multi-path firmware lookup
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260320-fw-path-v4-1-7547e2f0dc64@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/3WO0QqCMBSGX0V23WJnmzq76j2ii03PdBQqm6xCf
 PemUBDh5fdzvo8zk4DeYSCnbCYeowtu6BPIQ0bqTvctUtckJpzxggkoqX3QUU8d1ayStWA8r3R
 O0vXo0brnVrpcE3cuTIN/beEI6/ppqG8jAgVaKiWbytgClD3f0Pd4Pw6+JWsk8h2RJ1FpYAWaC
 tDIP1HsiCKJumSgmTJ1+v5HXJblDSOVWhURAQAA
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=9267; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=JQFqRpWHzUfYayHmC0f4Lwr06zQPEuXP1xsc57AEVTo=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpvWiSZgna8DxOmjH7zPSrdR2lqZwLj3hYH4fJd
 hB3zHL/9VWJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCab1okgAKCRAADmhBGVaC
 FVJID/9iWxObOzuN5HRhSsr417YZtNI2gBBujBGGbsUsHtU9a15xlVNlIXKvkcZ7oZFB6dvW1p7
 imU9fT34zOWlxjtpyuzyieu2goJ9kHEhIBZEloqJGUbyLDkd7CcpM9ZZIHsogBcs98iFZ4c8qxh
 lhFfWCFh12UtpwWIdUVpuUKBJ8oqIAghoBioPZ2no+kGXj/cp+2IZZACSRH3UeUdBdKp11K56Et
 mBp66Ydj2rkMrlknPQmQ3tp+X0IdN4muu3KNsBGCkHra5mJ7CcSI58YrGT2gggRrnWo69xhwaG/
 iDbbxHtoWWTJbgX1m4l0c0tzmzd1aSXmnoDYlJIp7gGcJFTZzqe1BGf9BIo6NzjM7SeRDeOYVcq
 6H8sh0w8xBPWXTtapClAW05b2XR3amYdz5dJoA8FGp+gMOZGJPUMHNb5yAAFKRdFWrNwFAEVDGd
 ja4Z/Ho5g1RYLljaxLvrwkdLXqXSS+6kBAApwe6k05cKau/iBtcp/zaE2UNd0kK35rkP9WXX3z0
 h9quQMtIbhbFTCM6Nm/4YxKXNKc5d+Jh3HNps2FajfUSmuqLeGvAu2E26wu07yfhUUtof/4khxY
 Cu3Rlx6MlnSPPi19zG/BW7XcIQsx2bxStD5B1XMekcIaqX4oVHjOHCkZ42cRQRGQPFXhg4cEpN6
 34D91jIU+b+zghQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Refactor fw_get_filesystem_firmware() by extracting the per-path
firmware loading logic into a new fw_try_firmware_path() helper.

Add a new firmware_class.search= module option that accepts a
':'-separated list of firmware search directories. The firmware
lookup order is:

  1. firmware_class.path= (single legacy path)
  2. firmware_class.search= (colon-separated paths)
  3. Built-in default paths (/lib/firmware/updates/..., /lib/firmware)

A backslash can be used as an escape character, allowing a literal
':' ('\:') or literal '\' ('\\') to be embedded in a pathname.

Example:

  firmware_class.search=/custom/path1:/custom/path2

Suggested-by: Michal Grzedzicki <mge@meta.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
This version adds a new module option called "search=" to specify an
(escapable) search path. The search= path is tried after the original
(unescaped) path= string, but before the hardcoded search path.
---
Changes in v4:
- Move search path to new search= option that is tried after path=
- Link to v3: https://lore.kernel.org/r/20260318-fw-path-v3-1-a701a08bc025@kernel.org

Changes in v3:
- Allow '\' to escape a literal ':' or '\' in the string
- Link to v2: https://lore.kernel.org/r/20260318-fw-path-v2-1-8a106eb91eb4@kernel.org

Changes in v2:
- switch to using ':' as path delimiter
- Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org
---
 drivers/base/firmware_loader/main.c | 224 ++++++++++++++++++++++++------------
 1 file changed, 150 insertions(+), 74 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23be563bd55f25474ceff2153ddd667..0f58d996d3807a1f57dc924adbe657360fdfac1e 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -469,8 +469,8 @@ static int fw_decompress_xz(struct device *dev, struct fw_priv *fw_priv,
 
 /* direct firmware loading support */
 static char fw_path_para[256];
+static char fw_search_para[256];
 static const char * const fw_path[] = {
-	fw_path_para,
 	"/lib/firmware/updates/" UTS_RELEASE,
 	"/lib/firmware/updates",
 	"/lib/firmware/" UTS_RELEASE,
@@ -485,6 +485,82 @@ static const char * const fw_path[] = {
 module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
 MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path");
 
+module_param_string(search, fw_search_para, sizeof(fw_search_para), 0644);
+MODULE_PARM_DESC(search, "colon-separated list of firmware search paths, tried after path= (use '\\:' for literal ':', '\\\\' for literal '\\')");
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
+
 static int
 fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
 			   const char *suffix,
@@ -493,10 +569,9 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
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
 
@@ -511,83 +586,84 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
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
+	/* Try the single customized path first */
+	if (fw_path_para[0]) {
+		int dirlen = strlen(fw_path_para);
 
-		fw_priv->size = 0;
+		/* strip trailing newline */
+		if (fw_path_para[dirlen - 1] == '\n')
+			dirlen--;
 
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
-			}
-			continue;
+		rc = fw_try_firmware_path(device, fw_priv, suffix, decompress,
+					  fw_path_para, dirlen,
+					  path, &buffer, msize);
+		if (!rc)
+			goto done;
+	}
+
+	/* Try each ':'-separated path in fw_search_para */
+	if (fw_search_para[0]) {
+		const char *start = fw_search_para;
+		const char *p;
+		char *dir;
+
+		dir = __getname();
+		if (!dir) {
+			rc = -ENOMEM;
+			goto done;
 		}
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
-		} else {
-			dev_dbg(device, "direct-loading %s\n",
-				fw_priv->fw_name);
-			if (!fw_priv->data)
-				fw_priv->data = buffer;
-			fw_priv->size = size;
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
+			}
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

