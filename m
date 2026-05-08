Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F070A3DEFEA
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243966; cv=none; b=pjkmBgwAsOrYx9HybflxThMHqgMI53cu7HWLr8BiLsnmwsTz5CtmQQpEwc61VGvxyQzBX7eZ4OLd/YEqZUv4U84hf+IMAMfLkTD7CGuMI7lDMIcY5F2P0jKv6dXbY258l6W72Gc7b0MpW1nAAoqWiiPHUXz59LXoWEgwqTeln4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243966; c=relaxed/simple;
	bh=G5akryWM8vUlizcTYEH4n9P7Fe2yWjCrGils/cTwsKs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fXJF5BanPa/fJwYXC4l0aKFmZVwv6g63iZkMoaJVbyq91WIHCUBtHYEkK3AV3z3vzZi1663BBOiREaMQogh6JZNHi4U4R1SoC8eNZxux0XOO+yLsBRGqSk0o/gfMp1LLvm6krUzVzl236cI7GDFsEPAb0swQ31nhFy5Va+bhclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o2Z+4vNK; arc=none smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o2Z+4vNK"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-393da8f389bso17122181fa.1
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243961; x=1778848761; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqUco5wqhLucFlDbE4HzM7pJWTB6souJwvWVN2LvT1g=;
        b=o2Z+4vNKwAh3hZnwv9FttjQkEktGd4HZJ1N6qO6GxEDq1TdTF13fwepooT5kqas6rP
         Ddttpj5i52Bym9Z/XDi1SGa96K2eSahSSqWpDEbiemdNAsE1YZCgG4wnrcMsMgcc8p2C
         C78kiCycs+eceMbRFpv9FwGK21npU9nr+4etb/hARcNdc3rD77kMN1exbFg6tvHJFIqC
         eRMAyFoK9s01IZPiWq8QGoWEMsZycggqxb9VJwFIBjxcVa8zpUx8x+9sLjuuUAQhOFqA
         F8SdKR9iYsfVTJOky4vjQ494TfFNb/KodA2P/luHMdWlzWzwZvEbOayBi9hQimsqjGLy
         CwwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243961; x=1778848761;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EqUco5wqhLucFlDbE4HzM7pJWTB6souJwvWVN2LvT1g=;
        b=ieS49+nuYgOk/CuYDXRkF5ITIFB9AaBoMv+L4SvEBKvvIbiMyVvmBbcPa4nwf9Q/Ju
         1ncbPk1/brYz1q4iSGJ/8kvx0n8WIT+FHxlFceOiq01L/Y7lsl92h75bbBi2B8GDRftx
         YlrHv+szyUyy6Pqw0TFNqkFbsaGh/OtshOj6qHn1V6Va7hGiTpjqq5prZn73RydXhSt6
         zUy1Qe9F2Os94YxXkWb5b97FNu9eNtBT9LNLaHrffJRUkSH6QBsrjiqqvY6iRip9tiR2
         72kFV50prD0hAiDcqzI0+a87IIELJdlUuTL7mUFdI407x9Xi/eppE/GZ1o8ws+YT8j5L
         tF/w==
X-Forwarded-Encrypted: i=1; AFNElJ+aoBGJp2+oa5rp8otPXIwPF2y5gXF+htt1MfGFsb9t9x1aQDXn/AtMfkUgnJXVpN96OnFpJB4jM9r1og==@lists.linux.dev
X-Gm-Message-State: AOJu0YzJ7buuEbVy/Wj9tzegSOzqtz9WtC6FSLartOa0jpDk4wg7pYAW
	KH+tw3NpBSkVk/Xz+a3895XEDE5WTzVHC7NLQ4KW8Gp34jIqp9Vnc+5remiAORbig2U=
X-Gm-Gg: Acq92OFB4fIFWbHOTpnyPD11Jp0ZJFUV3laJjuy593iT+qyJjQMxG+DpvqqVaetRKh8
	wGABCUAYw1ZjxPlkYD0/ResHNGyzkU/DzQ3M9YSM977RrhTuMXWP36oWP5LV/1m8QiQSLoz4Z9P
	Rkj5EXW+uWPGBVnn2ksP9HRsih2uwqQXzuPkxJLYSWgfNuuWEIPKbTmZ3PlPKuxZ79QzVTJ/Awy
	ygq89oozeBMEki3QRsplvd8aPDxiowJVieie89Xxvvqs3U8QA9mNeD43GJJhGStdlJ46YVZFTOD
	2pqqbEM/NQd+lIqx6Y8guvNxay4uTrIoV6nsPjmiyOh6TXb6huZ42wiPP2LA9Y36yOmI54R+x2O
	wFX8ULK4UfVOKtLpUL/PIlKPNY0xADa2nLVkokMO602OrzdVtH8EEMcI3lxz/QIry+xjW97xuGA
	3DcdDW2S/Xl0iLMd6cmpD+KGjE2El7niW1FlrF22m327A7HUuyQqioYf5ur46k9ixT6NvPF/m5
X-Received: by 2002:a05:651c:4187:b0:393:d6dd:e8a1 with SMTP id 38308e7fff4ca-393d6ddee4cmr27954951fa.2.1778243961174;
        Fri, 08 May 2026 05:39:21 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:20 -0700 (PDT)
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
Subject: [PATCH v3 03/13] driver core: Add documentation for dev_set_drv_sync_state()
Date: Fri,  8 May 2026 14:38:52 +0200
Message-ID: <20260508123910.114273-4-ulf.hansson@linaro.org>
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

As dev_set_drv_sync_state() is an exported function, let's add some
documentation of it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 include/linux/device.h | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index 6848b0a2c2d9..209feea8050e 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1077,6 +1077,14 @@ static inline bool dev_has_sync_state(struct device *dev)
 	return false;
 }
 
+/**
+ * dev_set_drv_sync_state - Assign the ->sync_state callback for a device.
+ * @dev: The device.
+ * @fn: The callback.
+ *
+ * This function dynamically tries to assign the driver's ->sync_state()
+ * callback for the corresponding @dev.
+ */
 static inline int dev_set_drv_sync_state(struct device *dev,
 					 void (*fn)(struct device *dev))
 {
-- 
2.43.0

