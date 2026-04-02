Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2245B3A381E
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 21:17:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775164638; cv=none; b=YOx4/J69VQRJQEUfDB/k3TQzq41twrsvxRabOA2H8vJm7pCKD3VSQ/WQenD0Dn4NvLG6YfJkvL7g4KehYHV0GCgIATCl3Q6vtvfsf8bol3uvlcnx2TgQOrd4X7vA8zV8bp752MTg74Zv6VhibWinyf5tHABrRBE1CZXXlIxHRvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775164638; c=relaxed/simple;
	bh=OCy+x+MSmsOZ7fD2LiJ1nl//cIS8MMjq8lcpWFnNdXI=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=KigbNDB7/HK4kZ/tZwhRgo9Ebh86XUW9CsPXkV9rOLt+AQreGtdStImnGuzDTI3N6FYW3U17StNnJsDPD4dtWeY9KS79YUQUllO2BU43//1e7JOCtDdGkBGDT/L1/qe18aCfLa2lfAZEJ+EKCmcgZ0xZMp5Ow9kl7FaraJy7jlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GramB31b; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GramB31b"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48704db565eso14052415e9.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 14:17:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775164635; x=1775769435; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=s0yGnf4VuyCuhKUzxMfg1A7DK1AW09xb7DHYmA4WKUA=;
        b=GramB31b4rY8Zr8KECBk9fsOHKjAr2wGct9yzlP43LgyWqbMR3k65beoSKV4tQhKXb
         Db+nnok7kbZrdhBghEcVVKefIh8q8hqfhp/dVi+hIQnAvLWMBruxp9fCYUSAWMvKRSaJ
         IsW4z23Il6BdrLwN06stB81iJxmKBErXYNDs1Kzo383KX/T/YK9E5N5bE2BJh99GE92O
         7Ex2qqrdU3u+REmD9dllIVo2eyRU6KxlIYtVH8rs+ZNAtiKBVrURgFOzj5T+vxACsKcV
         CrCcI6wEF5+zTFcDLVJfvcDCg8+uTAZSahdNGs7TWnHpWU4YJ8lqDILQNJ47agSsorE5
         GF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775164635; x=1775769435;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s0yGnf4VuyCuhKUzxMfg1A7DK1AW09xb7DHYmA4WKUA=;
        b=UCpeoJR2VAPCSZDwiNyhef5m+CVOao+pF8OH20SUnB2RyBvtb9HFxffxCCgs17cevr
         f6K9EvdgM0jaLPyun1MeJX8TavItY4rLQZMhgfAWN2q+cAbTYoNJTGgKTmISHOYvon85
         Ey1WNAvXSpw4n1j60yZZo6THzL1kZWwOGOo0fosjoY2z+FDcR5v+7RLGdoH3Sosk6+Vn
         9KFm5t35ZAg6uTdIuYLjo1d1l5uZiffIFOtgOHz6eiAEDs3MbIMnC9bNripV8A4Nui+s
         IfATiy1s15PwK113zmsWZcim2SUBJrviMgvYbphjw4foO557P93LBhmN/gIu9GT/AO/Q
         MnAw==
X-Gm-Message-State: AOJu0Yz4IBHoq/9kFeG3bri5Rg+Xo7RjmloWvPkHB75hIClkG3CJjhfp
	AEdCjYL/9Xk2OYl/WRRFw3csRe65aEjq6k875PzfefkOI1+v6uv84NRp
X-Gm-Gg: ATEYQzwHhB5ulkd01hL0r0e6jZLI5bXeukNsC6x5/Tg3aHSGJr8pqzXT1jIjMdfpexi
	1hEQMCOEeMzJgjAPYpTLdTBTnZqMDICDy3QTGOmqKuHBFyMbwzsNVvBYSETyCjmmPXShlsb8xGH
	uV0uStvrloxQmV+vxJxpiQDLOMrgh6/78UCjUGglFf7Ejlx1SJag/hQW3pBb3avVg9XGa0ajo4F
	wPKXQy3IvumQATfppnEqMGz7hTm16r9igNw2FBeq50TKtF9x4ZiEr9Q6E3A/OF5uX1BlSUNYTrd
	X3F1OyaQkHnad1G2WcTeHBhCYmY0Usq2swytOpiARbjJOZLQIEjN7SeZO6LBAvPHTiDKpcUZ56l
	UecZ7/86Zvjkw3lyL6Ata8sxYHCCdGeg2C9nZvmqcTdBmLz26UOIu/6tDOINf6t/e6xBfioXH0g
	SOFsue3F4hW5QnsG0D1SEkXkwuuQnAqEwbCV5Yq2kFo0xTkvkrsP+QAUOarsbByVMBlUUEUGXy5
	iYBS5HyIJbZUFKcdXVG6CDY8cCWDs/SEg8WJigo69Dr8fmARudNvYnLM+6paEHF+A==
X-Received: by 2002:a05:600c:1d86:b0:480:1d0b:2d32 with SMTP id 5b1f17b1804b1-48899719a00mr7378805e9.12.1775164635323;
        Thu, 02 Apr 2026 14:17:15 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f19:9500:c168:ad27:2fdd:9334? (p200300ea8f199500c168ad272fdd9334.dip0.t-ipconnect.de. [2003:ea:8f19:9500:c168:ad27:2fdd:9334])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e822227sm248703735e9.4.2026.04.02.14.17.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 02 Apr 2026 14:17:14 -0700 (PDT)
Message-ID: <39a3821b-03d6-4ff0-97b7-82411a76d39a@gmail.com>
Date: Thu, 2 Apr 2026 23:17:13 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Johannes Berg <johannes@sipsolutions.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] devcoredump: Remove exit call
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Kconfig symbol DEV_COREDUMP is of type bool, therefore devcoredump
can't be built as a module and the exit code is a no-op.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/devcoredump.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 7e4a491bf..8bb176308 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -471,10 +471,3 @@ static int __init devcoredump_init(void)
 	return class_register(&devcd_class);
 }
 __initcall(devcoredump_init);
-
-static void __exit devcoredump_exit(void)
-{
-	class_for_each_device(&devcd_class, NULL, NULL, devcd_free);
-	class_unregister(&devcd_class);
-}
-__exitcall(devcoredump_exit);
-- 
2.53.0

