Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 745B23D9552
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:44:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882665; cv=none; b=LtFYd/9q5h2dbLWP6V9hFM9vZFVSRbZ/YWROXfj7khD7qFHt/RCliPJJko/RvTSXxNuYEYKr9urjVUz5ZJla/xAySpZUQy/MQqyiU7qrWtVx/wNB7Yc3adN/Mjnu2NFODN1KoJUsffJU5tVhy4+iywr5LoRzboYbKl10X8CXDsw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882665; c=relaxed/simple;
	bh=nDUhaI/csnrSHq2VN8yN7twClkIbPM+mTJRxHI6rupU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Y4U1+eP15hMLQ9TvUsFpiNb/jLp+2GJA7kGNDGzVIEzyvmYlIZHTHfL5QW7Vzxq1hnw3lR3km9fCZrhmZNuVmYjCcTt66WjPwFVLTgt8cu6GI4/bMZGQs8aICHbb+pOxjWgTQMFiIHPlkIc4wDM59d2E84aE3NepbRaW0EBy7p4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=TJoDFl2o; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="TJoDFl2o"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-38e08baf860so156943a91.2
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:44:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882664; x=1785487464; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=H3ipik7auGStkEDr/T9A/4r5EQKWd/pec5jMaPqfTe4=;
        b=TJoDFl2ol8ciRa46Jw+3eWtoR0Qs+oHhw1wjDEZjOTefvae0oUwHibrMkjuqIECfTn
         2dNega0bI6t7wkU/UBoHHO0X/JUqymkJ3OdlXhEmhxKoy0u2QGqx7QqmlX0+e7yb6Bzw
         1rwVQYahXF8kSVzpBfB1hf2cv5wr4i6T79z6E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882664; x=1785487464;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=H3ipik7auGStkEDr/T9A/4r5EQKWd/pec5jMaPqfTe4=;
        b=Yv+0i3gzPG3zhEXOOgUK4lv0SwpnvjWSYIiYLcFJMbZv2eT7GQ2PH8is9Ghf1oN+DF
         TaBB7fbq63RoNSwGTymu8vNFs9M8Mr9k1w/Uukgv7a/5KKAf+1ANhplIMStEqfTMd213
         H6sm5h5kQj5YRw5Ue0uGT0LBBJq+ApFpef29fsgVh3w1kfFd98kKU/eV9D+dcdNgOhp1
         NGdpi440rsBFv92d7eoPq01HDbOtbOmEhxeNIgUInafOtZOBqabaMcXVL3CxBd+AjRqn
         hnggYj4OxdDzAskoX3nHIYNyrJkaKfI0BBHnRYixPCKmFEMbdTv6dYXfJFRY10WNb6vw
         RYow==
X-Forwarded-Encrypted: i=1; AHgh+RpGvw6rMjoffzLe19eTvs8ruAqdCJ9erLZhejpHBPGwAjdidUasSLGTHybcRjTbr2Tmh5FIaC0AUIA+3A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsmzV7uYVF8vfX4Tn/vGXP7vx4SfofzMuv+rENhw9Z+vpTAgYw
	iyElXUU6eWi3TCpMyhYdXNck2JX4FqsRUj4pRpMiv26Gz/VxOJ8EOXZ48pf4oq/MPQ==
X-Gm-Gg: AR+sD11M1zMhVsGgTNwl08ZbI4nsfboYE2PJQ05S0rl+74dcwIWiJRlE3+TM55iU6mD
	yl3ZtgEBFxUzmV99YBi51gocYl3oLB4JU9xY1RwCSJlbMRuJAddopLCpaJUAQhNmldPiCGUnvRN
	Q6tX0FATBUD3eIQiDWejT/CyBqJ20PmoEkvT+eN4Hc8bG3o2jFA+VQEz6vTbxjR83ZJy1MxpNwF
	S9dkAGDAuiRUF9lJ8LQRIFa+UIK+n2CETrhQtdoDc2FzAXQJ16q6PBF/Jq4RecYibjztvQb8hK4
	0PKOQuYOHrO+rSg96LKQBmR7J8mdzpG9uLBH60lyQcR0lQMzHUiw//1L1YIPxMDCtGF8SGnH3xh
	wvN/NQmdNvj6yjsgTFyDmLZexmEifyFZrUJGu3IkrimYJxXZsyoXt84D0WQiy0ero63wwSMPkCo
	1A6X17YPpk+J/LPomItmK1jy4mmvBLa1rme3rL40U3zWiGOCnHEXZHn4JgnVDM+8GyR4E/zA==
X-Received: by 2002:a17:90b:314a:b0:381:23d5:693f with SMTP id 98e67ed59e1d1-38ec65f9916mr6632501a91.28.1784882663919;
        Fri, 24 Jul 2026 01:44:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:23 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri, 24 Jul 2026 16:43:13 +0800
Message-ID: <20260724084328.3943997-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2cfe09a141d8..715f26f05a31 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog

