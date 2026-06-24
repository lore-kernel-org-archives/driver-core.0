Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90CFF314A8E
	for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 12:21:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782303669; cv=none; b=mti5kdbtFxlo/putrmduep/gM5cX2oJU9nTO0m+Qki1lGj7y1fxlkPK/I71AAciQVmbJuF+du0RyAnriLwgYzMJZD6FYK6+lJK8Sxtw0x52rhNTaiw4CftOQ8fet3mTwZAZot8qeQmWwzxcLOqTMlgKQwxXy96GkBgwBBRm9VkI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782303669; c=relaxed/simple;
	bh=djQ28RzLK2l1RcmBiz08DUVR2AZOLmOYQYIpeShLReQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LTQAoqvi9O21SBHDOYm2q+1Zvhv5ZvcNBLgZpWVlAAPvFNfuihYxTOtMVXSQKu/WEIXXUXbVzHLbVSB/ddY1Nl/tTK6zON7oG54v4wZztNnn0QvnZ5wJqg1f8Nh+hbxw/QilwClZ/K99Unnpd0kR8+9G/31EfLLOB7KIlyhx0lQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JjzadHE/; arc=none smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JjzadHE/"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-30bf8b2bd20so1986775eec.0
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 05:21:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782303668; x=1782908468; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PCCEK7VuVuV2gzTBEjxPJcsskC3ffOiRqHktjmux9bU=;
        b=JjzadHE/0IJMLGXsTPe7UkTqEB91k+D+uqaSnqmECN18ilGxfF0TNhwyWAjyknLELj
         MekTiyfa3zBmFJMwe5NBkFT4fTtOxJREnyMqEb4Q2EhThS3xD8ar20lIJjtTpqn51PI6
         dY2OAr5A/nmtdXDwv4MfI28cVGaBF2WyAWd9qhcRps7QcgHYtL/nR3e8tMKpqvBIzbM/
         cjWfguAJ4WGNJhRCL8hiRnw77EMsPArnFJy5/xkjHRYxNwdUaYW9uWSTTQBJgPel58sE
         vtSyXCKTDflbfvKxjN0rfRD0B5wZ3HTX71CTgPtpD9NkinPKT2wGCZ5W/LUSaruIlhZ5
         5YEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782303668; x=1782908468;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PCCEK7VuVuV2gzTBEjxPJcsskC3ffOiRqHktjmux9bU=;
        b=eSZnonG22hx43aX9A4M11sjquqoJB7faTpkO1ezEGZx0xmTdxXs4O7zK1/h7xv706M
         +iGlAH9Cf4X9IgyD9khofZhHf+FtqRMgsnZzO+6+Xm76/lp699kOX4qmfEo//0gIfpSH
         gyds0GunZvndtP3tMwRw2PzJ2YhObXE0MzIiDmQlogKB0B9+7aDoPMIwc/LoZZuC7CsV
         JBkiQhaE2wP8YcxjPtQdkhmEPOCKecdjuojXSAw+7yJ3uU5/VrLAKilDR0DpL1DITmnj
         IztOVn2VYFKMlEEm1tHRWUyoAyznZ7FW++Cc5CK/X6sHQl3gTPCJOibAgc5wPghh4qhB
         NhmQ==
X-Forwarded-Encrypted: i=1; AHgh+RrlPB2jh5OVv9TykGxR0a5KjvdHKGm2Zx/mMMhKzL0NHUrDWrZE2JfB9EHSTpy4/rjBtQKG+rxGO2MmYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxJoSfrkm/bb27/Uj2D+WIF92C51PRFcppGNpHcnjbCmHA0Oi4h
	7p4/iAJVYOxYT/K+ryAtULDOrDhnZ3LtKYldjRknKzCsXxDbvaSXfNQU
X-Gm-Gg: AfdE7clYYVo+tDoSIWd4zhwL8+8kQ1vztZ2OtI71BSSLkRPpujFkEogAILEo1NiozLd
	hnd6ZkS72n/EzJAVTEgbD80HAN9dYianW/0Qq+ABG3FvMYl+dg7nE4sQ5EwdMc8tXxPmmus4H8P
	f0Mb44a7rFaQnueyBRS9VW9CKPOIb0/5Ji1eB4VznKybps+4jeUU6hVI8RKCcKHyYccrv74P9o5
	vgb2M34HZIdt6t/oaGQbi8Pf1t1n6jkxr175DYASW38TYYiP94wzBMhwVFgxaL3fQXkZDKy9pu3
	KMNga9hO25eRGI43T0wvTXhkInBHCwtQPwHtaB+y7ExMGArLyr61CzoZYDt2ThFA//U2cRLuBVc
	QitXTXBSWfPRugjs/uMZ2BR8fGkL9aYajDk1j3rdBJboGO2EVb6cF1Kp1RfhD7nWqumTti/Fw13
	Bo09mEcf7VC+DE3A==
X-Received: by 2002:a05:7300:8ca2:b0:306:f474:7389 with SMTP id 5a478bee46e88-30c1dc28410mr13736349eec.25.1782303667499;
        Wed, 24 Jun 2026 05:21:07 -0700 (PDT)
Received: from syednwaris ([2401:4900:1c89:6a0a:fb66:1536:7959:1b49])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c44ec51b9sm15770583eec.29.2026.06.24.05.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 05:21:07 -0700 (PDT)
Date: Wed, 24 Jun 2026 17:50:49 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: wbg@kernel.org
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	syednwaris@gmail.com
Subject: [PATCH] isa: refactor code to remove nested blocks
Message-ID: <20260624121027.GA79357@syednwaris>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove nested blocks in isa_bus_init()

Suggested-by: William Breathitt Gray <wbg@kernel.org>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
---
 drivers/base/isa.c | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/drivers/base/isa.c b/drivers/base/isa.c
index 5887e4211f80..4e9f68080f39 100644
--- a/drivers/base/isa.c
+++ b/drivers/base/isa.c
@@ -166,14 +166,16 @@ static int __init isa_bus_init(void)
 	int error;
 
 	error = bus_register(&isa_bus_type);
-	if (!error) {
-		isa_bus = root_device_register("isa");
-		if (IS_ERR(isa_bus)) {
-			error = PTR_ERR(isa_bus);
-			bus_unregister(&isa_bus_type);
-		}
+	if (error)
+		return error;
+
+	isa_bus = root_device_register("isa");
+	if (IS_ERR(isa_bus)) {
+		bus_unregister(&isa_bus_type);
+		return PTR_ERR(isa_bus);
 	}
-	return error;
+
+	return 0;
 }
 
 postcore_initcall(isa_bus_init);
-- 
2.25.1

