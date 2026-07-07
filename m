Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87BE5434E40
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 16:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443403; cv=none; b=nlV4Azq02ajRQC0rJMzDEnfWB0kCzS24lVa9zIT9/b9FdbzaUnaHGVTR6TjwIDfjQNBGtYsDNxmmfyWcRp0oc4DLW85Opnis35Ed0ZtEku+Otx05vEiHU+KYDv2FQ9+QKCvsBbDiDClEMSsoguOipiG9ukSVZYZqf+NzwVSKHfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443403; c=relaxed/simple;
	bh=4bMgjNc8gIHGY90/412lJWaVmD7cPhaK4fkRDTm2OVA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oZhkzQLDBs+/dr5eFX2iyerD77nzJFKXiHa1EpO4SWhhgLiaciDbT8pYiABXd6oGrsjvmezRZQ1LZtTrx+ANsPQPjHNU7QPiZZCSP/E2Ilwgsi+5FdMRwQTeDJUx5VDCS0sMJ6yXTUv1BlexD1dPGHC7nqusPXhA3taS5oMS+VQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=SLo1pDah; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="SLo1pDah"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783443398;
	bh=4bMgjNc8gIHGY90/412lJWaVmD7cPhaK4fkRDTm2OVA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=SLo1pDah6ITh9DMfhkSxB2kB+JiI31Z/44ghrua4YVaHVzw5st9dnKnIiDadMNT+E
	 lM6hu+2wA0ouSgipRnWRoGQoHhVM1iIBAejguK+ZLHNzSwdgGjZ0gUKPszfXqA1/cd
	 6nQ/L+K9qlyZJey/EBnpRG2pLsP2XxeM3ckj+p3s=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 Jul 2026 18:56:33 +0200
Subject: [PATCH v2 2/4] samples/kobject: Switch to the new __KOBJ_ATTR()
 macro
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-sysfs-const-attr-kobj-attr-prep-v2-2-35ae1bc0f9ef@weissschuh.net>
References: <20260707-sysfs-const-attr-kobj-attr-prep-v2-0-35ae1bc0f9ef@weissschuh.net>
In-Reply-To: <20260707-sysfs-const-attr-kobj-attr-prep-v2-0-35ae1bc0f9ef@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783443398; l=1249;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=4bMgjNc8gIHGY90/412lJWaVmD7cPhaK4fkRDTm2OVA=;
 b=Zjj1KOuxT8RJ+xistbzRF1W0YkKQtcdn3oSBDavyLdYnscS1IeviCCVXpobSqSDKeaWrifC1b
 nvyLAzw3QNbAItkB+2PH05P5DGDj4wqTdzh6MRSp8pCM9nBdDlFwo3I
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
2.55.0

