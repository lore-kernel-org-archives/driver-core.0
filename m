Received: from smtpbgsg2.qq.com (smtpbgsg2.qq.com [54.254.200.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FBC404BE9
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 10:03:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.254.200.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786096990; cv=none; b=Do/yZ2Dls24NDUp/6Z36pJYvOK4tfdbHd2SYCJJK2/fFA94Dwew3vzYbBZM5hPf63nv8yxOXUzLSawYTdm3UP/vM7VXJcrOCxfdvrfmqHrpHjWYWOgz++KulN/WkTpg3J3aBx0zkB16LrVc2jS05OkeUgPtAQP0u/twIggdNDpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786096990; c=relaxed/simple;
	bh=HzKxMRWqgnUrqGjs5xW5rIPpkTGLbuRLIuuAwL4P/BQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=e6rRS10iHwxbY89EhCjVd3rHx7i77OU+TDqjiqdqeWGX5NybN+a1f0OtNItPsXp7rUdaS9Z8fJmM4x0g7zznl2KvDWT7kOCTSnnxfdFjGXqncEfaHJBc+aZveo16jSX2XCctzNJdNDtwZi65LQRAsvYnId2X8VxP0WUnVyz/zHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=Pr1lB9gH; arc=none smtp.client-ip=54.254.200.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="Pr1lB9gH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1786096949;
	bh=tP6FsQWEwYoq2MGkNGhgwZkP1Jh1LVRNF/KcW4T3hFY=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=Pr1lB9gHZO1pq0I/ZRv3RgGmw01vSr6l0zMXXKDds7/pCV2cgVyJqc6nCPTdQbbTc
	 Pr9iRCppgp8ax1RdqRiGIipYKmqaj64YdcwjbI5NZMIYgvvQEip6DalEXDkBR6rHUq
	 esuL/GSIPFbccY6c4RdTkpW21wjsXzaNt8jyVFh0=
X-QQ-mid: zesmtpgz1t1786096944tba2b5ced
X-QQ-Originating-IP: 2ULuDb63Nqk5vrbJn0taO1cZCs7QEGJCr1/P5AoBP6M=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 07 Aug 2026 18:02:21 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 4948339811663763525
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
Subject: [PATCH v3 3/3] debugfs: make debugfs_create_str() read-only
Date: Fri,  7 Aug 2026 18:00:53 +0800
Message-Id: <20260807100053.1089834-4-chenyichong@uniontech.com>
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
X-QQ-XMAILINFO: Nw5WZPeltq7pgynYcw2gXeji0DgY525l1Y3Q7QCQKOfpgTWPLWv9Zu08
	eODgpEWCZKZeB1N2IcOrKNdKFQJE+a1/OMgSd/CYP1/zlERzzyiI+37vJElqiXejkF3RCLa
	yHgBJIBDw6NYEnrX8TBLNEsl7P75YC3rki0VqnGAvUwLCnIODjhk+iUrUbUB2QNTGyJk1cC
	jjABqQeQHsKJsU3TqHVL0XNw2WnacpIYGdAEZUTWQTO2XTUjNcfB99A9lKT0QGgWf4MmbM0
	UUSploc6y1YHZtr9q3geAOj8mRqhnOa5APDG/iYcfO4peYtOc2/B00nvcdGgHiwAHGDClmq
	bhKaFqyxWamt1qZD0gW+/VuoWx+Lx8E3K2K2SdJMXkrCRqcaxJAFNNF2CMQFuQfCv0u2uHf
	5zjkceY7GwirWnQSWTDM5nVVqa3r0RlkTXyHd0IrIudVIPLU+RI2rGfirrUQsRevxAA/1Pv
	Y9+SDuFYLI4rjUMuVedR9xDy75E21vrHxUi2JxjEXYYUCbSGFGwfGs1FC9BzcNlrhGZ0xMR
	nf0xFAwR8oM+UwEJFciV7HlfY7m4+WpASKLe9UyLAC35HrRo6gRi0w/BsL0ZQHUULKLrzgl
	bmpauaGvD5fTxfLkgX85n1/D2ihw5+YV1HTvXSinf9KX7gZ3/g6lnzOGraKArcENmKpNiGh
	lSbpFhj1XmPAjyylE/zbj77ZYLNjHWNhZeOGukItkqQBIXz49dPpNa9O0Ee4FMxxuZJZH8m
	5WVdAmGqhgfl7eJrv3tv8X60cDtiKv/yziOWHIcwaAUVqFQafZRr8KS3jVYdf7OrEABPnCs
	y16U77dysam/a5vQSP3sxza5dIb8eHapFzLwQ01wn0ZUJQabmjrdri053oIA4DdL+miq/nM
	PpsBw14WC5ZBC/SreoMiKsrcyixELZhI2mLDrcN9KDfWC4y39qdhGOlZzffGVGJ42UZKiwt
	QFzXEobM7nBCqaB/iH9j/RPQf0XGlsVdV34n5pTvqRxTgExeqq3Kr7t4Sg0Ilr9ixGUQ9nl
	KowpoxRI/bxc3tj1cd99AasGTtWzWPoZa0m8nw/5gAVPHD85A80lEOSvAD637iEUkO12QzO
	4tOCiFIIvyx/nZ9KF2I7Q7eViTdH1qFfBnylPA4C8VviADp/XIYn0+k9jiKra6BqU+UPcvq
	h8vpkhE13iqdAOg=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

debugfs_create_str() supports replacing the backing string from userspace.
Concurrent writers can race and free the same old string twice.

All writable in-tree users have been converted to local file operations.
Remove the generic write support from debugfs_create_str(), and refuse to
create a file when the caller passes write permission bits.

This makes unsupported writable use visible instead of silently creating a
file with different permissions.

Fixes: 86b5488121db ("debugfs: Add write support to debugfs_create_str()")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/debugfs/file.c | 81 ++++++-----------------------------------------
 1 file changed, 10 insertions(+), 71 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 08de6652a4f3..170feb75317f 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -1049,98 +1049,37 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 	return ret;
 }
 
-static ssize_t debugfs_write_file_str(struct file *file, const char __user *user_buf,
-				      size_t count, loff_t *ppos)
-{
-	struct dentry *dentry = F_DENTRY(file);
-	char *old, *new = NULL;
-	int pos = *ppos;
-	int r;
-
-	r = debugfs_file_get(dentry);
-	if (unlikely(r))
-		return r;
-
-	old = *(char **)file->private_data;
-
-	/* only allow strict concatenation */
-	r = -EINVAL;
-	if (pos && pos != strlen(old))
-		goto error;
-
-	r = -E2BIG;
-	if (pos + count + 1 > PAGE_SIZE)
-		goto error;
-
-	r = -ENOMEM;
-	new = kmalloc(pos + count + 1, GFP_KERNEL);
-	if (!new)
-		goto error;
-
-	if (pos)
-		memcpy(new, old, pos);
-
-	r = -EFAULT;
-	if (copy_from_user(new + pos, user_buf, count))
-		goto error;
-
-	new[pos + count] = '\0';
-	strim(new);
-
-	rcu_assign_pointer(*(char __rcu **)file->private_data, new);
-	synchronize_rcu();
-	kfree(old);
-
-	debugfs_file_put(dentry);
-	return count;
-
-error:
-	kfree(new);
-	debugfs_file_put(dentry);
-	return r;
-}
-
 static const struct file_operations fops_str = {
 	.read =		debugfs_read_file_str,
-	.write =	debugfs_write_file_str,
-	.open =		simple_open,
-	.llseek =	default_llseek,
-};
-
-static const struct file_operations fops_str_ro = {
-	.read =		debugfs_read_file_str,
-	.open =		simple_open,
-	.llseek =	default_llseek,
-};
-
-static const struct file_operations fops_str_wo = {
-	.write =	debugfs_write_file_str,
 	.open =		simple_open,
 	.llseek =	default_llseek,
 };
 
 /**
- * debugfs_create_str - create a debugfs file that is used to read and write a string value
+ * debugfs_create_str - create a debugfs file that is used to read a string value
  * @name: a pointer to a string containing the name of the file to create.
  * @mode: the permission that the file should have
  * @parent: a pointer to the parent dentry for this file.  This should be a
  *          directory dentry if set.  If this parameter is %NULL, then the
  *          file will be created in the root of the debugfs filesystem.
- * @value: a pointer to the variable that the file should read to and write
- *         from. This pointer and the string it points to must not be %NULL.
+ * @value: a pointer to the variable that the file should read from. This
+ *         pointer and the string it points to must not be %NULL.
  *
  * This function creates a file in debugfs with the given name that
- * contains the value of the variable @value.  If the @mode variable is so
- * set, it can be read from, and written to.
+ * contains the value of the variable @value.  The file can be read from.
+ * Writable files are not supported; if @mode contains write permission bits,
+ * no file is created.
  */
 void debugfs_create_str(const char *name, umode_t mode,
 			struct dentry *parent, char **value)
 {
 	if (WARN_ON(!value || !*value))
 		return;
+	if (WARN(mode & 0222,
+		 "%s() does not support writable files\n", __func__))
+		return;
 
-	debugfs_create_mode_unsafe(name, mode, parent, value, &fops_str,
-				   &fops_str_ro, &fops_str_wo);
+	debugfs_create_file_unsafe(name, mode, parent, value, &fops_str);
 }
 EXPORT_SYMBOL_GPL(debugfs_create_str);
 
-- 
2.51.0

