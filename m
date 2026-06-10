Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95CC21C9EA
	for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 01:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781055939; cv=none; b=MRZXdouYwRCM1YQs/uGTBM8Qh5HhfE2v4aZ4aTVCun3DV6Kx9GOaH1ymAzA0lWJ+0N2ONw2+gfyELEZiWox85ZERyeLSpxZNf4VZunWhvfXfG1wFjWa+5ECwIjWg7MJiG7iUBhjmwzIMb+4joTzMWPV3V07oQGJLlXXs6ZYsmwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781055939; c=relaxed/simple;
	bh=8Jzxfarh3kFcVduKM3nTtCfp1Kiq3jIGAAIiFN4XSUM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZG636XzHvZQk5KFomRS9BUk2nak39Atoi5TDqn6Yuxt2bgF+mR/yh+TCYBLx8Cm448cDqCiBZzVUJQvtLtL6V93EIxgiaJkYkpSolmLyY8Oql5nfGLPUMelnboEw+HzOjOEXll32SYQPtfEh95DGPdNOS+gQhNUcAEphBarrqyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=V1jQTeBc; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="V1jQTeBc"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-517760dc3c2so37769241cf.3
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 18:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781055930; x=1781660730; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pKutm9+cyTIXeV2mo8MjsDLORYjIUZMG6rmHK81GwDk=;
        b=V1jQTeBcDuxK6xDvMvs8BvushDQInf7oVis+hf5LtF5cSeYkIR/4R+rWprVI/fI3Yz
         0K4aW1Pbs/R1beN5lK9JLdGL3lekZTKJ7M4cT4eZi7NTNv45/Qd/mtl8ocNFSjZvKOPn
         qJpAKKk5WixDuq3czhvFjvnrEg7dKBvPoA7MZbWejkGDYcLM/42zBQTZeDrxOeykNuFC
         WUtU4u98mCYZ3cVVL2LZBVyIw2yOXcyKMKvwaDfMutbMeQo0HPAPYBopyCxUmc4ynw1q
         EJwdRM7WyD/97vpPnBktQjmApPnxVJWagcM8Q/KcWPdtbbjnpYNS0fl2Clt5V30QeuEb
         HyvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781055930; x=1781660730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=pKutm9+cyTIXeV2mo8MjsDLORYjIUZMG6rmHK81GwDk=;
        b=pSo2Cdx9m9SwrXSEcOjj6C8XuJCYJC/TDKM1myy3lzSpCfOUMOYBRQBkfY/ghTdFrS
         mBtj3Ro0eKY5s6dPQvWia8fPF6wyxds52rGVjlfxAx33T9ddOGy002usDnWUBRecRrPT
         7v2iL1p9+bRdbHdGK3oiQXqqDnl62/IZjCOBgaey7Nw8bYCAS93XjcBNivbsadm7iHxI
         Aoupt3FnEV4jCF7xwBhlWD7dPDApIOelWouYGewGJZ6vcrL+GqGLm2pCcJeKb/KPvrsX
         KPdQ+TT4ShmEWep3vdI2REFTIx5N1rSPyph14EZxsp2fMulaugDw/AXe9qoJMJNYUr8d
         6Ckw==
X-Forwarded-Encrypted: i=1; AFNElJ8Vq0rlfZaT5v4EOdh8XDQNvNLHb8Nm8Gi3kMJNNKamwrTjV5AjgQALb2amDuJfeNAL8VnFJz0TWDNolg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzk+nhMwfe4cqjFDy3Pa/2JrSgrRzVHyhckECqVg2TxaV51l4wS
	wVZBPZXcx60+v7z/Y/9vkUFF7SDUKXbB7hUXwgYMEyvhGrshLHyRa9r739glG6zUDvI=
