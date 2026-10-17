Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF7E411FAC;
	Sat, 17 Oct 2026 11:36:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792237022; cv=none; b=r6IY4na77Hj1PnoLR1hkIjUoEs74oXQop6gpseBaW6PQkHtv1wYo1ouucSRB4ditTNpritWyEd/ADNv7KLAxTyqWbiIxyA2VH4u0xL0mHO6wkwf7ZjLqBRXvxfOD3g9s0hEwbZ0RGdy/OwgkGBQLmdwxttpOLeJZerscPA6x6DA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792237022; c=relaxed/simple;
	bh=EU6IGMfQspRJd1dNBbQ5RsoMxnIpWQ/xkER2ne8tZBU=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To; b=QQPFjavFgY/2KS3FI0yBRoYsnaNzuNYrVm4hzoX0LL5DCmdJAYsCismstWXCtJjsclRHnbavAJLKsRX8lpMig83lhxH0rb0T6KWMJPa5/n9l5ShdRTr6tU1wUxNFAtieXskEsjilgKyL72tuebg4uQBCj8bp7gLEMTgt9OBSUzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QGxTH+bL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QGxTH+bL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A8AC1F000C4;
	Sat, 17 Oct 2026 11:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792237019;
	bh=Y4/5jK45P4Pnb3zDsMxbggy4Da7UB2Yr9bV6Gep4kLM=;
	h=Date:From:Subject:Cc:To;
	b=QGxTH+bL5jO5dBS4/DcfyoP0F+lXLBrmV2J332CQV3DyyGGbY/Jbl4qeJXZCHMI51
	 x5dFmDPIJRbKkAAdowt3ntq3waqA51xFjwquB7eCTxkOHjxjQ7jSnCZgw07YNqSal/
	 0G3ePXsxCUlC++o8t1Ew3PcV1CXJ/eMP/YQbhsE+tBli0WynmGJXlPBkmdQPiUVqOv
	 Q5kBFkWyXCHoOxN6XmoSp3ihR6RzQXonVCPOoEni3zeNxoiG3wIB/YF0C7pB6Z6Ykc
	 j2L5mDsoOD6lNPvOphu0anhMbK2X/yxoFEsiNefpd/a8UVjlRzjC676t8Ft1gPIBAC
	 rxO9EsLBWgCeQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 17 Oct 2026 13:36:54 +0200
Message-Id: <DM72ZY5B2CHK.3CEOSQUBXTAHQ@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core changes for 7.4-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
X-Mailer: aerc 0.22.0

Hi Linus,

Please pull these driver-core changes.

All commits have been in linux-next (no conflicts expected); two signed tag=
s for
Rust I/O and DMA changes have been shared with other trees.

Thanks,
Danilo

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e=
:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.4-rc1

for you to fetch changes up to d4ffc4896b3e709c6a5d7e5a78a1fddfc774fa25:

  rust: pci: add extended capability and SR-IOV support (2026-10-13 01:12:5=
8 +0200)

----------------------------------------------------------------
Driver core changes for 7.4-rc1

- core:

  - Add TAINT_FORCED_BIND to taint the kernel and driver module before manu=
al
    sysfs bind/unbind operations; make add_taint_module() available to
    driver core and update taint decoding tools and documentation

  - Constify device_show/store_*() attribute parameters and adapt x86 MCE a=
nd
    perf users to prepare for const dev_ext_attribute instances

  - Fix UAF in NUMA access node registration failure handling by dropping
    the device reference with put_device() instead of directly freeing the =
node

- debugfs:

  - Make debugfs_create_str() read-only to eliminate double-free races betw=
een
    concurrent writers; reject writable modes; convert interconnect and
    SoundWire users to local file operations with mutex-protected strings

- kobject:

  - Fix out-of-bounds access in kobject_action_type() when parsing action
    strings containing embedded NUL bytes

  - Fix the kobject_set_name() reference in kset_register() kernel-doc

