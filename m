Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CDE3BE642
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 09:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777972367; cv=none; b=TIrNSa+SqIXX7MOebPrpPUSPMthqB9jUEMGAhxGR0eDexQolxiUQcVLdaZvdDTsmQHubFWf37xMWGJ8FAe5Sxj557Dwy1LJerX+itmmlbypXWuTQlhJd1Xw7aDR62awGEQqgPpGvJ/FzEkJJ2VBxkD1WBickDkw4vkq73GVH6VA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777972367; c=relaxed/simple;
	bh=ES7r8hh3t5MoXyYNPDh7ECZ6Siwy/fIWOIkEuMhHPCE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=IyHP3OKOz/FoJIVZGUXUmCQGWUgNSQQTUPSb3lKYRhPAjOGY6PSWjiPbclksqZnmy5y3IDXQMahyeT0bWBt14dUpwdUaCQjivin9BVIeNhjJQKCOgslcVE6Okcg/Ptp2fwG/wcQuYD3+uF9LHUTg4aFigeV+zdM9V5qQobdAAXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EIFEiGIG; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EIFEiGIG"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-364d72f2986so3458797a91.3
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 02:12:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777972365; x=1778577165; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pT76M5XvZ7WL+LrVhY8ppYSbulf6Va7vbJcXm5Lk6Nk=;
        b=EIFEiGIGayD5U8ewznlG5jpB0dL8B0HrKi4TivHxikDTW8VOcFNdhvvdOY55FtzG7T
         KzRrEXGdIhrfOogAUtvbRhEwfySx+6qVFGNY0ekrW3kHtaSDBcGKpmrrWJB/+FrtUazD
         Rh7peWACobqpvEQzd9SbXiwG64sdv1NijC60E3SPG6qgqHa2b2pntuirzNMKlkfd9zg6
         tmyEPtCUjEiAB5eFv1w8wJNWlYsI8CI3pVLoR2AnKjcR7pD3Kket/iEoxv2xYlS//kmB
         vtijsL/TMbcGIPEMIYt3ahlIbuNjsgd609VYPRnoyuA4K92+9zDbGxe16UfkmdAJ1paq
         e0Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777972365; x=1778577165;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pT76M5XvZ7WL+LrVhY8ppYSbulf6Va7vbJcXm5Lk6Nk=;
        b=Fm/JjQLVg/iX8b6OSXUB1P5ye3hC1YhH8nW4+3zTRTn+ls/YrW0Qeds/yb5NTU2r5s
         ciPUVKIt2YABngM9HUztuKDDChkY4tSGPNy9qxPAkG5FnD6J44oUH+WpNUwsr9RrluMr
         QuHUugIBJlkam6SKMUY90APVLsxtW+yobgidzR2D6EbiMsKRZF4SIzMOTbGjln2hhjPX
         r1jUmMMWI5R0UC1IRSoDzPxqDU1CpbeQPgEbn2eQq38Eub7AI5/kT4NKIfIWhhCLwbyS
         Lpyhq1bSbwLP2R6J9RGjFQr5BSf/J5t65S5YBi2j3MpovmE1dbWRV7dU3qlkGVoEttyz
         fcQA==
X-Forwarded-Encrypted: i=1; AFNElJ+ZQCSSGmThhvcwrGqSIo5xupmvo8rRo3fj6VTvu/DcNoSmBi5OvmWnRzGhhX6ms+4EmHDmkBDtE+2b4A==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywg3vVcmUHwKXVcCAAWkMpH8KJdCOHXwrXUrginh0Nf6xIAQtlP
	EsQsVOWpY61WdWt7xBtI6Vb3OXxUf3w6xHnfyMHVaDp2VEwO17R/vqLQ
X-Gm-Gg: AeBDietqb/z2yr77lFqnS2KbjEr5lFH8rvl4Zf8j/1Nki/2zwZncDNb5KjKXoigRXxb
	X+7CiPjtz1oLtw53FXVYwM1iGOxN82kMHUFba7kMRyMH1Krk9YMiBsTzrMe7t41hys2+zpE/z1z
	zTIxDnDZvCGxEjvoLlHXDwE9yuvZSEzCCAoxQfK2bs64DhotmRqrBs3qzWKPk3HLpKB4pE9OIHd
	xhhF/h1XDCBdWX7Dj498VGAaX0opIMg0UdyVCtxb5WgJ7NZl3bUqRHcIJk6qbaJH/xoQtjj7RQt
	hq+F35HyQS9azfr/zCnYJ8D8hCMTvIyMkD5dgXnET6Y7pAkd4PQIeZoDnG3lmw8NEtRem+ja52w
	ySGoMAvQ5jqCgY4zXkPNU8bjtt/DQHk8MvQGWjhshIH5k3+7merFdU2QXX0LEaKruJh6qC1ikO4
	Dk45/fxr7kyp1kP5BlRhCov8iRAdbklaQhkXtKJ4U0Hw==
