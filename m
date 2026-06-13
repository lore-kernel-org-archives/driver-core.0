Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8DE126F29C;
	Sat, 13 Jun 2026 17:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781373167; cv=none; b=n033LNssoJNpLhu4QGHKkcE2YRbNCkrXXyxuBHz4bTIQ9It+qT5+a9F3LkFV3/zvZtW+ZFYjrUUb5aU8qN9h33Nu25hfDV4XaOMrOimeTZRoqFZCYA5Wws2camPQxzUFv9BnWn4P1B7yodan/7gJyzs1alHCF54ZdmV7gCiURtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781373167; c=relaxed/simple;
	bh=lg/WFp6usRMEz2QZkUJ+fTElI9HQuGEB9XQYEn3r6Uw=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:Mime-Version; b=Bdl9jbUXb0c5rkSSgEyHseu3SOQxe1qUgX6lQCy1xhruo5DUhVQFKq3+ZZCw2T4eOMChRkeJu+94b79EM/ek0YTDkmk+9CjaAetxAQ3jaLhQ1vsyDJrJabS3BSGXiUbVsjCvbaKyYGba++MxBsRpiiUOCdzerT2gjVGfwTxRKcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f3OdkwHp; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f3OdkwHp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3E7C1F000E9;
	Sat, 13 Jun 2026 17:52:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781373165;
	bh=fhwhdnXKmrn5d8kDBYYIaX//aWOuAqgzEpDNYouw15k=;
	h=Date:Cc:To:From:Subject;
	b=f3OdkwHpz/zgWigeewFI6u9kdrtsHA+5OTnbYsHQqfFun7uPTyyKuChemLL75UMFi
	 A1soUfwjJ7XttD1HrRP1PyOri+ZZUUhBRQ/d1hfXQE0tMW8pXd91ZBQTfAUo21Jmuu
	 Q0WeHtWatv8A/PqrkHMbek5r51b6KwmoNNaHRhC7qnH/q3gW2D9srEu12eotLDT1E5
	 o6RjjDeEFQEVTYOgaoVhecPksb2X4AHFgUzy/9SvvSCvYXhEpGkyjn+NmcmdlsCMCh
	 QVDMsQmATRL8xAe6QnWWg7Yk1aOhLgztR9YykNOxegHuaObllWMN4TAAUCy441BMuq
	 +IPJqDmqRKozw==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 13 Jun 2026 19:52:42 +0200
Message-Id: <DJ84318BOPGD.25U77KZQOCNFP@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core changes for 7.2-rc1
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Linus,

Please pull these driver-core changes.

All commits have been in linux-next for at least a few rounds; the Rust-nat=
ive
device driver lifetime series has been shared with the DRM tree via a signe=
d
tag.

- Danilo

