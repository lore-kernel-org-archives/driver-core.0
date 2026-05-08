Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9F43E1221
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243978; cv=none; b=QgfTLG9hckjuU3gpH1CF0Kxo3qBeDUzDQC3t41wTOAa5z3AaQPBFK3tw/zlJ/Y5TgrcPQ4j47Epo9cdwKSLGsCmPEDe+nP66k8ImGvCcXAVv2Yu72IRxVtvVR9shruM6uIhMTHuS5Hef0DiN3D9agClZ/yA2/lbVUoRD0yHFR44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243978; c=relaxed/simple;
	bh=H6q4OVKbLdwM5DS1ok0o5JbRxgmDunwRDH7Ew2Jb3pE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mE3R1twZ/8BT+K5wNprCoM9JOKmFrPAeV08llk4cZ6wRc5AXXpaaB6PuS75zGkeC+6KL9MQp/a/r+TLWX38kbnvNBUhyGOxFlspQ3TusjgEdtsOggEAt0JNdY/sOy+nC6PgyIrX7AATonk9m0eq8sJOn3wEhrhI9gFOYbPAq8j4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=QNZb7H7j; arc=none smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="QNZb7H7j"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-393d07e8938so18076101fa.2
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243968; x=1778848768; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F/3tOYCHKLkB93CvHpDrXeQBRydo0wK6XTWaKDAjWlE=;
        b=QNZb7H7jVlZLnWb01CnaShVxe61SWcYfINDP2sNr6rbIXghBu3Ply380BmR0a/hi8t
         sQ8pI11+K6ferQ8xHOFValSh4LD/st1l95/fn3g6TzgHzQeoEtxdH/CWsaE5TmDJmVQq
         TkGwZqJxiJI5tVq93zUV2cnCrOKxbquoqU8zXq7xTFGykE+FkuFzm9mY7RUgtI8WkqaI
         gUzNRHtFOemNaJtIyHe01WFCkH/DYOvcbQ3CVO7g2ctUGwZo4a0k2dR2v38k2pJz1mie
         kwYAEoP7uvxn9SsBXjR8dLsKhZbCeoa4taWy7zzfV1ysFVHXK2BhNumDGb0TSmuBvagx
         kSLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243968; x=1778848768;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F/3tOYCHKLkB93CvHpDrXeQBRydo0wK6XTWaKDAjWlE=;
        b=ZnaHxTVCrMI1Bddx+F6Tqvu/zr8ZLKJCNRSojaujUVj/KoOOjSQJEtdH69RFjFS1a2
         /rsT001kshnKjAFg8RogLlbyyk/S2spukqHRw8dKUWYWM6G91mxRqdY4RziRrj+Djz36
         FNrvn428vVYmdW4gIQKYIJHUOqdoCiOXcgTTRwnBZRu/O1CwXb1W70wy4vjEeXK75McI
         8I5ne1q9qEi7mbgaW/rG8/vtxIxMpf1fY4HaopYHF7OtjBjfqKz5lGysRIfsQIU8H/YR
         9kdRhQg+IlHMA4//o+pQ96chBf+i0nYRp9fSbqJ4ClA2XdJ9DYfdLMOOqEaOrTomslXy
         6xvg==
X-Forwarded-Encrypted: i=1; AFNElJ+IgRwC2Bw7fCaOYn6RPbr2Vnv9K9rLUgYa2WalsfgBLSqJB9SS866h0xjg7tcbmweuqvRfvhvc28bKqw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwuILvKL+NH7TdNt01x07/Nla0U4gK04il4X44puRuqKDwDze20
	zRr9NI2Ap6c/uvugvbEkp4VVMNq038UOFev1dJW5sD8XDhL2B6G1RrGJIsWJJHor0mU=
X-Gm-Gg: Acq92OEHWDYiW1DER0KVkh83a4Lj/BmRZYbxoYCFYrFDogzR+tqi0NmoJt/B014o1i5
	qjuFYZ55rFnhwo4ksm4duHsWeZ14S7kqXJGwvBWJjY1CmUK2PTkE0vnGATBYF1/M8XhdgGlfi6w
	6A1Ip70VZRt1JqvsFwK3Ro/obr3eUBSwW1Ks/qOMG+jzwxLTRHniWd0CkH6DZi+CH0zn48auewB
	LdBaq5SPMY0yv4wFzbEvUXvpcYtx+vUFinlZOLdI9KuPmGtz1+zkjx/Dml8sV4FSoItoZ7xGR7f
	/90I57DSbmJQicSsgd6YJaI52s/TkNH7HlxWYjcwcl0Iql3BS5VYc+JcuVk9cFpYQOUQojDWpZd
	12qBV662sNEVTJ3OTb6brmxhJ1m5WCnvSyzAgUtDgOL5LbS1kmhUqQMCK8/A36yEcDugTYptIkn
	4Gapd68/G9SPNcxjZfqElpkt5PE1qiBwTEDrc/KQlTQuaLzPmC2Dg3MYrDA6PRfIvx7TkyBRQr
