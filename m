Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 029CE3A48F6
	for <driver-core@lists.linux.dev>; Fri,  4 Sep 2026 08:43:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788511392; cv=none; b=ZUP5cZPVoKflzu+x/dIVeAOH/oxi6YERQS/7xFfgNdGMANmEw8SwrK824z3diWECvdWXnbWnxCA0UML6nCTWf6MoshovFhcNx5Uq/+75K8y1/sVdsxRku9TqqmaVbWkbo2QsLvVoVetmIbeFKErMd8bA5EFJK8EDwJyN0DV1fs0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788511392; c=relaxed/simple;
	bh=k4P8O6O1bZN0BviRcm5rHj8gLkm4KLla0pyDEJs44j0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UyFBpE7apewZQl3xk6Q7jvuANlS58j87Mf4sR/heOOVlOuLF11uJgvPL5RtrozEG6MfNL8d8TSmAFpHJUB+32JMx98L5XxfMR+0iOK8SZS9pB9XM8I/qAlzf/jQ5rHrYp0utNqXbVloeE+6IuEvhHPx0+kmVB7TA2+TX92hp/Mg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=h+Z0hrNr; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="h+Z0hrNr"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d58efc7356so9777065ad.1
        for <driver-core@lists.linux.dev>; Fri, 04 Sep 2026 01:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788511387; x=1789116187; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=h+Z0hrNrWTzrgw6OyEnvsoicTjVMZZwsB8D/OtYh7AcZhyyXzBGAgjxsvRAe2NfjL7
         WNBVp+kkwC46LfJXS25ZnuKMfQLYrZ4B1R7mNayRBt/wFGNTnrYuTrTYPp1Bk+UzDWW2
         0Brx5r1vOdAUykI6tTfW5d5T2m9LydSNWe/Os=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788511387; x=1789116187;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Bo+9+1CvfJ71hhRjJqHX7wWrfIVVnPJvwTAuLV2zMPo=;
        b=klYlMZ7/j75iCm7PXjEaamOjQqPetEGl/nIawnMvTGTfvd66CMtLwU4d52YZMm/cZR
         Q8hm0chZH+q4ffX7zZjE2nAYLgsehOt4HfhyJO2ByyOGxIXQNMm3Pp50VTqNjIM2GAYe
         zrkYQJHyxm97EOjuCUX2SAYrPT4DWXVB25r6iTIJUv6Kjq0vshUZHGcYqwB2yG8lR/6E
         N+lVTl8toihqAHCOMpKi6Ev0DJ1RQvPbzSOwfpLkuf9V+G3gEYFHj2tGctXGdG7W2lS0
         sbntSiYXFg4vjVnVNeCGPjTbOe4xPpMeHFUIx1N/AHtko2FKDSuP1876mHoleps2Y+/a
         eu8w==
X-Forwarded-Encrypted: i=1; AKwUvBzGFzGVh27IyEgFPos6GZknPg1O6EbbnO+jiGR7+RgfXT8IZ/v/CNuc3MvrHtz3z3gMd9eSgJezNWGjwg==@lists.linux.dev
X-Gm-Message-State: AFuF++nuwPlA4PQvapM/oJdhbl9pw0pmGmXKswee2Hi5VCelj3HFt/5o
	PD0PvwDnJqEImgfqXkfMGrfn/Zxd234DISy1+QTGFpoIpShq4uY5AH9ChSGoYlBYSA==
X-Gm-Gg: AYBFou1Auntyo+49bW9AILN5ZSJPj3B3VB8JL5IkW1C+N2T9VHFinK+Zmht/SAgtS3Y
	LRW+AYIYrQ0D0aI+RTdSBgkiND3uMmckhFK5/VXQz5/twqA6dLn0nZa+AuXjR2OpHGF5F1+JvSY
	fkSwdW+y++lXVwS2Dkg5wBxG63r/S2UM3faV0WWhK6uD8QtwgcNLWw/ovwkaqwp5UyatsY2OSqu
	H31Y+CaAsfMsQwMHbFRpKN5wkJRAlQ5KGW59lG9sVSxQD4ZvRsc4wQK9Xus6L78bkuGpTZEeaQF
	9+DZ5ltsTrRVz87IKt0TMYaoQclQva0tVi/QkrQYmwWdpZ3yt3MXZTG2oxyqtDG8vFw4PzT/bVb
	Opzz/uDb/y9TWKR/FQpUwzkD9mNK8yjYnc8vz2LOr0LvUKwicuiE6Fei0SsqwdTRDfidaSO9oTO
	C8HggPQGLrvG+Gspj58w8pgyUMMcMse8QKbO2N9vyrq6Q7DP8RJGhkH6NRd7gnxtdDnc3yKGxy0
	fi3B6BfzWXzzebHLX6MhhxzA5xYSWhzj+X6vjR86H0u
X-Received: by 2002:a17:90b:1d52:b0:38f:de97:b06 with SMTP id 98e67ed59e1d1-39b260d338bmr6986016a91.5.1788511386742;
        Fri, 04 Sep 2026 01:43:06 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:201d:8:343:bf21:3095:9c5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b260fdf9asm3343538a91.9.2026.09.04.01.42.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Sep 2026 01:42:36 -0700 (PDT)
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
Subject: [PATCH v8 05/16] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Fri,  4 Sep 2026 16:41:44 +0800
Message-ID: <20260904084158.1341550-6-wenst@chromium.org>
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
index 16e03ec8d1ab..c19c9912c740 100644
--- a/drivers/usb/core/hub.c
+++ b/drivers/usb/core/hub.c
@@ -1870,6 +1870,7 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
 	struct usb_host_interface *desc;
 	struct usb_device *hdev;
 	struct usb_hub *hub;
+	int ret;
 
 	desc = intf->cur_altsetting;
 	hdev = interface_to_usbdev(intf);
@@ -2001,14 +2002,15 @@ static int hub_probe(struct usb_interface *intf, const struct usb_device_id *id)
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
2.55.0.979.g7e5102b832-goog

