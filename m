Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB3B03BA25B
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 21:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777583732; cv=none; b=qeYG/Lu3EKLO1sM5YY+aGa05dsXyNGDxkn1QCXSmZcbzrcR7XBdz0OzJ5v2P1u/QRtRen7k0zv2oQgQBH9Zt10rdrKozCPtpTDvB+Ra2wXosWXOKchJrDYxjIK85CdtuS1jpD+XtJ5J5z1sTtjvqe+Ia/1uIdFMXzE6n+/ty/Xs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777583732; c=relaxed/simple;
	bh=BN5ueWQJ5UCvj7amzpZ4Tl+GzvSYKqtZXakjbyID2uA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dKvpt1LHJc84y8VWQ39bgGE+SfqZXVmZxM98a+jB272QkpqjO5QADozI2d9LE723eneLjDqCps2hoaLYcrY+BJM3BC5NzCvz8kzk8p7HB3grYeHbxK8QmGnXXRMZIX+Jrv+PI8D1GYFul8puM9czQVZkmQ78byW8DkU2pPeFF24=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B/C/tS6V; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B/C/tS6V"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ba9c484e5eso1643029eec.1
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 14:15:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777583727; x=1778188527; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WhEnXpcubRBw0ZYj7SBybvpNtrwaT7DIm0tUKJlUVgM=;
        b=B/C/tS6Vg7k/5VNELWYuaSzkjHrjnBspKwyvCYOOjphoUXVpOQjIc2ywcQAlD7rh2e
         X9/Y5dF4prcEczi3mWrCSQmWB7m50pda0gWNAMlFjK5UfHF5XETR7kkosnOl+dZd5oZp
         WiFBvmJ75AryjrLNykis0b7p1oskkO21WlYNv6DHrzzOucSn2sYIMNSCdMYvZTdz3Pfh
         f77xIqyfn3+n3YNnG93QA7SjWyzg91YrGI/mGdgDVEScmIuNDjNgUWSa+/I9SliiPUfM
         OvoPSB5vatRXxcITpzWcEaF8MeSPp3UpnY12j5UE01n4ufsv0ICWLWTYBXeFmHIiIQLP
         +Ffg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777583727; x=1778188527;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WhEnXpcubRBw0ZYj7SBybvpNtrwaT7DIm0tUKJlUVgM=;
        b=LujmRcizACbBBzdKbqm5kPmD8Rsv78I+Mr0UAuPjRU0bFT9uyhMUhrzurFi4lZG5Vi
         bsnAUMvIbwBzmXrOvpQCw2Vv9yrHNAkkE3G8Rdu0e0enyBE5yUGtuy19ok+FY/ut7O1X
         SWowUZN0QRlSfozjQeMhYEnnd0s5z2ObRs4w+/y5o5DKZ8wl1jxyznzSnrOURcJ/Hm+m
         dwI0MptbDRL+shQXeDMoUy2OmynnB2JwgD0awSI7ruoopbA8wdy50ERxjhKfD7ZLX0Ax
         GqtkpmhqUOg9oK7JGYCNgRRRL/ieuymrxlGYMyuSnI5NgGbU5jBD1lxzPQ8L+7iFJGmk
         OEtA==
X-Gm-Message-State: AOJu0Yy06dpI9Kmoab7Gi04M4hRDkXtYMxjTAjUSK+UJ29g6+bBUIz1A
	qlDLBMFfpyQFq5YxfLprUz1z33WJERJifk5jWK517j4U9AEH03JrMXxS
X-Gm-Gg: AeBDietNSn9F/Oo6dStJS6Gfo/l+Uvo1kmjxsnhYUrVZnsL5mRHUPbaQoFiMVjYG3DF
	EaMQR0NPeDpbN+5nhEuoT8DUtGr46dWvKd0omNnLusnj+9g3DmsmcFsRDPgvhsu9PIHLek3TaHS
	Jm9d7aDaBSjxr94AsgBo+RQvajMpIOQy1chKj6TVLNMpozem+rUu+ieXTjd9rEtnU71yVZqSGK6
	4XxqlYGmtzO6vTAJmssSIUfpbm5NeNjqFG/dL/CnbOOEORPy5MYZlXKuCLin5mcrFryyTvqvtui
	o/XcgNaJdbTvqi19BOrp73p7j8i0WNlnP6j7WyxFtr+xnOAmLnEnQ+bqyEx5wxZlg2kQSKLgGJR
	a2T/6EssexSR+ig3/Ox6baXDvaypFUEbIyL6TU1v109csYFsDeTm8nYlP+oJiqrXvG9DdS+xlDh
	vyi57r+gxbZSd8OiJ/0ATsqQq2NZ2a6kzEBIpYjc2utlQSCFPlXtkhasTOOBTS7PQ5cHjX0xizC
	c9TYKe7uAoG
