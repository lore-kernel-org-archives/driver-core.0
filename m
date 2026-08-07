Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC0C23F210A
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 10:03:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096986; cv=none; b=ckp1DjI178WU9UI0LbAzBoCffP1+iVrmbx8uHZKQGmsUYNcTIaJOd93brdln+xfP+xJpLhyFlbO8xS5K3uGnqsOWzYfTTU8AAp3RClllY8zD0KsjyZHXvfm1NMcoh4Ye/rM1ZtsUUErPJBB+o9rw7Gpwv++CP11PRwbVRBrXQLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096986; c=relaxed/simple;
	bh=sTB+q2yGXMUFFVb/puERdZJCmbQ4/NCEbjGWkoO3doQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=D694MYswNUrGhbXRi4S4/CtNz0qFlht8yJTtKTMklKe5izqWyCI2UxomY3SvuWHcExk5Wh/wZpYIDQMKOIxHAS/9S5lU4W+mQbXC/MfbF+5aYI4e0xJqZ7jKv8djkXu3vQhvifk94xtDRt/DbzWq1evijBtPpnIhwGY6WliHFFM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=RT68QvRk; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="RT68QvRk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786096943;
	bh=MsDLrJziY9sfCbxEdR4Mn3VYin9jFIv1p9TVwvNq7cs=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=RT68QvRkmS6GFP8VPC9D7ibZzoyK8U6EMDrk4mRWVnOU+SxSGPsaRkZCr8Ht4mNVR
	 0yv/qgsG4JiDW+w1UtEvqgupnbLa07BPfx5tasB4rCYVfzHymaoa7FB/4FKOc9egX4
	 9yg+TVLrcLTEQJodUGWy1KwgTa04OzKYBquifvgY=
X-QQ-mid: zesmtpgz1t1786096938ta3e5e1b1
X-QQ-Originating-IP: S+p1emIyL/pTOuj2FrBZ+LochIXhVzo8lbfR6Q1S5xI=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 18:02:11 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 17825993322717190689
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
Subject: [PATCH v3 2/3] soundwire: debugfs: replace writable string helper
Date: Fri,  7 Aug 2026 18:00:52 +0800
Message-Id: <20260807100053.1089834-3-chenyichong@uniontech.com>
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
X-QQ-XMAILINFO: OA2DBih+LDLYVK7oeHVVfRU49+8yVsgq6Nc882r/c02Lqha8hJ0CwQxt
	k8WdY7b822R56V+KuquFFDoQO4YpzeT7Sx5nJmkCr/wbix6eU3p0j3yk+MfQk7GFSPKwegR
	VELqTXf5hfcCRn38KhHILMwDOhwilPx4n33Fj+vyFiFmxbMESIFtaGakY+FcigCge5bg15E
	d5oIbvcmQE9O1yCdBo68RPc876j0p54uXPlMMVNhikuMJLfQIomZBP4WoDLJhTP9pua41x5
	FQePKfRmz67sK33Xwq+UBY2BnyGwqH4+GxCc1vYIvnXpoaegJrpR8tQIW1KUBvLvrADnZ0/
	PGLVcRZuKpeLYpUp6dTVkfLaMyOTmBCD9KeSRzTUqOaybnEgqizSxS85arF3K2fDlEffDIz
	myD7/ea95EdYFA0p2ynNlvIzZsFRaKinWN6Jta0pvwU8CBHUNTmNdxSZ4f7mpCmC/hLdwDM
	zKAouLW1uijtvaz5dfthuLLuY/cMpgkQyshdBKm5lN6cp83oMXAaoQXZhPvj9EeWtvJ/LPh
	50fDHTMadoyXP8+IS/n5uAp/WDe0ljUtH2oCbeC3r1E7Xel491Gnk2zVqJbIOIxRsNpvfmX
	WqyAaEY8NESPahvQiBA+66Xxl+m4L7fb6Peco0qNfGSbz2YvQAve/NEioh9lj2qfcnojo7b
	Xts4dETBfidSwh0QWUOALTO29qzciV0HJO//fcGQXQ17blYIQ6yiNRmQJWqJVPgAYU5SgUM
	t6GEsM8c8pMPpeKkQE9IRyzVM1ysi/zU7WtXvKFhu090UCnAzDNnK1fNLepfXaU+fum7bIo
	cf8cj/Dxn68J1zB+DSgMtUp+G8P3/sYRSFR5tpcYWLu4bxB4JoxdlnJYuoWQaBDX8WiZJW3
	TVQZ/U+7ZNo0niVweBOiTJ5krNxoQhz+vrzgsQ5iz+ZHdzJw2RenjHCfffxvhVlTFO15WYd
	V2rivyZZzIG5HmBRHAE972U4QhBnaTzR1G9g7PyzNYioLb5v+rVq3ZDBvb4vsxWQnXrD1OQ
	w7xOxLb8rRMrk+P52NeBM8+5D8iaNo8oYlsGM2su9dGZvE1EKVIhLD9YUOd3igfGbPVXcyv
	XaLGZ0UX9TKlAJ5b+VS4+CqEX/DIaVL7yK3ILeuUz18nIpRwFRpa8TGcFLnwaITC8I07XFy
	EYjk
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

