Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE5737BE8B
	for <driver-core@lists.linux.dev>; Mon, 27 Jul 2026 20:45:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785185157; cv=none; b=RE8wOZVHS/kOeleJMfx/d20i9UXFe7NVI+YlDEIDl7xxMFi7tpPCox3D/sryUg85Nz0I3H5guMS95Im6DYmomUMi4d4w/XmODmcHbZAQfmE9MdEECvZc6ojZW9bfGdZ+TuANTakYmAHrfzVBvpNSQSS2oXrWTrhYDJwPS1HO+TA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785185157; c=relaxed/simple;
	bh=JKMnFf2lPW6szBTvW8r9AUHrGh8pESlUAl8oHwfeVNo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=d0mNDDHCPSGhO4CIl1LgdvuHaaBdS9ioO+Jz0p8oF6LxzGt2YWJhorjj3Jmi2vm7H7sh7QA35dpJb/+9EyQ70VWLImqakRENHsPB/9i/BUSV6ZtcUY5OzVTrRjfIgE/3QP6ZTAEbpOdQ/02ckZLeph2BcxH0VonJmIUms2N10ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lUuNMxSP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lUuNMxSP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E79A1F00A3D;
	Mon, 27 Jul 2026 20:45:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785185156;
	bh=mJgNcHmLoThBLhJrWlYDDBoZMgtqDAzAu9M2miiO8tI=;
	h=From:To:Cc:Subject:Date;
	b=lUuNMxSPg+ElwyV0/u6hz7cOSc14zpqd24V3RWmi09mVlMgSv4sLWwR1QJToQBGXU
	 z4RBQeMj5Lsrl4LQugG4rx5ELs89iJxCZc6AzADQlzsdB8QQwED9r8QyksN41QL1sg
	 /ZowA2IADD+UhXuq0wYEvYzyDygoQ6L5HXiERSs4+pcd9W9YCAJZODKDm0I0ZX8+bT
	 sbuxmo31QQgal8OJG0LDL8yMVOFF77HbUlUNqainpgrAFpVg53Lw/LDwYCc9sPG1Tx
	 zDV6mGFJAt48eFTKFBuXNB2UxCtR5XyMfWthKK+e3r2GmmLWO98mxIHC1Lwys0BiZ/
	 EKcd5z6ZHxbFQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	lee@kernel.org
Cc: driver-core@lists.linux.dev
Subject: [PATCH] MAINTAINERS: add sys_soc.h to DRIVER CORE
Date: Mon, 27 Jul 2026 22:45:36 +0200
Message-ID: <20260727204543.2286472-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The sys_soc.h header was never added to the DRIVER CORE MAINTAINERS
entry when the SoC bus was introduced. Add it now.

Fixes: 74d1d82cdaae ("drivers/base: add bus for System-on-Chip devices")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8034273de98b..1b5369f177ae 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7902,6 +7902,7 @@ F:	include/linux/fwnode.h
 F:	include/linux/kobj*
 F:	include/linux/ksysfs.h
 F:	include/linux/property.h
+F:	include/linux/sys_soc.h
 F:	include/linux/sysfs.h
 F:	kernel/ksysfs.c
 F:	lib/kobj*
-- 
2.55.0

