Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEAD63D6665;
	Thu,  5 Feb 2026 13:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770296990; cv=none; b=K/csGjKR9Gyja9M55LqTycmjO7Ahc0ID7LLWL7RSQGQg20InmuA/6lE+K7wylvkGtaPZD+iXP1tXu8jkh+wN3j5Tw3qqf5LVlkRWKAheisgRQseqi9L23l0zcwTub3JKkWK/ZFmpOp8dM/D4LG3056SF8K51b/tthQRMWMIfwT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770296990; c=relaxed/simple;
	bh=PnI6Fqu7jfni7Z9rug0TN84YjDETH+CWcvCEx3TWBGA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=MRER7alux2akgeai0wFljcmpB++pEoM+QUpJjEEZi09zTRMpa9Uga2k7YRnpKiRfUFIe+bEoJR1MO+sarnNjvtMyXLL8oCoKcsjTCDd0eSXYy1c6kEtRdE39LUciLsc9yarN/ZDV+O01fNnJwAYehnDrf1sihPi5ybQVF0K1Xqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=HXbp/F4W; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="HXbp/F4W"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A205C16AAE;
	Thu,  5 Feb 2026 13:09:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1770296990;
	bh=PnI6Fqu7jfni7Z9rug0TN84YjDETH+CWcvCEx3TWBGA=;
	h=From:To:Cc:Subject:Date:From;
	b=HXbp/F4WgoLKRwNnaFpEF4UANLzM/h8iLeH893UvQeQeOzTpR4JFIEmvqczxBmqj1
	 UEQFL2mRfcXqPEUORjOLcOLf7b3w4fwu9W0jKHr/JJ00DIFZz1LqlIFGkekog6Vqq5
	 F5pkrZoX8Vwgoo7UrYR69C5KT7282gFimOrtWLdw=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: [PATCH 1/2] sysfs: remove exports of sysfs_*change_owner()
Date: Thu,  5 Feb 2026 14:09:42 +0100
Message-ID: <2026020541-energize-graduate-981a@gregkh>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1004; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=PnI6Fqu7jfni7Z9rug0TN84YjDETH+CWcvCEx3TWBGA=; b=owGbwMvMwCRo6H6F97bub03G02pJDJkt06ZqqpqZhL5cl6+/JDyN/++6VXtNyr4GxD0s0q26F sjv9O5LRywLgyATg6yYIsuXbTxH91ccUvQytD0NM4eVCWQIAxenAEzkvCLD/LTU8vpQNX9ftseP ZeTyDMKL1z6tZZin5sz5/dTUk2ukat+u3P2adfKb54FXAQ==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

Both sysfs_change_owner() and sysfs_file_change_owner() are exported to
modules, but there are no in-kernel module users, so remove the exports
so that crazy out-of-tree drivers don't get the impression that it is
safe to call these functions at all.

Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/sysfs/file.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
index 3825e780cc58..a8176c875f55 100644
--- a/fs/sysfs/file.c
+++ b/fs/sysfs/file.c
@@ -689,7 +689,6 @@ int sysfs_file_change_owner(struct kobject *kobj, const char *name, kuid_t kuid,
 
 	return error;
 }
-EXPORT_SYMBOL_GPL(sysfs_file_change_owner);
 
 /**
  *	sysfs_change_owner - change owner of the given object.
@@ -736,7 +735,6 @@ int sysfs_change_owner(struct kobject *kobj, kuid_t kuid, kgid_t kgid)
 
 	return 0;
 }
-EXPORT_SYMBOL_GPL(sysfs_change_owner);
 
 /**
  *	sysfs_emit - scnprintf equivalent, aware of PAGE_SIZE buffer.
-- 
2.53.0

