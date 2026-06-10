Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F120C3B1025
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080894; cv=none; b=MI3FrDW91mQyT5UWLcncGR5Zg7pY9xV6WdHDhqnHqDCKwklFhkmzEnir+f/pyEntjYboHo8R5+CIS/VxIUcpqVNpCj+5JO1SgIbdZHJ4EWuHlS/+j4c8F0wqw0B4TrAYjo9lRkYgwf5GK4l4koX+ewVDob8UM1JRVfZz+q7jj8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080894; c=relaxed/simple;
	bh=sAi0MURaPjHAXe7GjHIr2vzfcZt5+QnjAoJMj8LuBqw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CpfwtCjm2xE02V2OTI6U+vns0ZgvmgIZvSSBXnZnsme5GFi4JGtkv1H09xreC8IzjNNOXpr4vaKmEOMKmeOEruExgo00vbz9f392TWkoPRspAzH7tdETM1JKLOILIrf9fK3CgHu7TcL4JuwcNXDN53rPcmUov6PZh7r0UlflvCY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SbDCdry1; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SbDCdry1"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so43522045ad.1
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080892; x=1781685692; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=SbDCdry1LIi1tGgbSkQPsH2WJB1KLpmLex13Uqi6M5ry1Rg64XwOZyWOPn+o5ITddP
         BFZf1OcOCYT3OXYB5qJ/tC0P1nexn2jX0Bd4uD+hK2RKJZ5sbvIOH45rc1t8LysRxUTI
         G/VmhA0IRwt02U509wVOzSEFnIJZIF74jrGrY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080892; x=1781685692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dDEOB4zDGGA532YGopw6vfAouEtuG7p7cdbO9K1VfZ0=;
        b=DouYApxb2joqWrRoy9z9rR923s/beQj3S6/aphntRbUrQjOe+e/zl6EWR6L+VKwUBU
         LaHqTDaVQCc9wK35VtqyHtcTSydplmlNDhIfwh0wWzFbjbjmOk6YHh8d+hAZJ5EADHnd
         v36LbCwSHPrbA7b/me+A/QgOEKMXJOFCfPTAfo4c7p3mqEHkHd0VDHXtO3VtZwspv+XO
         Qfy6AoGSOkNkExLWE2URPPx08BneasNFtBTMuJxItcK2DJjWPRkgL8HZAwyDX4Y1FSxi
         tj07pWDK9XMhBKS1yb8Jdxndm/arwoYz3wELc6CmWW+cWK3h+671DMuzVXM/OmSrMroZ
         r0Yg==
X-Forwarded-Encrypted: i=1; AFNElJ+NLWeD5ht+qmNr87FEhIjwUHx0k3lXZUueO+USVFlaVpQj9D1zDdA2f1nu6IQZxEla908mF/8I4ncDYw==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywm3gF2Ae2OOntM6+1PZFbREQSx7X9bzhB2wLKFsJf4ELRVu/wE
	W1X8EDh/PymV549XBu70dzGDGR37QG2dVuOti0V5Xk4GAS22M5XIx26LXV3G3dnfpZZNZOdmLHu
	xHADujw==
X-Gm-Gg: Acq92OEB+cW5jdPU43R4cyw5yZCaB2llzUG5sj8sIG/Vd6oIdlVBei67ubdTAMirfAz
	nu4tuiDCh+Zt81uh1QiBvawyee3IZyl5tGPjddLnbhCNpunzDKDcnsmBuRQqFCR2zTh8l+aA0rq
	XBU5FhJ0Zew5OBtvrw90A53LPt4JxcE6d/aJDcsukCW3lxhhZs3MCFbVByfUvjnkA4Sx842Z61x
	4I7BjbH+nOfGQd7PYKmICetDK3vYOzzFBcUyqpX0EZOPSYDzgntuXxXLijfsbwF0Hd3tTHMk+BO
	Mt7zBGvI+oQ99L7jnfZtqTF8dXFyEkWYED6dapDgslzWoPptMlDpUnrjapfSi/rgcyvTt+MKlwj
	pB5pWgqeVpqvEcWcaPD8T5tRoaAXnEcGZz471MKUDqhsKUppF86AZXeXiMyiISYrTaTeA/emPNC
	eGK3q/sZCQLp+KCWOrlse3q+mA2e/7VFh+oX37RIlrKCNrvpdHseF9q4wc3zhYrObIyIOAJdUez
	O/NFZo8u2Z1iymucA==
X-Received: by 2002:a17:902:e74a:b0:2c1:8fea:4dbf with SMTP id d9443c01a7336-2c2a1bafeb4mr79293415ad.8.1781080892355;
        Wed, 10 Jun 2026 01:41:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:31 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 03/16] power: sequencing: Change CONFIG_POWER_SEQUENCING to bool
Date: Wed, 10 Jun 2026 16:40:37 +0800
Message-ID: <20260610084053.2059858-4-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

USB support, including the core and hub driver, is bool, no modules. To
be able to use the power sequencing API in the USB core, the former must
also be bool to avoid the latter being built as a module.

Change CONFIG_POWER_SEQUENCING to bool.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/Kconfig b/drivers/power/sequencing/Kconfig
index 1c5f5820f5b7..27448fba9dc5 100644
--- a/drivers/power/sequencing/Kconfig
+++ b/drivers/power/sequencing/Kconfig
@@ -1,7 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0-only
 
 menuconfig POWER_SEQUENCING
-	tristate "Power Sequencing support"
+	bool "Power Sequencing support"
 	help
 	  Say Y here to enable the Power Sequencing subsystem.
 
-- 
2.54.0.1099.g489fc7bff1-goog

