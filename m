Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4C6365A1D
	for <driver-core@lists.linux.dev>; Sun,  6 Sep 2026 16:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788712668; cv=none; b=pExF0o1tNIJPHe/9E2uDhdvqzK5BU4wZUCLDI/cFS3tStYrM7RxwJZJG4O6xydg1J2NPJivI+v0N3CCoR2MpRrhxaTjYjevBICfHCTa5CthOL4+i0n4hfPQVc0Sij7IsVaEsQhrq/bMFo1mDhYfE0gLhTVMirWjjqzRwf7t8mJM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788712668; c=relaxed/simple;
	bh=ya+LlWyHt4+HI4LvLhLTcPHQzAe6hbPkzc8Cc9HoXcs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=gzriz1xtsW80SdZe2axGeRpKqUHl9UnsOR3daGC5EqvBZd+XTHCQ3COjGaaZoDm9Vu4ldAM9NAlyPfCMIih7OGa1KPqfeX0S3Lvx6j4C6dvt+hk0o23QyG5JX8CjiaeBB/8XmOh3W57V9n+bueoilFMyeX94FLBdiX/N99n66bk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZH5IylK; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZH5IylK"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso40539825e9.2
        for <driver-core@lists.linux.dev>; Sun, 06 Sep 2026 09:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788712665; x=1789317465; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=ivyLPO2HZhtqk7cqP+57Dc0UEnfX7FjCnb9LTUCpQ7M=;
        b=CZH5IylKBhcKLmtxClmMe+wxjJsTFiECEHGgl3QGWuOC8UJhreaaiQVfnG0ArclktK
         NSq/sF6hg/bP8CPnIhgXpn3ve3YOQ/zuynnm3rkSogPZxLacy+Vi0uqhO1Kc5G/1zQ/l
         4H8eNghIqEeD2dAN4fz0MylC8c6RiuGgZjhQHH08ctOXx6OtSt85o0jMlpARxyWOO+ue
         eq9jkuVv069dptO6RmgOp2C8hC+2NlpYY6RrYSFUXNomO/UDVFqtIPvKt28/rTy0HA+z
         TX6cl3r3WwV5vB1STBIRzFuH9WJs7UQs1EvSd3KatGPqJGlyAoF+yICVCE2xVzYOBMc2
         t/rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788712665; x=1789317465;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ivyLPO2HZhtqk7cqP+57Dc0UEnfX7FjCnb9LTUCpQ7M=;
        b=peq1Q594oHDTeUoHViWjiN/4ZRrvwsBaMFuv4H2clENGA6aREvugOBJ4Q0vq+nq5PN
         A3/32Oxjkn3+dFSNWLX+lozfw3qv3EPJsGPQaXF5auF8UxnvdVya35wz/NPNRIVQoP7r
         9q3QPz4zd5Wbrz56Gx69J6RIlDGIFYObVHGamnABJUVFtECcG4qZ44FhNtZ4XRbc12t3
         mTVbq1ynaB6Edww9RY1AqALebymI/KdlBXGvMnRO+CyYcolE0wmefyaZJ47iD02BMvcF
         XKLtnSLGtGSPn9BBBLof74u9jEX6IdEBUVtYeMkY19F+59UZWSSZCsbf/ZiGJkbby+t1
         cvGg==
X-Forwarded-Encrypted: i=1; AKwUvBxjFigMGfvUKc/Ovjy+5Jmj+mfhDIFkngEvBhC1fUMner90BkT3PGO89a1W2TjZD6J934Ex+SXwKmk4fg==@lists.linux.dev
X-Gm-Message-State: AFuF++lL9hZFhdYWCiYGKYXQ8bMiws+uFRadwXxKZY+dVg7f+op7lM+J
	4anGnm9aXA/FR+iVxXYe4/hXMXO7rJaPx9Ewmcp3BSgOTGhEamGMxkR9
X-Gm-Gg: AYBFou0b/D6HF+3E/PVuMORyWbzfmVy12lGu/TpjSAZ0YBDM/LSqIYlU1GinyOTsXHf
	X2L687l5GoDW6WSpvTeokE/XwhQ3hximFnZnU3iZ2rBW/FTIgZJsKkvlYdPdDuoUevwAoLzV9Oz
	Ur/GtfDnWxDn1tXjuSFP3hpuciIVY33KjDinrrLOxC/QAxG9PnYAzIxszgd/UHv1MQ/Mi3TnOmS
	eNgQ8rIBzx8PETove6HKRJ7iwu/PXZYXH6ms5FqjC4IcKlTYKHp4KcaH9VaoAHFmTvoMYsc5eYF
	5xY6cG4F0Kls3/QYbrEN8/6CatkVCFYNLBDsSOJ4pc6SM/UJkr4OGuw5AqHzKV+cKJ2Xn4yky13
	LNddZrhX4/qsZCbvgwU62T/qE/tICncmeQYeh9+FBfHmlgkRXqmAQfFm9T1OXu/9S94/cQN1+sm
	RrSaX4zBcMXI1eAKDiKIqIfp1Ny33PqiIiX635nL8SbjmTxpIW6Gli2w2zQuQeHpdqn5AAt9cH6
	V1YIde1hPPfgUjhzYTY+2oPV/A=
X-Received: by 2002:a05:600c:4e8f:b0:49d:4ef:bf70 with SMTP id 5b1f17b1804b1-49d04efc043mr96329235e9.10.1788712664882;
        Sun, 06 Sep 2026 09:37:44 -0700 (PDT)
Received: from localhost.localdomain (mob-5-93-26-136.net.vodafone.it. [5.93.26.136])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-485885c5bbdsm20907997f8f.36.2026.09.06.09.37.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 06 Sep 2026 09:37:44 -0700 (PDT)
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
Subject: [PATCH v1 0/2] arm64/cpufreq: report and track frequencies above 4.19 GHz
Date: Sun,  6 Sep 2026 18:37:13 +0200
Message-ID: <cover.1788712186.git.okerixx@gmail.com>
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

Oleg Keri (2):
  arm64: topology: fix arch_freq_get_on_cpu() overflow above 4.19 GHz
  cpufreq: update capacity_freq_ref when the boost state changes

 arch/arm/include/asm/topology.h   |  1 +
 arch/arm64/include/asm/topology.h |  1 +
 arch/arm64/kernel/topology.c      |  5 +++--
 arch/riscv/include/asm/topology.h |  1 +
 drivers/base/arch_topology.c      | 19 +++++++++++++------
 drivers/cpufreq/cpufreq.c         |  2 ++
 include/linux/arch_topology.h     |  1 +
 include/linux/cpufreq.h           |  7 +++++++
 8 files changed, 29 insertions(+), 8 deletions(-)

base-commit: 9d80aa4617b32f5054c5aa471d06b66704854935
-- 
2.55.0

