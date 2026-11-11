Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794387040;
	b=VFELy0EvEefrERXR+duSu3Xy5rEczCS9uWI1BZPaw3zT62J2rrsZ7tLNmSSiZO2ES9qo
	 0FeC0AqKvsIma02Get4RO9F3q1MC4WkwLDxDyoFvl8ONgMK3cECZcLpmYEhJCSvnSDo0Y
	 VCY+Yhc+BxHireiOCvVLSPDNWygHbLXtbHd4Ikf//ZQoWwuP3Pw1H6ySnqagBYp7D+QMk
	 pOlXOGdcqRP+umSou2Dv1zY99I5xPfv+376SrvzeF3/ZvIGrrtch9psL8bvOIs5bz3zaf
	 Rh1xVBpQmxBAc4PUKbntZry3H/62XY6hsu5hGdah+hBXsopVZ7hbV+lcAt69JSzU2sg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794387040;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=zCRooG2x6MjJhhdGz/yUbWYEgmkxtWTULJ4B2gjVcXc=;
	b=eDYIYY6b+yU7PLYzdrcZrIsWZwo3dusyzdkuLaBPaJiQxCEHkGbOv4JXLOtnK6CEi5Vi
	 Te64kGoAOka1H+hcuaz/0GAHe48G3nGvPP4xKoF1kFdMEtWmlGsfOIAQDAEZmWKJq5yoa
	 ywVLRWXrP179HmnNtd5gHJZLBbD4yZwBhgsz0+MPiug37EG0Ldo0hAmOz7aQ/T0CzVXDR
	 u7WqIFc9mYela+OK6mJhjwf9s/eOJ2m2xdnONNuGNluTqF83PzVPALxRpEyC7D3hTL4fT
	 ZMqj8Y892gv+hCGoiLsx9FkU6zUQ3l6jXk6ujVPsTSF9PlEGyKq9TW39K+Ao3Qw3zmg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=kylinos.cn;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2132D606A327
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 08:50:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2132D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3b0ae89de91so1726874a91.1
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 00:50:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794387039; x=1794991839;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zCRooG2x6MjJhhdGz/yUbWYEgmkxtWTULJ4B2gjVcXc=;
        b=PpFX/Mi6I36adbDWltSWXzzR5PLaeTX9N+b9OtZ4yzhbztiDpFk5LmC3OVFlBxPC23
         /2sObmocSoC8nnnqu4ANGsx8aZT8dIefqNs7iQ8NsJRkCb3NfZKAcmwqf2xhZ5MNMZ69
         gYKosz6lF4ie2oGFA70WhSYRIQ3XBm0W9zFZBPEXk+9kKO1xpAWuCiPzvX0ueXvJnweC
         gZUKI/bPbxBqtRzslO1r2bnZ30cTE/5oL/s6DG3VlcJFFJOCI7aqKtp2pWdXfI7XMv3R
         WJSXoHGpyz0oQNjqF5E3dP/nmt2seWr5+ACcprF1UcxRrelYp8NiWRxfG27dI2rT+8aT
         Fuvg==
X-Forwarded-Encrypted: i=1; AL+hErEliNPGJcU8uiVQlcQkXHb2DzZCYxMIhxa+wRmO+etjAZQceon4/mhXs0ubzUI1T+3HBz9xh1kJMrKcGw==@lists.linux.dev
X-Gm-Message-State: APuU4Z+L3Nd2b7ptx4qCFd3indDo3Ty6YOw8b2V6TDEEsYqju7OCn1nG
	5SaDIDNpxIqqLfaUtJwgQPGAJXzzwHwZDtfaj2T+DGxA8OsOSP0Y+WR9
X-Gm-Gg: AYBFou1rSZxDum37GeUuKhCwXCoik0hnajlJZ8KDuZAbsrLLcJ3ctsq93ymw7wUsKbv
	iz6HesnbA3KdHE8EITiL3NKrXlBl1eiu8TO7pToerpQa8TNCCIpiMUmPbx6fD7W2aqaj4KxT4wE
	jNoloXY9et4Itsagw4ZHT1Qlwd7upu+AsUE0m89DXkhsCjkpu6tcmAya1uz20fZeTozcC3zj/H/
	36khfT3Kluhg0j9TLvqZYaiMj2g30fvtaNOF/mcF1dZ/vDFKHajUj7Q1MtsdxIl1hgQucm/qvN3
	vCvW8FkDJZamiF08OqI3Y5F24Jhh2Y+pZoiekzk6AnxFqlL/s/3AQf5DQXzU8avgLjhx9BYH8I1
	I7jDDscOBPFosKBDbr+9RZTOjwI0RqW4BG6SxtXvjBA92HO8rIOmtChu60koUOmzOtJJNJVy1iA
	WI2DyYWRn3J9CcPvuAKS9yPyv7XESZr/hXSDbAX+EK74DkxnTbNyncjRysIgIr5njYFO9F0/gK1
	yvIAFNQ5RayecMWcJ0792avvOai5gg/MPlBolOP2EW657RK7w7RMvXzorORz3PkfCp66fTqcU8f
	6SSh8qs6Yh/VXpbZY0OTXa8Wca4YZXmeKqSKZrx5Gb28J27gTaE=
X-Received: by 2002:a17:90b:4fd0:b0:3ac:9f00:3bc7 with SMTP id 98e67ed59e1d1-3b182eee784mr1752558a91.33.1794387039460;
        Wed, 11 Nov 2026 00:50:39 -0800 (PST)
