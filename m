Received: from mail-pj2-f0.google.com (mail-pj2-f0.google.com [74.125.227.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3BA53AC0C7
	for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 10:01:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.128
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786960873; cv=none; b=S3rpBVVXpO0/UU7hduJVYrbv+kP7U3KjpPOHNQP23UOVOI8S6T5snigcTdCBVGqnf3ejw89Py7pzQlZOIvbqYW++Y8Ut5TcbB7ceP/r/mk6k4n60hZevB7vxcDdB0GJnsCo/MncE12qNg4Fgj+t9ozSzn+98jL3iw6ShKSWjC+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786960873; c=relaxed/simple;
	bh=QFwGflSg/xbQtdgC7RkCRrTPWLiVkClzm6dle6b12Sg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=FkERjzp2TwUvrnO2P6RoT9CuttyIbat+vBoGvK3pgvUjkeix/FN7LBpedDx1OK6Tq8lWzACrYXfqeBXrKwxbJsrxdczKB3VGrJyNd0fInB84YNpqo7TRRNhoTDFdlsmnQDeOogQDoQGSWYfVO6ynF8Sdoc0iMqFK5CE9y1Vq2uM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f0.google.com with SMTP id d9443c01a7336-2cc6bb7476dso5637025ad.0
        for <driver-core@lists.linux.dev>; Mon, 17 Aug 2026 03:01:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786960862; x=1787565662;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SFJhRYMaeccSWN7O5plNjrZM7NMQ7y9/USAmz9QApWk=;
        b=VquStGaFPmMTVc7kMrKxDspmkWsom71ekvJ2fYSA2vZrlEQIJvaIfOboJ8BBQT8ZMD
         YoXQPdDx0HAqhOfF8pNPsisx5bwHlY0wjCjY4dg2YAF/cAv7QS/7OhwqDV34X1lByiSO
         nyfCsKtqmal5nkpSaMBJ6qHikhQW7fhdI35LBzywnI5d0M+eDRY6GbrhV8F6T0Zz0Nkx
         /dSbmiYkY5AU6Zewunoic1+QmOm6NVGkuykchmN3ledueGSAmiEPJVu9GthOLYHDtaC6
         3Jq4qTANS4W+mdJIlp88so3/W4or9gABuQ50sDZhurH4KbmCqpJiz43hvmkgFpARvXzD
         EGbg==
X-Forwarded-Encrypted: i=1; AHgh+Rpg3ZIxGt9gvdSUZCWsHWUHnWIS2OhswfTMdsrO2e05cvc3gFcnRJnC7NnkT8tcqRFh+GbPazxSWEo1QQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzf8wVQQE7XGyMf5oLpRv/9nnyjL0U+SADnB7Kmv37tUCEr7PkV
	HNh5Mpcy190d/WJaW/awzNywrGASxYTouoH09QiKzN6QGT6dEbutF6r3bb9NSQCv9Ik=
X-Gm-Gg: AR+sD11IGb4yegkTQIt/uU9AeI8YzMe26Kc7K/IPT3DYLLko21OqYZKDJ7QgvZVmA9C
	VZwsCnJ8WcscOT5S8tt80XjWjgE+Yg+2pD1H/J1EFZHfnMzS88sKnOHxuCsKNh3G6ONIo6gDPa9
	nThZU4cCIa8Tl4mWrX+2mA7WIpz8D4yxtW741CT8gGkAkpVcZGGgKbOsKOYiJKe4ETFCGhJGE9F
	3p2Q1cQqNnNwo04xrQWWD/NTjXqu+XbQiwf3fvB1FDcy6M6wCQpAo1QlTdl06Unvx8PI0OhLYNl
	UQRhknUEmH0VYgzVdlVe1JpmCyVoxwViXuisG1hVrhiGzUR5wrXYG2R0UXr9udqlmb07xgwiVWh
	kfaIiJcnM0PtU5136tvOXPmNyUMx9s3jrzK4INTB4e53CCwwI96ZxpKdfChgdBjYOcBplAZZOSh
	Xhf/7ggGP5CD0Q5Hp0z5HB52IwqDKnZxAi59+8Z/3VeYktI0ikvSNyrFPyTW2iZZwc8RbkPlCBn
	iBOzvPC79E=
X-Received: by 2002:a17:902:d2cf:b0:2ca:c847:8e41 with SMTP id d9443c01a7336-2d3affcc11bmr193339195ad.11.1786960862073;
        Mon, 17 Aug 2026 03:01:02 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d5c1ecb162sm274525ad.69.2026.08.17.03.00.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:01:01 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: christian.loehle@arm.com
Cc: Beata.Michalska@arm.com,
	Ionela.Voinescu@arm.com,
	dakr@kernel.org,
	dietmar.eggemann@arm.com,
	driver-core@lists.linux.dev,
	gregkh@linuxfoundation.org,
	linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org,
	luoxueqin@kylinos.cn,
	pierre.gondois@arm.com,
	rafael@kernel.org,
	sudeep.holla@kernel.org,
	sumitg@nvidia.com,
	viresh.kumar@linaro.org,
	zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com
Subject: Re: [PATCH v5 3/3] arch_topology: Add topology_update_cpu_capacity() for runtime updates
Date: Mon, 17 Aug 2026 18:00:42 +0800
Message-ID: <20260817100042.1291471-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <840da3ba-1d65-4a28-a072-a586ea4dfce5@arm.com>
References: <840da3ba-1d65-4a28-a072-a586ea4dfce5@arm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Christian,

Thanks for the review.

> Does this actually work if highest_perf would now be the equivalent
> for >1024?

Yes, it works correctly. I verified this on an arm64 8-core big.LITTLE
system (kernel 7.2.0-rc7-next-20260810). The runtime highest_perf change
was simulated by writing to a debugfs hook that invokes
cpufreq_update_limits() on the CPU, exercising the exact same code
path as ACPI Notify(0x85):

  LITTLE cores (cpu0-2,4-6): highest_perf=1900, cpu_capacity=670
  big cores    (cpu3,7):      highest_perf=2900, cpu_capacity=1024

The normalization is purely relative:
  capacity_scale = max(raw_capacity[all CPUs])
  cpu_capacity = (raw_capacity[cpu] << SCHED_CAPACITY_SHIFT) / capacity_scale

Test results with runtime highest_perf changes via debugfs:

Test                        cpu0   cpu1   cpu2   cpu3   cpu4   cpu5   cpu6   cpu7
---------------------------------------------------------------------------------
baseline                     670    670    670   1024    670    670    670   1024
cpu0 highest_perf=800        282    670    670   1024    670    670    670   1024
cpu0 highest_perf=2048       723    670    670   1024    670    670    670   1024
cpu0 highest_perf=4096      1024    475    475    725    475    475    475    725
cpu3 highest_perf=3000      1024    475    475    750    475    475    475    725
restored to hw values        670    670    670   1024    670    670    670   1024

Key observations:

1. highest_perf=2048 (>1024, but < capacity_scale=2900):
   cpu0 capacity = (2048 << 10) / 2900 = 723. Matches exactly.
   capacity_scale stays 2900 (cpu3/cpu7 still max), so other CPUs
   are unaffected.

2. highest_perf=4096 (> capacity_scale=2900):
   capacity_scale shifts to 4096. cpu0 becomes the new max at 1024.
   All other CPUs are re-normalized downward proportionally:
   LITTLE: (1900 << 10) / 4096 = 475
   big:    (2900 << 10) / 4096 = 725

3. Restore: writing back hw values fully restores original capacities.
   No state leakage.

In summary: the normalization is ratio-based and architecture-agnostic.
Whether highest_perf is 100, 1024, or 4096, the relative capacity
model remains consistent. 

Best regards,
Xueqin
