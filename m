Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C4F1A38F9;
	Sat, 11 Apr 2026 00:24:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775867067; cv=none; b=gGAZ9gRS9/Jc3yCdXJ3JcwBX4QUpAd80J5jIXYMJmbSAg1D4MbkViPljTM4PAgOWFRPdPvsa+vi1/DFVfmxbCEnU5rrRCfs/uhihw2abqSmiYD1ly8pdHqQMPczp8ZlwcyDpErGSdvjSyU2u38O+9J997y2MkEXUauheXA2eS38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775867067; c=relaxed/simple;
	bh=eqKfDDIsGDa1MYYacTnhKSmR10b3g+jo0ASD8sorcOk=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version; b=PvcoUoiOAM+RKvAIgvFjoovG4ukZIAQsMeY1mrxrVliIhBcLc+sB7GCdku3R1b6qWp62lcUgMrOpAxRcVlRtzgVpPooJRZx2TKGtFleUYu1WfMh9RihH6mXtING2pGWSyPAQ5j6yaqDGTWWoLYu/oAzH40TXFgVq/9SNHGKxkUI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EbhyX10V; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EbhyX10V"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5B10C19421;
	Sat, 11 Apr 2026 00:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775867067;
	bh=eqKfDDIsGDa1MYYacTnhKSmR10b3g+jo0ASD8sorcOk=;
	h=Date:Subject:Cc:To:From:From;
	b=EbhyX10Vbe9RCS3dDw/LieAEO/ZGgS87HjOmwZE2h2l+JwcN86zKaEsI8Ydi0hM2t
	 iHamqQNmX0/2/t04ycm05fHnCrCj01/488eo9LMSc/QpaTzwBBUz1/kgWbLW5kEPxg
	 GqCC3S9q8aUplD9hEL/b56BE0MVz4sgvL9btCHDyQVUBPaQbZqQMBHulnXSSQSFc8y
	 Dkvjvh4lhA2Gs5TWJZ2w0f5q0jEuM1ItMBefcw1SR486oIw8+HPrHBk3hjDdOj9/9Y
	 ZZAu+RmEgXyumHY0W6MJP18P0MTcSQml0zcBlRWDaK01OZqd3S9HlzTO6w76tEhZFN
	 3etWVDK5lqmRQ==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 11 Apr 2026 02:24:24 +0200
Message-Id: <DHPWC2SXSROE.1RM1PTZNOC627@kernel.org>
Subject: [GIT PULL] Driver core changes for 7.1-rc1
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
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Linus,

Please pull these driver-core changes.

All commits have been in linux-next for at least five rounds; expect a mino=
r
conflict with the Rust tree due to the minimum compiler version bump.

A struct platform_device_info change and the addition of a conditional guar=
d for
the device lock have been shared with various trees through a signed tag; t=
he
Rust I/O register!() macro addition has been shared with the DRM tree.

A few late-cycle fixes still need some soak time in linux-next; please expe=
ct a
follow-up PR in the middle of the merge window.

- Danilo

