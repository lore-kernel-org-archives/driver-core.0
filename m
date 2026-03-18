Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA08390C8A;
	Wed, 18 Mar 2026 12:26:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773836764; cv=none; b=qgaWQsAUOKBy9ghFYurfSjVO/HwrOK/KjzVgMbUmbn4BrmKC4KN/z4ofW8YEowDa+j8NSG07HouloxsodAzmibtshPjsMrjeheH87BTL6O5boIMEd4qBraSIfnEpwiDjakt5Cz6HawVKadZDGPwdLOIZQD8uda2gsGMrycKx0kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773836764; c=relaxed/simple;
	bh=kASi/MXfva0PZj+CNVXfI6T0+wW0paeGZQt1qZxdvqc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=RUEIHm4LlO65cd8IDBsMj8ACJEqHS29oz8wvL2B8zAauwp78LnR7MsebV2k7HP5HbT/7RfMC4EwsKd8JhPunFbLvW+0yK1bH+3Hg0Kg0RlJvamOHvFCEDFrmBQVhkZDmIRY6DRcZz9Reh+SZA4b5kDt4JVcSa8XNV2Dje4urUpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=N+hipnPh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="N+hipnPh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADBAC19421;
	Wed, 18 Mar 2026 12:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773836764;
	bh=kASi/MXfva0PZj+CNVXfI6T0+wW0paeGZQt1qZxdvqc=;
	h=From:Date:Subject:To:Cc:From;
	b=N+hipnPhk0drdnLHVJogLRNgBGwdXblOf+TO7uLpgLfn/sy1A1fLVa0my//7XqgQk
	 iB+9+ZB5prBbqjcH3BiydKoJsVQGRvm3aANcjqxmvVAU9rjeTINIliVNyC0Jgi+mTr
	 0vXG7sSrtrHMj1v23OK7H0WQ9y1DI2rj89QrbcvZn/x+55ZSny/61GkJUt/affu//c
	 mv7wQDe0fw+CTI4EBKlFWqUM/zTQe5iiu+9bVpHbQA785V1xq7JdBMNLQ0Q4rvSHdO
	 RN95D9b96/Jrm7mr0+laKtiUk9fvP9LooZuprw26tWjvhgpjdqvp5ZZCoSNtdNR8aW
	 n0S93qsXWNj8Q==
From: Jeff Layton <jlayton@kernel.org>
Date: Wed, 18 Mar 2026 08:25:54 -0400
Subject: [PATCH] firmware_loader: allow firmware_class.path to take
 multiple paths
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260318-fw-path-v1-1-7884d9bf618f@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzMDY0Nz3bRy3YLEkgzdRANLk2RjAyNTy0RTJaDqgqLUtMwKsEnRsbW1ABk
 3pqZZAAAA
X-Change-ID: 20260317-fw-path-a094c30259a5
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Michal Grzedzicki <mge@meta.com>, driver-core@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Jeff Layton <jlayton@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7810; i=jlayton@kernel.org;
 h=from:subject:message-id; bh=kASi/MXfva0PZj+CNVXfI6T0+wW0paeGZQt1qZxdvqc=;
 b=owEBbQKS/ZANAwAKAQAOaEEZVoIVAcsmYgBpupnWAtOsF2WG0H5DnYvAQTiQotl7bbKW9HE+y
 K7/+khP+ACJAjMEAAEKAB0WIQRLwNeyRHGyoYTq9dMADmhBGVaCFQUCabqZ1gAKCRAADmhBGVaC
 Fd9KD/wLwMvAIc6o8h/fxBmRrJy6XlfgAaPCO//qWUmCb1RBnGxf99Lz4rHHuiiXxWtrD8pYuUc
 SC380QaQbreG73/eOUBN17QdxammckCVVM5t1jRr7ajWRpBsm8vnmNsrdWKFgeMkbEDKPc93157
 LDHiwEV1XlvyZoGnuum2Pqvgujn4/Uan7iVr8BeXHnvswc6MZ+QVxINNkkHfNm9oDP5bxWiVu1S
 gCg35bQv7d5CX0gFbBg3TjMdMYVwmvxR06S8nk2LG9O5d3I1dfKWouP8CT50jwfn2pVgfCRS73j
 hrKb+/InXdJ8BrtipBg0p9nDA0Rou/B0tXlx/0TP9eAdD9RwDuX3hQJqzz+GvOcI6MtC3/ikp6k
 dT9YxNWADt4AJDhT7fGhXEOUWhLrr1VqjsQuLoTkpk8P6V13ctDD+OxJVd1wNJKz8AuCw3nL+Qk
 3iu0dSUgu8gioCS3OKE8G2s74zMFp1XmzdSyli7ycYnVHb/09cOvvxiF06dXBbO4UQfYsy0ehOe
 F88lONm/ibESkk2xo2mZMNXl+HvLiI0duSUPsIA3SGuONpGeE/THMthsDGnGG/5He1xdV1boUvH
 UHBBUtGPFBrQlwvYeTw+ybq99iIGALQQ0RdBbG+bonJRNPPZqdiWi7NcLyu+LGZBf3+Vo1AB+Iv
 hBMVdoirLhPhkWQ==
X-Developer-Key: i=jlayton@kernel.org; a=openpgp;
 fpr=4BC0D7B24471B2A184EAF5D3000E684119568215

Refactor fw_get_filesystem_firmware() by extracting the per-path
firmware loading logic into a new fw_try_firmware_path() helper.

Use this helper to parse fw_path_para for ';'-separated paths,
trying each one before falling through to the default firmware
search paths. This allows users to specify multiple custom firmware
directories via firmware_class.path, e.g.:

  firmware_class.path=/custom/path1;/custom/path2

Suggested-by: Michal Grzedzicki <mge@meta.com>
Signed-off-by: Jeff Layton <jlayton@kernel.org>
---
This is something Michal had asked for last year, and I just got around
to implementing. Tested with a dummy module that calls
request_firmware().
---
 drivers/base/firmware_loader/main.c | 197 +++++++++++++++++++++---------------
 1 file changed, 118 insertions(+), 79 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23be563bd55f25474ceff2153ddd667..5328d28a2141e85265e1bcc20e995ce4c5517c36 100644
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
+ * kernel instead of module. Multiple paths can be separated by ';'.
  */
 module_param_string(path, fw_path_para, sizeof(fw_path_para), 0644);
-MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path");
+MODULE_PARM_DESC(path, "customized firmware image search path with a higher priority than default path, multiple paths can be separated by ';'");
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
+	/* Try each ';'-separated path in fw_path_para first */
+	if (fw_path_para[0]) {
+		const char *start = fw_path_para;
+		const char *end;
+
+		while (*start) {
+			int dirlen;
+
+			end = strchr(start, ';');
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

