Received: from mail-qk2-f42.google.com (mail-qk2-f42.google.com [74.125.230.234])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C6E513545
	for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 21:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.230.234
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790025505; cv=none; b=UrdznhibmJe0hk+tBPH728C2orUQwlt1e9A7som13V4jHsXq7UhOtnjqlcWBLKhRz0jSytuBiSoj1w8aVwqJS2Q9CiYm+ESieXEnGjmQ+elBR9iOJHNNFwfWk2DKuMNI1WhrBwBjFxqPwnMcy0Jj6leTFn289U+qtdLAr0M/qr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790025505; c=relaxed/simple;
	bh=lqlaVLAdW3RusXi9hr8ji68teprPCl9yDGSlYkQhc7E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=p/QREUHMFJdzbYuFB/y/YwvpOhJaLCwiHhqLxkC8PxhY5I4AMGD0hnGTepNQKnCx1WHka0YnFdpaz0jN5iD27DdkyPlYWWA+sEUAwoWlNhZiziYANh26OSYfjJxusRKZbQ9oJmGg9oKanlaC99aEG4qsidgbcYXuuP14cH9EWIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com; spf=pass smtp.mailfrom=brivo.com; dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b=D7Rcap8G; arc=none smtp.client-ip=74.125.230.234
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=brivo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brivo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=brivo.com header.i=@brivo.com header.b="D7Rcap8G"
Received: by mail-qk2-f42.google.com with SMTP id d75a77b69052e-52fb76ec395so29167341cf.2
        for <driver-core@lists.linux.dev>; Mon, 21 Sep 2026 14:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=brivo.com; s=google; t=1790025502; x=1790630302; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fy12LLLF40JV1TUAxtDh7xlRrhTU4s9UAumnOpBUKSE=;
        b=D7Rcap8GL+MEW9oe1mx1eXB/aH3G8XOiSKQQfDIz++mvj0zh2Oh33VZ4NGA4yW1R3A
         Xf6pNC23EdrhGln0cdQ29g0nOB9UoQwNBN8NWJZwcUyVq88QhEt5diXlQqUuJEZ76+O6
         +RFz3BVgx2FNbbCFDth75to2knysYaTb6TqFUJuylgHkVhOC431INLPy8RNRNWwYUm3F
         PFgP/FDoCP8Rau0yzOb7j9/FS+ooGCP5ToWN87QZBnZY4ZSvI3owrQony2vDJQjVwmHt
         tDjUZRGWtk1dZ2yYpn8+qjaylG+v2DMNKVpPBQGk++PqgWHpr1WEaKkrLQvEchYZh9PT
         pUAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790025502; x=1790630302;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fy12LLLF40JV1TUAxtDh7xlRrhTU4s9UAumnOpBUKSE=;
        b=jDCEzDOTdNWvDp1ycqaNM7zOtSCbAVFdaXrfWSpxD8t+h8T8JlhgL4I4k1fgebCIz+
         cNL7DpbHzJnayL4KeHpiTknpZvg2DNkfWeBgtD3TiJ38ytk73zG0SvoMh2AFW27UsgxC
         qKJR9ljKoLlhcDSrPisaJWXZJgiH1bAxsWDrSfw0iOH4AJYUiVsgEMpQoZHwUu1FX/JN
         rhMM2Vjo/OyIUNM4/swUel+8+FuTTaqILWSagkXkEVwh7a62ftK3rZ26PNX4RWylHJQv
         ubV0VyLy4TgHIIHi5nfmTAfNj3aeTrjtY+xREa0gXIDmCy4kEmECzf/+VnDuwcGdPUpL
         Bjjg==
X-Forwarded-Encrypted: i=1; AKwUvBxv7c0rNmBelENR0/zbjL2UO8sb83ye0IMpeN9u6cj7MOqPp97nE6TOJ0NkVGsKM0PErVs/ekcRzwP04Q==@lists.linux.dev
X-Gm-Message-State: AFuF++npWuYve+cO4SFneQsiiP+gEfmpQqlUOac9dlDMRk48rmTO8xrt
	L09Ge9pry+B0Bzd/99kluUpn/PVuMOvjWf0kEOaQG/YqjCyy6TrWFz3ThwA84ynmFS8C6gnDeLp
	pnH/l7BKxsIAOBQYNhzDsFfZ0Su/IU6eG5WZ5mOF7TdfyliQ0fatr1mQNtigbY6f977XuHYxKAC
	Um
