Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 231953DFC92
	for <driver-core@lists.linux.dev>; Fri,  8 May 2026 12:39:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778243987; cv=none; b=bQDLgAKX5CnTSly36Hg0wj0ryzVDFJkp67LK/RSlAh/gJdpksuONsRqIqUVc1RuCogW4fgNhJKiHNqYrvmeDfiFFQWx7Pr9OU4c83T8dYwWmG1TiKSmfdR9fX0zT68f9rMYy93s8rT3kCnfKagkCd+xYLkkpudzGmKoYVVgcRAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778243987; c=relaxed/simple;
	bh=hwsTYxE8EG28UGJ/9uJBMJiUsrm4KBw9SMV/lotgNm8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=h7H5AXyWSLWzN0OFG5XcQ2iny85gpysu6TMkSRn70Do0jVVZCdCo7V4GnS2oey6c4g7pZDGr7BG5rmC/M4RUXHTUhNiYFYMqzf2RKl5cvS5W0Az4bjd2xePZrM29X7kaIOuyCQZ06uz1BmQVqQ55dH10kr8Ihxp18cwTxM3dKPs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Vl3Oo3mx; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Vl3Oo3mx"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-3939d2bd739so18323311fa.0
        for <driver-core@lists.linux.dev>; Fri, 08 May 2026 05:39:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1778243974; x=1778848774; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9GaxAP6ysJuJBahsu75EBbPBsRu50PTWws4c1kr5c8Q=;
        b=Vl3Oo3mxncAauaW/9yDnRhB6qXLgttA0u/P6VRYMt6U+gSORr2Nq8f4nzzxaH1vrOJ
         6jD4MQJUyaLViWAMB+5UmhOLCvFtxbLBvB8jGn9qLQ4uPdlxO15oBBeqfdZQMXb1u3jg
         LervNKlCXhVGFyqKIVCY+q5MdZ2AKer6TiSQQDsWn4sHuJLVNlqRYpLmtchqhIYuowMw
         9TduH9AO+YpBMZHe8aD71nR6Dxo4aCWLt3eUg5aOjBV36ZlBXWWbAGh/bHVPUshgnK/K
         6c2pCuo4lVBjXPuYnDvjQNnpyRkYhkuBNjZEgpijzmhJMUi0zehVtuq65TakRgnNiw8c
         IvLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778243974; x=1778848774;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9GaxAP6ysJuJBahsu75EBbPBsRu50PTWws4c1kr5c8Q=;
        b=QPZ12PAYG239/yB9BGAMPS1yeix6RbCJiSRdDfREMTj1aTBmkyC+qtgZHiCQUgSOr4
         LKEgFx7qJkJMxPT0hHQX8/VIqJWBoDguqah+UQFVXDhwyG2FR1nqZvlXzM1l2jJ1sJIT
         DOZnaToR/ehdGkeBDTHSKfT7v/+NzHnl34W7aq+MNAkG6Evh4tvIkh6SofX5ZE6lVwVg
         7A1jYjt6UAxZttUywVVfKwlC8wWPlSfBti1/89fWaL6RHzN+SHgs7NW1/1ewoqCDPCv5
         GvOH3NAtb/us/QU5mf0NGyVTTRjG8B/pJvkQaIY39663hGsx4sQbJWQJqnWwyV/D6xa2
         AgbQ==
X-Forwarded-Encrypted: i=1; AFNElJ9tumrLXMNh43gQPAKUWRTCPBUnlxOcNv6aEtv/IvjbSqg4z2AQiJlm85v/aSyYh6C4cqrbVukOrg4N7A==@lists.linux.dev
X-Gm-Message-State: AOJu0YzXY+iGsiXubPevyubd83TehLJCTj1ywIVmypJGQYCzplO/fF6T
	4XVaOWP1u+1hZIgPl7Qji/CI0Tg9QwGOvXxfhmCrV3bBLqzglIPsMSepNqkulHstPYC99zn9ld+
	iw65S
