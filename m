Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A2F53DA7CF;
	Wed, 18 Mar 2026 14:15:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773843342; cv=none; b=oG9vCi6V5yTEZrZW/TijmRYI/2HeI6SCAzZlMUFvrKiYiGRTUo8AymtbSdlgj+oIP8N5hJXm6bbuBF/SJEA/vvqrJp591GiuoFfVKINkHF4Ui3m9bvKcSq+u4xGwWrnH1GrXv/7TDB+HhhoVAyjGomHFIKK/LSnxoKXxYpTHAo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773843342; c=relaxed/simple;
	bh=BO6ejAZkZfQGZ+M6kNjRQqAMWXEeJmnlhkbS/zy+igU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=mpCPj3JeqJ+JfhQNxGjIcr4dL2W87Gh5ElRTMfZbnmSnxVe6lSIELbGWef72h5R0bFAF8djftl/2ZVAbZbmArfPKRk9bjuStrheGgnlLQT0TtX+JjI6XlhsjMB54Z720sY7vs/G56QQpwQjyxLk8uPVxcK23KGFV5ZRdbrbWBo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jBsaUtha; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jBsaUtha"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C462EC2BCB0;
	Wed, 18 Mar 2026 14:15:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773843341;
	bh=BO6ejAZkZfQGZ+M6kNjRQqAMWXEeJmnlhkbS/zy+igU=;
	h=From:Date:Subject:To:Cc:From;
	b=jBsaUthan/9IwPFdfx1CXxyCnO73kOkP09zEKpw8yUK6b95Fa3rpUOBNw9dM+rd1v
	 pP4EBK7oRJkEYrINFUPiLRrXHP8CbHi8ykgmoX/nI+/MBVIAHQdz/YqfiGEvlr60lP
	 gqSJfDQWS7Aqxfa96DVNojlkuYo+pVWcx88BRCJKg7LdcRhVQPP6C6DK6heKyUUXvl
	 sPXUGBJqIaHedHTggdUuCv2jnZ8AFeXfW8w/pqRAUUk3RsE7ocOurtpw+nwPUtnbhp
	 YvAonv09DjSaKdsnw+AVF1Fm/aHmfyUo/7mwGGIBhrf2XZC5bTBK6oLIRX3fO7IgPf
	 mJNYORgpmmGqg==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Mar 2026 10:15:28 -0400
Subject: [PATCH v2] firmware_loader: allow firmware_class.path to take
 multiple paths
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fw-path-v2-1-8a106eb91eb4@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/z3MSw7CIBSF4a00dywG6As6ch+mA2wvhWiggQY1D
 XsXm+jwPzn5dogYLEYYqh0CJhutdyX4qYLJKLcgsXNp4JR3tGY90U+yqs0QRWUz1ZS3UrVQ3mt
 AbV+HdB1LGxs3H94HnNh3/RnibyRGGOmFaGZ50x0T+nLH4PBx9mGBMef8AZmx4IyfAAAA
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7959; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=BO6ejAZkZfQGZ+M6kNjRQqAMWXEeJmnlhkbS/zy+igU=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpurOHEkHPpnznKu62ZxqlRU8gnr2Af5/6s7kHw
 zFhQT5pRVSJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCabqzhwAKCRAADmhBGVaC
 FUoNEADDJsogNR8VsXQwoaUJaL/YiNaywtm/eOuUwcaxxJdH/u16yLs8uXCaIxChSMkyMTl7xwK
 VgIDoyIgrUSWkKscqBHhoBH3oOTccF6LVDph4/seLQoCgNfYVgHGljVTb/MlN86zUNW/aoZ/S6V
 N2GPGz22Ex1R4Uyv8y5R7VGH8vKgdwtML6/E8gVXdld/hJ3C5MqcBd/Tzycon0RIM8uDVi7C9iD
 5mvd5R7AOkXH3gDTfvbicoFY46E3CrN+rj4+poIs4WUucqub9FjgX3w0gLCm0GU3tIo8GvK2+U1
 8h6srhMNt7VZI8BGR/m1MQ04Vv754Qv57ts4i8SDosOxngNpai2wyosgV9wzeSTk5+5drCwf1x6
 5b9LIHYOtc1fgt4qGu0dxhq5GaVBqfE+UGGECOIZ9aZN452pahjqd6vJTjBwF6Bo8KPEn6OEXPj
 amp8AehoMAZisxtqhduhdr1ptp4i+6wk40SXGcu2B+2jbNiieLcfg1bKRwdoGTVIlvWopui7NE+
 xBGx6/Wu3q2vBgLrB9cv0C/PY6E5WwlIiGbmuSoTyQyht99o+TJZEuH9cwhrZVtJ98BNRsft+xa
 diQLqaAXVilI1OO/q98cCQfnKuBUF6BDyRyp3XQ98gAp2h7SujRzjMjfgXmGsmPfqhoBCdnCbzx
 FrCuTvR31gKLmgw==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Refactor fw_get_filesystem_firmware() by extracting the per-path
firmware loading logic into a new fw_try_firmware_path() helper.

Use this helper to parse fw_path_para for ':'-separated paths,
trying each one before falling through to the default firmware
search paths. This allows users to specify multiple custom firmware
directories via firmware_class.path, e.g.:

  firmware_class.path=/custom/path1:/custom/path2

Suggested-by: Michal Grzedzicki <mge@meta.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
This is something Michal had asked for last year, and I just got around
to implementing. Tested with a dummy module that calls
request_firmware().
---
Changes in v2:
- switch to using ':' as path delimiter
- Link to v1: https://lore.kernel.org/r/20260318-fw-path-v1-1-7884d9bf618f@kernel.org
---
 drivers/base/firmware_loader/main.c | 197 +++++++++++++++++++++---------------
 1 file changed, 118 insertions(+), 79 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23be563bd55f25474ceff2153ddd667..52df60064826a222cc3ae479e9c8539ec8551b0f 100644
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
+MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path, multiple paths can be separated by ':'");
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
 
@@ -511,83 +582,51 @@ fw_get_filesystem_firmware(struct device *device, struct fw_priv *fw_priv,
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
-
-		len = snprintf(path, PATH_MAX, "%.*s/%s%s",
-			       maxlen, fw_path[i],
-			       fw_priv->fw_name, suffix);
-		if (len >= PATH_MAX) {
-			rc = -ENAMETOOLONG;
-			break;
-		}
 
-		fw_priv->size = 0;
-
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
+	/* Try each ':'-separated path in fw_path_para first */
+	if (fw_path_para[0]) {
+		const char *start = fw_path_para;
+		const char *end;
+
+		while (*start) {
+			int dirlen;
+
+			end = strchr(start, ':');
+			if (end)
+				dirlen = end - start;
+			else
+				dirlen = strlen(start);
+
+			/* strip trailing newline */
+			if (dirlen > 0 && start[dirlen - 1] == '\n')
+				dirlen--;
+
+			if (dirlen > 0) {
+				rc = fw_try_firmware_path(device, fw_priv,
+							  suffix, decompress,
+							  start, dirlen,
+							  path, &buffer,
+							  msize);
+				if (!rc)
+					goto done;
 			}
-		} else {
-			dev_dbg(device, "direct-loading %s\n",
-				fw_priv->fw_name);
-			if (!fw_priv->data)
-				fw_priv->data = buffer;
-			fw_priv->size = size;
+
+			if (!end)
+				break;
+			start = end + 1;
 		}
-		fw_state_done(fw_priv);
-		break;
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

