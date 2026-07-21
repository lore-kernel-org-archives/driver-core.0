Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78DEC42E8ED
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616894; cv=none; b=mpLv0PU55w7KxEsFmeoUon7Noq9dSfUDh3YCbIeAs8dCp9lOaQSVSCHLBzZRJ9bgO6JvoX0EOC3/1u32ZBN+Hty5qoLhSwyr7orz9C39Llb0Tc8c2OKb5qM2Quu49NDgo3o3KQLRawo/B5w+iy/shrlRs4Ek3mQZMjdrdzObCxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616894; c=relaxed/simple;
	bh=pSLI+J3Ce2NSi66v7MACMQ5vg0khpL8PKWmu0vq92tE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jPx203PIOW/M+vrCwbgS9MhDNOrh4YEsDrzzlOw3HitkGyXXqIZCWOaWy57DT8LlzIz7YNCyRgokCeJNz+5AZP6AxJgSWARQvaeGR0UFmo2nge4AQGgBtCN2UiYQW9eQjtMXzTraAzXEEbMC/tDfhS1ADFKKnSDsZaAyRsYFN/A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=CgQyNaPM; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="CgQyNaPM"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2caf228a910so86413515ad.2
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616891; x=1785221691; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=CgQyNaPMQJTzAd82njpRWhe9s7Mm/cth+P4k+fVLDCoDmQpu8OLgpNuzcxWZPNIE6c
         /+HQrfYQR8htcXRraAHfsVfHOGU4/LD0oyBfgL0HD1MlVs+Fe5U11MEyHMP97bgdbB3l
         jekhN0DsQmM+Y2YAlWZfYuxWIsC1z+773YSdU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616891; x=1785221691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=KO0/oP+3FvgdEaMV/KNxdvXtHKwHJHpy3UF14nh5ieM=;
        b=TnnjYPq8OevHSBMT+2bTmCqiUBNg2dVS/3zQQ0tf5PDfCrxK8VBIVc68RQOSjbFU8e
         7F2aQeIHhyko7X3t2jobtao9L7/OyAzWiQ2urfLVFbgx4xQ4ixxtH4wROkX6Xz9m0br9
         4yVzUt7yrxKan8ZEuW3wuFoUKblk5NH/BWXPBK+UjbwATYqBZ9i9Y1ccB1zaxjj15ANx
         nGvbvo0WTjDjHJZWRwzMnmxXJ7zUb4gMdAH4wCr3/4pemLNeIM2b3g2aXYx4vvAv9gKV
         RbS3G5dvWVEsm5NwEibitPX/WuFfCF66JP/cRkZHFJczxe0W62AhC9TaFvRWSy6IULjz
         aHgA==
X-Forwarded-Encrypted: i=1; AHgh+RoZ0Bffb2csc3Yad0ixcTlTmNaFy+GcF2uR9BdNTXH0VuAKkMz/6JH46mB4In6QKyYYb5f4PLFxsnJRnA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxa9usPrQRD3O8lVs8Crn2a6mdZk3/O+dRsr9ogyKJRfDUxi4Il
	VcmsbRjXiXL7LZ68x1dtn/abORopAnIt3DgOTB22ZpxoT32NOodJogWbbgBUOGCjCA==
X-Gm-Gg: AR+sD13CQyt+s9zV26Y2QrzShSjkNzZccp2wbTA6FZuBaRqj/PHTZ8VBnjuPgPfegFc
	mTJ+xg4/ArsiZMleWymkTYmNxYBKGGalytxhr4LcLvyz+fVQUaFkZxZyYff129I+LUfgpr+4Crf
	2KgFNbhweDK9di9infoTed9QBGmyg+bVRpOzaZObTefBXA+7jd4/RyxecpXibI19mkvtI2VxmmX
	/ioCRstrUr44H6xeM3GOq/O1TkNrEKbaaSaZFvuk43tiW+XYUW3b43GSTfknx+arhsmM/mI4CtW
	D+bzXdCHdBvmDlVFmX7BFbdGG3GzRmVpvaROXP3z00+zNg04zu6eH9tZyRUi8/hV/lAsPW5mX+B
	nVOe5gs3UGGQI2/RiODmyZ4dFJ00mmLiCAdNBzIJ5msXVsw3C/GN0o+tcpBMm3WP29baIiZGgYM
	1bLLjIKF7WXi6RHaxzC64kZEd9r+g4jWCfrZDayr9ZRiv/wVMMxUvq2idOY+Q=
X-Received: by 2002:a17:902:d4c3:b0:2cf:30a9:93fb with SMTP id d9443c01a7336-2cf349cf7a8mr187361575ad.34.1784616890927;
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:50 -0700 (PDT)
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
Subject: [PATCH v6 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Tue, 21 Jul 2026 14:53:58 +0800
Message-ID: <20260721065413.2306137-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
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
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 24 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..72b96d36920e 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,24 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on and 0 for off; negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return -EINVAL;
+
+	return desc->powered_on;
+}
+EXPORT_SYMBOL_GPL(pwrseq_power_is_on);
+
 /**
  * pwrseq_to_device() - Get the pwrseq device pointer from a descriptor.
  * @desc: Descriptor referencing the power sequencer.
diff --git a/include/linux/pwrseq/consumer.h b/include/linux/pwrseq/consumer.h
index 3c907c9e1885..3c6122bd0205 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
@@ -53,6 +54,11 @@ static inline int pwrseq_power_off(struct pwrseq_desc *desc)
 	return -ENOSYS;
 }
 
+static inline int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	return -ENOSYS;
+}
+
 static inline struct device *pwrseq_to_device(struct pwrseq_desc *desc)
 {
 	return NULL;
-- 
2.55.0.229.g6434b31f56-goog

