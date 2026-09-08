Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1B3E59C995
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 17:47:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788889679; cv=none; b=s+NO3Nj9j/2M82ZygGFmUoSy+uJkBHC4tUYlL34K0MyXetjsRb/V5v4twHQT+LgP65O1ShowKN8Oaaa7yqs3qT1bXmQB91mwYWof46pZsJMukYOqx3hCC2M3VeQqPltOraGPc5xLGMksG9JXvUciYFWbsbz1ASXrrgkwKHKfAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788889679; c=relaxed/simple;
	bh=dUQc7PWrbX8uAQtdC+UYHtMhjF0PHNUBZJYOmbunHLw=;
	h=From:Date:Subject:MIME-Version:Message-Id:References:In-Reply-To:
	 To:Cc:Content-Type; b=TlYaGOozWJ17BuIB6UAJ/6a53lp3GIOEMr3AKef/EMwyaAotym1lH6O2guG7JgpsnT/tRWO+au6EVXKsGvjY1+W448kmYNW2nlopeHrBhRyf3wV57YOJ4jHef5EU28is21EN3/n/xULKtFiHi9OQLF7qch4CnRDxj78aQEE1dBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=O4iduQHf; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="O4iduQHf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1788889675;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
	b=O4iduQHf83FMcZW9ZvQtSk3irReNq+5TVsMg8uDGSs3VkcQEEQY2C0DPQnZHbbD76ZcXKc
	dmjrm0ugTJwOZNgor/n+L5ZT7+FpK0hqjiLp6GnQP/lbTyHkqugBD52iIJA7wsQt7Raat/
	38rFectExMOS3GG7Xf2LtE5+9Rjsmb8=
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-561-BD8Nq4QVPtyabVPaMtujww-1; Tue, 08 Sep 2026 13:47:54 -0400
X-MC-Unique: BD8Nq4QVPtyabVPaMtujww-1
X-Mimecast-MFC-AGG-ID: BD8Nq4QVPtyabVPaMtujww_1788889674
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-9390a2c895bso981167185a.0
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 10:47:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788889674; x=1789494474;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=luyNT9P1mkrzQIhc+xUVIxx4p4MwhVi8AIPUHPOm+So=;
        b=Egt5e28gySmshfQ0eolizWEVd1p8EVdCu/k7XzzBpHhvCiThEVe++5acrbsQKT7wRE
         gvcqvAEWL5c3zmayz9JwmBr5AsaubIMbolPCRedWWu614hQ/VldsKKKw3lugwBhkm61S
         qqgbgbzdufiCsFdhcN9AU4kWKrIsqdfofSyZK9PMxV+1uxAINHwzGEZQZcnkQXnCjFQK
         cgV/qra6O2qwtbJKoxDva9rX96OOmFr4Xfy/9tN2PkahyD08D1OlU1pqYqpyOdtAHYHI
         ulPwkqLx89EQIba0ynoMZ9vrlXL6DotneMUT4Ubt9NwWwMko7a1gS5Wldr9lOT7f49Ku
         SQNg==
X-Gm-Message-State: AFuF++l4y1Kr/J7E1z9R1EPdwxeqdWqtq7jMeoEBmtdoHdcgdRuCG+CQ
	g7Pk1yGri6FAL2lP1LVQD8a32BT0xEAmjw8Df3OpCZue/Y8QLzfwU0Q/A/2fXy/1Dxv/aC8sD0A
	5DyBkMeW4ulO7h5LvrgRvGhWXYEGm1WIm1mg631/v8nQJmmZ7ymlfY9srGaglhu/CeVn61XzA1+
	1hfvK2zVfH2xfl2+btY1VPpZtTFCZBAfbUEAKN5LXz0UH/PT0=
X-Gm-Gg: AYBFou0Kra2Tdx0AacZ2kxhbZsJnhwNY93u538lHWBJcrXyUclwOSvHYaguVwvEEgCT
	q9UrQRS0eIEKXp7QZ+CU+qMCAcrpJ0GQuFxLWwxZ6EcgO96sKy2GZ7a4IdZRjXQXPhn6HvobZFD
	uKFzNG+TvwGrr8Q/aRXoWeC+zxok7gWpDkuOLyLaApSCHw6LN55syQKxpRKDqnKlFPE8aJRKwTh
	gnsAzsqSxDS6p27c9aCY8kmNBt38t9hqSiaESLNfTjDEPaTMVo2yx+ZXKinMgOS+ejXA/v7e3nr
	wWuCpeA4Rp0m9Fb9ugY721HmgKlKOEoYT72Oqd8WdSjOgtQeWaSXwnhJszqkFoAkXfuUbOFFvpG
	P7e5w2N8xSrPl57arybYabZBPW7u/dLfdCoeVvY0=
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr3211126385a.50.1788889673835;
        Tue, 08 Sep 2026 10:47:53 -0700 (PDT)
