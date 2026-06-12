Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0415337CD50
	for <driver-core@lists.linux.dev>; Fri, 12 Jun 2026 05:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781243708; cv=none; b=Koq8KuFB5+CmQXwDW/Qrn+iXq91xpAH2KdOzYdRRx//VOothzgl9wPZdHfudLuHhIG1Ozif1nMSROH7KsULPdOJ+rtlV3xnqOkV3kiOBUT6WTpdzwiif/WtNz8R3Sjt+xdX1zOH2fr+W2L06DbZdIGsjJwOSu856aEv41EYmijQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781243708; c=relaxed/simple;
	bh=i+ES14b6jc5Ym5cDkSK2+zF94V9abcFm5DF3sHTzROc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=PH7hD4CqQYQIp49e+560pfllVyfYAcJyzWEQmBUwSvBehkOBdXS5GCD4f6efXEiVwQ9uL2J2nhKqeTkq1BanvI7Qs8Q++m++6eDwB5N9EmEmqIQH6aPyHSsp7N+Vu9PvJ9HMPy+8acBbnGKgJS+47rLW7hROwFh+FwLZ856Vw/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qtYONT8T; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qtYONT8T"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-1383e116edfso593462c88.0
        for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 22:55:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781243706; x=1781848506; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/vmc/1YG+NDtYljr9KYRnm0ette83RI3GbTlHHUsEHM=;
        b=qtYONT8TKjps/0WWblM2mp+Z/4LbIQ/9wkFFtIZ/SoeRWgVkhiwKMiIP5DLA2OV3TB
         UDq5mh1G6XWqkw53c7utdJClNFw7CsMU+yr1kP/Po2RzqKFq7bnD+LEtYmFLLMHSYsI1
         MCYBt0v5ur3ViF3IxgLes3RFeF4zZv2ftUO6JkPiNlftHnQSCdFuzX1DcV2+gS3Drd7N
         yAjfEDbJjPEiKtScd2cDhhI/dOxQFTG9V64BHlujywqzblqvh/iH6HgTOiMKiSMfWioE
         gPmedft6dYfuQmdYLSEt7lTe5Vpxsgjx6vgVKxL7G8t/IQnRT9FTfkyXCj+BHCFx7qMr
         Ffeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781243706; x=1781848506;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/vmc/1YG+NDtYljr9KYRnm0ette83RI3GbTlHHUsEHM=;
        b=HY+aEtSBJX1kPEsV4hXgRYtQMCKzXbxGPxNOzTnxo1tm0pDepe+X0AMUO3Wgz+hSKZ
         FzWohUAyGpqezpPQLnQpjjPchxwKMmghn6Gq1v8JOLRravQVM6ZxC3F4arb+FpP4Jt1d
         iHVoJrOyVnADSGZoGjEZZtn0roLTIngjbxwygRxxSMUbAKD/g6nIL6feL8Q6AeQQZ5rJ
         JnUfeazI2jktWfe55nFlekHoKgpYH/+DbXbP4aPLcPsWPN3ws/Yrjwi5bDgF/LJY/hsy
         3x2yR4L33ft+4ycQzsLohTrn4w+80n1x6K7mfVD4zTh0C2qC9PzIMO6BCI6pbf/b3MMU
         wPfw==
X-Forwarded-Encrypted: i=1; AFNElJ90GB92CDL4O+mLh5tFXU7uTmwk7tpGYnDuqqsDrfpRFwRRRNJUnoui8UdfXouVzBzU1IuewE/H+ppBwg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzom/zYl2nLSnTFkgN4t+2PzI2edW4ubgUH/34Mno2vonmGLFe3
	KAA6a4cWLc5xHxnR95NJfkFbBfNtx0T3rfIlBc1JjRuuRs9n9FomDzDN
X-Gm-Gg: Acq92OFTNuXMrgntPZs92TWDznx1T4balbE1GS2Px+qWcmsHXxzIMP8l8ZOTmGtZVhK
	hNJZXNgT4Ef999NrJiR6LeaqAUmNkmXeQRYrpNIoH89zGwIkfk9Ty13GahXqMEL/n0UjeA8rg9e
	eqYDO0FpjzB7A5F2sljZOS8azDqUelUT7nSbQRCQiL0Zprq9nvuCSld5ieEEiXjM8kjyYtvwOIB
	kenaHxExNonXhoO2dTqlaa3Ud+CyBIxLxypCIvkFN6U/ZOWNCtXFveHxKFYX0EI4zupJeGl+/QE
	oSsA40ziKtflVpFJnJhGGx2R/VwiojvHBjBFqJ5Sw4vkZc7SdgKfeyW+ffAdnlULbWPxmJsaqgO
	2jrya7Jd3CMCUdlvwxUC5MxyUF32AfF7L2w1ZUmR8jwB+X5wZJwOeCYUAiIjWLZ+Q9uXuRBoT5U
	RMJARF9XPk5pocRufzXkifp37YokaOQxhz
X-Received: by 2002:a05:7022:ba6:b0:137:ed4b:c9b4 with SMTP id a92af1059eb24-1384bb7fba5mr557149c88.28.1781243705892;
        Thu, 11 Jun 2026 22:55:05 -0700 (PDT)
Received: from linux-691t.suse.cz ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1384b964853sm1075173c88.11.2026.06.11.22.55.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 22:55:05 -0700 (PDT)
From: Chun-Yi Lee <joeyli.kernel@gmail.com>
X-Google-Original-From: Chun-Yi Lee <jlee@suse.com>
To: "Rafael J . Wysocki" <rafael@kernel.org>
Cc: Chun-Yi Lee <jlee@suse.com>,
	David Howells <dhowells@redhat.com>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthew Garrett <matthewgarrett@google.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] debugfs: Fix lockdown check for mmap_prepare
Date: Fri, 12 Jun 2026 13:54:55 +0800
Message-ID: <20260612055455.16894-1-jlee@suse.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Commit 651fdda8406d ("relay: update relay to use mmap_prepare")
changed the `mmap` file operation to `mmap_prepare` for relayfs, but
the lockdown check in debugfs was not updated accordingly.

This prevents debugfs from being locked down when the kernel is in
integrity mode if a file uses `mmap_prepare` but not `mmap`.

Update the lockdown check to look for `mmap_prepare` instead of `mmap`
to fix this.

Fixes: 651fdda8406d ("relay: update relay to use mmap_prepare")
Signed-off-by: Chun-Yi Lee <jlee@suse.com>
Cc: David Howells <dhowells@redhat.com>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
cc: Andy Shevchenko <andy.shevchenko@gmail.com>
cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Rafael J. Wysocki <rafael@kernel.org>
Cc: Matthew Garrett <matthewgarrett@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: driver-core@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
---
 fs/debugfs/file.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/debugfs/file.c b/fs/debugfs/file.c
index edd6aafbfbaa..d5e187895dd8 100644
--- a/fs/debugfs/file.c
+++ b/fs/debugfs/file.c
@@ -273,7 +273,7 @@ static int debugfs_locked_down(struct inode *inode,
 	    (!real_fops ||
 	     (!real_fops->unlocked_ioctl &&
 	      !real_fops->compat_ioctl &&
-	      !real_fops->mmap)))
+	      !real_fops->mmap_prepare)))
 		return 0;
 
 	if (security_locked_down(LOCKDOWN_DEBUGFS))
-- 
2.43.0

