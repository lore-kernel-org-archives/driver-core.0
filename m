Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00E923002DF
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055933; cv=none; b=AHCS/ZcsEl0qQ8fllD8d1gkIojS4V1aEjONrtqvPKiVBeSFj6yNzdgZ8CrlrO7DkUQIxNeWO6ng1XB2T1Ts2ye8gdoej5OLXhYz282d0+yus/27kxVR0iu01YmfQHULxK86QDO8qqjOqdif4d/HppHguAMUnSHlf2OnBKeYy4Sw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055933; c=relaxed/simple;
	bh=MJBp72SKMyjsUAzv3mWv2+ZOo0GNt4ALfKXaxFLidIQ=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=tYOFF9Jg88ov1JZB7FIqFMq5NezQ0lm92+O3TqtRnsIBUsPyKJhSZQUvx7yVAfsKQVfPTSlvGMMVcimUBjof1NHmwBE0NXCLYJl87Bofj5FORVGFHe0aM40DcbzhcWGXUeSaMvzaYpRBO1VQHcI4y1nS1l7XZCkkbbJoKWrh/o4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=McfM63YH; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="McfM63YH"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-9157d3f2098so740538885a.3
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 18:45:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781055926; x=1781660726; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=u+GrVwUVnyXoJ3l/Ws8SD/JHytJBmijCAuGEqrIfnVw=;
        b=McfM63YHXepEuLt7SiIdX8ASdejzlehbjGgFqGNm/PdLffXQMbeuWOJt4I/dFM5mEd
         +UiTzzGQx70BhbV7GwLsZFVMaDtHrxCxc7BfPZAkt2sl+o/+ZR+AaiNK3HzuD3+A07Op
         nV6Feex1jmdtEfHiD5OzlAUv4Yl+TOY2ogX3EJpu45BlaPSLnjB9Js3XcOm9SHXe9vXp
         AK9M4KgYn5S6iX4lSepSAB14FNuvZzhrt4XEYYmFi6I7pOMEws/+R2pEN7XGOehhoqAB
         Ka2SyHNLqnbpTgCmF4I5cvkRWT90oBFjtQfY2lVcfOeTgxkqgksRPyPzLYF6XU5U5bcb
         q5Yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055926; x=1781660726;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u+GrVwUVnyXoJ3l/Ws8SD/JHytJBmijCAuGEqrIfnVw=;
        b=Yh6qjM+ji5ZaGeMi6FqLWJP9rUqQvz8S2XU3iQheF9zCop1yRyJnoqo90WRgSZpjGw
         ufhZKPEhzpxJgAGEnhO7LDl5RuEYR0YGbYJyaORKR5b1xWyrM/6Va1whoDmY8saT3QpG
         gglaIn8k1Ni+T3mGRLaQvw9tRNKEZpHbSYjmuRis6BP5tC+Fu+ukRsrYFh2fe8YUAcrn
         gkbbNAxx+758rdYCch50He848Uyg317alvoNMn3pFYiec2xz/mUFWn6mAKOJ+3N5qCKQ
         KNiBaJyUYbSiEY1Jyllpp4SqKmfkjB5HT/AndXSu7iMiGr4Ab9IEQv0dHYUo5yJFYQqd
         N68g==
X-Forwarded-Encrypted: i=1; AFNElJ+BwzMavsQWY2x9lQXkZ70Ui5ZG3diW5SdF1laDehzhjnS++Nj6yxErLS8m6aj8vmwD9sXKaoVtunAKuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzlwc/BPKcO5GjKvLj9PU64WGRdL1UK4+jnrshlgsEJkYbK4u0g
	qz4QRFneAJ/HpE1DuxZWN2+8V+LjjJX2bg5p0T4pw1vpE7Th6ArDAV5lb1trwxBWqQo=
X-Gm-Gg: Acq92OGSZN+2JhjwSvLiz7Arx+QqZrADFs5Wosx4CY/TtEU9zX7r3pTDPCGByGntPnL
	CVmXnrIY8vE4I+M1WHcdeKpjOrhffPGOhDdlPITrKMY+/fYc2htkYryWE1S2p+G3O0UejD61aWM
	odYZ9/uT0N66QvAjuRjzk06OMwdbg8JTPozJb3GpBSy4mDYd3SwKYxHHv4Cw9O0B7QBdLYoumgp
	p8c6trDmNtIegXXdQckg87xvr35SzFA2j6GiulB874nNjWJZfdH+cSId2udrZjaeAxenXaIPoVy
	l6z4KSTwEqxNa6vXA9eor1z5Nmxq6/laRhcAxO4q1QZxwGUA+sHYI1XbIEE/A1raqX+OgPq4k+m
	/1eoGN7qTNjit2NliP4ku/WCup0PWB4dA7JupbyyuT0Y9aJnHTsYXDBVhBaGK/ZONJZzysrp1B9
	1vXAkCna88Lukva43I++nZYW2N3rhH+iBM4sSKUuNqiqk6DIBSp78R96JScPFlOBbwMdFPvztEZ
	I7EvvWHy44h3wr/1t5cQO0=
