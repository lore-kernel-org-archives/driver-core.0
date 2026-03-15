Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA5AB36606E
	for <driver-core@lists.linux.dev>; Sun, 15 Mar 2026 16:48:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773593327; cv=none; b=LunttzYlEDfEF/VrgXAuicCjj06j3YVs/wjSyE9JrB/+5lG1WnFrsHxSm8vh00/yO68HMhY0OlZjzNBO15VFDmHjvSVVUVpeI1hR0TMoqjZ9tOMDrEsu9k0HQY77LGtkn1RLeJlWpXIVKOfJxb3+lWs5rvO6UDfeEl7w63odcig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773593327; c=relaxed/simple;
	bh=dJcxXwUqtx1lCNUOj6ycFw8wkqRzo+3nWPXy6YrZhtY=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=QMQmaTJLXfJfM2QAictUm4PlW63UcfCXF2gYzI0ScBARh2OJZe5xvVK5CL1eslVKbBrQ7SfnlvhmJ4swE0akkuDGB/9iN4/wReqnRtCN6aTmOswOx3aKUFQeLnzd2k8Bm9Gy3oiY8jJrIibmtjwGZe2V6+Sywq+B1E6eiEyvAR8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Lw4AF6aE; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Lw4AF6aE"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-483487335c2so36179825e9.2
        for <driver-core@lists.linux.dev>; Sun, 15 Mar 2026 09:48:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773593324; x=1774198124; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=BrN/ck32NLsqkg4P4cpT5msAlPWmkBDFPzdOJO+ujCs=;
        b=Lw4AF6aERpWsh2vLngmO7hYV8moxZ9D+/3Os1R6dn4+CgcgymPyW2VbahafjLCxiFx
         8olc9noc/eDQvQipC0e/FRW+/Zu0H5tB/V7Lwp/1JoxG91fr0MAwlxoJTdg30qFLXY9c
         ecOSVrQH5tup//O/tHspDH3Ytbd+xxbVRdQC9EC22HeIeXlKAJIFKXHVzUMvOXojxhA1
         zrTncW7xVk+OsbklFlu5K7wzeHgpjziKz/u5savIHxXaKEtuoyJbR0pks9RNzpRaYUmT
         iLD0ypTHiYjc0S/XhKoe2vVe1ZbSGLzKYXUiBnaBgrxiO+Vp2GG0moaT+7ZPzwMq0dXr
         1iRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773593324; x=1774198124;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BrN/ck32NLsqkg4P4cpT5msAlPWmkBDFPzdOJO+ujCs=;
        b=sEjvoe5l+0C5Hja1sBkVuzVmF2P/rLa5Pej3hK4f9kkEHgpBv4pzV9kXvY+W4wbr51
         AAdwG1yKr6/sZAScmwVXiY8qjwk0xJqb1rAUSCjMJv3pq3vVDKdoPCqtZWJYgFZqzpBw
         OwSVF1W78oCPL57gAw3rnSmEw+wunaDy/Aj2l3LeDVBaSFUIy9dAksIIfJBAcTkVhLOD
         SncAaw+BTNrSlatYJ8t1cM6uz3lXQBM7xV6Jl1j94cnqMm+PRyIeAHFsBTQjJv3/KTQk
         WdosbJrc8liCsWiTJTSMHHCLQG6qY9nyo4ME75ae7480xfNmww05tq6jJJx9R8C7Ll+a
         2Smg==
X-Forwarded-Encrypted: i=1; AJvYcCWqLlkwsDJpbBG531RGBcMW8l3r9GJW6MM47WOvGRVrw19pDeT8sxUuj1Xif9Jq7G54TlRKn3QfGU0R6w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVakwpXAOdNT1AW22GOh8u2+IdE3xHnNv98MeNYMjfm1EkkWal
	hZFWUjeBvmZe09y3RG8VrCaK0Mj5Rt3DZZzGgMcTCHsJT7QD6mV248zn
X-Gm-Gg: ATEYQzx4BNM78wcGJJ0PHhO2WIciqPlzfHLVckFfZqvEC6u2t0YvEfBn+Rv5VyvnnH5
	cPJlvnoUZSYHiTaCpIRgOxrzR8qKJeEqeFaRIMXdY6dRS1n8XvI07MadB91Qm3dIRVCvvhOZ5fi
	DaIw+YtXJhoDEhvXpyeGO/F5PrB0Wm4ThrwSTSvpFruWuqZi2VNISI5AseG2gFFAcWwXJQwnAMr
	dNPxr/+ssPr3/JwQVWp+hQDhSFZvPStSZA1/NcG83AXAqWcG2MnxXoCTpkpXC8wTWGwAq7maqaJ
	Xd1BHQaK1KfWvDResJu5bRf1+4lF9lVY3V8KfLzJ/OsYWiM95QpklnA5Q1xFFXO+/8IQi2vn+/U
	H/b+5LYZSIfyhUk0S/c5yHbJ0BNchmy2nwvgKywfO/HOlQFTHVzLOPlAccINf8+hNEpQQrTU48n
	nCjqwBDe0ugu/jCrdyXZUqkwTUPRSJ1BTraKBRFGvewZ6HfhSgaKZwTUztCTSlQ2fagLDv1PLxG
	Hq8vVD/WSXRgtuD22SXXxSeo6d0vE+kddsSv5/7D+Ykjy92BYuT1PHW79RyQcXTxQ==
X-Received: by 2002:a05:600c:4649:b0:485:2fe9:336f with SMTP id 5b1f17b1804b1-4855670e828mr101710105e9.30.1773593324036;
        Sun, 15 Mar 2026 09:48:44 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f19:c400:5d7d:7d8b:dc1a:ae45? (p200300ea8f19c4005d7d7d8bdc1aae45.dip0.t-ipconnect.de. [2003:ea:8f19:c400:5d7d:7d8b:dc1a:ae45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485563903bbsm116493805e9.0.2026.03.15.09.48.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 09:48:43 -0700 (PDT)
Message-ID: <a21a3b3e-272e-4c61-986e-48a2cb3421d9@gmail.com>
Date: Sun, 15 Mar 2026 17:48:43 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 1/2] regmap: mdio: make it depend on PHYLIB
From: Heiner Kallweit <hkallweit1@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 driver-core@lists.linux.dev
References: <bc63cf87-3dba-4ab6-9c84-caa7357c3273@gmail.com>
Content-Language: en-US
In-Reply-To: <bc63cf87-3dba-4ab6-9c84-caa7357c3273@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

MDIO-based regmap is the last user of config symbol MDIO_BUS.
MDIO access needs a MII bus, which requires PHYLIB for the provider part.
Therefore make REGMAP_MDIO depend on PHYLIB, what allows to remove
config symbol MDIO_BUS in a follow-up patch.

Note: After c5a219395b4e ("regmap: Move selecting for REGMAP_MDIO and
      REGMAP_IRQ") switching to "depends on" should be fine, w/o risk
      of a circular dependency.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/regmap/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/regmap/Kconfig b/drivers/base/regmap/Kconfig
index 06d7eb2aac1..3c76a5bf67b 100644
--- a/drivers/base/regmap/Kconfig
+++ b/drivers/base/regmap/Kconfig
@@ -56,7 +56,7 @@ config REGMAP_W1
 
 config REGMAP_MDIO
 	tristate
-	select MDIO_BUS
+	depends on PHYLIB
 
 config REGMAP_MMIO
 	tristate
-- 
2.53.0


