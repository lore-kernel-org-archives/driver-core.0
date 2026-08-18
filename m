Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 308A42E4257;
	Tue, 18 Aug 2026 19:19:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787080752; cv=none; b=f0M09L0u+9QwekTOqa+NAk4y0QCHWnIT3vhGEh2lj2alUsizPQhUqptUEHLXrf5/UCPmX4yPMx5Ln0tr/VwevDYaX9nRhgAk8smxKZudt47LtisoKFqaAr6AcHHEnf3ddU0XUviZfO4p/exthMAsg9cX+JNDznq/ie/47+yHzXo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787080752; c=relaxed/simple;
	bh=HPN96GyqsOcee6Kt9nQnOydnWVqAq7mBnwyleOtNO5w=;
	h=Content-Type:Date:Message-Id:From:Subject:Cc:To:Mime-Version; b=R0m/QoUNu0ep/VSwPfSz1Mfs5J4D2V9j1pbbn3ZuiCmISb06CbbufQN2OkRL+5hugJyNGBKyj3ivvwZdEQfhD+5HF50OGllSinGcp1BpR1gEdAvWv06SdwsTSsIiniLONeUq8fhVxoTYAJsUNq4Mh4zoUqs/25/OPTjs9GpKFeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H93h7cur; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H93h7cur"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 491781F00A3A;
	Tue, 18 Aug 2026 19:19:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787080750;
	bh=qQD89lDbWgxqT0R2sOo9tB+v6st1nIdTVHAfXrdlkj8=;
	h=Date:From:Subject:Cc:To;
	b=H93h7curVB9KqDlW0IlFsUqGfukDwa7qc927FoGw76onzXXMgEiY8D+kHBjhTumWf
	 cqNk+CRvM9pwYm/1NGM0LVmrStuZK7oUyFPclv9CKx7zsFYSuCOItuGtrRy3+LFW+F
	 8SQJ+G81wyK4qpFJAn6gnVH7oZ9udHifhLSIdEQgWSzyYdE5pn334WWK0cWufGlaCB
	 m8yq1zCuZOR76aqq2AwildGBP3q5eXQ2oghKl3+XxI8wIbRJ/501CNNdnCuVX1uQE4
	 2cW3jz6smafq3jZ3/wVYnos+kFp5SqYqZ14FFE+Ujc6sj/KwAWvz3Oi7JwY+gHrNET
	 KeuA7lCqWFNzQ==
Content-Type: text/plain; charset=UTF-8
Date: Tue, 18 Aug 2026 21:19:06 +0200
Message-Id: <DKSB95C4BVQB.3V84CCMB2WN8G@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core changes for 7.3-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Linus,

Please pull these driver-core changes.

All commits have been in linux-next; two signed tags for "software node
fw_devlink support" and "Rust I/O type generalization and projection" have =
been
shared with other trees.

Expect a few minor conflicts with other trees (DRM, PM, PWM), and a minor
semantic one with the Rust tree [1].

Thanks,
Danilo

[1] https://lore.kernel.org/linux-next/20260807074729.108159-1-ojeda@kernel=
.org/

