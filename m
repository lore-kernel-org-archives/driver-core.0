Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD473E022B
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243985; cv=none; b=rmHEwkXcSujNXmHOZLQyJmehFI3k8ii8KXQHPhISPpS8pc0yQ91U8XnDO2+TqUjqsHRzDHhtHfuQ0MhTQOIQ4piovwvNN213IELif0jQdaVI6Jar3+B9w0dZrpRcHCzl8gto9B9BCjdeyrwj7ZCYl6ZPYCCi8Bowa/Fv5GmE4P0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243985; c=relaxed/simple;
	bh=o6Kkmkal1dRnR/874ZnzDFZ9P4+SWzK1X1LngRUykqk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aVm0iC8ZVfJKXNhb4uH69RC5mC2pBxj61HCJLKYXALntKEwY6X76z3bLTnTNsTbNBT1CkcfcXvx98tE2Z7lDPPP8ArlhnrZKjwEHAJaIR2yO4XZBY1oHk89YNX/P5XiR4wP7ql+859q9EVNDVNn3VwACozE7yGX0q6B5GPmnblg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Ot5NlkNe; arc=none smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Ot5NlkNe"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so14959551fa.1
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243973; x=1778848773; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AkBPidrgCBcSCiVi3pEiCePtzlLJIduNWzbjBZQqIoo=;
        b=Ot5NlkNeARFEkdyCuEOfl4Q/SEWPH0SmwIzUGOqo+tHOxT3UIoNejzeuRRr4GLRJ91
         K4Sn8tHPIRRYQxQdfGSYbyCw1clmFhDM5CW6BW1frXTQ/4lGoPr1IdQdjQSWBScU0bsW
         DEfrO755TPzFKbuAfuHOg/YORq/yCs3RBdS9hqQePuD48dzY7/5ttPTzu1C41EMD0vCx
         UwGtOZ9yJNqESUdNvM7Tj1lnUSnI5uXFe4PmxConRydFrPgilzriTnJLeYPzA7usox78
         oup2JKnSyazEmQ5Cr0y36Z++FegMJm2VXum6cOa0Sh4c0wi8IURUAD3MEEQtSaTaje9C
         AACw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243973; x=1778848773;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AkBPidrgCBcSCiVi3pEiCePtzlLJIduNWzbjBZQqIoo=;
        b=cxlTpSyPajJnuyCyatt4LPogHnp5ejEnfNQlVI9p7o7LQ3iPs5P15WyDKDyJAO5HrJ
         ks2WDMvJhv0xPCrY+LROziw7pu4927juItOKubt19Fg8eWmCDW3ehItNAuBxEhs1Pzyf
         DrNYckWT3ZD/KyfzUuRSZ6ubkB6gbIvmXQpON1BBkPnD7u653lKwVO6d4JBrQPOOu/SG
         NNc9QCgMH879yfvDeY0IR90fSI0tcaaOWOWuLB7vhzdqthpqdbK8oQnw2/g7hA1ihrm2
         iXnFCYoBHkJNG7O4nnC+zFfDn5GMhzZTezpjpf3oc6LevYnYNPpynad4H/nk4Tz7ykwH
         7oyQ==
X-Forwarded-Encrypted: i=1; AFNElJ/SOHqJKCDioJSF6xzlBjzzjIpw6d9x0fzH8GpSosXs5I0l2Vbuzigpr95y414h0WUMDgahjp+YrwHZBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyeGHbs4JSg+yo42R3i0r/XkF7ikK/ZVKNPUh4xyWcIcxsnXlfZ
	hLyLld1QIXD6s3KtDU3OgjoZGQISFurN2vpVp6DE8Fy0b2wy0TSjEC/arCaRubmf7AI=
X-Gm-Gg: Acq92OGywLy3AF9c6jGaL0VNyzKrVqUbbTqnz/TP0QgAIUIEGlDcrrhYoTOHlgMDYD8
	nSoVkjxbLwFVa0KLPwU6TsRgXs3a0MoyJ1bcl7huCc9peOsUomMqDUzR08CUmMbbjY3Ml0FXWVA
	tJ2kgm0ndfuZL6C+UN2YXpFiojkXgEytMkrSJYGN1qkqRJ5Lay/mf/rz7Krfh9Ce5WNu0qRZQEr
	n3+l/KtuwUjdvwNo4HvOV8EzfY/gxbTVVmQ+KcD41AY+MUz76rXVrnIh6vEQ7sUq5or635fsMcU
	ogiI2ItLoJDIS8aZVNfidsQB4cod4p+0HdWEexBtKI4wNmBqgqvEBDuQajQonVhBoXEpJ7JYwwd
	FzEKkCZ0c/GS0jUGufJGa4LrLZh3+6ZTmhOLb9MKzk6zfE+IAUFq1jH0YQi3DjQXysjxk20kd46
	95l8bxiDhrssPZwcabW6VJBXNtpnbnNGEPuAYTvN7quTzy4wkigrVnnYLNcnEJK3Xeqn1xExFg
X-Received: by 2002:a2e:8952:0:b0:38e:98b0:3a7e with SMTP id 38308e7fff4ca-393c4211654mr36254101fa.22.1778243973092;
        Fri, 08 May 2026 05:39:33 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:32 -0700 (PDT)
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
Subject: [PATCH v3 12/13] pmdomain: core: Avoid an unnecessary power off at sync_state
Date: Fri,  8 May 2026 14:39:01 +0200
Message-ID: <20260508123910.114273-13-ulf.hansson@linaro.org>
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

If the PM domain was not powered on during initialization, genpd will not
prevent it from being powered off during boot. In these cases there is no
need to call genpd_power_off() at sync_state, hence let's avoid it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/core.c | 12 ++++++++----
 1 file changed, 8 insertions(+), 4 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b3ec3dec3f10..b5d90ddfd698 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -3636,8 +3636,10 @@ void of_genpd_sync_state(struct device_node *np)
 	list_for_each_entry(genpd, &gpd_list, gpd_list_node) {
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
-			genpd->stay_on = false;
-			genpd_power_off(genpd, false, 0);
+			if (genpd->stay_on) {
+				genpd->stay_on = false;
+				genpd_power_off(genpd, false, 0);
+			}
 			genpd_unlock(genpd);
 		}
 	}
@@ -3674,8 +3676,10 @@ static void genpd_provider_sync_state(struct device *dev)
 
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
-		genpd->stay_on = false;
-		genpd_power_off(genpd, false, 0);
+		if (genpd->stay_on) {
+			genpd->stay_on = false;
+			genpd_power_off(genpd, false, 0);
+		}
 		genpd_unlock(genpd);
 		break;
 
-- 
2.43.0