X-Received: by 2002:a05:620a:25d4:b0:939:6df9:1996 with SMTP id af79cd13be357-9398077453bmr3211071485a.50.1788889668513;
        Tue, 08 Sep 2026 10:47:48 -0700 (PDT)
Received: from [192.168.1.3] (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9397fb9bac1sm1194093685a.35.2026.09.08.10.47.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Sep 2026 10:47:47 -0700 (PDT)
From: Brian Masney <bmasney@redhat.com>
Date: Tue, 08 Sep 2026 13:47:19 -0400
Subject: [PATCH 2/4] driver: core: platform: add subsys_platform_driver()
 macro
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Message-Id: <20260908-subsys_initcall-v1-2-cbccf4cd4288@redhat.com>
References: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
In-Reply-To: <20260908-subsys_initcall-v1-0-cbccf4cd4288@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2845; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=dUQc7PWrbX8uAQtdC+UYHtMhjF0PHNUBZJYOmbunHLw=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLIWeNlGl8x1q7io6bY7/Mr1m+sOs8htXTHDgn3Xkynhp
 n13mGK3dJSwMIhxMciKKbIsyTUqiEhdZXvvjiYLzBxWJpAhDFycAjARrxWMDNOmXTSv84h+H5Nc
 x6l2bu1a9Z2zF+xt8P8V/vrSApf3xw8xfPd1q/34Y86hFX6zHQTmaxTZqMWemJR+mlll0c+Ol8e
 FWAA=
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: pxiECDu1SgLevgzelcJ-iBWM-8LYh2-i7jmFsjJO3So_1788889674
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit

Add a new macro subsys_platform_driver() to eliminate some boilerplate
code in drivers that need to register earlier in the boot at the
subsys_initcall level.

Signed-off-by: Brian Masney <bmasney@redhat.com>
Assisted-by: Claude:claude-opus-4-8
---
 include/linux/platform_device.h | 30 ++++++++++++++++++++++++++++++
 1 file changed, 30 insertions(+)

diff --git a/include/linux/platform_device.h b/include/linux/platform_device.h
index 3d5bbcbae730..3bd0f1f0d870 100644
--- a/include/linux/platform_device.h
+++ b/include/linux/platform_device.h
@@ -344,6 +344,19 @@ static inline void platform_set_drvdata(struct platform_device *pdev,
 #define builtin_platform_driver(__platform_driver) \
 	builtin_driver(__platform_driver, platform_driver_register)
 
+/*
+ * subsys_platform_driver() - Helper macro for drivers that don't do anything
+ * special in module init/exit but need to register earlier, at
+ * subsys_initcall level, when built in.  This eliminates a lot of
+ * boilerplate.  Each driver may only use this macro once, and calling it
+ * replaces module_init() and module_exit().  This is meant to be a parallel
+ * of module_platform_driver() above, but with the init call promoted to
+ * subsys_initcall() so built-in providers are available earlier during boot.
+ */
+#define subsys_platform_driver(__platform_driver) \
+	subsys_driver(__platform_driver, platform_driver_register, \
+			platform_driver_unregister)
+
 /* module_platform_driver_probe() - Helper macro for drivers that don't do
  * anything special in module init/exit.  This eliminates a lot of
  * boilerplate.  Each module may only use this macro once, and
@@ -376,6 +389,23 @@ static int __init __platform_driver##_init(void) \
 } \
 device_initcall(__platform_driver##_init); \
 
+/*
+ * subsys_platform_driver_probe() - Helper macro for drivers that don't do
+ * anything special in device init and have no exit, but need to register
+ * earlier, at subsys_initcall level.  This eliminates some boilerplate.  Each
+ * driver may only use this macro once, and using it replaces subsys_initcall.
+ * This is meant to be a parallel of builtin_platform_driver_probe above, but
+ * with the init call promoted to subsys_initcall so the provider is available
+ * earlier during boot.
+ */
+#define subsys_platform_driver_probe(__platform_driver, __platform_probe) \
+static int __init __platform_driver##_init(void) \
+{ \
+	return platform_driver_probe(&(__platform_driver), \
+				     __platform_probe);    \
+} \
+subsys_initcall(__platform_driver##_init) \
+
 #define platform_create_bundle(driver, probe, res, n_res, data, size) \
 	__platform_create_bundle(driver, probe, res, n_res, data, size, THIS_MODULE, KBUILD_MODNAME)
 extern struct platform_device *__platform_create_bundle(

-- 
2.55.0