X-Received: by 2002:a2e:9b14:0:b0:38d:ed62:f1d5 with SMTP id 38308e7fff4ca-393c41c6f32mr39109701fa.17.1778243967432;
        Fri, 08 May 2026 05:39:27 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:27 -0700 (PDT)
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
Subject: [PATCH v3 08/13] pmdomain: core: Export a common function for ->queue_sync_state()
Date: Fri,  8 May 2026 14:38:57 +0200
Message-ID: <20260508123910.114273-9-ulf.hansson@linaro.org>
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

Along with of_genpd_sync_state() that genpd provider drivers may use to
manage sync_state, let's add and export of_genpd_queue_sync_state() for
those that may need it. It's expected that the genpd provider driver
assigns it's own ->queue_sync_state() callback and invoke the new helper
from there.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- No changes.

---
 drivers/pmdomain/core.c   | 14 +++++++++-----
 include/linux/pm_domain.h |  2 ++
 2 files changed, 11 insertions(+), 5 deletions(-)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b2b5cc30c7fc..b3ec3dec3f10 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2763,7 +2763,7 @@ static void genpd_parse_for_consumer(struct device_node *sup,
 	}
 }
 
-static void _genpd_queue_sync_state(struct device_node *np)
+static void genpd_queue_sync_state(struct device_node *np)
 {
 	struct generic_pm_domain *genpd;
 
@@ -2781,11 +2781,14 @@ static void _genpd_queue_sync_state(struct device_node *np)
 	mutex_unlock(&gpd_list_lock);
 }
 
-static void genpd_queue_sync_state(struct device *dev)
+void of_genpd_queue_sync_state(struct device *dev)
 {
 	struct device_node *np = dev->of_node;
 	struct device_link *link;
 
+	if (!np)
+		return;
+
 	if (!genpd_should_wait_for_consumer(np))
 		return;
 
@@ -2809,8 +2812,9 @@ static void genpd_queue_sync_state(struct device *dev)
 		genpd_parse_for_consumer(np, consumer->of_node);
 	}
 
-	_genpd_queue_sync_state(np);
+	genpd_queue_sync_state(np);
 }
+EXPORT_SYMBOL_GPL(of_genpd_queue_sync_state);
 
 static void genpd_sync_state(struct device *dev)
 {
@@ -2921,7 +2925,7 @@ int of_genpd_add_provider_onecell(struct device_node *np,
 		sync_state = true;
 	} else if (!dev_has_sync_state(dev)) {
 		dev_set_drv_sync_state(dev, genpd_sync_state);
-		dev_set_drv_queue_sync_state(dev, genpd_queue_sync_state);
+		dev_set_drv_queue_sync_state(dev, of_genpd_queue_sync_state);
 	}
 
 	put_device(dev);
@@ -3653,7 +3657,7 @@ static void genpd_provider_queue_sync_state(struct device *dev)
 	if (genpd->sync_state != GENPD_SYNC_STATE_ONECELL)
 		return;
 
-	genpd_queue_sync_state(dev);
+	of_genpd_queue_sync_state(dev);
 }
 
 static void genpd_provider_sync_state(struct device *dev)
diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
index 7aa49721cde5..d428dd805c46 100644
--- a/include/linux/pm_domain.h
+++ b/include/linux/pm_domain.h
@@ -467,6 +467,7 @@ int of_genpd_remove_subdomain(const struct of_phandle_args *parent_spec,
 struct generic_pm_domain *of_genpd_remove_last(struct device_node *np);
 int of_genpd_parse_idle_states(struct device_node *dn,
 			       struct genpd_power_state **states, int *n);
+void of_genpd_queue_sync_state(struct device *dev);
 void of_genpd_sync_state(struct device_node *np);
 
 int genpd_dev_pm_attach(struct device *dev);
@@ -513,6 +514,7 @@ static inline int of_genpd_parse_idle_states(struct device_node *dn,
 	return -ENODEV;
 }
 
+static inline void of_genpd_queue_sync_state(struct device *dev) {}
 static inline void of_genpd_sync_state(struct device_node *np) {}
 
 static inline int genpd_dev_pm_attach(struct device *dev)
-- 
2.43.0

