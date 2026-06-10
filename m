Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C592D3BB66C
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080903; cv=none; b=txGW8iG57Ljj7NG7hjzYsMFikwTSfkhs771CjY007j09s5o2B2ZozHMWyr3YMnTvvWNpEJwJrytYwcy3gJUd7IvrZAZqPZJRxHhqdNVijKDaOWhFYV8LtvIEuftMYAHG8pXJ0e6QkeYt1U/NWziZKYvn0aI/t6N8kLXesfIly/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080903; c=relaxed/simple;
	bh=R0+Z0BHMYu5U4Yu7kD4UWXq+2W/gGTv98A8HYveuJQY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p1O0BnQnjNhJ+cx+lXuOAkqMDPk0gNXtmPVC9L1TIER/ncNAn79CDh2qyjzQnvifSPMlbZDMVydUvZftDIAr+WbBS5M0AoTsZHivsqDiIHSfTt88jF7ilDtIuX5X9CZ+17tp4rHAq8d1LvpmfHeow7uK+LdC+kke7ju+Cleo0RM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=m8b6mYay; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="m8b6mYay"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2bf237e1433so71621555ad.1
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080901; x=1781685701; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=m8b6mYayT6fgQEeolsgLr0DCQyUyggx/92TlB2CAJzMzIf+b61OnCsCHl1RVfORvV1
         TL88mm+kxnhTzrtc0YqklrLxNMmAgwzsV6Lsw1E29clBndgP4IYm63Ofs6R3I22/B+Wq
         Km29aRwu+gQrOjCR6N+msc8rBhgBD5LKTBdhE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080901; x=1781685701;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=DTomCA2OQTIcAcWrVI1pDKUJSWSpTuGc9xeNsAJVzUg=;
        b=j5HAbbrxNGmsdZIGcrnTmr2Q0flNIRLUZF3tdKQXxT9OJz0y8gj85dwyGjqO91np0Y
         4XbDqEZgp4zcGwWfDpCD13uU9PFFwVYfQQvsGt90QWNDCSeWreVNtwqHq7wNYqsf1HkY
         +IWpmBYV28VyFWIayMCKoZfvI7yDxQRMs5uKXIlfj57uBcg/mtCGpdizKAxH81gRniKy
         yu+sMSKw4VD27Lsor7YIZD54IpgIHBRdbgtCR5cfN74FhZSKdMdf1wPleUu4mLmP0FQE
         9rpT6xwEdBMzYmSQ1/T97Ia19VEtbpku/O+Bpn4nil4sweTjgMAyHqLXjET++T1Iwc7j
         cYGw==
X-Forwarded-Encrypted: i=1; AFNElJ9+J60UDEf8hqLFjvf21wunBSrMdoR0WE3RwcBMx8/CI30V4N/YLw0ypm5JvTaZhkbgBQ1Iyg1zNcRSLg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsJuEypuMOySqtg5jC0pFP9CJ5WcvxChFqu3C2o9H9UIXRLzoe
	M3bBaLJ9OIHXa6T8xMAkfz5ssLPBMDvRnyb+aMTDgfdRtM/SyO8LV1K0A9o8Cn8gJw==
X-Gm-Gg: Acq92OF0Hv9W+KLgsKcnqWocFrcIg9fNzp2hmx3dZHyEvzxLC5fIEkhLr5cHNRWXj68
	1tDF/kf0ogJ6w1p3v2+CPAOKJkuAzgFFRK8X257KBmVrfUAb0QhA3D4oEi5AS2msvQ9+l7iaCjW
	k4mxhcOETzB/9D3hMwvYBhkSp8cRq/k7uvehc1Unp+zNpnRt5Es1MW4TSl+SOL/1FKZ4aw3e1fw
	jMdLomDuNsi0ggVNl/LnvqED3QILNRjmt1QzX3KUDisclM0B31SGs4WZ8MqS9iVX3vkKNaOQhJr
	mXDCuKfZo1nxIRcEf+lBaRE7M8fUjDC7xH209k4N2gqok9enaIaXgigmuE3J2ZvcQxjSgd6ykXC
	TjSsgkLZFIvC0F5JM9hzuKop4mDrAb1nFZiAD19Lr7dkq1XxVv0Ya36/npcyCbCO6MI1/5RsLJX
	0lPjfTxfaibaGuhXhy1Lw5q8bF3ZHOWyISpwBKcGl3kZaa1P/yaqMi8BQ5CDEd/DtCMLaMT+qb2
	2lTUNlnvBlc6DO6ow==
X-Received: by 2002:a17:903:46cf:b0:2c0:d91d:c3e8 with SMTP id d9443c01a7336-2c1e80cd78emr274569985ad.4.1781080901116;
        Wed, 10 Jun 2026 01:41:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:40 -0700 (PDT)
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
Subject: [PATCH v2 05/16] usb: hub: Associate port@ fwnode with USB port device
Date: Wed, 10 Jun 2026 16:40:39 +0800
Message-ID: <20260610084053.2059858-6-wenst@chromium.org>
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

When a USB hub port is connected to a connector in a firmware node
graph, the port itself has a node in the graph.

Associate the port's firmware node with the USB port's device,
usb_port::dev. This is used in later changes for the M.2 slot power
sequencing provider to match against the requesting port.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/usb/core/port.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/usb/core/port.c b/drivers/usb/core/port.c
index b1364f0c384c..1846eb1206a4 100644
--- a/drivers/usb/core/port.c
+++ b/drivers/usb/core/port.c
@@ -780,6 +780,8 @@ int usb_hub_create_port_device(struct usb_hub *hub, int port1)
 	port_dev->dev.driver = &usb_port_driver;
 	dev_set_name(&port_dev->dev, "%s-port%d", dev_name(&hub->hdev->dev),
 			port1);
+	device_set_node(&port_dev->dev,
+			fwnode_graph_get_port_by_id(dev_fwnode(&hdev->dev), port1));
 	mutex_init(&port_dev->status_lock);
 	retval = device_register(&port_dev->dev);
 	if (retval) {
-- 
2.54.0.1099.g489fc7bff1-goog

