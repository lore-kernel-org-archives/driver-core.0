Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC1693D8909
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:44:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882650; cv=none; b=Qe8aFYWCfczeYOWYxEmm/8t3ymXAqTpA9mo+8IAAWiXMs52bYmOl0gNqzgJrc5z2wOl9+piYKhEQIwaET2zKTxfmWlkWSrFz5McWie5We/5JO7aESmzE0zRPCbjSw5IKsdHtu393I6Tj7Kj5K7HKkBMA0T5wSvxJgMXhFHovXh0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882650; c=relaxed/simple;
	bh=rN8bGYfPxlquy6cQeK5GYz3ym6oKo/FOx8yU0FBCzV8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=HxtESSO/fzVVOeAAhOlz5DwDuDLiQ8Qpmy5apD/Iy7dxwNf11g0tlXHEIMA7hYRuQRGqvLEuZUIY5+JCoRzIjuSv79w5jebCJjCmJh0RS96EgZq2BR/Coa76LkuX88Dhxs8oV783fSZ171N+z5W+hxErQHbytT7GTdFhJ76XZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=k3el8ZOf; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="k3el8ZOf"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-385ea3ce80dso152608a91.2
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882648; x=1785487448; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=k3el8ZOf6618LxP4PUV3KvsoF4/pMuXguo6ji2OGEGzdsmv1T6mbSScNUiEexLnj5/
         R/qfIeUqg2PpFF28iRKbNbXfBQGlfn+VTX6UwTPabkZd4tktwayV+WvGW/kbTd3hHmXy
         5gmqXeknvn3CDzPid3fOE7LASAB8CJyMLYH/Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882648; x=1785487448;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yZPli2S6cZzTtPxNu5kCcB+M+KQUeHMnkMABY4ADLcw=;
        b=M6XRmlqoY4O7g1jyU5JACyVP0nXzZTlGK5cotIXJbTK/qGF5/XfNdvsR9UGmgxV2pB
         1kyKZ5HWqsSZZGiZnDmK6Z2Fm91HHXBpVlVufsfcxgS1o06u2MdNSNyZJSZCgTUWZujN
         aRW0Xw2HXCwujnv6kYA8pgFefjd+8MiLQPhjQrA1UYwQ3lWcSiQb/Wmse4IH6wG+DO9x
         RXwDpNatfsTnaAyTkvkq1kxQS7wJumd3KdD1Xw05hL882N5vX6n42xaCYt/b1v2Ds5pV
         x5UuWNExvbc53sZ0NCY+czHWg6dyL4KHw8iROXtNrhPO9DmaGr7R1nPMwIjnEXzD+v1E
         mVXg==
X-Forwarded-Encrypted: i=1; AHgh+RrrplQevPQnjEVbCg2IRwWIIijZcSP1f4JVuNLMDqhbC4YwsIH9cG88MXev22ABoS3iBpZpcaKcLU7MvQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyu+Gf6Gm/znvJRL9XWUvBEfH0IPlau0eXkTu9kaZPBfJsegZGk
	F3bBc5eZLUneHkC+Ktz0DoHktynUAqzwccEZrlX81hwsyrS1RVIdvUiNswXMnR6RRQ==
X-Gm-Gg: AR+sD10KV7GwsVu66imCfOPhAXhAnpCRnQ1MtYyyLaaysOG3kg0mXtHaeRGTjLNPgcm
	qwZGOG1URHttimo+C6HIoqSzPU/RBTowzbrp9VTXmeLk+0z7ImrSy68YwP6X8yIhw3dKJLdaFqw
	+bxG+6/gKvEn5y2Q8GXp+a76/MApBKrG7Hne5yV8kwwXREWwMYOO37aS2kRrKGdlv1gRcRYR6qv
	OQ3wbYp2++2XnodwsCNIeAM50O/jybw2hfslmZhtL+htd0jvVIDKdXwgUFOVB8vHX+tMuU/TYTU
	9b56J+wgQpDc15kextERgL3sbPLolih1UfRsqvGQkhFk1SkgClhSVn5opRbw38ErO9ftyO43dV2
	SMAY7L14rqWLQ4YCaENr7DR6eRlkidDn23YXyNLvUrfQHEU9xBkFVtWyD9juiJAdEGX9E/rmb9a
	7gmqALltjeO22GCHfOoPSLrUioP8Q94KRZ/0O1QxlJilNsYwdEu02HvCZ882w=
X-Received: by 2002:a17:90b:2750:b0:381:5ab5:b667 with SMTP id 98e67ed59e1d1-38ec6637d1amr6238598a91.31.1784882648264;
        Fri, 24 Jul 2026 01:44:08 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:07 -0700 (PDT)
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
Subject: [PATCH v7 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri, 24 Jul 2026 16:43:10 +0800
Message-ID: <20260724084328.3943997-2-wenst@chromium.org>
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

