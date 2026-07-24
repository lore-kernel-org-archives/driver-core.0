Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A9E3D9527
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882660; cv=none; b=B02HuRMRW339ZfAiJT1j/W6BVTvYGe+w3LykIBHnS9OjOmfRk9ZLc8q426ylx8kwr9/SFZ4eFCtxvd450j8zkwXrE1qZN/40sOdlhafeezw6n82lUiopxxNHooMsNspJpONQSW+XtpRXKmkbYwS0Lvf6N8OCRWvthUN+j+BQuhY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882660; c=relaxed/simple;
	bh=GfR2p9/Kj/F0C3wXj1i4wv7w/Gl8fUFvNscov5zqDHY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bUVFGFmFMlM7F7Zc5KOO8hD56KbflR+RFI4ZcaP90C41QKIkQG5mrCGWY4V+XeVoUa4Y82H3EX3BA+5DKwGdlYtvGr0ONpe4ga8fq7NI7He91xNVK64+1MW8bhqIN8dZOUOrMHxt+oM8KQ7OSBBRIbEX2mEpF5VZ7puAQoazW1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HcGJqbcG; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HcGJqbcG"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e071ed6aeso139420a91.0
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882659; x=1785487459; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8J9f0ysj5iLgXAfZrr4tNewoNqni8L/Xnuw2lNVMgtk=;
        b=HcGJqbcGheTsT0BqEZZX30gKmx4G/h4sI+uOS9u9jCJBPo98hwM2EWM5SZcJ2QYdf8
         zbrsBvA3ipecawymIHEREwd3e6Gy6woLK2ekEKokC0B+nYRh2CQR+kMU3pWSjPYoIbq/
         dij3QkxBZlSf82yCDfNqLEKxCafx5QUXHz0zc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882659; x=1785487459;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=8J9f0ysj5iLgXAfZrr4tNewoNqni8L/Xnuw2lNVMgtk=;
        b=YrSmII3aqeRba9DojN23yGcndMrOp6nAh9Qx8Rkm/SwDwkMCPlv1ccUDZkhQ0uZmci
         3zbTANkU8Laoxqr18WLvppBTL/lbmbqFHdGG2IVoA6okc1QNIiIn1jkPqlSrUgOpE+wB
         Z0MgvdeXIgbHYz82JidgxvWeNv2gVdyWalKnfMUORFMIV8jEH3aefLwoYdUngB7VPaE3
         FjMIElZ6eg0xLFKKi4NhGUw7QjxAexrMv1vLzeQVhkbwkeCA+S7Ow5afYHjjq12cK/Hx
         V2F9vFh6HSprdw7P4JteYtbKLoeI/wGF8sW8oxuRwYMVAefZDX7vOhZLkgV83Jouq0So
         XsoA==
X-Forwarded-Encrypted: i=1; AHgh+RqZztzdF5S16sMHL4OmsQ/6oy5xwyA4KN+rdBlLB2eZt0OgHjZbRVJur15XjlR3vdYhywrCAmAoruxcUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrvPJTraNYt0S5+hwnW0H5mY+uYUdi4dfqxBsgIsWaxb/+LQqs
	RbMBewxI1qzPZz8zUMYXf6A3kFZMBT1wpt1dBcCv3A9r/NQXW4ibdvYtNQL9a4NohJSQyiAUlNw
	mr/s=
X-Gm-Gg: AR+sD10+U7y6fhR4IyBWOrjEd0bh93UD+bB8dPWoqBJ8geW6LQinxolv8IYGfptu8f8
	dn8r2iDq4uNqP+16M5zSvyZlFheCOGmbVX2IAygfOPseKnL7XijEJR5nEApf3tg5ArYbu9ZB71f
	ZyqRh0r+oIgPTLPwdEI0FBJ/RgQOw2n5pR7Dh2Sxfr6mfcchlVr2PudFmuzkw4GvBi98ipYFpLv
	WAYLQIGcghjFFYPyjROwP6QTaHVmTUl9KTeUA3aZO3+NDW3A7tSP5feGBC0a268FtlXlGsX8dZL
	LcmPZAq8Us/1PzHCMdj4OiGXj35jDzN8nofeT/H9ntExPpMoHbJ5k90/x/SU3cyZTzKiptl57up
	uilht9+SsFhFRj5jkCkWa0SSyhaWOOcprQYn81S7UB+ADc1KB07Si0JVNy5cDYMu8AqzqS8wPr6
	b9HN7tlhs4jvfXlo+8fCo9Z+mWVrCOZ7E3/IavFuJGU1idNkhWMlzVGJnf4mM=
X-Received: by 2002:a17:90b:1d48:b0:387:e0db:3d8e with SMTP id 98e67ed59e1d1-38ec665050cmr7371473a91.41.1784882658880;
        Fri, 24 Jul 2026 01:44:18 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:18 -0700 (PDT)
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
Subject: [PATCH v7 03/16] power: sequencing: Add pwrseq_get_state()
Date: Fri, 24 Jul 2026 16:43:12 +0800
Message-ID: <20260724084328.3943997-4-wenst@chromium.org>
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_get_state()
so that they don't have to reimplement it locally.

Instead of just on/off and error codes, the function can also return
"unknown" state. This is in anticipation for "uncontrollable" power
sequencers (such as GPIOs left unconnected).

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
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
index 02f42da91598..701728e60a26 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
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
index 3c907c9e1885..af949e756bbd 100644
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
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_get_state(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +60,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
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
2.55.0.229.g6434b31f56-goog

