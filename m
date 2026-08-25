Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAD1031E847
	for <driver-core@lists.linux.dev>; Tue, 25 Aug 2026 02:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787624898; cv=none; b=Rkou7qGoaOeXtd1FF7z10Q35vn7O/3qkY4UIN4hQmdr6gdaSr9vrcKasagIbF9R85GIGVvzYjdvvZEZ6NH78+YJQPwgiVLwq2HmXVTzLC6CC6wxHFSbVrLvS54lGQ7iu/R0+K/B17hfPt2NHK0GmXYkxG6nE/Ua0YaCBRI8bE4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787624898; c=relaxed/simple;
	bh=p35ooKxDDEqYJs00+ywe+gwGYag0qhbr8UgYGTT8yA4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gVSZAnEc02KRQIrnDC9aZPfTKXcNfXyA9pf6OgUApC+xikXjD5T/RaJE7SBe2AGVBcNQtRNxsQ8gn6wEki7N/yE/PGW6PDbr9kAv4JWp4u4vF3zTJ9AezbfL6xYMxVX/GetZwAEVr9P+SBsbxUppO6VdSa+xG5S6uMjk2FQuBaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fzkpQaC8; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fzkpQaC8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787624896; x=1819160896;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=p35ooKxDDEqYJs00+ywe+gwGYag0qhbr8UgYGTT8yA4=;
  b=fzkpQaC8uWadYG0y4K7iHcuz+wSfPCzR9+4BsqNHv+1ZpCcATB1bvey/
   gO1TSUnBB1PDHjDo9v7Ra00p7wlxGsLZrnGJBlgDwTGVcDy19Mf+B8juH
   8WbbbFhgSP6871PeIbe758rtJH81+SMOUk8x0P1mw151mWzWVIlZ2s8mS
   jMFg2KxCxgE3IxO6YebNkXQ6rItOCZnWXDDFiAKNdL3yraUINoVD+Zadi
   fzX+WWILBIxbzr+Q1JavF+JNjvnZUeuduW1udiPkRsUN120AB33t7Bzo6
   eI/lsrvTeYbsWtUoXyaI+96tb58F4zoopItcCmcdBtUaIY15awTTAXTlq
   g==;
X-CSE-ConnectionGUID: F2ThRn5ZSQqAyOj1uguSNw==
X-CSE-MsgGUID: /CCcjugPQ/e0ChPSqKVsHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11885"; a="98761242"
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="98761242"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 19:28:16 -0700
X-CSE-ConnectionGUID: KQlGpQmQRWef0MiKW/Zq2g==
X-CSE-MsgGUID: n6NeHPHmT6KWhioKt0tOhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,241,1779174000"; 
   d="scan'208";a="265390156"
Received: from fdefranc-mobl3.igk.intel.com ([172.28.182.157])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2026 19:28:09 -0700
From: "Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
To: linux-cxl@vger.kernel.org
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Mahesh J Salgaonkar <mahesh@linux.ibm.com>,
	Oliver O'Halloran <oohall@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R . Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	driver-core@lists.linux.dev,
	linux-pci@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	"Fabio M. De Francesco" <fabio.m.de.francesco@linux.intel.com>
Subject: [PATCH v2 13/13] PCI/CXL: Refuse an SBR of a CXL DPort unless authorized
Date: Tue, 25 Aug 2026 04:26:28 +0200
Message-ID: <20260825022628.3651434-14-fabio.m.de.francesco@linux.intel.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260825022628.3651434-1-fabio.m.de.francesco@linux.intel.com>
References: <20260825022628.3651434-1-fabio.m.de.francesco@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

CXL r4.0 sec 8.1.5.2 Table 8-32 describes a bit that makes the SBR bit
in Bridge Control take effect at all, so a Port left at the firmware
default is one the reset must not silently unmask.

Add cxl_sbr_allowed() to answer if SBR is allowed: check if a Port whose
Unmask SBR is already set needs no consent, as it happens with cxl_bus
reset.

Signed-off-by: Fabio M. De Francesco <fabio.m.de.francesco@linux.intel.com>
---
 drivers/pci/pci.c | 26 ++++++++++++++++++++++++++
 drivers/pci/pci.h |  1 +
 2 files changed, 27 insertions(+)

diff --git a/drivers/pci/pci.c b/drivers/pci/pci.c
index eedd516f8484..08873ea3957b 100644
--- a/drivers/pci/pci.c
+++ b/drivers/pci/pci.c
@@ -4881,6 +4881,11 @@ static int cxl_sbr_prepare(struct pci_dev *bridge, u16 dvsec,
 {
 	int rc;
 
+	if (action == CXL_SBR_OFFLINE_AND_UNBIND && !cxl_sbr_allowed(bridge)) {
+		pci_info(bridge, "SBR masked, write 1 to cxl_unmask_sbr to allow a bus reset\n");
+		return -ENOTTY;
+	}
+
 	/*
 	 * CXL_SBR_UNBIND: the link is already down, so offlining the regions'
 	 * memory would take the reads that page migration performs as a machine
@@ -5138,6 +5143,27 @@ static bool cxl_sbr_masked(struct pci_dev *dev)
 	return true;
 }
 
+/*
+ * cxl_sbr_allowed - whether an SBR of a CXL Downstream Port may go ahead
+ * @dev: Downstream Port to test
+ *
+ * Per CXL r4.0 sec 8.1.5.2 Table 8-32 the SBR bit in a CXL Port's Bridge
+ * Control register has no effect while the Port's Unmask SBR bit is clear, and
+ * sec 9.12.3 says System Firmware may leave it clear "to prevent CXL-unaware
+ * PCIe software from resetting the device and the link". A Port that already
+ * has it set needs no further permission; otherwise unmasking it takes the
+ * administrator's consent, given by writing 1 to the Port's cxl_unmask_sbr.
+ *
+ * Return: true if the reset paths may unmask and generate an SBR of @dev.
+ */
+bool cxl_sbr_allowed(struct pci_dev *dev)
+{
+	if (!cxl_port_dvsec(dev))
+		return false;
+
+	return dev->cxl_unmask_sbr || !cxl_sbr_masked(dev);
+}
+
 static int pci_reset_bus_function(struct pci_dev *dev, bool probe)
 {
 	struct pci_dev *bridge = pci_upstream_bridge(dev);
diff --git a/drivers/pci/pci.h b/drivers/pci/pci.h
index b6d873b077ed..bea05acc58f0 100644
--- a/drivers/pci/pci.h
+++ b/drivers/pci/pci.h
@@ -248,6 +248,7 @@ int __pci_bridge_secondary_bus_reset(struct pci_dev *dev,
 				     enum cxl_sbr_region_action action);
 bool is_cxl_dport(struct pci_dev *dev);
 u16 cxl_port_dvsec(struct pci_dev *dev);
+bool cxl_sbr_allowed(struct pci_dev *dev);
 int pci_bus_error_reset(struct pci_dev *dev);
 int pci_try_reset_bridge(struct pci_dev *bridge);
 
-- 
2.55.0

