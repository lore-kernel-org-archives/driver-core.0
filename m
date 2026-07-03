Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF49E3CAA53
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076662; cv=none; b=TiVHOGcJRH7O4hrYyHgSd+WK+ZEiyiYtCWnhuP8e+xqh5GDU9hY7LFBeowwb9+VZpGcmW6HS5paptlcl2TwzsrYin1ByYjKtMjakj3EvQFDP6x6AxXQXiLQUslHqL1p/EpWwWMBwi3ZXQR6FDHi049uRWr6L+HKNPGiIR6GAQOU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076662; c=relaxed/simple;
	bh=Lc67Zeaser87yY38PSmcUxCA/6lJ69+b9RUjeSaNZyc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oBuSDVVkPZFLoxu0m/kWKP2oVZPeQ9baHHEu0Zd8DYPxG4cItVoe4pvbHH3cTAC5QmHT3vtRSRoIhM8bMCczBF0hSywLaDN3gpXeT/Fwmb4OMK/XInr7wrIclP3ZLzYyfJ8gOAacuHR8fOpZu4zyhCrbkn9DKWpQtc7PtnYLxR4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=HLAFxNAM; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="HLAFxNAM"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2c9bd2f8bf7so16666975ad.1
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:04:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076660; x=1783681460; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=HLAFxNAMwBPkMPvuty7dZnAW6gR3HGJf2lDVaGqZ3nVhCT6eafTwzrdg12c4882Xdj
         3rOmjPzd1LR/EGFmLBk8shtTBeq20tIz4cwiDJi9ISIasLXj6ByFBvSwBQLDHFzz0WI9
         g6zoFov5+iyzHBDQjk1htYsGN9AsLeY/aOLh8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076660; x=1783681460;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KRv90qFqU2a0K+pYyATTHQRQ7A0Z3yoLXaJNbxqKJ4c=;
        b=PnjCPoNtXgKLGBuYq9RKVtbGnTiRhJuI3cRyCkcZK8JVbQrGPhFvK8a+Jc5dMGn2To
         yGLJK6foqRRN4Aolk7auHr5myhMVypemjFeQxOk7ZtW/LwdtnoSo99q6KtLO9ZMYPyIU
         +pE5AtPn+T3Yf+t5Yum181tHTP9G3qndck8hL4+sCAKbsrkzzcI8YiEHQAiWKLPH2Qx7
         8tzZSOgd0pwozhKx1LQgR3JKmAENxeOD6SxCYl3zSEkfETzR5IkoepFRVAwAk23/bHIQ
         pzabamPLs4ORXSOcQ/hNB4xOv9P834GcfCxsiCSCBAPkX/lwigW6OKC/onxT/4TH91NT
         O+vQ==
X-Forwarded-Encrypted: i=1; AHgh+RqzIxutuQkBg2JAthgC5TwPyHYqTa/W8VAueY7V2XqbzFehbMfqY7MQ19nE09GE/WbFvsOMipbSSsYN5A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtiDEPw0cqd9w0f1r59TX1rzslc2kghTFFL/EXwEKF4GAs8YKD
	dfsRf1BlV1ApUq4btaxIKqmxtSXm2RO51X/tV43egVdCBO+z5MXt1szsI7wLuEu9mQ==
X-Gm-Gg: AfdE7ckZjZMiCgJP0z6QgmssJg5pBquivGIjdpUeYwx5uIYjqOpEXmrJ58twW45UDaG
	91UDdXQ0X+ic9NKMzoPjpQzgk5WWtA92XvI0UugtalOafX9WuJaWRo6BLDe27Rev3G9k8XjMUEo
	8jrmSEmhU9nyB6a4np+GejTclhv3LAtMWKm4Ltuj7yNSi1G1Yp2FfK4+w57/p08X4WWN1ctp6GA
	5RBB5RhmCOQVh3hvhcXW5ss2ToEWV9NlYQ2MM7PxMcFXHBxuTh+faguiDnhUqdOZO+VRBu0+tvv
	ockMNtbfoscJNDSqEh8GNuLcbdN7UoljqngX/TaQwlqAe+u3dYXl4oqHJzgFfJeqo05C5dkp2YM
	OXS1bpQD5+fnuh1rW5FycPi7630jpnyh5aXz4s4PyM6J4qfB7x07CBMnVV3ck3S1ILYNfZwieCI
	+VJD+E7/kUTomCRMKtdB1/K3N84tqeTV9/KOOPXJwurgsvURxOF0D+oK2Sr/W1XOEIktfNkjM7q
	+08bjWL
X-Received: by 2002:a17:902:d4c3:b0:2c9:d584:49bc with SMTP id d9443c01a7336-2cacaa911b2mr39932695ad.3.1783076659705;
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:04:19 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Bartosz Golaszewski <brgl@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>
Subject: [PATCH v3 10/13] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  3 Jul 2026 19:03:11 +0800
Message-ID: <20260703110317.1283411-11-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A USB hub can have multiple ports, and this driver needs to
differentiate which port is being matched to. The USB hub driver now
associates the "port" node with the usb_port device, so here we can
use the remote "port" node to check for a match. Then fall back to
the remote device node for the other connection types.

Also rewrite the existing "remote == dev_of_node(dev)" with
device_match_of_node() for consistency.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index c8ee6df42b81..16a47f76e7ce 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,18 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (remote_port && device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+
+		if (remote && device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.rc0.799.gd6f94ed593-goog

