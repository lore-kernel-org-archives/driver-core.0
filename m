Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D3A43C9456
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 06:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789022099; cv=none; b=dPjn6Ii279mMFOaJDYwe35YARrZNlC66v0qqiGwMzPwwFHRSJ2k0dlH3MIJOffM+bODdr9hwtfPbezDHDFv1MiWXP1fflY3+LSH7rNMZO2XMDeSwpJLb+CHzpv4PAFk1Ww2tzSNIjC57gMy2zMuul1sAsdpYDHPlQWRtI5cLDn0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789022099; c=relaxed/simple;
	bh=2bHvA86LBVnNVn37kqizVxucld93jNqngtRyL/3L6mc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=GmQyd+nsZoRlmLSXPxWtEFDc6woyxWY3wBydYFAz68suTxklPYBQ1MeDS/9J5JAqWfkCig35vkeGUT37eOJMqvZIgwEmw4Q9NRbFtSJHbKChlmAbe2SiyIIrXabYznjtrYSvDs8hQaFcpF19pQ6zOUo9DA2ArGBju3/s2EMEacQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rM200yDh; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rM200yDh"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-49cca4ffdcfso54723155e9.0
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 23:34:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789022095; x=1789626895; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=D92+v0nqxMJ3pOaah+t0R5RhuqJf5mej5Aw3sSQ7mCo=;
        b=rM200yDhEy/jf+7A6eOh8HSm1bjUweJtn1b1yJDzE6VZ2LoJsQTX0tufg3gC3Wao/v
         dEw2/zcXZ3R6BcqQhvYSko/3fnfrqrJvDECKxqC8U/MjX2/k6UuldKcI5XEBH2zym5FL
         g/rNkFYky3iUzLkOLpy/EuCM4N//31lCijs+nllmUJ/baB7M+GXpBg0EY91k4CWxJYBD
         pWrdh/cJVpFnF6cGKWNSLuuNKB5UtPnqnnq0PoHzLsmCpAGUPe5aiPeIMOcN9Iib8rdl
         1JcwDCARKkheESdOlgtlmNAwuVI/XEJ0Vxfcl39uLjqG829vBRrLGoKWx1BtMQYJdWar
         0UMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789022095; x=1789626895;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D92+v0nqxMJ3pOaah+t0R5RhuqJf5mej5Aw3sSQ7mCo=;
        b=oub5OPVxgbwYInCtSoBhkTdSqsN4OVkrkK1PxezBXmQ4wYbyTRcybV/z3fXmW7+KnC
         c4fUKI3r+Ri2gxtKgNLCnXE4GgHAJwaGtuAT3AWtbC7eQWA1cu8lVcqmJl+QZDgmTrep
         XxynrK/uLj7pmblFP6TqsxNllBjQ0l1RUra574ju3zaAkHtAgMUdtrc4Ut11U4Ej+A2M
         a1S5cF3W4xr0tlvx9OKn5ZbJg/nAADf5xPtrcV1RF0Ao6tsEgaMJMI013hsfWTrpJecY
         GEkqcnvb3PSfNbMgigtZl51MKN2+0Oou7Z5l+cqvyzzwve6ZZ0LzS9cHyHmXecIFHpsU
         ro6g==
X-Forwarded-Encrypted: i=1; AKwUvBx/9B9gXv/gVEv8NoBJbjgiv6enD3Y59tboOYZNfixghmje+3NXKATXMQfCguUvTG84J8AJQ3pG7EASnA==@lists.linux.dev
X-Gm-Message-State: AFuF++lccw5nCoSnHoj/IEIApzR75bZ/Jc8HM4WoMEYSgJCl8dIdNZX7
	koHtw58Rjud5xTbKiNREy9UVY5AkZsepI4Z2kUaiWy3+pWHN7cP5Hm2T
