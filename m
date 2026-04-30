Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF013A7824
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 21:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777583724; cv=none; b=Z0iFubQ2l3CGYDXWW0iHIvsu2pDtFnD2cnaKM1BXb7ZE+N7G+kak+YBX9QRNG81BhpiQDj4G6LIjrhBuoDkds3oyecqecQVenwQ63hzuj7UwUftOIi1FINT/vip24MzYXX2MZOk6GkmRe3bAZ7affUBN3yjg5c60lPZI51OKNCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777583724; c=relaxed/simple;
	bh=KTwLEUWIT+e8jUbhS98OO0Qav97udJRTNz9JCBY3tFI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NfyrvdP7mpAaD+/Uu3nHRcIrG/+LLYZxJIOJQbfou4kAxCT/KS4viWdQ2seIt3aCguJY4rqxtEHoNP9ClCN4l4KWNNhLdjUEIfNFYOLoAJqnhB99qXrHY3n1Sy0H1kqdbvFeQCeZQNebM73PWqWoJcoMg8YVmU1wBvxIpndCyd8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UbA4DZfn; arc=none smtp.client-ip=74.125.82.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UbA4DZfn"
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1642965eec.1
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 14:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777583722; x=1778188522; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=xfBNagKOT++Xre4nZSTbTP+Vsr/9/6AIqRC97WNWrdQ=;
        b=UbA4DZfnONNQ1vWgA40EcbO5YjthEcjX63hTZGfqwekBWDufN+etfy3rQDDf0LI9RG
         SXqvARc8SDN5T0XgnrFH85zhxg7XL+3tHviJ6k3dMyXnP9/Zl9RdqI9DQF1aOMIAmqHL
         4FBENRAMziMwhfEmzXmftStF3fnvYzX1JE+a9eX8G/Z4AoCaxnm0YeuobCPaAZS1fiQN
         y+67TVxn2Y64lbHvUFlEdhTHorTSdZHG8YCOzm2y3TmfMOoTE9QfzU0nHIiirxz/hYK4
         CsuNFU5A5pN6jZqF7uopXtAS+ufmUQe20q6CGYiIhF6atufpqbX/eZoI34JB0r0QY8al
         UozQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777583722; x=1778188522;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xfBNagKOT++Xre4nZSTbTP+Vsr/9/6AIqRC97WNWrdQ=;
        b=Ew/JJLOxV9CVHvgN5/g9BOCsOfU+bXhy4Mj5E+N6U+gFBBf7b36fscuCrPB+ZDwo4s
         fulThRxRAvjAqVhqM6G4yCwRd86oHCORxVn2L7I3esyp2DffAohvVGHlsAvol+nrxbUK
         dkUgmSvnzdDpmpPkYRL7pgt4qk8LVGyMxxN2aGOw0SvSxkUj60lF/ygBG5mGEGCBnNbl
         OZ0lXzSKj5E8GVwYqOxr7LcndO3RsgO83TYeoDQJdv3eUJ6ot3/593KHG0AI8ycOg2H8
         mutsIApeMPbLZ/vN1OaWvmRM4ihYqxSZHztfM8z7hU69cZ9u17474JgyhBgfHeytqr1M
         tBYg==
X-Gm-Message-State: AOJu0YwknlBQ8svYfM31AI9KfM85/bnvnHAQlZWd4ro1nt0wW/R9iJrl
	f8nKBe45iFJvlgcHQewQsan3wGX0JZpuC2O0X2/gnyrUYaUV78wflfUL
X-Gm-Gg: AeBDiet9gyL62pR8QLNAcKLvhK+6/LZ7n3RVbYaXuMWzpcoS1n4FnOM9Ltt0RZObJ2F
	8KKIRX5KmPP9zot7avJhxzlj2hetI3pIp8l7VDCPLVXvP7ETA+8BN+Jyq+iKh6rq7pQ7ZkYp+Es
	ItSul6slZtF4DEJ1PEgaBIgCnOt9x15fmlNK/qJzPItiaxHIIrUUV/R8PHr9zgcL+6iU5UhbKd0
	OJSWVYbJIWsTXTdDn4jRN6AdJvcBMH1H3EcHmNsjSkVgDjUtfPCGt3DpE586H8wP+XG9j70kfJ2
	d+cEEb+xHVhQ/Nuw3RxMiGmDJvm/PkoZw2AqwMDJotYzgDXgDaXAWgMxc1Qm//BiNBCsxD05YT7
	eYMgdQgsYAskLAOOlCiKtEb8SQ8KR31OFrgu7+OG7JF8bXoEim41Y8bzgfLafL22BS/8VjM1Dfg
	A0tib07akUTPLVY2ZmMJgSGe2z++NaNO0/DorlI11a7H5IAsBMMnVFuf18TTo2s0pLgRfgQwm10
	pFWoPCxhnmp