X-Received: by 2002:a05:7300:cac8:b0:2d9:2b54:ea9c with SMTP id 5a478bee46e88-2ed3f15d505mr2387958eec.18.1777583726713;
        Thu, 30 Apr 2026 14:15:26 -0700 (PDT)
Received: from [192.168.1.18] (177-4-161-87.user3p.v-tal.net.br. [177.4.161.87])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ee3b783a95sm1581959eec.22.2026.04.30.14.15.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Apr 2026 14:15:26 -0700 (PDT)
From: =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
Date: Thu, 30 Apr 2026 18:15:10 -0300
Subject: [PATCH v2 1/2] firmware_loader: Add cancel helper for async
 requests
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-1-2c7d89cb3175@gmail.com>
References: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
In-Reply-To: <20260430-alsa-hda-tas2781-fw-callback-teardown-v2-0-2c7d89cb3175@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>, 
 Russ Weight <russ.weight@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, Kevin Lu <kevin-lu@ti.com>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, Takashi Iwai <tiwai@suse.de>, 
 =?utf-8?q?C=C3=A1ssio_Gabriel?= <cassiogabrielcontato@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6044;
 i=cassiogabrielcontato@gmail.com; h=from:subject:message-id;
 bh=BN5ueWQJ5UCvj7amzpZ4Tl+GzvSYKqtZXakjbyID2uA=;
 b=owGbwMvMwCV2IdZeKur/u2bG02pJDJmfj6UYvvw3P+ZXfilTT/xBR/fD5mkL1vFMvFI+sfZjq
 Mt0RbH7HaUsDGJcDLJiiiyrkxZZ7ul6cLU+boUHzBxWJpAhDFycAjARC2ZGhlM3BWcKeTX/f7n/
 Zvh7PvGUTcKhO1coMn31fqJ/fK7iZXtGhh/GuwNPWVn0CC598XX3Tok3iqU77NTkZzq116/pra8
 9wQYA
X-Developer-Key: i=cassiogabrielcontato@gmail.com; a=openpgp;
 fpr=AB62A239BC8AE0D57F5EA848D05D3F1A5AFFEE83

request_firmware_nowait() keeps the callback module pinned and holds
a device reference until the firmware work completes.

Callers still have no way to cancel or synchronize the queued callback
before tearing down their driver-private state.

Track async firmware work with devres and add
request_firmware_nowait_cancel(). The helper cancels work that has not
started yet and waits for an already-running callback to return. If the
request has already completed, it is a no-op.

The devres release path uses the same synchronization so device teardown
cannot free the firmware work state while the queued work can still run.

Signed-off-by: Cássio Gabriel <cassiogabrielcontato@gmail.com>
---
 drivers/base/firmware_loader/main.c | 82 +++++++++++++++++++++++++++++++++----
 include/linux/firmware.h            |  9 ++++
 2 files changed, 83 insertions(+), 8 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index a11b30dda23b..d7d80949ecd7 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1140,6 +1140,30 @@ struct firmware_work {
 	u32 opt_flags;
 };
 
+static void firmware_work_free(struct firmware_work *fw_work)
+{
+	put_device(fw_work->device); /* taken in request_firmware_nowait() */
+	module_put(fw_work->module);
+	kfree_const(fw_work->name);
+}
+
+static int firmware_work_match(struct device *dev, void *res, void *data)
+{
+	return res == data;
+}
+
+static void firmware_work_release(struct device *dev, void *res)
+{
+	struct firmware_work *fw_work = res;
+
+	/*
+	 * Devres release can run before the async work has completed, so
+	 * synchronize it before dropping the references used by the worker.
+	 */
+	cancel_work_sync(&fw_work->work);
+	firmware_work_free(fw_work);
+}
+
 static void request_firmware_work_func(struct work_struct *work)
 {
 	struct firmware_work *fw_work;
@@ -1150,11 +1174,16 @@ static void request_firmware_work_func(struct work_struct *work)
 	_request_firmware(&fw, fw_work->name, fw_work->device, NULL, 0, 0,
 			  fw_work->opt_flags);
 	fw_work->cont(fw, fw_work->context);
-	put_device(fw_work->device); /* taken in request_firmware_nowait() */
 
-	module_put(fw_work->module);
-	kfree_const(fw_work->name);
-	kfree(fw_work);
+	/*
+	 * If teardown already removed the devres entry, it owns the final
+	 * cleanup after cancel_work_sync() waits for this worker.
+	 */
+	if (devres_remove(fw_work->device, firmware_work_release,
+			  firmware_work_match, fw_work)) {
+		firmware_work_free(fw_work);
+		devres_free(fw_work);
+	}
 }
 
 
