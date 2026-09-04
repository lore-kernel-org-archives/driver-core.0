Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88CEF415F06
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511349; cv=none; b=XL6Y0xKDA2IBdTV8C1wjfUtsqwxWn5ZyBpl8e/FJJesQMntCXuLDCPts+shWmR9cQLX5D91Q8nKZmAFPIN1j8duRHgjpYLm5kLlAvjGRhZhjXSy+vnmZTjdnyD70YVhXyrCe86UcgyDH45g47DHG7sHn/BiPmKo0reZbBo6KLek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511349; c=relaxed/simple;
	bh=yg835mCmcfMqyyZMo2K7NS9o2JVbGcnLZ8ClgruKi9w=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cAzHAxWFIuCHivQPpiwc92UK3aPaW9HU/X+69UQpF56vFgCAu62KxtYMT8Nom8HlqWh8k9BHWdfoEtV5XXGXt/gATg+JIsSVGZH2rnV3gNLfSRzOSLSU1/vfBpB8FLFIjO2N0V3Ekl2D4sJSUbDheyZFrcEMQCvWr+YAkMCQp50=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SMZbQQ5M; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SMZbQQ5M"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-398a4dcf289so874511a91.2
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:42:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511347; x=1789116147; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jUco8k8loeDw75nokYqtCIPRhQuEjxppf2mE5m0ZQ1k=;
        b=SMZbQQ5MR3FVVbeIwX+T2PsKiSUfmDQO6cfoU9Acc2dLgY9/L7Lg464aKGAvM/uVCM
         GUaq87S6IYy1jtUMwc2Ne0sYOVuGmwoyKn+PHN0s0wDVj4iL6aSrSZG+YGDdw2OV7O0B
         uiXe3B/4TS/sGQ7nrAfRn5IDWNRTDwmJvBy+w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511347; x=1789116147;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jUco8k8loeDw75nokYqtCIPRhQuEjxppf2mE5m0ZQ1k=;
        b=D/3pGP9aoPHD4SoCEQ1Xt8O1VC7g02/yQ8fJ9aVa2Ik50Z+QXZZ+E3aIWiPqhc9ZT6
         R5nX22KKR3bl1XaCi8MZPfIOOXYbNMuFutFvpz77SLFA0MCeVJs9jICQ2D9OIhelnGxI
         CCtU/Uj11fU1bgsBLcaRLb3/WsPrE0nKCLH5/mp6wHvJt33pVJV4OQWhEHkWR71afg+v
         g7fpOdyDUWZ9h2lgefj0NUB0dQ61HMajVUBQC3qs+c4bfo/mh3dImhXUDNETKCJhb/NC
         Vgg8gNw8PSyW7ueMlDYQkTmQoXomLX4jIDJdqWOJ+r9eOTQUg4VXlP3zdjSgaNTBinn3
         5YXw==
X-Forwarded-Encrypted: i=1; AKwUvBzua9t8jCm8Gub3vy7XEwBLGyByi66NF+QNsHbRyL6rQu2DhbAupQ05Z1KOb2XYoIbOyOZyV/Yk0cE31A==@lists.linux.dev
X-Gm-Message-State: AFuF++nd7bygV2jUkhQdFqwGDnX0/9w+1euUu0uKRqHInK9A2pdGo3Vb
	fKsjwipRj0T70Sr2T4ysktoOHh0hsQmvDqGW99+6YIy9LeKxYAnVwE6lBuKYXmf2Eg==
X-Gm-Gg: AYBFou3zoQD/cJPYkpDkMZ9GJVEfA9k2d1q8Ee27go43NYSUHp7uJaj8J3xgikcrvlC
	lWk1m7y0VTYuH0a1rY7JMiwfK6b+XTRhG8z6X1q/gKbTBQKyIfcB0yaFteNxmV5+O6vf/tsmOEi
	VfOe9gzPZFTGavR6AnoEYh6QBFfzdFYskCjv/slccLXbTsx+47VebT9osQrxSMc2olP1FEssQLg
	KQk+6QsNow1yffChpkYaUIV1rSUSHbGP45XXtrwPFh9HSzRyBPguiSFPzf77nbekUmtsjVgQjTE
	65cH/bBROaua2LutG0Vr4fkkwO0YrrfALVgEHScBQn/oWSYepNQVc3BcWTE0MNJ3W0Y3y4cdytz
	ep+Ap/7GjQuVyKkviDY4epjRwS0ci6GzMBQxg79E0QeV5xIdTk06Ezcg2UcMOYyVIqX2Lm3vK9H
	SELFbkJllS1lifEFxYDa9bYMx4WMD/9V7Hem6JeKhnAJHZNSSqDKWj6Ga2V4UR0Anvs3feDdJvw
	tfgqo/VTqmKah5ofNRTIqgmxgjNr7PxqQPdUT/3DUXZ
X-Received: by 2002:a17:90b:3a8e:b0:390:8361:a532 with SMTP id 98e67ed59e1d1-39b260d2eb3mr6786889a91.7.1788511346596;
        Fri, 04 Sep 2026 01:42:26 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:26 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 03/16] power: sequencing: Add pwrseq_get_state()
Date: Fri,  4 Sep 2026 16:41:42 +0800
Message-ID: <20260904084158.1341550-4-wenst@chromium.org>
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_get_state()
so that they don't have to reimplement it locally.

Instead of just on/off and error codes, the function can also return
"unknown" state. This is in anticipation for "uncontrollable" power
sequencers (such as GPIOs left unconnected).

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v7:
- Adapted to pwrseq_enable/disable() rename

Changes since v6:
- Changed to pwrseq_get_state() with enum return value

Changes since v5:
- Reverted back to returning -EINVAL if descriptor is NULL

Changes since v4:
- Make pwrseq_power_is_on() return 1 if descriptor is NULL, i.e. if
  the descriptor is optional, matching the other pwrseq consumer APIs

Changes since v3:
- Added missing stub function for !POWER_SEQUENCING

Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency. Bartosz wants the change on an
immutable branch to pull into the pwrseq tree.
---
 drivers/power/sequencing/core.c | 19 +++++++++++++++++++
 include/linux/pwrseq/consumer.h | 12 ++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 721e888b658d..dbb2bd2f8864 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_disable(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_disable);
 
+/**
+ * pwrseq_get_state() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, PWRSEQ_STATE_ON for on and PWRSEQ_STATE_OFF for off;
+ * negative error number on failure.
+ */
+int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on ? PWRSEQ_STATE_ON : PWRSEQ_STATE_OFF;
+}
+EXPORT_SYMBOL_GPL(pwrseq_get_state);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 16fad5f3e3ab..e2a2991b20c2 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -11,6 +11,12 @@
 struct device;
 struct pwrseq_desc;
 
+enum {
+	PWRSEQ_STATE_UNKNOWN,
+	PWRSEQ_STATE_ON,
+	PWRSEQ_STATE_OFF,
+};
+
 #if IS_ENABLED(CONFIG_POWER_SEQUENCING)
 
 struct pwrseq_desc * __must_check
@@ -22,6 +28,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_enable(struct pwrseq_desc *desc);
 int pwrseq_disable(struct pwrseq_desc *desc);
+int pwrseq_get_state(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +60,11 @@ static inline int pwrseq_disable(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_get_state(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.979.g7e5102b832-goog

