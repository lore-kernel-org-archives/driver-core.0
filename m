Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EFD3D6663
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 06:35:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022103; cv=none; b=WopPXU8G2X72+w/umPQt9Yijkdhi6wM8UbPtxZetZ5wUsRVGu3gpRtFAgJo7a3ZN2Lypjry8wx2Gk9Zp8+fnFuXENx3tW9b8wmC6461vSyCg8u+tpLKRlnPIOye7+Vy36lYbdbvdvNHQobGfybrSbq7WBjvtZ+hh+BeWPyON560=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022103; c=relaxed/simple;
	bh=3dlewbAKl8NocA7IwnXM4yE78ovk2+W6PMjEtEdYDR4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=UPdVbpttCSHY9wfkwnNMDNhLnMHIxACuOL66/pku1NE3ZRm7i7/AqiuSI/Mz1xQd0qG+tE0/0bFsYzHR8S0Lv6BGi9QLq5sioxY7rVMyGVHheaogjRzmN2ZC0AOoh09FgVp9cjrwX+wG/0V1tNlfjVDnZcGz8aeDeP19yFriK9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ggyuOIpD; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ggyuOIpD"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso56766795e9.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 23:35:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022099; x=1789626899; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=ggyuOIpDNWGAWx/yLHIrrj/8+81N59FiAEmMHlw1G+tve+gq1kb+cQHUQGAyUsn47T
         ydvySpAfMV3FlMGXDsr7wPO3Rf7WmEZye/7WzkQ6lEnORrm8hzw4LRH+6pyOndPt4APA
         LLfVKOLQk7H48FMTknNPX6I3MqlR8gd6NgyHdzleGjWooxLB1qBgy2b9JII3ApJCVd1S
         RUQ3C5VGooByQqy4XBdxRAG5gIpNMFsvywcMsk7RSdl3jcoLrcSg3vvyAQzvzwi5q6F/
         MApcAJRQH3ARkkFQUa0xp7nPlJLzhDzqb8W5+6PEgIyTzDfj0msaiBPmChDpDMW+ptOX
         Zh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022099; x=1789626899;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wrGQmgTiJm55JhKTBWHPGvE5gvx0Uq3tjEPdNSRkMAU=;
        b=ipk9KpDuBFeGwByRGTrfpn+QfHlI8prlV/81nC9W6/UogbIYhmC45UqLk+IWSdq6MF
         bb/XHa5jkud5nn8sMVKHyPEQWjJz0LGYuDC8OPlT0g2wllMgVYlzuEj33YCvLlQHDnlN
         Y2RG3VxcYrJu932i4lCZlZwlmBiCfB/W1JXwLkNl2j5E3Hp3aw4AzeDyUnpBNH0tMRFf
         wOXXFIJeaVKy7iHQ5gV4kSfVapOSojZ/H+3dAtRW42pOBNc5IcDiNelHfS7D2LoGsdvw
         1Of2XjD0QgbnP/eYbCepNIxNAIGIwSe1SEeDch1ZDvbn02BzMLqmDmZ0bzf40IFwC4rj
         LzMA==
X-Forwarded-Encrypted: i=1; AKwUvBxzHXH9zJfvfHKkIok7vhlFIrr2YzPjlt2zGxoMOcMzkvMPUaHR/CL18YkCDQaBs4S4slHUFIZUILPQiw==@lists.linux.dev
X-Gm-Message-State: AFuF++lbljFUU64bkViPxyfQVp05vjljxC16MtrRipeaInucbtx3+a+X
	FcXEUYyftrDJoUgggsxfGx8DHtl3rUg0qZ3SWwXItRUFh6yP7IcAR6cJ
X-Gm-Gg: AYBFou3pn0jkbA+hgaBTtashHZFev4XDODvRrJZTN557QKQiYRg2W2d81kY0q/FqO5u
	GiM+6uochXvNv+oCIh3wulx6uPKeW2xUnAIu//V8yGmbMmJVTOoZY3WrJCk2/qR0KUmJNubcV1z
	kOV8FZcoTQ+UGDge5vvVRMCfscJZisB6rRTOsDyzh3JyAeagpg3iYvPbhFKIn0lRDiT7Qnxclqk
	/pgTrcriDKqJ5CukwRS0cvPA8m8mfjgDdwlaM/E7fM5TSajwgMeU1EgQlzZksiV7uKqrDVkCP/d
	uM+K/ahZ+Rv5vacr66wk6IpN26pBiOoN6FnNMcscAME1maZ2V5I1kS5whge/nnjtyZaV1i1lCiC
	RXw/E0oj9OzSW8feev9mu2otBMqCiGt0ftvGbVFwtvjxM7lM3Sbqo55rgRL52v4J6sEk6rVLYQc
	oN4iIsj4akzLI7eHZDajGZH/gntUwywVTzc5ET7fS88sU/a9gjLFTqJ2T3XtA96p63Bw55wKjnN
	d6ruh8dbenk14NE5Di7GnOAkwFil0JLoqy2oxRKeXE=
X-Received: by 2002:a05:600c:5254:b0:49d:5ff:f404 with SMTP id 5b1f17b1804b1-49d05fff5abmr273112235e9.1.1789022099342;
        Wed, 09 Sep 2026 23:34:59 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm2595255e9.1.2026.09.09.23.34.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:58 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	jonathan.cameron@oss.qualcomm.com,
	sibi.sankar@oss.qualcomm.com
Subject: [PATCH v3 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Thu, 10 Sep 2026 08:34:39 +0200
Message-ID: <20260910063440.4677-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260910063440.4677-1-okerixx@gmail.com>
References: <20260910063440.4677-1-okerixx@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

arch_freq_get_on_cpu() computes the product of the frequency scale and
the reference frequency as a u64, but assigns it to an unsigned int
before shifting it back down:

	freq = scale * arch_scale_freq_ref(cpu);
	freq >>= SCHED_CAPACITY_SHIFT;

The product is truncated to 32 bits before the shift, so the result
wraps once arch_scale_freq_ref() exceeds 2^32 / SCHED_CAPACITY_SCALE,
i.e. 4194304 kHz.

On a Snapdragon X2 Elite (Glymur) laptop, whose boost OPP is 4723200
kHz, cpuinfo_avg_freq reports 524283 kHz instead of ~4723200 kHz while
the CPU demonstrably runs at the boost frequency: a fixed workload
completes in 1.72 s at the 4723200 kHz OPP versus 2.01 s at 4032000
kHz, matching the 1.171 frequency ratio.

Keep the arithmetic in 64 bits until after the shift.

Fixes: 16d1e27475f6 ("arm64: Provide an AMU-based version of arch_freq_get_on_cpu")
Signed-off-by: Oleg Keri <okerixx@gmail.com>
---
 arch/arm64/kernel/topology.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..0eca321ff113 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,7 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	freq = (scale * arch_scale_freq_ref(cpu)) >> SCHED_CAPACITY_SHIFT;
 	return freq;
 }
 
-- 
2.55.0

