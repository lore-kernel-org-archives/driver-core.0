Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E87E387364
	for <driver-core@lists.linux.dev>; Fri,  1 May 2026 10:26:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777631172; cv=none; b=q647uKABd+cybW4230CoiXDgCpbTx+65MDX5+MYi2PFF7gKeywmNQzub8zVcf6C7R8BZBgcVBciRH3hUuOhn80VHlap29I/hcJJHjYYL6TJCebhxcXp0ZW+SVmJVmvkKcWyqCG2U9UmzeH59SPLYMFVTCx0UwcJgD1WePeO3ICY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777631172; c=relaxed/simple;
	bh=lkrOfQejoOQtc0UD8vdaZKSDo8iZxAifYR7cbfqlCuw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lTwwHhU3GUraoPYXD7Y+AtV9TolILL7AdMHpo8dzNY6ofdIEKQaW6xlh4o2TBZ3C6eJWvDvF2qL6h3WeXojUlbnyyvsSLgiaueHB3sVzSBrJXE128yzZJv3T462blKaum97hiezx7X22fohIcP3lgX2WR9or+jHF9eFunTW8gCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tGe82/TU; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tGe82/TU"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12db2e415a7so1133831c88.1
        for <driver-core@lists.linux.dev>; Fri, 01 May 2026 03:26:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777631170; x=1778235970; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=J/VNZZNNKrMdoG7xQ2QOv9i/OiKP564yp95Gw5x5J8s=;
        b=tGe82/TUb7kiy/EnyyvoZulchbAy1phnsNoUVGVvtiWrk+aOipAqGAJUTGtkcLiqpd
         aIzKpUfgfzFyZKe5MSJ6KavrpXe2H6emkycOAYwM7dbURYauBmhZ/L5tr+6xVMlfm3Qu
         E64vEZSZ95Hz0HMOTV3ln+YdgXRCIZ84e3a7vJl5F36gAqFBzjkG13vXZbIUQoXjV5nP
         Q8g2zwdOX9607S8rFlSRvRLm6mjg00GNJqCQWEuQ5z2iiQFOeHXhBzq/okDLYMX0+AkT
         Lx3gE6tj7O1R+UYIPRe7/Iaq74wX7ExCYimYGgw6Qi/qpN7u/8wcaXndkSB9Ixy9gXgx
         SLTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777631170; x=1778235970;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=J/VNZZNNKrMdoG7xQ2QOv9i/OiKP564yp95Gw5x5J8s=;
        b=ApoTwmj2jynZlCUycsvZaolDVb8MIgDaFovW6VBO45kpE1Yx0bPWDV+d7ymTvgRxVC
         i9n+UPkKRsGuJgGq3jimGngsFT/0ie5kUc+ny9DuUzsgvk0GB1nVMmE+qD1sg8jSdGti
         q5LmmF1kHswg8WkxR6AOzENK7sOCikBwyVSiQcslKNtUsZuqEGk1LPV3C+vqF1D299vB
         yxHNCzhshQ/zd92MP42n3wRQHf7RbXXfFtWhK9uuJj5CQzJiR/A+CLD2Gnop5AEcftxO
         pspj4GU134Rxq6ixE2i4RLDugnVqO8T1TJQOKaYKV5+2GxYgnVXrrqZLOXWKuuEXHoyb
         LFKA==
X-Gm-Message-State: AOJu0YyFPYKKjmYsYfophPs8Y2uPBQBB5gQqpaxKRDZGgm3mxWuBjJvu
	ZYDtaRGoDHiZN7BWSrbrzGWy5VinP0hfvjB/6DDIiAKOhKmQSdR9iBVK
X-Gm-Gg: AeBDiev7NyBNzZYsoGXcgpantDqnpn3W0ub/5ir8VHevu75SggkchPBIc7CmKfS47Qm
	ayuzOz0pOBZF4afmJevhGqi6pw72mm3pJWuTjCckyzYtvMnkFDDc90CgF+7Y2zGl/q4mQ6OD9uc
	ZUJcmauPcXN0N94uci6Zh70k5beKX1hmGhWvFnJXD3ETC6iO1czWz/i81BVF+Bi9OW7EWnbBvhA
	yeUJmdAtFhci8H2OBYGkRMVyHUZ00adZHoxgIegE51oWB2Us0m/mYa+UbztcY7V2KTwqj+6iYyZ
	yb1F6mQt0q704x8lRF40fSmOS+W4CXtuRtj/mFkvaWlJpY0yO+p18+I0DQxGWc7l1+L/8M4Iqoa
	HfbGzp8RptpigZU35h/IUF2nWZxZWqrV53XTXi1mgT/yyqGsT2FsB/R9I1edcF1gt9u1Ss49iSw
	1NyfwPewXqxqWQibWdIJsCLGk31LjzuA1EVeQSOyqCWX6pD0p7P2UzSYsuID1MQxuIpx9wMByW1
	SIbKU09j5IP
