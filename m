Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870913557F3
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073007; cv=none; b=ETz9R1K0vzJPkz1awTbXn120DJhKqGC+F1HN1SBicY5bS7NZ0t69asP7l2n9WbhRNnyLfmMIeFOl14CNZgIFIpf8JYAjU+DsV9YzWsICdlNsQklQTa0fRE6kdqOUUViL8IVAomiNeBcXsXQ7zjsAj1gt1IkSl516tqItavZUDLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073007; c=relaxed/simple;
	bh=0jdoVvsiy+3iO+1EH4Z841U/PFxRlh9TASBGeYW6VOo=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=uW/jNLmnvbO59KsJnBMnGCteFl322cjO8SBWCuoH8AjFn3fOJvpMP9Vu2RM2+yZYhCSav9Nwdblny9yRZnZ0/KBtRJE8gNrFL0IM1IjFwjuftE+kJKJCKVZlGeqlilJduY9uqJKf5D8uisYUT4RMmmnwli+yy/t64cDnPH0ndWs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=XKoods/i; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="XKoods/i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780073004;
	bh=0jdoVvsiy+3iO+1EH4Z841U/PFxRlh9TASBGeYW6VOo=;
	h=From:Subject:Date:To:Cc:From;
	b=XKoods/iwGtFcfujq+xDUCWEe2Bo4JgOAyA+0Obvo2Cn5cIr2UiLQV1h/VVN2OEy9
	 jSrBiLIKbZUseJeaU+bFHh8OG7jf7/qHRQN5j1imiK9BJ5ZsH/3NXNSSmksFv1NaRd
	 YAtJn3shtBiy7rWDZCi97jg4SB5vgGaneudaM/Uc=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Subject: [PATCH 0/4] kobject: Allow the constification of kobject
 attributes
Date: Fri, 29 May 2026 18:43:21 +0200
Message-Id: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2NwQ6CMBBEf4Xs2U2gphr8FeOhlK0uJi3uFqIh/
 LtVuM2bvMwsoCRMCpdqAaGZlVMs0Bwq8A8X74TcFwZTm1NtjUX9aFD0KWpGl7PgM3XDlkahEVt
 n+7Npm2MggrJSysDv/8P1trFO3UA+/2Z3Q+g1leu8a+v6BXPF/nmYAAAA
X-Change-ID: 20260525-sysfs-const-attr-kobj-attr-prep-9a5d72913fee
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780073003; l=1040;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=0jdoVvsiy+3iO+1EH4Z841U/PFxRlh9TASBGeYW6VOo=;
 b=Zgm0rduZZqsHM7iYObQpKevq+CAcRIfFcwS4Wv6PKySDp0RHc3iz3BE6aqCdBS7Mkq3BczsUK
 5kY5m+xgt4yD5uj/heP5GkvHw61Mg5DB0l1Y94cw3qW5oSetiOlzCPs
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Allow kobject attribute to reside in read-only memory.
Both const and non-const attributes are handled by the utility macros
and attributes can be migrated one-by-one.

This is the last preparation step to enable the constification of all
attributes throughout the tree.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
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
base-commit: 56785dcb2ef6d3cff82ac33f2e34db94377416a3
change-id: 20260525-sysfs-const-attr-kobj-attr-prep-9a5d72913fee

Best regards,
--  
Thomas Weißschuh <linux@weissschuh.net>