- Rust:

  - DMA:

    - Tie Coherent, CoherentBox and CoherentHandle to the device's bound
      lifetime to prevent retaining DMA allocations beyond driver unbind;
      propagate the lifetime through nova-core and the DMA sample driver

  - I/O:

    - Require explicit base types for registers and replace relative regist=
ers
      with typed subregion projections; reimplement register!() as a proc
      macro, support registers using existing types without inline bitfield=
s,
      and convert nova-core, Tyr and the PCI sample; add AsRepr/AsReprMut a=
nd
      transmute helpers with deferred size checks for representation
      conversions

    - Wrap ResourceSize in a transparent newtype with explicit conversions,
      including checked conversion to usize

  - PCI:

    - Add typed PCIe extended capability lookup and SR-IOV accessors for th=
e
      First VF Offset and decoded VF BAR addresses and widths, keeping raw
      SR-IOV registers private to preserve PCI core ownership of their stat=
e

  - scatterlist:

    - Honor the device's maximum segment size as well as the DMA mapping li=
mit
      when constructing SG tables

    - Return u32 from SGEntry::dma_len() to match the C segment length type

  - misc:

    - Validate auxiliary DeviceId name length explicitly to improve
      compile-time diagnostics for oversized device ID table entries

    - Drop unnecessary 'static bounds from debugfs ScopedDir file creation
      methods to support data containing non-'static references, including =
DMA
      buffers

- misc:

  - Add Johan Hovold as driver core maintainer

  - Simplify platform_device_alloc() by returning early on allocation failu=
re

  - Fix typos in driver core and kernfs comments

----------------------------------------------------------------
Cezary Rojewski (1):
      driver core: platform: Simplify platform_device_alloc()

Danilo Krummrich (7):
      rust: debugfs: drop 'static bound from ScopedDir file creation method=
s
      rust: dma: tie CoherentHandle to the device's bound lifetime
      samples: rust_dma: separate driver type from driver data
      rust: dma: tie Coherent and CoherentBox to the device's bound lifetim=
e
      Merge patch series "rust: io: support register projections and remove=
 relative registers"
      Merge patch series "rust: dma: tie DMA allocations to the device's bo=
und lifetime"
      Merge tag 'v7.3-rc5' into driver-core-next

Gary Guo (16):
      rust: io: register: reimplement as proc macro
      rust: mem: add `transmute` with deferred size check
      rust: mem: add `AsRepr` and `AsReprMut`
      rust: io: perform conversions using `AsRepr`
      rust: io: support register projections
      rust: io: register: allow explicit base type specification
      gpu: nova-core: specify base type for registers
      drm/tyr: specify base type for registers
      samples: rust: pci: specify base type for registers
      rust: io: register: make register have a typed base
      rust: io: register: support fixed offset register without bitfield
      gpu: nova-core: use projection for PFALCON and PFALCON2 registers
      gpu: nova-core: convert hshub0 from relative register to projection
      rust: io: register: remove relative registers
      rust: io: register: remove `Register` trait and cleanup macro
      rust: io: register: unify handling of register with/without bitfields

Georgios Androutsopoulos (1):
      rust: auxiliary: validate DeviceId name length

Greg Kroah-Hartman (4):
      Merge 7.3-rc2 into driver-core-next
      module: pull out add_taint_module() to be public
      module: fix up documentation for add_taint() and add_taint_module()
      driver core: add TAINT_FORCED_BIND for when userspace manually messes=
 with devices and drivers

Hemanth Selam (1):
      driver core: fix typos in comments

Jiacheng Xu (1):
      kobject: fix out-of-bounds access in kobject_action_type()

Johan Hovold (1):
      MAINTAINERS: add myself as driver core maintainer

Karl Mehltretter (1):
      kobject: Fix the kobj_set_name reference in kset_register() kernel-do=
c

Linkai Gong (1):
      drivers/base/node: fix UAF on device_register() failure

