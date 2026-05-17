Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2ABC34F49F
	for <driver-core@lists.linux.dev>; Sun, 17 May 2026 16:15:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779034521; cv=none; b=u+82tvG/kazQADrU5ixqcnN+8KtWvqh9cDM3kXoykn+ICFFwGGMlGXcbTeKwVcce6M0OMyJoOvAgrJutRgRVzpGlG4YCNu5CzgDGp3qK5KUUWhk4pSUwgb9/AQcXIAiFb7yHJ3iUKEYaIMB3COMsZJu4zVDuPOQFOiW1gulw4u4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779034521; c=relaxed/simple;
	bh=ep9U3+r3QbS8Hro0ePRxCkrtIfYDXWqKp+IjqvlaDPM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NHQTzUr/CJyj2A/zh0WMVe0JWh9grPSPT7nlsMzaihErk+8uynelZBJ3Vbz0fpUF8bytb/wVU64bC/821E7qmKpnc4oVCEk6yY/Rn4pFqVPCEA+i2EhTjXKVS059oFq4rupFbdmc8Pwh4do1/3t/w3/5zcGImyYmEJspXa35mA4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nTD7P7Gj; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nTD7P7Gj"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-488ff90d6c7so9509075e9.2
        for <driver-core@lists.linux.dev>; Sun, 17 May 2026 09:15:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779034518; x=1779639318; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=i5Ec6Ty8YxhY7mDA+ZieTPKjZExB5hCXZmtxnRa/Ry0=;
        b=nTD7P7GjtzmuyjIUSiSuPXIiT45tTeS6zjZ9Gn11ZPRNi0KiJJ9Cfawf/j5N29eV3z
         +zaBGQqcIkGckNzUS+/hVrPvX8AEz6kLRjeNB/bsmVSGMUBFltVycYkanmjyiIxfxESz
         cXt3y3TONnxhd3ZZCDfaTK1dQHO0mOQzrA7Ku3llcUSgiNDZLaabstyN1tDtJlfarhQb
         yK7nBuWFsddFC5h4Q+6W3WJzW2+RT4NNZgVtHc5zxl5ceNcR7tmE/wwllY1AR+Qt/Coj
         mVHcQb7Y9/EtixUsxQHWgjjAnkVUsVmP67bJWCeG6F4Ap3n8sIF2k4YvoSKjPe0ubiLr
         JOsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779034518; x=1779639318;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5Ec6Ty8YxhY7mDA+ZieTPKjZExB5hCXZmtxnRa/Ry0=;
        b=dWuWoXK6hxbNriqpUC/4ELOh1aBVIF2cdbuVb1Rz+OmVmcV1KyLA/8kCotmCVUMao6
         /wHk4uUOP90HTzUrikIUqvSh18xwbAp+5j2HfLpu9f12aJKaCFT37bsd6Yp76V2/uKRQ
         naICLhXAkC2qpE7XlT5hD0x+cVYHiuzV13Kr0XTVOCgMy2U1awAbvoFDafeRvyuDdJLg
         jkYTdQaJ86oVHaMuVHZpCCQbe43KLvR21jhpfm0POk97iuE377+B8cEwrssNjhl8zeaC
         ISDRr5RC7aKFaHPuv8j67kSxl+MR7QJMWmcqNkFmOF4q4OA2R4V2oiSUYL4mEJhoYU9q
         CQQw==
X-Gm-Message-State: AOJu0Yx89r2RVcR5kTiIiUteE0Oi9URWPEZNnwHsHSBgWW/2DrHs+m6h
	O+PBc0Qp126mqokv6spLhGfnDLay1T/DNV+NUuRJh90KgTcsbn2sXms=
X-Gm-Gg: Acq92OHhGxlKCDPMB8O9hfr9SoypkwMVLfFNACbCWx5MG0Ybw1QAsQ5IbyoTy5H+IFv
	iPeJDmabhm3SzvOmWjT045uy+cJl25uzPTQseWgS+x2WjQ4oYefRRqsC2EKi1VbR/7WiG3jS2a0
	xLbgFogDcQPNUD3NvwV7UPsmjc7UPpW5GPlGAA8yHNknjpgzD1o818tz9FNNCRoU2pdPSK9c+W1
	3xAV73tK8dRkJxORhf08EEArB9z7QD9maD1WOYSqnEg28alI5rCv0H1WHTM3rrU3V4iAkTxe6A9
	FleSi0KMUbscmzLHjEvOIFmBSnlsPos7UhGrN8iyjQyeOmyrNRYp9ClOs43g8caVvqC+E0WNU7l
	6aydIgQ9JC1jtvFC0v8mJNfxqmMYPdOFm8GkV6wlfgNo/Jr/S/PjfQas5VbDLZHtRQ1VVxTWs/s
	cCBFGZL3FU29EA
X-Received: by 2002:a05:600c:1389:b0:48f:fe2a:107c with SMTP id 5b1f17b1804b1-49001285b87mr57129565e9.6.1779034517818;
        Sun, 17 May 2026 09:15:17 -0700 (PDT)
Received: from p183 ([178.172.147.242])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48fe4c8d39esm201147565e9.7.2026.05.17.09.15.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 17 May 2026 09:15:17 -0700 (PDT)
Date: Sun, 17 May 2026 19:17:47 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org
Cc: driver-core@lists.linux.dev
Subject: [PATCH] driver core: delete useless forward declaration of "struct
 class"
Message-ID: <6d5937c5-9d41-4cfe-9e42-0946e12dc72d@p183>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline

"struct class" is defined earlier on both cases.

Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
---

 arch/mips/include/asm/mips_mt.h |    1 -
 include/linux/device.h          |    1 -
 2 files changed, 2 deletions(-)

--- a/arch/mips/include/asm/mips_mt.h
+++ b/arch/mips/include/asm/mips_mt.h
@@ -23,7 +23,6 @@ extern void mips_mt_set_cpuoptions(void);
 static inline void mips_mt_set_cpuoptions(void) { }
 #endif
 
-struct class;
 extern const struct class mt_class;
 
 #endif /* __ASM_MIPS_MT_H */
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -38,7 +38,6 @@ struct device_private;
 struct device_driver;
 struct driver_private;
 struct module;
-struct class;
 struct subsys_private;
 struct device_node;
 struct fwnode_handle;
