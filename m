Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFE16391E6A
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 02:27:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774837680; cv=none; b=OI7kc5ssgfnW8W0yZwYlThiW8EJIg1HJx/4piswwhubULD4dkK+FON1dJCLSUht15+stZMklAaEWxiAD4LsDMlrfrhQO/jw/FMhtvalnymPzKYIunMHoFE+3A3HuOV1X+V+ywJMea82F5X2Xnhy2SBnLILf5i3ZorwKKCi8y0g8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774837680; c=relaxed/simple;
	bh=QDf16Y7vyxJr6CaPRWRkq0hvjTb2t+Mwk/4kS11e5G8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=swiY7vkNd6Th30mf62n2d1eM1qt/qUaS4/yH73x6W1NqZOgEwDPv+glwUBnQBdXSTvmPV8UgyrZ80Sij3VyqnBr6jB0dc60HTDInbUZYG8dij4kNrhC06PzGSCOpBHl6JVcipFBVnbXqaz7Wd3D90ISRGuo6yGUo50oiB16FLnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TKF7ZOLj; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TKF7ZOLj"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c1632faeb9so7149557eec.0
        for <driver-core@lists.linux.dev>; Sun, 29 Mar 2026 19:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774837678; x=1775442478; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gq4MIC18tzOF8Y9yYjqLKcBworY2R0LEwLR/J/vdJqc=;
        b=TKF7ZOLjyxRcRqiu+5lfgDs8rzCyzH63gjp9Dy05qKzGwPv1JYEeLSIzkA+570pNt/
         RqlZqPWgwywoDDoIgy1XAz0hFGMXXohLYjaOwkVsJa065J3gnbeqiVY9actunesJhre1
         3mVBh+zQHA8x4HYsjqgBAn+1OuGoGvdbiS1Jq2b5j8ugPrxXNNpfTnQRNFbvHHSg/lbw
         CJs0lC7vcWRm7+gFdehXS3Brkq7HTuOAb9Z6ReDikqjPE8EqOgtLmbyNLfRqIItYf4fI
         KWaB4p7L3FA5kJLhTW21LywLFXATccf8a4LIQ6eDa89oTQ07/r4Fy1oAVFaufRfJdleL
         II5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774837678; x=1775442478;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Gq4MIC18tzOF8Y9yYjqLKcBworY2R0LEwLR/J/vdJqc=;
        b=rivotGH5RbajSjsushXp2nNkhOX6zhR4kt/o9Jxt/pNmTUIgJegJykDFnUVqMnEOjM
         DVxG8lN6Pr/8P2oqQBhmP5jn44pa4XFtKv7FVxUz42rxQdSiEfkrD+Yp4A8jHHulAuLj
         szqpRU518wZeUiTfA6hyw9X7N+wqRf2CLgPpmz3UlWnlVxspB77gijZKlGYXfCrVXOmu
         GHyvHgGn5dEOXU6LaKDMXSX5FvSvDIryhTE7iTFmmOTxrdgXSpgtBIuzHaq9j2wFVHwq
         4uJZ1pR0SEO2C48JQ0e1LV9HjZrTdOL+KNIKaoP8xXWi8yjKMOnVqABE942Lh/xBGAXj
         U9Ow==
X-Forwarded-Encrypted: i=1; AJvYcCXXBqBO5fyyOH1ROihNYHwah7RTqLapJuas/HWxAnm8nxPcriUN7ljv/Rxjvuhmu2x7pljLn5/STfeLog==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3WJ6hUFSQSprkqfW4NvMAivoX1UKV1gnxi4+p3fMeZUuopZMQ
	LVfEW2VYQdoft3lW16o9PhmKhxMPV3iwxP/WCUjX9dlxgKVyh8tHXuWG
X-Gm-Gg: ATEYQzw4Dw8rnSD0Z5hNFNumXolMJQO7BNHoGeFRfpSHPfG6tFFdVbldfk+zO9z8qNr
	JtNHQgGlVPLti8vCo5i/ZRyDd/A9ZK9XKdfIN5cMagAgdVuRv4yuwMIBf90OVY04FknxrxcP9fJ
	UQVOpfMIRvumVHHcVY8dBbqn8ybhQcjio/PpaiXY6C4OtYWMcLC9GlQ2bqLWbpGDTRfQu1nlw2M
	CiMRBsRGxi8nrjMhlpOwlPp9XVfRXYn13UQ3WWl3ZZlkmKiHuWmmdQnkdQHHTOOCUcNNh7HdJ9O
	sy8WmIFLd8DyIqI6UOgLjg2KbBAOBNd55lL5nKHUNO3sA0LeNOUJB8qifgtC8/fnkVqqbpkt/5o
	AAISXPSUc9UsPyeid4iwy9UYvl5EdAc2OMejJbb0ScPf8XsuSZq3662b76x7PKIyo376/WIa6Bp
	+HSJfjkHv+TL3mJ9rVsI8ezvNpSSAZFPYYBSMXNJuFawvhICqzMbDWFEDk2A2465RCnufWXSw0r
	cJ7FgSOkN63rW0=
X-Received: by 2002:a05:7300:3b1a:b0:2c5:b23e:48a6 with SMTP id 5a478bee46e88-2c5b23e4f48mr1555198eec.23.1774837677943;
        Sun, 29 Mar 2026 19:27:57 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm6250673eec.30.2026.03.29.19.27.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:27:57 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 29 Mar 2026 19:27:48 -0700
Subject: [PATCH v2 1/4] x86/geode: fix on-stack property data usage
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-property-gpio-fix-v2-1-3cca5ba136d8@gmail.com>
References: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
In-Reply-To: <20260329-property-gpio-fix-v2-0-3cca5ba136d8@gmail.com>
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

