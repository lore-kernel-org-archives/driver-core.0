Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1C6E3B9920
	for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 21:59:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782683994; cv=none; b=YTLgw5277LOXLfPsCHqyxlMi1+IX2tUgKeoun9o47xKxNBzNCcSWBkGsi5CUg75SH3oPYIlKG4re1oDt3LgMfOye5bf9CPrdoRXu1Ku6srfEVphdm83vmWY64JnvnZFyABY7SyCABZoVczKtiyei/Aj3nOneUwToGAHtcO8W1WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782683994; c=relaxed/simple;
	bh=WUjZ68GBCMh9qEXZ0xuireCu175XvUICYDA7yUYo1XI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=dmgcL4iVaRMiqR0JMTPqLIicMej5/xEOA7upV3/bW0TD/bT7lj7aypWys21iNJZh8StDrr50WYadEqtAzcchLix0e8N3yBDoqz3stsaFesjDvsz8pAevrtCd8+XDDjXeFkLSNcue3/ayjO51H+IKblQoVOnXofD2jJzP6/+vM6Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=LjC+Vb9g; arc=none smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="LjC+Vb9g"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493a54b80a5so12739495e9.2
        for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 14:59:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1782683991; x=1783288791; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=96G3vLI8uCc84HNIGPthXmkZNP/sIBCAMjt72BhEVAE=;
        b=LjC+Vb9glq8INAyvIs1Fc12VZD5U5ZCGk0eOfgzkGJJvgFyJhPzPF58t7nJpR7Xw2k
         NGNKgWVW2VQ4MTiwQ1jjLlg34v5zgA81IHl9vWCU3FaZlizp6P5hjgNtaumzZpdrUmSZ
         D8W97JZnI3ld5+2FWInrC8KqP/IPT/Qz3PGM7XeRtKj+lZ2LEHK7Q5AKDGBPInJKIPia
         yc/LLCH2O3nygq9a2+hBSQ0EtuaZVmELLIgKi7JjQLkX1oANq9WC83rx4V6j6AknHQfW
         /vOsudMc4v4kEE3GUf9xVrGqadm4RF/+ptaYOX5VhgmQq6qPcKL+RdiiPSOwGapIEHwV
         nQLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782683991; x=1783288791;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=96G3vLI8uCc84HNIGPthXmkZNP/sIBCAMjt72BhEVAE=;
        b=VDsGfM6JSXYAG/Tgy76W7tVL4648xrfEZxGFZtpWv3f2dKtnLdbUVFYNVqMRlewGxW
         mGd1DwZ8OW3WToXG+OEl/bWsOBraTUQ9k6upYgYqfcM+q+NMndMj2FlFmEehOwZD8lbj
         2Vw18uV+EN5VS6kuBZqVI8m3hpwAXkQaWUdKLndRYw3zU/3G0qEvPnLHeQ4o3L26WEkx
         FrV3KaoDny6UOTdeOdUf65lfd3Gsr47jk9Lle60wyCJhNBcajzzhXY9K5HzTaKrQdB0u
         9S5Uowj3m+gGA8Ck5osNyN+DJh1RGXn4A4D16QJV2pcVHg3dY5iWA60Qw+tKzqqr19mQ
         mQSw==
X-Forwarded-Encrypted: i=1; AFNElJ8obe9ZkPtGcAI9Z8y1IR4UTNblI95KqAEv63j+tMD3w5Vsr/1AZtf7BNuStQfjbZeyxqrZs/8WD0K3Wg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgaP1dwSWVy0/aoIgurFa7tR999hS7tJHnEIhcii2FKi8ybkOg
	++3SXVFArta1CnmJpmQKotlAveBM5b7TLLhvoQgS6qe8Mwf97Gkbsf9cg86qgVS+XeccP/P057D
	dLDPy
