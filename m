Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EC303DCDB8
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243962; cv=none; b=RvuFrmjUrbQhD4VhrvQkXiNrl9Motp+PwnJS5Yj79FgBTfyKtEusnwhNGSNzLMbb2m7Ke/uuRVmhpzadgqQNpDZKtEXS+oCxsaaikuMs6DAbyNuUPageMT8TTPFrrxMqjDFuXG/XfLlEP90ZUgeLJl32ESaqu6cBimZ57+hGh/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243962; c=relaxed/simple;
	bh=/FNkLhSYKy6TJa1EV5G4UhF+wEANeDUJfI9WWCNYAYk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YXK0UUMD8PAojBBaa/Aj4N43X0dlwBIojoiVbXVjWzIRm/wAUcPVTG58Gin0mONcvVX/PG6rIKiyGuxKpoVU7462wIhhhczavf/rP30zSdzocGEJ+fZ6z1iHX7SH94TU9UkppJt/cZMiSL30+XRmxBKTZGxsvgd+mV4C6Z6qGUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=D0NgJ29B; arc=none smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="D0NgJ29B"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-393d07e8938so18074991fa.2
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243959; x=1778848759; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hZZm1gLHrIJZUIiM9XL9gym+JUwXXpMXWNiMLD+uRZ4=;
        b=D0NgJ29B3a9V+dD9oj0mU4pXg/uTAiWfGepNtVk1kuA9Ul/OKxeoeiu6ZsH5RBz2Dq
         y9cU3JcDYJEXlNEHxYoE6aETPKCUFNYJ5pTrX4wu9dG/S66rhrHBSTpVD4lLkzPF88e/
         nfiNJH9r0mgzJepRAEW7/rfV4WURctlGbTzBd0uTBPCgp1F/6rAjc7p0/2XyFo0C7Jcq
         3E/0ExILP/MrFIPaMsKbwzodV1ra4vKl9CTQTcMRH924zZtDOXlKrJwGK/cFuQve5HNc
         Os/wp2UfLJzgRwmm0QB7wAknDqcAl9yNDQW1cbgs5DKv0kyd4MYcCFDcpBLBfhy+M+27
         BB7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243959; x=1778848759;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hZZm1gLHrIJZUIiM9XL9gym+JUwXXpMXWNiMLD+uRZ4=;
        b=j9UppU41BTC1yurW+DNJbJA0q1pA+eFXf0BmteREpPJuV3zGW5qObQ/FwTUWcwv3GK
         S5mzWaat58qJLRISHDgDa5g8suiI1w6UXw61aKMfyR/tgXPl53lbr1DTh6JyLV8tGsJm
         6GzO/bcSWe1R1Ndtz0VZBy/S/0DniFo1sIeQuZdXtlVAl6bhoeG/GMG11ibk2k/lsg21
         sasr3oe0aefwLCK1+q3C03wNxZuTbU8yPik7AEzPpVmrv6ng32egkIdqtebrgl/8/FsI
         plqmn5KirGvl0OuQcIpoUAUzLi+0Cq3QqS5n50kCuP5/U+T8SREHA5OHIpoqbfGVVAsC
         wtKA==
X-Forwarded-Encrypted: i=1; AFNElJ98BkbD6qIhyVhbo7ChP/G22kYGPoEvq0UA6j0YlE8GIlN7EZUQ2B0/NmmX26oIt+eXF/Y15ZmEf0aoZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxerxHHbqowBfKJOu5yUhFVaufgPWmRnDZ4msxPKKlaiPcf1ysp
	sj6k43Kz9JBDNeDVKwnMrQHsM2XO6UALDD22ROnlCvQwM/TXRS/Cp9waW98VUwl2dvI=
X-Gm-Gg: Acq92OGef07Rg1bq9FK43M4RK2QIqOIDe0rqaIyJALTnBeCUghNJL7tXWM69c925VTX
	z8ZRU+Zg+q1hf32l8xNCFKooo6HIcN4KorDbLeQsrASWeLcI3nHJDGJZHwfL1onYLqlau/C9K/D
	MhGjAe5mZkWdVwp7bAq7PWpRIXHWu6v+bI6tGcH6q+W9yphLnShgD0GjeQH2lux/Vqzty9h/ogn
	96pXa/7Gct44iufLMfUyo4Ac28zvj/1+keDlLeCwbMNfAGdULSQWEeA7gMFAXMUfObKeQq4fNOm
	LFub4aFsdEy0MpbNsDX//EpvbNoDA7qzs97Dx1XtKVhe1DjLHErdxiEHo5MhZXEFbug0kj2CO5J
	faHlG7WQLqaDawNaegM4wi0/09jXHXJFfIsdgXx9UmKopWWOiC77TCzSahwGlmL2gMS4uGjQtJq
	bVa/D0bJ31Dn22lPibPX0okAHwXrVT+20B/7aRDAbxuxH0BOUmM+VMpqJ8ttARSs2DuVJjQpJN
X-Received: by 2002:a05:651c:1050:b0:38e:8411:c304 with SMTP id 38308e7fff4ca-393c41c6deemr33966421fa.16.1778243958791;
        Fri, 08 May 2026 05:39:18 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:18 -0700 (PDT)
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
Subject: [PATCH v3 01/13] Revert "driver core: move dev_has_sync_state() to drivers/base/base.h"
Date: Fri,  8 May 2026 14:38:50 +0200
Message-ID: <20260508123910.114273-2-ulf.hansson@linaro.org>
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

It turns out that the dev_has_sync_state() is needed outside the driver
core. A subsequent change to the pmdomain subsystem starts making use of
it.

Fixes: 9db268212e0d ("driver core: move dev_has_sync_state() to drivers/base/base.h")
Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/base/base.h    | 14 --------------
 include/linux/device.h | 14 ++++++++++++++
 2 files changed, 14 insertions(+), 14 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 0ed1e278b957..30b416588617 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -188,20 +188,6 @@ static inline int driver_match_device(const struct device_driver *drv,
 	return drv->bus->match ? drv->bus->match(dev, drv) : 1;
 }
 
-static inline bool dev_has_sync_state(struct device *dev)
-{
-	struct device_driver *drv;
-
-	if (!dev)
-		return false;
-	drv = READ_ONCE(dev->driver);
-	if (drv && drv->sync_state)
-		return true;
-	if (dev->bus && dev->bus->sync_state)
-		return true;
-	return false;
-}
-
 static inline void dev_sync_state(struct device *dev)
 {
 	if (dev->bus->sync_state)
diff --git a/include/linux/device.h b/include/linux/device.h
index d54c86d77764..56a96e41d2c9 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -1061,6 +1061,20 @@ static inline void device_lock_assert(struct device *dev)
 	lockdep_assert_held(&dev->mutex);
 }
 
+static inline bool dev_has_sync_state(struct device *dev)
+{
+	struct device_driver *drv;
+
+	if (!dev)
+		return false;
+	drv = READ_ONCE(dev->driver);
+	if (drv && drv->sync_state)
+		return true;
+	if (dev->bus && dev->bus->sync_state)
+		return true;
+	return false;
+}
+
 static inline int dev_set_drv_sync_state(struct device *dev,
 					 void (*fn)(struct device *dev))
 {
-- 
2.43.0

