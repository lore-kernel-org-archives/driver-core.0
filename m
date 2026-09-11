Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9F143BED7A
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 22:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789165314; cv=none; b=FazC5sqT8fhoOTI9Ng1Lz1tNivH4LuFbKFIDm7AkQmBMYskqwcmM2xKFY/e4w0J0L8esu6Uwg6kNJcUtQJ/pygJTSf8ZKkWhfHnhvMb0UnIe6ZzCLZlply28v5afyd3L4Ql7Ss03sV9SuaazGSb8X4DzEdnXCO+uphgW0qNWU3w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789165314; c=relaxed/simple;
	bh=0bKbFA6rTlExsl6Cq0rBiqoF5/Pq5eHAPxz7mw8aMnE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=d51vtD3bBUb7ox1qHdSojqhZ7LeInIWy3S/SbNqUXIxfoxsyzyChVC1K/CSOqq7hYwRZh6mSEpQ6J8Q1KdHxhJWU+QSUWfR3zN27r5+AeZTHz60HssrXT64e055T1pXWoyLYMDhDaWELS+q242WSS/QB7tGchEILpYhACRIfTBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJGvlgsA; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJGvlgsA"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49ccff31419so543565e9.3
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 15:21:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789165309; x=1789770109; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=PMkIufKt71ok5WIE343MhLBROfiL7lwrRjMZxsGxKkw=;
        b=tJGvlgsAl0SPE/RbSfCsDN/I7IRwDiXGekg71GsFBONnV1mzZnyghsIOdv/vgOY18J
         NKnRMNZgyKz6BgnEJeftr3ldBa2jAD1v59agiWlhg/lHxseUuwFLAFOD4HImcOzYOtGJ
         VZxfwIn10AUpXmqQsguofY+xEDWDM1cvoaydOKovfC+3o8Aps1wmNhQI+DnfXrSlp5Nh
         x/E57CXoV11BzrGzXxZDN3VGycQ/RhtI2EchD6PLh0ji6O6D+E5QKHad0+wvsQtFGg3i
         rgLksQ4qcvKqakBeFb+kor0Iri6zrOpcDfpeD+0tucYVQBqSSebbUtBKark9qSG6+FI9
         QBbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789165309; x=1789770109;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PMkIufKt71ok5WIE343MhLBROfiL7lwrRjMZxsGxKkw=;
        b=IiqVZYOxKw8i4W9FiulWk9DHqvw1eHCevEkhzPIoqAp+kZ0Yp15yoB5snR3pHvpuEx
         1p15BT0lBb73UutCFVYFP5ZZj1gtzZ/rx2PM29R3yilWf+F0Ab6MXsOqVpG2yQ8MFNQK
         pZCp+oXZ6mCRUNfx+t4K2vFcKTTSA9RsRsbNpL+d4y3KhZxNZgr4p+izdaiC2WXxvV24
         8sGgvyYPohKIbPWMLBK41yAlmTFOP0J01y/rkKJCL3rA1wPc38tr76MUjmtHYflraKyd
         TV6IfrtKZWLBSC3woskp4SOJ37vxFdw9uptTkKHCO+eiYjBsWHYFsxsvejouHPlYMSsA
         M/Zg==
X-Forwarded-Encrypted: i=1; AKwUvBxoG+r30xYnPC+XFRkZu5nPMoQi3YYZSzvmH51DI7Mafoh7NXGpsMk+0RdiPaT9MG+s5BMIMuEvcS+aTQ==@lists.linux.dev
X-Gm-Message-State: AFuF++m5anyGzp7//UTzE6wSsceJu1PvpYV7RMAVaesFM66E1mLyI3mM
	1AKk2W709gm0R1SurZrM46HfxneEgodQnB4kJdFvT6+weWb+6CSIOm8K
X-Gm-Gg: AYBFou2G65WCuRNoH01+ZiCDYhGVJTbb6saK3iF5H3IC6iOx/0lIkzormzdiwukEWEd
	32ACgaFDDYGqJpym8xKDV+1G8KrEbpl1zmbsndBmqJG83up7fGK8VX1KGYYN69E6GtSiy+X1KlE
	aOuQUAOLwXP8WP1VJBGEDlXQfeOjyekXN1dTpIGKUOlfeP3wPNznFB3tRCcPDjznGaHUSy+ecGt
	0TAHwxDxg2hf1Pfm/yi0SocBvyzjorkpaqzfaDPneDWm1asAkLEzu3+gE57DBafDcI6uZLlF2Ip
	8aDgAhM5fHHUkAeRLlBDiDln3cwxCd8EGs9cjTzZNBlLK8t58j3cXCob2/VgdBtB7dKcYUiAv9u
	vrZf6gU8PaLoLoGXsRBR/QnzFgSazamfE84F9WoUEFBvkJUC+qG5MphNN47aOJcnz3vFwuF7moC
	PeZ1UU/fGOkIefLqOxJCSRjO4ouIzs3rZ3mhN8qXsfD0sSlDTMzJ0qNAqx8PFZzvK9sVyG9519x
	DUTJxYgSrtCX8M3QyNHzLbIgfk/+Ju4IwxKtGalIH9KUwLLs68nLq9mOK7aj+ch+ycu5G8viO96
	tU4b+4aHrLj6TxWaE6tGE8pmp5cJehCuswKU
X-Received: by 2002:a05:600c:138c:b0:49c:fa21:1c84 with SMTP id 5b1f17b1804b1-49e6cc078b0mr1148525e9.25.1789165308867;
        Fri, 11 Sep 2026 15:21:48 -0700 (PDT)
Received: from localhost.localdomain (dynamic-095-114-033-154.95.114.pool.telefonica.de. [95.114.33.154])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb2ecf2esm9720604f8f.2.2026.09.11.15.21.47
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 11 Sep 2026 15:21:47 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Yang Yingliang <yangyingliang@huawei.com>,
	Luben Tuikov <ltuikov89@gmail.com>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH] kobject: Fix the kobj_set_name reference in kset_register() kernel-doc
Date: Sat, 12 Sep 2026 00:20:29 +0200
Message-Id: <20260911222029.7267-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The kernel-doc comment of kset_register() refers to kobj_set_name, which
does not exist. The name is kobject_set_name. Say kobject_set_name.

Fixes: 1662cea4623f ("kset: fix memory leak when kset_register() returns error")
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 lib/kobject.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/kobject.c b/lib/kobject.c
index e7b010a989fb9e4a4ddb105989ced638ce02ccd6..942ee439f06ef8962386ac9b7b37ce60b29e83a6 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -855,7 +855,7 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
  * kset_register() - Initialize and add a kset.
  * @k: kset.
  *
- * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
+ * NOTE: On error, the kset.kobj.name allocated by() kobject_set_name()
  * is freed, it can not be used any more.
  */
 int kset_register(struct kset *k)
