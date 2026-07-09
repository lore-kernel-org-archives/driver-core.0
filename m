Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC627404BF9
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 09:58:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591118; cv=none; b=NBROM467hMmbS0VJU1WfNTfgz8BYgwLhK0u9qIzzdaikX4o0G1y6DMDSwbOGZ3c1FRXUvD+zVtwJN7YwnCKQSzOyY6+aigxcZoP/y4lEpGs6o29XHHV4Uq+U2RByQAEgEHIXOUzitmT9Qu9ddSYLHgEpAigCWFsIIuZb4IP+MPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591118; c=relaxed/simple;
	bh=wBafzaV3gjSM9m4C5Xt10gLLMadwusWzqQ8Oa+RTMik=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sKGVIinEqeL14w2EDVh5kScXM/VKsIwPoWX0KJEN6IJXE6nsDkJpYDA6OyyltQk7g/FvpHDYCjZj9SXCGX61lMvtd2M2aEc48GgokZcky/q7vaMWRFYGgSb57RgKAVriAJlGpFNxUxVlvUo0j+XgeVv6D8/64GSg03n89HQGZmY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Ir8kitJs; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Ir8kitJs"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cc6dd436c6so16682795ad.2
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 02:58:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591116; x=1784195916; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+6qS8sNKqohtOzh0Qv5rdb1r/B7Aj2Rva8hJLtH9EXY=;
        b=Ir8kitJsTxmONqImVH1xE0YI9uhhGL84RabiAvkiDfwnWRDMG5jauQrUfSfiRf2Oi7
         E9dD2GuEwrAhJlsVqGBIjINFf7CVXoi84E1n+5Yl7kuPM2A/tAPIvIiM9BgHnDZ4ssj1
         uWvbXDrptx9Goyw35rq9evJjrskJE7IicNc9k=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591116; x=1784195916;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+6qS8sNKqohtOzh0Qv5rdb1r/B7Aj2Rva8hJLtH9EXY=;
        b=WCIl6iQETX0kmoAf5lWkV5JwZh1Tf6IQ03N3/GF1fHIX74oIDhLY4c9Bn/hCYR+Zo/
         Kw2iDuOswcY7RtPmqre3Me15pmUc5qtrPWo1pKiGZhuzRjxVb1cAZn2rmMMhU6Zs2y0U
         iWhenTjXwNAroHI8U/fUBg4h2a/sH2GBJhEb0xm4tGwjaypoAxUUeePjwHAo5rMMETn+
         hfY4WnsLSj47YxNDUdyQA24dbl9RcDYY4y0u+y9QNcClquQIdU+8tC5OY3B4gboALeC5
         nh9DoyiwNfCS1xciBVHBO3eRdQyhEM27gkJf9CkAHkQXqsm/pooQrszaTiWQlCYcxaw1
         jOYQ==
X-Forwarded-Encrypted: i=1; AHgh+RotbD5DmKMacv+JkGnI66f525Yh1oOqrgd9kBBg6XvJASgc12dAr+M/bou95gCbR8c8qDZJDtL9fHKGkg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwcihbghYDtDVt2E/hC9yCGoHV1UsPjXsEJIC1yWpoTIB0LxthV
	fBIDWRInlPRK88OKlt9V2FEbRDoeKD16fuZ4XotLSkRXphlaxtu/WbQXdtTsVbRvrA==
X-Gm-Gg: AfdE7cmFGEZ05HzQkZXwqrvL4S1qNC3F7qtSOPHrDSbGHU2Ff9h2OV1q865lOKQwOdY
	ORsIYiTHN1+pdcl8xubM/ZmGwOMMJ5bPc9cOBSh9uNSuRch0ZQepM1E1JUd1xDaHJTw6kH48oiQ
	2paXfR/RyKqbyab6egjft9pLqaO5xiynuLunCdD/UqZvOAIh/AjmG6ocMFXfNNXWhR06h8JMRzw
	PD+eE95N2epVdGBSOkpUF/1kbb7ffrFUa/NZokXxs9PGCv5pUHq4nKKvgxsvYZXgEuavJbWgKNH
	cj7PGnD/Js7eOFX7AqNmH0GSBFDsy2vupzrF3yyz0WRY7WQ3lYYcLy07suFmBGdQB5vrw1OaPHb
	UzTqkpf3ds7K0/8waavOs6iQCAFJxV3jkFnS1ihRMkWOC3b/elAP4xLb94jkXFrRB2RCIj8XI7a
	jCobVzOwfJTDfMKQeu6/K/fqWTN4oKNWp/ezCNMSQicWNfP4BaQHN7dZqA0TxUC/pVgBlAEw==
X-Received: by 2002:a17:902:e74e:b0:2ca:e106:8e69 with SMTP id d9443c01a7336-2ccea371b50mr70745585ad.10.1783591116169;
        Thu, 09 Jul 2026 02:58:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.58.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:58:35 -0700 (PDT)
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
Subject: [PATCH v4 11/14] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Thu,  9 Jul 2026 17:57:16 +0800
Message-ID: <20260709095726.704448-12-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.795.g602f6c329a-goog
In-Reply-To: <20260709095726.704448-1-wenst@chromium.org>
References: <20260709095726.704448-1-wenst@chromium.org>
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
Changes since v3:
- Drop redundant device node validity check; device_match_of_node()
  does it internally (Andy)

Changes since v2:
- Use device_match_of_node()
---
 drivers/power/sequencing/pwrseq-pcie-m2.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/power/sequencing/pwrseq-pcie-m2.c b/drivers/power/sequencing/pwrseq-pcie-m2.c
index 83fe6a1396bc..733190175f84 100644
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
+		if (device_match_of_node(dev, remote_port))
+			return PWRSEQ_MATCH_OK;
+
+		/* Try the remote port parent for other types. */
 		struct device_node *remote __free(device_node) =
 				of_graph_get_remote_port_parent(endpoint);
-		if (remote && (remote == dev_of_node(dev)))
+
+		if (device_match_of_node(dev, remote))
 			return PWRSEQ_MATCH_OK;
 	}
 
-- 
2.55.0.795.g602f6c329a-goog

