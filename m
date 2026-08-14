Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com [209.85.218.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EFE350A0F
	for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 21:01:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.70
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786741278; cv=none; b=PbOgmWLmSlDzLof7ktyPEUJWp5kyg6f+wRRpJee7BDwF1naK8gE5kFUGqoOqy+olABr8omGAU2rDs/VLUsUKxH6eKj/Scd8DK4DT0BOpKdN5jb81NsHZEFB2cyrzReYpBoqi3x8Iq+XNXHcFU58CPFLeLy+XXfaDRbiau8Nybg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786741278; c=relaxed/simple;
	bh=aTDo7K5yfUTVx+oOHJM4HYcYLv6twqXtO1fJdJ8qHcI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=JJ1WJBZP/2MLDjSPdnNpU90qXoHJ9GVb4j5OHp754xb/ED3JJp5vBouV98kURorM9EBEsNCfKetHg7I9u0UvOkv0OD2ewAdXzk/JuNLsgQs6GezRVl8+k+cdHJu1aq+657vujmpOSOT0ZD3btWLCstc4n/Z0yMHArfF4Nl4a5lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mG38mNDG; arc=none smtp.client-ip=209.85.218.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mG38mNDG"
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c1c25c44d15so150760266b.1
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 14:01:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786741263; x=1787346063; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MLg3iB6Pagz28XpVaRBy9ZM+C4ap5o/b/rz1etSQnGM=;
        b=mG38mNDG3IxKEcMmeYJeJaXsLom51DsfM7ahP8S+SylYQwbhBhyQa3BxNl9vLQ/c9T
         5T8SrBXaRdnPbNDceGmHsoinkL8P4yKockPPhf/QanaFkoHCm2rpZvilzGC9EsZzs+Yi
         VauBQgYWEEfqFnD/aG66T0pwBZ4b4vlgpjmBuoENqRUZdbyfpstXC2v8vCUoMjm3aKB7
         JEiedD3OqiOFoJZbc5ACLcOWEtPjTtXhY4kZxGroZNV03+WpJen2WMQT7DjmnUjCuhPH
         ZmCY7IJnPBcOh+ic6fvtpa5XsFCWxrjMakW+H+Uh2FhDZ2v7th1o1zSe0j+7IUdF8wkw
         ymAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786741263; x=1787346063;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MLg3iB6Pagz28XpVaRBy9ZM+C4ap5o/b/rz1etSQnGM=;
        b=tPxBCJ/RddHWrtBWu7iJDM9GqaLeFynWuwkH4Y+Saxv8CjwS0VUNSyuhVchxuTqYMM
         684+5PRh1hE9gwkTGt+2nHoU38BAGLalDmIwMKl+6rtnNr+CQyG0XmNM3ji2/V1IumU/
         E2iD/d+EyzJq6AZO9oPsoCiSnZA9E5JMnhv8vRgcXpkpoznvG8Ef3a7imVUv3DaTq1uS
         rchfmXMjqcPml5o4AZ1yF5wXe/TPFrhdqGSxb+bbhSLC8kZQAI1ZhV9OCAH/9H3OK2a8
         CAm8VQuzj6fbOUSaAWgIU6BkQorfIdBfVuI2NmpipQZvpIFuhIzLeMIX4Mv1d/PxiKl4
         15lQ==
X-Forwarded-Encrypted: i=1; AHgh+RrhQjKCP1DDp2Ylsz0T19Qhe+jMPnTJ+oavWRwUAffwIFwZQ0jfk8WeiLY2hBfQTDB0aKA2SWRXVSbA8A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxvqAKR12EuBMtVq8dUjjXQKT2IzUAbTqHY27v2nEFODvy5xeHK
	Gi1wwXYXQAYx5H4lL75HO3YNylich3VSYf4YC8ST4qhB4++1EaIxyGklk5T2FCFFFcaGHDPV/VI
	2zK/7H9ZIaYCCQ68F4g==
X-Received: from ejcyh20.prod.google.com ([2002:a17:907:e894:b0:c20:282e:ae3d])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:906:99c1:b0:c15:a487:3482 with SMTP id a640c23a62f3a-c212a8f7432mr355541166b.21.1786741262708;
 Fri, 14 Aug 2026 14:01:02 -0700 (PDT)
Date: Fri, 14 Aug 2026 21:00:57 +0000
In-Reply-To: <20260814210057.4102768-1-tarunsahu@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260814210057.4102768-1-tarunsahu@google.com>
X-Mailer: git-send-email 2.55.0.691.gc56d675ccc-goog
Message-ID: <20260814210057.4102768-4-tarunsahu@google.com>
Subject: [PATCH v3 3/3] powerpc/ps3: use put_device() on device_register()
 failure in ps3_system_bus_device_register
From: Tarun Sahu <tarunsahu@google.com>
To: helgaas@kernel.org, dmatlack@google.com, 
	Nicholas Piggin <npiggin@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	sourabhjain@linux.ibm.com, "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, 
	Pasha Tatashin <pasha.tatashin@soleen.com>, Russell King <linux@armlinux.org.uk>, radheys@amd.com, 
	skhawaja@google.com, djeffery@redhat.com, Geoff Levand <geoff@infradead.org>, 
	Madhavan Srinivasan <maddy@linux.ibm.com>, Michael Ellerman <mpe@ellerman.id.au>
Cc: linux-arm-kernel@lists.infradead.org, souravsgl@google.com, 
	linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Tarun Sahu <tarunsahu@google.com>
Content-Type: text/plain; charset="UTF-8"

As per the kernel documentation of device_register() function, it is
important to call put_device even if device_register returns an error.

To follow this guidelines and properly release the resources after
device_register() failure, call put_device() instead of kfree()

Also there are in-function-defined struct layout which make struct device
(core) to be child of layout-child's member (layout.dev.core). Also
definition of struct layout is not unique across functions in the driver.
To be able to free struct layout's dynamic allocation via put_device we
need to make sure that the core's release function must call the free
on parent of core and the parent must be at the location 0 of the struct
layout which will inherently free struct layout. This is to not
complicate the code and keep it as it currently implemented. To check
the location of parent at 0 of struct layout, I have added BUILD_BUG_ON.

Signed-off-by: Tarun Sahu <tarunsahu@google.com>
Reviewed-by: Sourabh Jain <sourabhjain@linux.ibm.com>
---
 arch/powerpc/platforms/ps3/device-init.c | 83 ++++++++++++++----------
 arch/powerpc/platforms/ps3/system-bus.c  |  2 +
 2 files changed, 52 insertions(+), 33 deletions(-)

diff --git a/arch/powerpc/platforms/ps3/device-init.c b/arch/powerpc/platforms/ps3/device-init.c
index 9109c218a060..8d0c77db1764 100644
--- a/arch/powerpc/platforms/ps3/device-init.c
+++ b/arch/powerpc/platforms/ps3/device-init.c
@@ -90,14 +90,12 @@ static int __init ps3_register_lpm_devices(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
 
-
-fail_register:
 fail_rights:
 fail_read_repo:
 	kfree(dev);
@@ -121,6 +119,12 @@ static int __init ps3_setup_gelic_device(
 		struct ps3_dma_region d_region;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	BUG_ON(repo->bus_type != PS3_BUS_TYPE_SB);
@@ -164,13 +168,12 @@ static int __init ps3_setup_gelic_device(
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return result;
 
-fail_device_register:
 fail_dma_init:
 fail_find_interrupt:
 	kfree(p);
@@ -192,6 +195,12 @@ static int __init ps3_setup_uhc_device(
 	u64 bus_addr;
 	u64 len;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	BUG_ON(repo->bus_type != PS3_BUS_TYPE_SB);
@@ -252,13 +261,12 @@ static int __init ps3_setup_uhc_device(
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return result;
 
-fail_device_register:
 fail_mmio_init:
 fail_dma_init:
 fail_find_reg:
@@ -291,6 +299,12 @@ static int __init ps3_setup_vuart_device(enum ps3_match_id match_id,
 		struct ps3_system_bus_device dev;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d: match_id %u, port %u\n", __func__, __LINE__,
 		match_id, port_number);
 
@@ -308,15 +322,10 @@ static int __init ps3_setup_vuart_device(enum ps3_match_id match_id,
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d fail\n", __func__, __LINE__);
-	return result;
 }
 
 static int ps3_setup_storage_dev(const struct ps3_repository_device *repo,
@@ -327,6 +336,12 @@ static int ps3_setup_storage_dev(const struct ps3_repository_device *repo,
 	u64 port, blk_size, num_blocks;
 	unsigned int num_regions, i;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->sbd).
+	 * sbd must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct ps3_storage_device, sbd) != 0);
+
 	pr_debug(" -> %s:%u: match_id %u\n", __func__, __LINE__, match_id);
 
 	result = ps3_repository_read_stor_dev_info(repo->bus_index,
@@ -395,13 +410,12 @@ static int ps3_setup_storage_dev(const struct ps3_repository_device *repo,
 	if (result) {
 		pr_debug("%s:%u ps3_system_bus_device_register failed\n",
 			 __func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%u\n", __func__, __LINE__);
 	return 0;
 
-fail_device_register:
 fail_read_region:
 fail_find_interrupt:
 	kfree(p);
@@ -445,6 +459,12 @@ static int __init ps3_register_sound_devices(void)
 		struct ps3_mmio_region m_region;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	p = kzalloc_obj(*p);
@@ -461,15 +481,10 @@ static int __init ps3_register_sound_devices(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d failed\n", __func__, __LINE__);
-	return result;
 }
 
 static int __init ps3_register_graphics_devices(void)
@@ -479,6 +494,12 @@ static int __init ps3_register_graphics_devices(void)
 		struct ps3_system_bus_device dev;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	p = kzalloc_obj(struct layout);
@@ -495,16 +516,11 @@ static int __init ps3_register_graphics_devices(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d failed\n", __func__, __LINE__);
-	return result;
 }
 
 static int __init ps3_register_ramdisk_device(void)
@@ -514,6 +530,12 @@ static int __init ps3_register_ramdisk_device(void)
 		struct ps3_system_bus_device dev;
 	} *p;
 
+	/*
+	 * ps3_system_bus_release_device() calls kfree(&p->dev).
+	 * dev must be at offset 0 so kfree() frees outer p.
+	 */
+	BUILD_BUG_ON(offsetof(struct layout, dev) != 0);
+
 	pr_debug(" -> %s:%d\n", __func__, __LINE__);
 
 	p = kzalloc_obj(struct layout);
@@ -530,16 +552,11 @@ static int __init ps3_register_ramdisk_device(void)
 	if (result) {
 		pr_debug("%s:%d ps3_system_bus_device_register failed\n",
 			__func__, __LINE__);
-		goto fail_device_register;
+		return result;
 	}
 
 	pr_debug(" <- %s:%d\n", __func__, __LINE__);
 	return 0;
-
-fail_device_register:
-	kfree(p);
-	pr_debug(" <- %s:%d failed\n", __func__, __LINE__);
-	return result;
 }
 
 /**
diff --git a/arch/powerpc/platforms/ps3/system-bus.c b/arch/powerpc/platforms/ps3/system-bus.c
index 0537a678a32f..0918c74d3e19 100644
--- a/arch/powerpc/platforms/ps3/system-bus.c
+++ b/arch/powerpc/platforms/ps3/system-bus.c
@@ -774,6 +774,8 @@ int ps3_system_bus_device_register(struct ps3_system_bus_device *dev)
 	pr_debug("%s:%d add %s\n", __func__, __LINE__, dev_name(&dev->core));
 
 	result = device_register(&dev->core);
+	if (result)
+		put_device(&dev->core);
 	return result;
 }
 
-- 
2.55.0.691.gc56d675ccc-goog

