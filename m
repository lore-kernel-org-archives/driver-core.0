Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED13C31F985
	for <driver-core@lists.linux.dev>; Sun,  6 Sep 2026 16:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712684; cv=none; b=qeCEwYWHk6kiZFWV3eukShV7jdD/ZxRW3S50N/VOafyNWlOjppUyYx+mYVvb9g/PsQX+zO9d3pdVWMzA2Kuk0v7wx4hs+jYBpJ+0jkUapOsNvGp0QlNn5Sigr1NNb9Ch7jsqBP9KfyRjeCX0nSVPkCb1Ay5cLz3AKYp4rlH2T44=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712684; c=relaxed/simple;
	bh=xZEc8ZW5YLh1fkmHxMW2xGQuFg33secRrvQSBF08CHA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tVxkSF0JCjepqNhcefko7VzbqsFKrIxE8u28hHHTgaGPo03BWyXarw08tt2Qgq2t+u4H0mHYHLq/gWKUv20McbwOtEuSAk1Obp9BotfIWCC6xSt+2QM0a4iuSIzT580cLfs7ySrno4qaV2FzvVNRs3XxpJ8fcAjymrQYpLQRW54=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JuiDWKct; arc=none smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JuiDWKct"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-482e4998d28so2036475f8f.2
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 09:38:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712681; x=1789317481; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Zr4ziqFVq8nKF64tCdjpGyyZ2ASlabQVBOQtlNWXNp8=;
        b=JuiDWKctT7pv/dLY3eGjJ5WSbqn2LxTDI9J4O1i779jqQM6KvQf4C0/TbS4mEqYANg
         wN7R4rSpRji/32Db04786B+/UMdQ5YwFJBfNmI777LG8onVFVA3fU7rh9aCWirtKfk3V
         ibcmbA20KDXSlEokv6e8rykFbloV8BRERFJZvjP47DSeZ+xeRsBTCA857wf3IRq2nsOQ
         nXQ3yXvpUyQbENYep3L8Ira6DEvtajEUqkXLJPd4mDoLWGtqzOYZOsGXd08JrE96F/OC
         Rdin+BUvt78bgQ8Rh8GYqG3CYZLj/inrF/ipch1wgpYeI1OhMgz/MZO7hVcDvSpyZDll
         ffAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712681; x=1789317481;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Zr4ziqFVq8nKF64tCdjpGyyZ2ASlabQVBOQtlNWXNp8=;
        b=MyX1YXkGnifUSb8FipJkv5YIlkddqsMsxjK1j2xPsqZ0dEU/9iArFFkyCfu2F3o8KE
         f+xufmfvlu4vR/87kvCAaqOFCuFHRHP40HLGg8VwnKESG4o5RH3CvP8X6pn6+gootdhT
         nPkl8KpRzF6lbrliHfhTEZxYFT1Ky2D503CvKrE0ZFDVUId/SP8BVmBzKQsd9uTK8+hn
         NES938UzQ9mZjA2VGiauCc2FFS1zkN9fXHjqcKKRiXvGIEzYyWMijQMwUaZ+Ux/k385j
         +gi2D3kUALEXvATsSn9OX5rvt5NvVWO4gCCvWykqZpjuKycF/AIyl0jx8zArUZEEAR4x
         SpCg==
X-Forwarded-Encrypted: i=1; AKwUvBwk+A7VzOaOwT5q05olEIkFSmPBvTFYMdvfWYgTRMH1+RMkWlyBz8SqYao5Kqn5Acr54EgaXyA4rA6FOA==@lists.linux.dev
X-Gm-Message-State: AFuF++kDXDqL8XTNXVI+qYLmxmVGP2bR3k7z1v32PfZnA7gL37bW+B9h
	wrYLr6k12vJHkdnN/IoFCN3Rh12ah/w3q7ZRhg9kDMJozxil3gI/IJ/q
X-Gm-Gg: AYBFou3WgPGNWpCrPCn8CVh0dN9csIxuaXjJ8h6tXFcnXT4omnuS/1/Fs9tC2UpMswA
	RCMQt9YujNwzAek3rcGnf5PNCY39fEigEEgm9KQfqtWwuCoI4rkEVUPJ8DrfKUdtQ+f+W08wJVw
	tFlxa0eKahSeL8PF9sabbgol6D2E9cRdXwqLEDtGUYR1zGlgpGGhwjGt0gj/6GGM77CMO4fSSEQ
	7F+Vc9l06RrnyXDHZWL0j70yuDKTrNPPDtB0VpR8GvHxB80ES0TvPOpQcCcxqKI3YgBO8DmWVef
	RYIiailLArRI4vUe2Y5RZ1yDxrOSs7EKf9IgRCJgCVkDEOGnP7VKG7J5ivJvYx9VpyrUKtIfaNk
	aqC+sjlrz4EtHpsqexOS+KPGJTXYpqLYvRxnEenjY2SsxZvmK4h+NjXApljUWNpYh57aBdA+lh/
	CiMCSf9k5UpVI5ISggM3F/WY5nM+3OVzdiP+SBfO6+Ro4srZacY3kCXpZboXcs6PK0EpyVh9OUM
	a92KGw7u7jEk10OEErKZQOx26w=
X-Received: by 2002:a05:6000:27dc:b0:485:8eba:b5eb with SMTP id ffacd0b85a97d-4858ebab621mr8247866f8f.1.1788712681094;
        Sun, 06 Sep 2026 09:38:01 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.37.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:38:00 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Beata Michalska <beata.michalska@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Prasanna Kumar T S M <ptsm@linux.microsoft.com>,
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
	linux-pm@vger.kernel.org
Subject: [PATCH v1 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Sun,  6 Sep 2026 18:37:14 +0200
Message-ID: <08ee55292c1cedf26067d1a2b02fa5657d9650e8.1788712186.git.okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <cover.1788712186.git.okerixx@gmail.com>
References: <cover.1788712186.git.okerixx@gmail.com>
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
 arch/arm64/kernel/topology.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/kernel/topology.c b/arch/arm64/kernel/topology.c
index d28438f8b83f..804758eeb63a 100644
--- a/arch/arm64/kernel/topology.c
+++ b/arch/arm64/kernel/topology.c
@@ -245,8 +245,9 @@ int arch_freq_get_on_cpu(int cpu)
 	 * (see amu_scale_freq_tick for details)
 	 */
 	scale = arch_scale_freq_capacity(cpu);
-	freq = scale * arch_scale_freq_ref(cpu);
-	freq >>= SCHED_CAPACITY_SHIFT;
+	scale *= arch_scale_freq_ref(cpu);
+	scale >>= SCHED_CAPACITY_SHIFT;
+	freq = scale;
 	return freq;
 }
 
-- 
2.55.0

