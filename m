Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065873DDDB0
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243972; cv=none; b=UuFyUTksdIrT36rAXCRowG7LU5lhyQfY7TTml7Sub9cAcMxp8+pT0DsD0B73pxvfTvayvBQQ/pmslYK9s8k8WvVYBpKMcPo81GjrlUnt03hDOWf+OJp8IzGEaeqp0ebh5p6v9Wb+mwc6NJSX9C88Y4YaKYYI7R/LgbAbbeodE1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243972; c=relaxed/simple;
	bh=7gIAiqk0uBq/8qs3H4g0U1Z7c+Lxfh/MrGyhojYR0fg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UCtEfmj0A2W7+PqqEGze7jhGjSdSS5HUouQT5T92bbvYRvgHlJM9+nEftLByLRBTolyPVQ6G4O8DitadpnodrgbaCk6Sg5ALqnXFEFpWVrD7QVq2m8/xuRf1EVhKx867aUlRCo6l3lLroxKiWy8Kt7SYxZdMoNepwSNsDe3pcw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=vrlvn7wT; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="vrlvn7wT"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-39394e1e8f3so14958681fa.1
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243966; x=1778848766; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JFYMD9J9S/4UjhCI/3FhGblWRPgd4BSU/A4adAW4pr8=;
        b=vrlvn7wTTWT5kB4aARm8X31WccDZg8R+ZkW8frqc8IALJWuvw97SfHQ3Dyv7Nt1OJ1
         xVlQh0nL94/Bq5KswsFVF1jmhPdCMh8F+X7nRmqSgAQb8qpFpFf7ilRsObQBzu6q/h/4
         6y4CnCpgstdCNWCxopesoROUCmrHjOQOLDGl261NHTiggyH8J/ELURijXKTNUIZYtxz/
         ZVIzCwSOeVBuK5PLzwMhIKrig6g8D6ZlIXsJnktbRUT09YQYnEFx5fEs+8lvv3OSfwEi
         aFGAp1OqnMeyjHLyVHJxao+uosnyWeBOcMpibSM8FmEMkz6g3qdngzVScsk0glgKj/OO
         RvOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243966; x=1778848766;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=JFYMD9J9S/4UjhCI/3FhGblWRPgd4BSU/A4adAW4pr8=;
        b=XY8FTey55FN2OmtTqezGqI2vQClgOM0dX65FhWXdG1OmnfepGx4rU8FZ6xiPcznzOO
         42gCQ5TWXfjz1jUpYeAd3LTCU8siKbJkXRt2BPs10RbTx2/7nEZCrQWSWJhYNc0VZCZt
         EmdYxaB/bqTkm7CC+qVruYnJBdeECMTlge4zwRuYj2KFLTxXVU4SMo5kA93RcXcDZsDJ
         ynNbLn9BoXFoBI7jGvgm6MunURPVrz80J5a3Ooqth+BVaLHNRdiRa4jYCcpg64MRyVD/
         8yoVYrjka0Cqf3AbUukGDmi+1gcBhNoqcyp+1DIqVAOSkimCsRVvJ2ZNRTzSOvj1n992
         DJYQ==
X-Forwarded-Encrypted: i=1; AFNElJ/unr6A/ZwCPiyuX2aQ1noFxKrG924P3n8avaSSdSqOfSlqbFK2rdn/yK45Iz2t5L582IyPydo5jD2O5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwnBKa7RYrmmt228VzeCeOAeKLvSOOM5Wncf2hUa3GcRSDP1xkP
	ZCOKqFNtmGK9ANt2WWdjalpAph1GLWQYgYUmaij24aLkMp6yMZ635jGBauf79dvXUXk=
X-Gm-Gg: Acq92OE2N1IeORzf6BJTE6/X8NPdVJFGQNG/lJ21lZ7+hJ/JLuJuNdS3ECGP5bIxs4S
	bPQfZqVya6+1ZptsGd4pFjIgtJe5xLKzUk89UyxZQqo6gC1jOTwsdjuBlHgNwPMeTrvux3tt9B1
	gw/SwrBaGmtv8nAKkabaVBOviwDH6RJFPlEpYOtvHEk9P2+JzAzXBdEwCa9IcDLiboH4QaTnBnF
	GNpeyXWDCXlp+c2JYTU11frX6wJrs5sMw/6ObL04iMfXmq9SsJiU1r/QNyBAq3WLrES3JL0nxoL
	DBQE4t3w/95YeROvK+cGGCyvgADs0kfCVtnFvc47Qe9+Oq19nfAvGmfG5lOLfbCfJf9XAB3oudw
	tZHk/WN8gAZPGCK6ra0b2M8TmeE7w6bGujsZyzZMMTTln1Q3rRNOMD8nAqusOQ9uzjH2A95Gab4
	kZlffBm9e3ZrjvqVCYdnWlFiaOBMMyg1/8Q4Q1cqbzSpooCN63FULSkupK4obquewXD8HT03V3
X-Received: by 2002:a2e:b1c4:0:b0:391:a48:a4a2 with SMTP id 38308e7fff4ca-393c41368a5mr39654801fa.10.1778243966200;
        Fri, 08 May 2026 05:39:26 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:25 -0700 (PDT)
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
Subject: [PATCH v3 07/13] pmdomain: core: Extend fine grained sync_state to more onecell providers
Date: Fri,  8 May 2026 14:38:56 +0200
Message-ID: <20260508123910.114273-8-ulf.hansson@linaro.org>
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

A onecell power domain provider driver that we can assign a common
->sync_state() callback for, should be able to benefit from the improved
fine grained sync_state support in genpd. Therefore, let's also assign the
->queue_sync_state() callback for these types of provider drivers.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/core.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index c01a9a96e5c2..b2b5cc30c7fc 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2917,10 +2917,12 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 
 	fwnode = of_fwnode_handle(np);
 	dev = get_dev_from_fwnode(fwnode);
-	if (!dev)
+	if (!dev) {
 		sync_state = true;
-	else
+	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
+		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+	}
 
 	put_device(dev);
 
-- 
2.43.0

