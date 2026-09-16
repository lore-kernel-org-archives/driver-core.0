Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58C8B46A604
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545546; cv=none; b=BVxyeZ5nfe+8tUJK5xe7J0DZA24q0AarkOoFGgx+C2UntCJ2pMmPwgPEVBBI1vWpUrdCrb8BRoWxZK1ADxk7fSsm/mwBiowK/lCX9PxjsF2LF/nX9PkrYdrmdoYT49YZtUwPboHuA7PFLlf4kqLaNhQ+HDaN23BiUKxLWD2FdOA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545546; c=relaxed/simple;
	bh=guAn9TMfJdLxEfb0LTGkrmmVx3DDJgyF4Kcka2QfUz8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kkOugxyc95NcKkf+kbg33qoIDRNIWjkyVFZc0IZehsFMyCXkaonhgmiE09SG99Dsqn5KF3Pf/Xidg3+3/IgKZ4xmBOSing1vS4ctFwMBibIkpOHQ/Z6dXB5V9fNMDvWl78AgoxktNtFcv4x1gyE/zLnG4dCd0aw9emrIFjgcE08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=D2FIGQaZ; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="D2FIGQaZ"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so453567a91.1
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:58:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545523; x=1790150323; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=;
        b=D2FIGQaZa6lBlQmTgew+kUINDTEJPXcEoknycK7n8NWXJ5a0eWybRYN+KFTs9VXLnI
         xNULr6zUSm+2XoczDredQW68FysLtOHTW/IILfSDx3HxsG3NQKo+THxptfaID2A8LBtM
         2StK2wbI5Wpa8JQbPo+9xWVnpNZnkgHED4+OI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545523; x=1790150323;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=9EP7B7Ij+uzgh7ozqOWENJmY+4dziA6HYdxmCK1rOAM=;
        b=ftkcrJ5obTk8ug5OO0HL+U6fJ28+LUGaUDAq9KFS4owSV/qidSaRknrdbTC1CFHyo3
         GETjMrtJlvLxzeeZtwfgwdM5f5n93g7o8A2y79qVGDg71Wd4sfjtPqzbf/2Y4Xj6yyuF
         f7cNvGtVTMlRYB21M3RaN0HvbqEM9HTjx1hmn+dhlsBtmd7DtUlmiF8c1hUnjk5/sbrQ
         aAu4B9506lAYCN6EbG2v0/hWuzlPehsgMk7rZVBDdShqhnRuZbgSBasCDWyGjotS1OE9
         QnMpnsg/CNsRS2pQLhI68jVIjHyoYodVsevuiaxn+AjI4c8mdSc7j8SOuENWZsxy0zJM
         xvCg==
X-Forwarded-Encrypted: i=1; AKwUvByDCfaFfp3oF+KQhLYISubxcCfkDlcqzXdtnqEmSVMBANv/lFfQo/hq5fWw+xXnmvZUnA2Wf3HVzHJGaw==@lists.linux.dev
X-Gm-Message-State: AFuF++lTVGxBOuS7zhBZttAVG0piU1e2MgwgL4Ihl2ETcHuFSRJFYkLe
	SxxxYA2JNbCJ6697KUnUTIgzabjmwxhnEHYcNsZjoIYlROD7BP/Bf3Fw6WXwAPnhIQ==
X-Gm-Gg: AYBFou1ipOVYJlsG+eBdYAjLvch2Js787jmuXWxpw55SSA26ACFmrNptGAO7UDtBBUR
	CFVutCsdZ1YA8X1SLvz8eZUYGUPCqpx9ZUc8IlVbaPGAaQ1GlELJh8wEd8z3reDoi1hed4zdHdw
	1xwcEgkUA97EBDKFxdVIKuWt4tHtFrp+0ADipXGDYtA4HJaubcidaZ3ceB0WRReTdT+eexbv/55
	YlKs5MBrQvp2J39V4iKnhWp+jeU5IAAqt7ZQSVJeV8Ka5Eg0SfOn3QTf/W+S4UHOmlLfkj8ScD7
	ZNCqkV/I4mYHr0cNKmyNpt8X8c7+eCdFCjo+F2Ch1vP5GkaMXyGJRgMfJFaf+jVPTfuLkjnj4or
	KpliKvsU/6lXicK8baJU2Upf+xuTi8j79EeYBQwxae0bIi8KIfYlTJNco82pZvkJtp7epyK5ZIz
	zkVZ/1mOpIG0oJPveZ+iyaE7Nsx/hQZVZhnMUoQ1rGS+szqWD3B2IqFEH4ImcG3ZSyatuiEZGi9
	rypx5Q93qgvmwnTRkreF77Qpf0tNEqk+tayMu+93O9qJdnLlsm11LtNig==
X-Received: by 2002:a17:90b:440c:b0:39d:fea0:c17 with SMTP id 98e67ed59e1d1-39e1e309c21mr3792094a91.8.1789545523106;
        Wed, 16 Sep 2026 00:58:43 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:42 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v9 04/15] usb: hub: Use assign_bit() in usb_hub_set_port_power()
Date: Wed, 16 Sep 2026 15:57:30 +0800
Message-ID: <20260916075745.3549953-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.1032.g73a4cd73de-goog
In-Reply-To: <20260916075745.3549953-1-wenst@chromium.org>
References: <20260916075745.3549953-1-wenst@chromium.org>
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
index 199d3f535a89..a4ec79a06a5c 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -10,6 +10,7 @@
  * Released under the GPLv2 only.
  */
 
+#include <linux/bitops.h>
 #include <linux/kernel.h>
 #include <linux/errno.h>
 #include <linux/module.h>
@@ -902,10 +903,7 @@ int usb_hub_set_port_power(struct usb_device *hdev, struct usb_hub *hub,
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
2.55.0.1032.g73a4cd73de-goog