The following changes since commit c369299895a591d96745d6492d4888259b004a9e=
:

  Linux 7.0-rc5 (2026-03-22 14:42:17 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.1-rc1

for you to fetch changes up to 6c8dfb0362732bf1e4829867a2a5239fedc592d0:

  bus: fsl-mc: use generic driver_override infrastructure (2026-04-04 20:41=
:25 +0200)

----------------------------------------------------------------
Driver core changes for 7.1-rc1

- debugfs:
  - Fix NULL pointer dereference in debugfs_create_str()
  - Fix misplaced EXPORT_SYMBOL_GPL for debugfs_create_str()
  - Fix soundwire debugfs NULL pointer dereference from uninitialized
    firmware_file

- device property:
  - Make fwnode flags modifications thread safe; widen the field to
    unsigned long and use set_bit() / clear_bit() based accessors
  - Document how to check for the property presence

- devres:
  - Separate struct devres_node from its "subclasses" (struct devres,
    struct devres_group); give struct devres_node its own release and
    free callbacks for per-type dispatch
  - Introduce struct devres_action for devres actions, avoiding the
    ARCH_DMA_MINALIGN alignment overhead of struct devres
  - Export struct devres_node and its init/add/remove/dbginfo
    primitives for use by Rust Devres<T>
  - Fix missing node debug info in devm_krealloc()
  - Use guard(spinlock_irqsave) where applicable; consolidate unlock
    paths in devres_release_group()

- driver_override:
  - Convert PCI, WMI, vdpa, s390/cio, s390/ap, and fsl-mc to the
    generic driver_override infrastructure, replacing per-bus
    driver_override strings, sysfs attributes, and match logic; fixes
    a potential UAF from unsynchronized access to driver_override in
    bus match() callbacks
  - Simplify __device_set_driver_override() logic

- kernfs:
  - Send IN_DELETE_SELF and IN_IGNORED inotify events on kernfs
    file and directory removal
  - Add corresponding selftests for memcg

- platform:
  - Allow attaching software nodes when creating platform devices via
    a new 'swnode' field in struct platform_device_info
  - Add kerneldoc for struct platform_device_info

- software node:
  - Move software node initialization from postcore_initcall() to
    driver_init(), making it available early in the boot process
  - Move kernel_kobj initialization (ksysfs_init) earlier to support
    the above
  - Remove software_node_exit(); dead code in a built-in unit

- SoC:
  - Introduce of_machine_read_compatible() and of_machine_read_model()
    OF helpers and export soc_attr_read_machine() to replace direct
    accesses to of_root from SoC drivers; also enables
    CONFIG_COMPILE_TEST coverage for these drivers

- sysfs:
  - Constify attribute group array pointers to
    'const struct attribute_group *const *' in sysfs functions,
    device_add_groups() / device_remove_groups(), and struct class

- Rust:
  - Devres:
    - Embed struct devres_node directly in Devres<T> instead of going
      through devm_add_action(), avoiding the extra allocation and
      the unnecessary ARCH_DMA_MINALIGN alignment

  - I/O:
    - Turn IoCapable from a marker trait into a functional trait
      carrying the raw I/O accessor implementation (io_read /
      io_write), providing working defaults for the per-type Io
      methods
    - Add RelaxedMmio wrapper type, making relaxed accessors usable
      in code generic over the Io trait
    - Remove overloaded per-type Io methods and per-backend macros
      from Mmio and PCI ConfigSpace

  - I/O (Register):
    - Add IoLoc trait and generic read/write/update methods to the Io
      trait, making I/O operations parameterizable by typed locations
    - Add register! macro for defining hardware register types with
      typed bitfield accessors backed by Bounded values; supports
      direct, relative, and array register addressing
    - Add write_reg() / try_write_reg() and LocatedRegister trait
    - Update PCI sample driver to demonstrate the register! macro

        Example:

        ```
            register! {
                /// UART control register.
                CTRL(u32) @ 0x18 {
                    /// Receiver enable.
                    19:19   rx_enable =3D> bool;
                    /// Parity configuration.
                    14:13   parity ?=3D> Parity;
                }

                /// FIFO watermark and counter register.
                WATER(u32) @ 0x2c {
                    /// Number of datawords in the receive FIFO.
                    26:24   rx_count;
                    /// RX interrupt threshold.
                    17:16   rx_water;
                }
            }

            impl WATER {
                fn rx_above_watermark(&self) -> bool {
                    self.rx_count() > self.rx_water()
                }
            }

            fn init(bar: &pci::Bar<BAR0_SIZE>) {
                let water =3D WATER::zeroed()
                    .with_const_rx_water::<1>(); // > 3 would not compile
                bar.write_reg(water);

                let ctrl =3D CTRL::zeroed()
                    .with_parity(Parity::Even)
                    .with_rx_enable(true);
                bar.write_reg(ctrl);
            }

            fn handle_rx(bar: &pci::Bar<BAR0_SIZE>) {
                if bar.read(WATER).rx_above_watermark() {
                    // drain the FIFO
                }
            }

            fn set_parity(bar: &pci::Bar<BAR0_SIZE>, parity: Parity) {
                bar.update(CTRL, |r| r.with_parity(parity));
            }
        ```

  - IRQ:
    - Move 'static bounds from where clauses to trait declarations
      for IRQ handler traits

  - Misc:
    - Enable the generic_arg_infer Rust feature
    - Extend Bounded with shift operations, single-bit bool conversion,
      and const get()

- Misc:
  - Make deferred_probe_timeout default a Kconfig option
  - Drop auxiliary_dev_pm_ops; the PM core falls back to driver PM
    callbacks when no bus type PM ops are set
  - Add conditional guard support for device_lock()
  - Add ksysfs.c to the DRIVER CORE MAINTAINERS entry
  - Fix kernel-doc warnings in base.h
  - Fix stale reference to memory_block_add_nid() in documentation

----------------------------------------------------------------
Alexandre Courbot (15):
      rust: io: turn IoCapable into a functional trait
      rust: io: mem: use non-relaxed I/O ops in examples
      rust: io: provide Mmio relaxed ops through a wrapper type
      rust: io: remove legacy relaxed accessors of Mmio
      rust: pci: io: remove overloaded Io methods of ConfigSpace
      rust: io: remove overloaded Io methods of Mmio
      rust: enable the `generic_arg_infer` feature
      rust: num: add `shr` and `shl` methods to `Bounded`
      rust: num: add `into_bool` method to `Bounded`
      rust: num: make Bounded::get const
      rust: io: add IoLoc type and generic I/O accessors
      rust: io: use generic read/write accessors for primitive accesses
      rust: io: add `register!` macro
      rust: io: introduce `write_reg` and `LocatedRegister`
      sample: rust: pci: use `register!` macro

Alice Ryhl (1):
      rust: irq: move 'static bounds to traits

Andy Shevchenko (1):
      device property: Document how to check for the property presence

Bartosz Golaszewski (12):
      of: provide of_machine_read_compatible()
      of: provide of_machine_read_model()
      base: soc: order includes alphabetically
      base: soc: rename and export soc_device_get_machine()
      soc: fsl: guts: don't access of_root directly
      soc: imx8m: don't access of_root directly
      soc: imx9: don't access of_root directly
      soc: sunxi: mbus: don't access of_root directly
      MAINTAINERS: add ksysfs.c to the DRIVER CORE entry
      kernel: ksysfs: initialize kernel_kobj earlier
      software node: remove software_node_exit()
      driver core: make software nodes available earlier

Dan Williams (1):
      device core: Fix kernel-doc warnings in base.h

Danilo Krummrich (22):
      Merge tag 'v7.0-rc3' into driver-core-next
      Merge tag 'device_lock_cond_guard-7.1-rc1' into driver-core-testing
      Merge tag 'rust_io-7.1-rc1' into driver-core-next
      devres: fix missing node debug info in devm_krealloc()
      devres: add devres_node_add()
      devres: add devres_node_init()
      devres: don't require ARCH_DMA_MINALIGN for devres actions
      devres: add free_node callback to struct devres_node
      devres: use guard(spinlock_irqsave) where applicable
      devres: remove unnecessary unlocks in devres_release_group()
      devres: move struct devres_node into base.h
      devres: export devres_node_init() and devres_node_add()
      devres: add devres_node_remove()
      devres: rename and export set_node_dbginfo()
      rust: devres: embed struct devres_node directly
      Merge tag 'v7.0-rc5' into driver-core-next
      PCI: use generic driver_override infrastructure
      platform/wmi: use generic driver_override infrastructure
      vdpa: use generic driver_override infrastructure
      s390/cio: use generic driver_override infrastructure
      s390/ap: use generic driver_override infrastructure
      bus: fsl-mc: use generic driver_override infrastructure

Dmitry Torokhov (3):
      driver core: platform: add kerneldoc to struct platform_device_info
      driver core: platform: allow attaching software nodes when creating d=
evices
      driver core: platform: fix various formatting issues

Douglas Anderson (1):
      device property: Make modifications of fwnode "flags" thread safe

Gui-Dong Han (4):
      driver core: simplify __device_set_driver_override() clearing logic
      debugfs: check for NULL pointer in debugfs_create_str()
      debugfs: fix placement of EXPORT_SYMBOL_GPL for debugfs_create_str()
      soundwire: debugfs: initialize firmware_file to empty string

Hans de Goede (1):
      driver core: Make deferred_probe_timeout default a Kconfig option

Heiner Kallweit (3):
      sysfs: constify group arrays in function arguments
      driver: core: constify groups array argument in device_add_groups and=
 device_remove_groups
      driver core: make struct class groups members constant arrays

Kexin Sun (1):
      drivers/base/memory: fix stale reference to memory_block_add_nid()

Li Ming (1):
      driver core: Add conditional guard support for device_lock()

Rafael J. Wysocki (1):
      driver core: auxiliary bus: Drop auxiliary_dev_pm_ops

T.J. Mercier (4):
      kernfs: Don't set_nlink for directories being removed
      kernfs: Send IN_DELETE_SELF and IN_IGNORED
      selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
      kernfs: Add missing documentation for kernfs_put_active's drop_supers=
 argument

 MAINTAINERS                                      |    2 +
 drivers/base/Kconfig                             |    9 +
 drivers/base/auxiliary.c                         |    6 -
 drivers/base/base.h                              |   98 ++++----
 drivers/base/core.c                              |   29 +--
 drivers/base/dd.c                                |   52 ++---
 drivers/base/devres.c                            |  277 ++++++++++++++----=
----
 drivers/base/init.c                              |    1 +
 drivers/base/memory.c                            |    2 +-
 drivers/base/platform.c                          |   58 ++---
 drivers/base/property.c                          |   14 +-
 drivers/base/soc.c                               |   23 +-
 drivers/base/swnode.c                            |   13 +-
 drivers/bus/fsl-mc/fsl-mc-bus.c                  |   43 +---
 drivers/bus/imx-weim.c                           |    2 +-
 drivers/i2c/i2c-core-of.c                        |    2 +-
 drivers/net/phy/mdio_bus_provider.c              |    4 +-
 drivers/of/base.c                                |   30 ++-
 drivers/of/dynamic.c                             |    2 +-
 drivers/of/platform.c                            |    2 +-
 drivers/pci/pci-driver.c                         |   11 +-
 drivers/pci/pci-sysfs.c                          |   28 ---
 drivers/pci/probe.c                              |    1 -
 drivers/platform/wmi/core.c                      |   36 +--
 drivers/s390/cio/cio.h                           |    5 -
 drivers/s390/cio/css.c                           |   34 +--
 drivers/s390/crypto/ap_bus.c                     |   34 +--
 drivers/s390/crypto/ap_bus.h                     |    1 -
 drivers/s390/crypto/ap_queue.c                   |   24 +-
 drivers/soc/fsl/guts.c                           |   12 +-
 drivers/soc/imx/soc-imx8m.c                      |   11 +-
 drivers/soc/imx/soc-imx9.c                       |    4 +-
 drivers/soc/sunxi/sunxi_mbus.c                   |    2 +-
 drivers/soundwire/debugfs.c                      |    9 +-
 drivers/spi/spi.c                                |    2 +-
 drivers/vdpa/vdpa.c                              |   48 +---
 drivers/vfio/fsl-mc/vfio_fsl_mc.c                |    4 +-
 drivers/vfio/pci/vfio_pci_core.c                 |    5 +-
 drivers/xen/xen-pciback/pci_stub.c               |    6 +-
 fs/debugfs/file.c                                |    7 +-
 fs/kernfs/dir.c                                  |   58 ++++-
 fs/kernfs/inode.c                                |    2 +-
 fs/sysfs/group.c                                 |   10 +-
 include/linux/device.h                           |    5 +-
 include/linux/device/class.h                     |    4 +-
 include/linux/fsl/mc.h                           |    4 -
 include/linux/fwnode.h                           |   44 +++-
 include/linux/ksysfs.h                           |    8 +
 include/linux/of.h                               |   14 ++
 include/linux/pci.h                              |    6 -
 include/linux/platform_device.h                  |   58 ++++-
 include/linux/sys_soc.h                          |   10 +
 include/linux/sysfs.h                            |   16 +-
 include/linux/vdpa.h                             |    4 -
 include/linux/wmi.h                              |    4 -
 init/main.c                                      |    2 +
 kernel/ksysfs.c                                  |    9 +-
 rust/kernel/devres.rs                            |  187 +++++++++++----
 rust/kernel/io.rs                                |  780 ++++++++++++++++++=
++++++++++++++++++++------------------------
 rust/kernel/io/mem.rs                            |   10 +-
 rust/kernel/io/register.rs                       | 1260 ++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++=
++++++++
 rust/kernel/irq/request.rs                       |   28 +--
 rust/kernel/lib.rs                               |    3 +
 rust/kernel/num/bounded.rs                       |   70 +++++-
 rust/kernel/pci/io.rs                            |   99 +++-----
 samples/rust/rust_driver_pci.rs                  |   90 ++++++--
 scripts/Makefile.build                           |    3 +-
 tools/testing/selftests/cgroup/test_memcontrol.c |  112 +++++++++
 68 files changed, 2839 insertions(+), 1014 deletions(-)
 create mode 100644 include/linux/ksysfs.h
 create mode 100644 rust/kernel/io/register.rs