X-Received: by 2002:a05:7301:fa13:b0:2da:10f0:a8df with SMTP id 5a478bee46e88-2ed3d8c5045mr2082996eec.12.1777583721885;
        Thu, 30 Apr 2026 14:15:21 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm1581959eec.22.2026.04.30.14.15.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:15:21 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Subject: [PATCH v2 0/2] firmware_loader/ALSA: Fix TAS2781 async firmware
 teardown
Date: Thu, 30 Apr 2026 18:15:09 -0300
Message-Id: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OSw6CMBRFt0I69pm2NAUduQ/D4PUDVIGatoKGs
 HcBXYDDk5zcc2cSbXA2knM2k2BHF50fVuCHjOgWh8aCMysTTrmkgjPALiK0BiFh5EXJoJ5AY9c
 p1HdIFoPx0wC5KqSgQqkTL8m69Qi2dq+9c62+HJ/qZnXaxjejdTH58N6PjGzzfs2c/tkcGTAoC
 5HLwkglmLo0PbruqH1PqmVZPjzBxEDsAAAA
X-Change-ID: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>, 
 stable@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2253;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=KTwLEUWIT+e8jUbhS98OO0Qav97udJRTNz9JCBY3tFI=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfj6WsXnRQfsuy2ROPl/9l9nlyz+Noxpxpi8LXNj40L
 3iaXfjhUUcpC4MYF4OsmCLL6qRFlnu6Hlytj1vhATOHlQlkCAMXpwBMRLiWkWH6xkPRb99OCveb
 9+DD/xeV/sylDOcMlxk8nFwukuJccXgWI8OXlCt27+JMd9jEnerJnPvIVVLb9VOV8ZfclBVimxJ
 u32UEAA==
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

TAS2781 HDA I2C and SPI queue RCA firmware loading with
request_firmware_nowait() during component bind. The firmware loader
keeps the callback module pinned and holds a device reference, but it
does not provide a way for drivers to cancel or synchronize the queued
callback before tearing down driver-private state.

Add a small firmware-loader helper to cancel or synchronize async firmware
requests, then use it from TAS2781 HDA unbind before controls and DSP state
are removed.

No hardware runtime test was available.

---
Changes in v2:
- Add request_firmware_nowait_cancel() in the firmware loader instead of
  tracking the callback lifetime locally in the TAS2781 HDA driver.
- Keep the TAS2781 change to a cancel/sync call in I2C and SPI unbind.
- Drop the unrelated cached kcontrol pointer cleanup from the previous
  local-driver version.
- Link to v1: https://patch.msgid.link/20260430-alsa-hda-tas2781-fw-callback-teardown-v1-1-874367d6b41b@gmail.com

To: Luis Chamberlain <mcgrof@kernel.org>
To: Russ Weight <russ.weight@linux.dev>
To: Danilo Krummrich <dakr@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Takashi Iwai <tiwai@suse.com>
To: Shenghao Ding <shenghao-ding@ti.com>
To: Kevin Lu <kevin-lu@ti.com>
To: Baojun Xu <baojun.xu@ti.com>
To: Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: Takashi Iwai <tiwai@suse.de>
Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>

---
Cássio Gabriel (2):
      firmware_loader: Add cancel helper for async requests
      ALSA: hda/tas2781: Cancel async firmware request at unbind

 drivers/base/firmware_loader/main.c            | 82 +++++++++++++++++++++++---
 include/linux/firmware.h                       |  9 +++
 sound/hda/codecs/side-codecs/tas2781_hda_i2c.c |  2 +
 sound/hda/codecs/side-codecs/tas2781_hda_spi.c |  2 +
 4 files changed, 87 insertions(+), 8 deletions(-)
---
base-commit: 1bc46462f4c09f8d429ae8ec17f92886d604659f
change-id: 20260421-alsa-hda-tas2781-fw-callback-teardown-3b76404bb928

Best regards,
--  
Cássio Gabriel <cassiogabrielcontato@gmail.com>

