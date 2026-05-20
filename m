Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBE93438BA;
	Wed, 20 May 2026 13:06:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779282361; cv=none; b=ebpZYIHqBJASz8GbB0NmYXIZW8jChYyRL8yfrgTHmGaUWEuc4Ssb5QGGTMDuCu4tWoZ5fiINydpCXnwSfb/9MKQcL55wL4eduJXO4rNJvNSJ0OoaVgJ9uswNVKJy58v3y9SfAUto0+mzLoKJIzyaj7qaF2zgvhYmsBmpyzBggAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779282361; c=relaxed/simple;
	bh=QcTRMkgf6GDPVr/lq7Z7HjgtguFN5rPPFtI2RzMTOmM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O4qHdzdXLeD2X51Gli/Zp+yiKVWo/dyr10qMvZfoAaLqPgM+8DBbwyTsjcVBYvV4o31N2e7F7h9nRzqsLsY1CV1rlNQLPfKiwjLtAoq3Kju71JWaI7PwaTz2jwIuEh1eD0fOc/VHmSKA2NK8oe38t78T9KwAFXxeRZTssxV3WTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=WgHbB2C8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="WgHbB2C8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE7A71F000E9;
	Wed, 20 May 2026 13:05:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1779282360;
	bh=kmSaevCXUbHkWIumj2Pus32oK4gxGKikB1RCiT1h21M=;
	h=From:To:Cc:Subject:Date;
	b=WgHbB2C8bPn2/ML1UcZlrkoT5icrYKPTkdiyjtK/mSExUxXNI/yJ8WIBCsais66JZ
	 vhSvH9NOXbOtWtGVxTImNPmfRUm5sKeoVY+qTiIHGd14dIFySdsAmLCN7cJJVSqKSY
	 E26zyWOrohSowRQaP4UJuM2p2GDRxx9rQ/RPVzTQ=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rajat Jain <rajatja@google.com>,
	stable <stable@kernel.org>
Subject: [PATCH] sysfs: don't remove existing directory on update failure
Date: Wed, 20 May 2026 15:06:03 +0200
Message-ID: <2026052002-overexert-control-f130@gregkh>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1421; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=QcTRMkgf6GDPVr/lq7Z7HjgtguFN5rPPFtI2RzMTOmM=; b=owGbwMvMwCRo6H6F97bub03G02pJDFm8G3e1seQvuPTb52qHw7NPE/vXZvHM0tQI5u7lOrMun Ef+y5Z/HbEsDIJMDLJiiixftvEc3V9xSNHL0PY0zBxWJpAhDFycAjCRHU0M80wnpv2P9S864KP9 vWPf3kN3fpbY3GWY7xMxL8nuu81Uo6JXXfM92rzWXHJqAwA=
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

