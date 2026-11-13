Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794601902;
	b=mNX6jQloj8X9aCiPqzsksv78fFBe4py19X9yfqbGChQPdwDtt6SioHggFrt1a1ZaZRWo
	 hbSmkhKLneBuG9Yq64XJasw8RH4fsYUKlyuHgtTaX0nb0JCNFkLM69FhucUX3CDHNjfce
	 Cp3qL6J8anGC3Lr9jkGDNsUXGi79Z3To2Voxxrh01E1BaS63q7+Mzod/8xXFcq/CSC+gQ
	 /Ucjixhou7CodQ7ZLRBGPxeGFYYOqJZ22JfJyMOio+VJRrvseBOHW+BJEWgd5XB+nCGMA
	 LA91kg6pNJ1I8zMtBmWx6r9dBNakPnmNGpHwTNK03lPoi6fN6tPT1l+DeoTHkmPdFKA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794601902;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 In-Reply-To:References:Date:Message-ID:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
	b=wtRSIxtqFzJKqHuL5SyBcYFWV6y+iGmR7t18U6nRnjbEonKb8WnTGTwxxFVVVlVaBM2I
	 ZuJVOKklQhD8tcg/ljX7xV79ZdiKnEQDwhCOJmYLCy++mp6QJ9TAlgglBDRF+iBD9gOXV
	 grY/fhW+6uQP+3BUWLLIBk5D46mlWi99TnI2M4+mrLKff9CdaT466lLb8HoVoall8ud2L
	 1BTIjwmtWTnoywAvUaR9VZOzsGWVceGgBM700WFhHuDrcgMM9W2EX6osLZYHtiEryqpHw
	 FrT02bc/TWqWBpo45wsUUASGfovaY4cza51isQ7Mf0Qgqfk2rWXeOZbM2NvZUIEVgkg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q09PlToe;
	arc=none smtp.remote-ip=209.85.216.50
Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1F7B606A32D
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 20:31:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1F7B606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Q09PlToe
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3b094fb376cso187926a91.0
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 12:31:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794601901; x=1795206701; darn=lists.linux.dev;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
        b=Q09PlToejgcaMq7IrsgXLvowjwcVpwI6wgXhkg5Y8mmwykzOD6gXVcpRWvbBkFJCFv
         NJ1yUdZ9F/Y7QOCFEOkyP4xcys/bGe/6BAHbtQ2pF6LT2E4NBi1j6iPEToo8sirAsnsw
         tgLTwa0va1oCKPLubFpdng2An9MXn+WM14GojR/TRQb8UIaHd2juA4pLglIoHOaatXAw
         jjM+xlpvRsCpil1+XpRWfRL8x2xc9HV4Qyzeu53qQZyco3fH3WtVR3ih7GvhK9s6Hc+Z
         oUM6fFfwSmWZOo9WoBEprVopDXJtNhTgVkrEY8AkC7PvZd8vUXG1oVOeavmdVdbQQfk7
         5Wog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794601901; x=1795206701;
        h=mime-version:content-transfer-encoding:content-type:message-id:date
         :references:in-reply-to:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YiZ77gIfuRvrG4OhaqVJrXWfgW4P+h0z/eTCC1VVgzo=;
        b=kSfmY1h6urY8FCouefihrPCwAUFXN2fAC3JQinzQO5XgvlU61TkU9CNgqJz3Oa7o7M
         rY1MYDMxFKwIEkYJk2CM82SYE4zkWMp9abUdBuAObvaZSLgiBIGM6K53xh8hcScWv9xp
         QOPRqMdWLM8fFcN6zsSvi/sBc24Vxob7ffZbQ34HAV3USmyWepVilFFc0wZxxSMwpgmV
         E5lsurJbkqmwyMxyhYDLHAvsObsPavgFZGx2dlyv+rNUxV93E9Kwk/tMhFlhGcACC7Kw
         xefpMzkUySMqeUXfSs0gFdtsvgN8+lDwovfU1xaFkNfWu0fHX92nocvDsDnit1tqKush
         dcOQ==
