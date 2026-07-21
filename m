Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0D1F42A793
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 06:54:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616897; cv=none; b=ImQESQ7VG3eA4VSF8pikyoRwNwd3ZPy3No/ZSxGTnH9ajDFyHyCeIqINFdb+sLDOUAuHtiSWqnDC3RBbDxvxjqaqwHNiiOIDm3aOEdWvh4GOFzbaoD/9xLOF4rd28f3CtvvIO/GTlGa0bg5TlRnNFBnb8h5Ntx8JZfjnZtN6QSs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616897; c=relaxed/simple;
	bh=DZukzCQ7CZkay93mS9H4jkJ+htZvTV7aL2cJyc7/2CA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=fFYX0Y/CnJIVW+HMWK6dspoL7+NkyTMjSmoiaapoK0HIenoXRGfhzkovomSePkB3V29pk1pxds9fdRlf0B9cPeylGpD4ljm+iQMonayAgqqAMvIYg3e0ifWvhGs3E14LNQMuTg0/YSyswmyEP9PdzgDY73uHKlCFDSSCV1jYZPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=c1PotzMR; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="c1PotzMR"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cf6d65d8a7so22145985ad.0
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784616895; x=1785221695; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=c1PotzMRHOQCtIvKoYGIq2z/OjH1Q0lPRoXNxpNNnD5Q/6WoCl0f4+qduGMsc0MsTq
         XtGi4AJeeGCT4XlLrtj1n6Ysc7ph/xg7RZasViy7Z9l0x0wzrM03ASqGVn0xG9JwLLyN
         ooyTbQC252l3zjqwjDRobPDWwD1jZEdSiLruo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784616895; x=1785221695;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Xc02KBsQrd1xdK8Ho0VEf5G63Rz5XQrKjQwFcbcQ37E=;
        b=iOpXfSoN6N0+T7XWgJ4sddNPJWpqBybAG6TUiLA67Ss4fEJydMzcKZzls7xnZH2mNZ
         S/+Jb5KNOuML/oeIzS4L5h0ogrfYwniaXc3tA0nCEHrfGNRe41K0IjGdNL2tnMOEG0Bj
         y0fmKkFuFpKbiD3fXTvxaZuwQ/isXs/5N9pK7tXfbfeV0BNOP8MTmWJHpM5xzbVy7m/g
         S+3ZVf5bQpD96WNV/JbXGbTxL30HynwXZ5RWPlid/a/eoHZBQa3CwJg6WQZzn90WId5d
         AWiX0H+sB4dii6yqY3jcGItb1GpUz23BfUsG+dDe5PXJFkOUR5lfETymBYhWThVsc9Rb
         K4fw==
X-Forwarded-Encrypted: i=1; AHgh+RrxIoxr7Sgw90Q2XcDjoeQB2Yp8XpfR9fhZ2ivA8dQQpTiM4lx49zNKCqe0aWAvOMs5op7yNEaPYVQh1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjzconMVSdCjCwgtAJdMu3XlvpWojct332NZl6oZcew7N+r3CE
	CJG5prubvMTqSmnaeHr59zjdi3ERykZC5CE2aghRot67wNVi650mDGncHhbVnGh9NQ==
X-Gm-Gg: AR+sD131uvkClJSkVHgdyAVxyh5ORUWXWYHxnCApKByfH6OXYKs6/QIv9nSSaGrk0V8
	ScOp76BxRHoDbR5RyaWFzKr+jBuWS0OjRC+rzjEGfBBa0jWCXWJPIdN0LB6KGAfqbfUS38UKjH+
	ru54nVk0kSu+xC8XD2FkvRpoXOjylonq9b3b9mdETgFHT/QXDGfKLZXBfYa5ZWl41FjtWc5OctO
	kPHGS8UjkXiFb/HaUl/18n19iOiJCJT7JzCzGP9gmgpFq1kPcEpONlG9Yz0FJqdJWGKJ3WhjimV
	X05bKT7X6fGE7OLg/uffjSCYkUQmbL/3R3lMuqKogsUGaxFOqqolzEXPhbN9saG9rCjkyeloB2g
	aNwkS0MIj0t+QcpVDlxj49Cu4lFXtdACi6OoK1/oeBFkYeUZnLS++UaVUBGn44s9gP097NL7xqW
	35WtxldnGenTgNZgG5pmsa5CgyhMJ1QsbFRUjq1osOl/lkRhnMMJ1hU+w8VoY=
X-Received: by 2002:a17:903:41c3:b0:2c7:1200:bd7e with SMTP id d9443c01a7336-2cf3486b0b1mr185750155ad.18.1784616895361;
        Mon, 20 Jul 2026 23:54:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3916:f048:32c3:931f])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3448ee77sm69716005ad.4.2026.07.20.23.54.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 23:54:54 -0700 (PDT)
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
Subject: [PATCH v6 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Tue, 21 Jul 2026 14:53:59 +0800
Message-ID: <20260721065413.2306137-5-wenst@chromium.org>
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

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Attributing suggestion to Andy, since the change was originally
requested as part of a review.

Changes since v4:
- New patch (split out from "usb: hub: Power on connected M.2 E-key
  connectors with power sequencing API") (Andy)
---
 drivers/usb/core/hub.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 2cfe09a141d8..715f26f05a31 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -899,10 +900,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
 	if (ret)
 		return ret;
 
-	if (set)
-		set_bit(port1, hub->power_bits);
-	else
-		clear_bit(port1, hub->power_bits);
+	assign_bit(port1, hub->power_bits, set);
 	return 0;
 }
 
-- 
2.55.0.229.g6434b31f56-goog

