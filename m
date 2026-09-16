Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 499EE45C70E
	for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 07:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789545548; cv=none; b=ILFwUMABLnxAyKlbm/ngdEOmvySY7xYG0KqTqqgRq537qdeOyo9ulOVGxRRAe6mp+V/oLDw5zdhhIStHXJo5xENSNGhgfMvJSCrVLCBYZf7gbHwjSkTCFs+fDvSHk8kS2PoWRuAXUflcuur1rz3yuU9xxL+u58+OfgcbgEhn3Tg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789545548; c=relaxed/simple;
	bh=PPQwnBevhndYutuKDdDvehHKW7FqGHGO5QlRVDsedNs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PWRJ+LSly+nUy7ewsUVbGX/OSPjCN32+J6akRQVpwsvr4XbWJER1Dq0aJZSjovJyo43lQandJWz5kQcLa25IPIVOT3qpbSX1l6u4vleiYqxkpBxca1IBNzfbWHBsD0lq2yQhFdRZ8O9+K1N8idt7k7EM1hQ1Cld+RHgKOaFmUYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=LbC7urwk; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="LbC7urwk"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d747ec6188so4526775ad.3
        for <driver-core@lists.linux.dev>; Wed, 16 Sep 2026 00:58:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789545528; x=1790150328; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=;
        b=LbC7urwkt54gtXZ36B+LHP5XMH7hLdx9AubkCH1t4Acb2Ru9SQsJNvh5qIcQowPrkU
         PjboXSVlah7WEh4nTjViCVHTDrKytfrfOzhLBu1FQ9wiMcRjRHle0pGJ8w0Y19ebmSrm
         GcgUL6PB0QG169qIw5Z4UvL4w7a9R3pBeg1Oo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789545528; x=1790150328;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SWwi8XOZ6LU+PxR6btCprbkiTyl3Q4dICGc4z937Hmk=;
        b=LG8VRo/j1SsiOXFNnTv9zFOBzMjAnA8HW40qeOqfV1IzwAWrvn6z3zKccbOFByNZ1l
         YEZVnKCepncbQF7i9dr7oU4kCtwCA/y4IHOJY3b9SUmN7lPX/DPP47s2n1LC09e/Vqai
         CSBrXAW7LeHx8qGCUBKsyxt5jJLhWCrf+9dyjSQDRCYnuI/Q9Mt+6B9YIWsWf1+XV3VX
         vGunKNjw0b9UZ8pkow8UrxIu2Dl3wJfWoa/8CB6UyMHmPfruFfX+Qg8JCStKwYUvLIHT
         ZNCFqqIhG2vrgKIyiqX0cOcZ8SeBDUGFIHIULzXovtN3h1uadeYGdma0PSDFp8E3duzy
         fb6g==
X-Forwarded-Encrypted: i=1; AKwUvBxdDxQbb58AWI6qkAIsAXYe2h+KC90mc6vOjO0F8LQN3AccJSYZpEZwl3CHG+vbQvHNmaOq8iiHZbjwPA==@lists.linux.dev
X-Gm-Message-State: AFuF++nqEt074lmgFvLTv5bnc8c6HKfqBcQe/u3qYmT8ptYRfaBZ/2hJ
	Pd8/CtL7Vi7ZPMkizpanY+epyDGZ4lnz216UIapSvrUkHlQtuzcdBdRC+if2NPXesw==
X-Gm-Gg: AYBFou0Pto++EmDH2l1bY8GSGexuHxDU3dKL1oLyHx48TNeoXAsm1TVPKtp8miSBeQB
	DFENqd2eVySb23vuU0S4dqwWg7B1I+IRFh3iUxjnsu6R3pi88OZgmUPW0pZDuTn9seWFesAIGOk
	7Y11uAObIiV6akX3vCdU7Ta3XNbUpVztimvzs3IESqdWT6Ui9F9nZg2W/S7bUrwa8xo8atXXkJZ
	uIqA7P0Dk+Le+OWKiiQVMNI0SdHmq8T3fw4/iThpJqR1a884CiGGyXJ7iZ8zUY/JJumL1V309wd
	WbDtsjWTpu2F4KsSLTjIdRscRCkeVWQDca6K/W73haaVRLMF8B8sPnjV22/dCvjidjBvvfT8Kv7
	sM5b4A+Io2WV2zQIPy5qZ0VC9Xqo3OGLhp0I1nH1WQXJpYJ6qYPWBiNFJjXQVxJF39sL4v58ITJ
	wMDBU1LzkbQdEawziP2Ez8mQrZljxDhV2kzlCiS2pwgeQycP9J36LgNVyMTOYOS0M3v0nCFrmQ8
	uicW4kYmpW8K+msR60u9ESvbmQLC35SyguC5jr0zCEuYcnqbV6/d92a6VBMyd+hKl+j
X-Received: by 2002:a17:90b:39a3:b0:39e:233f:cee9 with SMTP id 98e67ed59e1d1-39e233fd063mr2563733a91.11.1789545528600;
        Wed, 16 Sep 2026 00:58:48 -0700 (PDT)
Received: from wenst-7875.tpe.corp.google.com ([2a00:79e0:203d:7:1f62:7622:5d61:2578])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e1b7acba2sm4348197a91.16.2026.09.16.00.58.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2026 00:58:47 -0700 (PDT)
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
Subject: [PATCH v9 05/15] usb: hub: Return actual error from hub_configure() in hub_probe()
Date: Wed, 16 Sep 2026 15:57:31 +0800
Message-ID: <20260916075745.3549953-6-wenst@chromium.org>
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
index a4ec79a06a5c..707eeee198b0 100644
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
2.55.0.1032.g73a4cd73de-goog

