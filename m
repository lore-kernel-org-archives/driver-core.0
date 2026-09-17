Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 924524FDA5D
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 17:08:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789664892; cv=none; b=fHfPBINTWHMkgKU5GjFECdrIdfBUtMem1bhtPivh/GJG72MAoBF+xQGjXv9q0VNVy+GCmPcMQzUUYytDAiCfO1TCT5ob6Dur79UMeNTb/H9DuD8JOYGos1wNTU0QYRj1bwhni7gGkZ3waNAe85kpdA/e3STv5JzMaRIliHnhU7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789664892; c=relaxed/simple;
	bh=bWkFqhcxRzjwJio2bUVTGTf72jyWIZPzjQrvTOKs1HU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=tNhbEqtUh2ufI2NdLwbYcTZjwZT6L8EKL9loEKyp/pwTlXHpdRHlZxOiDp+B0swfikzr6hOqruMGBMoV4F9gdQ57lqk+n5A8bqh01dkKqO8V3Pgp1pLyxZ9q2dj+psDQyqyv+2c0fG8y4zwPL1uxs/QXsJliHaejVgZe7fZMT0U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=kt3HgxS2; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kt3HgxS2"
Received: by mail-pj2-f13.google.com with SMTP id d9443c01a7336-2d93ff61046so10091165ad.3
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 10:08:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789664890; x=1790269690; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bWkFqhcxRzjwJio2bUVTGTf72jyWIZPzjQrvTOKs1HU=;
        b=kt3HgxS2cyLMQ9soc8svrKW+G7Pv0Meycy9310ffNQWiJ1STwrP2oQk65i2LU5k8WV
         dmFZbgS/q6UDyuDnwsuLqH4OsHo9KoEosm7TdBZL5fEkrdJK+58TuSn/F96r5wcbLp+L
         DamLbFibbEkddsCqOWexWvScwlCCi8wzYYMN95ElnVgd0Pio6dphix8Tx52vZZZjiWPJ
         Ph/46GSgwr6dQWoiFZTvXiNaXgLi/BsYe90evRIy0HNu/M6vl3umP0qN6eA8ee2+Kqx5
         iRdlv5r1sfDyqne+biSK3JQiNkSmuDIihUBCAOG5DOkNzq8s4h37JviuLVGTDRern7p3
         2hqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789664890; x=1790269690;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bWkFqhcxRzjwJio2bUVTGTf72jyWIZPzjQrvTOKs1HU=;
        b=NDaDpQxfpdmUUu9iqeKB3GJRzxS2o3paB9ghvDAFJGDDQrBRy61wURn6wyff/tt2QF
         g79/KJAT94zWU/LX+MP2ymjczMHIhocyG6KRq/R2gndrcnCsnzNLl5eUOLlnOXjGnN80
         8lyLcAappG6C1d/ZYPyxO2ed69aYvDQvM/FYOmtU6VhA1KH9+N+SCDDcfNHs2IiiWC5v
         JSBK7HvwF10LQAwTKIsd7ZzxI6lwgIJeIELSEUaN7nWUmiSzdAHUubHphyGvtUNSRypI
         hs0vG2fLnRMh3EdWM63qMFVPw67gJJj8ZN+7vGQTuZEHDsN+wpYLnOx8kbDGs4AUn8Fu
         dcGg==
X-Forwarded-Encrypted: i=1; AKwUvBz7g1iylRRbd1OgIqwrGm17fa6akCST1n79BS5dmDY5Mabu46WAh2U5qESsd+x2DD7nQySBKwmvyhi3jQ==@lists.linux.dev
X-Gm-Message-State: AFuF++k24iMd3PO3V/rhCZMtRZ8gQw4zgFoBySvviVZez420vFvNNt98
	MfX2g+xGQF7/tSRsDZU1dVhsS/E66r5PAAybdoAz1mkpdIPUhk8sQOhW
X-Gm-Gg: AYBFou2iyZPQ2vCxTui+hdKGBi8GQ/y32piDN/qDIMle8QFJiZXeGXTupqzZeullI8M
	FDtWfijcnDQ4h7QXl+tzlRNhjehcQLuR9baqplMKZsyuCwssC4adJ2Dws28WWOmFGwPs5KsfkqY
	nwBQokG81fR3CuetPJZHRozc7PCmNm90urjb/hy6+pDu9Cw8f9tj7U1nJmlB5bhTYIGOeuMiL6o
	HcSyalRv5mPoUnaH6KCNvCT4cv9YlteGUGwcosHnLM02QEz2MAkD+liff2Er2A7llKd0o3gDE+G
	Yh79rxm8cKm5ZoV0riI6gg/kUrvKjSWKuaoY4bE0KZseOPjyLC8cMP902o6rbVEeMWaLDGuJg5h
	6DHDkJsUeaZutGQnLyCIaS3f3eoEZhVl1psmNOjMQMthwu5VvoO1k9c7BRc1Z+QaA2R7EKtMbpt
	92zbEEezZTtM09PeulDa6LPxtYnvfxb6CLZLH0aVPqiYCDp+d7eY7M7CT2wXqR8HJi5/NiMvZ1
X-Received: by 2002:a17:903:1b63:b0:2dd:ad74:ac1d with SMTP id d9443c01a7336-2ddad74ad63mr17538865ad.24.1789664889696;
        Thu, 17 Sep 2026 10:08:09 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd90c7b215sm28274645ad.72.2026.09.17.10.08.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 10:08:09 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: rafael@kernel.org,
	dakr@kernel.org,
	driver-core@lists.linux.dev,
	stable@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 22:38:04 +0530
Message-ID: <20260917170804.102139-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260917144206.85836-1-adarshdas950@gmail.com>
References: <20260917144206.85836-1-adarshdas950@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Hi Greg,

v2 adds Assisted-by and Tested-by tags as requested.

Local testing: syzbot C repro on unfixed master with -smp 4 (parallel
runs) reproduced the KASAN UAF. With patch applied, no KASAN.

Syzbot testing: #syz test with patch on upstream — Result OK
https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0

Adarsh