X-Received: by 2002:a17:90b:3901:b0:361:45df:102 with SMTP id 98e67ed59e1d1-3650ce714a8mr12247878a91.17.1777972364997;
        Tue, 05 May 2026 02:12:44 -0700 (PDT)
Received: from lgs.. ([223.80.110.53])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-364bdf2ac19sm21648683a91.3.2026.05.05.02.12.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 05 May 2026 02:12:44 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Tianfei zhang <tianfei.zhang@intel.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Guangshuo Li <lgs201920130244@gmail.com>,
	stable@vger.kernel.org
Subject: [PATCH v3] firmware_loader: fix device reference leak in firmware_upload_register()
Date: Tue,  5 May 2026 17:12:31 +0800
Message-ID: <20260505091231.607089-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

firmware_upload_register()
  -> fw_create_instance()
     -> device_initialize()

After fw_create_instance() succeeds, the lifetime of the embedded struct
device is expected to be managed through the device core reference
counting, since fw_create_instance() has already called
device_initialize().

In firmware_upload_register(), if alloc_lookup_fw_priv() fails after
fw_create_instance() succeeds, the code reaches free_fw_sysfs and frees
fw_sysfs directly instead of releasing the device reference with
put_device(). This may leave the reference count of the embedded struct
device unbalanced, resulting in a refcount leak.

The issue was identified by a static analysis tool I developed and
confirmed by manual review. Fix this by using put_device(fw_dev) in the
failure path and letting fw_dev_release() handle the final cleanup,
instead of freeing the instance directly from the error path.

Fixes: 97730bbb242c ("firmware_loader: Add firmware-upload support")
Cc: stable@vger.kernel.org
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
v3:
  - Move fw_sysfs->fw_upload_priv assignment after fw_sysfs->fw_priv is
    initialized, so the alloc_lookup_fw_priv() failure path does not enter
    fw_upload_free() with an uninitialized fw_sysfs->fw_priv.
  - On alloc_lookup_fw_priv() failure, call put_device(fw_dev) and then
    free fw_upload_priv and fw_upload explicitly.

v2:
  - Remove the free_fw_sysfs label.
  - Call put_device(fw_dev) directly in the alloc_lookup_fw_priv() failure
    path and jump to exit_module_put.

 drivers/base/firmware_loader/sysfs_upload.c | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
index f59a7856934c..efc33294212f 100644
--- a/drivers/base/firmware_loader/sysfs_upload.c
+++ b/drivers/base/firmware_loader/sysfs_upload.c
@@ -343,7 +343,6 @@ firmware_upload_register(struct module *module, struct device *parent,
 		goto free_fw_upload_priv;
 	}
 	fw_upload->priv = fw_sysfs;
-	fw_sysfs->fw_upload_priv = fw_upload_priv;
 	fw_dev = &fw_sysfs->dev;
 
 	ret = alloc_lookup_fw_priv(name, &fw_cache, &fw_priv,  NULL, 0, 0,
@@ -351,10 +350,12 @@ firmware_upload_register(struct module *module, struct device *parent,
 	if (ret != 0) {
 		if (ret > 0)
 			ret = -EINVAL;
-		goto free_fw_sysfs;
+		put_device(fw_dev);
+		goto free_fw_upload_priv;
 	}
 	fw_priv->is_paged_buf = true;
 	fw_sysfs->fw_priv = fw_priv;
+	fw_sysfs->fw_upload_priv = fw_upload_priv;
 
 	ret = device_add(fw_dev);
 	if (ret) {
@@ -365,9 +366,6 @@ firmware_upload_register(struct module *module, struct device *parent,
 
 	return fw_upload;
 
-free_fw_sysfs:
-	kfree(fw_sysfs);
-
 free_fw_upload_priv:
 	kfree(fw_upload_priv);
 
-- 
2.43.0