X-Gm-Gg: Acq92OE1rrVVsK7O+8MyZo3My/dgcdfKWC7y1do1PwHGLkQqh5gE9swPc38B42+BRyq
	FO0/MFnymMi7x/1OJJrAXBYp5/Vw2oWmo8NzLt1zR0OgFcuMnN8OhsWVwZQjEKYwgG+CiQmq58V
	rTgTg44FlHXIes2BSwqxcMDSx2oiEke+VWzoxUTIKCyMf4YeUwp6R68sXjPEVg9YkVH72/zLf6k
	o/RJDCkI6TgDJ5YJ7fjl+slW6sPqWfIviMBQmbamlKtduAHTgjeaTs0IH1xsvfQjsuAypiJlmU8
	yGrsCB0odd7/40c4pT/UHECB9okt/AwMOoaZJ6HvsY1mUd5Z1rBJhgC8BuJ6B9RduCL2WNH/K9T
	kQWE+9vTytcqkBDoA9dn+LqDs1ag9Izx/ElEHpEtsBvaSycaHSJprvnOUrAjI9xNyAz15P62Coo
	2WIyL/jY1QiOOy66jckdCh8S7PFkIV7a+zMbup78FAgkDf5SCeYZUhqoAKjA0d1MzRMwj4b4vn4
	tdiJl+azmQ=
X-Received: by 2002:a2e:9bd5:0:b0:393:bb14:9ae with SMTP id 38308e7fff4ca-393c40ce7a6mr36476961fa.3.1778243974261;
        Fri, 08 May 2026 05:39:34 -0700 (PDT)
Received: from uffe-tuxpro14.. (h-178-174-189-39.A498.priv.bahnhof.se. [178.174.189.39])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-393f5f5fcc7sm4569621fa.18.2026.05.08.05.39.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 05:39:33 -0700 (PDT)
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
Subject: [PATCH v3 13/13] pmdomain: core: Add a couple of debug prints for sync_state
Date: Fri,  8 May 2026 14:39:02 +0200
Message-ID: <20260508123910.114273-14-ulf.hansson@linaro.org>
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

To inform the developer of what is happening during sync_state transitions
in genpd, let's add a couple of debug prints for it.

Signed-off-by: Ulf Hansson <ulf.hansson@linaro.org>
---

Changes in v3:
	- New patch.

---
 drivers/pmdomain/core.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
index b5d90ddfd698..3d3e0f38815b 100644
--- a/drivers/pmdomain/core.c
+++ b/drivers/pmdomain/core.c
@@ -2756,6 +2756,9 @@ static void genpd_parse_for_consumer(struct device_node *sup,
 			genpd_lock(genpd);
 			genpd->wait_for_consumer = true;
 			genpd_unlock(genpd);
+
+			pr_debug("%s: wait for consumer %pOF\n",
+				 dev_name(&genpd->dev), con);
 		}
 		mutex_unlock(&gpd_list_lock);
 
@@ -2772,6 +2775,9 @@ static void genpd_queue_sync_state(struct device_node *np)
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
 			if (genpd->stay_on && !genpd->wait_for_consumer) {
+				pr_debug("%s: queuing sync state\n",
+					 dev_name(&genpd->dev));
+
 				genpd->stay_on = false;
 				genpd_queue_power_off_work(genpd);
 			}
@@ -3637,6 +3643,9 @@ void of_genpd_sync_state(struct device_node *np)
 		if (genpd->provider == of_fwnode_handle(np)) {
 			genpd_lock(genpd);
 			if (genpd->stay_on) {
+				pr_debug("%s: sync state\n",
+					 dev_name(&genpd->dev));
+
 				genpd->stay_on = false;
 				genpd_power_off(genpd, false, 0);
 			}
@@ -3677,6 +3686,8 @@ static void genpd_provider_sync_state(struct device *dev)
 	case GENPD_SYNC_STATE_SIMPLE:
 		genpd_lock(genpd);
 		if (genpd->stay_on) {
+			pr_debug("%s: sync state\n", dev_name(&genpd->dev));
+
 			genpd->stay_on = false;
 			genpd_power_off(genpd, false, 0);
 		}
-- 
2.43.0

