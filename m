Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD2C13DEAD0
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243985; cv=none; b=FGOKQUoPXm+yGjbk+zsRl9VPWr+gAayBUYAaxQlJR6QrCaGYk2XMBGyyXhdF3LJtSeCH4Ie93JPWLS11sLx/sDU1b6Ttd9DTjVjXjXbouhi7pHvBfTDAVNjwmXZi2n79fvweJU+GJVfdDWNzCTgF3TXL1o9W6z6e2Q+grWcv8Aw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243985; c=relaxed/simple;
	bh=I4pKmmwjevq8dz1UuOr+v5418ApVsdlP3YsqqByAvRM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KuT7o73GxKCjI/lwSC6UVYwdRaOfwk6FEsz7tkSvcZuEggk4O7H1Zi9eaQCZfgms2VfRXBX+RwrYamvRcRKJrWwZtXxzaOUfo9zGp61Z9QGHB3cKAZDciu6TRNA0v1Crh0hXP+gCN/sF4ELzQ6L5iaN2b+1bP35+33k03j3Xcd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=F74/hkw7; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F74/hkw7"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-393800f638bso15359361fa.1
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243972; x=1778848772; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rD2aCPCHqZRuH2DBiEm63Gtf8tVlRjph1PzHrc+ZXrk=;
        b=F74/hkw7L9aT6PqhEOjbem468QEhAfeUi4FF4oQ5umxxkIGEMV/NnrJ7wZsd8tBRTn
         E9qevpRcPY/PAQFLrgcQ7snV0j43FZSWF1CETxVrGnXGguDHzBVBUc09pJ01ztR3v9jJ
         520mClXgMOVV65vinafxPbszCWo5caaTUEfnC7ZT27nApuv5JLuZ1fGz1kI0FB9+GFZC
         XlWcXd8JYMNsW/5mITdYoIBu/b+dhcUihc/iGAHu2anxrW48q+b/Ud1XNoXr1xF4CRp+
         TeZ6G3S+2JC8NVd1WvZ3TCqbOR8YjBjs2MCPkrQz9bo+fzbMBsWM+eG8o8uqkYUQZgdX
         fnig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243972; x=1778848772;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rD2aCPCHqZRuH2DBiEm63Gtf8tVlRjph1PzHrc+ZXrk=;
        b=XRN8LpQO9s7nsXmgVxlmyWIAFMEqOxDw2GrGPmrKRx1esOaXrenhnv/Ps6gzhVGzFc
         i73J16n+AQ9nk/PADtSET0L78B2RTBd7kF9YrELPik8OPO3pe5+ld+ABGSruJoFmgn9O
         S8+RWL51y59A6qb439XdC+WpuHUB8snRFbP6zo2E3f0KSjiPtofVez9rx9hyL0YaHIAh
         8PtP4Bx8rE0LlJYII6s5ODBRFKEjnrIr/2PGb6oBxvy3kFdB25amIUYlUSFJbS3B9iJv
         10aC5ErFpa7Jfxd4Oc8zkAnY7roEHgd6BiuhNi1M+EBUlSTygr74GplwJrcTwnqSHPCD
         YgoA==
X-Forwarded-Encrypted: i=1; AFNElJ+eC0kXCzFPIuocYl+H7LJPVi1nqev8sqaZahel0OeuI5D7+mry9rhVAZLb+5tuFrDe6/9Ib12FEKZ8/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YxFAWIVGE0E+OmdqfT/1UZedzDgfVDZNmtNdhk+0nH1K5vCO/w7
	p29wXuAdeglP0T6s3Vw7KTDclliMSnpP1XC//lVSfOkEew+kdqHDp2Fr495TFgDOY2Y=
X-Gm-Gg: Acq92OE8UDSyabFKDs0AB9e66Yn1/ZBpnx9sfG2VPa1nyB7Di++E5qgALMG/1bLop0n
	l1EC+y5UT3jtPXjzU15v1+3s2s9gxCTyGWhPs57MbVCsXqMx8ATPjiJzuhvpA01he5aPaeCFPfG
	iic8KnRBP49hwJTT4GGHJhju4jA4ZKjn1wGKb0NDuP5v80cAsBEvq0ja4lCUY1BFaOFQIFlNlbA
	jApD8JYfPuVUgL/JAPtRhUvYDNnMTJQMbPuEyTLxLfpHdONQgvk9CjfABLUtSsOmpfy+fBNZYgZ
	0mkaqc7UpsH7CHRcrR6TaUPJzKGEaSFYVVzFAw48+1X/7kJEyyFlMAeMkB412ovOFg7Ij7ZsEJC
	WAbrxkjx3fhVFirp/Mc/M9ONR7+mm7Whwcnp4kOdJ2CCTkNBe4UPHoOzr2UbIPFh7Sxj4i7tr1m
	WRMeobdLZb6ECn+atHy23Ceb/RLFZI4YtVGYMYQZgUOyH3VDZXYapiQhAIcovcu8NGwEcOIMNp
X-Received: by 2002:a2e:9783:0:b0:393:903c:225b with SMTP id 38308e7fff4ca-393c4338719mr34887901fa.31.1778243971807;
        Fri, 08 May 2026 05:39:31 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:31 -0700 (PDT)
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
Subject: [PATCH v3 11/13] pmdomain: renesas: rmobile-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri,  8 May 2026 14:39:00 +0200
Message-ID: <20260508123910.114273-12-ulf.hansson@linaro.org>
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

Rmobile-sysc is not a onecell provider and didn't really needed
the GENPD_FLAG_NO_STAY_ON flag in the first place. Let's drop it.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/renesas/rmobile-sysc.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/pmdomain/renesas/rmobile-sysc.c b/drivers/pmdomain/renesas/rmobile-sysc.c
index 93103ff33d6e..e36f5d763c91 100644
--- a/drivers/pmdomain/renesas/rmobile-sysc.c
+++ b/drivers/pmdomain/renesas/rmobile-sysc.c
@@ -100,8 +100,7 @@ static void rmobile_init_pm_domain(struct rmobile_pm_domain *rmobile_pd)
 	struct generic_pm_domain *genpd = &rmobile_pd->genpd;
 	struct dev_power_governor *gov = rmobile_pd->gov;
 
-	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP |
-		GENPD_FLAG_NO_STAY_ON;
+	genpd->flags |= GENPD_FLAG_PM_CLK | GENPD_FLAG_ACTIVE_WAKEUP;
 	genpd->attach_dev = cpg_mstp_attach_dev;
 	genpd->detach_dev = cpg_mstp_detach_dev;
 
-- 
2.43.0

