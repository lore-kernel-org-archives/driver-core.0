Received: from mta1.migadu.com (out-78.mta1.migadu.com [95.215.58.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3BC175A95
	for <driver-core@lists.linux.dev>; Sun, 20 Sep 2026 03:18:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789874316; cv=none; b=Lv7XoCH4hKJAecAgXSZhfgdJ+ls0AnN99qKWPWKo7SQKiuhDQT++B2DsSTE5aySN5skn86PFi49/Gtx1RCxNkVJoBePL/DsmY92n4h9QbW6y3IB+cdN9l3VLS6lNQC/VH8YMmmcleCKKAEbvEMSV8hcTgCbLRULPma/zotlfGS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789874316; c=relaxed/simple;
	bh=vM1h2IEpNOC/A2qB1FfARCsAhtN479Y/HyUIKeMHG6k=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=eTmaDMdlnnpxbT4+vuny1zL226vEaNnIBvBJviVqZpNo++C7G3dUdTdtYdWrNBTJe9PlX58S5bvTnpRMzt6FoKUbleKHeoOt5BDh341XZU3P3kLiPrVdJRIJHVq6fRfxDrgrRXhJCwRXC8NMaFLoRABrat0lB4pliJ0cXEGu8os=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d5nxm7hb; arc=none smtp.client-ip=95.215.58.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d5nxm7hb"
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=vM1h2IEpNOC/A2qB1FfARCsAhtN479Y/HyUIKeMHG6k=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1789874312; v=1; x=1790479112;
 b=d5nxm7hbYFGm3jJSrVKH78Sha5QwmWPUbTfPrObP5CP46keqPV/+7pgJPQcL/V8B7XiIo5lp
 V2bf3Oc9lnKgSITG93lPXlUOSjpOpVGyERnArQwwOUr8C3C+Di6S9rIkl0eOXCCYLvlktGVIRPn
 /nLGCRMJWOVeZir090xr17oY=
X-Envelope-To: driver-core@lists.linux.dev
Received: by mta12.migadu.com with ESMTPS id c54495dbf87a1f9f;
	Sun, 20 Sep 2026 03:18:30 +0000
X-Mizu-Trace-ID: c54495dbf87a1f9f
X-Migadu-Flow: FLOW_OUT
From: Troy Mitchell <troy.mitchell@linux.dev>
Subject: [PATCH RFC 0/3] riscv: Add explicit die-level CPU topology
Date: Sun, 20 Sep 2026 11:18:01 +0800
Message-Id: <20260920-riscv-die-topology-rfc-v1-0-071c0bf61d5f@linux.dev>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMQQrCQAwAv1JyNhCXUlivgg/wKj3YNFsj0i1JL
 Urp3131OAMzK7iYisOhWsFkUdc8FtjvKuDbdRwEtS8MgUJDkWo0dV6wV8E5T/mRhzdaYmSimBq
 pO4kBSjyZJH39xhc4n47Q/qU/u7vw/F3Ctn0AhUKEwn8AAAA=
X-Change-ID: 20260904-riscv-die-topology-rfc-c009f6e4be92
To: Sudeep Holla <sudeep.holla@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
 Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, linux-riscv@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.dev>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2811;
 i=troy.mitchell@linux.dev; h=from:subject:message-id;
 bh=vM1h2IEpNOC/A2qB1FfARCsAhtN479Y/HyUIKeMHG6k=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFnrA2rf16yXPsr1c5Owe8Qb/aCSDWZXO6SW2x+4pVufb
 7Xnmn1YRykLgxgXg6yYIkv3A55tBT5RtgUChb4wc1iZQIYwcHEKwESc6hgZns1KTuyX82luTG9y
 rZmhKLy76sHKM+/ye/yOy6lEyCotYPhfIv6nuyivTWH6a/ftzUdSQo+YN+/dsvbLtNn2Ki+THSo
 5AA==
X-Developer-Key: i=troy.mitchell@linux.dev; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1

The generic arch_topology model has no die level. Systems with multiple
dies in one package must flatten their clusters or report each die as a
separate package, losing the die or package boundary.

This RFC adds a die ID and sibling mask to arch_topology, parses optional
dieN nodes in DT cpu-map, and exposes die topology through sysfs on RISC-V.
Clusters can be numbered independently within each die.

The RISC-V sysfs behavior is:

  - An explicit dieN node supplies a non-negative die ID within its package
    and a die sibling mask. RISC-V exposes die_id, die_cpus, and
    die_cpus_list.
  - A DT without dieN keeps die_id at -1 and creates no die sysfs files.
    Package and cluster parsing is unchanged.
  - ACPI die discovery is not implemented. The ACPI and fallback paths
    also leave die_id at -1 and create no die sysfs files.

The DT parser is shared by arm64 and RISC-V, so both record dieN nodes
internally. Only RISC-V exposes the die sysfs files in this series. If you
think I should enable this for arm64 as well, please let me know.

The sysfs visibility hook defaults to visible on other architectures,
including powerpc configurations that report die_id as -1. Their existing
sysfs behavior is unchanged.

The dieN hierarchy is a proposed extension to the DT cpu-map binding.
This RFC does not include a schema update. I'd like feedback on the
topology model and sysfs interface before sending the binding update.

Does placing dieN between socket and cluster make sense? I'd also
appreciate feedback on keeping unspecified dies at -1 and on the sysfs
visibility hook.

Tested with W=1 builds of the affected objects for RISC-V, arm64, and ARM,
and with a complete RISC-V Image build. On a 32-CPU QEMU virt guest, a DT
describing one package with two dies, four clusters per die, and four
cores per cluster exposed the expected IDs and masks and updated them
across CPU offline/online. The same guest with a legacy DT exposed no die
sysfs files while retaining package and cluster topology.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>
---
Troy Mitchell (3):
      arch_topology: Add a die level to CPU topology
      arch_topology: Parse die nodes in /cpu-map
      riscv: topology: Expose explicit CPU die topology

 arch/riscv/include/asm/topology.h |  4 +++
 drivers/base/arch_topology.c      | 68 +++++++++++++++++++++++++++++++--------
 drivers/base/topology.c           | 28 +++++++++++++++-
 include/linux/arch_topology.h     |  2 ++
 include/linux/topology.h          |  3 ++
 5 files changed, 91 insertions(+), 14 deletions(-)
---
base-commit: cee9395acd8043be0644b25c34bfa86623f2b935
change-id: 20260904-riscv-die-topology-rfc-c009f6e4be92

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.dev>

