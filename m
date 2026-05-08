Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69AEF3DFC68
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243967; cv=none; b=R8tR1fMG+g40IEoYpC6m2FW4MeBq9WC0ubLL925jo/7FG/uY1PgDjjcTaM3s+pv4n5r662UqgWFnx/BOs2ONUcQFbpzdhroP61I2rcoMq5upbgIz5jPoDUWuyigJpJTWKaVcR7Wi3UVh2Mtf69d1dETbY0nX4ZcrKi4ERqFlmrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243967; c=relaxed/simple;
	bh=x21rpCj2MmWyH5v65OaxPiuzKvSW4AaipSpIKhwJrLQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lY29OgxXfnWkm1c1hMiSSIzWM2CUr331YU/OAwjf78SQG64Zg0yUTZE+UE4tFLEBeN/5h8kU/58Hhwl4MNOu+3RJtvZLKhk6x11ShgmFbIIt/CchW5jMGt54mWTU6+xwzapCjzYeVc7qRJkdaMsyvXUBTAnWjQQo/uXNdpYh000=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=hEICFHFI; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="hEICFHFI"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38e8292423fso14213421fa.0
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243962; x=1778848762; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/rFfqTD2TBGaZTLksk3KUxZXH9uYFCtiZXBW3shTh70=;
        b=hEICFHFIlp6hm6PjBNscBFDdEHXn/HrJUmNCPebJgmKVFJLDz6wTOGaQkytzzFZBck
         EwWa1X450IdaIY1XF8avPT9D8IWvXYWy/d+90DqKQx8FdGQuYzayNqdsIDzydVt/P7ao
         FBWTa1u1mcUFeg+c4PHkISsidRAqfVOO8SD3a1/jolmN3KcxWTCRddqfWfl0ltyB4LSV
         OxQ0LqpOTeS/sbpd3f/nLXydC8vZXgPPzFLMvlmQntp47zlCQb4RSCje4Q9eJppVOw2M
         I7N2JH4HW3yjY7EKpNO/QQjDFNbCTYnbgaSZaYvIZm/Eydzd7Lj48ADE26k+AT413mgs
         6KSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243962; x=1778848762;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/rFfqTD2TBGaZTLksk3KUxZXH9uYFCtiZXBW3shTh70=;
        b=drAnrYhYI5ino77sMoH7qP0Yf4ig/cSYBeDGxxgn9lBoNfGi+kx1rSzApMMl1nZd6z
         w+1OYs0/E0OOq2gTt/bFTkXSHBSQasCmz3L/2gwzPiIAIh8gLK/gini5Zi0EeDtH+jea
         /iY8I4giTgoRmNOlv6DUFae0U5/76U9MiaYQ9xdlxPR32SEul09lXElOOyZ3Swc4uR22
         ejGzXZVBuyXaHjyGBlqv+8xLruMqRJrj3kT0Vukz5JtWuujXahYOEBaUYb3g13MJatOy
         YDo5MDpUJNkZBL646hLdh91bULawknVXuo3+54CKhVA2EBWuHBVpLej4gs9Z3eW2GWqP
         XtrQ==
X-Forwarded-Encrypted: i=1; AFNElJ8iKIYl5hv8fWqkka013zPYuFgGm3D8Md3UAqzqqN7o18+ucuvjG7wJPnVQhUDPT3VAeET3QBizIQjs4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2vej7dNLqa5K5hFNP0LbVjulZfVDgi4BySwbV96FP7Zfdql8s
	WuVzQjl/DLL3uWulzgSoOWqwDFLfUEUBTyowe4OHK7N5FIG1+cNO1hzsDb5Vaqb3cys=
X-Gm-Gg: Acq92OEYfMVd6qIVkuWuBoDrfNshn1IYvUjAAp3w+S05aZMuII0PmK2+7VZ2f2pm18P
	O7hEi5R85K1H2Tzw8oYYdgiDB7eybPynm8jYtma2vHNjmoWGT6ag4tVvJUKLBEyHjhL52Chrqq7
	z83c3hNH1n4AqY+1HM/b9BCAIggT78BSReXopUiOdsdt47LOLCqsgkfY0Kn1GQ4Esy75uifaLmT
	m9sZWrWuqtQJe8t3wS30yWqIAurYpCqQEkqsX46rgydeOMvP960i127eaOLBIYc6ryzQDXqxwL9
	dySm8sEWFWOen8apKL5FUv7nYbdgAiWPZAkXKELUnFqCBFqgtTHAfkGSuOgQ2rSMdhuBTz6txYy
	7aiG6QfzdrQeTd5nVyNDlgelMD4ydSIjvybrPMh20U1FH5HesL5UH1mpnvMuEerH0BNIkKop1G5
	cgDp+/ESFkdyxKW/K0obcLYUZ9EOagfd9fl8fomjYV/HE8uaEVuyTlbvBm1ZCfBPwIaPjJRto4
X-Received: by 2002:a05:651c:318:b0:38c:6b42:3d77 with SMTP id 38308e7fff4ca-393c40ccf92mr30580291fa.2.1778243962364;
        Fri, 08 May 2026 05:39:22 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:22 -0700 (PDT)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Sudeep Holla <sudeep.holla@kernel.org>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Bjorn Andersson <andersson@kernel.org>,
	Abel Vesa <abel.vesa@oss.qualcomm.com>,
	Peng Fan <peng.fan@oss.nxp.com>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	Maulik Shah <maulik.shah@oss.qualcomm.com>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Thierry Reding <thierry.reding@gmail.com>,
	Jonathan Hunter <jonathanh@nvidia.com>,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v3 04/13] driver core: Add dev_set_drv_queue_sync_state()
Date: Fri,  8 May 2026 14:38:53 +0200
Message-ID: <20260508123910.114273-5-ulf.hansson@linaro.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260508123910.114273-1-ulf.hansson@linaro.org>
References: <20260508123910.114273-1-ulf.hansson@linaro.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Similar to the dev_set_drv_sync_state() helper, let's add another one to
allow subsystem level code to set the ->queue_sync_state() callback for a
driver that has not already set it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- Added documentation.

---
 include/linux/device.h | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 209feea8050e..e32f85e8d80c 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1097,6 +1097,26 @@ static inline int dev_set_drv_sync_state(struct device *dev,
 	return 0;
 }
 
+/**
+ * dev_set_drv_sync_state - Assign the ->queue_sync_state callback for a device.
+ * @dev: The device.
+ * @fn: The callback.
+ *
+ * This function dynamically tries to assign the driver's ->queue_sync_state()
+ * callback for the corresponding @dev.
+ */
+static inline int dev_set_drv_queue_sync_state(struct device *dev,
+					       void (*fn)(struct device *dev))
+{
+	if (!dev || !dev->driver)
+		return 0;
+	if (dev->driver->queue_sync_state && dev->driver->queue_sync_state != fn)
+		return -EBUSY;
+	if (!dev->driver->queue_sync_state)
+		dev->driver->queue_sync_state = fn;
+	return 0;
+}
+
 static inline void dev_set_removable(struct device *dev,
 				     enum device_removable removable)
 {
-- 
2.43.0