X-Gm-Message-State: APuU4Z9g1XkiAQsavFgldBMPLWoI2wAv91R6xGrS8METwhjzTT/rCMcL
	AlprWbjkGeYURGTjgBgego6Qzzm38bfdAJjesUixlLAUNppz3XuWFcB3
X-Gm-Gg: AYBFou2aJDang0w752Xdvm77DBwyZslolmatQ9JmkcqxOhliCVLcT/gOioDR6asjkXx
	poqNBy62qFmuN61zZkW0UWaYTkrb65cALNRt3VaddxBjlJnuaKH2NEoOu/9I65oUmIqljrH1sZI
	PKD+n69OPYy1ofs86ILlovPVPpiZfhxTy84Vq8G3oU8CK0ZL0aWJ7uRTOlJDLT6SlInpQuHVCXV
	m27OhnpzPsshMFZRtxoGyFSPf0GWZUhHEVZhz+d97EIBW2omjTMrXYVk5a+3UVObedJU83J8HlD
	zi3iZaZ6uynVEhZwB/4KQgZerFfX/iEOx+nBA2w4Y04wm6tyrF6O9P/c9/qIG5IdUi28onyKl3t
	vBlieyTiTN4mSeLFt5AaSVSIz30L0ae743ruJtNwvJ7Cbkx7P0C99I+YiQTle93X1R4WODckyJ2
	wNL75iC0X6rNxYvlRrRg2dw5p15F0E+60zMp8xemT1Les4NUbJ+XydS1Uh3KCSItdRql1VXHNzO
	6nq4KlTm+dewVjhTauo4R9PXnpeLOq22EU9f5vD4xk7CGyAU2NsYpNg6jrOeK2J6upJIB/P3kXh
	xq8NlK3XIqe/wrC9HhMamV/THWpvOS5L97a742/8+YLqYZEgm0ZxxndyZlhLfskkU+vLSAMs+mb
	eTexEyA==
X-Received: by 2002:a17:90b:590e:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3b1b0b85d16mr5379769a91.4.1794601901202;
        Fri, 13 Nov 2026 12:31:41 -0800 (PST)
Received: from claudebox.iyengar.cloud ([50.39.139.68])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b197d35525sm11051461a91.16.2026.11.13.12.31.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 12:31:40 -0800 (PST)
From: Arun Iyengar <aiyengar1990@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Johan Hovold <johan@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Saravana Kannan <saravanak@kernel.org>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 Ulf Hansson <ulfh@kernel.org>, linux-pm@vger.kernel.org
Subject: Re: [PATCH] driver core: fw_devlink: Don't report refused
 sync_state-only links as errors
In-Reply-To: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
References: <20261110-fw-devlink-sync-state-v1-1-6385be961c2b@gmail.com>
Date: Fri, 13 Nov 2026 20:31:39 -0000
Message-ID: <179460189995.183918.12921536578133287930@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

+Cc Saravana, Sebastian, Ulf, linux-pm.

This message was explained before, and I should have cited it:
https://lore.kernel.org/all/aixze8zFboY3huSf@venus/
Sebastian writes there that it comes from one power-controller device
providing all Rockchip power domains, and that it is not harmless: the
kernel misses dependency information. So "harmless" in my commit
message is wrong; the patch does not fix that, it only lowers the log
level. It also lowers it for every other failure to create a
sync_state-only link (found by the Sashiko review), which it should
not. One such case is being fixed at its cause: on RK3576, Sebastian's
"clk: rockchip: rk3576: create proper platform device" removes the
lines for power domains with a clock phandle:
https://lore.kernel.org/all/20261112-rk3576-clk-platform-device-v1-1-2f3ac9f09403@collabora.com/

Please drop this patch.

Arun
