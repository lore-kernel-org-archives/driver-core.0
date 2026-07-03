Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD9231AF14
	for <driver-core@lists.linux.dev>; Fri,  3 Jul 2026 04:13:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783052033; cv=none; b=HymBAmOYKo9nvsxtVpCGCWmmsELS1ega/gsTQhUY1cVPbUJpGegbIBBOPeV6gMwj/uxbIg5+Mxo/Fzub6GxtC+dlGn7Ts6WoUwmVjLi52991TR1cyIxQNjMk/U255n02SCD7jR81rSYpLUADmSe+Ixe+bgOxwb173iHGDZFgooQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783052033; c=relaxed/simple;
	bh=OUpPeEes/y+ArXs2upxEA1BNgKsnrkR9ayItzVy6vm0=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=inzVTj/F18QKAcoTRq369AjF6MjcgouA2RVBjtYBx/REsaBM3lvXs1sWkDN/ZFi8Vx/iOynQhCnE0Anzr0YuQE8C9E1U2Q7tJfH5CDJxjb/LmZqaNWOkKn86DHAppOT8S28uz474m9JpwDCD8koZy94QUE/BR4XjPcUz+LMh0gw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O3Fw87lw; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O3Fw87lw"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-847a483e344so121733b3a.0
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 21:13:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783052021; x=1783656821; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=A6npnmvUqCM8/66CqqYCk/mzyWieSpjEbi8Gph9LP44=;
        b=O3Fw87lwD0cqVs7NtG7CvjvoKmJIH7G8kBnNr8YqQTNC5gPL5/eeA88aXuWLC07E6w
         d7dwx22TonYKJkddk+042T5iGBvXbWjGHTVreAfAZErJjgBUMVsgDtPuAI75CfvGOYBt
         x3bK0zoDjPMz+JmcNRwOvokzqwv1dChE1vi9v4hkHUF1+bIDTCnombCKDBNdj0mfmmA4
         ri/P42Tuolw9XgRkBA+YTBLCwJjWe3MgSkh9xA0MxBbxLaswAVPyxay2iSxmYySYB2ed
         Avay5PZE0p1cugkfPGmktz85muaavM83GB00kobTzFyh/JblawCfBFLJCyd+Mr1X/5mS
         m50A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783052021; x=1783656821;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=A6npnmvUqCM8/66CqqYCk/mzyWieSpjEbi8Gph9LP44=;
        b=M7pb1BBJQdspW20sjNcWOPAgN2vmQyi+4+2VED4mcpbYYNzP4uACsks+HAjF+PHiwv
         028ZwilcW3cSkz58rWVo/vjr6PC2E95++BGeRISL8/VSa87nl4qoIrgqEzfRsgVwBxNL
         sxGI4vWjDDvs6VGrme26cAqP429+/qkeLehFRWbH+Ol0ALginMpNsHZK6KOUg9Y28Rft
         ZVPM2QAhSU0hr6uEcO77uFNFVYjExPET3RSodkfFArj9GRLMaEJBmHDCWRO+3Li4gnH9
         lHpDhEEL7SvPOzeTttTGkCr/TGDMiU79hJJy0FTUGUa2nVz8jGCGk4mmGzOEvJbJ/f0K
         DFFA==
X-Forwarded-Encrypted: i=1; AHgh+RozXMb2gydznApQz3Kw0mBiaW1E4di61cfqsrU5vB/JjdPaPUmYtQyWJ+JhwX6+xZQ9aS3ob0i5MzgNVg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yys3pJMGPQBPLlCyaV4GreOAZ97qktwCdWCJ8/NJgEcGAO78bZ6
	4WIJGkOHV7L1F6dHdfBKoZk+Aw1SeVLm+EGJzKNLspRZxelyEPc9X81W
