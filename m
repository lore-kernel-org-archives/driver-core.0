Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F4163E1215
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243975; cv=none; b=YgbFHKF+xQ3tR6mo+d7QXrG2DBc6QwHvi5rBpaJ2f4l2kPRdANXFFPAfCuFJjUxeiQ5qKIIWTi96LSmkmMMOMF5nl23HGRsXpF0uC8INmEoc2k/RRQBZEY34Ad/vsdcObnmUmH9v8f7wmUdGyrBLzPghp93hPSq/eF/LCFxxsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243975; c=relaxed/simple;
	bh=hwOvGP8Oty93OHqwiALydRwNTRVjRDprCgEXQyQeyAE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jpkDl+0TPykPvlyCgGkqmVFb7muwJ/pw6gK0f8Tz6Lq2iJr993u8bnDrI9QWBQkszVkLacTtG2lqj6G9ASR5UKYMPTmWvvyMYl8EX4MfuuVr/yZvvzpivYst+h2+vf0DEAgFne0tUJc9j0g6WNZJL+FvbSjfQcNJ4ULdfP/2AX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=o1aLvFvm; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="o1aLvFvm"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5a884ebba7dso1986983e87.0
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243971; x=1778848771; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OSIE7E4h7lWy1SBxFs356ugBkbZI4NVO2rqkoC6AUWs=;
        b=o1aLvFvmKHk2kjObLwnsBdozMBoT7PwqyJZodcZ1pYZMYw0klP9YGj4E3iFNwh/c9j
         69uicWzHKNkl7OCzw9eR4j1Jyl55znOLyp8zN+iGdaAA6VSlQtd/Gz21VAZM+rdJ6qxS
         KL9sCsSnpqrD1MikLCi/4cV4enAagQm3gl68BGYslvtRjj19UeaZ786qEZv68I5YSuQ6
         mjYsXoNkjaBsyEUW1L2FBaBbC2m7Wc3sr2K3Sjy3OCx/e6JFI3wDZ1Bac6qXsloL25YK
         E90e7ek6D/M9cY44c8YjgAu624Eo4L+8GgF7HAvpIw97cKQbJp5gP2sAjYT7cWLbvBI4
         WHNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243971; x=1778848771;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OSIE7E4h7lWy1SBxFs356ugBkbZI4NVO2rqkoC6AUWs=;
        b=Ki3m1Dr+g7XaltIdRezUu5fmdHQQnmsopH0djqOKbfugo3kE4UnPtcNyyE3vv3HOxK
         X8nb9iavdddeHIATYGI3QhUD1mWmRPqN/ErxMaUgn4BRn3vpItyOUkEUL9rQVo0T6rs2
         8pRfMD6TN/G0BWdQ069mXofWfwagt15c7PEyZEW2fp7xlHU+zLAuWBdzoOuiFrxZPlF7
         y+9Fhssi9L5cYqv0G8/ZUGaWhmow5Z0Z3If0lwhto5N+UqWeoC0Th+gZ0944qS53NFiE
         7xWVXBJq9Xg4SRGesiXPtAnoiTu/MTxvg2UlzTHSYM7dNt+eIbMN/i6AM48nbcjiC/BJ
         R9Aw==
X-Forwarded-Encrypted: i=1; AFNElJ9Nbt2705forMUcs8B0ZL+rJv6gPSCAJZSLmJep2TbsfA4vtRlMLlMJWNmRPATHX2JUjibGnrCPFsOJFg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuxGOefVK7uPbXYwCEK1j+wevzUZMsm13Ro/bKtE9rgSKmOXUZ
	5/C1IzPpwrp8u0evblIGGlkw0PriVWLfyfH/jaebBxX///NtW2/Opfp0mcsqKIHsSbc=
X-Gm-Gg: Acq92OG2WBtKUeejpe4ZDIDm5L8dB80XSISoLsRUa52FvQsRK7QcVKyip1AWxOmtPje
	//tSoMGpMeFRQYIXWrCkl6NNMH9VhhBAYoPO8oEXn/q3X+TC5NGq7p+RjC5ZoXseNfxAloIhAA0
	Dk1iOCzzYABTXa9/f/CI4p2LE0hYmvOph9ZnlIdEi8zQ/zFq0jHv+s2dolENeM5BEoO9De1vkLx
	onlhQxFEIhWi1mUYwRz6MEqiQ7vyzn4fFUspMfB1yUhukBX0UcChKe7TR2/ilI7g5mx0RYYyAhL
	kSlEuCxscWdJ19p82Ydq/7agCRq3OiU4BqUuW3gOL74DQuvffw8PHivzrDm7nWeWVUK4wgGZ0rf
	ZYwkB23rsqmB4G1yAuEXsgvOmHSc4eYcWiOwBTHlkSPxg0dc1nCij597XNA7Pzkle3O8mdHe/Fc
	91GaVU/Nkjp5FR9zyeGrPqMnvh1bXnO5TMp4LgYsoGP2Qy5KPSqLY95g8hAyAXkyfIOoLh63/j
X-Received: by 2002:a05:6512:3d03:b0:5a8:99bd:12dd with SMTP id 2adb3069b0e04-5a899bd13aamr2719864e87.31.1778243970587;
        Fri, 08 May 2026 05:39:30 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:30 -0700 (PDT)
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
Subject: [PATCH v3 10/13] pmdomain: renesas: rcar-sysc: Drop GENPD_FLAG_NO_STAY_ON
Date: Fri,  8 May 2026 14:38:59 +0200
Message-ID: <20260508123910.114273-11-ulf.hansson@linaro.org>
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
 drivers/pmdomain/renesas/rcar-sysc.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/pmdomain/renesas/rcar-sysc.c b/drivers/pmdomain/renesas/rcar-sysc.c
index bd7bb9cbd9da..e4608c657629 100644
--- a/drivers/pmdomain/renesas/rcar-sysc.c
+++ b/drivers/pmdomain/renesas/rcar-sysc.c
@@ -241,7 +241,6 @@ static int __init rcar_sysc_pd_setup(struct rcar_sysc_pd *pd)
 		}
 	}
 
-	genpd->flags |= GENPD_FLAG_NO_STAY_ON;
 	genpd->power_off = rcar_sysc_pd_power_off;
 	genpd->power_on = rcar_sysc_pd_power_on;
 
-- 
2.43.0

