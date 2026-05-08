Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 758543E122B
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243975; cv=none; b=m/AxErhwaC/5J0hfhGQB+GWrC1u3UCiuT7oG1bSg1ft3+cqxsKVoz2+0IIeaAONjgyFdCLsYct3qicJSpeO1N3hG65SxVxnnNknF54Tqwyfsi/yCKWZtftPDwUYPuPyMiM7CvYEVpQLpYp9FMsErn2mHiad+Nl6DVvWnPRqkebw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243975; c=relaxed/simple;
	bh=BACNnnjiA/P+SfyeHJreij3aeGH3ANneoOpU/9hi9p8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=b+fq9SzicleT1ZZBK84ALQKLRIpT0F94at/j/8+6nvJZRr9gJ/6dVEMyEvhNwbFCarHxAZUHKFUfCwhL+owOKMGQq7Jg4DQYmo2vOATNUS/Sufh5AnXCSUqW0vKQ8hceuoJw7YyxeBk9xpomV0LZ93wHWBX78EnBbvgqhX9tzG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=cRbH/0Jr; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cRbH/0Jr"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-393d6025f99so18762171fa.0
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243969; x=1778848769; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Zspu33ABPqLoZeWdeeV9gEAyKbL26M627IVpZcNoBBI=;
        b=cRbH/0JrSeK1EgOhWLnH2uYXkNo2G2wKpUYad40R8exiZkbPowlTXrg5QrT2oPooQ8
         MlImfjxMDD98N7/REdIUOzkQNRvn95wGuMwvYYbdorIgssLNiKfEt/4S6tF2jmunwdm8
         KXS4wEOHDLDFr7S9eFhiiSUy73MVZVkmtjhW0A3KyctL7+o9k+RDgj7QC0Q0ddHeWXgp
         DIYLpE8YMcu4sOXLcnTbZZvWJLiXv+o9br3supRblDbyD0/mQLrQ/yesn/K6sAtk5hqC
         PU2DwJCcEWbl6E1DGQVf1gT8NpkjcdFP14QnfC4UqxeKIe0FCrSGku8EbKxUNiZOph94
         HMmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243969; x=1778848769;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Zspu33ABPqLoZeWdeeV9gEAyKbL26M627IVpZcNoBBI=;
        b=mNQj/4D243KYyA09HxHQWh8HDa/O+bcI0h9jPvLJ8ggRTRYlByxtC1FZu2/xTW1nfX
         FRZYBY/tT/scuohqrVwfzjJQ4a+KVIh308RXxKE+Gz4hYMbUuFw4mrPuthdhC5Dib0Ai
         OVs0dAkjWCPirw8SiSs1iz0C6fphm6wdFoHg6bu5kxTJf4fBNYR1VwQFh32//V69sFxe
         luffMM9o5O8na4EGk1sB+IrBQoQKMRgQclTLs3EC7fbYCVWRX5UW12y2UOKwY8Za9wkQ
         ss1v3KmfitOcVIFG7fSfHjmmHKJcqrgrABou9xM1i2gWN/NTjeS4jB9cGcn0yJzNDVxn
         irbw==
X-Forwarded-Encrypted: i=1; AFNElJ9wfbZhmQd6VliXk1wFqEs4rycKuVDiRFKkFsy5J/z/nxtK/IaKLbQBAeMOzQ2wRVBZWZYwovxSARGddQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzzZ7+Erp55rDrp/koH2HulqA6hThedQwbvP/yCsZWYCet8+Bzu
	eA/iOVFvAPWES7Jy6PESzji/wxnhq7DHogD1BoVhPDNRO2fFKrbpT+QhicblFqAo+BI=
X-Gm-Gg: Acq92OF+st2GusfELz8H+0drq+tisiEgwVn3fUEhk3ebYOpjD3WQrQWgQgGkERPIPCl
	nwESmWRiA6IXtbVBWqzrZq59zg2hZkfspsb1HQStjvURRhVdrCoEb7+Yn/PBG9AQc0Z4EfdmTee
	mizGuQ74XvOrUV0YIcpLtNYVc86MYhQ2z2FwYqrj13wvkL4z1NptqUNqUzraFthnBR8iuttVEHS
	sockdpepzH0fRLf/L/1HQD8jGi2gYmb5sCC6bOVxq2UFJ8JTSUsxlhTodWLVLv0n6uwGOtlu2RY
	Z+ZjltoBE22tQyyDTmciCGqFqfy8EzTW4BBlkYDztGP1mh/nioqAMvKcWhE6JWAtx/a+h9QSTpN
	hS4oXgasuUt7+d+c1h5F6OPShDQH9cHgzBh74mx5urOGL0+VDz1QUvTrcFjL2P7RoYLGylwc9nU
	tgPkJy0z1cgSnlXyGwYb8ky43XhdHJa2s2osE6shiKSQaH6suVxe57p6H99qau9p7MbZ++yG++
X-Received: by 2002:a2e:a804:0:b0:393:b138:34ac with SMTP id 38308e7fff4ca-393db0526d6mr20975861fa.10.1778243968630;
        Fri, 08 May 2026 05:39:28 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:28 -0700 (PDT)
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
Subject: [PATCH v3 09/13] pmdomain: renesas: rcar-gen4-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri,  8 May 2026 14:38:58 +0200
Message-ID: <20260508123910.114273-10-ulf.hansson@linaro.org>
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

Due to the new fine grained sync_state support for onecell genpd provider
drivers, we should no longer need use the legacy behaviour. Therefore,
let's drop GENPD_FLAG_NO_STAY_ON.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/renesas/rcar-gen4-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-gen4-sysc.c b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
index 0c6c639a91d0..81b154da725f 100644
--- a/drivers/pmdomain/renesas/rcar-gen4-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-gen4-sysc.c
@@ -251,7 +251,6 @@ static int __init rcar_gen4_sysc_pd_setup(struct rcar_gen4_sysc_pd *pd)
 		genpd->detach_dev = cpg_mssr_detach_dev;
 	}
 
-	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_gen4_sysc_pd_power_off;
 	genpd->power_on = rcar_gen4_sysc_pd_power_on;
 
-- 
2.43.0

