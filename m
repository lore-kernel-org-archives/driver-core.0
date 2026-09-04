Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B48C42255C
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511354; cv=none; b=djyZE/j6VmXqdMBgZtnlAyC/4x3xm2FnqX8zCI6iU4Dn/gqIg7uZNRY/YxQ3njCMCOlkUWcVdSVDZ+0F4rr4P8Jx/D6Icvh5SySyKg0TumOMTzoOOFvACJqkNwV8FhTyQfepnLMDqrklncXL/4YTmdR7LzEZl4kuiJ9K4fYojqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511354; c=relaxed/simple;
	bh=B7Lu+PyhQKrwbSeiWnA/FCibSLvQ75jT0I67pSzcZQ0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OmRmXDBY1c/QUXBSs1IARL0X/dcsSY7EqpE3XCItirY/7fKtbdi7SPSNF8Q0HAvTMyKEgGPXWPbtGJjVsEhjpACG+v1M3ttA1l8rMcmQH5MGeMUbDb/0E/YS2eny3Rk8IwwKteF5/aNEcl5KFsciYHnoFoCgu4Q+5wxn3MLf4zw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kQ5VlkG8; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kQ5VlkG8"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-3964e480f76so935089a91.1
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511352; x=1789116152; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=kQ5VlkG8KVUbbQbwErOQbw7sAkPIM667bVHtACW9hw9D3YyOn+7YmeXG1Q0lK92uGg
         Jamve8lokWKoaZSeGEje9059pAMwYWY4OBLxu6ScPJmhqLcAsO0DTbyg8xKNGvAqTy0K
         nKr+aBfIjPHA+gexaLC35ei/DsBUVXhp/Nmdw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511352; x=1789116152;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RQ5BUQyX60lAwoXOtJvq7hs8kBNzpXHT7+FU5vNuJYE=;
        b=TIscn86jQxmX0AE6ZQkl1E/h4xtmrJs483iT72ak2pXa4utOw5fG4TPZDbNuSWk7kp
         p00BLqQeb6HhwxZhWAVMvhRS4qrBLIkxfij6oz2K4kwpt1ZQQR+LpI3HAj2maWkVxjZm
         NGtEtng27JyCHrclRonCg35LVp1fZhsSpszqVR+VmJgPqNbg/+iUJmRntStRmg7/6B8a
         K93LcKh5Y6Q85uNF+5HFdp/x/Z/bmAsK+/mC4YWPB8TuLGuvexZB8rQnmsNXXaWdXRVN
         Y+mhLiICS1CLk+HNgtl9J06NZh7GkzRQrwbXy/FU5gqRs8TdnhDYWiyZErMbFqoHt9em
         jOrQ==
X-Forwarded-Encrypted: i=1; AKwUvBx/sPHPk941p0JjegUP2f4PU9A9Vf3pGUyOm2rdczLrGaL/aOHlpvoT/MziDuIgkOFFzMobaArqryrQmg==@lists.linux.dev
X-Gm-Message-State: AFuF++lwc8930ytfMdqm1pfK4Cdb8gHldV3X0ug65vFayk7T7dIPTMjk
	Mg/A1oAdXb6Ue4Bn/j1JUlpbt5cXmHH7NMswA55GI0kG/zlME8Tkqkm9WVYeTUC/xQ==
X-Gm-Gg: AYBFou3jtM65EKM6RX9c2jhUsAk99fBpjtvqC/gYS3dRDH7qt06wigNmLsGuqLjdp8B
	M8mvp/qS0eL469nAx6/Ihayqb+mIiRwZKbOybmthGOo+l6YPvbsFJ+v30GQR9oyC7r3xx/5KxvY
	VLSqYBa67/51dQlLcb0W9W8RQUFCxWnwbJo+jkaL6SADgYaLHKJnENZDAgk3l9OvM00aYt690iu
	RsOgzbGEiHEb7VCtvRdFG2c/jcwPn6VKqBm4CmtjTm6os+rTxLM05pR/K4OaIy5GfDL6oENGoqn
	86EsOYEGfIoxhSZ8fGz8Zpsy2euFy8qUWDkk8TRswxgnDAnMbDWtRmCkvc4RW54jA3mHJndN3N1
	LjtwxoeGPFbideBaoezIdKC5M9q1bpCV9Q2yL2nt7CtoMXPjKQOK+8nhtJCX2ycfraV13hbR9YN
	inGIk0bshUshOtI05dDLRd9oYZl3WRf2kxRuDenQ3PnpaQx3/xmPFzYDdye5DENfIgSvgIk2len
	NX06/mpjyIezC4i1/9CWuUO3C64cqrwON1eimTJQbEM
X-Received: by 2002:a17:90b:1d4f:b0:398:9be5:b417 with SMTP id 98e67ed59e1d1-39b26221eb1mr7387796a91.18.1788511351714;
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:31 -0700 (PDT)
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
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v8 04/16] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Fri,  4 Sep 2026 16:41:43 +0800
Message-ID: <20260904084158.1341550-5-wenst@chromium.org>
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

usb_hub_set_port_power() open-codes assign_bit(). Just use the
assign_bit() macro instead. This makes subsequent additions to
usb_hub_set_port_power() easier to read.

This change does not introduce any functional changes.

Suggested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
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
index 3345b3298daf..16e03ec8d1ab 100644
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
2.55.0.979.g7e5102b832-goog

