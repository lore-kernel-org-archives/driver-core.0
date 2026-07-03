Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CCCB3C3450
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 11:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783076640; cv=none; b=Jri54cvV+D859uqsV1TUG9+idkQiK+CoSNI2uyevGNzHtlbUfhFTFTef7GLgmsDdklaob59th7Mjq2nJd1Du5hOUUcmwURpCB03L6OgD9GxRSS+6n5+ig0hTqJ0H5Rm7GR0GhG2Q5eBE6wCJPJxOsfbv5WIXhJk9Zm97hi/8Yus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783076640; c=relaxed/simple;
	bh=KSKcoZhcUNUQt6mbvtajVqwGl+bjGPliu89rdk9IcV4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Xu7wmf0wLgnw7Em/8NQe3Nzr6+BifENUenqIh27QVqIUXSqWEvfGmJOJNsa7yL7lXPr+Hzh+VMZy8OdlE3RX6CmQSU7Zr6I8Zua30XB/K+mQK9KkxMmaHG0X+U36nByrzLG5ROjYReKLu/nvkz+1rJtCOOIJflyqBAw7o5gZvxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=cXWh7GNS; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="cXWh7GNS"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2c99672293cso5074905ad.2
        for <driver-core@lists.linux.dev>; Fri, 03 Jul 2026 04:03:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1783076635; x=1783681435; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=cXWh7GNS4ud3e7/hNf6Af/EWmalZdD7NcuyudG/QRE44lP2gZjBeEmx6hO9V+zcsU3
         jdzYkishYu8vqrIua/PN3bd4oZ/F0XS2SRwZq41zqmWlv/AuIHO2hJYo+4BbY1YBzxtZ
         NW0nKEYH8IMm5xKVeRyZvYE1SmyB0HJqgjjiQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783076635; x=1783681435;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yXNEvMizuglXOCjkp4mAG2muXyzVgQAtby1OdmgJjvw=;
        b=MOJsmg0rmQzTLB3H+yBjsQM9D7qMCniYMQLPKXraj4QhD5gNcXKA5GlZqr2p4ekaeX
         dEPUMGgpv9pIRK9RYOAmZ0+CSgUJMezq58QGaccBBKl212qO6iX24LCLKyebtk8RTTMR
         iPAZlk0+W1Jgs3TFI/SM/1LEGq1WSffxutMJ+W2x8s56Ax5wevmn4k7yHF/IwFPhQtwJ
         1eQ9lXUU3z1qpHrDnYg9gUob9rTLlgi2cFIB2ua8Y+aoJQ70GdvJMpgsdufB6ffsaqKH
         y24Gk73Ch5oUTuIqLzheUORMIhFiZ4qI9sluxK6VUyY/MYNftPQ8apifqAyMCVcW3v4q
         HyaA==
X-Forwarded-Encrypted: i=1; AHgh+Rr4ZDBk6jj9wD6uiXkY5AywE6dxjpsT24noFR96eddyqLndayzjk9dS4nI4/lqhuWsJGnsmiffGfc31ug==@lists.linux.dev
X-Gm-Message-State: AOJu0YzlP0pSpGNBJXYS0fmu9Gg4Yl5qtNCONhAZGUZHUIS8ul0o+YiL
	WgoieTDhU+fxP0WU+7xTManwpGuZbMZu0kv/K/I0tDxGuL2dNFoRCYELFBag2VKFDQ==
X-Gm-Gg: AfdE7clyoeo2b06WJGIVJJ88s8tzFJd11Y/qZn8JJVB0h1jh7omN+ETEl9pWw5chvxm
	24K/0BsV2KVBwHVdd0orPm5RY4Owx3dXByD2JZkS35oGN+7aIShdaVblw5w+iOe0a8s63bHqYMm
	TLqLz5OSwkfI+re/ycz/BBF6jWG0aCeagNjx0en3kQQ3SXrZYJrlXa9WSzZCLfSHvYF9bpzMoJJ
	JJa6WmJmHVV5Xh4fWVK5sh+NuzE0qeQQG2sknJ1Lfe0rC09xGcy1lXC+U7e3mRa+IeVTrHhpgzr
	fNQF5dKBDlJkOIyS3WnQtwTq96RySCDiOBdd0iCsHbiNozYAYo7xIy/sOn1iPXbccQaBkJmgbOL
	gbMMvoE5Rk7j0BnBZm2Y6ymHGu3JiHiIWTtYY09FgGnq7gzUu61m/cdC68SsF4d9m4+CY4nlUKT
	4huQMGsl4aW2Ak3oGnUCF0TRbgPAgU+K7d4L0dOr8uEUeueazLoDQg8Mkn+Z0rZb5Z/MZdlg==
X-Received: by 2002:a17:902:ce0e:b0:2c9:b01a:fbd4 with SMTP id d9443c01a7336-2ca7e6c4036mr107709695ad.16.1783076635124;
        Fri, 03 Jul 2026 04:03:55 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:7bc5:6c83:76cd:cbd6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cad6f25e15sm7785315ad.13.2026.07.03.04.03.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 04:03:54 -0700 (PDT)
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
Subject: [PATCH v3 04/13] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  3 Jul 2026 19:03:05 +0800
Message-ID: <20260703110317.1283411-5-wenst@chromium.org>
X-Mailer: git-send-email 2.55.0.rc0.799.gd6f94ed593-goog
In-Reply-To: <20260703110317.1283411-1-wenst@chromium.org>
References: <20260703110317.1283411-1-wenst@chromium.org>
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
2.55.0.rc0.799.gd6f94ed593-goog

