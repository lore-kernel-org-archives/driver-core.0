Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA3324BBF0
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 00:40:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312801; cv=none; b=oShLOQcoyKg3ujrO0Za2GDeZyzVZMCGYnQdK0iU5JGZAqsNPNloM/NGP9OI8pYF3FcQpNN2tCA8dWK0mzWHplmXk+V3ZQJoD4giGZFDL/sw96jzKeX9ThIZvnHFAD5UEeJHX/pkDxl1V4HRMwfXFUOMz5a3yllg3Z1fvqnmVgng=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312801; c=relaxed/simple;
	bh=QDf16Y7vyxJr6CaPRWRkq0hvjTb2t+Mwk/4kS11e5G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TxX1h1opAHR2xcGAwNNJg21G/rYz6O5DzZk8y+HukUlaTxBAktsVEx7F/jzHwSnZko7jVoBlHelT9Y/WsC+d2YeHW2E+1mG7PMKvu3MVndOvC728aHEegk2t6e7I2PY0qXVSIwWm9d7HDqu9FFkmdTkxrfSUvBpVlmPkrClgiW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HfouOqoP; arc=none smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HfouOqoP"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso3166525eec.1
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:40:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774312800; x=1774917600; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gq4MIC18tzOF8Y9yYjqLKcBworY2R0LEwLR/J/vdJqc=;
        b=HfouOqoP/hXmCwJ1pW/qhy2B3pfbxQiGrvKvNBqrBi28heUA/1Zz1sS7gtBku2N3He
         BN7yurD3DT2UYVqgtuVNGhYLdAZhnc6qdOkgSG6/lPsiyF+HzqGxmsf7m2SI3MZMzqIF
         iRvEwqQ2aUZVDao7SXQ4TogsB35TrdvEzhM008FPWocaA200w0ao5QKUsDnKArGAFPJ4
         zRvkkk+ya8MdvmtWEa5h/nBJ1rErzT2Ru3e/356yqRD43nkpFTIeYr14TmPXtRL2PuIE
         faSbWOXXPBeNnhcWYErpzhnKeGQP0GNJ3HMJgRiMsZeUIgeHgXFJQold66TU6ZKx4VhA
         UojQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774312800; x=1774917600;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gq4MIC18tzOF8Y9yYjqLKcBworY2R0LEwLR/J/vdJqc=;
        b=jEw3q8b4YkJlPqScBekWkv+wHzeb+MlzpByeMXEDvG+xpN+DQGL5ml9NNuq2WO1taY
         eLR6SBStqj1/yVNMNOIYgqpk2maAazZoOyOT9noo6L8LA7K+xdXphCsCPYk78fLDDa2P
         PHDJGyyIGVwUSHZsqiqno4EvzZ9//tGgdcYrIsV75KKMeBXddg2gH9zCjH+cwNVEReK+
         bhevk0SuPdVMILzOS9UcoIlu5zwVaalkymFARmBa0DlvQKZurdTZSc+2K7D/qwZKhnTG
         sui4pwYSfSr1iPu78mXL1nClA+lkmTZ07KzQtm8ifGgnk0nzdj50cLIzAxqLSuFJ934s
         hoUw==
X-Forwarded-Encrypted: i=1; AJvYcCUkNus2YfWPnZVSAAn1VoWFBX5fT5CHqUpqepqWlMbGL27Qkm3FsRtbP7ZFcoNZl36O9glRBlN15SdWSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+TInxMq17uSFyvJkfIFyL8/LVqqnuFfJIEbbLO1JT9xvId/wj
	fv7VL98ZRJs+UwHyNLSm0cio15/mbTt9bhw410CP1K84iSYkTtHPwpWZ
X-Gm-Gg: ATEYQzwa8pB+/VldbijnEghHvDckOEu1tgCbj17hFk2+LMF9rOs5unqxh9lM8M5dDs7
	CnGWB16F6HfvzLuXgwH2mwG6JoVzAGJGhCV7POkAX2O7PrzcdOS8pUGLbDDp+YMpeOM3wTdN/D7
	hbcjvdjMsdu6kEi3CkIpQYa4vX0ux2DL5Gppobb/ICgvmDnUoTDnV35FH7rY8jREoiW3pEkj9w1
	pE/C0MEGODBTXpJz99KWp2EBLQyvmrfUQThBdfE9gWhNqdnfj/nOHfpPqQQsusqLj8mzXWO1JQN
	ZognkPuEmff37p+kUYKBQNiyVDFRc2wSXFJhIb1xEtMjiFhkxfACjQI5bQ5NZvleki/PVK0M9kI
	cb4rIrEk1gPJ2CDdeYHHVNs8PsSxF70f6T8XUh14ZOaAsAAXEIRCcIDon8DCv16AanvBww6Mat7
	grng/rq8PPxxAflIFk7vAxaaruP6yYqctLbyEfb/umZwiZnGXht+DRdv9Y8749YVT4L8T10uRwW
	nW5zBksmS0r+ws=
