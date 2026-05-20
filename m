Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99BF923EA8A;
	Wed, 20 May 2026 13:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282304; cv=none; b=Vgfw0LsF9KF/FAX4q+yUY2/8+YJmmjWR09F8G3hnreI48MVDHPl9Mcp4VJV1cBo82WoE+DAPxj2vCQhAK2hTyMBm2BztAQ6wL4tHKWdN97XA+B+Xm3wcoUZOHSwk96pINfFuWm4x0GTdE2jheV05w/YueNsOxdlwc18ibkGl45g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282304; c=relaxed/simple;
	bh=QcTRMkgf6GDPVr/lq7Z7HjgtguFN5rPPFtI2RzMTOmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=EuUvrG5zX3eeUAK6vsq67K1sfLFvgd9zFeDpHd+/ltgTn2h+g8WBO2w7LbT8uiEk7sFTMmgxnNgmKjd8k+qjH0beHc9ExcIIu2dvrdercuQ+OfqZ3GPXaz5mbefnOnAX+pM4Mdc2QeSOYe4AlphGWDdLWJQv5+FNgAJQdXZrwbM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=htQP+2ee; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="htQP+2ee"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B487D1F00893;
	Wed, 20 May 2026 13:05:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779282303;
	bh=kmSaevCXUbHkWIumj2Pus32oK4gxGKikB1RCiT1h21M=;
	h=From:To:Cc:Subject:Date;
	b=htQP+2eer2VrviyVAbQ6VQiK6O5PYQnrnP4LATTp6ZSXxmW6fZWfY4kCRyK86tirw
	 5XYuaDtsg+PsKeUxtMfBgv3GeVaAcY0crY934tEx/lslVxaYscK25QxzcjWYilt9r7
	 VI1N/HZxG7H8Zz+xOk9/CVlBI8XIltoN++K+DawU=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	stable <stable@kernel.org>
Subject: [PATCH] sysfs: don't remove existing directory on update failure
Date: Wed, 20 May 2026 15:05:04 +0200
Message-ID: <2026052003-uniquely-hastily-c093@gregkh>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=QcTRMkgf6GDPVr/lq7Z7HjgtguFN5rPPFtI2RzMTOmM=; b=owGbwMvMwCRo6H6F97bub03G02pJDFm8G+uzIhcUMCmtKrxf2q4RrPA7TfWH3zSdC+/d2xd47 Q31nbu6I5aFQZCJQVZMkeXLNp6j+ysOKXoZ2p6GmcPKBDKEgYtTACZyU5Fhvr8ST3gym96b2VHN SZOfP3qnf9tyG8OCnveem1RDbB7/3i9cUVf2zFVQ+50pAA==
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

When sysfs_update_group() is called for a named group and create_files()
fails (e.g. -ENOMEM), internal_create_group() calls kernfs_remove(kn) on
the group directory.  In the update path, kn was obtained via
kernfs_find_and_get() and refers to a directory that already existed
before this call.  Removing it silently destroys a sysfs group that the
caller did not create.

Only remove the directory if we created it ourselves.  On update failure
the directory remains as it is left empty by remove_files() inside
create_files(), but can be repopulated by a retry.

Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Rajat Jain <rajatja@google.com>
Fixes: c855cf2759d2 ("sysfs: Fix internal_create_group() for named group updates")
Cc: stable <stable@kernel.org>
Assisted-by: gkh_clanker_t1000
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 fs/sysfs/group.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 182e54e575ee..4e1e4f18a166 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -188,7 +188,7 @@ static int internal_create_group(struct kobject *kobj, int update,
 	kernfs_get(kn);
 	error = create_files(kn, kobj, uid, gid, grp, update);
 	if (error) {
-		if (grp->name)
+		if (grp->name && !update)
 			kernfs_remove(kn);
 	}
 	kernfs_put(kn);
-- 
2.54.0

