Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE1A2E5B2D
	for <driver-core@lists.linux.dev>; Mon,  3 Aug 2026 01:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785720589; cv=none; b=AQ5MbzBnz61D8m/L3omod0CfMmunyvT+Iaxb8xmNMO3CFBsF2RusION2BLt20sqHrBDcl9eywmb7UxCrLHwe/H8DS2d50UmibW98Z9/s8bcHkt8pxgWXkQfM1FNBYRGGeOjmsFR+Et2Rvxv3ee3a/8cnPW+5nruQa5lWyUx+Gwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785720589; c=relaxed/simple;
	bh=AQqIFM0cEHWxdl6CexxZcDc//Jjz6VvOODplzoWGuC4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=bflsVVLYD7TnW0RUzbwdaqGdG4Cz9YUpKBjdCeqGmpmJ2dHdDnOWSD5G5UyvC5/GthYAtpO46wDT6bGguCOX+1cnEK4f6sOsPWnxue63kyvm7o7hJydET9iqVp1XqAdf0n9+k9ub/cMGa903X/bC/6jMLom0QHV9Iksiqe+r9qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CBOpsLJ4; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CBOpsLJ4"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e67555e24so130703585a.3
        for <driver-core@lists.linux.dev>; Sun, 02 Aug 2026 18:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785720586; x=1786325386; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=U9TUfArfjzEKocxGG4TRFcc88SBwNw8ueUXsGddr+Ag=;
        b=CBOpsLJ46EydGfWHJwZqVub1ky33eDlYCIqUhC+bp3GCR2pIfuQnl4rUIsGgheQTQI
         3Cla+aJPqHpqHw1kuA3JAVOXVGGQ09L5PdbkFYBWvKaB9luPxqbc4dMxeXRNPjoyNml4
         lejek40+EmF6tUlVTLvY4MzN3xC5m+d+iaNBceuL1fzHy549Q5KW3EkOZXQANY5fhy3Z
         hmsO8U8HLgASJtHGZVxBrxdr7nBfXrS2aKbQeFT1wiEv3LJEmrIFSbXgLjxpyQrMsVwV
         OQC7l4vljejdZqfVEDdV4B8jQcUk0onlAKhspdBwkLr24bUQN+gvIxIevzYy/XJ23RKJ
         0ymA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785720586; x=1786325386;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=U9TUfArfjzEKocxGG4TRFcc88SBwNw8ueUXsGddr+Ag=;
        b=fDgrgb7CgFpPzEoTQdZndf0RgUVSzaUWCbPzuSTfAhmBVC0vyCm+VNtv53rPcoVyei
         sTi1mF3Zx4gK2PPEgqxN2Zq2HHPEUYWTDIcu0l1lJSt9NTTxZGvx//7jkfPC5emJoJdW
         9m/mpF/QjHwzade7FgtFjQ5b9hx+hsum2Ja1ejItTACu/IBjSaxnPDnLD2wuZGwrnVCT
         HJp+EGOcFDFiKXdnNX0+UkGpG4zxbgNAmTKE2E8ahnY+SFJhfVL2b2sj/i+uoGUSUSNq
         Br1SWcW/Lj2OCQCavx259m7ibNRzw3zh/ravRC5cyynQZ5gRvrpx71ZTNJvAvjD8oIga
         WLFQ==
X-Gm-Message-State: AOJu0Yx48PzEKhNYoPl/MEB8bSiGwVQIucKX7Eof3PcVZ3hTRIN+63B9
	Kj1YZaLhPRh8/rzVApsc3l+FsngTu0KUbYbdxa5fffb1/yVf11sJGLVa
