Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C58C3F660B
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 19:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773774674; cv=none; b=pvhENyGWJxgsa2MDebsn9n2kOFhIGqEsWoj+eVZbWPK43flSirOKb6XpUhqnMeszYdrMHKIZRTRnZ6dOZ8D+6Goh9DIIYHSpzDe2Rju8dyHajA8IL1ubk+z9oxtH1XISLkVeGNfS7W8qWdAj7TXWUDRxCPale4wHVLGg+XzY3+w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773774674; c=relaxed/simple;
	bh=e5D0ZDzECFt+AZZ7v2CLoTCt3POSgLt/y3yjbm312SA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=EHADmHSq29Vj6yKEii2OyTDq1R+SHYkAaQ4S7B/T1rc2P2MGRjBJgoqg3Aw4I2V9S+KFGKACok7BipM4Z2STa2TVsDamUQFbHAfWhthvJitOIRd121cYp37qHdjScwe7JQHLWLDtLHe3tmVDvPrXcvYSpFYmEDUvFGxVCeTPNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=axBFFEQg; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="axBFFEQg"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829928e512aso3205239b3a.2
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 12:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773774672; x=1774379472; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ey5xOspEF8t8qpOzkawTxCYiw1oiTsiTR8cXxAAxS3s=;
        b=axBFFEQgS9wrj/cE2zjd3MpT+E83Wf9Its4rzaxBv09wOX5+jGUQd/E1at/NQfjaIX
         JomIgSXC0eeg6HEgI6cuazcEdilU79w0xEz8NYtC26qmDyGXwB5/GGHneQ4Ekq2Me2tt
         UATV3gDIDGKLGUVhI9gyXyzRE9oj4IwPb+QOy0TOxv1NaYTIOZvd0K+1XLUdLNaJfkcQ
         FpuctuTM1WWXxyZG8aUV3NzrbRsrouPadhW/2DD/yClByQkZSir6556YpH6EgvIM8bSJ
         qdGAOn++R41RNP+HfT6sgQrr691OvEQNYQnHFK6iQdLNRIoa0/upQBH72g7PDVBSmpEq
         ZV5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773774672; x=1774379472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ey5xOspEF8t8qpOzkawTxCYiw1oiTsiTR8cXxAAxS3s=;
        b=DyAoAamlA7NSUKUNXdEFCCzNmu+8BJx7a/kIEMT3B/jIdcVlvXcR9mrxRNBPTLe1Vj
         k/U9ZSMmWS/rR+l7DvAEXRGuPKhNz8al3k5I7cYcxamU3w4qgqfz2HsKZGm4BIxv8qen
         Z/JQvEnWW8RMV1rYGRGbjO0mm7arBrRKutKYyXOZoPD5P9pjug4fsOaZ2hJNdthEbfXm
         FsWChSb8jFhKTBXKnwpigs0VZu9yFoRsG9KYT6SigO33d+/M7TIBe7lx+gZeTEsuA1Tu
         ZHvrN/tuRReC2rLbDhP1xDzYe/nWOsZknaKeKc3HBvpOqAF2RLq/TcC0ZFvE1YbFPawl
         BSUg==
X-Forwarded-Encrypted: i=1; AJvYcCUisArrzGKZzgWCJGgjOIrYo6XCCoZOpSxDtdM2OFe74sdhAelL1/umPZ/FO4ruJampDcNlOqkYdTTDjQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHBV0XeD2Goo3KkVjeXFGdULUKUerefdW5O46C7MT1NaZbppbb
	YL2MpEbEbbz5IdzZBZEaChdX1lrHf8NeaB4LKxfGGbTZNv5RJL/3s1Cv
