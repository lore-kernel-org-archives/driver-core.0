Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63824343E7
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616934; cv=none; b=O5DfdA3nJWgeZ+VtAIjA5CNMsAzU1Z2mUqw/fEAtcKZitB84+dzzcmbYokAErp7yfISiR5zuj9jjIRk5OtAcpSy2+uuVPN2z8A6JicqqbKpYvz4ShqehZrZciOOi7QEV4xXukRYjJrGGMJBBf0Aqq7m6ksfdZH1mh3JPhE3+aEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616934; c=relaxed/simple;
	bh=TPxqymmswATTFY0Ts3z5ZJsgeicU9hkYXr5TZUF7F/U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LJZoWuPwo4eCmM1aBoRe7H5Spjz9Ysot1TiAbAC9VlEc2ieeaGaMc2UzKKUVKFE9UjQY9E6RxKZIpkVLiVJttPG44fDO18dIg4HmhpeNQFGDmAjer3xy1uQ62MaJeEfiyqynV/Nu8Oc9apv2R3KGGM0IzIbddllqwzj/wdN4hnE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Uyzu7jsj; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Uyzu7jsj"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2cf52d15d88so25295225ad.2
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616932; x=1785221732; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=Uyzu7jsjxEwXHUoIIDoe305gKFFjoiT3C1NDaYvEbK182PG+4WHaq5XLyQqMpsrMHj
         bklOGvqFe8OZQNTc8zgLl2S2U19uGD+hRA3KmCGstLxGltz4Hlti2ib66VSL9PAevWrQ
         k1+2pZK3YizbjldbtYuU5AUlTqhSjhZI9LT0w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616932; x=1785221732;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=52TzlozFyu8oOUFzVHVO43WIZLgCMoBqx/sMPHBx7bQ=;
        b=Ml/m8mBITf7jAQi2yuJJIelWun4XpariobVVrdnT/keGvdQgmgrOhUIdE/YL+MgcVd
         3ytfcw1gPXhmIPaLwDqipFF6zrwQNIf6DJcCr2uRRuM+w3oND749TZfI1262EWjBIwrI
         BXkeUkNsIRLlKZxFDXEa4+BlQlW0uWA+q7CN5Xe22T3NSbR/htKIBYoN01Oh0INcUQmV
         aCtzll+68ooiWM05lfxpPdNBolRWxya8bYypK1rpikff4xOnWiIeAax8AXqeFwub73Bz
         Il4cpXG4MQq9PT+kx4uLjvhxYhQp49rCnWy0wk+em75kt8ftufecC5JdoiJa6V+oyodA
         SEAA==
X-Forwarded-Encrypted: i=1; AHgh+RoJkD+1NwLqtpLsh5EtEGbtsNBT1DkGoe2p7XJJxPq+/MfEDqWlINU9lf5aUooph0JMBbRcwMsfxQIuMQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOt3dqrlTDndgTNzZjV3xjdlmXlPOBsCeg9FuysDC9XLjk8tcI
	sAm0Rlyb59tKKxbdVS8Fz8DZt4qGI59dctoOr1Jyi/qRA8RhrOu8LRvmwOVgy0s92w==
X-Gm-Gg: AR+sD12Shl4CU8TfjJbcFYdnXUY4oxkFDyrdL4fU0FxiKJEBZeApYtqItams/NVZMJs
	wSCb0toeJR3QawNwgUH15NQQK6SodWTt8NCVpEK8EaG0wLcUB7W5Z7biQL+1GFNtYYAqMwFxBv/
	avEfzHWvjnD2pXGOqfaFspqs+QqzaG5IOQaaF8/KU4RP8OG15gXcytq9iJAguO/hb6PiZitydDV
	n3A55GrZP5av+U9EuV3a/JNjkSFMNqTMbc53HHLRxn7fJm0WMO8Iw5pvrS9l0aSi7/IkgmV81Gm
	vvIO+jBcvRJn/5tTgyXus6yNEHG7r9bOkeHjGymHnfZGzUda3RYlysSEpteu69v2oY4Rxbz73oT
	Xuta4dl388DxR1eTbByYjNlYlOqQ1bvgySyEjyCdbGV01tzXwaa7wrPCX7CYY64DyXanzLlRAV8
	z8V3t5849ftti2gnFWWKnKULgHCig6TAjSl5BPt4OTQIdH1ivlZI1mjA3Iwlw=
X-Received: by 2002:a17:903:2287:b0:2c9:c517:d070 with SMTP id d9443c01a7336-2cf348366bfmr176522085ad.3.1784616932321;
        Mon, 20 Jul 2026 23:55:32 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:55:31 -0700 (PDT)
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
Subject: [PATCH v6 12/16] power: sequencing: pcie-m2: support matching on remote "port" node
Date: Tue, 21 Jul 2026 14:54:07 +0800
Message-ID: <20260721065413.2306137-13-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.229.g6434b31f56-goog
In-Reply-To: <20260721065413.2306137-1-wenst@chromium.org>
References: <20260721065413.2306137-1-wenst@chromium.org>
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