X-Gm-Gg: AfdE7cnAbOZcR75ESvYrzJI6EesjVxhO9nrZ29+AOwNVfVtwxiHoEPSehSpTLlkN/Pf
	4Tasz0sDj96PAkIvvmLQnMyJ4Z6lPqgcminxZoGDtEDaumZL1KSf3mYdb9T14IgJIWzKf0Rrawr
	9gQx6DRoHzAr/UNtHFmMbD81ClnDolAu2lt7JBXgswgDyDbPrg59RGJv2C/eNJGlRk1SmDDT93C
	jbE7l7KDLgGoBKdWFLTT5dh5frFl3Vl3ouMov7j4usA7JmmsdSJyE/70Po/v1GKStBkM8gmhQBz
	jQJ2ovad/p2MHLR8Qy5yAwVeqQUgOkqzBba8eSOQYQJrDKm8nHi0C+GUBfvQH00b766+qnKtxIc
	Bgv8XoopyTe5vyrtuewSvVHcKsZhdLRqIv7Slbl4HK5OGqewbpfNwJ796Jrk5Byt4zpS8qdqLD7
	e1yqQ6M+/029CZhg5AaA==
X-Received: by 2002:a05:6a00:244d:b0:842:63f5:d097 with SMTP id d2e1a72fcca58-847e17360d9mr2456212b3a.3.1783052020555;
        Thu, 02 Jul 2026 21:13:40 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847cb94bd7esm2207768b3a.38.2026.07.02.21.13.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 21:13:40 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: rppt@kernel.org,
	akpm@linux-foundation.org,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: linux-mm@kvack.org,
	Sang-Heon Jeon <ekffu200098@gmail.com>,
	devicetree@vger.kernel.org,
	driver-core@lists.linux.dev,
	"H. Peter Anvin" <hpa@zytor.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	x86@kernel.org
Subject: [PATCH v2 0/9] treewide, numa_memblks: remove redundant work during NUMA init
Date: Fri,  3 Jul 2026 13:13:20 +0900
Message-ID: <20260703041329.2797584-1-ekffu200098@gmail.com>
X-Mailer: git-send-email 2.43.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Every existing numa_add_memblk() caller passes a valid node id and
separately marks that node in numa_nodes_parsed with node_set(). In
addition, numa_nodemask_from_meminfo() recomputes the same "nodes that own
memory" set from numa_meminfo, which numa_nodes_parsed already contains.

This redundancy implicitly depends on the callers' node_set(). So, before
removing the redundancy, make numa_add_memblk() set the node in
numa_nodes_parsed explicitly. Then remove the per-caller node_set() and
numa_nodemask_from_meminfo().

Also, since the generic numa_register_meminfo() already sets
node_possible_map to numa_nodes_parsed, remove the duplicate assignment in
arch_numa's numa_register_nodes().

Patch 1 adds the node_set() to numa_add_memblk() itself, so every memblk's
node is set in numa_nodes_parsed on add.

Patches 2-6 depend on patch 1 and remove the redundant per-caller node_set()
from all callers.

Patch 7 removes both numa_nodemask_from_meminfo() call sites and the unused
function itself.

Patch 8 removes the duplicate node_possible_map assignment in arch_numa.

Patch 9 is a minor cleanup, using the existing numa_add_reserved_memblk()
wrapper in numa_cleanup_meminfo().

No functional change.

---
Changes from v1 [1]
- remove warning in numa_add_memblk_to() when start == end
- add Acked-by tag
- rebased onto latest mm-new

[1] https://lore.kernel.org/all/20260628135828.1393120-1-ekffu200098@gmail.com/
--- 

Sang-Heon Jeon (9):
  mm: numa_memblks: set numa_nodes_parsed in numa_add_memblk()
  ACPI: NUMA: remove redundant numa_nodes_parsed node_set()
  of/numa: remove redundant numa_nodes_parsed node_set()
  x86/numa: remove redundant numa_nodes_parsed node_set()
  arch_numa: remove redundant numa_nodes_parsed node_set()
  LoongArch: remove redundant numa_nodes_parsed node_set()
  mm: numa_memblks: remove redundant numa_nodemask_from_meminfo()
  arch_numa: remove redundant node_possible_map assignment
  mm: numa_memblks: use numa_add_reserved_memblk() in
    numa_cleanup_meminfo()

 arch/loongarch/kernel/numa.c |  1 -
 arch/x86/mm/amdtopology.c    |  1 -
 arch/x86/mm/numa.c           |  1 -
 drivers/acpi/numa/srat.c     |  2 --
 drivers/base/arch_numa.c     |  4 ----
 drivers/of/of_numa.c         |  5 +----
 mm/numa_memblks.c            | 39 +++++++++++++++++-------------------
 7 files changed, 19 insertions(+), 34 deletions(-)

-- 
2.43.0

