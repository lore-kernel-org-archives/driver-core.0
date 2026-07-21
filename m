Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 216DE42B756
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:54:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616884; cv=none; b=ZlnNesdGIzy3Ca4nmmVP2DtBLEOinPDxS3FaKa+ZabSYMP4s3V8kzcrCSUr6V7+twh5/QcUklqchqq34ffYEV1TXpXV+qKwrW2BippbsgPolr/zbekGxWg80V6TEHl2QYrG0JT6TgUurpQLI0fws3pFe8zpk+mxNv6dcyTMxvEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616884; c=relaxed/simple;
	bh=rN8bGYfPxlquy6cQeK5GYz3ym6oKo/FOx8yU0FBCzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YwUCn90bpgEG5aTX1/5BF07llnCsetg8A5hRYyOY8XQLPSQWh8g9RC9PEFjG/VOHXi0/SMkldqwv+kfVvefqyO3cPKa5WRCfcWKeaU+SqBaqkrfQVThMyvnFmIDmagQT2zJPQXMJ2JVKfqVGunV+bTfhOnPywfnpozX0craSAQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ylnyr1aI; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ylnyr1aI"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso123653125ad.1
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:54:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616881; x=1785221681; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=Ylnyr1aIpfNPXxXMYPcnXqXYHQ2lLOfZZQcwQyU+v/PE3025F7UCYJkppCRW03sUhN
         FFLuF+5H/1vNjovCcKmZSOEuo5wW60RRdZpdiKlN2Q9f6+lxdT9IqtnP7EzBL3NbwP/S
         MpeTG4wPdQyVFVAaVZi0ZXPZ5OBfg8R+RPr04=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616881; x=1785221681;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=XIHRivFmQj9tbuHW62LMKtPH04E2d1jnq3okqIoBQT1X3zrFY/wcb8zHhxvU0iKU8w
         tgMnoMIziHhivhsGtzQJ3S1ftmGIZgccAPPBq/Zo9lBDnVQfS3VFHEbSvk8IuGpMSgXK
         ftONASOSirUrXrcH4WTBHalzsPWVCnJIJl4kdLhQzB+Ap+2p8LlM5WCFlMmZrU1s3Nn0
         NO1Zol7pRCxi/gFha/b88rcOPjjJwDZ+ZFaU4eK7KcC4AhYiD2J2DDbsf6JLraRccgm+
         S8Tmn7XOwi6KW9si/tGhdLAxYkUjswIyqQQP5DIxkVD0bLQgaqQpYa8QP5r5h5GMfR9V
         H95g==
X-Forwarded-Encrypted: i=1; AHgh+Rpk47Tj3KPS3xP2o6ZG7zNVE5xbjjopZ9dkQ9Bhqn1VEg8xkAoZcLpvxW3F5iYqmBAQofRone8pDyAcjA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzt9v2FpEHvibW2jVRTilXFm1Rl8be742IXNkeQTtVbOr1wYSEy
	f1DcVN/M032KBEOjdgaXDV+h3NjLK4/QUuuijp5lnzk78wOmY10aQ1keEQh9urdDgw==
X-Gm-Gg: AR+sD11veNfE7K19Mz2PVvnvNTQhK0yV3bYTLCbr1jZ8TEHQTUs6s+VSPHRBTNsIPnJ
	MtuXEXzP4b4ZRi/d42/tvE8EqGcRRDT2A756heqDEHtpRcqp3ZLj7Qc5AORfdJxfTKdfyoPPCMq
	k4sM+5Stg6fyRNqeiKht0xFblGR3B4UzMIa4WzVfDdBNO3HuO+PG8pLSYAa5x3yaNDqqWHObK2Y
	5gw8Mc0dzOgcAfARwjkdtCM7kcZJKD0jrdY3iJBmCZbQPfEY5EfRsnda3g5qPRrIODn/R449tHI
	ZUwIRpxIC9jnVIH1zv0h7qrplqAQdWYYtnPA6fhv85mQ45LXf0t4s818oG1mgIPaOJnjIsywArV
	zWHv3cGI5yNZdTP5TnV1DA9TWxZKygzuGayswyoaQIjzu2y59KnXulO0IMbnb4ZHUxFO7wxBbLo
	yf7JSE6KQeERW1k1rRAiHG7kXL0qF7g0B8YVNzOJ3nyKRJvEZBCzLMpE8sbLc=
X-Received: by 2002:a17:902:ce8a:b0:2cc:61e8:5fba with SMTP id d9443c01a7336-2cf349a2153mr182756085ad.32.1784616881554;
        Mon, 20 Jul 2026 23:54:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:41 -0700 (PDT)
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
Cc: Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v6 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Tue, 21 Jul 2026 14:53:56 +0800
Message-ID: <20260721065413.2306137-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v5:
- Dropped left-over declaration in header (Sashiko)

Changes since v4:
- Added flags parameter so users can specify whether incomplete ports
  are returned or not (Sashiko)

Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 29 +++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..950defc0c55a 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,35 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ * @flags: fwnode lookup flags
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Does not return ports that belong to disabled devices or endpoints that
+ * are unconnected, unless FWNODE_GRAPH_DEVICE_DISABLED is passed in @flags.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode,
+						  u32 id,
+						  unsigned long flags)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0,
+					     flags | FWNODE_GRAPH_ENDPOINT_NEXT);
+	if (!ep)
+		return NULL;
+
+	return fwnode_get_next_parent(ep);
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_port_by_id);
+
 const void *device_get_match_data(const struct device *dev)
 {
 	return fwnode_call_ptr_op(dev_fwnode(dev), device_get_match_data, dev);
diff --git a/include/linux/property.h b/include/linux/property.h
index 14c304db4664..01ea010cb2f9 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog

