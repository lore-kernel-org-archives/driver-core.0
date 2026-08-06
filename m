Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 399712D2488;
	Thu,  6 Aug 2026 06:58:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785999527; cv=none; b=a5OOz2Trv6UkZlpvJuDfb3QgttgnoRY6Yw07IX30OTvx7+imx/ls33Yg1dckhoUDDL/5g3jyjFMYA+V9kHihYaMM0iCi58c59SuaQqv5n2iAl0JZgthj2+1ACbuSH+48ycKxUjPztfCEAQZKpr2XR9vek0C2fcUjaeV9Bbt3Cbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785999527; c=relaxed/simple;
	bh=SQLwLwD7rv0pVUbydhLz5dKSJQuaZotdPXThhUtQm8M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=BH5o4W+S4krBEqd+oGJc51e4N5PsPGIbBctNn5kR/77MKG17vO6ZSw2p6bpWm0tCB+Z6sR5mbylNMm5nLN70iXUqB3UJE7lMlkcFkPq7gYbuePT7evsmVX3bA9gJT4JL7ugRtPnP5dgUcZ6P7KOzoSROy+N9byR4MoXQ5MPs+vE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Id+KiXWC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Id+KiXWC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 39DB91F000E9;
	Thu,  6 Aug 2026 06:58:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785999525;
	bh=Og4J4rIMluGAROgsSgHc7NrmB9oSF18CDjoJb6Nf1RI=;
	h=From:Date:Subject:To:Cc;
	b=Id+KiXWCH0b3bg7Qog+PMhWe2FZgZ/bTAjgf42f21DnSOXky2G+O00DZUtGzAPJTk
	 62wkCkugzNROZgeSjntHRq8FmWEy36oDPG5YXTBTgfzdUm/3sUidZ/0tLt18BVsBl5
	 wZwhfReGhh4l1mo2B1J6jXD5sNOb1l9+58CpldpJZ/YL+PZKh457y1F2Xy+LKyzlg9
	 S4guBDVMCwWjZLtf0a5AmV1xSfxMDseR+LLri3Bzd/71zyW3EmiIY8J6z5CR0EQa/5
	 H2i+UCbIIkFt+7FGSskzSLBNUcu3flkS0UsKXrtHlRcE/VHK870iAhYDPBNKxfw5Sy
	 d4kMiWejUY0gQ==
From: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Date: Thu, 06 Aug 2026 09:58:38 +0300
Subject: [PATCH] drivers/base, mm: move arch_numa.c to mm/
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260806-arch-numa-v1-1-968ec128121e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAJ0wdGoC/yWM0QrCMAwAf2Xk2WI7yhB/RXxIa1wjLJNkG8LYv
 9vq4x3H7WCkTAbXbgeljY1nqRBOHeSCMpLjR2XofT/4ix8cai5O1gldjDGlWF0IEWr/Vnry5/e
 63f9sa3pRXtqgFQmNXFKUXJqalUeW84S2kMJxfAEGyNpgjQAAAA==
X-Change-ID: 20260806-arch-numa-444bb4806114
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
 Catalin Marinas <catalin.marinas@arm.com>, 
 Danilo Krummrich <dakr@kernel.org>, David Hildenbrand <david@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Liam R. Howlett" <liam@infradead.org>, Lorenzo Stoakes <ljs@kernel.org>, 
 Michal Hocko <mhocko@suse.com>, Mike Rapoport <rppt@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, 
 Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@kernel.org>, 
 Will Deacon <will@kernel.org>, driver-core@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org
X-Mailer: b4 0.16-dev

arch_numa.c implements boot time discovery and initialization of NUMA
topology on architectures that select GENERIC_ARCH_NUMA (currently arm64
and riscv).

Since this is step in the initialization of the memory management
subsystem, it's logical to have arch_numa.c in mm/ alongside numa.c,
numa_memblks.c and numa_emulation.c.

Move arch_numa.c to mm/ and add its F: entry to "MEMBLOCK AND MEMORY
MANAGEMENT INITIALIZATION" in MAINTAINERS.

