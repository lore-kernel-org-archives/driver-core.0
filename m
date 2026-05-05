Received: from mail-dl1-f51.google.com (mail-dl1-f51.google.com [74.125.82.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6499386C37
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 11:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777979929; cv=none; b=AMoub/WnR3gpM0q29DgGt70Mszq0XHekRauYGkQjCa7xFE2M2EVrXA4S3u7fHqs4HkEtRQ88TXK0+6nJzGln98bZM5vCVtfvVi+Mdrl1cNbdGZJopNN9qcQPNk9CMrWzGE4NQ+qzCcHP5q+iI3n317kwZZESXszgmw10fGxX1ts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777979929; c=relaxed/simple;
	bh=a9fvkD4KH9FZe3Nqu5/OHzOriThojqtxcfZpjbFhSl8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eqKb5LoT9uLn9fJN13hWNvV4mPPJnQ0rljDNTnBMM//mTFwtqFHsAS/vfTHoEoC+uFBNhT6xAz/5pEYBwfQPxClf1hiu1+gXlvtZcDoDqTrrmGP+xDKZn0JOG082/PBU5Pt3MWT5uPTUcnRG1aCkLDl2A4PzFakn1W4tpC4Ib7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H2etK/R2; arc=none smtp.client-ip=74.125.82.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H2etK/R2"
Received: by mail-dl1-f51.google.com with SMTP id a92af1059eb24-12c45281a06so7931888c88.1
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 04:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777979926; x=1778584726; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5MSjy81zKyUdXTwr06hbW0c64AcMNVfJ6CrHzTpndtM=;
        b=H2etK/R29UTFJCN5Otz3JyIX8Rt1MQEBvwcc/lYkUgBGkx0HvGTO2pTziwGS39ryd1
         dLeCM8K9I4zYfacdJ4R26AAUUE8YIWs0XUmlONFaiteFiUfVJ6NmIkdBzV0ugp2PIud5
         xCPMARtXFdz2eshfalS9lgmVapohyK/XK2AP+vZwkJSyacroMhyzmhmiu6xAa4JeMcGW
         /zzsMtq8wcHDdVezjlDDa0cSsmgyUWbbvWD9BHVM/Xum+A9GDp4LnBTT6VFpu1AREY73
         I4PBrjE80GakmILiidf6CLMKBsGpgI8H/3A2uuNcc0XUXC35d8OG/DPCbHWo4+UEoI0Q
         If/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777979926; x=1778584726;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=5MSjy81zKyUdXTwr06hbW0c64AcMNVfJ6CrHzTpndtM=;
        b=RYTTDaQODfryqJgsjUJ91Jn8LFlVT0l1ZPa97UMnBjfjOhTQNkuO9BDCMUmXCPj5+S
         nE6MawbuzMCebvpw5aYB1TSrA5mF5w9tWstkrvEdhp85GPHwcJOAxfTFPrVFJawCT3Sh
         7q+Prm3A15jvakUvMIXGyCSTt0yhKCODAI3eG/+HDj16aRJdekF24Pi7IlIhX1CuhOkp
         KY1bKLZeikLVzMb5rCMWFYG0Du5S3uqoMAHJgVMIQjf15nVdmF2IKA9dtRziz5r3yb8/
         efMZKjSmgKy/8iWv1pM7bUkXB2zD0i2BMAfiuMa2pABmkwmfcynM4YJW+Z4Q9YT0S6/p
         iDyA==
X-Gm-Message-State: AOJu0YxMd/y4Mw7ysC44Y8cH2gdX9D+4R16Mi7rvxNQq9d+GpqK4B6H2
	xukodqZjaZKJBljdGDHHfQi6ypKFGmqNUZiYf4aMI1mdsceOiHAFLN4o1550JEIJ
X-Gm-Gg: AeBDieuJd5tIBYG26clYax9VctSdFHFAqurhOTluYo09Kwf9cF7gZN0xy2aGi1jvU9Y
	NPP4S4Sd2TDRH+Z0Pm5rBSKhNS5jFGuqSuXvGZ4cbqF/vdEr606Uc73ScYa2iQ2PElwfGERZt+8
	HrZ5ubmq5ZaD7CTn0mEk6WVJ6S6S5L+ttugml0OPIipFvbr4EmGZy3w0Ch1myVCvuPVq+zF9MJj
	Jzn25l0ZTLH10y/SoHjkAEO2KFFkwhMzqcIRMvt9xFE6fIHaGOjVhdwbAScECdcQNb7YMIuieHh
	2l4kDXDocWgXM5OiJ8V3600hCXflM4MGUp3wl31vQUgk8QHe4DwIr40MvP1gqLVwY+0TLUgjKXy
	ySNlVLeiPC1hKfEvjmmY0YuYkGtwcrCL+7Z2GmNyDPn1EO7JyGUnguoNf1XO0mk+S0nOtwg3NRB
	MZOb8bH9owmwTBbHCD0JRne76oUBPpjpszgIf4QyrrF9FB255nlkKwiuSOHcuyRN1Hv6LjQmyWN
	ucz98R7PXC8nQquT3dNDwU=
X-Received: by 2002:a05:7022:2387:b0:130:6978:c96 with SMTP id a92af1059eb24-130b194cca5mr1148049c88.19.1777979925927;
        Tue, 05 May 2026 04:18:45 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df828849dsm17247290c88.5.2026.05.05.04.18.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 04:18:45 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Tue, 05 May 2026 08:18:16 -0300
Subject: [PATCH v4 1/2] firmware_loader: Add cancel helper for async
 requests
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-1-e7c4bf930dc8@gmail.com>
References: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
In-Reply-To: <20260505-alsa-hda-tas2781-fw-callback-teardown-v4-0-e7c4bf930dc8@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5767;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=a9fvkD4KH9FZe3Nqu5/OHzOriThojqtxcfZpjbFhSl8=;
 b=kA0DAAoW0F0/Glr/7oMByyZiAGn50g2gjQO7w5WWhszZoLfXBRF+JeE/Ai0Wa3ZNDfsXBJERj
 oh1BAAWCgAdFiEEq2KiObyK4NV/XqhI0F0/Glr/7oMFAmn50g0ACgkQ0F0/Glr/7oMSIgD/bmKi
 o2ek+IV6qnTy6EjSnksJ3C1lP8gXpxHHSSmDMY8BALp0JCs7AQo+7zUYSEhzV/UTffRlLFB2Rvn
 y5rkEZgAI
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

request_firmware_nowait() keeps the callback module pinned and holds
a device reference until the firmware work completes.

Callers still have no way to cancel or synchronize the queued callback
before tearing down their driver-private state.

Track scheduled async firmware work in an internal list and add
request_firmware_nowait_cancel(). The helper cancels work matching the
device, callback context and callback function. It cancels work that has
not started yet and waits for an already-running callback to return. If
the request has already completed, it is a no-op.

Keep the existing request_firmware_nowait() lifetime model manual. A
devres-managed variant can be layered on top separately if needed.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 drivers/base/firmware_loader/main.c | 68 ++++++++++++++++++++++++++++++++++---
 include/linux/firmware.h            | 10 ++++++
 2 files changed, 74 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23b..78c5f05a2ec1 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1132,6 +1132,7 @@ EXPORT_SYMBOL(release_firmware);
 /* Async support */
 struct firmware_work {
 	struct work_struct work;
+	struct list_head list;
 	struct module *module;
 	const char *name;
 	struct device *device;
@@ -1140,6 +1141,17 @@ struct firmware_work {
 	u32 opt_flags;
 };
 
+static LIST_HEAD(firmware_work_list);
+static DEFINE_SPINLOCK(firmware_work_lock);
+
+static void firmware_work_free(struct firmware_work *fw_work)
+{
+	put_device(fw_work->device); /* taken in request_firmware_nowait() */
+	module_put(fw_work->module);
+	kfree_const(fw_work->name);
+	kfree(fw_work);
+}
+
 static void request_firmware_work_func(struct work_struct *work)
 {
 	struct firmware_work *fw_work;
@@ -1150,11 +1162,15 @@ static void request_firmware_work_func(struct work_struct *work)
 	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
 			  fw_work->opt_flags);
 	fw_work->cont(fw, fw_work->context);
-	put_device(fw_work->device); /* taken in request_firmware_nowait() */
 
-	module_put(fw_work->module);
-	kfree_const(fw_work->name);
-	kfree(fw_work);
+	spin_lock_irq(&firmware_work_lock);
+	if (!list_empty(&fw_work->list)) {
+		list_del_init(&fw_work->list);
+		spin_unlock_irq(&firmware_work_lock);
+		firmware_work_free(fw_work);
+		return;
+	}
+	spin_unlock_irq(&firmware_work_lock);
 }
 
 
@@ -1164,6 +1180,7 @@ static int _request_firmware_nowait(
 	void (*cont)(const struct firmware *fw, void *context), bool nowarn)
 {
 	struct firmware_work *fw_work;
+	unsigned long flags;
 
 	fw_work = kzalloc_obj(struct firmware_work, gfp);
 	if (!fw_work)
@@ -1196,7 +1213,12 @@ static int _request_firmware_nowait(
 
 	get_device(fw_work->device);
 	INIT_WORK(&fw_work->work, request_firmware_work_func);
+
+	spin_lock_irqsave(&firmware_work_lock, flags);
+	list_add_tail(&fw_work->list, &firmware_work_list);
 	schedule_work(&fw_work->work);
+	spin_unlock_irqrestore(&firmware_work_lock, flags);
+
 	return 0;
 }
 
@@ -1259,6 +1281,44 @@ int firmware_request_nowait_nowarn(
 }
 EXPORT_SYMBOL_GPL(firmware_request_nowait_nowarn);
 
+/**
+ * request_firmware_nowait_cancel() - cancel an async firmware request
+ * @device: device for which the firmware is being loaded
+ * @context: context passed to request_firmware_nowait()
+ * @cont: callback passed to request_firmware_nowait()
+ *
+ * Cancel a pending request_firmware_nowait() request for @device, @context
+ * and @cont. If the associated work has already started, this function waits
+ * until the callback has returned. If the callback has already completed, this
+ * function does nothing.
+ *
+ * This function may sleep.
+ */
+void request_firmware_nowait_cancel(struct device *device, void *context,
+				    void (*cont)(const struct firmware *fw,
+						 void *context))
+{
+	struct firmware_work *fw_work = NULL;
+	struct firmware_work *tmp;
+
+	spin_lock_irq(&firmware_work_lock);
+	list_for_each_entry_reverse(tmp, &firmware_work_list, list) {
+		if (tmp->device == device && tmp->context == context &&
+		    tmp->cont == cont) {
+			fw_work = tmp;
+			list_del_init(&fw_work->list);
+			break;
+		}
+	}
+	spin_unlock_irq(&firmware_work_lock);
+
+	if (!fw_work)
+		return;
+	cancel_work_sync(&fw_work->work);
+	firmware_work_free(fw_work);
+}
+EXPORT_SYMBOL_GPL(request_firmware_nowait_cancel);
+
 #ifdef CONFIG_FW_CACHE
 static ASYNC_DOMAIN_EXCLUSIVE(fw_cache_domain);
 
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index aae1b85ffc10..0fa3b027f02f 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -110,6 +110,9 @@ int request_firmware_nowait(
 	struct module *module, bool uevent,
 	const char *name, struct device *device, gfp_t gfp, void *context,
 	void (*cont)(const struct firmware *fw, void *context));
+void request_firmware_nowait_cancel(struct device *device, void *context,
+				    void (*cont)(const struct firmware *fw,
+						 void *context));
 int request_firmware_direct(const struct firmware **fw, const char *name,
 			    struct device *device);
 int request_firmware_into_buf(const struct firmware **firmware_p,
@@ -157,6 +160,13 @@ static inline int request_firmware_nowait(
 	return -EINVAL;
 }
 
+static inline void request_firmware_nowait_cancel(struct device *device,
+						  void *context,
+						  void (*cont)(const struct firmware *fw,
+							       void *context))
+{
+}
+
 static inline void release_firmware(const struct firmware *fw)
 {
 }

-- 
2.54.0

