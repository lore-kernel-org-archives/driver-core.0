Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA67339B97B
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 19:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788981851; cv=none; b=jL1WTTw2sMbEauiuzP2D5FII+QY0QgHhnyExYqELInJBnRS/OScoXXjto0JVbxxOE1DqsilrX7zETScftMUZj48ZwFDsvHHLNiIK5pMy0egNOKUihEXjAUXa9RH+AVNp/DUhRa4y3XBH8UHyDkagS+8vzyE+QaTwpBRYC8ilU8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788981851; c=relaxed/simple;
	bh=z+PwFWisLAZ8WrSIU6Nq7JGZqrrzKxVDpeLvGJYlMhU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=YiCHt5jKtoGIL0HG8avQwThTCqRyEhAFtJ7d3F1EpNtv+gr8wkOe8H4a4IfMCOXxT0NFvi3XrOBElyN32f7HikrYFGAaBkixiNsfoH7VfO7y/XIYE7gBk7/erEELw4fg+wp3/25ziOdKvRTpfjzRpjcVxbMTL0H30eq2hVDOZOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q30iUJGz; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q30iUJGz"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4995b0343c1so86581245e9.3
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 12:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788981845; x=1789586645; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=juSntAU8rs/3fLNwoSR5HtlpUx6UI0vk4BclFthIHvc=;
        b=Q30iUJGzvfw8BJ/D8Vg9SwR/h1uJyq9Gt0jzBj/L/sXEIrsKPcl72U6n4O5sDk/bUp
         0FnLUh0FrOwkPKPr88ZcUR3q8gDxfyoBRRpdofUPN23WMCRC86tjK8LrRq40IZnX7fjq
         Ok9aeIXqsajuTo7Fgp3xW2JtqXg0KL+9ZenN5ED03jz5oKBH5v2znRmEXzdf8hjfYz+p
         HVVsszLaVcy9npfxwCXKdjV5S8fohmbfPm7TTcEzogKxhCXeBt/o4mx8vltIwPI/QP7x
         V1r9wtzCqrTgoXzwpECxhdFSOObrp5d8hh3v9SSkb0lTsShkcZ8344hIf0KY91EyWOiS
         gw7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788981845; x=1789586645;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=juSntAU8rs/3fLNwoSR5HtlpUx6UI0vk4BclFthIHvc=;
        b=oMzFwLJEe0pEgXGWOdU4I8z35YYb328zm4tmpUEQ6iMYuOBD6vK++sta1t2O0MnJ8B
         G2wctRCLZNZeR3/3o9u6J8AF8KB04a/HASBC//XgAeQhDxEU42hBVGkUtyMjXNlLfKhd
         DUEDVaPC0cOup4+DSAV3LJvH19OGa6xZqYFpLP5GSoj9IVSTfSvJRkOJFk8SO1LuB04e
         lMigHK1Yk2kpc/jymUkbPRhzilxcVaSHs0Jdo5mSDGY8wwLKyrRZ8YIS3l3AXVyfgxhx
         j9U7LgC3hOkFEeWo8vLZo8/KporJa5QlO89R012LeMOMizivMg84/8VkyUhyvcntMdqS
         2JUA==
X-Forwarded-Encrypted: i=1; AKwUvBxO3Hgryxo1DtRaWmHMyVsyyaEFBuEnZw9n9k1C6I8WQp/ec/lGWG3Swb2h/XUGpag+zIf1s4KuxMEaIg==@lists.linux.dev
X-Gm-Message-State: AFuF++n0ISe+dbBuuu0Lk73AVvMy7tvMSlCFqXq9bRnP8e5fiO8toMCH
	HQZ7EhWkyJcs2uOlq3JHTFeRD/KXavTQrRYWOoHi3Cz9gjzcjyzD9tEo
X-Gm-Gg: AYBFou0lsdZNPsfa0T7zBAbNf4YZC63c6l5EZXT4JNX0pciYfhAVgZd1iGmyG3zPYuE
	cIlgPL6+xkqpMnmxN/94nU8jtMj4l0VEqOT1sAFnZ0Pwd9SqN4q2A9Wxpy9hdqRAJarZ3p8KTBp
	j0q55/jEMoW4MPVwkqmdD8M+xy+OlM0vV5eMUHwzJcK8Fh0pgG+slnVjHxEfxdnUMRuJcO4Dyq4
	UyXzEbIbKWmXerBuLKgGnipBILn+fab+cP2ReWf7MF0SzaBe2ONMjDylS5KmDAllu72ZjfAOXdA
	D3DzNxWr67DgV3yIwBcQQnocp7G0f6FMDMINi/KkbZKY0qy/4e+id5XvTO5YQt2XNGPtqfWRSDb
	LamQ2yPsG3k8V8/UCIIRTIErGTmwg3inLCpqaomShYdTuZMBEaTqkvqA/GQjm0mnl3R6/YOoLtl
	R0lNrJCpz2ABp+UT+jpTFkdjTKQm+LK27cAw+g+RRoFRqo031lq6L1aAf3oFYoBEquRn674/9VA
	4XjphvHq9421z4o/MDDQgzCRR+Z5ZuBVbmbrkc2D+s=
X-Received: by 2002:a05:600c:3b18:b0:49c:fa21:1c8a with SMTP id 5b1f17b1804b1-49cfa211d97mr316363405e9.31.1788981845342;
        Wed, 09 Sep 2026 12:24:05 -0700 (PDT)
Received: from localhost.localdomain (mob-31-26-103-238.net.vodafone.it. [31.26.103.238])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-49d26bf9490sm10925625e9.9.2026.09.09.12.24.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 09 Sep 2026 12:24:03 -0700 (PDT)
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
Subject: [PATCH v2 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Wed,  9 Sep 2026 21:23:49 +0200
Message-ID: <20260909192351.33910-1-okerixx@gmail.com>
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

Changes in v2:
- Patch 1: fold the multiply and the shift into a single expression, as
  suggested, instead of reusing the u64 scale variable as scratch.  Same
  semantics - the multiply and the shift both stay in u64 and only the
  final value is narrowed to the unsigned int - but it reads better.
  Suggested-by: Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>
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
