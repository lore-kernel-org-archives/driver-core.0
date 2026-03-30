Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B5453921EC
	for <driver-core@lists.linux.dev>; Mon, 30 Mar 2026 02:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774837684; cv=none; b=dbWlTOIS2xSIEixrozp5CIIYdR53kpU9/WRayyCnE5IUsZhsJVc+c9MDaKqeWkvcqpX3dQ89a7woSMv17FbIp5wsLsV8CRUnkS4qDR2FgVseWu6tGc4kcTSfx4biya1VgXrzNwCS8RNxLjdMVB4YXZ1ErMtSlK56qGOT6BTyTM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774837684; c=relaxed/simple;
	bh=Gk/XhY40PWnO3LOxD5YjgUSYIokh9KUYlW7/pTRxeiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cE4T6Dy8hcpsKT23xZUgSRmtybEqd0QwTVuFvmopVdYJaywCaYd5XCMTXWdpnbzXNNgwUIdCbpwuIEGbqgstW7bPFCZqC8WiG4QQX9XuuDvHs4miyH873JDVaKyovw7rpe51Uvzc+pd0Pzbm60qbgZ9fJDITzzudM27UTTb8WSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VskUwfdB; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VskUwfdB"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0c955a481so1096422eec.1
        for <driver-core@lists.linux.dev>; Sun, 29 Mar 2026 19:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774837683; x=1775442483; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu5Dic5CoGqaGahlCm060hwT3Wf5ekOnX3Fgg92paMs=;
        b=VskUwfdBYFoZGDBQ7MPTw1eURJEKa7/kykm3KSa1EbLQFQrVfiltgvPOjZZwhF5FtE
         2FJFcp09QPi6fXsMstZEi7bm/LoskgBRzFhyGzYsrFuGbKb3GeqDUtmtZFbZeLyg/HtA
         13LISe/CH3bz5VWs3pY/5DrYcZ3MhDO1sTjNQTixooi9h1zKGL9/mOSO1yiXLb5dOE8d
         NRNMZIsG4wWJvsqf9QoS1UJJ5nH0dzntBQtEYHfH2cQkPOGhonAFXXGefN560n5tjXmK
         P0cE92GcrpxQLMnNR1ri5Pfl3P3CQD3gGAHJTeetoUzYV47c56KG7MMC40LrNwl5hfLs
         +NfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774837683; x=1775442483;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu5Dic5CoGqaGahlCm060hwT3Wf5ekOnX3Fgg92paMs=;
        b=UYiZYU6QMeK1rMEAxJKxep1J4O1UziEhCklZ63eMljP5JulYSzXl3CEbpel+gsuWQF
         yv4iL6FO3RpFrl0qGjc4/awRFswe/CZ5kHJ9MuHCwV0NJNgMs09fi4YxUJr29XJ85ybj
         cyUbqMxikfy6VKtuHPE3/AHhKVsRPb7kV1azH4peGGoJbjinljZL9OJPgXtSlWq3GyW7
         M1iHlvTBrwrPiU7JO2MEEAqrQZS2/4XaUv0FlnQ/3doA5TPwrSn8kU9ldltkkEYEXuBk
         pT7w3ZAU+XbAS8xm3OEybtB86KWfhhpztn7QnzXeI5drzF44Debv4bYQ5OV2YMXv+kQ0
         PmBQ==
X-Forwarded-Encrypted: i=1; AJvYcCXfP87XbZ5btDn/hdnVklhjfHm4hfpab5s3wj4f+XfmogcCKAQ3kLCXhfWd4utL+jlJ2mkJynD3fH+zig==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzq0HbJWw1nZp7BYfX3yRTiEOimZmrw7TJhxn1YV/PRXBiacYmi
	7HUCMuMD2gg7LqQpcS/VkZdmCYbMi423hVss+sHitic62dPsSe5UpWf+