X-Received: by 2002:a05:7022:e17:b0:12d:de3f:f3e6 with SMTP id a92af1059eb24-12dead2545cmr2631963c88.38.1777631170377;
        Fri, 01 May 2026 03:26:10 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12df84250f1sm2621191c88.11.2026.05.01.03.26.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 May 2026 03:26:09 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Fri, 01 May 2026 07:22:12 -0300
Subject: [PATCH v3 1/2] firmware_loader: Add cancel helper for async
 requests
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-1-8d9f873b97bd@gmail.com>
References: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
In-Reply-To: <20260501-alsa-hda-tas2781-fw-callback-teardown-v3-0-8d9f873b97bd@gmail.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5907;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=lkrOfQejoOQtc0UD8vdaZKSDo8iZxAifYR7cbfqlCuw=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJlf6nfYvvoa+8m4+mtj7bnFuRx7vvbsOivC+fha84yFv
 zwMjBxvdJSyMIhxMciKKbKsTlpkuafrwdX6uBUeMHNYmUCGMHBxCsBErlxn+J9icWenHFPilZQD
 LrLL3Y+yvVOdkfojzejiDvEZ5U7f+qsYGVadePffOn1mzPMPSfkn65nOX0/bkTtR3mStV1efqaH
 QdxYA
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
 drivers/base/firmware_loader/main.c | 71 ++++++++++++++++++++++++++++++++++---
 include/linux/firmware.h            | 10 ++++++
 2 files changed, 77 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23b..bd890f103b2f 100644
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
@@ -1140,21 +1141,37 @@ struct firmware_work {
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
+}
+
 static void request_firmware_work_func(struct work_struct *work)
 {
 	struct firmware_work *fw_work;
 	const struct firmware *fw;
+	unsigned long flags;
 
 	fw_work = container_of(work, struct firmware_work, work);
 
 	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
 			  fw_work->opt_flags);
 	fw_work->cont(fw, fw_work->context);
-	put_device(fw_work->device); /* taken in request_firmware_nowait() */
 
-	module_put(fw_work->module);
-	kfree_const(fw_work->name);
-	kfree(fw_work);
+	spin_lock_irqsave(&firmware_work_lock, flags);
+	if (!list_empty(&fw_work->list)) {
+		list_del_init(&fw_work->list);
+		spin_unlock_irqrestore(&firmware_work_lock, flags);
+		firmware_work_free(fw_work);
+		kfree(fw_work);
+		return;
+	}
+	spin_unlock_irqrestore(&firmware_work_lock, flags);
 }
 
 
@@ -1164,6 +1181,7 @@ static int _request_firmware_nowait(
 	void (*cont)(const struct firmware *fw, void *context), bool nowarn)
 {
 	struct firmware_work *fw_work;
+	unsigned long flags;
 
 	fw_work = kzalloc_obj(struct firmware_work, gfp);
 	if (!fw_work)
@@ -1196,7 +1214,12 @@ static int _request_firmware_nowait(
 
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
 
@@ -1259,6 +1282,46 @@ int firmware_request_nowait_nowarn(
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
+	unsigned long flags;
+
+	spin_lock_irqsave(&firmware_work_lock, flags);
+	list_for_each_entry_reverse(tmp, &firmware_work_list, list) {
+		if (tmp->device == device && tmp->context == context &&
+		    tmp->cont == cont) {
+			fw_work = tmp;
+			list_del_init(&fw_work->list);
+			break;
+		}
+	}
+	spin_unlock_irqrestore(&firmware_work_lock, flags);
+
+	if (!fw_work)
+		return;
+	cancel_work_sync(&fw_work->work);
+	firmware_work_free(fw_work);
+	kfree(fw_work);
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