X-Received: by 2002:a05:7300:dc94:b0:2c0:dc7e:ed0f with SMTP id 5a478bee46e88-2c1095a4f1cmr6259533eec.3.1774312799561;
        Mon, 23 Mar 2026 17:39:59 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b90dsm17543148eec.10.2026.03.23.17.39.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:39:58 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Mar 2026 17:39:37 -0700
Subject: [PATCH 1/4] x86/geode: fix on-stack property data usage
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-property-gpio-fix-v1-1-9cb46e5fe7df@gmail.com>
References: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
In-Reply-To: <20260323-property-gpio-fix-v1-0-9cb46e5fe7df@gmail.com>
To: Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, Hans de Goede <hansg@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 Daniel Scally <djrscally@gmail.com>, 
 Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
 driver-core@lists.linux.dev, stable@vger.kernel.org
X-Mailer: b4 0.15-dev-a6826

The PROPERTY_ENTRY_GPIO macro (and by extension PROPERTY_ENTRY_REF)
creates a temporary software_node_ref_args structure on the stack
when used in a runtime assignment. This results in the property
pointing to data that is invalid once the function returns.

Fix this by ensuring the GPIO reference data is not stored on stack and
using PROPERTY_ENTRY_REF_ARRAY_LEN() to point directly to the persistent
reference data.

Fixes: 298c9babadb8 ("x86/platform/geode: switch GPIO buttons and LEDs to software properties")
Cc: stable@vger.kernel.org
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/x86/platform/geode/geode-common.c | 24 ++++++++++++++++++------
 1 file changed, 18 insertions(+), 6 deletions(-)

diff --git a/arch/x86/platform/geode/geode-common.c b/arch/x86/platform/geode/geode-common.c
index 05189c5f7d2a..1843ae385e2d 100644
--- a/arch/x86/platform/geode/geode-common.c
+++ b/arch/x86/platform/geode/geode-common.c
@@ -28,8 +28,10 @@ static const struct software_node geode_gpio_keys_node = {
 	.properties = geode_gpio_keys_props,
 };
 
-static struct property_entry geode_restart_key_props[] = {
-	{ /* Placeholder for GPIO property */ },
+static struct software_node_ref_args geode_restart_gpio_ref;
+
+static const struct property_entry geode_restart_key_props[] = {
+	PROPERTY_ENTRY_REF_ARRAY_LEN("gpios", &geode_restart_gpio_ref, 1),
 	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
 	PROPERTY_ENTRY_STRING("label", "Reset button"),
 	PROPERTY_ENTRY_U32("debounce-interval", 100),
@@ -64,8 +66,7 @@ int __init geode_create_restart_key(unsigned int pin)
 	struct platform_device *pd;
 	int err;
 
-	geode_restart_key_props[0] = PROPERTY_ENTRY_GPIO("gpios",
-							 &geode_gpiochip_node,
+	geode_restart_gpio_ref = SOFTWARE_NODE_REFERENCE(&geode_gpiochip_node,
 							 pin, GPIO_ACTIVE_LOW);
 
 	err = software_node_register_node_group(geode_gpio_keys_swnodes);
@@ -99,6 +100,7 @@ int __init geode_create_leds(const char *label, const struct geode_led *leds,
 	const struct software_node *group[MAX_LEDS + 2] = { 0 };
 	struct software_node *swnodes;
 	struct property_entry *props;
+	struct software_node_ref_args *gpio_refs;
 	struct platform_device_info led_info = {
 		.name	= "leds-gpio",
 		.id	= PLATFORM_DEVID_NONE,
@@ -127,6 +129,12 @@ int __init geode_create_leds(const char *label, const struct geode_led *leds,
 		goto err_free_swnodes;
 	}
 
+	gpio_refs = kzalloc_objs(*gpio_refs, n_leds);
+	if (!gpio_refs) {
+		err = -ENOMEM;
+		goto err_free_props;
+	}
+
 	group[0] = &geode_gpio_leds_node;
 	for (i = 0; i < n_leds; i++) {
 		node_name = kasprintf(GFP_KERNEL, "%s:%d", label, i);
@@ -135,9 +143,11 @@ int __init geode_create_leds(const char *label, const struct geode_led *leds,
 			goto err_free_names;
 		}
 
+		gpio_refs[i] = SOFTWARE_NODE_REFERENCE(&geode_gpiochip_node,
+						       leds[i].pin,
+						       GPIO_ACTIVE_LOW);
 		props[i * 3 + 0] =
-			PROPERTY_ENTRY_GPIO("gpios", &geode_gpiochip_node,
-					    leds[i].pin, GPIO_ACTIVE_LOW);
+			PROPERTY_ENTRY_REF_ARRAY_LEN("gpios", &gpio_refs[i], 1);
 		props[i * 3 + 1] =
 			PROPERTY_ENTRY_STRING("linux,default-trigger",
 					      leds[i].default_on ?
@@ -171,6 +181,8 @@ int __init geode_create_leds(const char *label, const struct geode_led *leds,
 err_free_names:
 	while (--i >= 0)
 		kfree(swnodes[i].name);
+	kfree(gpio_refs);
+err_free_props:
 	kfree(props);
 err_free_swnodes:
 	kfree(swnodes);

-- 
2.53.0.1018.g2bb0e51243-goog

