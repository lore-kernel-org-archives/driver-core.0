Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87136367B63
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073008; cv=none; b=mAa6NPYsuhziyQaoYB8S+wJLURm0y9l9Nz9c1Pl39UfNeMtrFWrP/hzyMfRSDhXXmy37CitIkezAOMtbRwCwcVgTVv9LSOBwtUiyLKlyOFgsZ7Pi90a18BTrHMzXu+/DDf7N4couf2u03SgkLGug5nrxPMfKhRHAn+LqtNty/Eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073008; c=relaxed/simple;
	bh=UpJEjdW7e+Vs5I6IEAp6beaEYGVO5R99giEVIWQd2gY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eRlY7GOjMWUbibs/QZyq2Gc0iIYVGqiQgv1jrL5PWRsZ2+CkHU6rzucsSxjQs2+veh5WKx2skVPkmRYcM3CFxspdgSZpo+46rKwuJ97YCEEr+65/T61OkoL6vgM0q6IodNKBDY+4f0wXz9XNI2+9tTMkHzsSDD35XjC4LUHlE00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=E3CQEeuy; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="E3CQEeuy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780073004;
	bh=UpJEjdW7e+Vs5I6IEAp6beaEYGVO5R99giEVIWQd2gY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=E3CQEeuy0Crlg1Q9n7HoNOoEGrRZJOWmimqd5NCExqVC4pKLolKb1FE8g8nzDXFlF
	 1ybanALk9xUG4TP5A5RfylDrWCq+1PPYVNnbcgevY0qHY8itGXRjzGYTpfpsFCdJWq
	 8kwo0GOmx1kaUADEaADzr3oropPFWXb2nJ6jpY3w=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 18:43:23 +0200
Subject: [PATCH 2/4] samples/kobject: Switch to the new __KOBJ_ATTR() macro
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-sysfs-const-attr-kobj-attr-prep-v1-2-7e667ba3bb85@weissschuh.net>
References: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
In-Reply-To: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780073003; l=1249;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=UpJEjdW7e+Vs5I6IEAp6beaEYGVO5R99giEVIWQd2gY=;
 b=vfuOIkVY3LhMODM5axtu6fVPWg8XwSiWlMaL0LcbMkBvOz6TNl++J4nVdq3M4WIvCOJhbX6W8
 +/g96PQ0S74AZle3uV/Bu181Aqqd1hZnF8M6eqLOl7chyRkrzcZzpAU
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

To demonstrate and test the upcoming 'const struct kobj_attribute'
handling, convert the sample to the new macro.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 samples/kobject/kobject-example.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/samples/kobject/kobject-example.c b/samples/kobject/kobject-example.c
index 36d87ca0bee2..7404f310dc45 100644
--- a/samples/kobject/kobject-example.c
+++ b/samples/kobject/kobject-example.c
@@ -45,7 +45,7 @@ static ssize_t foo_store(struct kobject *kobj, struct kobj_attribute *attr,
 
 /* Sysfs attributes cannot be world-writable. */
 static struct kobj_attribute foo_attribute =
-	__ATTR(foo, 0664, foo_show, foo_store);
+	__KOBJ_ATTR(foo, 0664, foo_show, foo_store);
 
 /*
  * More complex function where we determine which variable is being accessed by
@@ -80,9 +80,9 @@ static ssize_t b_store(struct kobject *kobj, struct kobj_attribute *attr,
 }
 
 static struct kobj_attribute baz_attribute =
-	__ATTR(baz, 0664, b_show, b_store);
+	__KOBJ_ATTR(baz, 0664, b_show, b_store);
 static struct kobj_attribute bar_attribute =
-	__ATTR(bar, 0664, b_show, b_store);
+	__KOBJ_ATTR(bar, 0664, b_show, b_store);
 
 
 /*

-- 
2.54.0

