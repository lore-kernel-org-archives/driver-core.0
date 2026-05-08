Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE3CE3DF00E
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243974; cv=none; b=SGCxCUzUVMVU5VcX1uGYaQAOFgLymvqxtp/4NYuv7inuYH2QRy3CPHiUyjFIJJYlm3S5IcI6/twF+j8wQjFF63ULkv21dqwnyYKrwqqxw7lhxhwfwPkzLTGJgpAqEXirGkAnME2H5xc2kS30OROUnI09xBAS39kdZftyIsHsH6Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243974; c=relaxed/simple;
	bh=Xs/HtiPO1xtJDcZVerZ8/69q45pZoH9BAsnH8Q37rk0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rwQoazoEEAhiX9xGDRgv0V2Wa+hyOtJA06vTNRHSrGaYuv2PS2GBxeLli9t5x0XNFHC4DbAc3QFJxNZCvF8abIa7UWxVrcbODfhUiC17WknF4tkzpmZKIy35v3e6xi6Omam2t8ycD0TJryEl/k1TLm3jGym9nm+E3E1hmttc6sM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ez0gPw6R; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ez0gPw6R"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5a85b30dd54so2092580e87.2
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243964; x=1778848764; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9n9228Bd6H5JKp1KPGvBUKX9yk7WrbeWnXK2gI0yqVU=;
        b=Ez0gPw6Rme9AtVaRQiKxn8/mMCm60fymnvwFzwR9xyzolrX2130ezoOKWUTCiy9Gw0
         /7iOPmP8tX/kpJhaoCl0CLNpGvsbsFHYiNGOSmH6HxPUGU0e04jUqY+SZP84HdDbBpGr
         vXQh/DWnkMHx+Du5uoT8aUQ+uq3SVmvaaglraedMa9877EmmZijGPDCg9uPU3vO8ZiGF
         WU96S7SEmxVgy/UL1EKxFKa9fstYBpEQd+e3wABZ6vEi95h11DK16kA8u7IoKb5uNW6Y
         6WVSzlvcWfFR1txxCfTtdFhF15W8jVh/UMBND0vJfR2yHB/H2XzpMu/xsSrpQd+2A4qm
         gZAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243964; x=1778848764;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9n9228Bd6H5JKp1KPGvBUKX9yk7WrbeWnXK2gI0yqVU=;
        b=m0MMca726wavvk0BbF3/mNkeoqDvIxxyaWxWCc9yZzNWQw3WRKLkTP19FRvOFpFSRB
         MxV1hbz6TuzXiNKGhoqnD5zRZ6Sn9fo5VN5hwG7oHpJ/+Dn6EWZLmhyENyOVoy5s/vSw
         /0b9SOSIv55H7t8Uzs4Ogsh1ADjILCi756gBYq+YFr8L2pe1Az80s902qRMW0ReaV8ob
         9vfRxmOm3sIpRc01hs2uv/Pprg6U78EsJo/EuTD44NykTuNbTSZwobWOdbl9eGksMqr9
         wrspVJN8KoNS7Ioy4cGmt7btsRMyfilb1ha5ULdw22OHiK5oHaS/NcM12P0tw7j0XZ5d
         bQEA==
X-Forwarded-Encrypted: i=1; AFNElJ+cOA9G7/LX1B+ufAM7GcIr5QU5QXQjk8IGd83GjZxx28sPe7kN0Y51RyiSJt74HddZo8K+c7WOC5bhZQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzZ5BswP+6o5TP1RcU4IAH+8bGwbNiAJojciUAucWiFqXkGCw4Y
	+mE78n01RkY7m2qldawcSpppqp6eGbQmydpMMZ3v21XKYQU+OVWi5TNH2ZbkyMhz9WU=
