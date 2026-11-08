Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794145568;
	b=E6Vra127r7KvAuo2I20mRG1QbG2s6CKYSUyd+1Tpjrjibi+x6jEbMXPB52wQMdeaLQ/p
	 Ykd7rKtYpGTM9/fyJ35GLaeenuWymb1mTxGiULwoP1maWeEOZk+58LdgUh+hzkIti0zPo
	 m51/9j+17yxFUZNEL8y9FUyiNRJd4mS6uzXuBnlv6/XJau+MkeZ8XRNn3nhL7SciIduzo
	 SxOSN80JIS44/cs6Wl7ckbna4wunm/FaPLRv54VQdAkzQwv4pHIcGys0nEzf72QOCABA4
	 479sITN2Sd70cE6pcnWMJnXswKwb1W9GCNyTSMGWQYeEbUr9vReNi1qV2H4K9waUf9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794145568;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:From:To:Cc:References:
	 Content-Language:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=hcBwG9BESwzJJrAjrRG2UH1edFRUWU1jC36ybyR6a84=;
	b=kvvnkqdyRxFjS9ASxFkDAjrwd1dwyZOu1pAA7zLsFR4s1RX1wDav39AEgY1DvZJjPuiv
	 w09iBLEsu3O+XfTPQ5Vbdd5wLMmC5pmrB4Eyz0CAhNmLww9qDfsvR5BjZNNU7LyUxym1h
	 dcx3uO5k0L3kPqBEC2y/xac6wBH/99Es6lp5OvIpt4Uz1EtwfqJj3zr0lm087XtrleGDb
	 KgS/zrh0jm7F9J7rtZB/lt7SyoNt2qLUj+8CKpRad9mO4LHxNX0ifD5U4XJMGvGWMtPI/
	 faYRM6WWt4NutSf86EUFqKYNW/zs5VKtnR+Ar4X/MHqJWKbw3gkD0Y5liPGgS55mYlQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="vOd/f1eJ";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E19AC606A31C
	for <driver-core@lists.linux.dev>; Sun,  8 Nov 2026 13:46:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E19AC606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vOd/f1eJ
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so440415e9.0
        for <driver-core@lists.linux.dev>; Sun, 08 Nov 2026 05:46:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794145566; x=1794750366; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=hcBwG9BESwzJJrAjrRG2UH1edFRUWU1jC36ybyR6a84=;
        b=vOd/f1eJg4CnQ93MowoIT+7XNzf2LULuPbj+kcbT95KGrGEtRaI56ty3YE+JNuQKyF
         r9zkrTd9wOQ30AMbx8AYvl8gwib/wz59f5yKf3iU2n8nAt03XlOGZqQtwOTKkacoNaMh
         GcITMBCA62P7ZeUVQxwx+64paeO4HQ0Wgc67Ff9pfY4KR/JierLLDDZJyFV39mgwFJJ+
         ROWi0/w+VYXgYb2q0JURtvDMfbcQyWERgpofTh7UlYkQD9vFWhNL6VVaGmKWpmTRdCNc
         qtWf7hNR/jxAOg25MqSJmkcng9D9QpIKkYAfSQvyJWwdpD7412xCgse0hzg5edpS1ONM
         s77g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794145566; x=1794750366;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hcBwG9BESwzJJrAjrRG2UH1edFRUWU1jC36ybyR6a84=;
        b=rU0mTvg+vTGLvts92TG7EWPZ2tLHZiWjofA2RqF5HEO4blYv8F315EicC+Z2YPQgKG
         xczw17AE/5HmaOImH2X7f4jU4sOZ+0LRfa17i1wjm6hLIZLwC7EnJUIDE/0hP6WtjYrE
         HnDmtSPmoeqAG3OMXhNG4IbAmRC+SrrswpNvbfd+8/jGCVI8SUHosHeBQu0M9wuojYbN
         4+L5NDRG7zmcPc+V2UFPSZYFWNXss1mIpQ8iomOGmhQFe+GwH6ru6qWai31h/l9dQJmL
         jw8Q/L4PeeuXNIxS2TrbV5y579z8suZc/G8RBpNsU549rVEM6TN21UM417ccIWCcHsM4
         8vxg==
