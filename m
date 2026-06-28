Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E70DC38E5DA
	for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 13:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782655123; cv=none; b=tYhTau7FJC0Z+hYfpb5celPm1Rd3SzUQw+lIoUNnpFTl9weF6KnifwwmNjvV96aEBLZPyTom84AAVo2+GzX9Dq7bjMlEFvo0XsI50MmfzDPad0r0CBQlYYyCVYv6uwDOCPIytC4W0LqIpMA5D4aU4XQ0YtnfzRBzSEdVI51WDBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782655123; c=relaxed/simple;
	bh=i43OM9QKvL5rNvINUoEKawD34vomI+7S+PPoUhnrPZo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=E9tCxwaYC2GIQmeqvUCSFtMd8jcxm4vTkC10IigAFot0k5Jgh1prP1iBdAz1ydpR1h4zvcslEl4xZRscYqDHn5fw9zEI60bn5fdzdoz3oUut0u3UQmugqw6iGwYIgOiuA5EsqS1V90Uc8WwAhsrvNLukG1FSfhVCsyv0JhNZxio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PfjOs7hF; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PfjOs7hF"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-845b733e82cso1502325b3a.2
        for <driver-core@lists.linux.dev>; Sun, 28 Jun 2026 06:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782655120; x=1783259920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Ij65SijD3TAjZdNPDp/lCaocyGnY8KRthDqQSOYaHw0=;
        b=PfjOs7hFZDkDc4JUz16CorK73KVVa3JtDf/8ja8NSwEHgDbEg2rBTuSAsdevpLTZZP
         0MbPT4QwGDILnGdONw2+teJLclcg75HsAws3axvjKIN+E5eo+lwqtz++1pGhBRIWuWm4
         U9zVKOyHePZtVv6Jmt49nTixzUbtIjR23KiiZAOd2TFYVMiu1Gxc1H7RCAheY7M0ElQS
         ch4VfqohnB5Vgdsy7u7oXoDcVVu09E1TTtsezLhxQj9I59lF6Qe61hC/fRwuBNrCeQVv
         gK0xczipHP3xgTeb7WyQW1EW2zCNWTiDBgD5PhUUB6OOvC7N0bqAhF2jXcy64Jc6zB3v
         42vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782655120; x=1783259920;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ij65SijD3TAjZdNPDp/lCaocyGnY8KRthDqQSOYaHw0=;
        b=FyC62/xTKQAUbpMnwc1SnR5ANJ5VUyFHnIVA1n4KQlIhoUrJdov7gtKeO7tfxgi0FD
         H1YQYozdkrXw8yoyl26qZ1LKxhoCArIVnplQKAq9MVPvuruVb+5wMNb7ngI/OFkIDg1T
         IynNzVVTogbMZjEUQgnuLAaDL6fMmaSb86AN1zOC68oKAsp3rBIZCy1uEvPAp+imUGiK
         kMtRoM7h4d1+qDWhRTUVMYKeLez4xF0n3bVL7RApGITq8Tpk9zFQsTD8hPhUZTLXaufR
         NV/7taspiwQ68jefytNfIJe5y/6nuKR8CoIRkoyChs9XRqJJqCkP7T6gQRrRoLv6Ic23
         ffhQ==
X-Forwarded-Encrypted: i=1; AFNElJ+HgWRzGny4reDimE0RZgm2qj0Ts4TyTA+veQ9zDAqxjUMz+PBOJCOoAdn8whHJ9jzBo0F6wDaYFhVZcQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws/mXWExa/EVTGJbTAYcdJ6kvpIWSxYuDIus7jC7aTD75PL65Y
	Kc4lJYw0ghy0Q1t9vilUQHCDBlPLIaDBqG/ezc1u5TqV2aaAjYEpjAds
X-Gm-Gg: AfdE7cn62ncE21Da/pLpsa/ugroaopgxDYHHI3puIKez+P1UFiMxWOSVgRruinDDciI
	EsEPsqBTNiYRK1osU5dxLgu3EBCL3vHAWcmhb+vQ6/kebeFT0cXGbVfyh8MvpMykuYY+LRH51jN
	u/rgUjYLL+g6vAmY/pMl52Jwa4ZDmVDf6dz7UJ9qPaWXU7d39/1AHMlxnXeQPbjj57ieZdR/McA
	CNQA29AuBy+kDFi98/miSIL7gKX2FEz+cJS7zTlkZZ3sws4ugrX484OP5SvmzRwIBnFntW8HjfN
	zd7B2fuslKQIDegZkI6w+row7oJJdGkAGMEtUdfmvyKJ9YsCTqZaBzuWV6zANERWqiJO/Zc0oUs
	M6NcmrukFy+WJ4HlpcNhCGb/QfYA90meoQ1uhJvloBP9p8hmN8zgs6g1vCJBWS8TKcYWWph2fw5
	w3c/NypiM=
X-Received: by 2002:a05:6a00:3e03:b0:845:d1fe:9cd0 with SMTP id d2e1a72fcca58-845d1fea7c0mr6017737b3a.0.1782655120131;
        Sun, 28 Jun 2026 06:58:40 -0700 (PDT)
Received: from ubuntu.. ([110.9.142.4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a40d23d7sm10041108b3a.30.2026.06.28.06.58.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 06:58:39 -0700 (PDT)
From: Sang-Heon Jeon <ekffu200098@gmail.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Andy Lutomirski <luto@kernel.org>,
	Borislav Petkov <bp@alien8.de>,
	Danilo Krummrich <dakr@kernel.org>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Huacai Chen <chenhuacai@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Mike Rapoport <rppt@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>
Cc: Sang-Heon Jeon <ekffu200098@gmail.com>,
	devicetree@vger.kernel.org,
	driver-core@lists.linux.dev,
	"H. Peter Anvin" <hpa@zytor.com>,
	Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org,
	linux-mm@kvack.org,
	loongarch@lists.linux.dev,
	WANG Xuerui <kernel@xen0n.name>,
	x86@kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 0/9] treewide, numa_memblks: remove redundant work during NUMA init
Date: Sun, 28 Jun 2026 22:58:14 +0900
Message-ID: <20260628135828.1393120-1-ekffu200098@gmail.com>
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
 mm/numa_memblks.c            | 41 +++++++++++++++---------------------
 7 files changed, 18 insertions(+), 37 deletions(-)

-- 
2.43.0

