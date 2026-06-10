Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6B623AFAED
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:42:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080925; cv=none; b=PaUJQGgHg3SbQVtw1xvSpHWtMLFqCfqdCptMZDUUGX3b/nr37QG+24ACnhvKmiH/G0uYc9vqKJCaoalPni0JAsoagcWfTS8EAnYK7jGEXQECFnckGUZa26GBqVO/XbekUaPASmfMT67f7f3EF9iJmp2iWin8UDs+dnlPLn5WbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080925; c=relaxed/simple;
	bh=Q230lnY0gVIEr7GJLHqky4UKLxDQyNEVo5h765AhfJs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YoDHZCmb/HHHnECbQx5tTKQ/Y4TAq+l/Schtsjl7CnHjsjmYu1MQHRdQ4v3J0U6YyGhxWR3xrExLXUgj/qMusYipD746d8HcCMVQpAJPKusk9NRVn0WjFn2txaT7Qv1m9E9BRoUemTZHM88F1UA7Vo5Z6g2DwdF/G5lPccacnM8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kOr/ueP5; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kOr/ueP5"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2c0c2c7e0c5so43524805ad.1
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:42:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080923; x=1781685723; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=;
        b=kOr/ueP5+7RwRYfYfRzM918TDwOR6bNwhAUJkII80GnsLNOrgMZ/vNnCyD4P/Xj7Xb
         ep4zrqhvIPHVBMiKCmXuJBOSdltwcqUy8NCMvzCGBbHFcMr+VpS23Tu4CNlg/DzDbeUm
         j0lPthdebe1ujjUCn4WYVS2V5yRqwmul8qGj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080923; x=1781685723;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OS442Iy4WHxSdJHdZSOdZpr7Kbl6vNC1J8JNZ1Janxs=;
        b=dUg4AORpEAXswQdL0qKDFBc+ljmV3IjbvTOFaMAcr41nYdvTjCayC/JqKZpm8IoROP
         DXPfOG2JhvXYsfitFISsEhIzveXwAc3w8+M8t2oKIHDckhAe+TM3rJAkdftBIozgRuhn
         SVYpniaNscacmp05EAdunK1yvQqL6sWHx9xeoW1syIISomgT2twcqMJC9mWj1r90RlpZ
         +CFhw/1fgVyQI+4mHVxa2nOjv03m4ABYAIqh/CNWX4oYKdsPwNb9IqSJM0rAamPvNzNT
         4s12Mj+CAFj9r/Tft2q+WAcIMI+kk+wLAPOVmn51anCEvat8UMz7fRp26dLwkYGdPDRu
         0HYQ==
X-Forwarded-Encrypted: i=1; AFNElJ9qrGL3qlII6Zipg5fd6NwfunUXooz10nje4jvPW5eCx+F1xI7QwZ+O3yp3J5RtIWVe2hyULLwZwVEYSQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxGcj9lVsmhvV+3auEQKGHvE4J9+jo/94aainD9w804iuD/7t/d
	gKHIYc3zqgsZaoNuarjasgg8O/QK6JKzasH2mcHMcOe6TxvLxYy4q+O6An6qSAXHTA==
X-Gm-Gg: Acq92OEzrUUTWRcuiOMZKin9saNi0WsERcxHOqK4rbVIDFdKgv/fHdwn40dSnn3dQyZ
	x2St2hrU71+LmvRK9QR/ASDLD6+lUjL0A0nR938vW123XwK+yaBnvSgnbHRWXUElUYdi1W0es8M
	3YRwWIYLlylI7hxrYWt25Pp9dOUEcU0qnXShZD6MIWbNvVjNqPGIh4oDIGr4O9xMuAyftGDnK8s
	m5NvkihUEv/lvqFgKwHo15qsy2UBocYSMLdgXshYiwHwtE6uoQzas1l9vZmVBcG40G1aDAkm6Tx
	U4nhArwSPxUE41NAFnixnlQIycLuSPzBuki/xI2p5xqJwwp3IG2kLyq1tZ+Zq7ab88ynU1xtAPO
	J9kRMeD/C8RsSykamYPoPM0LFbuupmxTdOZIANmN234Llkk5AaVIOILU+M837v2eGJVZkX98W27
	5u5YakZ8AjrhrVI7NrhSl3tKwJg2j0K2MH0EZHzJ630LzXYuPgZDB94ekKXai6OcqtuAml5vPcK
	qRoSOS861+cQtTQMw==
X-Received: by 2002:a17:902:cecc:b0:2c2:9254:4c22 with SMTP id d9443c01a7336-2c2a1c66cbcmr79859165ad.17.1781080923157;
        Wed, 10 Jun 2026 01:42:03 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:42:02 -0700 (PDT)
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
Cc: Alan Stern <stern@rowland.harvard.edu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	linux-usb@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Manivannan Sadhasivam <mani@kernel.org>
Subject: [PATCH v2 10/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Wed, 10 Jun 2026 16:40:44 +0800
Message-ID: <20260610084053.2059858-11-wenst@chromium.org>
X-Mailer: git-send-email 2.54.0.1099.g489fc7bff1-goog
In-Reply-To: <20260610084053.2059858-1-wenst@chromium.org>
References: <20260610084053.2059858-1-wenst@chromium.org>
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

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index e82821655fc4..49293376956b 100644
--- a/drivers/power/sequencing/pwrseq-pcie-m2.c
+++ b/drivers/power/sequencing/pwrseq-pcie-m2.c
@@ -176,8 +176,17 @@ static int pwrseq_pcie_m2_match(struct pwrseq_device *pwrseq,
 	 * parent matches the OF node of 'dev'.
 	 */
 	for_each_endpoint_of_node(ctx->of_node, endpoint) {
+		/* USB port devices are tied to the port nodes. */
+		struct device_node *remote_port __free(device_node) =
+				of_graph_get_remote_port(endpoint);
+
+		if (remote_port && remote_port == dev_of_node(dev))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
+
 		if (remote && (remote == dev_of_node(dev)))
 			return PWRSEQ_MATCH_OK;
 	}
-- 
2.54.0.1099.g489fc7bff1-goog

