Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC5C3DAAA0
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882655; cv=none; b=VOMFhA4Vr3yDiAA+F5NG/6c7/lVpOCpUZuaKsiDfy90mPJUT1SfcBhYzuL+N+GCmUaUR7HALEWWR1+PNkYJixNM7oeSfuyFpw4nO0v0G7+d/JpehTeedAPqzDBCY1N/TOZDQAMxkPPVsxfAaTPyqjXwVytGQKQOLfnDvm7+sADY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882655; c=relaxed/simple;
	bh=K/CXr8sGOQIlsbuegDLGNruY8OXemH3+DJMD2gXrC6w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=pvFZ1dyrarItpiQqEr4luMUsj7cl52vuCgUuyK7v9O0A8zuCgoRD49PcbwM2+mivdDzYjW/gQe4J+1ZP5DbOXg4+K2Id0bf5YnL4bDo0Ps9cOEpN0o9rOeRas5pg3qIoU8DSKkr0N/xFZ72u1IAsMGBOxOh9orFQcFaDsiv7T+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BpHr+vnO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BpHr+vnO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dcbade417so169525a91.1
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:44:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882653; x=1785487453; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=;
        b=BpHr+vnO9vtPzbIkQzVBnQI31zFrbTB09EOnHODMSqA2uGNUeBMIsF/knt0lDgZEE5
         +UKjK20mCuyCcKlSBhQGDluxpAQhmcKIC+781mh0qPVYLTvqXz2PPxLVh+3rRq/D33Q2
         wTlF9GGyvNZZ7Xfse1H4D3XPhcoX7weEcWPYg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882653; x=1785487453;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=15QCCMJqDJvxC4OlYXPloXq3cJq1LSRVcuMMIDjVYjA=;
        b=Rc8lueQbhyJHKX+TQ/W7V3BCmWk8L6kgSd2xl6kdT+XrRR5EDnUjkHveTu5gNxWhmx
         +cZFAChgo8OEyzJHwMHXJeR3yNf3KdlVgNo0DWkG5rNCdBQTMvHdF82xm2JcgZ3Vo6Lo
         VzsvxIv199O0RhsSknfteECVb+sXG363Hu9wzb5FUtGrfEqfTdmLypUb8V6EslRzbrZx
         HLVJ54ome42tZkKDYaLlZ3ZKXkbervnEq4miKv23YG97FBnqJFS748rOVvtWXyuf3r5W
         T7v1UR4Kvcd1f61VyJCeAW2BVjaPd7zUgNO/JXsmLrK0NP4B0reNrrKi/yZZIwC54yD7
         SScg==
X-Forwarded-Encrypted: i=1; AHgh+Rp7P/WBgCsPidK/FgleAp7mTzWrz2Ga4zoUY513hLcBqfFNTfpr3Vnp4dbLQpkfNmcfwpHfjrBXP9HBxQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwS+pB/Dq5atjCL+C5yzdvEujQeZFyWUAGL4Zj/TXqDPMOkp5Mj
	SZd9HBLDUsxj+OPx9hayzzZ04Dp7SfdZjxYmf34429KZMcSrkHNUiP/oyqt6EIwyLA==
X-Gm-Gg: AR+sD10AMa/5f7fN7FSYTg4wnNCViLv2blazueBXBI7zOT0S8zUA4CdqviFJLs3DJJC
	cI4MYr3jC5t3Wwgdu07grZXtK0rI66zu08kKQewmaN0IzGz+6l4Fw4wkF9mTuspYCB69NmFUEbC
	4TyMk21jALkj2QAXDqslEPetaxziUsIuQ+9naJmo2w3twFyjVXTIy5BrBeHzzHp6m/vHbLL1Xv3
	tvyGnDS5lyFl4D2cDqgpCSOQQSb89uxm+CsqwxDY8ZYs0SDUwYwdfn9hIF6vVljHUYbt/PTjL7i
	hOOo9ThGZkIdh432mQW+2oxkcpWho8cuw2zuXUMk//v3mIDTw7Lyu2TtWw9EkbXVZxo/K0xNdsy
	jlrFylnEY0jwNE0OTy2xHdjVrGMQl62uMJ9ePUeVhTpURjAmMZsDjg1USmoSR2z7ZvebHo+9+j5
	ftP7qFk1V5ADJ1IPLJ0raglaLEgd5cZD4RrQNN10qP8HkxpVi6bbvFjuc4cfw=
X-Received: by 2002:a17:90b:56cf:b0:369:a359:b181 with SMTP id 98e67ed59e1d1-38ec6610d34mr6642066a91.23.1784882653597;
        Fri, 24 Jul 2026 01:44:13 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:12 -0700 (PDT)
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
Subject: [PATCH v7 02/16] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Fri, 24 Jul 2026 16:43:11 +0800
Message-ID: <20260724084328.3943997-3-wenst@chromium.org>
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

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Cc: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 950defc0c55a..5d3993bd8fc4 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1099,6 +1099,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
 }
 EXPORT_SYMBOL(fwnode_irq_get_byname);
 
+/**
+ * fwnode_graph_get_next_port_endpoint - Get next endpoint firmware node in port
+ * @port: Pointer to the target port firmware node
+ * @prev: Previous endpoint node or %NULL to get the first
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer. Note that this function also puts a reference to @prev
+ * unconditionally.
+ *
+ * Return: an endpoint firmware node pointer or %NULL if no more endpoints
+ * are available.
+ */
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(const struct fwnode_handle *port,
+							  struct fwnode_handle *prev)
+{
+	do {
+		prev = fwnode_get_next_child_node(port, prev);
+		if (fwnode_name_eq(prev, "endpoint"))
+			break;
+	} while (prev);
+
+	return prev;
+}
+EXPORT_SYMBOL_GPL(fwnode_graph_get_next_port_endpoint);
+
 /**
  * fwnode_graph_get_next_endpoint - Get next endpoint firmware node
  * @fwnode: Pointer to the parent firmware node
diff --git a/include/linux/property.h b/include/linux/property.h
index 01ea010cb2f9..9a784a856773 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -507,6 +507,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.229.g6434b31f56-goog