Lorenzo Delgado (2):
      rust: scatterlist: return u32 from SGEntry::dma_len()
      rust: io: convert ResourceSize into a transparent newtype

Matteo Kloiber (1):
      rust: scatterlist: honor the device's maximum segment size

Thomas Wei=C3=9Fschuh (3):
      x86/mce: Use __DEVICE_ATTR() macro to initialize dev_ext_attribute
      drivers: perf: Use __DEVICE_ATTR() macro to initialize dev_ext_attrib=
ute
      driver core: Constify the signature of device_show/store_*()

Uwe Kleine-K=C3=B6nig (1):
      docs: admin-guide: Handle TAINT_FORCED_BIND when parsing /proc/sys/ke=
rnel/tainted

Yichong Chen (3):
      interconnect: debugfs: replace writable string helper
      soundwire: debugfs: replace writable string helper
      debugfs: make debugfs_create_str() read-only

Zhi Wang (1):
      rust: pci: add extended capability and SR-IOV support

 Documentation/admin-guide/tainted-kernels.rst      |  54 ++--
 MAINTAINERS                                        |   2 +
 arch/powerpc/perf/hv-24x7.c                        |   2 +-
 arch/x86/kernel/cpu/mce/core.c                     |   6 +-
 drivers/base/bus.c                                 |   3 +
 drivers/base/core.c                                |  30 +-
 drivers/base/node.c                                |  17 +-
 drivers/base/platform.c                            |  19 +-
 drivers/base/property.c                            |   2 +-
 drivers/base/transport_class.c                     |   2 +-
 drivers/gpu/drm/tyr/driver.rs                      |   1 +
 drivers/gpu/drm/tyr/fw.rs                          |   5 +-
 drivers/gpu/drm/tyr/regs.rs                        |  45 ++-
 drivers/gpu/drm/tyr/vm.rs                          |   1 -
 drivers/gpu/nova-core/driver.rs                    |   1 +
 drivers/gpu/nova-core/falcon.rs                    | 163 +++++-----
 drivers/gpu/nova-core/falcon/fsp.rs                |  63 ++--
 drivers/gpu/nova-core/falcon/gsp.rs                |  51 +--
 drivers/gpu/nova-core/falcon/hal/ga102.rs          |  59 ++--
 drivers/gpu/nova-core/falcon/hal/tu102.rs          |   9 +-
 drivers/gpu/nova-core/falcon/sec2.rs               |  37 ++-
 drivers/gpu/nova-core/fb.rs                        |   4 +-
 drivers/gpu/nova-core/fb/hal/gb100.rs              |  59 ++--
 drivers/gpu/nova-core/fb/regs.rs                   |  34 +-
 drivers/gpu/nova-core/firmware/booter.rs           |   2 +-
 drivers/gpu/nova-core/firmware/fsp.rs              |   8 +-
 drivers/gpu/nova-core/firmware/fwsec/bootloader.rs |  30 +-
 drivers/gpu/nova-core/firmware/gsp.rs              |  14 +-
 drivers/gpu/nova-core/firmware/riscv.rs            |   8 +-
 drivers/gpu/nova-core/fsp.rs                       |  20 +-
 drivers/gpu/nova-core/gpu.rs                       |   4 +-
 drivers/gpu/nova-core/gsp.rs                       |  30 +-
 drivers/gpu/nova-core/gsp/boot.rs                  |  10 +-
 drivers/gpu/nova-core/gsp/cmdq.rs                  |  35 +-
 drivers/gpu/nova-core/gsp/commands.rs              |   2 +-
 drivers/gpu/nova-core/gsp/fw.rs                    |  12 +-
 drivers/gpu/nova-core/gsp/hal.rs                   |  14 +-
 drivers/gpu/nova-core/gsp/hal/gh100.rs             |  16 +-
 drivers/gpu/nova-core/gsp/hal/tu102.rs             |  41 ++-
 drivers/gpu/nova-core/gsp/regs.rs                  |   9 +-
 drivers/gpu/nova-core/gsp/sequencer.rs             |   6 +-
 drivers/gpu/nova-core/regs.rs                      | 115 ++++---
 drivers/gpu/nova-core/vbios.rs                     |  11 +-
 drivers/interconnect/debugfs-client.c              |  81 ++++-
 drivers/perf/alibaba_uncore_drw_pmu.c              |   2 +-
 drivers/perf/arm-cci.c                             |   2 +-
 drivers/perf/arm-ccn.c                             |   2 +-
 drivers/perf/arm_cspmu/arm_cspmu.h                 |   2 +-
 drivers/perf/arm_dsu_pmu.c                         |   2 +-
 drivers/perf/arm_spe_pmu.c                         |   6 +-
 drivers/perf/cxl_pmu.c                             |  10 +-
 drivers/perf/fsl_imx8_ddr_perf.c                   |   2 +-
 drivers/perf/fujitsu_uncore_pmu.c                  |   2 +-
 drivers/perf/hisilicon/hisi_pcie_pmu.c             |   2 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.h           |   6 +-
 drivers/perf/hisilicon/hns3_pmu.c                  |   6 +-
 drivers/perf/nvidia_t410_c2c_pmu.c                 |   2 +-
 drivers/perf/nvidia_t410_cmem_latency_pmu.c        |  12 +-
 drivers/perf/qcom_l3_pmu.c                         |   8 +-
 drivers/perf/starfive_starlink_pmu.c               |   2 +-
 drivers/perf/xgene_pmu.c                           |   2 +-
 drivers/soundwire/debugfs.c                        |  63 +++-
 fs/debugfs/file.c                                  |  81 +----
 include/linux/device.h                             |  14 +-
 include/linux/kernfs.h                             |   2 +-
 include/linux/module.h                             |  10 +
 include/linux/panic.h                              |   3 +-
 include/trace/events/module.h                      |   3 +-
 kernel/module/main.c                               |  17 +-
 kernel/panic.c                                     |  10 +-
 lib/kobject.c                                      |   2 +-
 lib/kobject_uevent.c                               |   2 +-
 rust/helpers/dma.c                                 |   5 +
 rust/helpers/pci.c                                 |   5 +
 rust/kernel/auxiliary.rs                           |   8 +
 rust/kernel/bitfield.rs                            |   9 +
 rust/kernel/debugfs.rs                             |  26 +-
 rust/kernel/debugfs/entry.rs                       |   4 +-
 rust/kernel/debugfs/file_ops.rs                    |  29 +-
 rust/kernel/device_id.rs                           |   3 +-
 rust/kernel/dma.rs                                 | 141 ++++----
 rust/kernel/io.rs                                  | 255 +++++++++++----
 rust/kernel/io/register.rs                         | 759 ++++++++++-------=
---------------------------
 rust/kernel/io/resource.rs                         |   6 +-
 rust/kernel/lib.rs                                 |   1 +
 rust/kernel/mem.rs                                 | 234 ++++++++++++++
 rust/kernel/pci.rs                                 |   8 +
 rust/kernel/pci/cap.rs                             | 292 +++++++++++++++++
 rust/kernel/scatterlist.rs                         |  23 +-
 rust/kernel/sync/atomic.rs                         |   4 +-
 rust/kernel/uaccess.rs                             |   4 +-
 rust/macros/io/mod.rs                              |   3 +
 rust/macros/io/register.rs                         | 296 +++++++++++++++++
 rust/macros/lib.rs                                 |   9 +
 samples/rust/rust_dma.rs                           |  30 +-
 samples/rust/rust_driver_pci.rs                    |   4 +
 tools/debugging/kernel-chktaint                    |   8 +
 97 files changed, 2153 insertions(+), 1427 deletions(-)
 create mode 100644 rust/kernel/mem.rs
 create mode 100644 rust/kernel/pci/cap.rs
 create mode 100644 rust/macros/io/mod.rs
 create mode 100644 rust/macros/io/register.rs