X-Gm-Gg: AYBFou04jhfs6Ilamzd49Wrq+aAhPWidJtcBmY9DTDlVH71Q0Dako5knaheGSsulWXG
	FewHaejyXDPnBUu4Zp4RMj4PWxuf6s43lvDw/5nqL93V8zOnr4XGXrfk+avgnjjBAv/8bqNpiRh
	2xzcENL7DbcJQvwOFH6FDBmi2AXIVpYP3UqFRX364I3zggpfaAfESFXUX4V6D2dBkJlMgR0F5Rr
	UxklKWHh0TjJ3PhQX58N3Rq2/0svNcMnAuGuLGLars4ENOw6rDX5S9d56oggMtD2BmlCjk6pGxb
	HDSnV1TPOKYgsK8t6b5iJWiq5U1jOw1Bb7d5K9aK3bvb6nlBM8pAF9SzNrAi+008YuSTQ8QMaLY
	s9sFYuAarCp/1S1j7S7H1mzrrhmJ/ybAIRiDf3d8XMxGQodahTdEvyCEdYzGfXLMLo+/nF7sHO6
	fwQ56qCrQoOtuHhAC3x5vs2Jt+9dhybGO/4xzwiZi+Owhv1iKI1f/vHuuH8yC5s7k1095mDL06x
	0s2+/1dAwzQ+75o9QxqAOnb3k3Fcn2TGFdjKqv8WTdsyVHjXm9FrQ==
X-Received: by 2002:a05:600c:46d1:b0:493:bd2a:93be with SMTP id 5b1f17b1804b1-49cf820c992mr407515105e9.6.1789022095224;
        Wed, 09 Sep 2026 23:34:55 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49e2212193esm2595255e9.1.2026.09.09.23.34.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 23:34:54 -0700 (PDT)
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
Subject: [PATCH v3 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Thu, 10 Sep 2026 08:34:38 +0200
Message-ID: <20260910063440.4677-1-okerixx@gmail.com>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Snapdragon X2 Elite (Glymur) is the first arm64 laptop part I have
seen whose boost OPP, 4723200 kHz, sits above 4194304 kHz.  Two
independent problems become visible there, both of which make the
kernel believe a boosted CPU is running slower than it is.

Patch 1 fixes an overflow in arch_freq_get_on_cpu(): the u64 product of
the frequency scale and the reference frequency is truncated to
unsigned int before being shifted back down, which wraps for any
reference frequency above 2^32 / SCHED_CAPACITY_SCALE = 4194304 kHz.

Patch 2 makes capacity_freq_ref follow the boost state.  It is latched
once on CPUFREQ_CREATE_POLICY, and boost frequencies are excluded from
policy->cpuinfo.max_freq while boost is off, so on a machine that boots
with boost disabled it keeps the sustained maximum forever.  On arm64
that saturates the AMU frequency scale at SCHED_CAPACITY_SCALE, so the
scheduler cannot distinguish a boosted CPU from one at the sustained
maximum, and arch_freq_get_on_cpu() cannot report above it.

The order matters: patch 2 is what raises capacity_freq_ref past
4194304 kHz on this machine, so patch 1 has to land with or before it.

Measured on a Lenovo Yoga Slim 7x Gen 11 (Glymur, 4032000 kHz
sustained, 4723200 kHz boost), pinning a policy to a single OPP and
timing a fixed workload on one of its CPUs:

  requested OPP    time     cpuinfo_avg_freq
  ---------------------------------------------------------
  4032000 kHz      2.011s   4031325   (0.02% low)
  4723200 kHz      1.726s    524283   before
  4723200 kHz      1.726s   4032000   with patch 1 only
  4723200 kHz      1.726s   4718587   with both  (0.10% low)

The timings never change: 2.011 / 1.726 = 1.165 against a frequency
ratio of 4723200 / 4032000 = 1.171, so the hardware was running at the
requested frequency throughout.  Only the kernel's view of it was wrong.

Note that cpuinfo_cur_freq still reports 4032000 kHz at the boost OPP
on this machine.  That is a separate path -- scmi_dvfs_freq_get()
asking firmware for the current performance level -- with no clamp in
the kernel, and it is not addressed here.

Changes in v3:
- Patch 1: drop the Suggested-by trailer.  It was not warranted for a
  review comment on the shape of an existing patch; my mistake.
- No code changes.
- Link to v2: https://lore.kernel.org/all/20260909192351.33910-1-okerixx@gmail.com/

Changes in v2:
- Patch 1: fold the multiply and the shift into a single expression, as
  suggested on v1, instead of reusing the u64 scale variable as scratch.
  Same semantics - the multiply and the shift both stay in u64 and only
  the final value is narrowed to the unsigned int - but it reads better.
- Patch 2: unchanged.
- Link to v1: https://lore.kernel.org/all/cover.1788712186.git.okerixx@gmail.com/


Oleg Keri (2):
  arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
  cpufreq: update capacity_freq_ref when the boost state changes

 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/topology.c      |  3 +--
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 8 files changed, 27 insertions(+), 8 deletions(-)

-- 
2.55.0


base-commit: df2908090cda368b01ff43709f51890076c56157
