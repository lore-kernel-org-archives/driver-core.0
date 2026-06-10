Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3035331EA9
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:45:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055942; cv=none; b=XGXIY8m1YRhV1suOLxWw9iSASGIPBWISSz7mELolvw2ihbTiy8NeUz+iNK8x1BWASVQLzY7lwiG0a7VvD5Vc8gSlJRuvKbEOYv/wt1RYnB9QXCApcrdKqZzsS3j5oqvPCLKV0KkWWjlRh6pAu8qiujGPKcxWeYBQwbiivjCfWac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055942; c=relaxed/simple;
	bh=4lm3filvyu7qL3c3XAtVgVtfMqNVCD7xcUCj3uoAlw0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qMiXctg2eWGuxL12BPK02G3F76vCofAH+CKpZ7UsVbkt9B8mzkCcdz9EAf75EVla1YVN5uO/xZfaTYtYr7FVQEzzEuw7ber4/GMvtkUD0nGOXX6zscn7XHZv/Kr85oCTe+VsT8jurFyPbTbkvhAfakIx3+5NBOzpMFQB7gBHHKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Tr9s8kfO; arc=none smtp.client-ip=209.85.160.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Tr9s8kfO"
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-5177b1a7441so87143221cf.3
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 18:45:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781055933; x=1781660733; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HsslT2SHe3Ngpr6+flW/+aA6XcPRV1aWnG37ChpGzVM=;
        b=Tr9s8kfORkvtfiXBHL4/a27gWqQaPaBzb7zzoGluWYJLGHf80RhubkIKGiPKH8potD
         hTZbl2kLYtCfmo5PCSHpszK7z+M3mPcy0qA9MoBY5k6QePyoRbcMe6XMwZwbCFLqZjMe
         hEKuuTM3jtd8Pi47A6dvKGI2O6Thu6BbVt83vFapSD+nCgp2EkY5iCC5h6RsXJUBpJkX
         ZrCaeMZpCEfJeZDki526ROga3wrFs0NYs1KTIqzb6LVSNRKf29leCZxy85Khf5Ocw7PB
         8tNmbxddC7B9/9UOJhlFvsnuYJzK/VknN0a4uof+DRVM5XKpDrdzbBmlVwTfpsJyudD2
         h93w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055933; x=1781660733;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HsslT2SHe3Ngpr6+flW/+aA6XcPRV1aWnG37ChpGzVM=;
        b=pmfASARGgos2mm/XTF4pAsGl2hxPm2Pu+Hr/vyb19QbTgEh8VYXBtPYcos5VKiQYj9
         /kutVcU6jjImSZ23+OTbU1UT/5iTp1uBim2zxEREcnAkhaitAxQ23GKBR3eRX1kGrd8o
         JPjIL9bRt231gddCiwoHMFvLBySIQX49rO3IYAzqvNEATEIDKGyWFL+5rOmOlvjc6WKT
         Z8LuZFSggMl3RLTJI/xAiT9EBGLrC5MhASg+oE8K2yZ/AXs8AecpG4bFMCXzpxqMMcWL
         3KAl2a1uLcM+Ep0oseTlkz0fxn9iIzPD2vMbfgeKAmsJ5efomDDq34INJ0ztnf2wo0Qc
         QlbQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qhF5y3bdiqpGoKw1pGzeVjFFRx7fpFGReJ07znvjWlxL1MZOHdEpgWdEPFaLpuk8oJ9V0ELx5XmCNjA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMHcA4yN8x8yaxyn4QS1aEIrZ9sTwtqOsFcV3v+1P3zuN5r3T+
	SUCzqOeMbo1HDtfJYbqkSrOnCN2K5E64N6lQvDYn70Vlx20FTNfDiu8BwDtbq1J13/g=
X-Gm-Gg: Acq92OEjjwIA2KG8Pp6p1zUkN9inm/qLlMfbScXzy1RBpzRgaDG9112KRriKj81M4cR
	Bd+0KTYekEnEs1XIpe6KdzFEPOv2YoPdbpT8xs4QraAj7tDxRVNQmRSqVgZSQBQ5aIy/fXqUxQA
	JdM26B/x4dIFa5vkfh+ZanI1L/NzNtDzM8TCOpEOqL4eAR49dVDpmhFiyzdBqqhbnKAzvdP3/QH
	yhG9gbsc9BjpLq3M7Jmvnivb+FwfoxxZC5tkOw0dLkTUjX3Jwx3W8SxlSyRwLFPmj4/T5AfCjFC
	Tx/o9D8qzlPyxqUShntRLZ3iYNpkOIu4wsHxS9RxvkolYI40ll6g9FegtclP9BIHvgUgHa33qp3
	xxCT2I1KX+TH+R4aX37ndbMqXL6i/ZtVvMK4F2QaCcZtH7fSDQeTxEvpMpCJ1bnHpRl6ny195dk
	S/1RBt/Sfk23UZeVNNfje77K/x7Nv187P8coCCyIXrhHrNpYOWJnaE+S6qLimQ+x6nbJ4DVIjbY
	9Wi2ZPC861yPNzAS8/1cw8=
