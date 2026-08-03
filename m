Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5CD9395AF0
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 06:10:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785737410; cv=none; b=WnGrMgz9dU4ehnDaylaKy32+PNK+JBtDJqFgMXBgBBqscj8dt0Y2hifAtXMBNlWLZbY7VZLroR6IsHbP9ZXoYBntnxxkd9wGyw5Z9WuikbePpQohauoa+4BfDGA/IpaGXijq5dkmZwHI2twlASvdvVos3sFabi08EW3RcZ3Hz/g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785737410; c=relaxed/simple;
	bh=PksTe+mkl8O3Fni5znT5YOUbPAmyGwXQp0crzJew/Fk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=ulj6O+AzNRCbQ+7q6MgYDntjoTjMFyBESjQzeUKnplOZM6siaxTP90oO0KmxOt7QNdD52rW1yPOfPyRXjskKNkTl2RT3SgeJQfYs0VJ0XdO4dEZ3b9WW6wFaeizCJMRqaqwf8lCosCAHlsjfZV9ZRbp5U5L4tIXSLCaxXfsXqak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=OA0CcwtA; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="OA0CcwtA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785737383;
	bh=4Fqd1GdYAOkTa853XOfR3ElF3P6LlAjIZuYduEwMeuM=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=OA0CcwtAbbpr/ESqZY3ejMCsWycMFxaPa2Pnzuf6thubxf3tSGcqToKPUjyhz/PKq
	 PSlOW12IfgZ7TiX38LQbYcpzJmW5Am7p10UQ1fRRRTRjKf2BjwtizZSbP6t4L9ib5x
	 7STrXjFIarg2uU84OM8HOINEY75Dgr6wIDc07TI0=
X-QQ-mid: zesmtpgz1t1785737365t5fe95845
X-QQ-Originating-IP: ekupQAR/1wxEnRDUlfp26dZXzPJy3froRRogqhwERR4=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 03 Aug 2026 14:09:23 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 80412947165124751
EX-QQ-RecipientCnt: 8
From: Yichong Chen <chenyichong@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	djakov@kernel.org,
	quic_mdtipton@quicinc.com,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] debugfs: serialize debugfs_create_str() writers
Date: Mon,  3 Aug 2026 14:09:20 +0800
Message-Id: <20260803060920.812228-1-chenyichong@uniontech.com>
X-Mailer: git-send-email 2.20.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:uniontech.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NQvpx3reNVf35hjcTnjtlfDXiP7rsj2K5mH2E02+4G+nmfRPOBSFKz/v
	xOXIXnERpgvKLNJnWaTdEpEfJ4i/g8tWVe2XY8seDufKk29G1ra9Kb0+Ml4QOzx7OkYFs0s
	ICvCgxDVp30WDnSleO6PGLH4ZUhiyy4EEvRVoBIKNwOdVBK4LAjoROpndjFV3wqszDggS0B
	2sWgtFy2GTJuknhpDNJuHhrhkVE8bO5bkpAqQwKQOV5Cc7syIhx229o12rkCpz2xbdNz8YH
	6FfFQaUJJbNto2P+1aAbIoH7s1xUaAH8el9Opot84vUVhdWb7Jr/gmwQS1AvDj2zzfpTQVT
	HfXBfDY4whvxa9b2baLLsghd+Ong2XGGFQA5H7iX/OFCctC5sHU7Q/GdYgBOOD/qKh3dPSV
	EBqlxfD0o4z3FNopn7NVgHP1kNFkZPyJlXjpDUu5UQZqy61mJYx+MEXBJP3Vh7QsT9frcCY
	Fa4jEiJBBsNr92jf//DurfxLMDBAzTcEz8La3LaxD24wcPVXhazh1pn8f0fE+26Pd9hwqh2
	oytQst+vPLcRr2Qhn20+lByEVpa/LrGVwWjPCwNN9CXunaIRt74rOik0aqitkH2U7AcGQEW
	krh3QAP4qKoFJbSsZDH4fACr4Iq4kFanEV3dOZo6Y9IC62FPEk7zkAUBe71QIpQpwbnZWTb
	TkIKH+q+XXfM8V6sX7SFNLN4NKKX6sPMHq2UCIE1k0n+Bpz2kBZt+rloMJ7/vr+4VziZteX
	jt9surfq2GXjQ5TY1w+u66Qy6/B7YwTC120ipqovGE7OPDC1fWulnYTvimn4i9/c5KZiGlL
	QFXeHJXCcxZAdYqbIDfBiZt7kS0as9nXilQlEpUJCKuwziX0H9qNVqSMUo4SjVt9I7f1mS+
	89I6tbMqyDyMZ8rBV4ZNRDiE4DutnRT4qDydyI0mGISFQNA7kZiX5tYZRjgO4DU/8O2J61+
	63xuArjCtqtLfqh9ZV/7iFF6t+B0Z5XNbCveZhyI6WC5fDLcBpVp6fnk32VeAsXKDjb6YBn
	eBqqojNq0CpF4ZDqnl
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

