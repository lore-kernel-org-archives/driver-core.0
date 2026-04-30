Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03F07377560
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 06:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777531473; cv=none; b=D/FIybXwIzu7kdFnQeGm8NVM+VGUwbImDgZA5OcGxodvxYPADeSm6/iZrflYOIFYrbQrI9VzdQ6U7MsA/bs+VktF4jT6erlCs3RTpR7s5JiSN66ISo1QikV/HIKyAukhZoR6RqCjrZRCWRDls3acTAHfyfpe2CiNRofpeIpcV/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777531473; c=relaxed/simple;
	bh=IUbqoLux3BphYMKlxh2jIHWQ6JA0E3Ujt9MElEw3xmA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=N1AXDt/L2QWvbSHRZvSTbJrRkc5AWRYw4qKXMXKYmJeZpadc21kXm8pJuzKqnxDEERskjq+MgMpKSLJtZ8UkcvTLPJx8FzFl2DvoyQvehlxmlfwlJyVBK5RIhgJCN3bw12UZ07cI33NXtfFvOhPctsPRdAe0DHFSMZX/pBghwSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UwDQbkme; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UwDQbkme"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82f4a53ae20so425855b3a.3
        for <driver-core@lists.linux.dev>; Wed, 29 Apr 2026 23:44:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777531471; x=1778136271; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wFcc6j/YFOiNlxL8XiWp8rI8AJ5pkKge/fjMPVwoW4U=;
        b=UwDQbkmezi8vRiGfKxq8VKcVW4UTeC2FvcQANKk+1Rl0yDfIuu/LiYpr8arndlTe0H
         vxSOMelXKFOx6jla0IwVAFlglvFdswmkq0tC/Yr1Lgbo4i5cpY/+hXLVq8Ap/3/Tv00l
         DLeFGhkQBRs7TR5NGVzMcBHQkYjihnCFOaNBpLfI50iszGcDFqE72pHYpq5nmkcmsdX5
         mUrPUREoMYT4xx859FY8pFXW88Um5dbox2QX5oenE/pro1Br+aWg5mbXyfy8P5VgGOQm
         H9OxksImIhOXiTCYowqdnUwTfm7Et2W6tXAMNIkmGN7pWsDO+klcTLft4gZlt9XVXfvQ
         GXpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777531471; x=1778136271;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wFcc6j/YFOiNlxL8XiWp8rI8AJ5pkKge/fjMPVwoW4U=;
        b=LvrYbF99Gq+cuDN/XtNSv585grO0rkLaKeSZJwXnYlhLNNi3wmxkEG69H30+SyNN/1
         v2J4Wl2eSPq40OM/5gLL3MYSeL2iuhmkdl813iDzF9kBcOUvbL/iahIp1ISOTqsLOjGy
         93lD1Nj276nNHO2qhtSTw9Hzr7Kezv9yGc7eR876W7EscEBGRoyTBrmmjtnFH4Q/RG1y
         Lwdni+hRIlRRKc8tgDalx1b0KQmQPUQtCp6m4R+Eowweu870jASbSeV5HLyIUvywdqRH
         f3AZ2knvgB/ElmGqLjwrhgp8mbQ4r8BK5Xa/YeucUpK2HRkvpfGnhknSHH94qJSIdGC7
         pZXw==
X-Forwarded-Encrypted: i=1; AFNElJ/OZaDtElMkRMapK3aogRnmu3OvAe2iqP8i8xuIRWoawTRjGTgXZqth2JTjdpk+5zUp7wJK1JjOzyz+Vg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwKDnqTiXrsntuJMpd3D5jyaIbdNA7DbJPhr53t3U+tudSC9d9a
	rboUVKvRLGv2oWWBONJ1kGdNJ7IZ3vxRISY9c3/OWkpjqD7auI2v0v9W9Iu1PhJPD1z2Bw==
X-Gm-Gg: AeBDieumzDu3cAfGKlNcKrFhiN+ES/5zlzLP4VGE8ZrEMGIHwkPhUyZUg8pmcA0hldg
	0vorKlgK0EIrNRAGjJ9d11dvurOe6vA8xguFjiV09J4jAw7UpOf3Uu6leqF1r+W8LP44BNhkUwv
	JecZzGgu88Hx7ZD3iN9Z00oJYRuzQgTCm3xvBqTBlpsFkp2BoRBsZp/E/4NE/TQf/rWG9EBWhva
	DkcL7VcyynvpS79cuKLD5+Za1GI/yb3p5KL3100TQJ76ez80VnLpCR9XwDX7/JiB7agcTpIRR8Y
	HGkoGCH9Gz0IpSd3VBxeCqzQrh6MFzBOsHU/9Dmgd57jFPuPG2fxQRrnAcGahRBnjrqnPMaBGGm
	XsHu3IZjDYsAZotnDzTPeXI2gDvnfDcT91KgGHGjN/jNj5JKrwu9GQeJwIrlTg2m4eUD5Q4o4np
	mHLhUpRghFS4p0+3FV
X-Received: by 2002:a05:6a00:9504:b0:82a:7aa3:a2fb with SMTP id d2e1a72fcca58-834fdc321a7mr2210468b3a.37.1777531471224;
        Wed, 29 Apr 2026 23:44:31 -0700 (PDT)
Received: from lgs.. ([2001:250:5800:1000::5a26])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-834ed7eb691sm4140314b3a.48.2026.04.29.23.44.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Apr 2026 23:44:30 -0700 (PDT)
From: Guangshuo Li <lgs201920130244@gmail.com>
To: Johannes Berg <johannes@sipsolutions.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Guangshuo Li <lgs201920130244@gmail.com>
Subject: [PATCH] devcoredump: Fix double free on device_add() failure
Date: Thu, 30 Apr 2026 14:42:14 +0800
Message-ID: <20260430064214.450099-1-lgs201920130244@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

If device_add() fails after device_initialize(), the error path calls
put_device(&devcd->devcd_dev). This may drop the last reference to the
device and invoke devcd_dev_release(), which frees the coredump data,
drops the module reference and frees the devcd entry.

The error path then falls through to put_module and free, causing the
module reference and the coredump data to be released a second time.

Return after put_device() in this path since the device release callback
has already taken care of the resources owned by the devcd entry.

This issue was found by a static analysis tool I am developing.

Fixes: 833c95456a70 ("device coredump: add new device coredump class")
Signed-off-by: Guangshuo Li <lgs201920130244@gmail.com>
---
 drivers/base/devcoredump.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 7e4a491bf15e..cdefdc8e83eb 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -437,6 +437,7 @@ void dev_coredumpm_timeout(struct device *dev, struct module *owner,
 	mutex_unlock(&devcd->mutex);
 	cancel_delayed_work_sync(&devcd->del_wk);
 	put_device(&devcd->devcd_dev);
+	return;
 
  put_module:
 	module_put(owner);
-- 
2.43.0