X-Received: by 2002:ac8:7612:0:b0:517:a02f:171a with SMTP id d75a77b69052e-517a02f1d7bmr208979241cf.36.1781055925526;
        Tue, 09 Jun 2026 18:45:25 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm205923261cf.4.2026.06.09.18.45.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:45:24 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: x86@kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	kernel-team@meta.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	dave.hansen@linux.intel.com,
	luto@kernel.org,
	peterz@infradead.org,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	hpa@zytor.com,
	rafael@kernel.org,
	lenb@kernel.org,
	gregkh@linuxfoundation.org,
	dakr@kernel.org,
	akpm@linux-foundation.org,
	rppt@kernel.org,
	rdunlap@infradead.org,
	feng.tang@linux.alibaba.com,
	dapeng1.mi@linux.intel.com,
	elver@google.com,
	kuba@kernel.org,
	ebiggers@kernel.org,
	lirongqing@baidu.com,
	paulmck@kernel.org,
	gourry@gourry.net,
	dave.jiang@intel.com,
	jic23@kernel.org,
	xueshuai@linux.alibaba.com,
	kai.huang@intel.com
Subject: [RFC PATCH 0/3] mm/numa: reserve standby NUMA nodes for runtime claiming
Date: Tue,  9 Jun 2026 21:45:14 -0400
Message-ID: <20260610014517.253609-1-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A NUMA node must be "possible" at __init time to be usable later; a node
that is not described at boot cannot be brought online afterwards.

For memory tiering or isolation it is sometimes desirable to spread
hotplug memory (CXL, GPU, virtio-mem, ...) across more nodes than
firmware describes.  Additionally, some memory devices may provide
more than a single class of memory and need flexibility to redefine
the effective topology at runtime instead of depending on BIOS.

This series adds a way to reserve empty "standby" NUMA nodes at boot
so drivers can place hotplugged memory on distinct nodes later, at
runtime, without those nodes being described by BIOS.

Using the feature
=================
A standby node is an empty, offline-but-possible NUMA node: at boot it
has no memory and no CPUs.  A driver claims one at runtime, brings
memory online on it, and releases it when done.

This series adds 3 ways to reserve standby nodes.

  - numa=standby=N
      Boot parameter.  Reserve N extra empty nodes.  Platform
      independent; works with or without ACPI.

  - CONFIG_ACPI_NUMA_STANDBY_NODES=N
      Reserve N extra empty nodes on ACPI systems (honoured only when
      firmware produces a usable NUMA configuration).

  - CONFIG_ACPI_NUMA_ADD_CFMWS_NODES=K
      Reserve K extra empty nodes per CXL Fixed Memory Window (CEDT
      CFMWS), for CXL topologies that want several nodes behind one
      window.

All three default to off (0 / unset).

Reserved nodes show up in /sys/devices/system/node/possible but not
.../online until a driver claims one and onlines memory on it.

Testing
=======
Built and booted under QEMU (virtme-ng) across a matrix of boot
parameters and topologies:

  - Each reservation source, individually and combined: reserved nodes
    appear as possible-but-offline with no memory, claim/release
    round-trips correctly, and node distances are sane.

    The CFMWS path was exercised with an emulated CXL Type-3 device
    presenting a CEDT/CFMWS.

  - Fallback: when ACPI NUMA init does not produce a usable config,
    no standby nodes are reserved.

  - NUMA emulation (numa=fake): renumbers the node space.

    Standby nodes are created only after the (possibly emulated)
    topology is final, so their ids can never alias emulated nodes.

    numa=fake boots cleanly with the feature enabled and behaves
    identically to a baseline kernel without this series.

    Tested with CONFIG_NUMA_EMU both enabled and disabled, and with
    and without numa=fake on the command line.

  - Default-off builds behave identically to a baseline kernel.

Gregory Price (3):
mm/numa: add exclusive node pool and numa=standby boot parameter
acpi/numa: add CONFIG_ACPI_NUMA_STANDBY_NODES
acpi/numa: add CONFIG_ACPI_NUMA_ADD_CFMWS_NODES

 .../admin-guide/kernel-parameters.txt         |   8 ++
 arch/x86/mm/numa.c                            |   2 +
 drivers/acpi/numa/Kconfig                     |  35 ++++++
 drivers/acpi/numa/srat.c                      |  14 ++-
 drivers/base/arch_numa.c                      |   2 +
 include/linux/numa.h                          |  14 +++
 include/linux/numa_memblks.h                  |   3 +
 mm/numa.c                                     |  90 +++++++++++++
 mm/numa_memblks.c                             | 118 +++++++++++++++++-
 9 files changed, 284 insertions(+), 2 deletions(-)

--
2.54.0