X-Gm-Gg: AR+sD13Sikyhna4PqAu5peGbE/LsCAxBUlbSXqlVsF3m+cXI9i6bsm+CZsrI+jz4eDa
	CCi1CjpBuXrV/5BP5/25HZl/jAb0kMqzFPbGzj6O3idg/QbLMNiCPNCTjzdGEmSDP684jad367g
	KY9VNtcy/J99paPLH9RWzrb68Sp9QuHQMqarw5dNBGktOO5gWbjHHKTBTgD+GFZwLGICENHtVqS
	JKSmxbYJH66wTSramXnDycsvvWzuxmtuzwRq76C2wZBpxY2x16Eio1ElyJXJ12vd3lcnBY58Bgq
	DobvKiMrl/H6p4e7MWNExiN7SpujdSyZgE3VwgpvqKmTbz2j/6Jz5MicqTFjM1UJSISyxaafvdD
	5LQIcytO2EnRnaFMMDAJcSxqOwv1AZ8f9jNUneRKsM0INX32pOlody69BO093WULuushlyVNv+d
	JmsFz3uKzEyJ6qNsM7VMzRcsWdASyMO+ww712kWiMYUQeERxSDT+4F4LA7AFXQjpK1vg9tMo4e3
	WD8o+DU1Ggod7op0y8EBFn+a+RTyk0EKwKijMUxlVENuXH+Z27XuhgkgbdJiGQ=
X-Received: by 2002:a05:620a:1a15:b0:92e:57ae:3a53 with SMTP id af79cd13be357-934a06c37abmr1603649885a.9.1785720586525;
        Sun, 02 Aug 2026 18:29:46 -0700 (PDT)
Received: from i4-gl-tmk5904.ad.psu.edu ([130.203.156.186])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9349c1c1d0esm557031585a.33.2026.08.02.18.29.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Aug 2026 18:29:45 -0700 (PDT)
From: Yuho Choi <dbgh9129@gmail.com>
To: mcgrof@kernel.org,
	russ.weight@linux.dev,
	dakr@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	nixiaoming@huawei.com
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Yuho Choi <dbgh9129@gmail.com>
Subject: [PATCH v1] firmware_loader: Unwind initialization on sysfs failure
Date: Sun,  2 Aug 2026 21:29:41 -0400
Message-ID: <20260803012941.610268-1-dbgh9129@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

firmware_class_init() leaves the firmware PM operations and reboot
notifier registered when register_sysfs_loader() fails. In addition, the
sysfs loader can leave the firmware class registered if its sysctl setup
fails.

Unwind the reboot notifier and firmware PM operations when sysfs loader
registration fails. Make register_sysfs_loader() transactional by
unregistering the firmware class if its sysctl registration fails.

Fixes: 6bb9cf3aa3ed ("firmware: provide helpers for registering the syfs loader")
Fixes: 6aad36d421d8 ("firmware_loader: move firmware sysctl to its own files")
Signed-off-by: Yuho Choi <dbgh9129@gmail.com>
---
 drivers/base/firmware_loader/main.c  | 8 +++++++-
 drivers/base/firmware_loader/sysfs.c | 7 ++++++-
 2 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/base/firmware_loader/main.c b/drivers/base/firmware_loader/main.c
index 24213a0ea831..c2f7825dfc4a 100644
--- a/drivers/base/firmware_loader/main.c
+++ b/drivers/base/firmware_loader/main.c
@@ -1727,8 +1727,14 @@ static int __init firmware_class_init(void)
 	if (ret)
 		goto out;
 
-	return register_sysfs_loader();
+	ret = register_sysfs_loader();
+	if (ret)
+		goto out_reboot;
+
+	return 0;
 
+out_reboot:
+	unregister_reboot_notifier(&fw_shutdown_nb);
 out:
 	unregister_fw_pm_ops();
 	return ret;
diff --git a/drivers/base/firmware_loader/sysfs.c b/drivers/base/firmware_loader/sysfs.c
index 29a10d2ad537..d9deb0804f55 100644
--- a/drivers/base/firmware_loader/sysfs.c
+++ b/drivers/base/firmware_loader/sysfs.c
@@ -117,7 +117,12 @@ int register_sysfs_loader(void)
 
 	if (ret != 0)
 		return ret;
-	return register_firmware_config_sysctl();
+
+	ret = register_firmware_config_sysctl();
+	if (ret)
+		class_unregister(&firmware_class);
+
+	return ret;
 }
 
 void unregister_sysfs_loader(void)
-- 
2.43.0

