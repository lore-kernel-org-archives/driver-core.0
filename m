Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2EC43CCFCE
	for <driver-core@lists.linux.dev>; Sun,  3 May 2026 14:18:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777817918; cv=none; b=SPSR1KoSqXW+78Hdv7ecJYNinf2VYkip1yPvrNJW+EkaOrjlp1UBeYuYGcHq4yen6E7BZYXS6KdTHigdhPDloue5ODsCxihrjviZ1Rp4MwE2hEguphDpFhsQBgfqclY+NF0f2IRFBwrsmG8sBz5i6jiHCJn7GiChl6OWJErwJz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777817918; c=relaxed/simple;
	bh=sqaTQPVFvIZLVsem9K4G6ROmfXy7QKAVwrN80CPMxHg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=EPHpTYUBq/Pn3rnu1dhAxCCmZUmTLRH01AkM/43vAmo2de53zOQEy0YIZLQ20liZnp8mqoV1KLndG5pJwr/lJBypv3PdzJiSkEcKoP8fV/e7p3pf0PzQ04gLyKqCuopG2r9OV9+7TfjLJwyKoeM0aUVNK6MQGi7gByiLOVreSj4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IpC16wr5; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IpC16wr5"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8296d553142so2221357b3a.3
        for <driver-core@lists.linux.dev>; Sun, 03 May 2026 07:18:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777817916; x=1778422716; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VX7ux5DjVKvhzC1a4uMlCui6BTuIBQQi6MdTpG/wki4=;
        b=IpC16wr5NXCforNUdyoH1WdcnVCdGrcMXzgh5mHc0CYkowe+iF5jdjvYcPMiRkX80W
         RAKGTKNxxUMtSHlmgasSeEDK0fLn7ZSDHN4P+k71ZojEA9Jl26CdN3FTKu1X9Y9aVopX
         BUmpx0DUCSE0V9zCjZQRZ6QM8PyCLYXBI0CnhKqOysysWRznSHZTE2yrhA1FoXmrdJWL
         ctHsLs+4KuEOoVydxAVEsR5ZAmtjt77Z4Zn2wVUFoCGT7LDvUkjvFQ69UvisqCydmdHU
         IsmG+2YBR07ad5lhqEGkiA2S5NaapPO2IryjrkpVWyc0ERjtJ29dmTPrvwnes7Yr6CAd
         LQqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777817916; x=1778422716;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VX7ux5DjVKvhzC1a4uMlCui6BTuIBQQi6MdTpG/wki4=;
        b=Kpvy08iYgQVtxhSO2BdnnkGQiEzoj1eSFJhfIwRXJKEX+uBiylZLfh+ZRvyQMwIZss
         3vSLM42ToLluWe4hJY/w1lazuQ8g6+ewOlDKoxbzroiIUVE+aZ64l/nlMhI/D19Ti8wZ
         Gea2AQu8MvPWvYUvFzlhp0tWgpal3ISrR8cDWQ28DkbCqqf099jYfCWeyboqKrHzUVU3
         qDHHDddP4E8HGdRHuqwa5cng1PG0hKWYujdNJBT4GBbXdaXXDa9AipBIIaTZ6M6mlDGi
         H8aHEUowsAIETCxucloYYS4zdfPUefAZG3j5b46dVhFPsIdudxkUZPsK1JCA+NJVFHk2
         ZjXg==
X-Gm-Message-State: AOJu0YzKNaK+q6WYQMqOBDhxYJXH0lf+wpcrGsWK1XZpsCc11uu/dZA3
	4ZY/VoeiiyuFIbL5v3bKF7hl6mRoJI0nocRhDVPif7+/PaWySRcoZ+Xb
X-Gm-Gg: AeBDies1WUik7EhtMRhPAKWPMCEhWbO/DPvn1mz/OzhH04kFY2UYWmrsvhdi1tv3d1R
	O+1OdzAMfbgdxqAaZbSluxVmmTxAPFcDJUJHtmJtcMdPvii75ydF+5r0LhRlefHTjAS1R1ibNvO
	hvEpPbwQiiKBWmvCDU3Vf8eV0HENF0XI3p9A9IgBYl4PKx3AEotwswsGGOaGk0PD1N6oC37vPov
	uOckakh4HGZL+ynUrqNTrG8TeInqfjcfbyICd45RDKdDtofZ5K5UNiJOeiTihMefzQcP9rU0qwq
	DUJ1kfZCyr43qvy6x4d0guZdjGf6VFVQLh5+C1iNq+hKC5OELcqDw/yZf1Uht17Xmu3YrH6hsiw
	NsGv7NrQKo/GVgsUqAnzGJtnTsTNY0uBMAnJL1Mr+rhad+97u0BMqwCJ/24fzzwIeZ8Lm3WF7I0
	W00v6+mtEqaWlBR+HHQc2tiW9VQOteBLKCcFIDEqAspOlzeEUdPrR2ngJ3/akrV2XMZkNMLf4p
X-Received: by 2002:a05:6a00:a88e:b0:82f:7252:38cf with SMTP id d2e1a72fcca58-8352d1750d7mr6059481b3a.16.1777817915741;
        Sun, 03 May 2026 07:18:35 -0700 (PDT)
Received: from localhost.localdomain ([2401:fb00:ffff:fffc:0:b:ac10:f0ef])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b4d3dfsm9477547b3a.50.2026.05.03.07.18.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 07:18:35 -0700 (PDT)
From: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	trivial@kernel.org,
	Prabhudasu Vatala <prabhudasuvatala@gmail.com>
Subject: [PATCH] driver core: class: fix typo in struct class documentation
Date: Sun,  3 May 2026 19:48:26 +0530
Message-Id: <20260503141826.27462-1-prabhudasuvatala@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix a spelling error in the comment for the ns_type member of struct class.
Change "detemine" to "determine".

Signed-off-by: Prabhudasu Vatala <prabhudasuvatala@gmail.com>
---
 include/linux/device/class.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/linux/device/class.h b/include/linux/device/class.h
index 78ab8d2b3e30..9db1d61ba743 100644
--- a/include/linux/device/class.h
+++ b/include/linux/device/class.h
@@ -34,7 +34,7 @@ struct fwnode_handle;
  * @class_release: Called to release this class.
  * @dev_release: Called to release the device.
  * @shutdown_pre: Called at shut-down time before driver shutdown.
- * @ns_type:	Callbacks so sysfs can detemine namespaces.
+ * @ns_type:	Callbacks so sysfs can determine namespaces.
  * @namespace:	Namespace of the device belongs to this class.
  * @get_ownership: Allows class to specify uid/gid of the sysfs directories
  *		for the devices belonging to the class. Usually tied to
-- 
2.34.1