X-Gm-Gg: Acq92OErlvwt0qXgDAQq8oAp0G8FrpJ3i1uQyzUwFXgK6EPVVdbaxiB97eF7IuUZ2+2
	Z5/jQzLTZzg58550DErCHs97UZ6Wm2r3dzQgOy1Z/roFfQ66PMOec5uiTF65RdZKTgYvW9tSNSv
	wGuw45ZzjX6d6/f4ox/adLif/QTPL925AdgNw8JQdMBQm/uS0RjzEBay2Lg0wXS35sp/Tvx3ahp
	XAftvMiyhqDFrbviF2w0/UiB+HqI7v8ZOla/w6jEjd7cSyBstQv01nc6/bbJsVAT/6u9gY9EwS0
	ZqHhYsi/LQYZ1QlupPrsfcnXkQeJ2NxKeA3IP231Ne6/5lMvYYSEE5wDR/UOW03Hrw5Vb+ugArF
	WLW13ODBqGCtixTjkcNTxmtNMXh8ZR87/z/pucQ4DqcFoIO27e3OvOwYNbRMZ2SGUB3TP5Y5sre
	K1CgnJ6DuBxR3szEydVqhHejMotL/+AWYdNSGpBeQ037os6YvU/0thQhJ8Un1MojT+xPPoDMsVc
	1my92841cALi8v3qo9Ch0M=
X-Received: by 2002:a05:622a:155:b0:516:cee1:4727 with SMTP id d75a77b69052e-51795aeb96bmr323037361cf.14.1781055930465;
        Tue, 09 Jun 2026 18:45:30 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51775c07e91sm205923261cf.4.2026.06.09.18.45.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 09 Jun 2026 18:45:30 -0700 (PDT)
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
Subject: [RFC PATCH 2/3] acpi/numa: add CONFIG_ACPI_NUMA_STANDBY_NODES
Date: Tue,  9 Jun 2026 21:45:16 -0400
Message-ID: <20260610014517.253609-3-gourry@gourry.net>
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

Some platforms want to reserve empty NUMA nodes at boot so that drivers
can later place hotplugged memory on distinct nodes for memory tiering
or isolation, without those nodes being described by BIOS.

Add CONFIG_ACPI_NUMA_STANDBY_NODES, a platform-independent count of empty
nodes to reserve.

Deferring standby node creation until after NUMA emulation runs keeps
old numbering behaviors consistent for NUMA emulation users.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 drivers/acpi/numa/Kconfig | 15 +++++++++++++++
 drivers/acpi/numa/srat.c  |  3 +++
 2 files changed, 18 insertions(+)

diff --git a/drivers/acpi/numa/Kconfig b/drivers/acpi/numa/Kconfig
index f33194d1e43f..ecf27bf45e5b 100644
--- a/drivers/acpi/numa/Kconfig
+++ b/drivers/acpi/numa/Kconfig
@@ -13,3 +13,18 @@ config ACPI_HMAT
 	 register memory initiators with their targets, and export
 	 performance attributes through the node's sysfs device if
 	 provided.
+
+config ACPI_NUMA_STANDBY_NODES
+	int "Additional standby NUMA nodes for runtime claiming"
+	depends on ACPI_NUMA
+	range 0 16
+	default 0
+	help
+	  Number of additional empty NUMA nodes to reserve at boot for
+	  runtime claiming via numa_request_exclusive_node().
+
+	  These nodes have no memory and no SRAT PXM association.
+	  Drivers can claim them to place hotplugged memory on distinct
+	  NUMA nodes for memory tiering or isolation purposes.
+
+	  Set to 0 (default) to disable.
diff --git a/drivers/acpi/numa/srat.c b/drivers/acpi/numa/srat.c
index 62d4a8df0b8c..d7b0e4ece610 100644
--- a/drivers/acpi/numa/srat.c
+++ b/drivers/acpi/numa/srat.c
@@ -664,6 +664,9 @@ int __init acpi_numa_init(void)
 		return cnt;
 	else if (!parsed_numa_memblks)
 		return -ENOENT;
+
+	/* Request any standby nodes (created after numa emulation) */
+	numa_request_standby_count(CONFIG_ACPI_NUMA_STANDBY_NODES);
 	return 0;
 }
 
-- 
2.54.0

