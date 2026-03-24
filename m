Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC945390CAF
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 16:25:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774369522; cv=none; b=BiigrReVJ4CNK9oM73HoUe45j4iQwS6L3kjL98WIZX2GCuHE2o6GQk+PhgnhnBtfeMXVXyZm0I3hVq6rc+fwnkWRzAaY02CjXdeozDRA+UdmYweeM0n2EvCVVbB53EdJn7OD/ap97bvz2z+qpYDtw6M2ILA9s8/q/rYdutCQ6LU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774369522; c=relaxed/simple;
	bh=yhN4R1wDd/73oDNMRxk7G49xgQ9prvPPOj/+PLBITnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k9XbdyBySikhAtXSKdMdY1CplEPsiSCxuw/3Nkjr7FbSwXD9UWsmpqBqdrDGwJj1B944wkISsyJrf13zPR/NKxiDyvvuZ5AL6T1PGKwu2tkiivHbsnHS+cvxZ5VBkySveNQa+/yqI+L6QvJLKgPZGDZZHVC2l8gHhE6O5idlkNE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VjpW44ss; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VjpW44ss"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2bdcf5970cdso50387eec.0
        for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 09:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774369520; x=1774974320; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1kvfrEneJK185kDtn5si+bhliaq4dUjYW/h4+n6Kuf0=;
        b=VjpW44ss1sCQ2cpvy3HAlKxIu7ZHnsJmNyBLKXRChV8zcoW53zDtfIRx50lqniRFc7
         7lWoGuWMBbI4b/tiZpUADteyvzGz8fLLsqiAeL0ZzsZ7jSXZ90X81xKAtPhPqJ3LW3ZN
         MEYaz9was8lA3UrS7KxnpHolvTGtWLw+js20LLBflxhKqthokk68YlPZw72Eqo6ODtPW
         zX1QRbMd6DhWIgYpsgvtBFJlUflijSuOt3a7hqrSnB1oFmXy8zjiDbvLzsloDB3DVW4l
         U2JTbeVF2IcbxGLmTMbSNEVZgYGWm9lSrT+wDAOiLOCsfKyH0ZIJQY+C+8PBeWcLqBZi
         dJKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774369520; x=1774974320;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1kvfrEneJK185kDtn5si+bhliaq4dUjYW/h4+n6Kuf0=;
        b=PBtfmtbB2DxK6kl+xY+5rnrr5yMBkxpFc9tuZN2OyW0wPq0pvKUNM5XLE29zTFzajC
         HJu99qymVTwyPNBxJEQdp43WbJ5lTOXf4xUsVHzCbW0JI1o9BNf4aenHgsg2xPmXvGQG
         3LjZYOqQ9ftLni6ZeHOh7T4gPLXdDIxOrh/OmKLVhIhmSSyipGbxO+gB6+coe1jzlXLz
         E9gWIoIU0eeWjAGQ95jzUCRe9ygWE8q1Ur/U0523/ArlcgD938AoAoz9r3UsjIxhPlZh
         40eCy38LfbQn8WHxQP2MZ0LzDF8k2peDogWLGjb8XwmOD6rsTf/3DJfa3mZVDchtwGET
         GugQ==
X-Forwarded-Encrypted: i=1; AJvYcCVBpiNZfEu9b8OdMBinsqROMNF10fg/00f6XMYfB4BnqsAx3TE/+mk2MrMFSNumwo+PIg/UAISwFtwPGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwRWHLbdyGX+Uinyf12XumJCQP+nViQKavUD9kTaTOIq/Yz0gN2
	iQk75jGMPZ+bxedSuln3RPKqgWxcfWw7jsPwBF1OYY2tMP4A4f5AXMDb
X-Gm-Gg: ATEYQzyFiTe+0zBckpUe5eTRUU3U24+M0Up6K2MDi48KS+ax+o+G1S00On0ZMIkyspG
	8WhhdHuHDO6rDN7j2nT4G6+8WY539ZV57gpuHUwXIYM7XEFDE30xoPS880GuS/JJWpVtYw3GCTx
	wIxH/dtS/kawt88xgTQO7cv1kHhIPUGS/bDPf5UoQ83IVvREdgl2yniNh4im3G4IqUP/H+nX7V1
	8GUqXwjzJRoQumXgNe0wbOJNJX+dwFSF4udhpv0IBh2HqLJhGQ7YcSCQySeZcsDjFYk3/3jeWfa
	vdSSbVlZdUhh43kVQX1IT1OptCP3k8ykrLmly42fOvgOXVuXRSdgB9OqY5XMBW+LtoSFDBFz7Ah
	jEF79Gq/J921/vozhD0X/UGCmXQfIYjQrPo9EWw8hOUzf8loC8LKQX9HrkgMcUHMg8fiJRqHHOV
	BszLwZNvKod2P1D9uab4gAwVU5AlCh9kyTbHb0q8sFYYBh3footAVWdsSAhMozkvtA
