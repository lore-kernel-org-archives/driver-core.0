Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8AB13D9532
	for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 08:54:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784105674; cv=none; b=oLF9qI7O9BL+B5SYqT36SZZP+4BDKb1cMiNScDLPx23bMUJvCHRbSNV8UhV+KiFVUddmdOJX3eJaAdSfBL+fPzJ60d3476jDtiyLe4NsnE0vjrOuqAZJ4BmNA9hXs03XfZUG5OXc2G3iCgAVyUJgtuf7rVFDJadp7vKxasBq1a4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784105674; c=relaxed/simple;
	bh=rdGoAErDNJBoyYumylqg66ArDzAHOM3wX5UO22Ntd3k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lpF3Hz47y5Fp0mTJqpoV+rB16cL3jbK2qd9c/OxwqRp1qdFUyDM84ZsdnkelFt5KrMjsN8dwyQq8Vv9Ltkgg+K5DL50vjx+rx3FqxviTaUK+JjrCk8CCRFPRAltWT2vFUQvJvruJNOTKApyue4p41khZtV+IPvGaNuqbbJ+iPcs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=U2evgQMh; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="U2evgQMh"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-84862b0d5aeso5531110b3a.2
        for <driver-core@lists.linux.dev>; Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784105671; x=1784710471; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=U2evgQMhVhRSBjAG8oR/o21g/0fnoyY66TGQHiqIZFJiEGHVoqpK8mAthd3J1K2aqC
         WnZ903TtQ1bnw/WepirXkX0gE6JNaG35OIxNj3EX7tFEFfuks8D+Eq0e/MYMK3QR4BSa
         Uy0lPgOTJJrP+UfsUCjAezD/NxDazfNBSk1Cg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784105671; x=1784710471;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=tiAJexuP13y6uWXyvfEXpTcy6egDm283JzaUjb9zN+o=;
        b=XjKMR/TLxEcGOVwLP2iZqObvUccoJriYs4QCHOEaeqWbp3dPJqcwdSWRUqXLyTXPvT
         i62ENnJQNK+ed83RSEgrpV1eqhsfM0Iz5/b1NTe9zSGS6rX+SyleUQRL/w+WE11Y6O/e
         +QItnJ8UbnyBViNVexYN66JLHbiB9uQzEn+yysj7Jo6TydpEqeh0I660nvrQviW9FGUZ
         UFaDOjIHpf4uiXcROm+LQFQIb5AtPSTXeq51gkPFTAOiRteaKW0nkOE+8mW2Bs6YpXa1
         4ISMaQaatZnZd3kGYi/SX5/8XPPGCz8YO7cH2f/9m8lASELICE8jQhfWQx9R0vEWCdUx
         pWZw==
X-Forwarded-Encrypted: i=1; AHgh+RoW/ebgAjzT4tFBQGnsBEb1kINUHGYQBmg+BL6U9blkp2Ww4QIoSRrlAseDO9cJnW8RmvTgAASlq29BiA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOpTf45T+Pq+w6nH2NfgHt47PaDAB6gCkzzhIjxSlDxLCDJmnD
	TCuETd3nvgBXBwqC4fSVslWN8IVs6A0RSGo9OeGF4WSiWVkl0O0kU1ypT8Fs6WN/jQ==
X-Gm-Gg: AfdE7cnk2Oxgp0+izPItwjXuvdnJdsbvBg1cMrWsUmwZygR6wRSkf2n9l8Z/VSv694Q
	EPPpVNoRLVus/orWaW5gHhqOXxZ3SrHrFmcEXpjOxwvqac3z4mx8/Fa2mOZiPU+HczWlepT2Mg1
	CSM9noeffPGkqiFAcdb/5ePesnGSIR48nF4KayFI5dJKt1si4npCesGR0gW/MRSYHr0+/qRLbsZ
	UjT+lRm6hdrpGe48/uvWSPUPfrW7hxi2u/Vsl4dWORrmbQ0+UBQcgYYNR8E0jlAPlt31A94PkEB
	x37XFVWr1wgtuFES1uzH0JNTQvLtQKmPSFH0zFEWHbIjlfEiK5WzylGwrmVh6RaLC8LlFAKhZAe
	KXxjB4nip1gFz22bct0RDp4eHLhiI8KL6idSO4w/aEmlN4VIa8lOoKM6w8RICElxuAHTR0x2cJB
	f3/0nRwajv0V+Mfhz9/0zLN5JpaAGwCWy+UlP47ef4OIv+B44lKSnA8UqInhQbDiSl8KOGkg==
X-Received: by 2002:a05:6a00:2d19:b0:848:44ae:47c1 with SMTP id d2e1a72fcca58-84a559964ccmr5439963b3a.78.1784105671342;
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:47d7:4aa5:a6f8:2279])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84a4f819117sm2757491b3a.59.2026.07.15.01.54.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Jul 2026 01:54:31 -0700 (PDT)
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
Subject: [PATCH v5 03/16] power: sequencing: Add pwrseq_power_is_on()
Date: Wed, 15 Jul 2026 16:53:33 +0800
Message-ID: <20260715085348.3457359-4-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.141.g00534a21ce-goog
In-Reply-To: <20260715085348.3457359-1-wenst@chromium.org>
References: <20260715085348.3457359-1-wenst@chromium.org>
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
 include/linux/pwrseq/consumer.h |  6 ++++++
 2 files changed, 25 insertions(+)

diff --git a/drivers/power/sequencing/core.c b/drivers/power/sequencing/core.c
index 02f42da91598..db8c91be10c9 100644
--- a/drivers/power/sequencing/core.c
+++ b/drivers/power/sequencing/core.c
@@ -968,6 +968,25 @@ int pwrseq_power_off(struct pwrseq_desc *desc)
 }
 EXPORT_SYMBOL_GPL(pwrseq_power_off);
 
+/**
+ * pwrseq_power_is_on() - Queries the last requested state of the power sequencer.
+ * @desc: Descriptor referencing the power sequencer.
+ *
+ * This returns the last requested state of the power sequencer.
+ *
+ * Returns:
+ * On success, 1 for on or desc is NULL (optional) and 0 for off;
+ * negative error number on failure.
+ */
+int pwrseq_power_is_on(struct pwrseq_desc *desc)
+{
+	if (!desc)
+		return 1;
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
2.55.0.795.g602f6c329a-goog

