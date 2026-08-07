Received: from mail-pj2-f1.google.com (mail-pj2-f1.google.com [74.125.227.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 688D237B02E
	for <driver-core@lists.linux.dev>; Fri,  7 Aug 2026 06:09:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.129
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786082943; cv=none; b=XCESMazAY+P8DhPiAciVb57Z5ElscG1UVjdxManMNhUTm0BFRdhYj8gakNzhzFqkJg4tiVJeDsUpWn29ORzjvE41mbMRgScyu3+J01pmLiCP6gyxZNjcG14YLUKdPKmQJXWgk5LImpUmcwdEGrQxFHzz3ZyhCir7MV4IqUt4sZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786082943; c=relaxed/simple;
	bh=G92p6xIwW5k8DiXIIq1p0j8PFjL/M9f4voq1+o4nThU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CtJnZmi32IZb60djKAxBN4eYuDRrYU2MqVmw9xB36P5YXhKOOoD3LlYi9rmNtcD6tSCAc3US3eh3RgoIB/doPcdJhuNrg1sVGD7gvRvmoIvf6O34ULKkESx+USJLZ/HMPpQwHCZ8ckUQfY0fgtiWR6wEprYGbC5zaDbhCmxbFUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f1.google.com with SMTP id 98e67ed59e1d1-381072761d4so1910784a91.0
        for <driver-core@lists.linux.dev>; Thu, 06 Aug 2026 23:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786082941; x=1786687741;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=w+GRDhzCEsFlEMJWqbvody6GbI+xrEdhYtIOzqWM2Ps=;
        b=hXKnogNWX6ryIdTvqJ2iYuOYbwjhYy02fw5ZMFCJgVEQubqGuAQRzPnbNKHkFd5/u2
         CJF4n8Wn8b2D5Q4ZA4dyC9eiuE/fzibrt/NT3nb4aQWY0QyN0QLSjP/HLqrMVR6d0irn
         lgjbdOWqU0ECniZMopy0yapopS3fI7jC9EXwdJaSm+I+IBXjlu9ITynLybbUeNYnPqBk
         FCpvceLdm0hRt/E9foj7/hEJHhauNfzWhRMFMJfso6e5aYp2pacJIR3i1LveY/wrmB5N
         usMEG5HkcHrHl6/w69K4FmU6EpSLEFsku2yB28xbbhVss1TWU5YosuuhzMfFvtbtn93C
         zPyw==
X-Forwarded-Encrypted: i=1; AHgh+Rqbe3tQ+EmtRmJ/oks9HgpCU3OgNxx2rBvndDqgziSRQDCzeo8JbCQ0nQj471/X8C9x+8sSeDdKfsUvGw==@lists.linux.dev
X-Gm-Message-State: AOJu0YztdAxSC+bIchrU3034CVfC1F6yHY1KXV6PcgCE1SMLIpaycIqz
	tNRHF/Qp5zsU/2e0+dI5XEiKwiyqbIXlnPDWXjc489Q64NYUcxeSrOAg
X-Gm-Gg: AR+sD12zkPL0PeV4emZM8wsS+3CybCIRFjCV3tpDY4f/JDGlqL+f6+80UhEVFDUR4S+
	rHIIXJb9j17WE/f/PSfm0pY/vSyiOVfOn3fwZvglWdrKM1q9Mgrh6gI4ADdA9+nGEqHSqAXd3ZW
	4y+BlgLn4cuLbJxZV3CiREWrzmnfvDErJZQDGWbOMAEGEYPf44M6KM3vzqyDJ80ddQ3at/rK3ya
	XutYJ9kgDO0LNlHpvbGxQ4WAOm2GppnqrT1FqDUQdxqJBh6QnXiG+oLQd/bPrIgf26orUIm9E5s
	Ut0M3QBJh/gnD9BFKGZSnrJb33BIxW2JfwU4wpMBUIctGyoB3GBvpCR7sGOVx8xfN3qxgaJ9+GK
	uczjlgPIRLfLF9ufLRGMHg7csfaa4JS9vcUABEDewYerfW5/ilF4SD9H+RfAX8WDb2cFWAStF6k
	ZJkLCU12bkFijvgfKlA7TKYt6ljUpqQjj7JCSsNInAljjONxtJi8YyJW3FaoGhsP5NxHMkc4RVl
	XwbPtgcuQ==
X-Received: by 2002:a17:90b:1c0a:b0:380:105f:8ffd with SMTP id 98e67ed59e1d1-3903c5dc172mr18602717a91.16.1786082940620;
        Thu, 06 Aug 2026 23:09:00 -0700 (PDT)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.171])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39085dbe349sm3434375a91.4.2026.08.06.23.08.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Aug 2026 23:09:00 -0700 (PDT)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Viresh Kumar <viresh.kumar@linaro.org>
Cc: Jie Zhan <zhanjie9@hisilicon.com>,
	Lifeng Zheng <zhenglifeng1@huawei.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	Sumit Gupta <sumitg@nvidia.com>,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v5 0/3] cpufreq: cppc: Handle Highest Performance changes at runtime
Date: Fri,  7 Aug 2026 14:08:45 +0800
Message-ID: <20260807060848.832929-1-luoxueqin@kylinos.cn>
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
  Patch 1: Core update_limits callback with boost QoS handling.
  Patch 2: Refactor autonomous perf bounds into a reusable helper
           and wire it into update_limits with error logging.
  Patch 3: Topology subsystem runtime capacity updates with
           validation, early-return optimization, and concurrent-safe
           normalization.

v4 -> v5:
  - Move cpu_data and caps pointer assignments after
    guard(cpufreq_policy_write) in cppc_cpufreq_update_limits() to
    avoid potential use-after-free if concurrent CPU offline frees
    driver_data before the lock is acquired (Sashiko)
  - Extract cppc_cpufreq_sync_boost_limits() from update_limits to
    handle boost_supported re-evaluation, cpuinfo.max_freq tracking,
    and boost_freq_req QoS update in a dedicated helper. The helper
    always updates the QoS request (even when boost becomes
    unsupported) to clear stale constraint values, and forcibly
    disables boost_enabled when boost disappears at runtime
  - Add highest_perf validation in topology_update_cpu_capacity():
    reject values below lowest_perf to prevent corrupted register
    reads from propagating into the scheduler capacity model
  - Add early-return in topology_update_cpu_capacity() when
    raw_capacity[cpu] is unchanged, avoiding redundant normalization
    and schedule_work() calls
  - Add zero capacity_scale guard in topology_update_cpu_capacity()
    to prevent division by zero in the normalization loop
  - Move guard(mutex) before the raw_capacity NULL check so that
    the pointer read is protected by the lock
  - Add CONFIG_GENERIC_ARCH_TOPOLOGY guard with no-op stub in
    arch_topology.h for configs where the topology subsystem is
    disabled

Xueqin Luo (3):
  cpufreq: cppc: Add update_limits support for Highest Performance
    changes
  cpufreq: cppc: Refactor autonomous perf bounds into helper
  arch_topology: Add topology_update_cpu_capacity() for runtime updates

 drivers/base/arch_topology.c   |  76 ++++++++++++++++
 drivers/cpufreq/cppc_cpufreq.c | 157 ++++++++++++++++++++++++++++++---
 include/linux/arch_topology.h  |  13 +++
 3 files changed, 233 insertions(+), 13 deletions(-)

-- 
2.43.0

