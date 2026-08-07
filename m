Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3351A9FB7
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 10:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.194.254.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096971; cv=none; b=cym6k71sgFJs7y4hYpuS0eNFXgLQOasnDSBp4RHKBbXenWGH6RhXfP2X/kjLkApfzmYRpJBhqcVIgjuOp72jZoAkpwz7XLOFAj+sPCgXbn7m6P6cV6IN9offh3OAE4FGUjwlO4X9QsdIq8fRsmVXQN0Qi0JyaMHQ5seOldt4fg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096971; c=relaxed/simple;
	bh=uPOW7rdVMm6V8ePe7kqGvb3eoPcsx/SPyrtcxzDrszY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=eHqxdQ30oLsOoBkQ6ceCZ4VivnETnbSpsjh9strIuul+YwiqP6WdVgKAdGnVotPFhWa9a2N3gVXSjNMzg/AxZnpBVrXCu8RUXA87exZFV4tM33VM4R4/zIctDsmmog8B5Bblog03tRkOwJFIuCmhAFXXzA2s9iOd7qYyyFdWcys=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Sf4nNkbv; arc=none smtp.client-ip=18.194.254.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Sf4nNkbv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786096934;
	bh=6oSMObSXCJFlZ+zBraZAJWfjfuycNvVXrH6aJjGCFLs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Sf4nNkbvV1mipNlwyxDKNnJM7pBmxJ/L8CIuMC1odi/pv4vPMsRFqu/b5MsD7JcQr
	 9qaeiOwlvkwzLp+anZq8qQBZDAkKQuyhkfzTPJH3i7cVFHM9XPa8Xwp7kMGPqaj2sP
	 vIrK7ZHf2sMSLqZLVj8QWac6mOX9YGhN6vXcAhtA=
X-QQ-mid: zesmtpgz1t1786096928t856e439f
X-QQ-Originating-IP: fyo/Oo8PE3ZjJTPluJGSxT9G72pGfqCeKSGEeMqGfkk=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 18:02:04 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 14027790777046860935
EX-QQ-RecipientCnt: 13
From: Yichong Chen <chenyichong@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	djakov@kernel.org,
	quic_mdtipton@quicinc.com,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com,
	pierre-louis.bossart@linux.dev,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	linux-sound@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH v3 1/3] interconnect: debugfs: replace writable string helper
Date: Fri,  7 Aug 2026 18:00:51 +0800
Message-Id: <20260807100053.1089834-2-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260807100053.1089834-1-chenyichong@uniontech.com>
References: <20260807100053.1089834-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MclpzN0hYnUEmPg4jVhE1yWg6dCP6yzeW0wykpYTZyFM2toiQetxXLbY
	qdc2FGY2Ug2FF2Tt7dXzqy1NMxQYjAjL9+nDUfYvwuyn1Vlu0OYQ0OU3WHBdxHiOlBEbCAD
	JFcPosqiM44rHwRPgQ8qpRRFvo9B5YmnyyguXRgIyCqI1OL3BDH36TXVpJ92HsfNrT6XmpW
	mejYi5KD8QCTrEmaANakm9wi7K2YvXBHx8JX0FH6ZipnQXJN7k4Sjxw+RfywT+ohYwTFaKV
	c0dnJYXT11GasZT8Pu3c03VaWyjwHLGgKONXSleLx4UmeSoRHwk6D0l3Gx26JueAlafcoHr
	3hRjhQtio4u1iNzI0+Y6LQGZRE9L5AFmaetSTx2X8VMTSElF4Kw9tlEt6ptXiGYfice5Wqh
	v6ca9G9YlwtvFu23Q2hqWc/jlgNekp+8ZWrMGXB0TCKBWC3Ay1ViUwG2TyJv1bvJmfMas0Y
	FCU+UU+lAfBYMR86DUt8X2PHOmy9FHKe8iXUMYIZyLhqkeHBXKnWX+576icedrnTF1ugb0R
	eyqu9Au4PlFdmKw7wpeP+TC/bgXhNOmvjg07uL6efVpkdHVk1Ki1DFUSA3PBFwSg1jaqS8r
	FEojRmVD3ePBA7U8IR801213MfCEnRFC3lTGdoE59DzuWbRbusPvnzTlI8YinQN0D4bJmV4
	Pi/icz8pjB1jRqtqd4jtWcczTATVRvamCSGJvaChnXVkYWq+w6Zofa+urW+7sdXNgY/a53e
	waSsWxYrdQ/HI6GiX5bFLSkIqjVsRX07F+b9GQiuIRL3+QSmWQvAMNHd9HLfw4+iUdHhmAU
	fNo14uhXBtKXOfs6UMWnA8F6IjVZOgWuJaAOyDYaIjM9m3OSGmK71qtNNgx9cfUdIDONFNp
	FhOhikDN26s1QVR8q9TYoZcQvahQhdEKcbvRUWRklzaFCUlwPq1Ica0AeEjDqZJ9Wi8hOni
	of0HW7Xr+yPeyqyPc03kDrSSGBerib98CG6IC9YzV4AhiR2cpGsIdWX/M0aHvpioJv9iogM
	441CLGhev1meMv1V2ISv7PIKPlh9nCFaJpe6NcxhkXQ6xfJMyUJKb3FRum+zdvuQ0drHlvT
	vI1P+Zmg9IUvcq3tjwa75KrXmeTZOUwoOSiEmuX4NZBAFqncUnIzp6aYN/YoXarf3B8TciC
	7Yts
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

debugfs_create_str() is being made read-only because its generic write
path is hard to make safe without adding more locking to the helper.

