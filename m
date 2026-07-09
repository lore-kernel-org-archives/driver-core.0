Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74A80407CC0
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 09:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783591080; cv=none; b=iIY+soVlnbqsDkxufEqSZ5YhP1lJS/iD3IBcB4rSRUb4yCzHgTQRWtpihcUnJ5evnDJTkQ4iErMYevwFe2gJYNSvBoVt0FhDcpVBnvG7rPYIXLOXKOTdHhOARkGtf37LcxdcFX/vdrH5WrS4rQbsxw4W9pMk1sxsMilx/riFvgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783591080; c=relaxed/simple;
	bh=8mYc+Nbjm6+sQSrADVmvWRSMeKKljH7evJpSSNXklR0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=blN3DHP2hleYOayHkFadsOZN4JKua7JAbKn0jjT153PkXqM9oBna7VlqasPZXRdldSwt3Wrmku7HRBL3eFzU+6CUotl0Mi4e1oJiVB8MBtRFZtfDa9SebvUwMmDeDsKkSCLyeyvULzyLkKoB67cFs3QzqO2QMTECBNJJby985nk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kq4o0+hX; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kq4o0+hX"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2c7c61b5292so31228855ad.0
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 02:57:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783591078; x=1784195878; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=;
        b=kq4o0+hXlfPR0ECkmUcfPd2Wp0MvLHV8SAZlx2ub1PtxOWoytE2uhl6ZwsO3JAl2oh
         xFcma57KhLQYEI4vyi/WEwPdhHhEYleD85QxguRbfQO/nHHwP3xiVK1Urd3UdvyhDoc5
         wNaWT4iRtsmrVNTx6NYngtWx9fJYImIIW6ZrI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783591078; x=1784195878;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZO05xNK1Hbq+tmP+bxjD79MnCLqnvQlOFToHRwo4P0Q=;
        b=b/yvwhW2Y+lWVfdhjPHnOtN5Ebe5q4OoC8APcKNS5cAYR4PeeVIxAHVDhD2mDr17Fr
         pJ8NGjsh3CbrSgUM5XG+11q2znhOdGTVcpKwHdc6Dh/xvLfwUWxEC7wm1lk3ttRAkY6V
         7pw3lcV8GFRZOwU6u2Wf21qkoxxs45kDsbqUnF4FjVo72A7ZnTBDTjlvSUZFTnlGOgI1
         cAEx+8ML7lTtxHfpLozdUN9DihJQuSaUEVqrpYeKSZpe+hV4UjTG84vHL5EgMsdRXwYN
         I+HT1luSmpQ37Eb2Cc9Xy1Qrgi35goewlmtHSAY23pXjf/rPgmyzUQoFnJFetDop++Mm
         zEvw==
X-Forwarded-Encrypted: i=1; AHgh+Rrv8j87oJpCpMF//arMMR8gJ2xhbyRGdfYw/RWAZaRaFuVh1Poke1WQNfPOfJReUfCuVyO++CrGPgZc7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzseLi2B7e+JgEq0DJyd9NhhFnux6lE81Qo9axh348UynpTaUhQ
	fal0SKYhgFd6CUGGeK6SgDl5MhsCKA9KubJS+QPqYhv9z6++n4e/yDXUFbgdTi3cUg==
X-Gm-Gg: AfdE7ckD/5NJCI6Fg4+Wq03cpT80r65SNdUFCEDJm4n5OMxLraIoAIPRV9S/CXdOfbi
	T2OxJzSRYRcYQMl2qqyepjJe9c6l52mJZY538rExqkQj3u77KXuntjAiOWtCHqU3TstSkyMlT1I
	s7GkQi0I/I7afQ8N+GMxTrhTCcHMPp78RVQ3ZSqvAodXiPy+4/RzLVH3z1njR9xFavvkIvYXC++
	zTzkTfxpS6C0C+mYFARCQhkTytcEjcHEVq2vr8VaKYxq2Jno3HGIXNHRq0aJ5jpSZ039hQkphAA
	0bSJJtK/OKz/YQApXVqbDRH7kFcxG/aKAGaaYHWTRkVHQCpli3mt4403mqi1dGSIPU7PqR/apiW
	kQrG2yajelNlrLa5YwZbYqO+SXg95BEbOnuVF7tSk2ENQBHXhf+xaqRF2A12l5yy5HINFb/+kLl
	PTo0+C0/MlllUQ+htfqSaOKpaW3msu0oUkZCXuz9QPQuuAA5g02C6GrF1vj2Wnw++e8etrQw==
X-Received: by 2002:a17:902:e78e:b0:2bf:dd0:c8b1 with SMTP id d9443c01a7336-2ccea1a4d4cmr66175845ad.0.1783591077993;
        Thu, 09 Jul 2026 02:57:57 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:bd09:6ddb:180a:69c5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9d5bd2fsm41082155ad.78.2026.07.09.02.57.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 02:57:57 -0700 (PDT)
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
Subject: [PATCH v4 04/14] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Thu,  9 Jul 2026 17:57:09 +0800
Message-ID: <20260709095726.704448-5-wenst@chromium.org>
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

The addition of power sequencing descriptor handling in the USB hub code
requires dealing with deferred probing from pwrseq_get(). The power
sequencing provider may not yet be available when the USB hub probes.

Return the actual error code from hub_configure() when it fails, so that
the driver core can notice the deferred probe request.

Also rewrite this section into the standard error handling pattern:

    if (error) {
        # handle error
        return error;
    }

    # do more work
    return 0;

Reviewed-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v2:
- Rewrite into standard error handling pattern

Changes since v1:
- Moved "int ret" declaration in hub_configure() over here from the next
  patch
---
 drivers/usb/core/hub.c | 14 ++++++++------
 1 file changed, 8 insertions(+), 6 deletions(-)

diff --git a/drivers/usb/core/hub.c b/drivers/usb/core/hub.c
index 13264e86bc6d..fe10d72ef39d 100644
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
-		onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
-
-		return 0;
+	ret = hub_configure(hub, &desc->endpoint[0].desc);
+	if (ret < 0) {
+		hub_disconnect(intf);
+		return ret;
 	}
 
-	hub_disconnect(intf);
-	return -ENODEV;
+	onboard_dev_create_pdevs(hdev, &hub->onboard_devs);
+
+	return 0;
 }
 
 static int
-- 
2.55.0.795.g602f6c329a-goog

