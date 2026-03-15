Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 057DF33A007
	for <driver-core@lists.linux.dev>; Sun, 15 Mar 2026 16:47:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773593271; cv=none; b=fHa6mnG5l8Z6EpUYEc3ZV1tAXF3bwQPfnUAqBxQwCxku9oJloesdLj8R0klpxxHCXCL9jNu/5VF/S/csUwnFU4vXTg1XtV20cZd+VM1KI8UXA1mGl+SaFOVccOa5s47NwrpbhIkCyW2eu+NHdmvTTthP/TuYO93K8aTFc2AfEls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773593271; c=relaxed/simple;
	bh=+Y4ynhNriKUYfmbqW8zN0eSQ5GNE1oJxqjkaTlxkscs=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=JcNVYwcg68FpzMPH2Uhbe6sjrRXb5QYrqGoG/IXv+oRL0AyJspSslsleWvnJDMlXyvoArSc0t1AfTnkGrU563n3KNOuPQOgiUALQS/w/b+Jjgt9jDLSrLMOHBdGybRi/oQseEj8QiJW+OIGoOxmUhn3rVTF6n7FMG5YF5fFWhZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDmvRYGG; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDmvRYGG"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-485410a0a8aso34652885e9.2
        for <driver-core@lists.linux.dev>; Sun, 15 Mar 2026 09:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773593268; x=1774198068; darn=lists.linux.dev;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qrxv2HLiIJDNWEqTvGIziEdTL4sk4CtNDSGCcqyAKpY=;
        b=fDmvRYGGgU7dyRJdwpU5ZxDyV+r7o/xa1r8RPjkAF0B+Ch/Hv+J8mfp6oZkeTTdWmR
         BffGxLwSV1mU1aWXainJuhbptacNQD1kdvU0A26VuzcDDBNreHVvr/JGHj5/jK/g41OE
         pB94ckcoFHXw2ozR+za9WAQQVQScKO9g31QOfOhqDZdFZ436NOQMbXR79jyG0gwvzn9h
         +LJlwakz3Lqvj+1sNtTn4Qr+BBKy0c2OfmRWZIhhiuNI+FHf1EN1D/j3OKPDPhokHt3E
         /vxYh5dgp9PTxqgS3yxGtpaswmfQie4L0/YECok6ZjiNLLeXkxKzWMWwK0rcr50TLRX+
         gITw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773593268; x=1774198068;
        h=content-transfer-encoding:subject:from:cc:to:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qrxv2HLiIJDNWEqTvGIziEdTL4sk4CtNDSGCcqyAKpY=;
        b=UOwcAxciMWEF5Spud6ScaCcv4ofYb8Oe91Fm5HpPZCg145OttUgC94fSWtEfTO7i63
         xCGeNRaEwEAeb3CMiRMl0pcKLIBtI/zOLwb6SHYC9/jX6fKAwNxFRg7Stx8LyFi1RuCn
         0rFR40VRQf5amqyZQLq0Farpr5x5/Ojl8636CgQvI0/JzmuEArLktU0bk5gAZDgxfaOR
         63MB8GbSrX2ut7Xqo7eW01VAW07948BG7e9yHGj4Ir2/ObfQqdyJnWiZ1GITEhXskp+n
         D8M4JgoCv6ha/HGjnrUp+lyXPX23mJeG/9Vqi3kS8RLfm7HimscYn99iSwH08vrwh0MK
         +eEA==
X-Forwarded-Encrypted: i=1; AJvYcCXihKMUNxfucDFK5fWBSZHEuS4D20lYQv1pVZLVW9eSD6QSmYhtlWN/Wom+7Wz4FP04oPfiJY3pCVsr8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyrc0pt1FXj+xKZZOSip2d82DhCuTKQ7wPh5G+QUr4OAM4Hxyn4
	h2croHvngnur61FhMKJhQC6hkKDjaiV5/00VfRdm0GNk+eVONuo8E2fX
X-Gm-Gg: ATEYQzyl0hnEwQbW46mSTWvuKqHbTwmXrcSgutlgN64/QPUVbhHFcKheFqU61g5b5Sz
	QLsxnYDIDBITBurP7zJluUkSdQXnzvpIBFo7csya1BoIreUiR52tZdaCQfB+3uDe+rvTYGpLUlU
	IBIUbXirpNNj/+lqZPlJlVF0hyQIhNqKysXSnYRZbKWs5cNPv92wBjiqMf8yet9SBDgOtJOO6tf
	vYpJwgjjkbcQz0FNtHfpbGPoqyIEPmrFqHJqD1g91tq0zG6rtcRhiwmRfEBNO2Ic1Hjd1CuaEds
	3ejnWRXjxHKuXoQKINYrbGN3AjWK33c/hQRBt9qyJoKZTJ3moPHU8qi4n/4EgpiSootCxiIeh1p
	+jgO2HGgKqK/v9doulkDB27WV1mL1MvaMzwYkUV+XTeB62eubozCilrEYgcrYflovkeqabSs+w/
	6AHuk20YJOgEs5UBKfPTnwrC50MH0LWfQ35hYHN1lh1J9IQTuJRVrX87SajfURWsKY3JtYs68eX
	ueV9Bkt8EOTa6IZxDQ9hDcKnplfVZAxPuYQCRKgc9LENCByia9pyTDGxcxT51PO6Q==
X-Received: by 2002:a05:600c:3b17:b0:480:1c69:9d36 with SMTP id 5b1f17b1804b1-485566fa9f5mr165176505e9.17.1773593268192;
        Sun, 15 Mar 2026 09:47:48 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f19:c400:5d7d:7d8b:dc1a:ae45? (p200300ea8f19c4005d7d7d8bdc1aae45.dip0.t-ipconnect.de. [2003:ea:8f19:c400:5d7d:7d8b:dc1a:ae45])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48541ad1e4esm458699945e9.8.2026.03.15.09.47.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Mar 2026 09:47:47 -0700 (PDT)
Message-ID: <bc63cf87-3dba-4ab6-9c84-caa7357c3273@gmail.com>
Date: Sun, 15 Mar 2026 17:47:47 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Andrew Lunn <andrew@lunn.ch>,
 Russell King - ARM Linux <linux@armlinux.org.uk>,
 Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>,
 David Miller <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>,
 Mark Brown <broonie@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 driver-core@lists.linux.dev
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH net-next 0/2] remove Kconfig sysmbol MDIO_BUS
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

MDIO-based regmap is the last user of config symbol MDIO_BUS.
MDIO access needs a MII bus, which requires PHYLIB for the provider part.
Therefore make REGMAP_MDIO depend on PHYLIB, what allows to remove
config symbol MDIO_BUS.

Heiner Kallweit (2):
  regmap: mdio: make it depend on PHYLIB
  net: phy: remove Kconfig sysmbol MDIO_BUS

 drivers/base/regmap/Kconfig | 2 +-
 drivers/net/phy/Kconfig     | 6 ------
 drivers/net/phy/Makefile    | 2 +-
 3 files changed, 2 insertions(+), 8 deletions(-)

-- 
2.53.0

