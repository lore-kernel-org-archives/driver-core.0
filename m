Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492853F076B
	for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782811533; cv=none; b=ByUakinZaJ4FvZyON+YfxHArjwI1C2Siref/WmJa/HGMlA3vSLxyPk6EbnhZzj7E5oF7K0ZE32XLOyQ9v9Sh9k0sj1W0HH7YvEmKBwzbb0++09QBz1hrkydhmeAW63iD5TIQyBfG4QcS5Wbk0y2/qXD5crY0EBfpNIyh3qoyCLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782811533; c=relaxed/simple;
	bh=TXQdWnj7wZHk5vzSFJDCy+evsU1UAeHYNA+VsTtRhu8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cKlWeVFa4yNJ1KvHqnyDWZGGip7q6ic6mLLCsh2wwZEMqRz+60cvnR/RXpRUh80aBt9uqo/H7KU3lqwzMCHjSWqLXOI00qNSYXTLdzwnW2fiPPYHNdSKOtBExNxxOAstDkUK23LfredBUnLAaG5f1rsQABCqv8TSfMrBmazUkJk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=AgHBAGmw; arc=none smtp.client-ip=209.85.221.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="AgHBAGmw"
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-472a14c9965so1941014f8f.1
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 02:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782811528; x=1783416328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wAJmHDdIXOT4dHAXAwcwxQWuLl9PFcyPcF8egzTHrzk=;
        b=AgHBAGmwM+6nDhboHbvPr01Zk++Bxa8UAeEsikb6j8FeSeH36nNldCsnEPHJwpNv23
         ei04voW7AW0Q9zbLcF/eK3DNgqEJbTKS/bwveYj+n7k/m3a4GI+PoyBTifJCX8Yby3N6
         CdkYlSbc5FU/jGl3nygmm6mrD1cWEzTx09c+JySui0tJi9RvqrbGkU8XqXOQqhWbtRsx
         nKgg4S1VQkJ0/dkAkODTMF571lUhGMHkMCsvfyJuWxJm4afWcpwQC75Gx0XbcRxUZUiM
         hLSnosg520bJzaLyigi3QZJKhzwioBLjEpFnvD3xywCaLGSktm95SkO39/8aG80CfMQi
         mFBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782811528; x=1783416328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wAJmHDdIXOT4dHAXAwcwxQWuLl9PFcyPcF8egzTHrzk=;
        b=ne+xgRqgLJL4PGRMpmKZZOzy4UdNGBGNsRPssB5xC5nx9PLo5Nx+i3DRK/xuJXDHGh
         3+8L6JPIit1gDLNRt4WinObmChcCA9RVlsO1s2m+3o0/Bt32MkKhB7uWKwl20R9Ga2HU
         vCgLvUA/EMrSblGGKVuH2noVJKSthzjtDEZ990WwqUO11GsL/watnqeYQ04B0n7mObXo
         trsql+LMOGk6pQGkkWn+A0M2CYVRg2kq7z5CvrElL4mGzg6xFoLpPnAohLbAD4PNjhR8
         BEm4DaBTmJj8u9CMVD7Ap6UAY1hIDLxsEChXPjp8dB+jbtx1t+9HZSPIDR+9MVg4dywc
         FFyA==
X-Forwarded-Encrypted: i=1; AHgh+Rp7QDmucGuEtDWR/1jSKYqk2Qrnz5hm6WEUTcs2ja4qSaDWukQqmw0rML5wyY0kIwmndJA3IXHPtXhf5Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNnyuACeqtmTcijPWnfzys5ycuCGnvn/ZV2RCeWTFjQZyPK27D
	waoiV2Txn2leYU0Gtscn07ekE/8ovkNtUQB/Gwsx6ECIDwMKzTi7v7RZyStHWDLoop8=