debugfs_create_str() is being made read-only because its generic write
path is hard to make safe without adding more locking to the helper.

Convert the SoundWire firmware_file entry to a local write-only file
operation before removing writable string support from
debugfs_create_str().

Copy the firmware name before request_firmware() so later debugfs writes
cannot replace the string while it is being used.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 drivers/soundwire/debugfs.c | 63 ++++++++++++++++++++++++++++++++-----
 1 file changed, 55 insertions(+), 8 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 099eb84a548e..a8a6db164fe7 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -145,6 +145,38 @@ static u32 start_addr;
 static size_t num_bytes;
 static u8 read_buffer[MAX_CMD_BYTES];
 static char *firmware_file;
+static DEFINE_MUTEX(firmware_file_lock);
+
+static ssize_t firmware_file_write(struct file *file,
+				   const char __user *user_buf,
+				   size_t count, loff_t *ppos)
+{
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
+	scoped_guard(mutex, &firmware_file_lock) {
+		old = firmware_file;
+		firmware_file = new;
+	}
+
+	kfree(old);
+	return count;
+}
+
+static const struct file_operations firmware_file_fops = {
+	.open = simple_open,
+	.write = firmware_file_write,
+	.llseek = default_llseek,
+};
 
 static int set_command(void *data, u64 value)
 {
@@ -246,6 +278,7 @@ static int cmd_go(void *data, u64 value)
 {
 	const struct firmware *fw = NULL;
 	struct sdw_slave *slave = data;
+	char *fw_name = NULL;
 	ktime_t start_t;
 	ktime_t finish_t;
 	int ret;
@@ -265,15 +298,24 @@ static int cmd_go(void *data, u64 value)
 	}
 
 	if (cmd == 0) {
-		ret = request_firmware(&fw, firmware_file, &slave->dev);
+		scoped_guard(mutex, &firmware_file_lock) {
+			if (firmware_file)
+				fw_name = kstrdup(firmware_file, GFP_KERNEL);
+		}
+		if (!fw_name) {
+			ret = -ENOMEM;
+			goto out;
+		}
+
+		ret = request_firmware(&fw, fw_name, &slave->dev);
 		if (ret < 0) {
-			dev_err(&slave->dev, "firmware %s not found\n", firmware_file);
+			dev_err(&slave->dev, "firmware %s not found\n", fw_name);
 			goto out;
 		}
 		if (fw->size < num_bytes) {
 			dev_err(&slave->dev,
 				"firmware %s: firmware size %zd, desired %zd\n",
-				firmware_file, fw->size, num_bytes);
+				fw_name, fw->size, num_bytes);
 			goto out;
 		}
 	}
@@ -306,6 +348,7 @@ static int cmd_go(void *data, u64 value)
 out:
 	if (fw)
 		release_firmware(fw);
+	kfree(fw_name);
 
 	pm_runtime_mark_last_busy(&slave->dev);
 	pm_runtime_put(&slave->dev);
@@ -358,7 +401,8 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
 	if (firmware_file)
-		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+		debugfs_create_file("firmware_file", 0200, d, NULL,
+				    &firmware_file_fops);
 
 	slave->debugfs = d;
 }
@@ -370,8 +414,10 @@ void sdw_slave_debugfs_exit(struct sdw_slave *slave)
 
 void sdw_debugfs_init(void)
 {
-	if (!firmware_file)
-		firmware_file = kstrdup("", GFP_KERNEL);
+	scoped_guard(mutex, &firmware_file_lock) {
+		if (!firmware_file)
+			firmware_file = kstrdup("", GFP_KERNEL);
+	}
 
 	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
 }
@@ -379,6 +425,7 @@ void sdw_debugfs_init(void)
 void sdw_debugfs_exit(void)
 {
 	debugfs_remove_recursive(sdw_debugfs_root);
-	kfree(firmware_file);
-	firmware_file = NULL;
+	scoped_guard(mutex, &firmware_file_lock) {
+		kfree(firmware_file);
+	}
 }
-- 
2.51.0