Convert the interconnect debugfs client src_node and dst_node entries to
local file operations before removing writable string support from
debugfs_create_str().  Protect the string replacement and path lookup with
the existing debugfs_lock.

The old code duplicated the strings under rcu_read_lock(), so it had to use
GFP_ATOMIC.  The local file operations protect src_node and dst_node with
debugfs_lock instead, so the allocation can use GFP_KERNEL.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 drivers/interconnect/debugfs-client.c | 81 +++++++++++++++++++++------
 1 file changed, 64 insertions(+), 17 deletions(-)

diff --git a/drivers/interconnect/debugfs-client.c b/drivers/interconnect/debugfs-client.c
index 08df9188ef94..c587fbf519c6 100644
--- a/drivers/interconnect/debugfs-client.c
+++ b/drivers/interconnect/debugfs-client.c
@@ -5,6 +5,7 @@
 #include <linux/debugfs.h>
 #include <linux/interconnect.h>
 #include <linux/platform_device.h>
+#include <linux/slab.h>
 
 #include "internal.h"
 
@@ -36,6 +37,59 @@ struct debugfs_path {
 	struct list_head list;
 };
 
+static ssize_t icc_node_read(struct file *file, char __user *user_buf,
+			     size_t count, loff_t *ppos)
+{
+	char **node = file->private_data;
+	char *copy;
+	size_t len;
+	ssize_t ret;
+
+	scoped_guard(mutex, &debugfs_lock) {
+		copy = kstrdup(*node ?: "", GFP_KERNEL);
+	}
+	if (!copy)
+		return -ENOMEM;
+
+	len = strlen(copy);
+	copy[len++] = '\n';
+	ret = simple_read_from_buffer(user_buf, count, ppos, copy, len);
+	kfree(copy);
+	return ret;
+}
+
+static ssize_t icc_node_write(struct file *file, const char __user *user_buf,
+			      size_t count, loff_t *ppos)
+{
+	char **node = file->private_data;
+	char *old, *new;
+
+	if (*ppos)
+		return -EINVAL;
+	if (count + 1 > PAGE_SIZE)
+		return -E2BIG;
+
+	new = memdup_user_nul(user_buf, count);
+	if (IS_ERR(new))
+		return PTR_ERR(new);
+	strim(new);
+
+	scoped_guard(mutex, &debugfs_lock) {
+		old = *node;
+		*node = new;
+	}
+
+	kfree(old);
+	return count;
+}
+
+static const struct file_operations icc_node_fops = {
+	.open = simple_open,
+	.read = icc_node_read,
+	.write = icc_node_write,
+	.llseek = default_llseek,
+};
+
 static struct icc_path *get_path(const char *src, const char *dst)
 {
 	struct debugfs_path *path;
@@ -54,26 +108,19 @@ static int icc_get_set(void *data, u64 val)
 	char *src, *dst;
 	int ret = 0;
 
-	mutex_lock(&debugfs_lock);
-
-	rcu_read_lock();
-	src = rcu_dereference(src_node);
-	dst = rcu_dereference(dst_node);
+	guard(mutex)(&debugfs_lock);
 
 	/*
 	 * If we've already looked up a path, then use the existing one instead
 	 * of calling icc_get() again. This allows for updating previous BW
 	 * votes when "get" is written to multiple times for multiple paths.
 	 */
-	cur_path = get_path(src, dst);
-	if (cur_path) {
-		rcu_read_unlock();
+	cur_path = get_path(src_node, dst_node);
+	if (cur_path)
 		goto out;
-	}
 
-	src = kstrdup(src, GFP_ATOMIC);
-	dst = kstrdup(dst, GFP_ATOMIC);
-	rcu_read_unlock();
+	src = kstrdup(src_node, GFP_KERNEL);
+	dst = kstrdup(dst_node, GFP_KERNEL);
 
 	if (!src || !dst) {
 		ret = -ENOMEM;
@@ -105,7 +152,6 @@ static int icc_get_set(void *data, u64 val)
 	kfree(src);
 	kfree(dst);
 out:
-	mutex_unlock(&debugfs_lock);
 	return ret;
 }
 
@@ -115,7 +161,7 @@ static int icc_commit_set(void *data, u64 val)
 {
 	int ret;
 
-	mutex_lock(&debugfs_lock);
+	guard(mutex)(&debugfs_lock);
 
 	if (!cur_path) {
 		ret = -EINVAL;
@@ -130,7 +176,6 @@ static int icc_commit_set(void *data, u64 val)
 	icc_set_tag(cur_path, tag);
 	ret = icc_set_bw(cur_path, avg_bw, peak_bw);
 out:
-	mutex_unlock(&debugfs_lock);
 	return ret;
 }
 
@@ -160,8 +205,10 @@ int icc_debugfs_client_init(struct dentry *icc_dir)
 
 	client_dir = debugfs_create_dir("test_client", icc_dir);
 
-	debugfs_create_str("src_node", 0600, client_dir, &src_node);
-	debugfs_create_str("dst_node", 0600, client_dir, &dst_node);
+	debugfs_create_file("src_node", 0600, client_dir, &src_node,
+			    &icc_node_fops);
+	debugfs_create_file("dst_node", 0600, client_dir, &dst_node,
+			    &icc_node_fops);
 	debugfs_create_file("get", 0200, client_dir, NULL, &icc_get_fops);
 	debugfs_create_u32("avg_bw", 0600, client_dir, &avg_bw);
 	debugfs_create_u32("peak_bw", 0600, client_dir, &peak_bw);
-- 
2.51.0

