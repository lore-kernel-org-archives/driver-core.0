Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93EB5456DF0
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545533; cv=none; b=JJNu1O7z5TndfH5V8wJSkMK3zEnFw01OgSB0TBum2Pmpq3yOt+QB4reQuKUpZTy29PZGV7UmXEUTCUgWELPL4fr6xvk+7re2xam1TeP6POX+rkZwzRIevkdu/15AdvsJgMUwT2v1qAJhcytFcmUdcn0YVOyuu95+wZ1HhMVaX24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545533; c=relaxed/simple;
	bh=L6VSMNKkPXg4l9VS1SCcav8nfu3ymTFtfF0ofUQlcoE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=odNuII/LZnq76MvZp456dPKofppPOf5di+QNdtiUSvOly7JctESlEuzcd7DcQe4vXNtBt1X7RFf8PFTucpooJ8s1fUMOmnwofqT7tQ2stEQh0EbCHncI+y0AzJEXDuhGVfXqiEaA4soVq4tHUnvrBrxmg8fdxDGHzmLO3rapS4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=afOSycI9; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="afOSycI9"
Received: by mail-pj2-f43.google.com with SMTP id d9443c01a7336-2d747ec6188so4525515ad.3
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:58:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545518; x=1790150318; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=afOSycI9SFnJnh1yuj6ukc+8SCufQtsGwS6EDHcqKPQGLu5E0bxBXX1aBosrSVZ3Sd
         adXQZErUrrRrfmEPpSSosZa6QSXqsV9c2F0Wb6JyG60yOZM9IFhe9DqqDcZA422XrW2E
         pk6iI8b86JuMyiU4ZAwFcScXq81DNtkFn0Cds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545518; x=1790150318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Fm2NU1dVk2SpuJ0fFyLgsSQpwqAtZZWxE/JzixP9q9s=;
        b=bUJ7G4LdYxEOrfDDTw5jFrJq4gFp3EJYTOWvtVnz6ZJfbLt4/PqjeTJQ6x0hQmMHcx
         e+MuM29O0G5JcngQ2OSg3qPMrNL214tcKPtRY/nz0gsQKpyNyI6FUGnWn/F8KC4LKCUM
         FsTyO6lLdBxHzeEO1+AtsYigjqxF2CT35qRez+l256sgfOgiSu3tRkskoazZu/JKLKlD
         8bvCUU0KGwOLjiYhdB0gutplGxZe/CsIm5wT198iRhU7NVOAZ7R+YbEgzIXUpe95R9EN
         XfVTrnJV+1sLyhNI37ppp3YCSZaEZPU5DPJAJ8PH9AUakgbfHsqTBpB/6hxiaup2iDaQ
         8kNg==
X-Forwarded-Encrypted: i=1; AKwUvBzTnzkq9zzJbgf9cvLJY0lALcpeneA9c1aEPUdy7e40ige0RSFdKtSpfH6/lhiEUTXCnD2lc4e16dUDOQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nQYwaoqHvNc5C99wyyCAXXBDP4P1PGwKsciK2jz6cjVPeVHdGe
	ZBZD3ZIpqHxz2+6o636406t59b7mGkzbrqIztMa9Yxm3D1qfa4VpCkkMl3yMAe2AVQ==
X-Gm-Gg: AYBFou2MpMZWzHempBVOYhepzKXrJL9R9Sn4osvreXYDab7OpRJLLxy/13sbQGhC6qc
	qgVFaiohb6FpMFIlzIZ3Pb6hFlufkBZo5s+cZuQ1Y7EMlcpEyI5WG3zzeEK4hUPyMdp1qCbRVuE
	aPPPFFProuRzZcq1L9l/dFHXJPSiOWiBA5P9r7gd5s6tkf76nsGz8mVSsl4+RMvfzWs1Cy8LB6M
	AkojZQMu9F4tUzCY3AizZmSqEvbLe/jjGkaEnag1FL/pbP1uE8eLbSOHx6ssyq82hZD+dv2Uium
	DJY3l5Vz4mf+3MxBZ4nbTOFSKPIVUBdR+tMr9ZRBW5TvmVj6e8FitDtoOV8hkpUG+dT+QgUTiU5
	V1VS2apPocoi9qXpYJISjJvZ4iSJsixs1IJTvUjlsTWEDZLGYxcMfGn/gyoxSSWk2LNzBV23X4X
	eCZ7ZT7fMFyNjN8kSzMBqhFcHgBXpHjNskUJYNf4K2P5MHNgy7pOXLy3EFuBYDbATK37zh3wPoR
	2mKVVjbV4svC7UvEb9UAOB7projNDiACe0ZxfqtHlUDBcEwI9PS7BukoA==
X-Received: by 2002:a17:90b:2885:b0:39d:f130:8f13 with SMTP id 98e67ed59e1d1-39e1e4d3357mr4064349a91.21.1789545517871;
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:37 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v9 03/15] power: sequencing: Add pwrseq_get_state()
Date: Wed, 16 Sep 2026 15:57:29 +0800
Message-ID: <20260916075745.3549953-4-wenst@chromium.org>
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
index 3076b3879af9..8e06fe77fd6a 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -971,6 +971,25 @@ int pwrseq_disable(struct pwrseq_desc *desc)
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
2.55.0.1032.g73a4cd73de-goog