The following changes since commit db2ddb87143519e20a95aa36c60b36107b736a58=
:

  Linux 7.2-rc7 (2026-08-09 14:54:50 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.3-rc1

for you to fetch changes up to 3b5ea0f078e1b72276e99c237f3dfc2fd72938bb:

  rust: pci: expose the allocated interrupt type (2026-08-17 01:43:31 +0200=
)

----------------------------------------------------------------
Driver core changes for 7.3-rc1

- container_of:

  - Apply typeof_member(), remove the local __mptr variable to eliminate
    variable shadowing warnings on nested container_of() calls, and remove
    unnecessary parentheses.

- core:

  - Add driver name to probe debug print for initcall_debug.

  - Avoid repeatedly printing the same 'Fixed dependency cycle' log.

  - Unwind device_add() on attribute creation failure in
    attribute_container_add_class_device().

  - Remove statistics group if encryption group creation fails in
    transport_add_class_device().

- debugfs:

  - Fix lockdown check for mmap_prepare().

  - Warn if file creation failed due to uninitialized debugfs.

- device property:

  - Implement fw_devlink support for software nodes by adding
    software_node_add_links(), which creates fwnode links from DEV_PROP_REF
    properties to enable automatic probe ordering. Add kunit-managed fwnode
    helpers and test coverage.

  - Fix infinite loop in fwnode_for_each_child_node() when the secondary fw=
node
    has more than one child. Add test cases.

  - Fix out-of-bounds access in software_node_get_reference_args() when cal=
led
    with index -1 (UINT_MAX).

  - Refactor to use RAII approach with __free().

  - Add Bartosz Golaszewski as software node reviewer.

- firmware loader:

  - Fix race where a sysfs fallback request can complete before being queue=
d as
    pending, leading to a use-after-free on the next fallback request.

  - Reject 0-size built-in firmware and fail the build on empty firmware fi=
les
    in CONFIG_EXTRA_FIRMWARE.

- kobject:

  - Provide __KOBJ_ATTR() and __KOBJ_ATTR_RO/WO() initialization macros and
    allow the constification of kobject attributes, enabling them to reside=
 in
    read-only memory.

- platform:

  - Provide platform_device_set_of_node(), platform_device_set_fwnode(), an=
d
    platform_device_set_of_node_from_dev() helpers that encapsulate firmwar=
e
    node reference counting for dynamically allocated platform devices. Con=
vert
    all in-tree users that manually assigned dev.of_node or dev.fwnode, fix=
ing a
    pre-existing refcount bug in powermac.  Switch to counting references o=
f all
    firmware node types, not only OF nodes.

  - Unify the release path for dynamically allocated platform devices by
    removing platform_device_release_full(). Amend the fwnode setter API
    contract to warn if a primary software node is overwritten. Add KUnit t=
ests
    for correct software node removal on device unregistration.

- Rust:

  - Auxiliary:

    - Add registration_data_with() closure-based API for invariant ForLt ty=
pes.

  - Debugfs:

    - Migrate BinaryWriter and BinaryReaderMut trait requirements from
      kernel::transmute traits to zerocopy traits.

  - Device:

    - Add BoundInternal device context and InternalBoundContext trait for b=
us
      abstractions that need internal access to a bound device.

    - Make the lifetime on Core and CoreInternal invariant to prevent coerc=
ion
      to shorter lifetimes.

  - Devres:

    - Fix race between concurrent revokers where the losing revoker could r=
eturn
      before the winning revoker finished dropping the inner data, causing
      use-after-free.

    - Ensure revocation is complete before the device finishes unbinding by
      making the synchronization bidirectional.

    - Add DevresLt<F: ForLt>, a wrapper around Devres that shortens 'static=
 back
      to the caller's borrow scope. Implement ForLt and CovariantForLt for =
Bar,
      IoMem, and ExclusiveIoMem.

  - Driver:

    - Switch from index-based to pointer-based device ID info lookup, stori=
ng
      static references in driver_data. Centralize device ID handling in
      device_id.rs, removing the open-coded ACPI/OF matching logic and dupl=
icate
      ID table from driver.rs.

  - I/O:

    - Make I/O regions typed (with a dynamically-sized Region type for the
      existing untyped case), create view types representing subregions of =
a
      mapped I/O region, and add io_project!() for safely creating subviews=
.

    - Split Io into a base trait (IoBase) and an extension trait (Io) with =
a
      blanket implementation, preventing implementers from overriding provi=
ded
      methods that unsafe code relies on.

    - Add a SysMem backend for shared system memory with volatile access, a=
nd
      make Coherent implement Io via an I/O view type.  Add IoSysMap as sum=
 type
      of Mmio and SysMem. Add copying methods (memcpy_{from,to}io()) and
      read_val()/write_val() for typed access.

    - Replace dma_read!()/dma_write!() with io_read!()/io_write!() for
      primitives and copying methods for aggregates; drop the old macros.
      Convert nova-core to use I/O projection.

    - Fix internal shortcut rule dispatch in the register!() macro, remove
      unused rule arguments, and use path fragments for alias destinations.

  - IRQ:

    - Make irq::Registration compatible with lifetime-bound drivers by
      removing the 'static bound on Handler/ThreadedHandler and
      replacing Devres<RegistrationInner> with direct
      request_irq()/free_irq() calls.  Handlers can now directly own
      lifetime-bound device resources.

  - PCI:

    - Convert IrqVectorRegistration to a lifetime-annotated owning type,
      giving drivers explicit control over the allocation lifetime.
      IrqVector embeds a resolved IrqRequest, making the conversion
      infallible. Remove the redundant
      request_irq()/request_threaded_irq() wrappers from pci::Device.

    - Add pci_irq_type() C helper and expose it via irq_type() on
      IrqVectorRegistration and IrqVector, returning PCI_IRQ_MSIX, PCI_IRQ_=
MSI,
      or PCI_IRQ_INTX.

    - Mark pci::Device refcount methods inline.

  - Serdev:

    - Add Rust abstractions for the serial device bus, including serdev::Dr=
iver
      trait, serdev::Device wrapping struct serdev_device, and serdev::Adap=
ter
      implementing RegistrationOps.  Includes a sample driver. Markus Probs=
t
      takes over as serdev maintainer for both C and Rust code.

  - Misc:

    - Split ForLt into a base trait (providing the Of<'a> GAT) and an unsaf=
e
      CovariantForLt subtrait guaranteeing covariance, enabling invariant t=
ypes
      (e.g. those containing Mutex<&'bound T>) to participate in the ForLt
      abstraction.

    - Fix Coherent read past EOF returning -ERANGE instead of zero.

    - Fix firmware example UB by avoiding null-pointer ARef.

- misc:

  - Avoid iattr allocation in kernfs listxattr by using kernfs_iattrs_noall=
oc().
  - Unregister SoC bus on early device registration failure.
  - Remove unused DMA_FENCE_TRACE Kconfig symbol.
  - Fix /sys/module path in comment.
  - Refactor ISA bus init to remove nested blocks.
  - Remove redundant nodemask clears in numa_init().
  - Add kernel-doc for fwnode_operations and sys_soc.h, mark internal prope=
rty
    data as private for kernel-doc, and add property.h/fwnode.h to driver-a=
pi
    infrastructure docs.
  - Add MAINTAINERS entry for sys_soc.h.

----------------------------------------------------------------
Alban Bedel (1):
      software node: Fix software_node_get_reference_args() with index -1

Alexandre Courbot (3):
      rust: io: register: dispatch shortcut rules internally
      rust: io: register: remove unused rule arguments
      rust: io: register: use path fragment for alias destination

Andy Shevchenko (1):
      device property: Refactor to use RAII approach

Bartosz Golaszewski (32):
      powerpc/powermac: fix OF node refcount
      driver core: platform: provide platform_device_set_of_node()
      driver core: platform: provide platform_device_set_fwnode()
      driver core: platform: provide platform_device_set_of_node_from_dev()
      driver core: update kerneldoc for platform_device_alloc()
      of: platform: use platform_device_set_of_node()
      powerpc/powermac: use platform_device_set_of_node()
      i2c: pxa-pci: use platform_device_set_of_node()
      iommu/fsl: use platform_device_set_of_node()
      net: bcmgenet: use platform_device_set_of_node()
      pmdomain: imx: use platform_device_set_of_node()
      mfd: tps6586: use platform_device_set_of_node()
      slimbus: qcom-ngd-ctrl: use platform_device_set_of_node()
      net: mv643xx: use platform_device_set_of_node()
      drm/xe/i2c: use platform_device_set_fwnode()
      platform/surface: gpe: use platform_device_set_fwnode()
      usb: chipidea: use platform_device_set_of_node_from_dev()
      usb: musb: use platform_device_set_of_node_from_dev()
      reset: rzg2l: use platform_device_set_of_node_from_dev()
      driver core: platform: count references to all kinds of firmware node=
s
      kunit: provide a set of fwnode-oriented helpers
      software node: add fw_devlink support
      software node: add kunit tests for fw_devlink support
      MAINTAINERS: add myself as reviewer of software node support
      driver core: platform: amend the API contract for fwnode setters
      platform/surface: gpe: use platform_device_register_full()
      drm/xe/i2c: use device_create_managed_software_node()
      driver core: platform: unify release path
      driver core: platform: tests: add test cases for correct swnode remov=
al
      platform/surface: gpe: add missing err.h include
      ACPI/APMT: use platform_device_set_fwnode()
      ACPI/IORT: use platform_device_set_fwnode()

Chun-Yi Lee (1):
      debugfs: Fix lockdown check for mmap_prepare

Danilo Krummrich (24):
      rust: types: rename ForLt to CovariantForLt
      rust: types: introduce ForLt base trait for CovariantForLt
      rust: auxiliary: add registration_data_with() for ForLt types
      rust: auxiliary: sample: demonstrate ForLt with invariant Mutex type
      rust: devres: add DevresLt for ForLt-aware device resource access
      rust: pci: return DevresLt from Bar::into_devres()
      rust: io: mem: return DevresLt from IoMem/ExclusiveIoMem::into_devres=
()
      Merge patch series "ForLt/CovariantForLt split, auxiliary closure API=
 and DevresLt"
      Merge patch series "rust: I/O type generalization and projection"
      rust: devres: fix race between concurrent revokers
      rust: devres: ensure revocation is complete before device finishes un=
binding
      Merge patch series "software node: provide support for fw_devlink"
      rust: device: add BoundInternal device context and InternalBoundConte=
xt trait
      rust: device: move drvdata_borrow() to InternalBoundContext
      fwnode: add missing kernel-doc for struct fwnode_operations members
      MAINTAINERS: add sys_soc.h to DRIVER CORE
      rust: irq: make Registration compatible with lifetime-bound drivers
      Merge tag 'v7.2-rc7' into driver-core-next
      rust: serdev: use ThisModule::as_ptr() instead of field access
      rust: pci: convert IrqVectorRegistration to a lifetime-managed owning=
 type
      rust: pci: resolve IRQ in index() and embed IrqRequest in IrqVector
      rust: pci: remove request_irq() and request_threaded_irq() from Devic=
e
      PCI: Add pci_irq_type() to query the allocated interrupt type
      rust: pci: expose the allocated interrupt type

David Laight (1):
      kernfs: Replace strcpy(s, "../") with memcpy(s, "../", 4)

Dmitry Antipov (1):
      kernfs: simplify kernfs_name_hash()

Dmitry Torokhov (2):
      firmware_loader: builtin: ignore 0-size firmware
      firmware_loader: builtin: fail build on empty firmware

Ethan Plant (1):
      rust: pci: Mark Device refcount methods inline

Ewan D. Milne (1):
      drivers: base: Remove statistics group if encryption group not create=
d

Francesco Valla (1):
      driver core: add driver name to probe debug print

Gary Guo (33):
      rust: io: add dynamically-sized `Region` type
      rust: io: add missing safety requirement in `IoCapable` methods
      rust: io: restrict untyped IO access and `register!` to `Region`
      rust: io: implement `Io` on reference types instead
      rust: io: generalize `MmioRaw` to pointer to arbitrary type
      rust: io: rename `Mmio` to `MmioOwned`
      rust: io: implement `Mmio` as view type
      rust: pci: io: make `ConfigSpace` a view
      rust: io: use view types instead of addresses for `Io`
      pwm: th1520: remove unnecessary `deref`
      rust: io: remove `MmioOwned`
      rust: io: move `Io` methods to extension trait
      rust: io: add projection macro and methods
      rust: io: implement a view type for `Coherent`
      rust: io: add `read_val` and `write_val` functions on `Io`
      gpu: nova-core: use I/O projection for cleaner encapsulation
      rust: dma: drop `dma_read!` and `dma_write!` API
      rust: io: add copying methods
      rust: io: implement `IoSysMap`
      rust: device: make lifetime on `Core` and `CoreInternal` invariant
      rust: io: document const-offset requirement for infallible accessors
      samples: rust: debugfs: fix excessive stack use
      rust: devres: use `cast_pin_init` instead of manual reimplementation
      rust: driver: remove `IdTable::id`
      rust: driver: simplify `IdArray::new_without_index`
      rust: pci: use `Option<&IdInfo>` for device ID info
      rust: usb: use `Option<&IdInfo>` for device ID info
      rust: driver: centralize device ID handling
      rust: driver: remove `$module_table_name` from `module_device_table`
      rust: driver: store pointers in `DeviceId`
      rust: driver: remove open-coded matching logic
      rust: driver: remove duplicate ID table
      rust: net/phy: remove expansion from doc

Geert Uytterhoeven (1):
      base: Remove unused DMA_FENCE_TRACE Kconfig symbol

Guru Das Srinagesh (1):
      samples: rust_dma: use vertical import style

Josef Ippisch (2):
      rust: debugfs: migrate debugfs traits requirements to zerocopy
      rust: debugfs: remove unsafe blocks from traits impl for Vec

Laura Nao (1):
      rust: io: add I/O backend for system memory with volatile access

Link Mauve (1):
      rust: io: fix example in `register!` macro

Manuel Ebner (1):
      docs: ABI: sysfs-uevent: add missing bracket

Markus Probst (3):
      rust: add basic serial device bus abstractions
      samples: rust: add Rust serial device bus sample device driver
      MAINTAINERS: serdev: Add self for serdev

Miguel Ojeda (1):
      rust: firmware: avoid UB in example by passing parameter

Mukesh Ojha (1):
      firmware_loader: do not queue completed sysfs fallback requests

Randy Dunlap (3):
      device property: mark internal data as private for kernel-doc
      base: soc: fixup sys_soc.h kernel-doc warnings
      docs/driver-api: infrastructure: add property.h and fwnode.h

Sang-Heon Jeon (1):
      arch_numa: remove redundant nodemask clears in numa_init()

Syed Nayyar Waris (1):
      isa: refactor code to remove nested blocks

Thomas Wei=C3=9Fschuh (4):
      kobject: Provide macros to initialize 'struct kobj_attribute'
      samples/kobject: Switch to the new __KOBJ_ATTR() macro
      kobject: Allow the constification of kobject attributes
      samples/kobject: Constify kobject attributes

Vincent Mailhol (3):
      container_of: apply typeof_member() to container_of()
      container_of: remove useless pair of parentheses
      container_of: remove local __mptr variable

Xu Yang (4):
      driver core: avoid repeatedly printing the same 'Fixed dependency' lo=
g
      device property: fix infinite loop in fwnode_for_each_child_node()
      of: kobj: export of_node_ktype for use by modules
      device property: add test cases for fwnode_for_each_child_node()

Yichong Chen (1):
      kernfs: avoid iattr allocation in listxattr

Yohei Kojima (1):
      debugfs: warn if file creation failed due to uninitialized debugfs

Younes Akhouayri (2):
      rust: irq: fix C header path in module docs
      rust: dma: return zero for Coherent reads past EOF

Yuho Choi (2):
      driver core: attribute_container: Unwind device_add() on attr failure
      driver core: soc: Unregister bus on early device registration failure

Zenghui Yu (1):
      driver core: fix path of /sys/module in comment

 Documentation/ABI/testing/sysfs-uevent        |    2 +-
 Documentation/driver-api/infrastructure.rst   |    4 +
 MAINTAINERS                                   |    9 +-
 arch/powerpc/platforms/powermac/low_i2c.c     |    2 +-
 drivers/acpi/arm64/apmt.c                     |    2 +-
 drivers/acpi/arm64/iort.c                     |    2 +-
 drivers/acpi/bus.c                            |    6 +-
 drivers/base/Kconfig                          |    9 -
 drivers/base/arch_numa.c                      |    4 -
 drivers/base/attribute_container.c            |    7 +-
 drivers/base/core.c                           |    8 +-
 drivers/base/dd.c                             |    4 +-
 drivers/base/firmware_loader/builtin/Makefile |   32 ++-
 drivers/base/firmware_loader/builtin/main.c   |    2 +
 drivers/base/firmware_loader/fallback.c       |   10 +
 drivers/base/isa.c                            |   16 +-
 drivers/base/module.c                         |    2 +-
 drivers/base/platform.c                       |   90 ++++++-
 drivers/base/property.c                       |   41 +--
 drivers/base/soc.c                            |   15 +-
 drivers/base/swnode.c                         |   81 +++++-
 drivers/base/test/Kconfig                     |    6 +
 drivers/base/test/Makefile                    |    2 +
 drivers/base/test/platform-device-test.c      |  180 +++++++++++++
 drivers/base/test/property-entry-test.c       |  137 ++++++++++
 drivers/base/test/swnode-devlink-test.c       |  337 +++++++++++++++++++++=
++
 drivers/base/transport_class.c                |    5 +-
 drivers/cpufreq/rcpufreq_dt.rs                |    1 -
 drivers/gpu/drm/nova/driver.rs                |    1 -
 drivers/gpu/drm/tyr/driver.rs                 |    1 -
 drivers/gpu/drm/xe/xe_i2c.c                   |   22 +-
 drivers/gpu/drm/xe/xe_i2c.h                   |    1 -
 drivers/gpu/nova-core/driver.rs               |    7 +-
 drivers/gpu/nova-core/gpu.rs                  |    6 +-
 drivers/gpu/nova-core/gsp.rs                  |   53 ++--
 drivers/gpu/nova-core/gsp/cmdq.rs             |   66 +++--
 drivers/gpu/nova-core/gsp/fw.rs               |   82 ++----
 drivers/i2c/busses/i2c-pxa-pci.c              |    3 +-
 drivers/iommu/fsl_pamu.c                      |   16 +-
 drivers/mfd/tps6586x.c                        |    2 +-
 drivers/net/ethernet/broadcom/genet/bcmmii.c  |    3 +-
 drivers/net/ethernet/marvell/mv643xx_eth.c    |    2 +-
 drivers/of/kobj.c                             |    3 +
 drivers/of/platform.c                         |    2 +-
 drivers/platform/surface/surface_gpe.c        |   40 +--
 drivers/pmdomain/imx/gpc.c                    |    3 +-
 drivers/pwm/pwm_th1520.rs                     |   13 +-
 drivers/reset/reset-rzg2l-usbphy-ctrl.c       |    2 +-
 drivers/slimbus/qcom-ngd-ctrl.c               |    2 +-
 drivers/tty/serdev/Kconfig                    |    7 +
 drivers/usb/chipidea/core.c                   |    2 +-
 drivers/usb/musb/jz4740.c                     |    2 +-
 fs/debugfs/file.c                             |    3 +-
 fs/debugfs/inode.c                            |    5 +-
 fs/kernfs/dir.c                               |    4 +-
 fs/kernfs/inode.c                             |    4 +-
 fs/kernfs/symlink.c                           |    2 +-
 include/acpi/acpi_bus.h                       |   11 -
 include/kunit/fwnode.h                        |   29 ++
 include/linux/container_of.h                  |    5 +-
 include/linux/fwnode.h                        |    4 +
 include/linux/kobject.h                       |   75 +++++-
 include/linux/pci.h                           |   30 +++
 include/linux/platform_device.h               |    8 +
 include/linux/property.h                      |    2 +
 include/linux/sys_soc.h                       |    9 +-
 lib/kobject.c                                 |    8 +-
 lib/kunit/Makefile                            |    1 +
 lib/kunit/fwnode.c                            |  146 ++++++++++
 rust/bindings/bindings_helper.h               |    1 +
 rust/helpers/acpi.c                           |   16 --
 rust/helpers/helpers.c                        |    2 +-
 rust/helpers/io.c                             |   13 +
 rust/helpers/pci.c                            |    5 +
 rust/helpers/serdev.c                         |   22 ++
 rust/kernel/acpi.rs                           |   14 +-
 rust/kernel/auxiliary.rs                      |   96 ++++---
 rust/kernel/debugfs/traits.rs                 |   41 +--
 rust/kernel/device.rs                         |   71 +++--
 rust/kernel/device_id.rs                      |  196 +++++++-------
 rust/kernel/devres.rs                         |  151 ++++++++++-
 rust/kernel/dma.rs                            |  287 +++++++++++---------
 rust/kernel/driver.rs                         |  137 +---------
 rust/kernel/firmware.rs                       |    8 +-
 rust/kernel/i2c.rs                            |   26 +-
 rust/kernel/io.rs                             | 1519 +++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--------------=
--------
 rust/kernel/io/mem.rs                         |   94 ++++---
 rust/kernel/io/poll.rs                        |    6 +-
 rust/kernel/io/register.rs                    |   86 +++---
 rust/kernel/irq.rs                            |    2 +-
 rust/kernel/irq/request.rs                    |  432 ++++++++++++++-------=
---------
 rust/kernel/lib.rs                            |    5 +
 rust/kernel/net/phy.rs                        |   66 +----
 rust/kernel/of.rs                             |   14 +-
 rust/kernel/pci.rs                            |   32 +--
 rust/kernel/pci/io.rs                         |  203 ++++++++------
 rust/kernel/pci/irq.rs                        |  210 +++++++--------
 rust/kernel/platform.rs                       |   53 ++--
 rust/kernel/ptr.rs                            |   12 +
 rust/kernel/serdev.rs                         |  604 +++++++++++++++++++++=
++++++++++++++++++++
 rust/kernel/types.rs                          |    5 +-
 rust/kernel/types/for_lt.rs                   |  103 +++++--
 rust/kernel/usb.rs                            |   24 +-
 rust/macros/for_lt.rs                         |   41 ++-
 rust/macros/lib.rs                            |   18 +-
 samples/kobject/kobject-example.c             |   24 +-
 samples/rust/Kconfig                          |   11 +
 samples/rust/Makefile                         |    1 +
 samples/rust/rust_debugfs.rs                  |    5 +-
 samples/rust/rust_debugfs_scoped.rs           |    5 +-
 samples/rust/rust_dma.rs                      |   25 +-
 samples/rust/rust_driver_auxiliary.rs         |  100 ++++---
 samples/rust/rust_driver_i2c.rs               |    3 -
 samples/rust/rust_driver_pci.rs               |    4 +-
 samples/rust/rust_driver_platform.rs          |    2 -
 samples/rust/rust_driver_serdev.rs            |   88 ++++++
 samples/rust/rust_driver_usb.rs               |    3 +-
 samples/rust/rust_i2c_client.rs               |    2 -
 samples/rust/rust_soc.rs                      |    2 -
 119 files changed, 4751 insertions(+), 1842 deletions(-)
 create mode 100644 drivers/base/test/swnode-devlink-test.c
 create mode 100644 include/kunit/fwnode.h
 create mode 100644 lib/kunit/fwnode.c
 delete mode 100644 rust/helpers/acpi.c
 create mode 100644 rust/helpers/serdev.c
 create mode 100644 rust/kernel/serdev.rs
 create mode 100644 samples/rust/rust_driver_serdev.rs
