Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 708DC3B7B7D
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 08:41:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781080899; cv=none; b=nUS8Vtx/1UYfbTwog8HSKIZtLTbsMF2VdfgCWRl2S9BWNs453Vb+OM+V5Judc76+TzZrKS2ldz2YueZCai82sTwn8+6MlHqkfcWfVkSrfr1mWbR06BemnnALpdltQ5tzfpOoJyzSepGCderafHnWuAuAz/qcjzKhMbMpQkElvmc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781080899; c=relaxed/simple;
	bh=dvbeJqgKk8hUMtZra0MzuL9+2wvRJGQPlU81QUpycmg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WQF0zm/w/NjgQzfO6UpvMxJvEOxrHy7ARd6wW0YsFWiaRPfA9YcuMnVofPlQUADK7lb+Gw+OgrMI/HrAtr8VQSp2p1cFKehiu9AX9EbJe2Ckjgg57mvtCkTzpjlWRK9wHjbYVPo8cO24bqmF3/ypB/9wBUdIkBPatCvXoIsVcdI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ZYdzQj+z; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ZYdzQj+z"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2bf114b0cf9so59288255ad.2
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:41:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781080897; x=1781685697; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=ZYdzQj+zlPcQE9Pn6xZWKhtgydg9k3V01o9rM7puvXdDB8AK5libaU+y2XwFrHMmcF
         iCvjLwtwoEdE+tjDMBRhzeZAPor/y6cgQ+GxMo6kKC3NiqU6cOC/vgM+bPY65CP67efp
         clnafZm2/rcA/T32uHNtZFQ76Kssjm8IgBX3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781080897; x=1781685697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=BYYX9NwLUP4rFqvakVHrp1Kb1i3tLTyqtPoxV/1lOfk=;
        b=OJHGqq+iKNhVTemXsIIS7oiZbZ59wr/Vs81mpGAuOtTH+LB9HcFSTgApgmF8MAx9gf
         uiK53cVBSxWRtNio6qrpPaQ8OTfiIezDD1Yo++7+QZC+wA4ErA9KqQpgG9xHlv/Zk6au
         SaVeIsOxV9dU3H3fK957WDz/txY32i3/V8IisobfcgzDWyVQjQc1dUbAJPUjUshPm97H
         JuUbwQo9+UYGJXVo267EN3W/sdBjFvBg4f1XT9Quf3k0GWhcHlrIJrRMmx/CJeq7Pje2
         VwHzlLEr6oKaSypD+Mlm8jVLm1Rrk4pM2OkyNS6gW4dHwQEzf8HrcWlhXR2XuiUd+20y
         1MNQ==
X-Forwarded-Encrypted: i=1; AFNElJ8jjdMgfY3Ylg83cwDIQVsFFqfaD9ySh+u1DnCfnjBZv0RwqeJxXO81lnp1daojRsPk0C7r1Hp9CMrIcw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyzzrtM0ngPjvWtPT0lCSEAubns+uqwSLSWdKhpLK0lqZlD4g4j
	3IbNjbXxDNB6obIp5EDV3ibR4MwgBNaYriCW6WhpxnP6yS6xdRdQQfQPQp+JGuaPRA==
X-Gm-Gg: Acq92OHIomEOT/i1U9Vb6f5W62DBc5k/4KufcQ6IDMLsr+054nk6l5yExv37SZVesDf
	EUXEpM9JklT6tIf5ohfofcdUvDzCeUMIhPV386wae78tqebt1yFfNAFlp4rw/y+VnQdU7JPZtBo
	7Q/Lg2UOod3i9kOGipp9/3oZSD6F93dsdc9bjlnhhSwC+O6ADAhDpjTZCKamoMrAGcGwrO6uJ/R
	udNUPk/4FTVDsxryCcckM3+xrh2mb/I4TNjAEd4DUEYeq7W4kZlX0WWzhOHpD/ZuboROy+C8cgz
	evMy4XLR0NIb63mt0n7cX6Rr/OIxSH7chHgXR5pcWHDDoVov4y6/bYTdYOTkw/qSeMtLF+28Ie6
	qLRB9ATjQSGyilS3UpW/T0g9E0ezZY3B2pn/CW4GsmGMJoAi+DShZkk0EB1+8jb3Nt7wrz57k2L
	U0eHHcrHdFRts7rS4Y/HoNTN8AGdf3GyxlguoH/gcY1TvrGMboqFKGA0U4mh6B44P8Yt3fRCtDA
	7kFf2k1xY2rGLS9gA==
X-Received: by 2002:a17:903:1205:b0:2c0:e5ee:f55e with SMTP id d9443c01a7336-2c1e80f9b57mr283573295ad.7.1781080896672;
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:3870:6325:16c:d35c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c164f890b2sm239223725ad.26.2026.06.10.01.41.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jun 2026 01:41:36 -0700 (PDT)
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
Subject: [PATCH v2 04/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 10 Jun 2026 16:40:38 +0800
Message-ID: <20260610084053.2059858-5-wenst@chromium.org>
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..985551d013b2 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1874,6 +1874,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2005,14 +2006,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 		usb_set_interface(hdev, 0, 0);
 	}
 
-	if (hub_configure(hub, &desc->endpoint[0].desc) >= 0) {
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret >= 0) {
 		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
 
 		return 0;
 	}
 
 	hub_disconnect(intf);
-	return -ENODEV;
+	return ret;
 }
 
 static int
-- 
2.54.0.1099.g489fc7bff1-goog

