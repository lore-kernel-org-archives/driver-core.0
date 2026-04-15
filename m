Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26EB6372EEF
	for <driver-core@lists.linux.dev>; Wed, 15 Apr 2026 08:51:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776243083; cv=none; b=FIdwPmsRfAiEkrk+1/Y3jLsdE2xs7X5gsWnaAEgtjugMBgHKPcAsqhxLheOGmaJgoP51BhZ+29T+9/N+lOwLLC8grPcCOsE1+JbIdDEU0SiHl5zcObadDdSbPCrGbJMeEtY3/eHJ2MoE+Tb1WhXhB4J9EJGyN7CZCDxEE73icUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776243083; c=relaxed/simple;
	bh=NzkOE0XXojEPsLDp5AjW4nUeVXuWbIOFyVsKkxFSCVw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tu7y9Ng+4Xeym+6Lu84fwprs3ayI9EamVFFrk6gqX/AiE/L/zWHzS3o6wrvEeVHb8QQRXFJ4HaeDHqE98+7OlUKSd1JkrN2ajsECiBkI212yw4ik8nPNnx4apCsjqItd6S8fQk3fwaHnD6J0xb5f/3MLEzanGuFPsJTPxYUeIlU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SpTlW5qQ; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SpTlW5qQ"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-35d965648a2so5603345a91.0
        for <driver-core@lists.linux.dev>; Wed, 15 Apr 2026 01:51:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776243081; x=1776847881; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=NuPGq2uQWBcQ6iaTKDT1PjU7pmFyo/WHC6ytQGe/UTQ=;
        b=SpTlW5qQIUJpsYH+ruDIKApm4fnpkaypBv9fqDuRREYST9LA2yJ0M5KIqTItZBAYxb
         8WrlYzRxbZNYQVysCN7IVAHu4nbXis5EIgPoYpj9cCr2Y7iLvSzqOjJTnFmUbPmO05IT
         9vcCPIhFEfdlHF1Y+VI9U2KqCFyASgDFOUJAz8UWWtAlrv6cVNfSCoKzg3y7L2JDOLvb
         8rLKhwGy3jPuyt3RYeIjfClAtqlRe0bSrtJdjD4n22agekykwPVApo+64N6KCtBzbj+P
         o86Qr17Q0OZOh9L3uXw3Z5k02o5WRvhWGdA3Tis8LW5hB7ux09OiIUjgQJdR1WVLsyzs
         nxyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776243081; x=1776847881;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NuPGq2uQWBcQ6iaTKDT1PjU7pmFyo/WHC6ytQGe/UTQ=;
        b=QLj5NTFfWilAgyVAXIGM9DnBtijlvapAY8uW9g6ABEG7BkF8+yijXzBjnpy5NAXtk4
         IdIM9ASf48S6yUgBQZLJN2NVjXYkueey6qbGkJhE25C0jYjk/b/Lp6uJwACrvAE/ESIL
         eOCWMhGkinGPEwEN6wmg1vgRNjPxMQ6lllD2nPgwptgsakLGVRjtu0WCmFEaIdaQ4pN8
         Qmy/jAp6wrU9yhVCLGJ4eiyoKvOOzf0bFEzlCElktVdJT1J4ifx5ZDhk3XzlTeZdZ6Dz
         jqn1kIssQdensp5pn6T6Au4yYXUg5llR7aSU5LS3S8McZLn6+veXQ7DjHSrhuzGWAefK
         5/gA==
X-Forwarded-Encrypted: i=1; AFNElJ9sH1fwdbs8j0iUDNZEcoCzQ1dNAX5hGoScNt8QSyhjUx2Cpa2Zh2Z+rELCELXfdXU4MVZvA7fIjwlC8Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+Yg5D+hFoFzEo+rIjZC9TUceohDI8QMSwkhQ/nC6bv8w5ZHEA
	LTDwxsVT+wCHLNMKi4IrehwCMr8g0c+i0unr6F9MtHLu4wBVqGS2colU
X-Gm-Gg: AeBDiesFRMM9zMd1i3a9EWAobkMw4lFzzW+R41VdGECsVbkDGkVXTZZewl8fmOVoLal
	8fEYhUVh18mTa6cUPKCdoENODZgIWvAi/HygmR1uWQdSMwKLfyBsSKvzd4BhfG8mIZhY3N74b2F
	dHawqVf9BFZduqPOrJCDOEkJUYMWZ3tOU49Fcw+z2NIGb/d6TkE62ElpglGFSPGMVgR5s3wvSiJ
	2I7bHbHXvVF+9emGPr1j8q6yTzbHcIRVbOfk9TYyMYgpWfH11gJXuExN6+CNLqT2LYPAaoaQBVp
	kPySpwko729sbuTfBuULq9Z1bBhlQ6Rewq85fFBBEXGPFZhiK0gLQWOYqsoFOh4SHzjB3ldTwkr
	p+4k2DAT8Vfq/HrQcnDWQIQ1b798fdLFsNx9SbosnA3Mn+hvmMuUjWzkubK7CA+Zp0NfjNml7v3
	De/1+OG3DqEQCLrIdn5WfvRpw3ICtlYIAY
X-Received: by 2002:a17:90b:288f:b0:35b:9b77:d7c with SMTP id 98e67ed59e1d1-35e4285338cmr21700928a91.14.1776243081584;
        Wed, 15 Apr 2026 01:51:21 -0700 (PDT)
Received: from lgs.. ([112.224.67.108])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-35fd3074758sm1274513a91.1.2026.04.15.01.51.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Apr 2026 01:51:21 -0700 (PDT)
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
Subject: [PATCH] firmware_loader: fix device reference leak in firmware_upload_register()
Date: Wed, 15 Apr 2026 16:51:09 +0800
Message-ID: <20260415085109.3267323-1-lgs201920130244@gmail.com>
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
 drivers/base/firmware_loader/sysfs_upload.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
index f59a7856934c..6b701185dcb6 100644
--- a/drivers/base/firmware_loader/sysfs_upload.c
+++ b/drivers/base/firmware_loader/sysfs_upload.c
@@ -366,7 +366,8 @@ firmware_upload_register(struct module *module, struct device *parent,
 	return fw_upload;
 
 free_fw_sysfs:
-	kfree(fw_sysfs);
+	put_device(fw_dev);
+	goto exit_module_put;
 
 free_fw_upload_priv:
 	kfree(fw_upload_priv);
-- 
2.43.0

