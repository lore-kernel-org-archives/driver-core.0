Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D10EA3D45F7
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:44:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511465; cv=none; b=rAjF3OG1Wis0YbubJtuhoxY35OTv0GKJBRAcU+6aLAeqLB+0Ff9vHW7y2fchkd3bsVf5Cc7FgGYoxNpO8t7txxA3ABtSI5y1B0uCdxKJJnwimhV8J2jNIlOoXHk9C1FAYnggbEIBiT04dMO95UUg42H5FJPIJVHELo6mAs4AaMA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511465; c=relaxed/simple;
	bh=xBV8QPVdEcBZnuBIzyHhldDQGO+nq6BHDmKFvSTohgk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=hsCl+XposUxI6t/ki/Ool2zDz5NFpD+A/9d/cWfLUMcPAWUEP8xr3E+s8p0wO0SnX1MDW6pvtn4FX98IrNkm2vZOVRlZolE1z9G2dWbJuvCfCA3B8Tmy02hUxfnbbE4OaCTERa7qfqVxKPsn0U0jNHJBdW/aCOAvHfLxbAz6eOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=e2kAEMsP; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="e2kAEMsP"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-39682983a0fso802229a91.3
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:44:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511463; x=1789116263; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=e2kAEMsP5KPSVMQSCqDc73q07iyzOIKSkj+R8E8MYBfX4Wbzk/TNj7PWPNCf9SG4aZ
         aY9iAYRlQViuS4ZJZ2r5Zsfge9e93HXgW6xgRifkpntEdfs8mIQqUU+nK00Qa0nGYasV
         iLomBIuCp4I4O3JKPsE4MJAbb72wYWG0eUO3U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511463; x=1789116263;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=1exL3htqf+GpZcCvUWENBQmRfzXhNWdoVzfZaiBanSc=;
        b=XA1YP4EThVhp8H9fbebhiEjxZ6XQJkVZoG9b3riV1dWIKAVMO7m1HDi7UODfcTB1+3
         EJrT62MgUML6+TLUWueUIjzZQ2pu+hwRmLnG+cIDqT6ciCdMM0DQWs2rTwKsWVwrUREj
         3rosbovFHqbdWYy0WmYVHEMpcJx+NaMy1An/riRQ9AmD6qZUWMWritx+cc6TafjN9zMS
         BTUhdlCrFEsRzcuL6Ws4f3oba/eK9/amHtUMxaSQ99jQA4uXLKC3x1MgxpPESzNAy4Hy
         8TyZ1A8nvvvVPG6Ly/0CFBmgBnMeni3G8TfmVeQ1fUp584yrFbVbOT0VH1Yy2xE3yhsA
         ykkA==
X-Forwarded-Encrypted: i=1; AKwUvBxwImLLmhLZPZ9v5Kf7mjRtpecjAHZpZhoXlFeuHeQXZP4reDce0xiRh5wqBwGUmZIqRXpcjJsd1uHG3g==@lists.linux.dev
X-Gm-Message-State: AFuF++mm3Be0YnQELv0dUNuqPBA5YZcPP/fHbSYrdhV/yu5umv2mmOaP
	AbCHWT0OlgsRhunN3DB6iWpC2cQMWhsPGNZZ3BBf32xFxx9lOH9++WgLX0XFc2FF7w==
X-Gm-Gg: AYBFou1FGicLpkkCwOjfqvqJ/NbEKaWYLXQ2uYisu9ZosIGZH/P9zCLpVNFwmJ1RSH8
	64RmJh+EsFvkQM3vAgLY6+OUZG7x/wMfhfCTAm5Tkc7H6Sci3tsBdrwaje6I/YJ7LdDvSUNE/4j
	Vsa5pUHJyppyQFdkHbiH1u3teHK0z+dosqgjQNbs3H8eObQp7jMddHL6/QAs7ytiIqlbRVPH/sr
	ppFJzmuhJsKlEXbCwNac0+rmj/cht1Gc+JhFAw1icT//ci+wUUVTUksE25EritYvOEQ1yXp8KIy
	q6/IZQcfhcrGEfIU9HE764LAgGkt6kBpzPiMl8yD9QRTaSDssggYeHb8zQS0uumrd2C4AdQzyf9
	9yOduo08Zim3ZLwVfPkDR4W2ybnyv+eoLfQ6qsR7dPbgIyDein8F8FAyRQ09tRJqv8tdY1HcvKb
	Z/iOuUL7U4pKgFYLGPJ4kmCkjSA5vWk9H3K3cYN0dci6a2Q/XkGUezSB+zPSd74qQbrxFKU8F77
	cRpR1Q+0AcQUMZsGauiD/g75NGdmOa6bnG88DCC/lKk
X-Received: by 2002:a17:90a:d646:b0:398:9bd5:490d with SMTP id 98e67ed59e1d1-39b26214798mr7405740a91.20.1788511462630;
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:44:22 -0700 (PDT)
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
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
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
	Alan Stern <stern@rowland.harvard.edu>,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v8 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Fri,  4 Sep 2026 16:41:51 +0800
Message-ID: <20260904084158.1341550-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.979.g7e5102b832-goog
In-Reply-To: <20260904084158.1341550-1-wenst@chromium.org>
References: <20260904084158.1341550-1-wenst@chromium.org>
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

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
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
index de9848a9a9f1..43b2328a6661 100644
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
2.55.0.979.g7e5102b832-goog

