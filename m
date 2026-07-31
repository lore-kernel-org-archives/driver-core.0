Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325ED414A22
	for <driver-core@lists.linux.dev>; Fri, 31 Jul 2026 12:06:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785499591; cv=none; b=GU2mPMzhUUS98LmNcuifPmLIOAwZCjedFn5G0rK8qcR98GHRa3RUMs1wyWOVTrsk2G9+0XKK3YpEa56Kk3yQ5W1gsEMu/0BupHIhGzfXrck+GmBW1Hox+Qd/jmlxWMIJIZCPLZRPdPxckxVKVFE5fJG2kFPlqURO/azbId1e0ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785499591; c=relaxed/simple;
	bh=v/wytK4wYWcN1quhANGlf+MhBQCs/zJd4N9RI0UcnMw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=eiSKbmrxXfKojO4y+2KXeFxfYVxW+NZYFLuSO/XNFj3D3ugpBbb0go8j1scs0Rff31gfHJLmLq3YsHP4sJZbwQPOpMc4B2615kerA7qI5pYRImArKoqr/75red0Tr8ohULQTcTJPppTi1oo9Utcm1nZtMZDMli9KIQPbqNIgRxg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com; spf=pass smtp.mailfrom=uniontech.com; dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b=gjjfVJgQ; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uniontech.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uniontech.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=uniontech.com header.i=@uniontech.com header.b="gjjfVJgQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=uniontech.com;
	s=onoh2408; t=1785499563;
	bh=bpLVf+YRsb+x9iwyuL8GnWfdS7ZflUDXtgizbU0JqDI=;
	h=From:To:Subject:Date:Message-Id:MIME-Version;
	b=gjjfVJgQ8Egrw2Gx2IIfDa1ua1Qu36+Gas/EZZe8JCfBHMbP9WxYulZYLTYKSg2Gw
	 byuIWp4tf+Qq5x3CN+A5LPfOtjx9Xxl1XAKEAFz3ZNvj4yErxdOVKj6y6ZsD6xRQD3
	 9fdU7Tv7XTsp3h5eMDUDlrEc2GaijrIyqSBS/pyI=
X-QQ-mid: zesmtpgz3t1785499558t14c59e62
X-QQ-Originating-IP: 1Z8VkdL01wbvbgyjPWcS2yR2ro3TZ6yb5950rwYD4eg=
Received: from uniontech.com ( [113.57.152.160])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 31 Jul 2026 20:05:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 1
X-BIZMAIL-ID: 1151331584069813262
EX-QQ-RecipientCnt: 5
From: Yichong Chen <chenyichong@uniontech.com>
To: gregkh@linuxfoundation.org
Cc: tj@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yichong Chen <chenyichong@uniontech.com>
Subject: [PATCH] kernfs: avoid iattr allocation in listxattr
Date: Fri, 31 Jul 2026 20:05:54 +0800
Message-Id: <20260731120554.630147-1-chenyichong@uniontech.com>
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
X-QQ-XMAILINFO: MQPu5pFEJFN4A4KlujeMSwk8MRq1c/CjOb02/3+liiqT5xMzhtUn++/A
	rvzZzlhMftaMc3mCTUPXBMnIkctRVCvyyrUwvz/4xwQIASJe6aVZ4SrOSmhYNwA18Vhcq3/
	Bhxr5z3szqv/ztBKSDjMV9i9/OWFrGg+mE1o5Pm60k4jNz+JiJ8kOYmAGF6Mp+4JavETX/K
	oC9L+84VEIPk4Rrmqv/il3BLEtamlXz8KW5gf6AOD7nuuPv+qWs2qPFAPWfr8TKbJ2qrbdq
	XXxGGjjCXr+/yTUbcn13CytPrKHW+bd+sSVaGmHOgzuQ6bQaKQl3SkH2sq/kazpfGc5axi8
	iMUVTNJ8oiNuFDdVsilknogniJnJMhJniyTYMqNffzVdJx4u0dakcNtgxNfK6AklIf4nQHr
	8O8W3bdJtr5lOTMzt0JdHKgY7VPMMx8BkFlIXoiefcS9aCABn986MlUfLCp1xJzwi2WZzG4
	IOhUjDCtMFCUSfF3jnxTgVbXnrO6GUIKYDDm3Sy3nWAtveVL+w1gLohC6iA+GUbpoUlNbUm
	1ETgg5EEasJFqIiZ62/enhIFoevk2V3v10RtwnEzLBeAXjYfQE9Wt7LP5CniNNcWq7NIkIt
	uoFrPansDgoVv95UZiHheZCEKz0bMq2iTF9zKgS/+BYXWhEYdzOYtepVJ97+6vMbm/ThMaU
	vqy7XVx9Sy9uHuvn2tds7swv/Jg3r2uFcg/WJVyQk6u4y04NS528brJOtrBKia+/kX43Ojn
	GhH5n2joQPG5hG8v6Hpyv3lkEjQT+4ico6JDpXTGv+ItU7QjeEvLtKsg39AJk8OidGT7lyl
	ZBrRZlYWXnxAOUnVGgaUssFroECBGN+gj0Ceoc6v7I4l4bO0WPhBhNFliW13viDWAqUXO0u
	8NdEgpNTeklc+OBgMG4wjNnunqK/Tb2ScQWR57LJfQa620VwsnkEP6BK6U+Jp8bHWLmd6Jz
	Z1izAcgtN3grbc6r2hhtqsn81OBXmLHA+uu/wOjegry08lgPJ790XlegNgluk7Zrp3L2BFd
	7dWCMIhHF4oFWQ8ghTydM6K03I3B6rEqDs3gzI1BTXPUnfs+KMGmzrkgte6Yk=
X-QQ-XMRINFO: OD9hHCdaPRBwH5bRRRw8tsiH4UAatJqXfg==
X-QQ-RECHKSPAM: 0

kernfs_iop_listxattr() only needs to report existing xattrs, but it uses
kernfs_iattrs(), which allocates kernfs_iattrs when the node does not
have one yet.

This makes a query operation create persistent per-node metadata even
when the xattr list is empty.

Use kernfs_iattrs_noalloc() instead and return an empty list when no
iattrs exist.

Signed-off-by: Yichong Chen <chenyichong@uniontech.com>
---
 fs/kernfs/inode.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
index 2cb20294aaf5..237dcdd73fc2 100644
--- a/fs/kernfs/inode.c
+++ b/fs/kernfs/inode.c
@@ -141,9 +141,9 @@ ssize_t kernfs_iop_listxattr(struct dentry *dentry, char *buf, size_t size)
 	struct kernfs_node *kn = kernfs_dentry_node(dentry);
 	struct kernfs_iattrs *attrs;
 
-	attrs = kernfs_iattrs(kn);
+	attrs = kernfs_iattrs_noalloc(kn);
 	if (!attrs)
-		return -ENOMEM;
+		return 0;
 
 	return simple_xattr_list(d_inode(dentry), &attrs->xattrs, buf, size);
 }
-- 
2.51.0

