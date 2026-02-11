Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8C12311958;
	Wed, 11 Feb 2026 23:04:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770851090; cv=none; b=W4gEFE6tOKeBGEf9+P8zGV9wruFKcYCPV8Ph4QQx+HPgMj1bcUP7BM11WvZO+NIZ/eUhk4EBS2JjadwBoDUhjcyktRWXki+Vtyj8d0VEKHotZtWwR9cC5gKjcUD246tyz6NkIqhqNhLYiKXwTO3yqUdZSxgG2XCqYmEN7gQWVpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770851090; c=relaxed/simple;
	bh=R7aLCo99tmmcbW4BXQpSC6RCYwbGZW1x6auzhFzXiRU=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version; b=cp6Kxwrwb5gpq+1pYxgsFE33XYJQqwyHNEUeTETwYiHNYxw6IJT1mUkWxfX7/uppiHuNxqLjynL1JaCsDm/dgMqMnNEk0LgXOmKkBzEpsti6CQRn2mfL10M/J5fYgkebpBfGO49n4EmzsOvG3zOHLd63R4556OcqH3qJmesh84c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JOL1r0B9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JOL1r0B9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A818FC4CEF7;
	Wed, 11 Feb 2026 23:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770851090;
	bh=R7aLCo99tmmcbW4BXQpSC6RCYwbGZW1x6auzhFzXiRU=;
	h=Date:Subject:Cc:To:From:From;
	b=JOL1r0B9ID7BZS5zyUTRnSlJUe6YL8jH8YA2JrDx01iVG8/Sz4Ch4WWZ7iwRLh583
	 ZZwbbP4cZ6iPvrCswiCk3UEvCxDv1SufvYpCUjdZIQ2qWtjcaqz+jI0SFE+hxxqZa/
	 ljZoW4TKPDtpsWd/xLT2mLFBxAgs8nQlYRBJTUnYY8E7NRzQbERdRvyQexcpwa1h4u
	 OPabdc/cfimnuz2ys97G4ZnRtecbV1o6qr3q3zG4XMnSP2KhPA5DCTgDAriZJB2pb6
	 R3rPvpJE+GgG2xF8nkp1KMBYa6TRKeBpxPOfkLKk9nq0zbzR5J988gFkEprGmL3D8A
	 GXTmNuhx7gJyw==
Content-Type: text/plain; charset=UTF-8
Date: Thu, 12 Feb 2026 00:04:46 +0100
Message-Id: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
Subject: [GIT PULL] Driver core changes for 7.0-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: aerc 0.20.1

Hi Linus,

Please pull these driver-core changes.

All commits have been in linux-next for a couple rounds; no conflicts expec=
ted.

In the -rc7 PR [1] I held back a driver-core fix (now included), as it
uncovered potential deadlocks that required a few driver fixes.

You should have received one of those for -rc8 through the gpio tree [2];
another one is included in this PR [3], and the latest one [4] should reach=
 you
via a -fixes PR from the clk tree.

I spent significant effort catching those cases, but they are a bit tricky =
to
spot. However, all known ones have been addressed.

[1] https://lore.kernel.org/driver-core/DFWVL46MM928.V9LOBRWI8BLZ@kernel.or=
g/
[2] https://lore.kernel.org/all/20260127201725.35883-1-dakr@kernel.org/
[3] https://lore.kernel.org/all/20260121141215.29658-1-dakr@kernel.org/
[4] https://lore.kernel.org/all/20260211142321.55404-1-dakr@kernel.org/