X-Received: by 2002:ac8:59cd:0:b0:517:b68a:8d84 with SMTP id d75a77b69052e-517c22529e3mr130851341cf.56.1781055932831;
        Tue, 09 Jun 2026 18:45:32 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm205923261cf.4.2026.06.09.18.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:45:31 -0700 (PDT)
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
Subject: [RFC PATCH 3/3] acpi/numa: add CONFIG_ACPI_NUMA_ADD_CFMWS_NODES
Date: Tue,  9 Jun 2026 21:45:17 -0400
Message-ID: <20260610014517.253609-4-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260610014517.253609-1-gourry@gourry.net>
References: <20260610014517.253609-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CXL is intended to be a programmable topology, and a single CXL Fixed
Memory Window (CFMWS) may back memory that a driver wants to split across
multiple NUMA nodes for tiering or isolation.

Those nodes must exist at __init time to be usable later.

Add CONFIG_ACPI_NUMA_ADD_CFMWS_NODES, the number of additional standby
NUMA nodes to reserve per CEDT CFMWS entry.

acpi_parse_cfmws() records the per-window count, which is folded into
the standby request on successful acpi_numa_init().

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/acpi/numa/Kconfig | 20 ++++++++++++++++++++
 drivers/acpi/numa/srat.c  | 13 +++++++++++--
 2 files changed, 31 insertions(+), 2 deletions(-)

diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
index ecf27bf45e5b..65d7eb9a4022 100644
--- a/drivers/acpi/numa/Kconfig
+++ b/drivers/acpi/numa/Kconfig
@@ -14,6 +14,26 @@ config ACPI_HMAT
 	 performance attributes through the node's sysfs device if
 	 provided.
 
+config ACPI_NUMA_ADD_CFMWS_NODES
+	int "Additional standby NUMA nodes per CEDT CFMWS entry"
+	depends on ACPI_NUMA
+	range 0 4
+	default 0
+	help
+	  Number of additional standby NUMA nodes to reserve per CEDT
+	  CXL Fixed Memory Window Structure (CFMWS) entry.
+
+	  By default ACPI reserves 1 NUMA node per unique PXM entry in
+	  the SRAT, or 1 node for a CFMWS without SRAT mappings.
+
+	  Setting this > 0 reserves additional standby nodes per CFMWS
+	  that drivers can claim at runtime via
+	  numa_request_exclusive_node(). This is useful for CXL drivers
+	  that want to place memory on distinct NUMA nodes within the
+	  same CXL Fixed Memory Window.
+
+	  Set to 0 (default) to disable.
+
 config ACPI_NUMA_STANDBY_NODES
 	int "Additional standby NUMA nodes for runtime claiming"
 	depends on ACPI_NUMA
diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index d7b0e4ece610..6c54d5f0cf0a 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -354,6 +354,7 @@ static int __init acpi_parse_slit(struct acpi_table_header *table)
 }
 
 static int parsed_numa_memblks __initdata;
+static int cfmws_standby_count __initdata;
 
 static int __init
 acpi_parse_memory_affinity(union acpi_subtable_headers *header,
@@ -454,7 +455,7 @@ static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
 	 * window.
 	 */
 	if (!numa_fill_memblks(start, end))
-		return 0;
+		goto standby_nodes;
 
 	/* No SRAT description. Create a new node. */
 	node = acpi_map_pxm_to_node(*fake_pxm);
@@ -473,6 +474,11 @@ static int __init acpi_parse_cfmws(union acpi_subtable_headers *header,
 
 	/* Set the next available fake_pxm value */
 	(*fake_pxm)++;
+
+standby_nodes:
+	/* Request any standby nodes (created after numa_emulation runs) */
+	cfmws_standby_count += CONFIG_ACPI_NUMA_ADD_CFMWS_NODES;
+
 	return 0;
 }
 
@@ -607,6 +613,8 @@ int __init acpi_numa_init(void)
 	if (acpi_disabled)
 		return -EINVAL;
 
+	cfmws_standby_count = 0;
+
 	/*
 	 * Should not limit number with cpu num that is from NR_CPUS or nr_cpus=
 	 * SRAT cpu entries could have different order with that in MADT.
@@ -666,7 +674,8 @@ int __init acpi_numa_init(void)
 		return -ENOENT;
 
 	/* Request any standby nodes (created after numa emulation) */
-	numa_request_standby_count(CONFIG_ACPI_NUMA_STANDBY_NODES);
+	numa_request_standby_count(CONFIG_ACPI_NUMA_STANDBY_NODES +
+				   cfmws_standby_count);
 	return 0;
 }
 
-- 
2.54.0

