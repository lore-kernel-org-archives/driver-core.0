Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD3363CF678
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 16:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775232604; cv=none; b=fbCsf0IKAGeFnXxsKPZnb/Ds3eCrDszf/T9SlTHafEO+oIRCNHABdRkmmKUKDd+LvwGYRncNxko8duUA5XOiKjhknHoB5yEigER4sFK7ic9e75rCg4dNZmXHIxe+NC/UJfNvIs0Uu7GyDFhKkrKtshKLADcQr83GJMr2jUU/Znw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775232604; c=relaxed/simple;
	bh=N4PP06m13NVeyUJu1vz+YQr/JNlggaXnXk9toV/NnYE=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:Content-Type; b=btnBjYQVoV+1kct7hlKLMEoDMRsfX1d2BiBv8kldSWKRsJpLAbfHF0TQNA5CeQvizVR98Ja/EH/mHMoZlBClgtfgsMONyjyXdDQW+o+paq3Ou46rUadTmvnsUIrbh5BxpYGV17VUagED+Vk0E5BtmYyWszvQ+hGcoG6/7+XUc3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j8uyq3V1; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j8uyq3V1"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48334ee0aeaso19160505e9.1
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 09:10:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775232601; x=1775837401; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yOokx9rHSXRUAd5xTDChxnMcBVuK5oRv0xp0uVULe4Y=;
        b=j8uyq3V1ZFe3MTKXHOBqgNWuuEyWysGWnx+0izy2fBWZ91T7mClCrZerigFTifappU
         FWKVSJw/YUehJWuJgboeiuLFh5WHaXU4wDiAa62Df6D+inZgL/DpvS96xOllEe9mv+Sm
         jFMb+yHYrqj+zrwGLI2tEJsaMyz6HMjrkJlBpaq+wAKEQUVKjqCGAf6gw0OHJFuTuxqe
         c/dwZLoAHlPWftOyNTn6+Q5NMH3b6n7Kd9tbV5CjSBIg/DmeE4nRmpO51C5IOoqkePfp
         z/3AdgiUG4CmwdbE8UstpCfodqTorAIOE31D2cK6K9Ynu8k+Tu7LrENaqsPhA2FTHb0M
         O4Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775232601; x=1775837401;
        h=content-transfer-encoding:cc:to:subject:from:content-language
         :user-agent:mime-version:date:message-id:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yOokx9rHSXRUAd5xTDChxnMcBVuK5oRv0xp0uVULe4Y=;
        b=NoXoMPn65FFos1dO5JWnJqE2l0CQtol5STULqyF3PEzbUukD6dyaKWlBnIPqv77AFU
         ZIK2y+LjO0QswwgRY0WeMBf9OrouId50XuNAmUx9ABUKZroRbbZauPgxxXEmG4ay72Cr
         98wlNFn/6XlOVDkUyZpzE6ET9k7adL0B60Kj1Kodeoz2ACFfY6u9djIN7ze5t8TRw75H
         3SkgImbOu3lzyJ39laafebVT0h/qVxQNJoZ74xLhZMYEos2bSaNebJZ7Aj/pPZhtAZYX
         AjOqRXO5L+yJgj2FkrPhoz32tlY+IuYuA4DwvTIV5ZAFz/zSdslymhjl3wxPnDJS7Wk1
         SmRg==
X-Forwarded-Encrypted: i=1; AJvYcCWdcSwnHtGrCtKQbnn4o7JdPHhIQUV6XoVnnNpJAR0IcydzuGMUrzZDasaxL2fnaR/n8Akz7zwPJU5W/g==@lists.linux.dev
X-Gm-Message-State: AOJu0YwCv9z1Or7v2pSg3AnJpY8VorCVv05UduEGFcshSaEYZI1CEL07
	+Y9X9//ykEOI9lNJ0+mM4YB01RRJcz8vGFOow3Irorl2Q8nSjGI/jMop
X-Gm-Gg: ATEYQzxOQOODVNdAlPbQe9Xxyb8QBaN7R86keUi4Pwq5TJrNO1CCbvKU6mJBTSZ4Ly8
	QhpcdvMD9i6zchtABU3+W0kMOaNR3fsZZGQkqNrUjVB0OBl19Et1D86SdTHKp3aP5rbd9HBg3bV
	vpHm9hrT1f9wTvb6iGasxWNiSrkvAZo3kJumvJo7eXJqYjnAgaWqfADwgo/6UaVAkgdTjxLaCg+
	Ei5Zh4nJfLfCZhqtgt/0D+TohMGJmb8e8vGbcTrRssZ2svkLA9Ck/B/Q2EKQrF99EmeOXfBi6TN
	eMutoRhKDWJI0Ng5VF3HgY+/iT2oTkpSbMHHoKx0p7d4Pw5UsHzIVzfq8YaJpi3YDPC/SKKULtO
	UZ85f/Qa6qjzCF4MrlapM6i21AVwf2rwM6qH6OoKep22ItC+dZzHblz0xOXGi//aGjhwBdSodWn
	12mHKbMIe/htmmT+RNSgC7UKtfPVUT4PWSkjUdJf4r8hfZQPonzjPuJkXiTWjnNoF8eSMlGK6vw
	pATtfssHzdpxCcI4ODh/BPJKCtMBnD/0qa6hFuf2Aiq5NoFhR0Ku3qN/jD6c1hVWQ==
X-Received: by 2002:a05:600c:638e:b0:487:59c:2bb8 with SMTP id 5b1f17b1804b1-488997dec25mr53434575e9.27.1775232600878;
        Fri, 03 Apr 2026 09:10:00 -0700 (PDT)
Received: from ?IPV6:2003:ea:8f2f:db00:e1f0:894e:62a8:6ac1? (p200300ea8f2fdb00e1f0894e62a86ac1.dip0.t-ipconnect.de. [2003:ea:8f2f:db00:e1f0:894e:62a8:6ac1])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e2a6f08sm19285323f8f.6.2026.04.03.09.10.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Apr 2026 09:10:00 -0700 (PDT)
Message-ID: <ac269a91-0ba0-4798-acc6-ec294926bbb0@gmail.com>
Date: Fri, 3 Apr 2026 18:09:59 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
From: Heiner Kallweit <hkallweit1@gmail.com>
Subject: [PATCH] PM / wakeup: Register class wakeup in pure_initcall phase
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
 Len Brown <lenb@kernel.org>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Wakeup sources (e.g. autosleep) can be created as early as core_initcall.
Class wakeup is registered in postcore_initcall only, what results in
autosleep wakeup source not being shown in sysfs. To fix this,
register class wakeup in pure_initcall phase already.

The current behavior doesn't cause any known issue, therefore treat
the change as an improvement.

Signed-off-by: Heiner Kallweit <hkallweit1@gmail.com>
---
 drivers/base/power/wakeup_stats.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/power/wakeup_stats.c b/drivers/base/power/wakeup_stats.c
index 308f8bde9..30f0d3d61 100644
--- a/drivers/base/power/wakeup_stats.c
+++ b/drivers/base/power/wakeup_stats.c
@@ -216,4 +216,4 @@ static int __init wakeup_sources_sysfs_init(void)
 
 	return PTR_ERR_OR_ZERO(wakeup_class);
 }
-postcore_initcall(wakeup_sources_sysfs_init);
+pure_initcall(wakeup_sources_sysfs_init);
-- 
2.53.0