X-Gm-Gg: AfdE7clcrvxJFYkMAkdXhKgcNh8Thavcy2o5zZzZdxzYEBzYimoAlUXwFuDdHoJexjf
	YlV/qA23rb4VSGvs3QwAGJ8BDw+2Piy0MPE7fHOF2zrKG9ADxMVN0I98ssWU68Z5fXANIWqeBTe
	fXoMdt6YTpNtw43qnTdwaLlLD0mIpZXTb1zGY1uJU/e7xlGYTniopKv6O4oXf+3Qh4KqQsDOslL
	6HhQ6DQLJEJaF6kvPPtm5TIPMnwGLNhPg+V8C8p14IkcSPApMSae8VQ9KB5O+L/NPh2yrpvhn1+
	yeCbmI4AG//8M3CM5yZ6Cq6V+nHmO9nDJg5tcCuMWXjz/Zv9l2eRy0Ya+duJICeE4WPz7fbusmt
	rz66H+S6Y9wGz/JWx0DNtTgMVPc9pRdLUhdaX6Ey5umrPCl9UY5P8Q/gbuI+EMzT3BU9Dvac0tS
	b4pyd2WbIEhg6pH7LrCnsIpyCk/eZ1ICCbwVyq8OcJbePU4LJhiXJkQERDgaBSN6pKZywKAlMmt
	zZA
X-Received: by 2002:a5d:458d:0:b0:46d:d5da:f0ac with SMTP id ffacd0b85a97d-475534f1ea0mr2873787f8f.47.1782811528611;
        Tue, 30 Jun 2026 02:25:28 -0700 (PDT)
Received: from localhost (p200300f65f47db042c439d749f38355a.dip0.t-ipconnect.de. [2003:f6:5f47:db04:2c43:9d74:9f38:355a])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-4756636cde2sm6265534f8f.20.2026.06.30.02.25.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 02:25:28 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Takashi Sakamoto <o-takashi@sakamocchi.jp>
Subject: [PATCH v4 03/17] driver: core: Include headers for acpi_device_id and of_device_id for struct device_driver
Date: Tue, 30 Jun 2026 11:24:22 +0200
Message-ID: <199ba71b4ac73f4b4d9f5d2be635c96eec73c70e.1782808461.git.u.kleine-koenig@baylibre.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
References: <cover.1782808460.git.u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=1178; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=TXQdWnj7wZHk5vzSFJDCy+evsU1UAeHYNA+VsTtRhu8=; b=owEBbQGS/pANAwAKAY+A+1h9Ev5OAcsmYgBqQ4tNnH6scU1tPgA2PfI6S1Qrk24vPzguIAZ2c iIma4LEZvOJATMEAAEKAB0WIQQ/gaxpOnoeWYmt/tOPgPtYfRL+TgUCakOLTQAKCRCPgPtYfRL+ Ttk5B/0fQhLM97Ss0R7CgJkRGRWKJ/NSyMpwr93tSailzLWBwt7QbyxIyLSXmKNEyU60e9zs1ay ozeJ4xhq3wjSmPHRIHvtQKnJyny7fXOnMO6cGRFF1zJB00/V1RMmCeTYTd/wwSks+1Jx1j7jknv w8x3wcCSAYuySF7ERSQ3YLpaHc5WoCeEEUcEhhxJ9C6odnEEiNxZZwK1X4aeisn551SZv8A5MOd 5eShqtlxC/R0yKOSfVZXpendyUPztrJQpg7lf1FdNGqA2Y0syL/KPBerHETYJPpd2BjDqv8nUS2 bXGXbIX0ySfI/kAkrxYuhQcdLwIpNTlU4BpQJ4E1bwiGi7uu
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct device_driver contains pointers of type struct of_device_id* and
struct acpi_device_id* but doesn't ensure these are defined. To make the
header self-contained add the (very lightweight) includes that contain
the respective definitions.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Acked-by: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Link: https://patch.msgid.link/eefb7f30ca1e60b4be38e5a6968dac7641684d34.1782682124.git.ukleinek@kernel.org
Signed-off-by: Uwe Kleine-König (The Capable Hub) <u.kleine-koenig@baylibre.com>
---
 include/linux/device/driver.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/linux/device/driver.h b/include/linux/device/driver.h
index 38048e74d10a..768a1334c0a1 100644
--- a/include/linux/device/driver.h
+++ b/include/linux/device/driver.h
@@ -19,6 +19,8 @@
 #include <linux/pm.h>
 #include <linux/device/bus.h>
 #include <linux/module.h>
+#include <linux/device-id/acpi.h>
+#include <linux/device-id/of.h>
 
 /**
  * enum probe_type - device driver probe type to try
-- 
2.47.3