X-Gm-Gg: AYBFou3gQ/On+9MI4L6sh4ydgaD9P0SvKPw/cNRE4Ww2d7OIBD2VjUkJVGiPS9bOeqW
	C1pY14EEjMuHVmPt+NTAdzp/Jtx2aIbg6wKmNhaG+G7cAAVk95y6nydU+C1RZwmBGAHn+etaOaL
	yY2ptw6kw+kp56ZdEsadnHVGochUML62Fwzunohfbgb21Odog293s4U491kWH6pj9Q/Utw+mvwa
	YMO07qx8youL6qpkBqH9e4ycjlLKKtn+6ISTOzZ9asMtQIF09Q0eU0eYTmBZ90BzdSFZZkUaSbF
	Axj1ZvTbsVZpk3noIVNtgDEWn4WfozbZOqzZmdydv51lHhKap1HMH4YUTplHhm0QI7Hy/lnfSlq
	p2il9y1DCs1xryqzs+J9JzR1qIJzzncgg1CBe8P/A7JAo5afAGJ5j/tD3Yxb48YegF/cig/i1tg
	RDKSpAaycAIDuflZ1nqjRLAFGAS8P3Wb9femlnnMkIgewNtLVKCWuDKX+g8zYS9oI=
X-Received: by 2002:a05:622a:120e:b0:530:f39f:bdd6 with SMTP id d75a77b69052e-532d8e654d5mr27042791cf.54.1790025502461;
        Mon, 21 Sep 2026 14:18:22 -0700 (PDT)
Received: from strozzi ([66.193.28.125])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-532df63ab0dsm267121cf.26.2026.09.21.14.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Sep 2026 14:18:21 -0700 (PDT)
From: Sean Anderson <sanderson@brivo.com>
To: Arend van Spriel <arend.vanspriel@broadcom.com>,
	linux-wireless@vger.kernel.org
Cc: Johannes Berg <johannes.berg@intel.com>,
	brcm80211@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	brcm80211-dev-list.pdl@broadcom.com,
	Sean Anderson <sanderson@brivo.com>,
	=?UTF-8?q?C=C3=A1ssio=20Gabriel?= <cassiogabrielcontato@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Takashi Iwai <tiwai@suse.de>,
	driver-core@lists.linux.dev
Subject: [PATCH 3/4] firmware_loader: Return status from request_firmware_nowait_cancel
Date: Mon, 21 Sep 2026 17:18:13 -0400
Message-ID: <20260921211817.2432341-4-sanderson@brivo.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260921211817.2432341-1-sanderson@brivo.com>
References: <20260921211817.2432341-1-sanderson@brivo.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

request_firmware_nowait_cancel only cancels the most-recent matching
firmware request. If the callback creates additional requests then there
can be multiple requests in-flight (the original request and the
(pending) additional request). If we try to cancel the request at that
point, the original request may still be running. Add a status return
from request_firmware_nowait_cancel so we can tell if there may still be
additional requests we need to cancel.

Signed-off-by: Sean Anderson <sanderson@brivo.com>
---

 drivers/base/firmware_loader/main.c | 11 ++++++++---
 include/linux/firmware.h            |  2 +-
 2 files changed, 9 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea8317..ea475aa48a316 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1290,11 +1290,15 @@ EXPORT_SYMBOL_GPL(firmware_request_nowait_nowarn);
  * Cancel a pending request_firmware_nowait() request for @device, @context
  * and @cont. If the associated work has already started, this function waits
  * until the callback has returned. If the callback has already completed, this
- * function does nothing.
+ * function does nothing. This function may need to be called multiple times if
+ * the callback makes additional firmware requests.
  *
  * This function may sleep.
+ *
+ * Return: %true if a request was canceled, or %false if no requests matched
+ *         @device and @context.
  */
-void request_firmware_nowait_cancel(struct device *device, void *context,
+bool request_firmware_nowait_cancel(struct device *device, void *context,
 				    void (*cont)(const struct firmware *fw,
 						 void *context))
 {
@@ -1313,9 +1317,10 @@ void request_firmware_nowait_cancel(struct device *device, void *context,
 	spin_unlock_irq(&firmware_work_lock);
 
 	if (!fw_work)
-		return;
+		return false;
 	cancel_work_sync(&fw_work->work);
 	firmware_work_free(fw_work);
+	return true;
 }
 EXPORT_SYMBOL_GPL(request_firmware_nowait_cancel);
 
diff --git a/include/linux/firmware.h b/include/linux/firmware.h
index 0fa3b027f02f1..46c34ad0067e7 100644
--- a/include/linux/firmware.h
+++ b/include/linux/firmware.h
@@ -110,7 +110,7 @@ int request_firmware_nowait(
 	struct module *module, bool uevent,
 	const char *name, struct device *device, gfp_t gfp, void *context,
 	void (*cont)(const struct firmware *fw, void *context));
-void request_firmware_nowait_cancel(struct device *device, void *context,
+bool request_firmware_nowait_cancel(struct device *device, void *context,
 				    void (*cont)(const struct firmware *fw,
 						 void *context));
 int request_firmware_direct(const struct firmware **fw, const char *name,
-- 
2.53.0

