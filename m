Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CB683BBA05
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:03:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076625; cv=none; b=LIPdxrLTS5+CW3Tym7Rm0Bks3oj9XeNxO161Kh88ZaMzpZEIDAh+CrVuHlEqGr5udOUk1EsykxA4uhjKXzH0Tz4icW+r73uYvZ8JLWBjHAHEgVFWh/kwgyF5K9o10A0JvaqJXdKBO5Jku6GYocOJPwFfIdxolaCElJdjj2FsYK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076625; c=relaxed/simple;
	bh=M2j8dlezMX1WXhIwcvdi4oKmtviPBpBqXa5qEt6C7j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mAZ10ovPkNBXpSRQAC4Tbdemzo9vUvfsTmSVaT2gDEHaS+O7E2WU2DMAXYokJU7C1ZdkEYqGQTZR61luy4vWEzMRZR+Ex9xGx0+dQ2/IHg5jxGvvoaogzhXgiSfUhgwNbLSJedTxyJPiyu1Frd+fZV9rRKf/LYBEAS1vXzrgqBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=hlHKTURK; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="hlHKTURK"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cace7da66eso3959195ad.0
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:03:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076622; x=1783681422; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=hlHKTURKM79TCedmW7GH00EfhMkHO05i0MP+Bcc7/SysYTzZlZgmg+wPTTVANEwftx
         05lVU7aAH1VcXevJU05nE9R5yXRyJzLzOJGsqMTj9iTxDtwtnHVMi4IQPWeX30GuIDr3
         lHLx10Ebf79dlAGoYHBba45VTouaA7OMhmGJo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076622; x=1783681422;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=E742RWSqyUpjpy+ZFSeaNRHKuAVV+n7jX1SAgxgLen0=;
        b=P4PH0zo1V9sf2y0UfiKTGz4XYaLKCznp37YCoWzHBhMrFMB2lSXA1tEpUgoIZQjRpy
         RWOWPTgbTddwFwusx6IfT9lV+Ux3PXqmKVnW31IqSv/q6O1t+DawG47KUCMv/ehwZPMr
         Qods2Q/HIMxFNDSXiyF4v0K1Juwp83PKuo30x8r4tEZ/q41hmG4OOuT6F2/q7kJMSsL1
         2LztKds8GVX9w4DgsgrrXC0GwEKEZDztFiioMCGyZITlmKKhmUbGaWbo/a+ldmIXM5e7
         UDIN4SYZCg/O1fFn9yCieeLC3+Xv8uMnI5fVrxjVxFO53UViKo+xLb0qIra8OUWR5oie
         S15A==
X-Forwarded-Encrypted: i=1; AHgh+RqMAKddCpQCPcGjTQbkrALUJ0CYt8qk/mOPT+zVsccHfWkvPEMCe/KMXMXcrRKVs3hF6snpSqCtCD7XrA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz8IKux3jt8wJwqpjf/JRqI8B6gG9cMT4r+gvsWHivpjviAW50d
	sk+JnS+U4V8SQwDpj6N+WUZFXjW8YlzbTvP736GKNEslCZ2j8v0BG2dX/CW8rHbLfg==
X-Gm-Gg: AfdE7cldEOHXWvvA22dt92psQu/MWWB7Q1IbpMs21kYRaWribk/PgdZZrLRKn4pbtUz
	b8mIcT+RDrrlEKtoMpNOpWdZ/F8Gh7Qp6SChPoRFZLQ1rNjeMwEyH8IRcjZyeW1iGyrkNCyEPaq
	T7pjakIqyK341HJ2Z14Fs7BrAwnMHNesvW6mPDWwvwdapz0y/VCZHQTjfK3KBuTTgqt2MpgqcHQ
	b0FEPaYDBsAcrVpNU6frBABi7NTeenKIo7eDn8LDDOM1iNJT0RP+lJW13qqLMJfFCA0HxCpmYEi
	XCStnCs4FUwIPuVJUFsanvVJXWMmn3otI5iH6UFva5+/wA4P5P/VtBDgjTh3ZUNPfMpa8vJPa3y
	wwX49a6MrXB1z7CzBosXKHo0X/fZ3tomjQGHXGxMB4OIa9gRHVpH6Fg9GeyVrTKey86nGAjLXOv
	FMAnBcNcYezjJAauK60MK0iXh12lb51X30D9qLszlyg1us5bAdMqNU1oYkbKAaIMH/e6HMKw==
X-Received: by 2002:a17:902:da2d:b0:2c9:c13f:910a with SMTP id d9443c01a7336-2ca7e8d033amr108379995ad.45.1783076621819;
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:41 -0700 (PDT)
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
Subject: [PATCH v3 01/13] device property: Add fwnode_graph_get_port_by_id()
Date: Fri,  3 Jul 2026 19:03:02 +0800
Message-ID: <20260703110317.1283411-2-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
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
Changes since v2:
- Moved "Return:" kernel-doc section to the end. (Andy)

Changes since v1:
- New patch
---
 drivers/base/property.c  | 22 ++++++++++++++++++++++
 include/linux/property.h |  1 +
 2 files changed, 23 insertions(+)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 9387bb83eb54..3e3e19ef66a9 100644
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
+ * The caller is responsible for calling fwnode_handle_put() on the returned
+ * fwnode pointer.
+ *
+ * Return: A 'port' firmware node pointer with refcount incremented.
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
index 14c304db4664..e04901c0bd8f 100644
--- a/include/linux/property.h
+++ b/include/linux/property.h
@@ -505,6 +505,7 @@ int fwnode_get_phy_mode(const struct fwnode_handle *fwnode);
 
 void __iomem *fwnode_iomap(struct fwnode_handle *fwnode, int index);
 
+struct fwnode_handle *fwnode_graph_get_port_by_id(struct fwnode_handle *fwnode, u32 id);
 struct fwnode_handle *fwnode_graph_get_next_endpoint(
 	const struct fwnode_handle *fwnode, struct fwnode_handle *prev);
 struct fwnode_handle *
-- 
2.55.0.rc0.799.gd6f94ed593-goog

