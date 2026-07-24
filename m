Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D93E43DBD65
	for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 08:44:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784882671; cv=none; b=AoXKc+B35N/ykZDz0/YJbn/J+67jaGvHKRcfXxEZZC4FJ32qAOKfdY65Lgwg+V88opf0hC+IObDKMimDZqvu0AfXIWDUHKPP0ENUmss7QB53SEQ0gmuecRI3FV4iGRv7nhv7PoJy5v9GXN0nrstZnlcTuzGI5O9CTQg/ETIssVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784882671; c=relaxed/simple;
	bh=a0af6mRfXl6o/3aQ3C/YjqVxExTXT9xiwTDCu1uF7Ko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qeT9jdEq/9lSlO3QW62qLQtw0XJN0bAb5qW0rWZH+7LUupU9EMsF+HZ4a3zByOqjeDY45EG615fOmlpKzdwJPscrhfZNWprSJQPPtM8Lo7i8sX/6Ml4zGLHE1s69xKZCiRIHgABcjX7YqRo8FBvssRzBOSZvnaefhPY09cq7HyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BtnQy5I3; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BtnQy5I3"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-38e07ebd263so94506a91.1
        for <driver-core@lists.linux.dev>; Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1784882669; x=1785487469; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=BtnQy5I3hFaUdbsZzJ1vgZN1ArhHWjnPb6E9bC7tmfVGuGx6Y37SJyvuXLzKgKAlu7
         c0/pYbi7/LarXQWzur+z3aU4ZiWE2awY9HierAi0RI5navq4tj7iDt4mKLdGX5xQRc+R
         QCFRCq4/r5YgXgoc0On2IWTmPFjULCc0k8cnY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784882669; x=1785487469;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=qjG3+Srh1l1zMMK/k1OHJ2IZC5GaA1LItCzYqUBfaa0=;
        b=e15t5uEv0SO4EHHt5VdBSEedyKUiKNItg3MOrSetX2RkaPSu/qY8rOVe8J6O6qaoOq
         glAu9f/SxXfu78PPYd/FdG93/w5SKY+z6LzTN02fsCIbT7lYRwm/U7nab88XeKFob/4B
         JVMzgkiqakYWeBuwAl/kkj8A8DT04s7lOgtj4ARM4lMbFXpboaE6hAGLKpezcn52aaLw
         ySXKShpW8V5sWqd/jwLraJcboi09J8rTKHJ0vkxmLPef4+hImxSdr+rbJA+17d5d46tM
         /0hbh4aGnCsQLYlNkG/maPtcsOUZ5SEiGGxeJBah4UJrx4HkjDFbm3Llwa6KCMd2a+V8
         Q1RQ==
X-Forwarded-Encrypted: i=1; AHgh+RqrOPhoW53sO29r/W4GkKwyi914Z5fOx26bdl9qiImsapd26qW2fYrJqLm9B4k9yFB/ynKedYVNtFSSAQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxBpUN4nh6lG5MnDgfom7TCQ5hVI6Pfsc2V7slUVQO4sU84d58I
	nz2t7uzkmof2vtIg+o4wQpEJccIadKK3wTTIkmdm3/KZ8zyyeCiFxN2mpGAL1ZPpEg==
X-Gm-Gg: AR+sD10/XTRN20g9PuGuJc3OsxKU7lJwNZh9rNFQdty3JEvbK+iDEvsm4v8xyDBUvdq
	lKr+ppaSCdxGT4C/wSRcBMoCmLnlbF7i1okzM5qgzzcOjF4k6wJl7/15qmj/eSL9oMO4mwi0QDS
	TNzG2pa9CoVkCA47ziHLvdICqe+5JXb9ok1pYhDpxf3Ahu4FY1Nk9auxmeHeOLx7VP9hlJG2PAB
	LqiRD1L2jlTECe83dQZeFI2kqv2Lx6WwV7KWYAXp8rJpQQFsI+sfinOt++CXD4c27RiaJelIYXy
	9pZVFKviNGtQZ8Qk3wcVWIPJ3oGtILu5VRfJrj3QBJ9f1DriJEeFgePgRC4gSNIhdPazyqjnRD4
	OrOAy+x1YjjQhJn8FSeQuCrTFJzLSZxHTFM1s7iRr8+NWSGsyZPP2Hxw1lGYvG8Nxm0pbjTyGGI
	pkRikjKJwsmM6rjbNGRJesTf/e4nknxCVvmEWkSJWTnKwIdKK98X8J3MdaM9s=
X-Received: by 2002:a17:90b:2e03:b0:38f:1f8:1fa with SMTP id 98e67ed59e1d1-38f01f802b5mr3474310a91.15.1784882669036;
        Fri, 24 Jul 2026 01:44:29 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:f131:86cc:5858:7325])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f089ac6d8sm434546a91.2.2026.07.24.01.44.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 01:44:28 -0700 (PDT)
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
	Alan Stern <stern@rowland.harvard.edu>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH v7 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri, 24 Jul 2026 16:43:14 +0800
Message-ID: <20260724084328.3943997-6-wenst@chromium.org>
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
index 715f26f05a31..8f8624a0d36a 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1875,6 +1875,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2006,14 +2007,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.229.g6434b31f56-goog

