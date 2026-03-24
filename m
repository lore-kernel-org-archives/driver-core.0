Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6837636997A
	for <driver-core@lists.linux.dev>; Tue, 24 Mar 2026 00:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312808; cv=none; b=OCx0ojfJG+7NXK5xHi0Vq+ZktpV8TaLdQ6+9aOdaPpzKguO9L52bBWSSQg6t7/PzJoTXVcq5mLX/prPLCWsFfTjqm+j/lvkEmkuz1TyZcCQuvl9ICh7lsunBuETMmIQZhh34wQxA+amTPKyIfch/pczqz04YzHH4Ie1I/8QFkgA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312808; c=relaxed/simple;
	bh=Gk/XhY40PWnO3LOxD5YjgUSYIokh9KUYlW7/pTRxeiE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Sdfl/O94iCLSsmnsjHQhBADqZX2e4Ne2Ab5L6kIiDavx4MI0UCy1Y3IvYbeb3490XnMchwr3H0/f93Ss8iERCONI4izWbFSLZpbWMXi5ryD9kaXNtz+Oou/FVNOakrVrpW/q+Ws59CE05N5+fSbhrq+liQNFdZ0oqhRfVwt7Ev4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R8pYdM0V; arc=none smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R8pYdM0V"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-2c0c482e069so2676754eec.0
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 17:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774312804; x=1774917604; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iu5Dic5CoGqaGahlCm060hwT3Wf5ekOnX3Fgg92paMs=;
        b=R8pYdM0VrUwwyKAJJDhIovq+IL7uZY4oUuulEORMbhwvT/kU5Nlld6wnYwjypS7B6N
         uyand0ZUNvQwNBD5b3opLuKua+RvrXxLk8vZ6Ty54slqnwHFvOKVwImwdsl3HcqJdl6m
         oVwDVbyRLzdL8KK6ET5nYuX4dQE3/LWgSCDp+h1gjxG1rIBYEikWRsjjyXQglZScUuUY
         eFyVIPLxrVmYpJ3GjRVFAviKHSxA0xfGXTzF5l51iyHMP83LQk5JRdV6z3gLl8JfnpTd
         SKwV2hbz3g2H2pt8crla13I20jLkoFsHwdjbFxGi4iRmkj6Mn6UaFOFCpqr1+jgvgFg7
         QTlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774312804; x=1774917604;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iu5Dic5CoGqaGahlCm060hwT3Wf5ekOnX3Fgg92paMs=;
        b=WVHQ+kis9KWtsHSpJIXoqV8yQCIJKMPaxycyBQaVQbqMVCo6Yf0//S8XreDOAlQPSN
         DPy+PcCAqYMQmKyKAh/yEgSyhmfJlov39TuwyLAGmAzKr6GA8CympyFT6I+T12Bs5QiJ
         GQiK6zkDYv0GQRmHbn3rvnTNa37lKHOuWC70kTU8FxHCFBK2uypiM/P+JtY1R34bGVk5
         CaxLovvNdVhbWSPIc9b/fPvM1+wWZojAtBspvHs+2ufL570wqRHjqqMAmuHf8g0yfohT
         uClRfnImZnnuZQk9Az5WhM3Ejl/X4ufgMWgZzU8qd9+s+GcflYnScAmi/TC5nzx38Yx8
         imrw==
X-Forwarded-Encrypted: i=1; AJvYcCXPqx5rhSOk5cBybi/R76xhDAL0KEwdePJvV5d+9YOFodJcXrJ18LQ+fBqyQhhILMIun9mxbkp2dv7A1g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy14SlS1nYWkpJJBnHRvEl2nAmXspp2lwa5IJbGJ6RvjB2tN7u6
	zD6d2TE+SVVmBSvweAkte4+bCgcnW9uvXohISnylGCiNGElghUjZQT8G
X-Gm-Gg: ATEYQzzwI8AkM9dTgz7DI2PwcLUQwosR3pp9VbzatnCjQKMg/bH5xYxQ9mqj2uM1ol4
	yvTwS9h/S4Giu06lbLx40a5jxLj/667ho5EaKXN0of56NPA3bMarrdMLpCjKrzKsU+fxsBx6aFH
	X7P/eHkd9UYXYUdjpUHlM0ow3UwwOmeKfpZ6A9AFxthi+0oXdqtwfMT8L13kjNszi7l+hx0MInn
	Qz13cua/gFxFY/zD6qEqPRn12aB3obI7aZmd+Y3FGKzgjyn89VQhm+qmcYtxcpYv3hf7MCHv7ZL
	SXsSB6PHNntvqZL53Lqwm2o4HXVdGgOBAZEZGtzICigVVd0FHyMzonGu8XgIa6K1A4vPojBsjlM
	TRKWS71mfRDz7CYKzQhhLHIsxdhrLJCVtGDtXI8abI3KXU0IgZfTY6SCdPC2RZ4XYdiE+33OHkh
	tzbb35rsck66g+N1yQzqFt7yuNLUYUKB/RHAiCrBX89DTKZGH2XwpgtbgkCG62erQDPqOtO1E7f
	edeLG2ugmOkVwI=
X-Received: by 2002:a05:7301:1486:b0:2ba:68d6:47ae with SMTP id 5a478bee46e88-2c1097ab4a5mr6019191eec.34.1774312804390;
        Mon, 23 Mar 2026 17:40:04 -0700 (PDT)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:a296:1211:5ab0:bc95])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b90dsm17543148eec.10.2026.03.23.17.40.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Mar 2026 17:40:03 -0700 (PDT)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 23 Mar 2026 17:39:40 -0700
Subject: [PATCH 4/4] x86/geode: use PROPERTY_ENTRY_REF for GPIO properties
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260323-property-gpio-fix-v1-4-9cb46e5fe7df@gmail.com>
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

