Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62A7F3C109F
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:03:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076632; cv=none; b=Z9PT/KsGTfdCuNRFNdhL1tTD3ARPElE3glwjS7osKFYgMUYPi8rIPtyfzRKPycGj4h48xW70dPRiDpoe0PAgaKkR9qCiBS+J+9Au8pNjCapzUBvaOq7y8sO+q8qoRucYZD2/LN/eZT+Qn8Y0sG+iWBBY01DyVq9Yrswdxg6lLSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076632; c=relaxed/simple;
	bh=AzJgC/RVsjJ6k/SwatcooMrO5iTJhfE4K7EewIxT/yY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qQ+GQ1ixcV+zqe2sRMg4qI6gAdqY1m/7zGZ98HV2k6nMBXgOslyrI5+BHi7SMIofocNtDS6d/w+tyafbIIQKUSuLkKpm2QSqjTpjogXBHiwa97JkBF5O++1NHk6oWqK5Ju2w6iF46vbxJGEu34iBBHO+rg7zc1k/H0xTTVPENfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DvYNO9fL; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DvYNO9fL"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caed617615so628955ad.3
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:03:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076631; x=1783681431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PRSQjBy62puZgUQngLjPxg+AegEI44LbaTaSEWvc+ks=;
        b=DvYNO9fLJyGZ4WqO9c0Ow3PB44rDxyKehr893IH3se4dEN4/6hhDjewYZLm/JiZPFB
         buzCTstdnZxr64+41BAlwTN2TJrNoYRi9MHdEvz3RsS9VZZFswS9DuUXVEjAcaz5kNfI
         fm36qM/lJGzeEE0vXAY2oyuXg5o1gv6dRR/Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076631; x=1783681431;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PRSQjBy62puZgUQngLjPxg+AegEI44LbaTaSEWvc+ks=;
        b=ZsitFWaygtOJJ8BFVdZKEJoDReOQXCovbiRa1yyGMvVuN+9h4Fmt7Ro9USnn9wzA3m
         hXd+h5OypaXgUzxNlBbH3I9jiibJ1Gy8l5aoY8wlNRXFXaCweFJRJhXuPZleXVFGa03y
         Kb3wPvhVKrmBtN3PXkbp2Mu7vLnuF8lG9V9yYCXUMpiQcXPrSULZ1rcukkXQN6WODARr
         zaMh0xHR9ctA/4umYpP3LDMgZ/Wbui5su1dM4XsPqCidr3vjQJH8RAd7UMQJJXAWBfs/
         VJ8j0nFFHJEdt6tt5eWz1UwuWBTOJ0pSpOYpP+3tjTtI+80XS4KIsKJLdyO3CAmVPfee
         IleQ==
X-Forwarded-Encrypted: i=1; AHgh+RpdyGDyuqMYuvQkZIyM609clzy3l4AmjShL6fdgccKig0Vi46p2RUWAG/T8q526bL6Wjw4pxLS/TrTOvA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyknUJj2LNgSNUfZ9hKxtQX42uLsPRlno58p507SMaCOi0mKuss
	tE6wx33mCbMwLNg+sTqEDeOwHPM5M7eAUPxPdwzaH4QyLXV3B2/qenzbUnVe6WIGoQ==
X-Gm-Gg: AfdE7cmToBXJMHB4/iuuLpwhVapRUi/IQXeV5mGpknHqsTiND3BjEqKruQeqhSuOAWX
	329o5dKHInASEq+lm3cgvvm5ZfD1R40be8OM5sEpCO6t/pKNBrRcledF7D+pJ++ohmIjZx6WT5J
	Xva8hdk5N4SgA1t+mxQbKmHu8C3I/bRB8Iwot6AOn8sfl10uWSL6BunqRGKXnV/llgxyQFD6q3j
	+5B4ECVozSqQRE2fSJgzGO3HQe/Ev4FSnoTnEROcCBNegTyNYgRjZQPCdfvolsW8RsoRnCQ+si1
	3XIRgeexMpAPHI3uj2uGszg4ERY+tHGTFN5faa6aRa90tz3qEQso/f2TJPZzAJwHBTTCnXszOS/
	IGaU2UEBTfIqp+Gw/RrmkrmC4nDLebsIQiyU2RaoWDshVqwtNtIMayDGzsRw+aeWpd+LT67KWJ/
	IjB7dB7ujEtVb4OjClol8sMlj7BflBOvpz7LSRfhXFuje6kASRoTEG+UUAlJ6NkCGRSMND0Q==
X-Received: by 2002:a17:903:2383:b0:2c9:e261:95c4 with SMTP id d9443c01a7336-2ca7e8d9f8fmr111666555ad.30.1783076630618;
        Fri, 03 Jul 2026 04:03:50 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:49 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 03/13] power: sequencing: Add pwrseq_power_is_on()
Date: Fri,  3 Jul 2026 19:03:04 +0800
Message-ID: <20260703110317.1283411-4-wenst@chromium.org>
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

The power sequencing consumer API already does power on state tracking
internally. Expose the state to consumers through pwrseq_power_is_on()
so that they don't have to reimplement it locally.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- New patch

Needs to go in with "usb: hub: Power on connected M.2 E-key connectors"
as it is a build time dependency.
---
 drivers/power/sequencing/core.c | 18 ++++++++++++++++++
 include/linux/pwrseq/consumer.h |  1 +
 2 files changed, 19 insertions(+)

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
index 3c907c9e1885..5a5eaf85d5db 100644
--- a/include/linux/pwrseq/consumer.h
+++ b/include/linux/pwrseq/consumer.h
@@ -22,6 +22,7 @@ devm_pwrseq_get(struct device *dev, const char *target);
 
 int pwrseq_power_on(struct pwrseq_desc *desc);
 int pwrseq_power_off(struct pwrseq_desc *desc);
+int pwrseq_power_is_on(struct pwrseq_desc *desc);
 
 struct device *pwrseq_to_device(struct pwrseq_desc *desc);
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

