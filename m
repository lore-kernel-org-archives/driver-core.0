Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851863DFC8A
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 08:55:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105705; cv=none; b=mfn9YXYl7nf5B60IZv2TvQhSyjH+udZZgXvZAyy3RsugJP7x6odj4Cq10YNJedMfgqIOeleZKHh3L0Jgczm0bYq2SW8ux32+Oun4RDFbH5GEsyEuJDNl1/QIEvH3sxREOZ+k1C8+HA8NjON0WJZ48iMu+Bi57uhTEBzg9WszkYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105705; c=relaxed/simple;
	bh=y3WhF+SuyleAojl6FwQNCSw5fjhd9v1zDhHyaW9zvKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OBH5ER2fTGUU5aAUQuW/8K/gvYj4FvMQ/6OmE7lddVaBtI7yM6qINDFKsgMwPIlRtgkdcxYp3OkujSBux4aoPRubFA6y1tVokjbj27/tinZc9XyQn8W5VsZNiCh4SGteXbEBsAFf0JQSIQRCEwuJvnHhejKazY/wk7wRTw0JyE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=gdo9auK7; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="gdo9auK7"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8486ac3f347so445486b3a.1
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105700; x=1784710500; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=gdo9auK7d7oNqtPtKujxEknf1i7vULB/AAP3Thh/Nzk8F0RkBM1noem1IMca2qVSww
         7aAhqENMLHVoUtjJMJQkgYOsVOo7mU5IEghlyYYrQwbTuyFldrVmhXDHPYZEIsEqLKqH
         4ssIzTolaNxAsFoe5keX60Ptt370Broew6TCU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105700; x=1784710500;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jC877lcIipbzPO12i6mSRmQx7EEzSrLJZiMLFWRppMI=;
        b=FKHGyWRFvh+q3yiA4tvChbw07+OzNoQw3MKyrslvoLUBsoZsABf33EwJpSaDP4bRfX
         PFKF7FjkR+k1ksxsdxAKhOvtHL+DFBlo1AWblUi1p5/ydkyo6e4Z6CmKybFQ+2msWtk1
         n7aeoL6zOm1ynNWVLSQ/rHVTCNzeG4Xkp/dROpC3T50LuIx8A/P6s2YmciFqNfXDwdB1
         CwpmXi0yWQPRoIUH95nZYKtD6GMQQDdXMtVCqVBZwQsxWPjBmrepUUwAgcgxPadI8QLx
         /8vfO/o5f+PrTxBwIM2DPF/vNQrT2ra/tzLj16LnOYsIqZgAES841ZImy8dxkvXqxOC/
         ZDoQ==
X-Forwarded-Encrypted: i=1; AHgh+RrTuyJzX4bMREKeU/X03xmLN/0OhfNsDp7CHNaPXY99eCL6i/P33AZK8zcmonoj6O/pbvXXrrA/lL8JyQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxuhjWJfKrl1b30ZwNUq9wJ43Ulk3VOANuB0wTCv3I27eT2L2HO
	DUxcLGTVAsx4+8KM5DH1sMZAzKCCRhqNkNa2ZBX7a9/qsquiTG0Q9nADGjthxMMCJQ==
X-Gm-Gg: AfdE7cmEhd3yMbgzBwvM2fIhVOwadpirnLlZIuftotHX7uhznuDvnkPLzWYMS7JCtQl
	IR64TKYjcLHhit/hKO2WYP70266hi+ETw307m6Ud2DR70rbBCZrXWW6HXZj3JCAm5N23nLKfpB4
	avF0UZnOCuid74Hi2h5UOXLZ8sXQf8iI7WuyNEexRnaRARt/ryp2bTprbPOf4DxPYCKYzBtkJpd
	toDUj7wjYp8l+CbHSTPjL0IBqrdNdC1zlArnPmKZTLUlNBaT6rvWFA5y2xP/YXMJe8VpKzkHcMf
	MH6oFrXbFkJAlJyx57p/PzbKKWkBgItpe/XzrDFQAFNL52A0/ygU5s9jDTQThkHXr0ATPuzX24M
	JDeryl0bYNd4ucM2G3JlbCw/ZUz61tQLWVo4QUhKmyYtHgu5k3TeNbFBRZjRvIHEL0I+7UpzbSh
	Tx3S/km+SKo4u4uu11lHAOrwabOzNsQ1zuViil9JrNUAZiD8Or+J2ndTEN2R4hoE7DfH3fVw==
X-Received: by 2002:a05:6a00:3928:b0:848:2f58:e1e9 with SMTP id d2e1a72fcca58-84870790b80mr18374319b3a.36.1784105700341;
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:55:00 -0700 (PDT)
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
Subject: [PATCH v5 09/16] usb: hub: Use usb_hub_set_port_power() to control port power everywhere
Date: Wed, 15 Jul 2026 16:53:39 +0800
Message-ID: <20260715085348.3457359-10-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

There are still some instances in the USB hub driver where port power is
directly controlled by toggling the USB_PORT_FEAT_POWER feature flag.

Switch these instances over to usb_hub_set_port_power() so that only one
unified function to do this exists. This makes adding external power
control with the power sequencing API easier and consistently applied.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch
---
 drivers/usb/core/hub.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 40cdb63b5333..47010090d3b6 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -973,11 +973,8 @@ static void hub_power_on(struct usb_hub *hub, bool do_delay)
 		dev_dbg(hub->intfdev, "trying to enable port power on "
 				"non-switchable hub\n");
 	for (port1 = 1; port1 <= hub->hdev->maxchild; port1++)
-		if (test_bit(port1, hub->power_bits))
-			set_port_feature(hub->hdev, port1, USB_PORT_FEAT_POWER);
-		else
-			usb_clear_port_feature(hub->hdev, port1,
-						USB_PORT_FEAT_POWER);
+		usb_hub_set_port_power(hub->hdev, hub, port1,
+				       test_bit(port1, hub->power_bits));
 	if (do_delay)
 		msleep(hub_power_on_good_delay(hub));
 }
@@ -5434,7 +5431,7 @@ static void hub_port_connect(struct usb_hub *hub, int port1, u16 portstatus,
 		if (hub_is_port_power_switchable(hub)
 				&& !usb_port_is_power_on(port_dev, portstatus)
 				&& !port_dev->port_owner)
-			set_port_feature(hdev, port1, USB_PORT_FEAT_POWER);
+			usb_hub_set_port_power(hdev, hub, port1, true);
 
 		if (portstatus & USB_PORT_STAT_ENABLE)
 			goto done;
-- 
2.55.0.795.g602f6c329a-goog