Signed-off-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 MAINTAINERS                      | 1 +
 drivers/base/Kconfig             | 7 -------
 drivers/base/Makefile            | 1 -
 mm/Kconfig                       | 7 +++++++
 mm/Makefile                      | 1 +
 {drivers/base => mm}/arch_numa.c | 0
 6 files changed, 9 insertions(+), 8 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5114e6db7307..465b64f8e93c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16880,6 +16880,7 @@ T:	git git://git.kernel.org/pub/scm/linux/kernel/git/rppt/memblock.git fixes
 F:	Documentation/core-api/boot-time-mm.rst
 F:	include/linux/kho/abi/memblock.h
 F:	include/linux/memblock.h
+F:	mm/arch_numa.c
 F:	mm/bootmem_info.c
 F:	mm/memblock.c
 F:	mm/memtest.c
diff --git a/drivers/base/Kconfig b/drivers/base/Kconfig
index f7d385cbd3ba..1d93bfc34490 100644
--- a/drivers/base/Kconfig
+++ b/drivers/base/Kconfig
@@ -239,13 +239,6 @@ config GENERIC_ARCH_TOPOLOGY
 	  appropriate scaling, sysfs interface for reading capacity values at
 	  runtime.
 
-config GENERIC_ARCH_NUMA
-	bool
-	select NUMA_MEMBLKS
-	help
-	  Enable support for generic NUMA implementation. Currently, RISC-V
-	  and ARM64 use it.
-
 config FW_DEVLINK_SYNC_STATE_TIMEOUT
 	bool "sync_state() behavior defaults to timeout instead of strict"
 	help
diff --git a/drivers/base/Makefile b/drivers/base/Makefile
index 8074a10183dc..435710f643a5 100644
--- a/drivers/base/Makefile
+++ b/drivers/base/Makefile
@@ -25,7 +25,6 @@ obj-$(CONFIG_PINCTRL) += pinctrl.o
 obj-$(CONFIG_DEV_COREDUMP) += devcoredump.o
 obj-$(CONFIG_GENERIC_MSI_IRQ) += platform-msi.o
 obj-$(CONFIG_GENERIC_ARCH_TOPOLOGY) += arch_topology.o
-obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
 obj-$(CONFIG_ACPI) += physical_location.o
 
 obj-y			+= test/
diff --git a/mm/Kconfig b/mm/Kconfig
index 9e0ca4824905..410b8a0a92b9 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -1469,6 +1469,13 @@ config NUMA_EMU
 	  into virtual nodes when booted with "numa=fake=N", where N is the
 	  number of nodes. This is only useful for debugging.
 
+config GENERIC_ARCH_NUMA
+	bool
+	select NUMA_MEMBLKS
+	help
+	  Enable support for generic NUMA implementation. Currently, RISC-V
+	  and ARM64 use it.
+
 config ARCH_HAS_USER_SHADOW_STACK
 	bool
 	help
diff --git a/mm/Makefile b/mm/Makefile
index eff9f9e7e061..fd29be716fa8 100644
--- a/mm/Makefile
+++ b/mm/Makefile
@@ -122,6 +122,7 @@ obj-$(CONFIG_CMA)	+= cma.o
 obj-$(CONFIG_NUMA) += numa.o
 obj-$(CONFIG_NUMA_MEMBLKS) += numa_memblks.o
 obj-$(CONFIG_NUMA_EMU) += numa_emulation.o
+obj-$(CONFIG_GENERIC_ARCH_NUMA) += arch_numa.o
 obj-$(CONFIG_BALLOON) += balloon.o
 obj-$(CONFIG_PAGE_EXTENSION) += page_ext.o
 obj-$(CONFIG_PAGE_TABLE_CHECK) += page_table_check.o
diff --git a/drivers/base/arch_numa.c b/mm/arch_numa.c
similarity index 100%
rename from drivers/base/arch_numa.c
rename to mm/arch_numa.c

---
base-commit: 075b74841bd0065a3bda3440873c747938e69b68
change-id: 20260806-arch-numa-444bb4806114

--
Sincerely yours,
Mike.

