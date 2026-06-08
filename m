Received: from mail-pf1-f195.google.com (mail-pf1-f195.google.com [209.85.210.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648083845B0
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 10:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780913280; cv=none; b=cM4LVCgvbVUacjhK8jF7l02qtGrXov6/re8XzH8u5G8SShUl6URem3OGEPZaUXGxf9PYfXrZ/Wl12jqIqE1scX8Dp0dha7jW0+Hox1FSrjUb/VjLSYShxDAeME+6Kc6v/U+/9jvNK6tOAxIpl6mZLduXrhi/A99DFFlr2aDL63M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780913280; c=relaxed/simple;
	bh=Yw+W/qioUG9yU2+3izlSbI4IPjGfS4xG5QBPpXJmRwY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=p9EGMX/+ISLrkAApICrh+vTX3haEOp6H1HlCvsgsRe+yGgb047vUlfpJYdYw9jYI6XOwy5Z2SmjveSJI3/gE0wUxykqOXhbKORH1BEtYLtbsn74yT//OI2ZWp5c9oIPU/0CRcBMGAB9sCWmPOM8ya4idFO3/Rfa0RtadDgBqdG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.210.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f195.google.com with SMTP id d2e1a72fcca58-842273a2c4dso2762953b3a.3
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 03:07:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780913278; x=1781518078;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gr2Etc6DY6whRRAl0EvZrQnXUAexb6Hs0g7hYvwQ+2s=;
        b=Re49TwKzJj0gXu6HqriK2PJ6kEa9ENKUYC61uElHJICtfuEbdtZYAwO4Qs209H31iB
         44bZj1TYSDdBP5w5fc2Td2FpIabVqj83+8px0d5gl52reSPOkZDF7IsQSsDcJbzVx2sy
         xDdyDbCgql+mPiPSXA/OeyPB1zxh5ai3qHoFjcdaDd2wegleS4x8NGFuIyBiTg+osFjk
         mi7up1f3+GXqnFDGjlqjmvofk4915Lchz23TZRQ74dNuyv4ig0M3XGowusF8BHZRlz9i
         ZFbfJ/nKqvGhAh+pwpcJyQdszTJHVai6CF4YgpPn9FP5uZvrsHvU1hjtFh7XJ4vhhjl9
         MfNA==
X-Forwarded-Encrypted: i=1; AFNElJ8/Ce2H6t6Ik/h3NookqrPKJ0q9rvVTZRtwP5CNuNRSxNZkIdeni6MY5lzjr2N2H551QQtfPRf6jDOSoQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxIoP2uYONKlKxkE6xaS5EvucK7vG9eKzjRFVzu1ZlAb1HlbNAg
	KgZzvkXvugRePe9tiiWI8KUZ36XRLU32WWgfqjzeE3PP4JPT98kIY6DO
X-Gm-Gg: Acq92OGyT4mvnWHkSlNm0Akl87WJCq6pJADmuxZZ5MCtGIsRlmjeUxNS/llOmhOC8nt
	1OQlFPqiYE6SObALbPXWSceKcClG2yO/DVS8ty23/9hWmHInelMPH8r+7DSYJj8JKGuVi3qyeXw
	0qEg3/xLe/JGTi3y5OXhs2N/DiUY0bRabEHx6JZUQF3N86RjK35FBve4ktzk+AMR0pwiutm47IJ
	nLJqMk5fQMUJHrbsgQ/19QF6K1EvPEatUbp/H46Ddvwr0FJ8qU2O6TFG5eyeo/yOi5Vvx3zQw2e
	pjqwVN7QC5sNPOqoiLc0m+YjXEWPQpgUTe3a3rbWKmYg6EnEvp0pS5HBIvEATx3nkJcOfe8YOUo
	S3kTvQkS9aGnsApjWjVfw+9rOVije3RaDdefjTObkpJB3fg83enHmZOTlcMp2E7dGEy42psuCgE
	i1MY7mb14+PqiBggrsgC+xAKVVkOsH4RJsG8aYD/9trgPguXGat1PzqDFLh2LsqD9s7w==
X-Received: by 2002:a05:6a00:3e07:b0:842:6419:3ed2 with SMTP id d2e1a72fcca58-842b0eecc85mr14728522b3a.33.1780913277678;
        Mon, 08 Jun 2026 03:07:57 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84282883647sm20431045b3a.36.2026.06.08.03.07.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 03:07:57 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: sudeep.holla@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	viresh.kumar@linaro.org,
	zhanjie9@hisilicon.com,
	zhenglifeng1@huawei.com,
	pierre.gondois@arm.com,
	sumitg@nvidia.com,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org
Cc: Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v4 0/3] cpufreq: cppc: Handle Highest Performance changes at runtime
Date: Mon,  8 Jun 2026 18:07:43 +0800
Message-ID: <20260608100746.372535-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rafael, Pierre,

This series adds support for handling ACPI CPPC Highest Performance
register changes at runtime, triggered by Notify(0x85) on a processor
device.

When the platform changes the Highest Performance value (e.g. due to
thermal or power budget adjustments), the OSPM must re-evaluate the
cached capability and propagate the change to the cpufreq policy,
the scheduler's CPU capacity model, and the frequency invariance
engine.

The series is split into three patches:
  Patch 1: Core update_limits callback implementation.
  Patch 2: Refactor autonomous perf bounds into a reusable helper
           and wire it into update_limits with error logging.
  Patch 3: Topology subsystem runtime capacity updates with
           concurrent-safe normalization.

v3 -> v4:
  - Do not set policy->max directly; use refresh_frequency_limits()
    to let the cpufreq core update it through cpufreq_set_policy()
    (Rafael)
  - Re-evaluate policy->boost_supported when highest_perf changes,
    as boost capability depends on highest_perf > nominal_perf
    (Rafael)
  - Add topology capacity runtime update: introduce
    topology_update_cpu_capacity() to refresh raw_capacity,
    capacity_freq_ref, and the normalized CPU capacity scale
    (Pierre)
  - Refactor autonomous selection performance bounds programming
    into cppc_cpufreq_set_autonomous_perf() helper, reused by both
    store_auto_select() and update_limits()
  - Add pr_debug error logging when autonomous perf update fails

Xueqin Luo (3):
  cpufreq: cppc: Add update_limits support for Highest Performance
    changes
  cpufreq: cppc: Refactor autonomous perf bounds into helper
  arch_topology: Add topology_update_cpu_capacity() for runtime updates

 drivers/base/arch_topology.c   |  70 ++++++++++++++++++++++
 drivers/cpufreq/cppc_cpufreq.c | 102 ++++++++++++++++++++++++++++-----
 include/linux/arch_topology.h  |   4 ++
 3 files changed, 163 insertions(+), 13 deletions(-)

-- 
2.43.0

