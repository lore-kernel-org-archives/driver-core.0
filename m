Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 043F23FC5B5
	for <driver-core@lists.linux.dev>; Thu,  6 Aug 2026 08:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786006184; cv=none; b=IaBlGzmPHzVD7pv733PjRqj9o2noCCp7dI13/BFdiPzwnbs1tLPvgWLZqFAdSyAaScAa0OwkGHj1zNVlchZI4IG1PTem2G06O6fHW0G+bizCFN9i7LC22xELI8OvgM3PJDYO4gG2GS5JQEfW9QD+svxKFgEJV8nNcqZUkA7jeDE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786006184; c=relaxed/simple;
	bh=bYVn57snV5A2ibN/w2p93lM39rQLKNNKwdn5GeNSJKk=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=nHV9fgDXwStCRiFBSHOduYaxSInSP62kluOd9lQBmv7hirdr4eYYlqN9/29oCNNIWOBXIL1bIac28QtfDiOEFZyCFRk5u02vtkibepgZo4r67JLqH1D+Yp0nHlOvk2woqTGLhf0QBHwtzYHlRQp0BfQFvjRbEHmuBv4+1qf23s8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=TY2F0cFK; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="TY2F0cFK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786006154;
	bh=jUyYmBTsmqs0n3Z9OLd2hHj4Q6AzdFTzYfegDmaEhuU=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=TY2F0cFKeX61LRRhufNlwe6FQvycX2zlbQWxfwLrhR47N3DfJ/4NB5+CnKSKEgzca
	 D6pDvJZIt9iLIjW0wYbMLLzsx6sxAlE7mBr9zp9xQjuPfwEI9lgGEJBypkTr7Nj0YU
	 yWdzYZz97Vu8b8NDznF1aouwkS7Ld0q6TgS6+53M=
X-QQ-mid: esmtpgz10t1786006148t22d80378
X-QQ-Originating-IP: D2JFE83FYkgCrQbhtgVWxiQGpFIeUpgu08ldEDCPt7U=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 06 Aug 2026 16:49:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 736460180246486777
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
Subject: [PATCH v2 2/3] soundwire: debugfs: replace writable string helper
Date: Thu,  6 Aug 2026 16:48:53 +0800
Message-Id: <20260806084854.1019789-3-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20260806084854.1019789-1-chenyichong@uniontech.com>
References: <20260806084854.1019789-1-chenyichong@uniontech.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: Mm/8i8/T4yneonnyiX7T3B4fEjZxZpO0mv8jmi4AE13nuEdSs9GAJldI
	6QO/wG3SwO4i9LesVnr5pKWLhElxU2YiJG1C5vEvi6/J2oHMil6yiVQXbBawADcuwhEveS+
	8fMmXVNvKqSaVIMIsq3DQ9Xinp4998OLye/ae1jkjyUF3X/4Q8jOOgIxl6LiqiU3GgE1rEP
	xPL+C4sbhfUQtg240HmtmUmzUlLgQLQv7I/505D0xbp0L2B9pOrCto2rNau4XlkM7RppzAI
	KKuxq6B6sVAHAvTy3O0MaC/alvg2lZwKYKsEWyEhK1/QikIEYyiqdRX8/O2ZnVp+n7rUORs
	IGBGm2vjIqD1SoBUPgE2UMTQGWFxC1kR9x5CxB/v5OT6SQvPmN2TeUr47WUorT5wRa+EfQi
	OCb110gp1pkOPV2tbVlwJoL5BSrhhRxg0j0lundRZVAVRHB26G7KQcD0p0zNHeXJYDSUeUS
	gv8QuYogf1BFrRnDUeI246GoPT8DpQmnHTamAx9syl0NJJTVOJwGqrfPxQzZMEXN9NLA7up
	eL7+j24uF0YKpbFt2LkEZCjFVR2uZDZFWVDc9v6OjlG8T/fZRpDgg7sxYc5mdi51eJhAYi4
	E5hIC8RsDa/p1otcPDAj8ajxI+nW9HnpnpBTPOilNuCaxJqdlvvIQDItmYDXSiHe0RxvKeY
	EF0WcwfbvqOUFvylvargqZLjU8H8JP25EGaPTJ3uDvrPYaeOyfDOwRE+MHPpqzq7nQSpa/J
	wIfbn1PcU36sHwHJ3CDBGgtgfpeQTGtXwlP+zMAX+OgzNsZAGP5Q1ugFdEWZcaMWSiWFsb7
	7XUznynjTmE67V7NqZECGag4EA/k+DF3WKv0IxpuwQnvQ1hzdL9W61ZmnMR03H85kdAVsRt
	w6yDqizU/4G0Br2syz0sLcWYoU4Q/6swJbTslLDL//EzJ7Yl2etsQ624RmRIVS4OOA4M8Z0
	uLjCInbFe5wAkHrFTo54diQsBI9rCmuCArhfBCQMg12M/V73ZbcZJtw/x79r1EKV64WDoGC
	R4PIw2sJvcHPilRUImqDc3G1Q67WE=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
X-QQ-RECHKSPAM: 0

debugfs_create_str() is being made read-only because its generic write path
is hard to make safe without adding more locking to the helper.

Convert the SoundWire firmware_file entry to a local write-only file
operation before removing writable string support from
debugfs_create_str().

Copy the firmware name before request_firmware() so later debugfs writes
cannot replace the string while it is being used.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 drivers/soundwire/debugfs.c | 56 ++++++++++++++++++++++++++++++++++---
 1 file changed, 52 insertions(+), 4 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index 099eb84a548e..bba2b65a0668 100644
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
+	mutex_lock(&firmware_file_lock);
+	old = firmware_file;
+	firmware_file = new;
+	mutex_unlock(&firmware_file_lock);
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
+		mutex_lock(&firmware_file_lock);
+		if (firmware_file)
+			fw_name = kstrdup(firmware_file, GFP_KERNEL);
+		mutex_unlock(&firmware_file_lock);
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
+	mutex_lock(&firmware_file_lock);
 	if (!firmware_file)
 		firmware_file = kstrdup("", GFP_KERNEL);
+	mutex_unlock(&firmware_file_lock);
 
 	sdw_debugfs_root = debugfs_create_dir("soundwire", NULL);
 }
@@ -379,6 +425,8 @@ void sdw_debugfs_init(void)
 void sdw_debugfs_exit(void)
 {
 	debugfs_remove_recursive(sdw_debugfs_root);
+	mutex_lock(&firmware_file_lock);
 	kfree(firmware_file);
 	firmware_file = NULL;
+	mutex_unlock(&firmware_file_lock);
 }
-- 
2.51.0