The following changes since commit e7ae89a0c97ce2b68b0983cd01eda67cf373517d=
:

  Linux 7.1-rc5 (2026-05-24 13:48:06 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.2-rc1

for you to fetch changes up to fe221742e388bea3f5856b5d9b2cb0a037020ea4:

  software node: allow passing reference args to PROPERTY_ENTRY_REF() (2026=
-06-10 00:58:04 +0200)

----------------------------------------------------------------
Driver core changes for 7.2-rc1

- deferred probe:
  - Fix race where deferred probe timeout work could be permanently
    canceled by using mod_delayed_work()
  - Fix missing jiffies conversion in deferred_probe_extend_timeout()
  - Guard timeout extension with delayed_work_pending() to prevent
    premature firing
  - Use system_percpu_wq instead of the deprecated system_wq
  - Update deferred_probe_timeout documentation

- device:
  - Replace direct struct device bitfield access (can_match, dma_iommu,
    dma_skip_sync, dma_ops_bypass, state_synced, dma_coherent,
    of_node_reused, offline, offline_disabled) with flag-based
    accessors using bit operations
  - Reject devices with unregistered buses
  - Delete unused DEVICE_ATTR_PREALLOC()
  - Add low-level device attribute macros with const show/store
    callbacks, allowing device attributes to reside in read-only memory
  - Move core device attributes to read-only memory
  - Constify group array pointers in driver_add_groups() /
    driver_remove_groups(), struct bus_type, and struct device_driver

- device property:
  - Fix fwnode reference leak in fwnode_graph_get_endpoint_by_id()
  - Initialize all fields of fwnode_handle in fwnode_init()
  - Provide swnode_get()/swnode_put() wrappers around kobject_get/put()
  - Allow passing struct software_node_ref_args pointers directly to
    PROPERTY_ENTRY_REF()

- driver_override:
  - Migrate amba, cdx, vmbus, and rpmsg to the generic driver_override
    infrastructure, fixing a UAF from unsynchronized access to
    driver_override in bus match() callbacks
  - Remove the now-unused driver_set_override()

- firmware loader:
  - Fix recursive lock deadlock in device_cache_fw_images() when async
    work falls back to synchronous execution
  - Fix device reference leak in firmware_upload_register()

- platform:
  - Pass KBUILD_MODNAME through the platform driver registration macro
    to create module symlinks in sysfs for built-in drivers; move
    module_kset initialization to a pure_initcall and tegra cbb
    registration to core_initcall to ensure correct ordering
  - Pass THIS_MODULE implicitly through a coresight_init_driver() macro

- sysfs:
  - Upgrade OOB write detection in sysfs_kf_seq_show() from printk to
    WARN
  - Add return value clamping to sysfs_kf_read()

- Rust:
  - ACPI:
    - Fix missing match data for PRP0001 by exporting
      acpi_of_match_device()

  - Auxiliary:
    - Replace drvdata() with dedicated registration data on
      auxiliary_device. drvdata() exposed the driver's bus device
      private data beyond the driver's own scope, creating ordering
      constraints and forcing the data to outlive all registrations
      that access it. Registration data is instead scoped structurally
      to the Registration object, making lifecycle ordering enforced
      by construction rather than convention.

  - Rust-native device driver lifetimes (HRT):
    - Allow Rust device drivers to carry a lifetime parameter on their
      bus device private data, tied to the device binding scope -- the
      interval during which a bus device is bound to a driver. Device
      resources like pci::Bar<'a> and IoMem<'a> can be stored directly
      in the driver's bus device private data with a lifetime bounded
      by the binding scope, so the compiler enforces at build time that
      they do not outlive the binding. This removes Devres indirection
      from every access site and eliminates try_access() failure paths
      in destructors.

      Bus driver traits use a Generic Associated Type (GAT)
      Data<'bound> to introduce the lifetime on the private data,
      rather than parameterizing the Driver trait itself. Auxiliary
      registration data, where the lifetime is not introduced by a
      trait callback but must be threaded through Registration, uses
      the ForLt trait (a type-level abstraction for types generic over
      a lifetime).

- Misc:
  - Fix DT overlayed devices not probing by reverting the broken
    treewide overlay fix and re-running fw_devlink consumer pickup when
    an overlay is applied to a bound device
  - Use root_device_register() for faux bus root device; add sanity
    check for failed bus init
  - Fix dev_has_sync_state() data race with READ_ONCE() and move it to
    base.h
  - Avoid spurious device_links warning when removing a device while
    its supplier is unbinding
  - Switch ISA bus to dynamic root device
  - Fix suspicious RCU usage in kernfs_put()
  - Remove devcoredump exit callback
  - Constify devfreq_event_class

----------------------------------------------------------------
Alexey Dobriyan (2):
      sysfs: upgrade OOB write by buggy .show hook into WARNing
      driver core: delete useless forward declaration of "struct class"

Bartosz Golaszewski (2):
      software node: provide wrappers around kobject_get/put()
      device property: initialize the remaining fields of fwnode_handle in =
fwnode_init()

Conor Kotwasinski (1):
      kernfs: fix suspicious RCU usage in kernfs_put()

Danilo Krummrich (37):
      driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
      driver core: move dev_has_sync_state() to drivers/base/base.h
      rust: alloc: add Box::zeroed()
      rust: auxiliary: add registration data to auxiliary devices
      rust: driver core: remove drvdata() and driver_type
      Merge patch series "rust: auxiliary: replace drvdata() with registrat=
ion data"
      Merge tag 'v7.1-rc5' into driver-core-next
      driver core: Fix missing jiffies conversion in deferred_probe_extend_=
timeout()
      driver core: Guard deferred probe timeout extension with delayed_work=
_pending()
      rust: pci: use 'static lifetime for PCI BAR resource names
      rust: driver: decouple driver private data from driver type
      rust: driver core: drop drvdata before devres release
      rust: pci: implement Sync for Device<Bound>
      rust: platform: implement Sync for Device<Bound>
      rust: auxiliary: implement Sync for Device<Bound>
      rust: usb: implement Sync for Device<Bound>
      rust: device: implement Sync for Device<Bound>
      rust: device: make Core and CoreInternal lifetime-parameterized
      rust: pci: make Driver trait lifetime-parameterized
      rust: platform: make Driver trait lifetime-parameterized
      rust: auxiliary: make Driver trait lifetime-parameterized
      rust: usb: make Driver trait lifetime-parameterized
      rust: i2c: make Driver trait lifetime-parameterized
      rust: driver: update module documentation for GAT-based Data type
      rust: pci: make Bar lifetime-parameterized
      rust: io: make IoMem and ExclusiveIoMem lifetime-parameterized
      samples: rust: rust_driver_pci: use HRT lifetime for Bar
      gpu: nova-core: separate driver type from driver data
      rust: auxiliary: generalize Registration over ForLt
      samples: rust: rust_driver_auxiliary: showcase lifetime-bound registr=
ation data
      Merge patch series "rust: device: Higher-Ranked Lifetime Types for de=
vice drivers"
      rust: devres: add 'static bound to Devres<T>
      amba: use generic driver_override infrastructure
      cdx: use generic driver_override infrastructure
      Drivers: hv: vmbus: use generic driver_override infrastructure
      rpmsg: use generic driver_override infrastructure
      driver core: remove driver_set_override()

Dmitry Torokhov (1):
      software node: allow passing reference args to PROPERTY_ENTRY_REF()

Dmitry Vyukov (1):
      firmware_loader: Fix recursive lock in device_cache_fw_images()

Douglas Anderson (8):
      driver core: Replace dev->can_match with dev_can_match()
      driver core: Replace dev->dma_iommu with dev_dma_iommu()
      driver core: Replace dev->dma_skip_sync with dev_dma_skip_sync()
      driver core: Replace dev->dma_ops_bypass with dev_dma_ops_bypass()
      driver core: Replace dev->state_synced with dev_state_synced()
      driver core: Replace dev->dma_coherent with dev_dma_coherent()
      driver core: Replace dev->of_node_reused with dev_of_node_reused()
      driver core: Replace dev->offline + ->offline_disabled with accessors

Gary Guo (3):
      rust: alloc: remove `'static` bound on `ForeignOwnable`
      rust: driver: move 'static bounds to constructor
      rust: types: add `ForLt` trait for higher-ranked lifetime support

Greg Kroah-Hartman (1):
      sysfs: clamp show() return value in sysfs_kf_read()

Guangshuo Li (1):
      firmware_loader: fix device reference leak in firmware_upload_registe=
r()

Hans de Goede (1):
      Documentation: update deferred_probe_timeout cmdline parameter docume=
ntation

Heiner Kallweit (4):
      devcoredump: Remove exit call
      driver core: constify group arrays arguments in driver_add_groups and=
 driver_remove_groups
      driver core: make struct bus_type groups members constant arrays
      device core: make struct device_driver groups members constant arrays

Herve Codina (1):
      driver core: Avoid warning when removing a device while its supplier =
is unbinding

Johan Hovold (4):
      driver core: faux: fix root device registration
      driver core: faux: clean up init error handling
      driver core: reject devices with unregistered buses
      isa: switch to dynamic root device

Jori Koolstra (1):
      devfreq: change devfreq_event_class to a const struct

Markus Probst (1):
      rust: ACPI: fix missing match data for PRP0001

Nathan Chancellor (1):
      driver core: Use system_percpu_wq instead of system_wq

Prabhudasu Vatala (1):
      driver core: class: fix typo in struct class documentation

Saravana Kannan (2):
      Revert "treewide: Fix probing of devices in DT overlays"
      of: dynamic: Fix overlayed devices not probing because of fw_devlink

Shashank Balaji (4):
      soc/tegra: cbb: Move driver registration from pure_initcall to core_i=
nitcall
      kernel: param: initialize module_kset in a pure_initcall
      coresight: pass THIS_MODULE implicitly through a macro
      driver core: platform: set mod_name in driver registration

Stepan Ionichev (1):
      device property: fix fwnode reference leak in fwnode_graph_get_endpoi=
nt_by_id()

Thomas Wei=C3=9Fschuh (5):
      driver core: Delete DEVICE_ATTR_PREALLOC()
      driver core: Add low-level macros for device attributes
      driver core: Stop using generic sysfs macros for device attributes
      driver core: Allow the constification of device attributes
      driver core: Constify core device attributes

Zhang Yuwei (1):
      driver core: Use mod_delayed_work to prevent lost deferred probe work

 Documentation/admin-guide/kernel-parameters.txt    |   5 +-
 Documentation/driver-api/driver-model/platform.rst |   3 +-
 MAINTAINERS                                        |   1 +
 arch/arc/mm/dma.c                                  |   4 +-
 arch/arm/mach-highbank/highbank.c                  |   2 +-
 arch/arm/mach-mvebu/coherency.c                    |   2 +-
 arch/arm/mm/dma-mapping-nommu.c                    |   4 +-
 arch/arm/mm/dma-mapping.c                          |  28 +++++-----
 arch/arm64/kernel/cpufeature.c                     |   2 +-
 arch/arm64/mm/dma-mapping.c                        |   2 +-
 arch/mips/include/asm/mips_mt.h                    |   1 -
 arch/mips/mm/dma-noncoherent.c                     |   2 +-
 arch/powerpc/kernel/dma-iommu.c                    |   8 +--
 arch/powerpc/platforms/pseries/hotplug-memory.c    |   4 +-
 arch/riscv/mm/dma-noncoherent.c                    |   2 +-
 drivers/acpi/bus.c                                 |   6 +--
 drivers/acpi/scan.c                                |   2 +-
 drivers/amba/bus.c                                 |  37 +++----------
 drivers/base/base.h                                |  36 ++++++-------
 drivers/base/bus.c                                 |  11 +++-
 drivers/base/core.c                                | 184 +++++++++++++++++=
++++++++++++++++++++++++++---------------------
 drivers/base/cpu.c                                 |   4 +-
 drivers/base/dd.c                                  |  27 +++++-----
 drivers/base/devcoredump.c                         |   7 ---
 drivers/base/driver.c                              |  79 +----------------=
-----------
 drivers/base/faux.c                                |  32 ++++++------
 drivers/base/firmware_loader/main.c                |   3 +-
 drivers/base/firmware_loader/sysfs_upload.c        |   8 ++-
 drivers/base/isa.c                                 |  12 ++---
 drivers/base/memory.c                              |   2 +-
 drivers/base/pinctrl.c                             |   2 +-
 drivers/base/platform.c                            |  23 +++++---
 drivers/base/property.c                            |   4 +-
 drivers/base/swnode.c                              |  40 ++++++++------
 drivers/bus/imx-weim.c                             |   6 ---
 drivers/cdx/cdx.c                                  |  40 ++------------
 drivers/cpufreq/rcpufreq_dt.rs                     |   9 ++--
 drivers/devfreq/devfreq-event.c                    |  23 ++++----
 drivers/dma/ti/k3-udma-glue.c                      |   6 +--
 drivers/dma/ti/k3-udma.c                           |   6 +--
 drivers/gpu/drm/nova/driver.rs                     |   6 ++-
 drivers/gpu/drm/tyr/driver.rs                      |  13 ++---
 drivers/gpu/nova-core/driver.rs                    |  38 ++++++++------
 drivers/gpu/nova-core/gpu.rs                       |   2 +-
 drivers/gpu/nova-core/nova_core.rs                 |   2 +-
 drivers/hv/vmbus_drv.c                             |  43 ++++-----------
 drivers/hwtracing/coresight/coresight-catu.c       |   2 +-
 drivers/hwtracing/coresight/coresight-core.c       |   9 ++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c  |   3 +-
 drivers/hwtracing/coresight/coresight-funnel.c     |   3 +-
 drivers/hwtracing/coresight/coresight-replicator.c |   3 +-
 drivers/hwtracing/coresight/coresight-stm.c        |   2 +-
 drivers/hwtracing/coresight/coresight-tmc-core.c   |   2 +-
 drivers/hwtracing/coresight/coresight-tnoc.c       |   2 +-
 drivers/hwtracing/coresight/coresight-tpdm.c       |   3 +-
 drivers/hwtracing/coresight/coresight-tpiu.c       |   2 +-
 drivers/i2c/i2c-core-of.c                          |   5 --
 drivers/iommu/dma-iommu.c                          |   9 ++--
 drivers/iommu/iommu.c                              |   5 +-
 drivers/net/pcs/pcs-xpcs-plat.c                    |   2 +-
 drivers/of/device.c                                |   6 +--
 drivers/of/dynamic.c                               |   1 -
 drivers/of/overlay.c                               |  15 ++++++
 drivers/of/platform.c                              |   5 --
 drivers/pci/of.c                                   |   2 +-
 drivers/pci/pwrctrl/core.c                         |   2 +-
 drivers/pwm/pwm_th1520.rs                          |  13 ++---
 drivers/rpmsg/qcom_glink_native.c                  |   2 -
 drivers/rpmsg/rpmsg_core.c                         |  43 +++------------
 drivers/rpmsg/virtio_rpmsg_bus.c                   |   1 -
 drivers/soc/tegra/cbb/tegra194-cbb.c               |   2 +-
 drivers/soc/tegra/cbb/tegra234-cbb.c               |   2 +-
 drivers/spi/spi.c                                  |   5 --
 drivers/tty/serial/serial_base_bus.c               |   2 +-
 drivers/usb/gadget/udc/aspeed-vhub/dev.c           |   2 +-
 fs/kernfs/dir.c                                    |  11 ++--
 fs/sysfs/file.c                                    |   9 ++--
 include/acpi/acpi_bus.h                            |  11 ++++
 include/linux/amba/bus.h                           |   5 --
 include/linux/auxiliary_bus.h                      |   4 ++
 include/linux/cdx/cdx_bus.h                        |   4 --
 include/linux/coresight.h                          |   7 ++-
 include/linux/device.h                             | 221 +++++++++++++++++=
++++++++++++++++++++++++++++++------------------------------
 include/linux/device/bus.h                         |   6 +--
 include/linux/device/class.h                       |   2 +-
 include/linux/device/driver.h                      |  10 ++--
 include/linux/dma-map-ops.h                        |   6 +--
 include/linux/dma-mapping.h                        |   2 +-
 include/linux/fwnode.h                             |   3 ++
 include/linux/hyperv.h                             |   5 --
 include/linux/iommu-dma.h                          |   3 +-
 include/linux/platform_device.h                    |  17 +++---
 include/linux/property.h                           |   8 ++-
 include/linux/rpmsg.h                              |   4 --
 kernel/cpu.c                                       |   4 +-
 kernel/dma/mapping.c                               |  12 ++---
 kernel/params.c                                    |   8 +--
 mm/hmm.c                                           |   2 +-
 rust/Makefile                                      |   1 +
 rust/helpers/acpi.c                                |  16 ++++++
 rust/helpers/helpers.c                             |   1 +
 rust/kernel/alloc/kbox.rs                          |  46 +++++++++++++---
 rust/kernel/auxiliary.rs                           | 285 +++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++------------------=
--------
 rust/kernel/cpufreq.rs                             |   9 ++--
 rust/kernel/device.rs                              | 121 ++++++++++++++++-=
--------------------------
 rust/kernel/devres.rs                              |   8 +--
 rust/kernel/dma.rs                                 |   2 +-
 rust/kernel/driver.rs                              | 115 +++++++++++++++++=
+++++++++++++----------
 rust/kernel/i2c.rs                                 |  61 ++++++++++++-----=
-----
 rust/kernel/io/mem.rs                              | 121 +++++++++++++++++=
+++++---------------------
 rust/kernel/pci.rs                                 |  51 +++++++++++------=
-
 rust/kernel/pci/id.rs                              |   2 +-
 rust/kernel/pci/io.rs                              |  54 +++++++++++------=
--
 rust/kernel/platform.rs                            |  56 ++++++++++++-----=
---
 rust/kernel/types.rs                               |  12 ++++-
 rust/kernel/types/for_lt.rs                        | 122 +++++++++++++++++=
++++++++++++++++++++++++++
 rust/kernel/usb.rs                                 |  57 ++++++++++++-----=
---
 rust/macros/for_lt.rs                              | 248 +++++++++++++++++=
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 rust/macros/lib.rs                                 |  13 +++++
 samples/rust/rust_debugfs.rs                       |  11 ++--
 samples/rust/rust_dma.rs                           |   6 ++-
 samples/rust/rust_driver_auxiliary.rs              |  79 +++++++++++++++++=
+++--------
 samples/rust/rust_driver_i2c.rs                    |  13 ++---
 samples/rust/rust_driver_pci.rs                    |  90 +++++++++++++++--=
---------------
 samples/rust/rust_driver_platform.rs               |   9 ++--
 samples/rust/rust_driver_usb.rs                    |  15 +++---
 samples/rust/rust_i2c_client.rs                    |  14 +++--
 samples/rust/rust_soc.rs                           |   9 ++--
 128 files changed, 1815 insertions(+), 1134 deletions(-)
 create mode 100644 rust/helpers/acpi.c
 create mode 100644 rust/kernel/types/for_lt.rs
 create mode 100644 rust/macros/for_lt.rs