X-Gm-Gg: ATEYQzwCI9HXcaXqZ+zhemaMN5mmf4KknP/xVGKb3u1moFB7eL5k8swH1mwjri+5FPB
	bxD1o8n52u2S+hnv8ljogVKHtr/gjrhMmeLKuolWgEw9KLNO0p6AkvrqrSwrhga2yc2gRcurSLu
	VjO1hZjTl19OpWFYP5smmU1EBpU1SgEgoyyWl0t9TY/aiBakuUM/eBhI2rkwlIWVJR0pfQkrqN0
	3emnFYtskTD4/cc1rhtLtg1ua+v0g3/KxHbquOC4746Jj+tD7kI29J/ZZ0fmzn8LoUlX1/FcbB1
	qBZka3IRb2Y+78fBoYSHHq4eKrTRSchrmOQqO3gjMgiSoQAnLXi9R/0wIwTpoTm8wIVTQlCaT4N
	VLopQPi81nPtFzW7BTEJkSzmtt8NBAOqpVMXDBUXbadaaq34HaftF7ZvsNuICB7GmidjgQtY+II
	jb7m3BBmYEp/h/O7Xevo/zbwt+oqOZMx92u4R7zvDk8oaCfMBIbrC5kaYdcQGV4XYYk86HcQ6gN
	N7BKGaOqDN1w4w=
X-Received: by 2002:a05:7301:6781:b0:2c0:d690:7bc with SMTP id 5a478bee46e88-2c185e16735mr6142104eec.22.1774837682719;
        Sun, 29 Mar 2026 19:28:02 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:7265:773a:8e51:c62f])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c7971d97sm6250673eec.30.2026.03.29.19.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Mar 2026 19:28:02 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Sun, 29 Mar 2026 19:27:51 -0700
Subject: [PATCH v2 4/4] x86/geode: use PROPERTY_ENTRY_REF for GPIO
 properties
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260329-property-gpio-fix-v2-4-3cca5ba136d8@gmail.com>
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
 driver-core@lists.linux.dev
X-Mailer: b4 0.15-dev-a6826

Now that the PROPERTY_ENTRY_REF macro can accept a pointer to struct
software_node_ref_args directly, we don't need to use the more
cumbersome PROPERTY_ENTRY_REF_ARRAY_LEN(..., 1) variant.

Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 arch/x86/platform/geode/geode-common.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/platform/geode/geode-common.c b/arch/x86/platform/geode/geode-common.c
index 1843ae385e2d..6572ae388d7d 100644
--- a/arch/x86/platform/geode/geode-common.c
+++ b/arch/x86/platform/geode/geode-common.c
@@ -31,7 +31,7 @@ static const struct software_node geode_gpio_keys_node = {
 static struct software_node_ref_args geode_restart_gpio_ref;
 
 static const struct property_entry geode_restart_key_props[] = {
-	PROPERTY_ENTRY_REF_ARRAY_LEN("gpios", &geode_restart_gpio_ref, 1),
+	PROPERTY_ENTRY_REF("gpios", &geode_restart_gpio_ref),
 	PROPERTY_ENTRY_U32("linux,code", KEY_RESTART),
 	PROPERTY_ENTRY_STRING("label", "Reset button"),
 	PROPERTY_ENTRY_U32("debounce-interval", 100),
@@ -147,7 +147,7 @@ int __init geode_create_leds(const char *label, const struct geode_led *leds,
 						       leds[i].pin,
 						       GPIO_ACTIVE_LOW);
 		props[i * 3 + 0] =
-			PROPERTY_ENTRY_REF_ARRAY_LEN("gpios", &gpio_refs[i], 1);
+			PROPERTY_ENTRY_REF("gpios", &gpio_refs[i]);
 		props[i * 3 + 1] =
 			PROPERTY_ENTRY_STRING("linux,default-trigger",
 					      leds[i].default_on ?

-- 
2.53.0.1018.g2bb0e51243-goog

