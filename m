Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E58D83EC80C
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511340; cv=none; b=hfIjiePLd0pWW+HFtmDukB56U9bRUZkWDspkxAVu/lkCt4RAFbobPuMIPf6i+20ssUzzUX5e/VOmCZBqmmdjRiaWiaKVq3sXJFx0OxusJaxyEhH3uSUroCZWWk3VP6iWGTz91sM+5+oo/550c+dkDv+u+wdOaN6Wyn7Jm7DYNIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511340; c=relaxed/simple;
	bh=RGLL0tPfDP6uNlWVczfepdqpvZGR4BjUGaRZ583Zkzc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1vONGtY+O+L24qEVIz5FwDCTWAmiaYVnk8ICt6m8d2Ho/fFwII4RbTDPrjxw9iYlbxTDWeRiV7ET406Rq43CrxVskrPEo+A5Zpf7I/ha8mSFM1LaubQFqkqZqSNEx3+GGuSsSfPzPFgo4KQ1TPZszSLllUB+NzjiLlHxM4BnZ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=nH5KudxP; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nH5KudxP"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-c9aea40d799so536618a12.0
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511337; x=1789116137; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=nH5KudxPGLK5f1sBjJyZzixeB5Nln7cp1ARc8YNW0MtxVSFDApPURkqMXnfcetRAfs
         C24DyRysjZvfjD+M78sX4/bmBTY0osUypGvRyM64/dVL7C2xq1azJ9f/A0jAdBJRCW5X
         XLlX3XJA4ztJGP5o/dm0XuSWk7+Y0MHPmE9rA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511337; x=1789116137;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=WRetEA2OXFI4SKJH2CBFzorRJvZCDQyI99zumpuCSb8=;
        b=D0JGhcY1EQdpT7prN7CDSVHmqhpRYnSoxaS4tatGWtaLwTHFooWHTX8tOXLd0XAab1
         n6/flWJIbDtRF4k7HCMMGqMfbFXGZxCPnvNPJGShd5mwrzhDRFFMu1imKek6b31Y+xoN
         FLP7FvrSsK0LQrSywYdkmwX8sMexRKRdW+/tQE1FdP5ea9pa41lAaIngm9a+ZHxHpvYd
         POVfcYbab1Ig1Lumb9x1o5+i83FRlIiJb1a0SpK08I1rj7b2v7HLTBV3oJSoIDKi/ptj
         h5/jGSHwx0BwSG2WvXwjOGtH24chxx9c09/JpNKljI4IzNlxj67I0/w92mTh1E6XxidP
         2I6g==
X-Forwarded-Encrypted: i=1; AKwUvBz1mGLsHpROwuvM/6yJdvr5m5V5LkDobtZ6mR6E/sN/gpkXxwSWH68O0ehP13XtPgS42/LOacOErPs0mA==@lists.linux.dev
X-Gm-Message-State: AFuF++miXv+By2GIhzdv/tzNOJjjXPXYoD73wiCkx4vzKQGQzdjB+KIz
	ZLwV/DZnrUFMBRsQgpyvsxmCzw6yNIn3Y/9c3vbaNHHjNBcNH9f46LuAgIxWM6yn5w==
X-Gm-Gg: AYBFou2lU8lCutfPKeDdBuvKduVrhPt2Qw0k1L+U6lRQJCMiWIFBYeb1oT7RD0n1ipF
	IUDMb9GBZpRKss2SQmeH7XAInoZEMqKRO7UsaUhlN9qfUzI/QuyCNWpsYhnUzks+yYZwcuajyJf
	gxbVYXR+6amdoODCvvLtNEGDQeVtcn/V49Qvcjb/UT0zsCz3L+CMLFpkwR8GtQQ5KEG6HofPlHl
	OdHJXzCDgYbWL73ci7EsD/BBt5ToqtRNuMlLsJObxqxAxfSFECtL+5/ifxlwrj2AuUmkOz4Ppmk
	/SEQQwWXVq7IXwB/h9r7JMr27X6V5wt2zsKncpUmvW/X34hBbVDADZod8e2oX88oz83aQbaitX3
	gPdRlW01Q8CzpiLrwC7qA5A66iMgAfWH8i7ISe/6+6EMtKngGWOkelWgDduDFZxGd7kQOvQAiBN
	ydLH6OYespKnS7vg1A5ETObrMOu5R/BHb3CWjmMn1FRWT+lgQDpOI53i91PSWBh2TjxUSOwAUae
	ywSbBxvBI6+CbZ5ODNVawHOLQMe0Mi7Mp/Yww7gMcMN
X-Received: by 2002:a17:90b:314e:b0:38f:efed:5445 with SMTP id 98e67ed59e1d1-39b261500fdmr6024537a91.4.1788511335746;
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:15 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
Subject: [PATCH v8 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  4 Sep 2026 16:41:40 +0800
Message-ID: <20260904084158.1341550-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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
Changes since v7:
- Mention in kernel-doc that the function does not return ports that
  have no endpoints (Sakari)

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
 drivers/base/property.c  | 31 +++++++++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 33 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index b136c339ddae..68108805482d 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1353,6 +1353,37 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
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
+ * Does not return ports that have no endpoints.
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
index 907c790a3f01..3dbbd01a52d0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,6 +507,8 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
+						  unsigned long flags);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.979.g7e5102b832-goog