X-Gm-Gg: ATEYQzwuJdllEVO+YG62UeacCF09xHXI/NKm65zHB1EJ860Up1cbza3l9Hha0ND8pzd
	KeffOL6dbd9kaUWHl5Hd7H0oBIsv3PIrQVDnA5UFLL17MvMEEtE1sKcBeg5/L14pGIkcGKmsD5F
	I0NjgXy/kOEWwh0jnAm/A4BpIe45mLgpw+jaWW1SftWaUpmGdB673l/JrXCDTKjIjXOCKAiDfV9
	rVkNw6kvilj6Yb+9JnyiBo33eNoascQy6qUK+ki2Lr0lWBGNqkcdxhgG7Y+8BbIWWhmvxnSdGcP
	UoF9cbgpVte8OTzbT4DWRkZL1d2ntIcL9r6wOYctDjO1V+YM2R1AWuV6cIMXwPdQtlyTtdae/EO
	bLs6b3EoadDKucYLnY6XP7xjM6yAxqkxRxx1u/wYmHqFfcXD75vY5xaV3gr8S5idL5DSDmbxWeg
	Rz6mBE/uG+pr8PD/AZO8VqRJqewCzFACwSt3gtFAdeyecTPD2htRnEwabujACvYxPXxL1bX7yhx
	unIsruC3sbJPbplPAxJndjNDfNUJvgmIcRI4vtphFN/VDqF8qw4QKvOukAorqFTyAwbzw==
X-Received: by 2002:a05:6a00:1ca3:b0:81f:4ce8:d64b with SMTP id d2e1a72fcca58-82a6ae4f234mr356985b3a.44.1773774672367;
        Tue, 17 Mar 2026 12:11:12 -0700 (PDT)
Received: from 2045D.localdomain (76.sub-72-110-123.myvzw.com. [72.110.123.76])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a6bf0cf5fsm224612b3a.61.2026.03.17.12.11.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 12:11:11 -0700 (PDT)
From: Gui-Dong Han <hanguidong02@gmail.com>
To: gregkh@linuxfoundation.org,
	dakr@kernel.org,
	rafael@kernel.org,
	vkoul@kernel.org,
	yung-chuan.liao@linux.intel.com
Cc: pierre-louis.bossart@linux.dev,
	rander.wang@intel.com,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	linux-sound@vger.kernel.org,
	akaieurus@gmail.com,
	me@ziyao.cc,
	Gui-Dong Han <hanguidong02@gmail.com>,
	yangshiguang <yangshiguang@xiaomi.com>
Subject: [PATCH 3/4] soundwire: debugfs: initialize firmware_file to empty string
Date: Wed, 18 Mar 2026 03:10:29 +0800
Message-ID: <20260317191029.43515-1-hanguidong02@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260317185920.43387-1-hanguidong02@gmail.com>
References: <20260317185920.43387-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Passing NULL to debugfs_create_str() causes a NULL pointer dereference
upon reading, and creating debugfs nodes with NULL string pointers is no
longer permitted. Change the initialization of firmware_file to an
allocated empty string. Existing driver code using this field handles
empty strings correctly.

Fixes: fe46d2a4301d ("soundwire: debugfs: add interface to read/write commands")
Reported-by: yangshiguang <yangshiguang@xiaomi.com>
Closes: https://lore.kernel.org/lkml/17647e4c.d461.19b46144a4e.Coremail.yangshiguang1011@163.com/
Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
---
 drivers/soundwire/debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/soundwire/debugfs.c b/drivers/soundwire/debugfs.c
index ccc9670ef77c..d4abe8bfca76 100644
--- a/drivers/soundwire/debugfs.c
+++ b/drivers/soundwire/debugfs.c
@@ -358,8 +358,9 @@ void sdw_slave_debugfs_init(struct sdw_slave *slave)
 	debugfs_create_file("go", 0200, d, slave, &cmd_go_fops);
 
 	debugfs_create_file("read_buffer", 0400, d, slave, &read_buffer_fops);
-	firmware_file = NULL;
-	debugfs_create_str("firmware_file", 0200, d, &firmware_file);
+	firmware_file = devm_kstrdup(&slave->dev, "", GFP_KERNEL);
+	if (firmware_file)
+		debugfs_create_str("firmware_file", 0200, d, &firmware_file);
 
 	slave->debugfs = d;
 }
-- 
2.43.0

