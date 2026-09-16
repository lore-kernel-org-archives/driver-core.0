Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E08DC43BDB1
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545519; cv=none; b=AQibxwZ9Tbg/wuvxCEXGfZKTuEO5EqreTN9O6CjzRTsA/BC99dToJF1k45O63B3OkNVzRA6YPqb6U4GUdMjF952d/PPDwwFtE4lfnRyU0yOEhaRa1zp+r7UXqTu0n6hP+Ky3fdkTvzv8iINdOXKu/0X63MI0f7fH4jOm9wTW8Ig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545519; c=relaxed/simple;
	bh=WB3HiPndp9Zotj1PQ53f357swoA5uLM5cWEs+E4kzDA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LXYrYqbffAMiT6qYhGI6YkuEMSgeUYpU9EAwm/f1dGXxnzZ5obaQGb7X1KMClOdcxyTZQv5GdWuOmxuNcx5pW0vPxU4dGw6wvbxtouzUSTOpHhgMzAguODSR720YaQFFViBaCIXxAD+JYpmGyozlFJRlavfW+pbw/QAugw0P1CY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kn86iKXN; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kn86iKXN"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396ccd5cf03so555671a91.1
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:58:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545507; x=1790150307; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=27brx5O9Ivpq2x+qbJykPxVf6DAdKCDChl3K9VtBSIY=;
        b=kn86iKXNk3/mIQ/0KD0ScpdjS7QmDSJYq7o5EttNotVwgoOGqcJya5zxmpf2d45vUF
         JamR2AuqbFcG1fsSn63KgipUe8wT3kAadVQYMa5PfgI+alPGuYFPa3y8V7cMwC6StUXo
         p6nEmsIhxMZsp6cbvtF3gPxiw19HpSiYS77Uc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545507; x=1790150307;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=27brx5O9Ivpq2x+qbJykPxVf6DAdKCDChl3K9VtBSIY=;
        b=fQYwlq/EU4dcOAYqUUg22il7d2QIRumCgbYdtp++mljc1Yc1srRDteYMV7XrENge96
         bxGIC2GCn0KXmoWhghdTnyTx9rvZpfqS/kw15UfBUepR3uRGMgw4F7VoQmi6j4Gb8BpF
         gD6ZTFIHTLDJkX5Be+FqHO30/KP1EGKVEw31g0gPWEyuBQnoNjaU89EA5jF5s3vLFOQg
         kdcDSGBJTO/N3FU7ns5YpAnT8nIGtYtcFl2JQqRh9DLxiNK8/OxQ7EqExeh7TiLXC//t
         IA9qvuIQoO+Ki5bhz8GD0MBqRBlxpxVL5DPPHtawiDs63X6nYQqrwC82PrKVc+zX/SfW
         uW8A==
X-Forwarded-Encrypted: i=1; AKwUvBx5jLgSpVu8AQ8wL6W+QOZMgbDoWpxtYzQsDdzu2fTSs+BPPSoEo9FqkCupvbhjFog3JN+v1NosnRuusA==@lists.linux.dev
X-Gm-Message-State: AFuF++ljl/siCjQcQaduDZVdPt7XirLMK7SNfuaPEdQTEpkQadF3CtCz
	sfz5ZSz0L5KR2C3P8zgLr9KqwcGeNL/4UbHyG9NIkX40SBav+M784No0yHyDa9YiHQ==
X-Gm-Gg: AYBFou1svuWdYbbzfNIfft3PvRp997qHIxZ8uA0k1ESZKiWPpEkNxsR8EiT9kMlXghD
	8YxhgBEbObUm/vvEuWE8NEdeDOE+XoELf+HjUVq+HOsERfYEAPi0fjVqpwUDxeUekga0HmOJ+Sx
	ktMkb+2c01Zub4Tq4HEG2wBNf2XkwulVsSd2uYjqIqISSCuy4qjCslVEUN1srdayzWirb0dOKir
	DEuTpAhoisBY8B3D3r8foRcFkapBp0XCIMCUDHhPXg1fWRMD9iCx33ToSCbKPxcWO1u8Zc4kJwl
	JPYAHqCTCDNj5v5TpNvgfMYwMQYY5sAqW4i/rx7Ph3Ho22teHuuxK4FSw+yf3cpForoqmwTSzCR
	4PkSFTOFf1eWJUfICwclEkZpgvUW2fooZMvtpTI6hqRfrGDU37A7KEABfXy5v0+nWFdEfVEoLX2
	1E8iyg6N9LFE1fJTHWwz5W/LjpvGFdge2EBVtDYgcrcFVfUvmqatWYiHRDXgmnQ9IrcBJQDzlEF
	qGXfFeDA1sDivj5pm+skITlOpyw37mgaq/9ATAAMq75++64SYCfwMh6Fg==
X-Received: by 2002:a17:90b:6cf:b0:38e:7168:281 with SMTP id 98e67ed59e1d1-39e1e329409mr4159709a91.10.1789545507055;
        Wed, 16 Sep 2026 00:58:27 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:26 -0700 (PDT)
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
Subject: [PATCH v9 01/15] device property: Add fwnode_graph_get_port_by_id()
Date: Wed, 16 Sep 2026 15:57:27 +0800
Message-ID: <20260916075745.3549953-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v8:
- Collected Reviewed-by from Sakari

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
index 51109794d727..c2b7a571fe03 100644
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
2.55.0.1032.g73a4cd73de-goog

