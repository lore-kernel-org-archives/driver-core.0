Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87B523EBF36
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443401; cv=none; b=B65mCNj/oeRwTnUWYSwUblMLZ8M8cUeGoFhCwEE1qhkBak4nWdHeXjMBusbQza7mbSFpKZP1VO3qM4KiKzRCI17Hd1SC6I74QufC2OyNMEc5qOELDgF5h4owBTL+VLlLUwpXf5hKN+ZtI3oPx6ytBu/J06RB66HuMBUcowgJ0aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443401; c=relaxed/simple;
	bh=A7GPUfDtUHRyfUqE3i10vylF1Oab77ZNpKeGGp+6l60=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Wmr4O9oV4XznmBMyonk48WlR4H+bGd9wX00/OZTFrNdbTa7vUXt7T1pJ39wfHvDF0eanFYg7XKGn+MWF3ui6xIOGFZnj4bOv8vUGWUDwyG/XwsIM+bfZM+eBR5BEU1i/2vD4cZe+R21gClJiWaiMoKsj/EK/s6IPsgGc8PMPwkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=kBlJb38N; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="kBlJb38N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783443398;
	bh=A7GPUfDtUHRyfUqE3i10vylF1Oab77ZNpKeGGp+6l60=;
	h=From:Subject:Date:To:Cc:From;
	b=kBlJb38NLT/v0nyaJGsdyNKr3OYFCIMv2p6f9XnbRqRrEuWR8L5fa7Yj5+jehc2ok
	 3ffERrmDxjuoXg55eXc/ulZPwNalKMAOfEuaKJay5DMImp0Ea/erIUDxuj5uTIflw9
	 oLpF4xRTBUiypHiq5X9wrqx4freQmFH00toPKHOM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/4] kobject: Allow the constification of kobject
 attributes
Date: Tue, 07 Jul 2026 18:56:31 +0200
Message-Id: <20260707-sysfs-const-attr-kobj-attr-prep-v2-0-35ae1bc0f9ef@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/4WOQQ6CMBREr0K6tgZKCuLKexgWbfnYYtJif0EJ4
 e4W0Lh0N28ymZmZIHgDSM7JTDyMBo2zEdghIUoLewNqmsiEpaxIOeMUJ2yRKmcxUBGCp3cnu13
 1HnpaCd6UrMryFoDElmi25rUtXOudcZAdqLDWfhIeHkOcDr+YNhicn7ZfY7a63wvV3wtjRlNaQ
 lGUUuRSnvjlCQYRlR700UIg9bIsbwiu4hH6AAAA
X-Change-ID: 20260525-sysfs-const-attr-kobj-attr-prep-9a5d72913fee
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783443398; l=1394;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=A7GPUfDtUHRyfUqE3i10vylF1Oab77ZNpKeGGp+6l60=;
 b=xBByzi+uQwr7us4p0LsHSissan3/h8RDO8bSBa8S7j+7Gl2regHfxJ0tDxEnOWs9fbvCh9cRv
 ZUT5/olsZHpDiQHqVmjCF3Ok4OXDXVMJQlfax9E++B3P74/cSl0cTq6
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow kobject attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
Changes in v2:
- Fix the definition of __KOBJ_ATTR_RO_MODE()
- Rebase on v7.2-rc1
- Link to v1: https://patch.msgid.link/20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org

---
Thomas Weißschuh (4):
      kobject: Provide macros to initialize 'struct kobj_attribute'
      samples/kobject: Switch to the new __KOBJ_ATTR() macro
      kobject: Allow the constification of kobject attributes
      samples/kobject: Constify kobject attributes

 include/linux/kobject.h           | 75 ++++++++++++++++++++++++++++++++++++---
 lib/kobject.c                     |  8 +++--
 samples/kobject/kobject-example.c | 24 ++++++-------
 3 files changed, 89 insertions(+), 18 deletions(-)
---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260525-sysfs-const-attr-kobj-attr-prep-9a5d72913fee

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