The following changes since commit 63804fed149a6750ffd28610c5c1c98cce6bd377=
:

  Linux 6.19-rc7 (2026-01-25 14:11:24 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.0-rc1

for you to fetch changes up to ba268514ea14b44570030e8ed2aef92a38679e85:

  rust: devres: fix race condition due to nesting (2026-02-07 01:03:49 +010=
0)

----------------------------------------------------------------
Driver core changes for 7.0-rc1

- Bus:
  - Ensure bus->match() is consistently called with the device lock held
  - Improve type safety of bus_find_device_by_acpi_dev()

- Devtmpfs:
  - Parse 'devtmpfs.mount=3D' boot parameter with kstrtoint() instead of
    simple_strtoul()
  - Avoid sparse warning by making devtmpfs_context_ops static

- IOMMU:
  - Do not register the qcom_smmu_tbu_driver in arm_smmu_device_probe()

- MAINTAINERS:
  - Add the new driver-core mailing list (driver-core@lists.linux.dev)
    to all relevant entries
  - Add missing tree location for "FIRMWARE LOADER (request_firmware)"
  - Add driver-model documentation to the "DRIVER CORE" entry
  - Add missing driver-core maintainers to the "AUXILIARY BUS" entry

- Misc:
  - Change return type of attribute_container_register() to void; it has
    always been infallible
  - Do not export sysfs_change_owner(), sysfs_file_change_owner() and
    device_change_owner()
  - Move devres_for_each_res() from the public devres header to
    drivers/base/base.h
  - Do not use a static struct device for the faux bus; allocate it
    dynamically

- Revocable:
  - Patches for the revocable synchronization primitive have been
    scheduled for v7.0-rc1, but have been reverted as they need some
    more refinement

- Rust:
  - Device:
    - Support dev_printk on all device types, not just the core Device
      struct; remove now-redundant .as_ref() calls in dev_* print calls

  - Devres:
    - Introduce an internal reference count in Devres<T> to avoid a
      deadlock condition in case of (indirect) nesting

  - DMA:
    - Allow drivers to tune the maximum DMA segment size via
      dma_set_max_seg_size()

  - I/O:
    - Introduce the concept of generic I/O backends to handle different
      kinds of device shared memory through a common interface.

      This enables higher-level concepts such as register abstractions,
      I/O slices, and field projections to be built generically on top.

      In a first step, introduce the Io, IoCapable<T>, and IoKnownSize
      trait hierarchy for sharing a common interface supporting offset
      validation and bound-checking logic between I/O backends.

    - Refactor MMIO to use the common I/O backend infrastructure

  - Misc:
    - Add __rust_helper annotations to C helpers for inlining into Rust
      code
    - Use "kernel vertical" style for imports
    - Replace kernel::c_str! with C string literals
    - Update ARef imports to use sync::aref
    - Use pin_init::zeroed() for struct auxiliary_device_id and debugfs
      file_operations initialization
    - Use LKMM atomic types in debugfs doc-tests
    - Various minor comment and documentation fixes

  - PCI:
    - Implement PCI configuration space accessors using the common I/O
      backend infrastructure
    - Document pci::Bar device endianness assumptions

  - SoC:
    - Abstractions for struct soc_device and struct soc_device_attribute
    - Sample driver for soc::Device

----------------------------------------------------------------
Alexandre Courbot (1):
      rust: io: move MIN_SIZE and io_addr_assert to IoKnownSize

Alice Ryhl (9):
      rust: auxiliary: add __rust_helper to helpers
      rust: device: add __rust_helper to helpers
      rust: dma: add __rust_helper to helpers
      rust: io: add __rust_helper to helpers
      rust: irq: add __rust_helper to helpers
      rust: pci: add __rust_helper to helpers
      rust: platform: add __rust_helper to helpers
      rust: property: add __rust_helper to helpers
      rust: scatterlist: add __rust_helper to helpers

Alok Tiwari (2):
      rust: auxiliary: fix remove_callback invariant comment
      rust: platform: fix remove_callback invariant comment

Andy Shevchenko (1):
      driver core: make bus_find_device_by_acpi_dev() stub prototype aligne=
d

Atharv Dubey (1):
      rust: auxiliary: use `pin_init::zeroed()` for device ID

Beata Michalska (1):
      rust: dma: allow drivers to tune max segment size

Ben Dooks (1):
      devtmpfs: make 'devtmpfs_context_ops' static

Daniel Gomez (1):
      driver core: attribute_container: change return type to void

Danilo Krummrich (18):
      rust: debugfs: use "kernel vertical" style for imports
      Merge tag 'v6.19-rc3' into driver-core-next
      rust: auxiliary: use "kernel vertical" style for imports
      rust: platform: use "kernel vertical" style for imports
      rust: driver-core: use "kernel vertical" style for imports
      rust: faux: use "kernel vertical" style for imports
      Merge tag 'v6.19-rc5' into driver-core-next
      MAINTAINERS: update auxiliary bus entry
      MAINTAINERS: driver-core: add driver-model documentation
      revocable: fix missing module license and description
      iommu/arm-smmu-qcom: do not register driver in probe()
      driver-core: move devres_for_each_res() to base.h
      MAINTAINERS: Add driver-core mailing list
      MAINTAINERS: Add missing T: entry for FIRMWARE LOADER
      Merge tag 'v6.19-rc7' into driver-core-next
      Merge tag 'driver-core-6.19-rc7-deferred' into driver-core-next
      driver core: fix inverted "locked" suffix of driver_match_device()
      rust: devres: fix race condition due to nesting

Dirk Behme (2):
      samples: rust: pci: Remove some additional `.as_ref()` for `dev_*` pr=
int
      rust: dma: add missing __rust_helper annotations

FUJITA Tomonori (1):
      rust: debugfs: Use kernel Atomic type in docs example

Gary Guo (5):
      rust: device: support `dev_printk` on all devices
      rust: pci: remove redundant `.as_ref()` for `dev_*` print
      rust: samples: driver-core: remove redundant `.as_ref()` for `dev_*` =
print
      rust: samples: dma: remove redundant `.as_ref()` for `dev_*` print
      gpu: tyr: remove redundant `.as_ref()` for `dev_*` print

Greg Kroah-Hartman (4):
      driver core: faux: stop using static struct device
      driver core: disable revocable code from build
      sysfs: remove exports of sysfs_*change_owner()
      driver core: remove device_change_owner() export

Gui-Dong Han (1):
      driver core: enforce device_lock for driver_match_device()

Johan Hovold (3):
      Revert "selftests: revocable: Add kselftest cases"
      Revert "revocable: Add Kunit test cases"
      Revert "revocable: Revocable resource management"

Ke Sun (1):
      rust: debugfs: use pin_init::zeroed() for file_operations

Marko Turk (2):
      rust: pci: document Bar's endianness conversion
      rust: io: remove square brackets from pci::Bar reference

Matthew Maurer (2):
      rust: Add soc_device support
      rust: Add SoC Driver Sample

Shankari Anand (3):
      rust: device: Update ARef and AlwaysRefCounted imports from sync::are=
f
      rust: scatterlist: Update ARef imports to use sync::aref
      samples: rust: debugfs: Update ARef imports to use sync::aref

Tamir Duberstein (9):
      rust: auxiliary: replace `kernel::c_str!` with C-Strings
      rust: device: replace `kernel::c_str!` with C-Strings
      rust: platform: replace `kernel::c_str!` with C-Strings
      rust: io: replace `kernel::c_str!` with C-Strings
      rust: irq: replace `kernel::c_str!` with C-Strings
      rust: debugfs: replace `kernel::c_str!` with C-Strings
      samples: rust: debugfs: replace `kernel::c_str!` with C-Strings
      samples: rust: pci: replace `kernel::c_str!` with C-Strings
      samples: rust: faux: replace `kernel::c_str!` with C-Strings

Thorsten Blum (1):
      devtmpfs: Replace simple_strtoul with kstrtoint in mount_param

Tzung-Bi Shih (8):
      revocable: Revocable resource management
      revocable: Add Kunit test cases
      selftests: revocable: Add kselftest cases
      revocable: Remove redundant synchronize_srcu() call
      revocable: Fix races in revocable_alloc() using RCU
      revocable: Add KUnit test for provider lifetime races
      revocable: fix SRCU index corruption by requiring caller-provided sto=
rage
      revocable: Add KUnit test for concurrent access

Zhi Wang (5):
      rust: devres: style for imports
      rust: io: separate generic I/O helpers from MMIO implementation
      rust: io: factor out MMIO read/write macros
      rust: pci: add config space read/write support
      sample: rust: pci: add tests for config space routines

Zijing Zhang (1):
      rust: pci: re-export ConfigSpace

 MAINTAINERS                                |  15 +++-
 drivers/base/attribute_container.c         |   4 +-
 drivers/base/base.h                        |  15 +++-
 drivers/base/core.c                        |   1 -
 drivers/base/dd.c                          |   2 +-
 drivers/base/devtmpfs.c                    |   5 +-
 drivers/base/faux.c                        |  18 +++--
 drivers/base/transport_class.c             |   8 +-
 drivers/gpu/drm/tyr/driver.rs              |   2 +-
 drivers/gpu/drm/tyr/gpu.rs                 |   6 +-
 drivers/gpu/drm/tyr/regs.rs                |   1 +
 drivers/gpu/nova-core/gsp/sequencer.rs     |   5 +-
 drivers/gpu/nova-core/regs/macros.rs       |  90 ++++++++++++---------
 drivers/gpu/nova-core/vbios.rs             |   1 +
 drivers/iommu/arm/arm-smmu/arm-smmu-impl.c |  14 ++++
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c |  14 +++-
 drivers/iommu/arm/arm-smmu/arm-smmu.c      |  24 +++++-
 drivers/iommu/arm/arm-smmu/arm-smmu.h      |   5 ++
 drivers/pwm/pwm_th1520.rs                  |   5 +-
 drivers/scsi/scsi_transport_spi.c          |   2 +-
 fs/sysfs/file.c                            |   2 -
 include/linux/attribute_container.h        |   2 +-
 include/linux/device/bus.h                 |   4 +-
 include/linux/device/devres.h              |   4 -
 include/linux/transport_class.h            |   6 +-
 rust/bindings/bindings_helper.h            |   1 +
 rust/helpers/auxiliary.c                   |   6 +-
 rust/helpers/device.c                      |  16 ++--
 rust/helpers/dma.c                         |  31 ++++---
 rust/helpers/io.c                          |  64 ++++++++-------
 rust/helpers/irq.c                         |   6 +-
 rust/helpers/pci.c                         |  23 +++---
 rust/helpers/platform.c                    |   2 +-
 rust/helpers/property.c                    |   2 +-
 rust/helpers/scatterlist.c                 |  12 +--
 rust/kernel/auxiliary.rs                   |  30 ++++---
 rust/kernel/debugfs.rs                     |  86 +++++++++++++-------
 rust/kernel/debugfs/callback_adapters.rs   |  21 +++--
 rust/kernel/debugfs/entry.rs               |  14 +++-
 rust/kernel/debugfs/file_ops.rs            |  43 +++++-----
 rust/kernel/debugfs/traits.rs              |  43 +++++++---
 rust/kernel/device.rs                      |  32 +++++---
 rust/kernel/device/property.rs             |  11 +--
 rust/kernel/devres.rs                      | 197 ++++++++++++++++++-------=
--------------------
 rust/kernel/dma.rs                         |  17 ++++
 rust/kernel/driver.rs                      |  12 ++-
 rust/kernel/faux.rs                        |  13 ++-
 rust/kernel/io.rs                          | 479 +++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++----------=
---------
 rust/kernel/io/mem.rs                      |  33 +++++---
 rust/kernel/io/poll.rs                     |  16 +++-
 rust/kernel/irq/request.rs                 |   6 +-
 rust/kernel/lib.rs                         |   2 +
 rust/kernel/pci.rs                         |  11 ++-
 rust/kernel/pci/id.rs                      |   2 +-
 rust/kernel/pci/io.rs                      | 210 +++++++++++++++++++++++++=
+++++++++++++++++++++--
 rust/kernel/platform.rs                    |  46 ++++++++---
 rust/kernel/scatterlist.rs                 |   3 +-
 rust/kernel/soc.rs                         | 135 +++++++++++++++++++++++++=
++++++
 samples/rust/Kconfig                       |  11 +++
 samples/rust/Makefile                      |   1 +
 samples/rust/rust_debugfs.rs               |  46 +++++++----
 samples/rust/rust_debugfs_scoped.rs        |  38 +++++----
 samples/rust/rust_dma.rs                   |  13 +--
 samples/rust/rust_driver_auxiliary.rs      |  14 ++--
 samples/rust/rust_driver_faux.rs           |  10 ++-
 samples/rust/rust_driver_pci.rs            |  43 ++++++++--
 samples/rust/rust_driver_platform.rs       |  42 +++++-----
 samples/rust/rust_soc.rs                   |  79 ++++++++++++++++++
 68 files changed, 1604 insertions(+), 573 deletions(-)
 create mode 100644 rust/kernel/soc.rs
 create mode 100644 samples/rust/rust_soc.rs
