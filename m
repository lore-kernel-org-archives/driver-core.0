Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86A6839A070
	for <driver-core@lists.linux.dev>; Wed,  1 Jul 2026 20:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782939558; cv=none; b=rF4zRmdgzyf0d6oV/4f9BW6A7Bih+kPoBr6AqmprQGuoOmh82rA/Js5ADegPlTap2yccXvf7Oab5NrtPdpbgvaUI1ZX6CI0VBdPhMRifKFoesLCA85ARyRbynmKfGhDkXKdmN4xHjg8P+cwpu11PgrmDffIntfcTkVjKKyU+AZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782939558; c=relaxed/simple;
	bh=yb4QIfSLDkL7L9KlQAQUDVQcfZD1rIH+T1Oim2w0ycM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=q4A1IAUrY0CT4IGnOETDWMBQ99DMJR2hmPDZckZah8Zo40jO72n//+mVTBHo8+XEWf48FuSluXWFhWvxQRr8E7coqbm8+6Rbg4yV8NeD3phZgx94xsTP0dkQgAllhU4Eec1UOcskUKQEpio29bUvuBCP3sB4p8K9w4xq24/cJQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCEkTsSp; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCEkTsSp"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2c9c9913ddaso5871055ad.0
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 13:59:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782939557; x=1783544357; darn=lists.linux.dev;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=j/phQQwxkE2YFm7rrBK6bZyOrlBII3i1ZJWmJmnbNmo=;
        b=ZCEkTsSpZp8OYlYzirNtHjcEe7WI8mYk3/OeH/rTfTdky1LqCIE8Wj6durzyA/E1VI
         YRmTZkfqHzeDhQWMf5UCq5sjnuuNB6bGUljqaJICNUeNkr9HZsoL0/yDqZIzArwTaQXa
         5iRIp7TXUKEjWDE/uGko9ys8pq8V0G3nL+O78kJRQavFZ9WMN5zsS2kjvs4Ky/G6beoS
         E0DBUIzA/Zdyks25XDFzLT/Qzvw73t27Zs+kGyFFHtU2DP0pxSegK8DLtvXJBdJcSxWD
         Tj7X0xPGD9dOxkSO0pAOj/nGlDzu1EmH2m/3nvPksYjcldLjL76XkQg5xFEmbhw/+XPI
         PLYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782939557; x=1783544357;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j/phQQwxkE2YFm7rrBK6bZyOrlBII3i1ZJWmJmnbNmo=;
        b=k3htILKvlHj2Orvkkzr9GDhP5tvRNS9l3mLbfZEbmflun8vzjTDHYEIEptWBOKdltc
         1KLhN/sO0CrROKiKF6srO25CXWVs05hLu35wm5GUGsWoqIslSJ5HV+RrDRByaaQlU4mp
         vxOhbkcxdwpNE6/w8F7LxVvbB83lTpD6CKoHd4K6/KWhAhJAyUFFnWGX6iqPA3+STpPQ
         Y2iXw5YrxSO075JIjpehJmMt4V2Iz2VQxwV82lN1sKiUEmxumDfqC9gn6xDYlvBUH+F3
         wBCiZuAJ6tx8LDrZI0ek3tddsVTQOLd90sZoAcBh0xVYAjYaA7WwluyOltkh5W9y9Q4d
         JD1A==
X-Forwarded-Encrypted: i=1; AHgh+RpBZXsJ/9DAUWPVacKWFMSMOSpUfRvuQNAypMMtKoJR7SxKyY3gi75IJ2H6yxOU1+wJsgV1gRpUEvnOSg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyz1t7e6BQC38IfgIMzLNd0E0ZOKtgs29/RRl0Kpk2RlFFa3YGP
	JMD3uUn12KuZHDkkOJ5gds5Nlhvk3NIParGXHdSCYk9foCZYJ5LQ34/B
X-Gm-Gg: AfdE7ckeiS0PNmLtmE8gljHnZ6tds9MvzCmdrVPjxwxybIiWCVcTUtpmT3XOdQcB5c/
	IjkSN4Z0OamiLnORrieQhqrUNmwl25Yv2rLiq1qVeNJV76sh68GVCJy5W/QuBbzwCVHMFGSfp/g
	gUKhe35+VaU4S6HyIxMUApOBd0ckPXpp45yqAjSl9PP7UjyGqNJNOmd/GOM3+2oK0qJ6NlJP1So
	dC25wiX0VY0ALggE6BY94C9bmemn+1XMLjnW7uGZbK8O1deKW2xPyNuhXlfsPLReOd54aortGI5
	EB0VgCZC1P1e40vj+P/CkyjHOZfLo4pXm0lnAn/LN+Ywzvs6Ygp9OOK0sZi1Te6fTOyyc98r5ln
	rKastaQ70LtB7UTQV2CxBAnKDKWL9sNNZTkzB7eJfCAZa+eg4XPMjmzo0sn/+xhbRFQGhVFuCvi
	9kgBLMt335KTxmeA==
X-Received: by 2002:a17:903:26cb:b0:2bd:5ae4:26d1 with SMTP id d9443c01a7336-2ca44a05f3amr60752555ad.17.1782939556538;
        Wed, 01 Jul 2026 13:59:16 -0700 (PDT)
Received: from syednwaris ([2401:4900:1c8a:a60b:b883:ad5c:cd79:859d])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13b3c870effsm1314988c88.12.2026.07.01.13.59.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 13:59:16 -0700 (PDT)
Date: Thu, 2 Jul 2026 02:28:57 +0530
From: Syed Nayyar Waris <syednwaris@gmail.com>
To: wbg@kernel.org
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	syednwaris@gmail.com
Subject: [PATCH v2] isa: refactor code to remove nested blocks
Message-ID: <20260701205857.GA4113@syednwaris>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Remove nested blocks in isa_bus_init(). This will make the module
easy-to-understand and make the code clearer.
Previous discussion regarding this change can be found
at below link:
https://lore.kernel.org/all/20260504063518.515620-1-wbg@kernel.org/

Acked-by: William Breathitt Gray <wbg@kernel.org>
Suggested-by: William Breathitt Gray <wbg@kernel.org>
Signed-off-by: Syed Nayyar Waris <syednwaris@gmail.com>
---
Changes in v2:
 - Make the patch description more comprehensive and thorough 
   in its explanation
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

