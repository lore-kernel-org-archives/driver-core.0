Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EAD43F4AA
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545520; cv=none; b=r/vZrpXqdLc2pTI6EYyWfA+lQzKihiYAYyo+gV2R4jlOqiFxNndxuP+3vyolRj1Dr2ssMgn+4RwxrjO0lmHQrzkQfGkGCobOUG0MWXZ/9kfSkI2CFvOxjXLZYI9wUWqnZOdbQYHr28E6ofR3jY4ENr/2qGEV7CQ/x/7WDiRumnE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545520; c=relaxed/simple;
	bh=Ri/id/vx/k24FmJGCtv/k72ESmrqaseCj8QxRw0wDxA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VB9zv82JpqoO/9ugakohPbrbicwOwGWuFWe7858oyIHv2CFwNELmDuIW6ORI4yaqxA5YwoNL2e/NIEUx7QLkiimk52CuNdgV8neqHKWIy+czsfDYcoiRv07YM98Oy7oY5pzSKrgRVhFmnqymyPiCs+mS5oHTIxjjbFi4KSXXNQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D96j0dLa; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D96j0dLa"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-398b3b189e0so503595a91.2
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:58:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545512; x=1790150312; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=D96j0dLaI4cAesEKZrOFsf/riTB4zKnW/eEB5mSAfadcDIGfGLVaSpkq5rtCLGelXL
         6KmPSNiB7IoK7dxAd4/I/UBr9ODKLiIgSunkhaBD5AS+EVDyTqX3QPxDjQ5d9aqeJHFp
         JuweI8c/IHU3SWO+1wnyUcoswk5xz02NiuYvk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545512; x=1790150312;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fj62mBTPExqPPPR271cOhjtoM9DP+nCqq3W3jRfMxEI=;
        b=1FzUqN93DWBMEKLZ8I7MSpJes94CTXfM5Ri3AXSO+Ab1yl6Rh0YgQeFQTrhYMlulfo
         FCZVRGA+cd/WuCdBXxZb89yL5e1sYlE7ZJ9fy3UiE2kXY/TPqcZPfjthwhS/tT1PYAFT
         5wtwTdtLmtIEzFSVbR1JlIMDe+WMom7Z1qT7dWTqwBfNvkOPnDERgILPEBY6UXajMnpU
         /VRNG5WAC8MwS8FyT6CKW0Hrpnj1RhIhc4V2oWqZhmMPVqXo9/TqfpJajlIa2P/1IY6d
         AgAybHgg60aUIBoTwiewz6lLY2N6roJEgN/EMGMk+90Z1tZ2/FE3Wp9ccTGS3yghTi5w
         A7zw==
X-Forwarded-Encrypted: i=1; AKwUvBx6tP8q60uckwV36iUh61Fp/EDvr3Twdn/4l2pyWTuBa8c8UKDYSfvli3F8cQRVGtfjQriXbjJevHkGBQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lHT7y+uQ8/3ICN0oPdaT/woHlj8HKddNu/jz+35OiM/SEgLyhq
	WLMQxJXFMfL4fEzpzuEN876DXdulovPdzjgqxhpUTU5UBMgiWNsjVQw5lTqYZwazOw==
X-Gm-Gg: AYBFou0X38kPLpxnU6bKnmLsqNQgY2eqt68KjSYg4bKV0na3/3qmCZJM9Hoc92Op9j/
	XhxcXBqwOE3YStUSiqHEc/OUF+H/oEXSG2IR+YMw3TpcqYf9haqoKra/03g2owxBhkMKrxn7fni
	VDy8m6Af+t2JTA7qaKwRFA6j7OQ8DEaVjEA76oksKEJUFqdL4Gb6QfWvSqAePMIsgB769a6GQkD
	jqKlKP6rDX5biz30fnWBCrHWyWWb69bUxe8QjYWybazoHp+fW/zO8I7iPDN/++z4kBFjX3Zdirx
	dOAn56N1AxTOVNyGK7RB3HYjiiGil0x/bmBIxTu37Pi6g61pkilf7absiBF3cpURAj61XEfcvuN
	74eRsoMhMeM1fzFkD0WmM6jc3NG8zDr5U88g981R7sCp5BusBBN64srHXrwKTtCSx7DGXmPSGys
	u0Xy4/vpsPCssAmMryHQGOcN55hEbTpK+zzQiUau+XL4N3t+uzAwRQb9sAY3bmFku//zHib3qbj
	pNBh+fLy8rGqStSZoEQ7pw2tT+cRyNCi5PaC3bgZ8zBGfpux1x1OLn2zQ==
X-Received: by 2002:a17:90b:4b83:b0:398:9bd5:490b with SMTP id 98e67ed59e1d1-39e1e4c4687mr4082007a91.18.1789545512315;
        Wed, 16 Sep 2026 00:58:32 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:31 -0700 (PDT)
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
Subject: [PATCH v9 02/15] device property: Add fwnode_graph_get_next_port_endpoint()
Date: Wed, 16 Sep 2026 15:57:28 +0800
Message-ID: <20260916075745.3549953-3-wenst@chromium.org>
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

Due to design constraints of the power sequencing API, the consumer
must first be sure that the other side is actually a provider, or it
will continually get -EPROBE_DEFER when requesting the power
sequencing descriptor.

In the upcoming USB power sequencing integration, the USB hub driver
first needs to check whether a graph connection exists, and whether
the other side of the connection is a supported connector type. The
USB port is tied to a "port" firmware node, and this new helper will
be used to get the endpoint under the known "port" firmware node.

Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Sashiko points out that the |prev| reference put is not done if |port|
is NULL. However it seems that the fwnode_*() and of_*() API design
implicitly makes the functions no-ops if the passed in node is NULL.
So this new addition follows the same pattern.

Changes since v8:
- Moved Sashiko related comment to footnote (Sakari)
- Collected Reviewed-by from Sakari

Changes since v2:
- Dropped unused |ep| variable
- Rewrote as do {} while()
- Dropped WARN() use
---
 drivers/base/property.c  | 25 +++++++++++++++++++++++++
 include/linux/property.h |  2 ++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c2b7a571fe03..924d03df4995 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -1109,6 +1109,31 @@ int fwnode_irq_get_byname(const struct fwnode_handle *fwnode, const char *name)
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
index 3dbbd01a52d0..691e792775d5 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -509,6 +509,8 @@ void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
 struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id,
 						  unsigned long flags);
+struct fwnode_handle *fwnode_graph_get_next_port_endpoint(
+	const struct fwnode_handle *port, struct fwnode_handle *prev);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.1032.g73a4cd73de-goog

