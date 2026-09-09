Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1BBB3BB670
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 19:24:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981853; cv=none; b=NrNa/KWMorW9uyPCf6cdb536UicrU1XWPG34dOkpoFagxlH0kZlzHXLb+M7ZFPeX1B7xOh1pQQE43tfTlqaP6TVn56g6222hEH8mfKrNym3h6e49FniFgZKOK6fy/16hu9UgPdjpz4VTl8i8/pgFg0lRyBsqCbqKftVuTGG1jHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981853; c=relaxed/simple;
	bh=PDEEd+kGUpRFDlfoMHUOW7eU3z/kpzEs0Dmls+E8O2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PNFgN6P2+j8DvxVQ7L1eEos7IwydZU7Z5LaUua9UmdxFGDwMntkgHKlBakKbRV6cW3Yfau3lFhDVjugrcEnnvXSrTBubkJuketYRDLvCRoT6rpKtrOyJAaqAX7l9MGriaOJjALronetkALzVLw/Svl2kF6e4fK1bgB7IT+72axs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g7df07NM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g7df07NM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-498028b3d5eso59534665e9.1
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 12:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981850; x=1789586650; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=g7df07NMg+YBruKXOnRf3n61adLOqPSLlxHRpgKMgROlfwM6Z9V1m5G0iXGKeJgT75
         g/QcRJDDOeW6UUmkSP3beLhNBsevrmNtHU8l6v9M7KtC1aVoeX0RFh+Evnjj38b0eELj
         bNNvrwJMer3XKb2yKvl9AUf/6w0uy0VKVJEXill/uhkiEDmypp6IqCBMQJAI9a5RwzxV
         NZHi01tB0yTQ9p2mhn326lTM6OdvMyJmjAJwcTSslFhnQWN2XZxW7K0Pjc57O9KEX0mw
         uFP1vm5spOSfvhzUUNKeWHCjGttmjBHEYj2YPcEozvKHhv1qaMZqS6Zm6g2rXS4t3oDU
         kT2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981850; x=1789586650;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=ZYBzWSPZN1Lxcn6Xbnnk/C2mw1GBteCvVQmx0ay5t+A=;
        b=sr6fITKTGhr7BFsdO9Wn8zXhwbbjwR+0Tb0bMMvwhHwCljbop6NVZACCgkc/zW4WXM
         KzcQjryLu5sQgmPu9Hlw0fgL5vJcdyazWaXC84e4Q2sRZUBeTp+tEIgMjq2tMvn40DDg
         1CC2GdbnU24loDguvcPUSHGpeLIWUqfbzjIEXvLBZ2Zy381kzt/o4k8nLAVUP+/NKLqM
         utRia8OfMQouj5vR5YJlZUtQ3sQbvhFTL+oC15DrV5YvYV8BxfqVcE/4ZGmLAjIdAPKL
         mAbST2q5PLKDtp3o+/pOprXvBPdlq5BgL3MhOmq5GJGhEqDoZlCWvIQgQ40Y3ETss+uC
         oBCg==
X-Forwarded-Encrypted: i=1; AKwUvBzDpe8UFE7KI4lo0pI3WyrNJlZtv5MmVRjLy+x4gZbfHbGvSpSzUaHR+tg/RQ12/gyyRtxbtfAma6221A==@lists.linux.dev
X-Gm-Message-State: AFuF++mB8Tr8HYspCsEQf3gORSL8wOaSA2kzePpeWxnlzEJVyEVOnKTB
	rje/sr6kHlxe6CXyqSD71vh9a1Quy7hCgD5y32cTrIalRAbxzTyJbnzf
X-Gm-Gg: AYBFou257NgXOLSbevUpmgmDGxbDuVC1EravaKt1DYhLLTWkoWziBmKm5t9/hFF/Gv6
	oSXA74JD3rZ9IbbVLmwUyZ0u9t7cZSVdhXq7l8nZjbR9PbBrr5e/zDGFknKkfI7Qb+02+8jd4et
	t7Zovzr7VflSF2sH9uKWoIvEFgdhOyr4iCxE2kicW3XymbQEM6Lr2K+ny2EJDG5/LJfLqW3WKxW
	fTvng0BTNBVihVNzPOBiFIDrPSUctdKgiL7LQhh3pwvt/Dng71cdLmS3ypgviWHFd4aScAZnAik
	B/iMVKYFdu5JKKFrLsp7UmJaG7j+2cpGfhJrhDPZB6ivVNdUIxhNbOkds9HjaxV2uiNfX3ZEF7m
	339y1xLwU5qt60cgpzUyB2bXT3rw9CmAhhcegw/nXvE94N5eVE02DV2SA7Weh47CAImRiJo/MSt
	a4JiUtJbOerm8wlBnZQUdLyff4S+bu9oXJ2841NW1kvE32m4VD+sKA407kaVQytJG623CV/5tND
	rdNahxQU8i6bdbQLhFlhDAjb+oivo72XlF1As3FTT0=
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr282755995e9.10.1788981849957;
        Wed, 09 Sep 2026 12:24:09 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm10925625e9.9.2026.09.09.12.24.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:24:07 -0700 (PDT)
From: Oleg Keri <okerixx@gmail.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	Beata Michalska <beata.michalska@arm.com>,
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
	linux-pm@vger.kernel.org,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
Subject: [PATCH v2 1/2] arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
Date: Wed,  9 Sep 2026 21:23:50 +0200
Message-ID: <20260909192351.33910-2-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909192351.33910-1-okerixx@gmail.com>
References: <20260909192351.33910-1-okerixx@gmail.com>
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
Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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

