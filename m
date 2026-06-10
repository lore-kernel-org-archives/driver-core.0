Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2765C3B14D3
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:41:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080885; cv=none; b=M0z+WSG/WWDYUXCcvbU6YaQ/PAksYDfwtOhNENtIZ9TCJ6bwx42Z6TGyu6JTbWnKYJa6E9MfYG4Xc7zxY3cPT6W90E3SKZKAmO5QZL80ME1gzRwPn2AEg5oPW6GLFtoFrHjp6FhpH+6iiUsv0OLC0tzrCd575zRB9pg2aEQI/PI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080885; c=relaxed/simple;
	bh=DzZj1fIJIKJKGnQbn8uPuOz0dFp4PhGSgOkWpDGy4sE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l0nzYj5Wf+LqDkkbvGDSD3Wwa+M8hnW5E0ydYhpvrjW4tlAdLTDPl/k4SCW6+rqltlyAfmdfzSp5YUoVvOopbgXa6Pwd+4M7ZDU3jxP6QEU6HakNH1DQZAF/BRvXuD2R6sDw+nTbfRt3SzUH/wLoxFbrDGgRb16wqQOKo4PGX/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Wph6M31s; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Wph6M31s"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2c0c2c7d45eso58420405ad.1
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:41:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080883; x=1781685683; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=;
        b=Wph6M31suY2POECl2dqN4mzHa/FZB8kynTZeGk8W+AvMZyyOUsqftis+Klt/KnoPod
         0dX1jqSNBbiBd7HsmCSkeUYhfvzyHB3T8tBJfVo+MqA/0vE1tWGde61GmA+oCboMZRKI
         XHAEKyPKEi2kL/AY1enaBiCaT8wapckhxaR58=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080883; x=1781685683;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FRsKkRuXXrcRjbvRngvMO9bdz13WA7D5wKB/6fXyEG0=;
        b=ZnajZi7zRv2a8QNQLi/9IYMx31GLpAJMATbdvqGP5V1QR/AN0ea4MzMr0WTnlE8f62
         BPTxdGRM7tGel1aamxzgFriIq7pmetrnYWSvrXda+qaMArbf3eg1iyhw8kX3oJgSGnlq
         wEU5Mq6TAndbWMpAXvK+BihsdgkWApOatAUDHX6zKOxHNmNc/W2XpHVR5hYO5jZR1EH1
         YVQXVSugfkg6QWsTWiVBIXxo/HZpu9FJOCjPNrs/UKavZiVm/ne+bEUnMkO+TW2MLqIz
         SQwgcD0RNFnOGOXpFPlLUXaVqCISWn8H+nfTFYEMroBZwZ+mJ1gqpwGkmBFHVdV2akjX
         q2XA==
X-Forwarded-Encrypted: i=1; AFNElJ9/dBcAKe3ZU0I1xfFw3yFn1XFlz/PrKpMsnzuH4gvQ20Im9JTPrW6dSlsUf9REF5nhGobF0DuT44FHrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHTxpBXJ2cNQL+42XdH8LrdeEE27kTDnCEku2iozTmVVUy3cQs
	fkzoTGIOg6ggtPQVjM3CoL7RW2AgLP4Y9dNWhe9ELGh1NzeGkaQDuulamrOc7zUCfQ==
X-Gm-Gg: Acq92OHhp3pOvAH59H70YEloQhqWB/tCAart6s4xmsFDsCBZ6ki2zd+CfR9uSe0tmWw
	FHsG4aUv7NyQ6VEt2ekxj7oJZlkaneDopZ8fMhWDAPRiEYeQ5XtuSIIZv2NYJxrBRJ84spJWFal
	QDNXlEulwT6TijrnMm0GyVwQ1FJiyHZ//H70bt0g9G3eXnfHY1mcElWQMbruHSywpCpXBebKxTs
	Fx3ZUXpNOfbeqPme/l1q0Ka48GISVAmdvq+yobBMvIMubrmMUTo6ATzPSb3Iaf9fnAu523sVaBr
	zzqRd72x6nLs1VJxJnlEUjDEhj8XuxO1zTHuNPTntnnEa0XOR9liew+lUeZLisLLS9ArU3yIKBX
	nLf++E6zP6rosCYZj2cCQo4M4/Z44mQaqyG1wdiODm5Na12V2JtuDjrTLbsxzfn92HnAtj0XiO2
	X0wjCG5APz1sIdVl4Br+a1knGqSdZ3zq7yjosuSBahWJOe8llDg3RjaaOo6KNggUkPjXSI8Air5
	RomtwFSZc51uKbWdQ==
X-Received: by 2002:a17:903:3b8b:b0:2bf:114b:924 with SMTP id d9443c01a7336-2c1e85ca6b6mr285765545ad.34.1781080883374;
        Wed, 10 Jun 2026 01:41:23 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:23 -0700 (PDT)
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
Subject: [PATCH v2 01/16] device property: Add fwnode_graph_get_port_by_id()
Date: Wed, 10 Jun 2026 16:40:35 +0800
Message-ID: <20260610084053.2059858-2-wenst@chromium.org>
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

In some cases the driver needs a reference to the port firmware node.
Once such case is the upcoming USB power sequencing integration. The
USB hub port is tied to the corresponding port firmware node if it
exists.

Provide a helper for this.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..a2afd854a604 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1346,6 +1346,28 @@ int fwnode_graph_parse_endpoint(const struct fwnode_handle *fwnode,
 }
 EXPORT_SYMBOL(fwnode_graph_parse_endpoint);
 
+/**
+ * fwnode_graph_get_port_by_id - get the port matching a given id
+ * @fwnode: parent fwnode_handle containing the graph
+ * @id: id of the port
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
+ *
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ */
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id)
+{
+	struct fwnode_handle *ep;
+
+	ep = fwnode_graph_get_endpoint_by_id(fwnode, id, 0, FWNODE_GRAPH_ENDPOINT_NEXT);
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
index e30ef23a9af3..11f3b54c7de0 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -499,6 +499,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.54.0.1099.g489fc7bff1-goog

