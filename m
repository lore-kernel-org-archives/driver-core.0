Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCE730E0CC
	for <driver-core@lists.linux.dev>; Sat, 18 Apr 2026 07:02:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776495752; cv=none; b=kzpBJwMxzy/TTDsUX0n7a0onW2JRByQyJzlCX37q0sOEBkXaDJOg1dE0CrI3rzI/2xkpXGfe6KsESryETCR03UomsO7cpP00zT8HSi7e0iAIO00TChYPvcj08b/uctbR402R6dHo2/dAANVPPOR3EVdFcnqNZzp0247LrQYR9P8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776495752; c=relaxed/simple;
	bh=CcDvIU6z25vhcQ4xVZy8lcj8AJMflIP8uYRdn7I9y5c=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=rPz+NBYIDzSiT6bZQHGlm1+KQyebSGrc5IDeo0X20iqcBbAbMl7JPOZuNvw2DycyNNZiMuDG3IUX5zGOtCUeLBoGwuJQAYOFaHZ5MlvoTwalEqzUP+WRdf27efpW1ZJKScNw2MoHz923e6kFH6oJ8INLn6UD86fzp416156Is/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLYuGM9/; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLYuGM9/"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ab46931cf1so18486795ad.0
        for <driver-core@lists.linux.dev>; Sat, 18 Apr 2026 00:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776495751; x=1777100551; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UiTYFjNnjpdpCtpnDwsxuALR8uSM4iRhQ8ijRVO9szM=;
        b=XLYuGM9/ZPApx8ug7zoGti9Hi1d3D27hmEB+i2jJCmaH7n+HrawVUALyZAJwT3ip4r
         A0HcWhzQKtjAKaUs+aluBjoIPcXQFug8R3NGvw3E2aD2K1MTeAC+v9brKXq1jyFknytn
         7FAeM1KMznn2ssnxjFLC7UN/VKRs1utfiFLx1XqqIIt8dQHzPdTa8o+cLA0+PknWI3q/
         Ekr/e52IG6fqtrYpz56nWrnVEab14nvYC6MCFyZHFCLBoOGNQmSrSj1iuJ7Bt/UNWtJp
         ny2pX/uOdBqoj/4DP1X1k/df/DPX6WIkpDlt3BIk/1XrpytGJql/N+k6VgvyFo6L8KKX
         Sv9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776495751; x=1777100551;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UiTYFjNnjpdpCtpnDwsxuALR8uSM4iRhQ8ijRVO9szM=;
        b=IkIWj/ys70vJluT4UTywjmfgNnLGrJyxGBxoj0Hv4fhiFgh2DC4zaat8c+i6geR9Pd
         l9dtPssGEBrlQTt1pzBl94HBZ3U0DEbVlGv1L+ETbSCxP5lRzjPXmL4cbtc7orXq1X1A
         zqWVZXyTw3Ki6HmIXulztQC/1OcQ9eAoxhzg9BDdNbScIlBKGcjGO4c5XyGFvjCT4IuV
         IoTADVUalCC3i6n94IogId2TP4Js6XrlPjOeyHOfkJiEyikSLII/lI9tM8uKw6Yz654B
         qDwPIb5qBWM0ndDWnzY7UR3Mdt6DW8Tdw822Bfd0tSLLgIpVrWdhtuXEtaw/m8Sx7YuL
         XPkA==
X-Forwarded-Encrypted: i=1; AFNElJ/Hl1n1Z6KlRdc6a9odPRJmJlHjnbsQJe5qC/bs/YJ5FUAgXY0Y8dPuOUV8iIq8Mv8YighVqNwFBSY15w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp/gVVCRuuZBNa/20AkCqoRqqMP86kv7j/yJA6ffkRmv6Oo9p2
	Eus8bZU2sKJnN4aJdm6mkQuuIbDRiU9cxuMqvoaCTUo68JRh8e0jIYma
X-Gm-Gg: AeBDievyrckIl+6Fk8FqUnBTUDMs4HBPRr0XQ6f9x9V3SwDhmXVEKiNlGvttBAgDqs7
	XXrh3JWszjrIXW5/iXRRpy1+rG42peeYyLNt/6KR9Bf1+okiWZyVessNQp1QH/shpR0T2MgTaQJ
	AfFLObdJIEqTGWg+cs/pjfyXCFXMT6/i4ykQBkzIqoUZ/2Ig8MrrhrjpgJMNKQHWBZJculc12dy
	5gbAwZ6KO5sxZ6ZWEqAbQIMVVFQUij4ELAibEIB5gb23r55jFNVI3ovbNmB5Aa8Wk1NOdSI8rjD
	W+LBjZCNCg7yuJmHTQykvpm/LMd+sHPAxJ+38UpKcRo61S+0I/Gng6SIenQWI8EXhSCd+HExeAO
	siXZfErWwFrf3bcggOrtqSsLYX88cIwq0HTDnbUMKvGTMvpVQRqB5t1YMIg08eu0qe37bIOGYg9
	vs18dOWHoiAhL+g0poElrnf2m65CGk1wPEoynBSV6ej/yt
X-Received: by 2002:a17:903:bd0:b0:2b0:4f16:22f7 with SMTP id d9443c01a7336-2b5f9e8d873mr38136045ad.16.1776495750567;
        Sat, 18 Apr 2026 00:02:30 -0700 (PDT)
Received: from lgs.. ([2408:8417:d50:4775:ba08:bee7:5a64:abce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9fedf0sm49448665ad.6.2026.04.18.00.02.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 18 Apr 2026 00:02:30 -0700 (PDT)
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
Subject: [PATCH v2] firmware_loader: fix device reference leak in firmware_upload_register()
Date: Sat, 18 Apr 2026 15:02:20 +0800
Message-ID: <20260418070220.64542-1-lgs201920130244@gmail.com>
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
 drivers/base/firmware_loader/sysfs_upload.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
index f59a7856934c..a6dab34b22d8 100644
--- a/drivers/base/firmware_loader/sysfs_upload.c
+++ b/drivers/base/firmware_loader/sysfs_upload.c
@@ -351,7 +351,8 @@ firmware_upload_register(struct module *module, struct device *parent,
 	if (ret != 0) {
 		if (ret > 0)
 			ret = -EINVAL;
-		goto free_fw_sysfs;
+		put_device(fw_dev);
+		goto exit_module_put;
 	}
 	fw_priv->is_paged_buf = true;
 	fw_sysfs->fw_priv = fw_priv;
@@ -365,9 +366,6 @@ firmware_upload_register(struct module *module, struct device *parent,
 
 	return fw_upload;
 
-free_fw_sysfs:
-	kfree(fw_sysfs);
-
 free_fw_upload_priv:
 	kfree(fw_upload_priv);
 
-- 
2.43.0