X-Received: by 2002:a05:7300:dc14:b0:2be:acac:af7f with SMTP id 5a478bee46e88-2c14b4c86d3mr1691207eec.7.1774369519720;
        Tue, 24 Mar 2026 09:25:19 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:a686:fd7f:70d3:9156])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b14c299sm15553433eec.6.2026.03.24.09.25.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Mar 2026 09:25:19 -0700 (PDT)
Date: Tue, 24 Mar 2026 09:25:16 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-acpi@vger.kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] software node: allow referencing software nodes by name
Message-ID: <acK6qV1Be7Wl-Yiv@google.com>
References: <acIV6xF8mY-8wd5e@google.com>
 <2026032406-recycler-device-7660@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2026032406-recycler-device-7660@gregkh>

On Tue, Mar 24, 2026 at 08:59:24AM +0100, Greg Kroah-Hartman wrote:
> 
> Do you have a follow-on patch that uses this new api anywhere?
> 

It will look like this (obviously split in 2 patches):

diff --git a/arch/x86/platform/geode/geode-common.c b/arch/x86/platform/geode/geode-common.c
index 05189c5f7d2a..ae43ca2ba4ec 100644
--- a/arch/x86/platform/geode/geode-common.c
+++ b/arch/x86/platform/geode/geode-common.c
@@ -14,10 +14,6 @@
 
 #include "geode-common.h"
 
-static const struct software_node geode_gpiochip_node = {
-	.name = "cs5535-gpio",
-};
-
 static const struct property_entry geode_gpio_keys_props[] = {
 	PROPERTY_ENTRY_U32("poll-interval", 20),
 	{ }
@@ -42,7 +38,6 @@ static const struct software_node geode_restart_key_node = {
 };
 
 static const struct software_node *geode_gpio_keys_swnodes[] __initconst = {
-	&geode_gpiochip_node,
 	&geode_gpio_keys_node,
 	&geode_restart_key_node,
 	NULL
@@ -50,10 +45,6 @@ static const struct software_node *geode_gpio_keys_swnodes[] __initconst = {
 
 /*
  * Creates gpio-keys-polled device for the restart key.
- *
- * Note that it needs to be called first, before geode_create_leds(),
- * because it registers gpiochip software node used by both gpio-keys and
- * leds-gpio devices.
  */
 int __init geode_create_restart_key(unsigned int pin)
 {
@@ -64,8 +55,7 @@ int __init geode_create_restart_key(unsigned int pin)
 	struct platform_device *pd;
 	int err;
 
-	geode_restart_key_props[0] = PROPERTY_ENTRY_GPIO("gpios",
-							 &geode_gpiochip_node,
+	geode_restart_key_props[0] = PROPERTY_ENTRY_GPIO("gpios", "cs5535-gpio",
 							 pin, GPIO_ACTIVE_LOW);
 
 	err = software_node_register_node_group(geode_gpio_keys_swnodes);
@@ -136,7 +126,7 @@ int __init geode_create_leds(const char *label, const struct geode_led *leds,
 		}
 
 		props[i * 3 + 0] =
-			PROPERTY_ENTRY_GPIO("gpios", &geode_gpiochip_node,
+			PROPERTY_ENTRY_GPIO("gpios", "cs5535-gpio",
 					    leds[i].pin, GPIO_ACTIVE_LOW);
 		props[i * 3 + 1] =
 			PROPERTY_ENTRY_STRING("linux,default-trigger",
diff --git a/drivers/mfd/cs5535-mfd.c b/drivers/mfd/cs5535-mfd.c
index d0fb2e52ee76..6941e124e87f 100644
--- a/drivers/mfd/cs5535-mfd.c
+++ b/drivers/mfd/cs5535-mfd.c
@@ -14,6 +14,7 @@
 #include <linux/mfd/core.h>
 #include <linux/module.h>
 #include <linux/pci.h>
+#include <linux/property.h>
 #include <asm/olpc.h>
 
 #define DRV_NAME "cs5535-mfd"
@@ -29,6 +30,10 @@ enum cs5535_mfd_bars {
 
 static struct resource cs5535_mfd_resources[NR_BARS];
 
+static const struct software_node cs5535_gpiochip_node = {
+	.name = "cs5535-gpio",
+};
+
 static struct mfd_cell cs5535_mfd_cells[] = {
 	{
 		.name = "cs5535-smb",
@@ -39,6 +44,7 @@ static struct mfd_cell cs5535_mfd_cells[] = {
 		.name = "cs5535-gpio",
 		.num_resources = 1,
 		.resources = &cs5535_mfd_resources[GPIO_BAR],
+		.swnode = &cs5535_gpiochip_node,
 	},
 	{
 		.name = "cs5535-mfgpt",

Thanks.

-- 
Dmitry