@@ -1165,14 +1194,14 @@ static int _request_firmware_nowait(
 {
 	struct firmware_work *fw_work;
 
-	fw_work = kzalloc_obj(struct firmware_work, gfp);
+	fw_work = devres_alloc(firmware_work_release, sizeof(*fw_work), gfp);
 	if (!fw_work)
 		return -ENOMEM;
 
 	fw_work->module = module;
 	fw_work->name = kstrdup_const(name, gfp);
 	if (!fw_work->name) {
-		kfree(fw_work);
+		devres_free(fw_work);
 		return -ENOMEM;
 	}
 	fw_work->device = device;
@@ -1184,18 +1213,19 @@ static int _request_firmware_nowait(
 
 	if (!uevent && fw_cache_is_setup(device, name)) {
 		kfree_const(fw_work->name);
-		kfree(fw_work);
+		devres_free(fw_work);
 		return -EOPNOTSUPP;
 	}
 
 	if (!try_module_get(module)) {
 		kfree_const(fw_work->name);
-		kfree(fw_work);
+		devres_free(fw_work);
 		return -EFAULT;
 	}
 
 	get_device(fw_work->device);
 	INIT_WORK(&fw_work->work, request_firmware_work_func);
+	devres_add(device, fw_work);
 	schedule_work(&fw_work->work);
 	return 0;
 }
@@ -1259,6 +1289,42 @@ int firmware_request_nowait_nowarn(
 }
 EXPORT_SYMBOL_GPL(firmware_request_nowait_nowarn);
 
+static int firmware_work_cont_match(struct device *dev, void *res, void *data)
+{
+	struct firmware_work *fw_work = res;
+
+	return fw_work->cont == data;
+}
+
+/**
+ * request_firmware_nowait_cancel() - cancel an async firmware request
+ * @device: device for which the firmware is being loaded
+ * @cont: callback passed to request_firmware_nowait()
+ *
+ * Cancel a pending request_firmware_nowait() request for @device and @cont.
+ * If the associated work has already started, this function waits until the
+ * callback has returned. If the callback has already completed, this function
+ * does nothing.
+ *
+ * This function may sleep.
+ */
+void request_firmware_nowait_cancel(struct device *device,
+				    void (*cont)(const struct firmware *fw,
+						 void *context))
+{
+	struct firmware_work *fw_work;
+
+	fw_work = devres_remove(device, firmware_work_release,
+				firmware_work_cont_match, cont);
+	if (!fw_work)
+		return;
+
+	cancel_work_sync(&fw_work->work);
+	firmware_work_free(fw_work);
+	devres_free(fw_work);
+}
+EXPORT_SYMBOL_GPL(request_firmware_nowait_cancel);
+
 #ifdef CONFIG_FW_CACHE
 static ASYNC_DOMAIN_EXCLUSIVE(fw_cache_domain);
 
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index aae1b85ffc10..ce55b4987726 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -110,6 +110,9 @@ int request_firmware_nowait(
 	struct module *module, bool uevent,
 	const char *name, struct device *device, gfp_t gfp, void *context,
 	void (*cont)(const struct firmware *fw, void *context));
+void request_firmware_nowait_cancel(struct device *device,
+				    void (*cont)(const struct firmware *fw,
+						 void *context));
 int request_firmware_direct(const struct firmware **fw, const char *name,
 			    struct device *device);
 int request_firmware_into_buf(const struct firmware **firmware_p,
@@ -157,6 +160,12 @@ static inline int request_firmware_nowait(
 	return -EINVAL;
 }
 
+static inline void request_firmware_nowait_cancel(struct device *device,
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

