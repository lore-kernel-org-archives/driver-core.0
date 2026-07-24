Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 202263E3DA2
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:45:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882708; cv=none; b=ZH3HaPUkLIKQEUSHK9UX5OhFsEHbkHejCF07VokpIb5iLfAisK0rW+oYMfjgqcpCfrLaDlDr/kI/jHQKdMasCzzxjnhcK8NSweZBAcKlSajgXOmgdhlTetY51cY3MlbkfkHUDJ2yCQa6u7hFIfxG/kAWVvDUkG/PlaABAgYDCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882708; c=relaxed/simple;
	bh=TPxqymmswATTFY0Ts3z5ZJsgeicU9hkYXr5TZUF7F/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bk3kXrsI1ZlJY9XmL/xe1B/4jhzBnbWk6rG/gFXF6Q4mLwGo2YJeAhaD45Du307Cn9LbiU6BOfkJvA9unI+8K0q7H/gqEU9e+NWCh7a708W12CLQXYqGh1zD5wVSknAlOAutDdPwOz6T18XAUrWpGwfzxOLzd/xkQr7rSynYWKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JPZoaCnV; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JPZoaCnV"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e041ea211so163018a91.0
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:45:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882706; x=1785487506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=JPZoaCnVerL3lomlcYg90pLSfK0F+bwXlj9o9wKdUujAh/Z55jRcarNayeh76ly9Pr
         WYTuY1DCVrY36RJE/L+kswfSrpXpRSGXL4D38lsK5CWYMZUDARf1nieU7hG0vy0xCMTr
         jU2hQcv6PVnVIlv6I44LsfjnPFZIhk40ui5dQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882706; x=1785487506;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=IV2jFmNZ2XDzJ8SDkhqIHhUvT+vEMRhyLfjDcCh6KjnCryzXciT5EOCTaVsGlEwaTE
         fdp5YN+JXD5x4t1IdBx0npvDi7KcquAEd3R1QWMeheJ5VLoDJTNH9i/8FE6HaKozoZ+1
         xJCS4xklfeYhY3bRkoE20cfl0meLDQQLusC052Za0Il5JaTcwsHYuNQNOcNqJ7HJCnkF
         jI/BxnZx9O/aqgETJY5GCTGaxXeWpzQkQwkIKoFg+9Nqw2O3ZMwsl0FhZEYOQb8WUY4k
         hL3JlHoKkwYvzW3hBz4ruo1p+5EvvGPyp2tKb+EBAIai5iCVdTXQXsjS/F1iBz4lZpSu
         4VCQ==
X-Forwarded-Encrypted: i=1; AHgh+RrvsyfUMw1l4qDRUo65MzxyLuz4ZiHxbsEwWxIiFtu7O9qGlmEM9/bGmj1nal5Nn+w4Aityr/RzKXtt4g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxcw/B3LFJNXEjbj5Tjh6yfbksggOQKHht8UUM48+Xy+zfbgsfg
	MdpzflbwQeqFOpN7xgQygH+Mrj83iImXUdsYfVbpCdBMy41ENZOLcCCzyI373Bi/Fw==
X-Gm-Gg: AR+sD12p3/zgXlrmr+pk0CiBhxV3MagwKoZVzmUVctVgZvzrnqmbsPo6fisgA/OabUy
	699wEwlYmpHAsS3p93qaK60pEnCjZ+7eCp9WasoEoNMQK3J5UX594rVO95b5kN2qA397f4OcazU
	oJe23jqI+L3NQB6fDX/J2z0oCzqNgJE1HrcLBtxoVWPTiTJDPuX8Pfu5FTIFmIrUhNieLqJ/p8Q
	pkYhDB4Y1qToaooIVNp8f7D1SFDcM/I4mQzFhTJp8NI1pwKhX6rrHRXLGdMiu0OoSdnowN34Kt9
	DTI0RHkPyMlXynf0/zKrxk94EdnY2S+OSxp3OTBLZ/9mzSJYc2xWDwwBgkK7q9e2z6nMxbsLq3l
	M5mF5I6VFPky8oCvfK7UahdH9qpBhVyAO1soId+OMd9KxIMaqLXIz9Lk6nhNCAfaLuXyZSDHYD/
	hltK3IK21mH6f9kRLHPj/Ha/xrv5BnT9Uhtnu2wTVjKSCSuMuvU+CA+ME7JH4=
X-Received: by 2002:a17:90b:5687:b0:387:e0bb:57f8 with SMTP id 98e67ed59e1d1-38ec6a9d77bmr7085311a91.41.1784882706348;
        Fri, 24 Jul 2026 01:45:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.45.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:45:05 -0700 (PDT)
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
Cc: Wei Deng <wei.deng@oss.qualcomm.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
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
Subject: [PATCH v7 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri, 24 Jul 2026 16:43:21 +0800
Message-ID: <20260724084328.3943997-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260724084328.3943997-1-wenst@chromium.org>
References: <20260724084328.3943997-1-wenst@chromium.org>
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
Changes since v4:
- Dropped blank line between __free() variable declaration and
  subsequent use of the variable in conditional

Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..691cad0a6dd0 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -175,9 +175,16 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.229.g6434b31f56-goog