X-Gm-Gg: AfdE7cnPa+kzolaXQmvE3Xzwcq5qusezezdMwDMvg8Fc1WS7kN1xnt8mh9HSO69lbgK
	zIQ5b1MCX7/8aFTlCO+BjME4csAcO5abEnsTMUo2xrGDjDVRpBj8L0PT/FvkIQm2/zuSjLEVh38
	LEBRtGNgzmAeBhcpxCbe8/zksRv0Ce8Fw8xfeF5cn7CWRivLQmWxBlfZ2LGSqU7DdrXZwStKj6o
	aZSc2tYhP0iaFqBtDYZTmzfqGVu6disZdzMvZOc06g7LM2j6l9iDqgh/204uN9eZ2r5cJCYWovt
	UNgnKzRavbscBsTaUL7Ua5RFrCN4wRudH/ZlTbiPJMTFGAyOBMF6c84GzQO72MY8lV+vwG9Ofd5
	5Hdb1JD3GX31ThAPLPqrDvREEwzJ63RSQrha4PyOcGorA04Gaxb4HjpdlA1L5YyR6v4vagfusPq
	E9/jhItVwuoZ+Cs9ggHUQZKN227DrH
X-Received: by 2002:a05:600c:698d:b0:493:aaa2:f034 with SMTP id 5b1f17b1804b1-493aaa2f1demr29811545e9.26.1782683991343;
        Sun, 28 Jun 2026 14:59:51 -0700 (PDT)
Received: from localhost ([2a02:8071:56d1:2de0:559d:eec2:887f:c200])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-46d86960983sm36722893f8f.4.2026.06.28.14.59.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 14:59:50 -0700 (PDT)
From: =?UTF-8?q?Uwe=20Kleine-K=C3=B6nig=20=28The=20Capable=20Hub=29?= <u.kleine-koenig@baylibre.com>
To: Linus Torvalds <torvalds@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 03/16] driver: core: Include headers for acpi_device_id and of_device_id for struct device_driver
Date: Sun, 28 Jun 2026 23:58:38 +0200
Message-ID:  <eefb7f30ca1e60b4be38e5a6968dac7641684d34.1782682124.git.ukleinek@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1782682124.git.ukleinek@kernel.org>
References: <cover.1782682124.git.ukleinek@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-Developer-Signature: v=1; a=openpgp-sha256; l=959; i=u.kleine-koenig@baylibre.com; h=from:subject:message-id; bh=WUjZ68GBCMh9qEXZ0xuireCu175XvUICYDA7yUYo1XI=; b=owGbwMvMwMXY3/A7olbonx/jabUkhizHmcIPvl7/3HQuY72fxCrF7qX+r9JPfMutMDhWua7+e OSCzOumnYzGLAyMXAyyYoos9o1rMq2q5CI71/67DDOIlQlkCgMXpwBMxHMv+/+QosMbXDRKV/z1 ba4+kxdfkxR+QVSG3Xb7/UVX3nwWkvt348jK/icu9TVXs80UbinHvG6ZnLxleoeNRr7lpime08U /+m/SjVeL/8mxONDwvKO09AuLGdr8u+L8lHovJE9edjBu3s+grzdTrGRU+84+OjbhqHao1Qn2vH tFnmZVbWU/Dqf88pxzVtBnxumzP3a+ub9VZ8q719OLI9UdP+2ZrJzap1ObNzPIdZLEG44YCynNw kMljQWll/8FZnQz6QZ38IZdP89crs3q1cOt9rmHc5lpReTMo8Fx88xjY7ibndXM38yQOrR5+60y 7xW+Jmpsn2peslgblWa412noMbP7/ntSei2mnWXr1TYOAA==
X-Developer-Key: i=u.kleine-koenig@baylibre.com; a=openpgp; fpr=0D2511F322BFAB1C1580266BE2DCDD9132669BD6
Content-Transfer-Encoding: 8bit

struct device_driver contains pointers of type struct of_device_id* and
struct acpi_device_id* but doesn't ensure these are defined. To make the
header self-contained add the (very lightweight) includes that contain
the respective definitions.

Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Acked-by: Danilo Krummrich <dakr@kernel.org>
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

