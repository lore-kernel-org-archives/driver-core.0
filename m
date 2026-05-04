Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44D131DC9B3
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 05:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777872838; cv=none; b=QKtNLpoMaDIVimbH99eLJzFkUYRN6aBSaq+h/qxiKoXZvvMcLfCApge4A3UX3jxgTobJbor63xStzf0lzoq90Ij2sqdOsydl1E2C9QC+JsWTkr90gwbqQfBCYA1JycUT0mA2jdgloIQeh90JZ500RDF9PH6yG6eoB1bgElPXWcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777872838; c=relaxed/simple;
	bh=KT6RyGKYPD94txSMGJk+5GV3ZGnAx4FH0MjqL4ACoTc=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=FJgpOg4jbmiX84WZa0C3dgxOjIny2a/VfSVqd7MLsO6WDXWCvKCrb+7LM/eyNblzrZNdGK5ivjFHB7GD2idOZhCRj7vOEiOq/m0b5BDRaM4k5hqtKhTYDLD2oN25Y5DvRbyULMockWY8ee6otkyWV6hCpDM6uuL95En8NUAK6ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=D2Ugx73G; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="D2Ugx73G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1777872835;
	bh=KT6RyGKYPD94txSMGJk+5GV3ZGnAx4FH0MjqL4ACoTc=;
	h=From:Subject:Date:To:Cc:From;
	b=D2Ugx73GSpN/sIAlYopqUOZz+sRugcSGAOy284qp/dVGyyyAZ9dtj51TX9t37CeD+
	 jJoOvVz+ortBsm04zhB+pAjXuEkB1w267fN6DVjOFwB+ODNuKgObCxUeP5yOzgisWU
	 zA0LLy/+AJCGAimUoWqEh4ujLiCsB0fAC3eyJ2cU=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH v2 0/5] driver core: Allow the constification of device
 attributes
Date: Mon, 04 May 2026 07:33:49 +0200
Message-Id: <20260504-sysfs-const-attr-device_attr-prep-v2-0-79d291cb3071@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/5WOwQ6CMBBEf4X07JrSNmI98R+GGChbWw+FdAtKC
 P9uwS/wNm8yO7MrI4weid2KlUWcPfkhZBCnghnXhieC7zMzwcWFK34FWsgSmCFQgjalCH2+Mvg
 49BhxBK2r0nZKSd23LPdk0/rPsXFvfkxT90KT9uI94TylIS7HE3O55/7Zm0vgIKTQUtmq6qSp3
 +iJyLjJnQMm1mzb9gVr3ckX6QAAAA==
X-Change-ID: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777872834; l=1720;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=KT6RyGKYPD94txSMGJk+5GV3ZGnAx4FH0MjqL4ACoTc=;
 b=kIcUaRV5cILINVGY73XoyJEE6XHfbBT99PdsD9170UJLDWG0UhzGObHYOjG3lcaf+AdNSlTTv
 Zm92XRVHnnlCJ4sdujq56LtOCIQoZ8/SkWcvhb+I1BzvYu/Kz33hQ74
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow device attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

My goal is to migrate all sysfs attribute of a given driver or subsystem
at once to avoid code churn through. To do that all sysfs features the
subsystem uses need to be const-compatible. Which means that the
migration of device attributes and is_visible() are happening
concurrently.

After device attributes only kobject attributes are missing for a full
conversion.

---
Changes in v2:
- Rebase on v7.1-rc1
- Extend cover letter a bit
- Link to v1: https://patch.msgid.link/20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Signed-of-by: Thomas Weißschuh <linux@weissschuh.net>

---
Thomas Weißschuh (5):
      driver core: Delete DEVICE_ATTR_PREALLOC()
      driver core: Add low-level macros for device attributes
      driver core: stop using generic sysfs macros for device attributes
      driver core: Allow the constification of device attributes
      driver core: Constify core device attributes

 drivers/base/core.c    |  50 ++++++++++----------
 include/linux/device.h | 122 +++++++++++++++++++++++++++++++++++++------------
 2 files changed, 121 insertions(+), 51 deletions(-)
---
base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
change-id: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