debugfs_write_file_str() replaces the string pointer backing a
debugfs_create_str() file and frees the old string after
synchronize_rcu().

Concurrent writers can observe the same old pointer before either
replacement is published. They can then both replace the pointer and
both free the same old string, which KASAN reports as a double-free.

Serialize writers with a mutex so only one writer can replace and free
the old string at a time. Also make readers use rcu_read_lock() and
rcu_dereference(), matching the existing RCU grace period before the old
string is freed.

Fixes: 86b5488121db ("debugfs: Add write support to debugfs_create_str()")
Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/debugfs/file.c | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index 08de6652a4f3..566f9ce976b0 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -18,6 +18,7 @@
 #include <linux/slab.h>
 #include <linux/atomic.h>
 #include <linux/device.h>
+#include <linux/mutex.h>
 #include <linux/pm_runtime.h>
 #include <linux/poll.h>
 #include <linux/security.h>
@@ -1014,6 +1015,8 @@ void debugfs_create_bool(const char *name, umode_t mode, struct dentry *parent,
 }
 EXPORT_SYMBOL_GPL(debugfs_create_bool);
 
+static DEFINE_MUTEX(debugfs_str_write_mutex);
+
 ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 			      size_t count, loff_t *ppos)
 {
@@ -1026,15 +1029,18 @@ ssize_t debugfs_read_file_str(struct file *file, char __user *user_buf,
 	if (unlikely(ret))
 		return ret;
 
-	str = *(char **)file->private_data;
+	rcu_read_lock();
+	str = rcu_dereference(*(char __rcu **)file->private_data);
 	len = strlen(str) + 1;
-	copy = kmalloc(len, GFP_KERNEL);
+	copy = kmalloc(len, GFP_ATOMIC);
 	if (!copy) {
+		rcu_read_unlock();
 		debugfs_file_put(dentry);
 		return -ENOMEM;
 	}
 
 	copy_len = strscpy(copy, str, len);
+	rcu_read_unlock();
 	debugfs_file_put(dentry);
 	if (copy_len < 0) {
 		kfree(copy);
@@ -1061,7 +1067,9 @@ static ssize_t debugfs_write_file_str(struct file *file, const char __user *user
 	if (unlikely(r))
 		return r;
 
-	old = *(char **)file->private_data;
+	mutex_lock(&debugfs_str_write_mutex);
+	old = rcu_dereference_protected(*(char __rcu **)file->private_data,
+					lockdep_is_held(&debugfs_str_write_mutex));
 
 	/* only allow strict concatenation */
 	r = -EINVAL;
@@ -1091,11 +1099,13 @@ static ssize_t debugfs_write_file_str(struct file *file, const char __user *user
 	synchronize_rcu();
 	kfree(old);
 
+	mutex_unlock(&debugfs_str_write_mutex);
 	debugfs_file_put(dentry);
 	return count;
 
 error:
 	kfree(new);
+	mutex_unlock(&debugfs_str_write_mutex);
 	debugfs_file_put(dentry);
 	return r;
 }
-- 
2.51.0