X-Forwarded-Encrypted: i=1; AL+hErEMNVIEN5YpGmhpqB4UqzzjTNSfk8URM6ZrTdQy1j7C52aOJKyLQ35fc1Frm0BFSwI1l+SRhR8EClB/zw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/u8ugi+36AO1TpYAg/dqgCb5CZ+J8xMGqD0qF3mU/SbsxKtVxf
	TbKb/ymArvry2S+NTlscn0toy9+T7pNjVHxUZuXbxTcf2A8NHknU+5gu
X-Gm-Gg: AYBFou1qz5MtsrkzISiy3HP7xgtQEJFbtnXsaOYlQ3BfZPaj9s1Khe1QwgJ6p80BtyO
	G8vR5aqVw2L0sSSY68cCvY1gpVMdrWBxbWFIUQKGm4cUY5qm3JSE8E8bn+rfj1+nPV+VotqsPGx
	6puC8HosTNhic44d5d3C4ZWDlnLY2X78g9l5RsX55aFYC5bY+6Ff90+eSmxgVL75IAFoFFKv8vR
	D7xTYfNKCLyjXcwtS9AGYjHgzPtuxXkIxBugrnYf02fbqCrNhwhOJohlxCyXNGj/77JW6TDRbYi
	WYvDuPPZxI4nhrtnN2nShLgGx1113J1usTZvaeEqdri89O844G3UYpLWsoodPqwHjAs8IP3Jwmb
	crlTiZQZCcSFFyubCDjA5RfToqO+Plz02FREZRcuBZBRWzlyFgLqRvdjKmg1RRFyPMg3+lpWSke
	+5p6pJgzPd26n3KNDG9rOc9PpKXTnUzyWJXMkgg868JoykvX002Dl/w3yaNo2ITg7sjCW05QtkD
	WzNfGNIiUqUmIdFqQ7DWWR8QvZKMQhwzRbettKs1dxzAogFcgD3mkBpuv6AsjEGzD9Py6w/0PB4
	XZC7efYM7N2/o9aOMYOFc9KuOvWnmBquWUNrM1u2OBWIZLgV3s3R94tmRsvPiLco9Ij0bplav/c
	mNmr8sPglXw00EZoGNN+YcvcS6X5kmOVR8PAO0GAFNDaEyZKkeMwJHaN+FtweZ4b9ZQ==
X-Received: by 2002:a05:600c:6216:b0:4a1:fa27:df7c with SMTP id 5b1f17b1804b1-4b963c88223mr28399905e9.34.1794145565592;
        Sun, 08 Nov 2026 05:46:05 -0800 (PST)
Received: from ?IPV6:2003:ea:8f45:7100:cde5:5d75:8598:b64f? (p200300ea8f457100cde55d758598b64f.dip0.t-ipconnect.de. [2003:ea:8f45:7100:cde5:5d75:8598:b64f])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4959783f1d6sm4112312f8f.46.2026.11.08.05.46.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 08 Nov 2026 05:46:04 -0800 (PST)
Message-ID: <675f4353-125e-4168-a617-c0d1fb519045@gmail.com>
Date: Sun, 8 Nov 2026 14:46:03 +0100
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: [PATCH net-next 2/2] net sysfs: simplify creating empty wireless
 directory
From: Heiner Kallweit <hkallweit1@gmail.com>
To: David Miller <davem@davemloft.net>, Andrew Lunn <andrew+netdev@lunn.ch>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Johan Hovold <johan@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
 driver-core@lists.linux.dev
References: <0a0a7987-abb2-49c8-bc16-3938233ae9c5@gmail.com>
Content-Language: en-US
In-Reply-To: <0a0a7987-abb2-49c8-bc16-3938233ae9c5@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Now that an empty directory can be created with attrs being NULL,
make use of this new functionality and remove the dummy attribute list.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 net/core/net-sysfs.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/net/core/net-sysfs.c b/net/core/net-sysfs.c
index 5c0402389c6..f58b59e1126 100644
--- a/net/core/net-sysfs.c
+++ b/net/core/net-sysfs.c
@@ -910,13 +910,8 @@ static const struct attribute_group netstat_group = {
 	.attrs  = netstat_attrs,
 };
 
-static struct attribute *wireless_attrs[] = {
-	NULL
-};
-
 static const struct attribute_group wireless_group = {
 	.name = "wireless",
-	.attrs = wireless_attrs,
 };
 
 static bool wireless_group_needed(struct net_device *ndev)
-- 
2.56.0

