Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BFB526A0DD;
	Sat, 28 Feb 2026 20:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772311576; cv=none; b=ZCM7yQKaVTSBdGkd43j5tifWWGps5ksabNcJBSYuMh4EFs/Wh/+l2/0xH+79TEgIE3lW2CDgaUP+eP+72Fnm/cFSTBd0HSKH1lxbGC2Hv2vLZpwB3fg7PxDuOZ27oKeKLsqfFHX4Vg+vGdMZNjW83D+qiPHOUW1lb79ItvduKik=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772311576; c=relaxed/simple;
	bh=XxIcG+uken03W+2L0yJ5O6SxLAhXJfgkIulHf7IaXzs=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=Prhf7BA8rzTE709+VF6l3cLOBW1XSeVyhl0As9SSARed7h3mx/wZNiLcT+HIPpIrVDgV2eHbNafdzHePNqr7yC1EN8pSi49jJnDh7vSZ2wj02/UWuszkVfugEgYe7OU9roPwprNZVj4FPT2Rpx5dS0AcFy74IypzRfuhW02kBuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r56598AU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r56598AU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E691C116D0;
	Sat, 28 Feb 2026 20:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772311575;
	bh=XxIcG+uken03W+2L0yJ5O6SxLAhXJfgkIulHf7IaXzs=;
	h=Date:Subject:Cc:To:From:From;
	b=r56598AU+b5SmBdbpERS36lF6U3LkSpR6IwD4cHFKubqveA7TAbrD5g/IpW3ZIeLW
	 OICk6iEoIeaLXAu7w6Ys55WK7K35lcmEG+G4TMf8K6w2Grmph3KFlaYgYjV8ev9jRy
	 vR7ceFg+IeD3MwMJzGW4OUKoVR0BXW9GDU9Wm9FbIrp1hnYZWBwSuMiXkPvJE60OTp
	 /NytxJmMEDK4trwo1GConqx6pYMK3scFdRYs+5kq4bMRobqHESogxkr7ghPOxkF8vp
	 LUCS9J5of74X84AsIYFfvLV0mpxR9f+WZktgSx0lVBFuMQBea0OIBUN4IWDx1/vvXk
	 DsChph8wO+Jzw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 28 Feb 2026 21:46:13 +0100
Message-Id: <DGQW0ORGGBDG.2BEBG5GGS0NJG@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.0-rc2
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.20.1

Hi Linus,

Please pull these driver-core fixes.

All commits have been in linux-next for a couple rounds; no conflicts expec=
ted.

- Danilo

The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f=
:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.0-rc2

for you to fetch changes up to 78437ab3b769f80526416570f60173c89858dd84:

  clk: scu/imx8qxp: do not register driver in probe() (2026-02-24 12:54:17 =
+0100)

----------------------------------------------------------------
Driver core fixes for 7.0-rc2

- Do not register imx_clk_scu_driver in imx8qxp_clk_probe(); besides
  fixing two other issues, this avoids a deadlock in combination with
  commit dc23806a7c47 ("driver core: enforce device_lock for
  driver_match_device()").

- Move secondary node lookup from device_get_next_child_node() to
  fwnode_get_next_child_node(); this avoids issues when users switch
  from the device API to the fwnode API.

- Export io_define_{read,write}!() to avoid unused import warnings when
  CONFIG_PCI=3Dn.

----------------------------------------------------------------
Andy Shevchenko (1):
      device property: Allow secondary lookup in fwnode_get_next_child_node=
()

Danilo Krummrich (2):
      rust: io: macro_export io_define_read!() and io_define_write!()
      clk: scu/imx8qxp: do not register driver in probe()

 drivers/base/property.c       |  27 +++++++++++++-------------
 drivers/clk/imx/clk-imx8qxp.c |  24 ++++++++++++++++++++++-
 drivers/clk/imx/clk-scu.c     |  12 +++++++++++-
 drivers/clk/imx/clk-scu.h     |   2 ++
 rust/kernel/io.rs             | 131 ++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++++++------------------------------=
----------
 rust/kernel/pci/io.rs         |  24 +++++++++++------------
 6 files changed, 150 insertions(+), 70 deletions(-)