Received: from kylin-XiaoXinPro-16-AHP9.. ([116.128.244.169])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b1838e616dsm2396406a91.4.2026.11.11.00.50.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 00:50:39 -0800 (PST)
From: Xueqin Luo <luoxueqin@kylinos.cn>
To: rafael@kernel.org,
	viresh.kumar@linaro.org,
	sudeep.holla@kernel.org
Cc: zhanjie9@hisilicon.com,
	christian.loehle@arm.com,
	zhenglifeng1@huawei.com,
	sumitg@nvidia.com,
	lenb@kernel.org,
	maciej.wieczor-retman@intel.com,
	pawel.chmielewski@intel.com,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	johan@kernel.org,
	ionela.voinescu@arm.com,
	pierre.gondois@arm.com,
	linux-pm@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	acpica-devel@lists.linux.dev,
	driver-core@lists.linux.dev,
	Xueqin Luo <luoxueqin@kylinos.cn>
Subject: [PATCH v6 0/3] cpufreq: cppc: Handle Highest Performance changes at runtime
Date: Wed, 11 Nov 2026 16:50:19 +0800
Message-ID: <20261111085022.1229866-1-luoxueqin@kylinos.cn>
X-Mailer: git-send-email 2.43.0
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Rafael, Pierre, Christian, Jie,

This series adds support for handling ACPI CPPC Highest Performance
register changes at runtime, triggered by Notify(0x85) on a processor
device. When the platform changes the Highest Performance value, the
OSPM must re-evaluate the cached capability and propagate the change
to the cpufreq policy, the scheduler's CPU capacity model, and the
frequency invariance engine.

Concrete use cases discussed during review of the previous versions:

- A processor can age over time and its core frequency degrades. It
  is good if platforms can make OSPM and userspace aware of this
  (Jie, Christian).

- Platform operating mode changes between "performance" and
  "powersave" (longer battery life) when the top-most OPP is a
  high-cost one (Rafael).

The mode-switch use case can also move Highest Performance back up,
e.g. when switching from powersave back to performance. update_limits
therefore accepts changes in both directions, capped at the Highest
Performance probed at policy init, as proposed by Christian: any
value above the first probe is ignored, since it would allow boost
support to appear after policy init, which the cpufreq core cannot
handle today (the boost QoS request is only created at policy init).
A policy that started without boost cannot gain it at runtime;
supporting that would need runtime QoS request creation in the core
and is left for later.

v5 -> v6:

- Cap runtime Highest Performance changes at the value probed at
  policy init (Christian): any value above the first probe is
  ignored, since it would allow boost support to appear after policy
  init, which the cpufreq core cannot handle today (the boost QoS
  request is only created at policy init). Within that bound both
  decreases and increases are accepted, so a platform switching back
  to a performance mode restores the previous Highest Performance
  (Rafael's mode-switch use case).

- Refresh the topology capacity for every CPU of the policy
  (policy->related_cpus, covering offline CPUs of the domain as
  well) instead of only policy->cpu, so a shared-policy Notify(0x85)
  targeting any CPU of the policy refreshes the whole domain at
  once (Christian).

- Trim the internal helper comments (cppc_cpufreq_sync_boost_limits(),
  cppc_cpufreq_set_autonomous_perf()) down to the essential notes,
  drop the debug-only value dump, and report boost QoS sync failures
  through pr_err (Jie).

- Ignore values that would drop Highest Performance below Nominal:
  they violate the CPPC invariant and cannot be handled cleanly, so
  the special-casing for them is gone; such
  values are now warned about (Jie).
  topology_update_cpu_capacity() rejects such values as well, to
  match the boot-time validation.

- Return early from cppc_cpufreq_update_limits() when the policy is
  inactive: a concurrent CPU offline may have freed the driver data
  after cpufreq_update_limits() acquired the policy reference.

Note: proposed spec extensions would allow nominal_perf to change
at runtime [1] and introduce a highest_freq value; neither is
handled here.

[1] https://lore.kernel.org/all/20260430142430.755437-3-sumitg@nvidia.com/

The series is split into three patches:
  Patch 1: Core update_limits callback with boost QoS handling;
           runtime changes capped at the boot-probed value.
  Patch 2: Refactor autonomous perf bounds into a reusable helper
           and wire it into update_limits with error logging.
  Patch 3: Topology subsystem runtime capacity updates with
           validation, early-return optimization, and concurrent-safe
           normalization for all CPUs of the policy.

The v5 series was tested on an arm64 8-core big.LITTLE system with runtime
highest_perf changes injected through a debugfs hook that exercises
the same code path as ACPI Notify(0x85), including values above
1024 and full capacity re-normalization (see the v5 discussion for
the measured capacities).

Xueqin Luo (3):
  cpufreq: cppc: Add update_limits support for Highest Performance
    changes
  cpufreq: cppc: Refactor autonomous perf bounds into helper
  arch_topology: Add topology_update_cpu_capacity() for runtime updates

 drivers/base/arch_topology.c   |  77 ++++++++++++++++
 drivers/cpufreq/cppc_cpufreq.c | 157 ++++++++++++++++++++++++++++++---
 include/acpi/cppc_acpi.h       |   1 +
 include/linux/arch_topology.h  |  13 +++
 4 files changed, 235 insertions(+), 13 deletions(-)

Cc: Ionela Voinescu <ionela.voinescu@arm.com>

-- 
2.43.0
