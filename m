Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A933E3783BB
	for <driver-core@lists.linux.dev>; Wed,  8 Apr 2026 19:30:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676653; cv=none; b=pYEg+w/VL6eul+R68HM246UzU+tNyCoPUBbs61/Bo0Eyel759SXRvpDyvIaIYJZ7nfO3wgT8HeOIsG7nu/W90qNQng9N9RrV061V8bCttVLWBBcRMcBGXdvg9dYmNbkeLpKHjI0B9LTxamsAjsRxUzsgYBXCB5G0UKFXM/UaNKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676653; c=relaxed/simple;
	bh=5pnI5v/oV9DOvgdwAwXfbe807v5uOc0Eg13ANIxcJ5k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=GrV0266TdDwnhbwJR0JmUDVS6RMJP5Zpy6TSWT7htLTLegNYPTEei9SC6qy3bnYzfLRjqqPU05nIrq7hsdgZDIe6IjlYG+YiOiGgVQfUVeecwIk2IBB8BRoGPCYNhXHMvducC1qyjASPWJI3YFw1Gme9wh3KQJmyHLZ0QbJjWrw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=JyoJwxt0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="JyoJwxt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775676649;
	bh=5pnI5v/oV9DOvgdwAwXfbe807v5uOc0Eg13ANIxcJ5k=;
	h=From:Subject:Date:To:Cc:From;
	b=JyoJwxt0vMj/rK78c4r2zCRPnE6FiWdnhTdx6NBgVAfyp9FhDEhPusqvuKs3nHUCJ
	 Pn17QSQCgaMYIruXLHrTSeL2AeU4f5R7JKPzNeUkvOQY5CJa4IhLQPIgLp5AFMrPDO
	 nFSfx/WoZuiMRrecLp+hOVTnukJ9i7M0Hyb8Nx+o=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/5] driver core: Allow the constification of device
 attributes
Date: Wed, 08 Apr 2026 21:30:46 +0200
Message-Id: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWNwQrCMBBEf6Xs2YW0DWr8FSklTTa6HtKSjaKU/
 rtrvc0bmDcrCBUmgUuzQqEXC89ZoT00EO4+3wg5KkNnuqOx5ozykSQY5iwVfa0Fo64CjXteCi3
 o3KlNk7W9ix7Uo2Xi9/5xHf4sz+lBof7EsG1f3frEdoUAAAA=
X-Change-ID: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775676649; l=945;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=5pnI5v/oV9DOvgdwAwXfbe807v5uOc0Eg13ANIxcJ5k=;
 b=bDvfEK/W7t6pbW4DSDT2eam8FI/JQxAdNzpAe6d3dAnSIuEHJ046ocus+S1Bbse61IE7ElPZY
 dE9aiyUML6BBHEAvDq2Gn6HHmOLBKyuobwyke/FjtYotBiBRR3fh+Cg
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow device attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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
base-commit: 6c8dfb0362732bf1e4829867a2a5239fedc592d0
change-id: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