X-Gm-Gg: Acq92OH8/zHOTXFOeMus6yp6pn4jjfpeQBxWs50e2ERhoUIjAtQkHdD4bgLft5icdVI
	Z7eBycmuUWTQ4Bav8cR7ag/ugaSTlwqP6sGFyhUxrWyFoBciw4+OfyFzuoaMAmSYspGLa9TS1Hi
	7LpQmoJ0D7AiNlvtiNoZRP8vbcDyn3Qq5jCSgEYBTuMvNrj7/ElA7B/AdMb96z6c07QiHumSpQq
	DfuxwgSd6QHbIY18cmGhwZdw30BXCPaHm1kjLbU0lOoN49ytvzehnrXQ73Zppy0eNxD4yUvrrhy
	bg40+BGlLnNCjK12EMP62FFgg0E6/sfvV0Dbvnh/rDxW0tGdbWSCa7BZd/YdScppcmNaEmKOvol
	P2upaGWWShxg4eyj/l34V0NUcjTJ5X42DO7LZWu0D7Yu6jCQ1xvlTh7G2sr7zRwJvCXvxzPR2Ei
	QELQHppQAFJJlQ28eikcdNYoBxzst2sV6ek5p60WjhEFxxhYpZD2fXZA3sIByMgNYnlB9ShKpuM
	5L2UfwQy8c=
X-Received: by 2002:a05:6512:15a3:b0:5a8:837b:3d80 with SMTP id 2adb3069b0e04-5a887cde91fmr4509411e87.22.1778243963646;
        Fri, 08 May 2026 05:39:23 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:23 -0700 (PDT)
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
	linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [PATCH v3 05/13] pmdomain: core: Move genpd_get_from_provider()
Date: Fri,  8 May 2026 14:38:54 +0200
Message-ID: <20260508123910.114273-6-ulf.hansson@linaro.org>
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

To prepare for subsequent changes and to avoid an unnecessary function
declaration, let's move genpd_get_from_provider() a bit earlier in the
code.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No change.

---
 drivers/pmdomain/core.c | 70 ++++++++++++++++++++---------------------
 1 file changed, 35 insertions(+), 35 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index 4d32fc676aaf..ad57846f02a3 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2664,6 +2664,41 @@ static bool genpd_present(const struct generic_pm_domain *genpd)
 	return ret;
 }
 
+/**
+ * genpd_get_from_provider() - Look-up PM domain
+ * @genpdspec: OF phandle args to use for look-up
+ *
+ * Looks for a PM domain provider under the node specified by @genpdspec and if
+ * found, uses xlate function of the provider to map phandle args to a PM
+ * domain.
+ *
+ * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
+ * on failure.
+ */
+static struct generic_pm_domain *genpd_get_from_provider(
+					const struct of_phandle_args *genpdspec)
+{
+	struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
+	struct of_genpd_provider *provider;
+
+	if (!genpdspec)
+		return ERR_PTR(-EINVAL);
+
+	mutex_lock(&of_genpd_mutex);
+
+	/* Check if we have such a provider in our array */
+	list_for_each_entry(provider, &of_genpd_providers, link) {
+		if (provider->node == genpdspec->np)
+			genpd = provider->xlate(genpdspec, provider->data);
+		if (!IS_ERR(genpd))
+			break;
+	}
+
+	mutex_unlock(&of_genpd_mutex);
+
+	return genpd;
+}
+
 static void genpd_sync_state(struct device *dev)
 {
 	return of_genpd_sync_state(dev->of_node);
@@ -2889,41 +2924,6 @@ void of_genpd_del_provider(struct device_node *np)
 }
 EXPORT_SYMBOL_GPL(of_genpd_del_provider);
 
-/**
- * genpd_get_from_provider() - Look-up PM domain
- * @genpdspec: OF phandle args to use for look-up
- *
- * Looks for a PM domain provider under the node specified by @genpdspec and if
- * found, uses xlate function of the provider to map phandle args to a PM
- * domain.
- *
- * Returns a valid pointer to struct generic_pm_domain on success or ERR_PTR()
- * on failure.
- */
-static struct generic_pm_domain *genpd_get_from_provider(
-					const struct of_phandle_args *genpdspec)
-{
-	struct generic_pm_domain *genpd = ERR_PTR(-ENOENT);
-	struct of_genpd_provider *provider;
-
-	if (!genpdspec)
-		return ERR_PTR(-EINVAL);
-
-	mutex_lock(&of_genpd_mutex);
-
-	/* Check if we have such a provider in our array */
-	list_for_each_entry(provider, &of_genpd_providers, link) {
-		if (provider->node == genpdspec->np)
-			genpd = provider->xlate(genpdspec, provider->data);
-		if (!IS_ERR(genpd))
-			break;
-	}
-
-	mutex_unlock(&of_genpd_mutex);
-
-	return genpd;
-}
-
 /**
  * of_genpd_add_device() - Add a device to an I/O PM domain
  * @genpdspec: OF phandle args to use for look-up PM domain
-- 
2.43.0

