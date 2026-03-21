Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D67D240DFBD;
	Sat, 21 Mar 2026 22:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774133169; cv=none; b=MNGjj3BOvHloPu35PcxDKoHcOsUDwPOTd7VZeEzCPNyLregqLwtHRHh6pCChjT8gEDocSahSczAuLDU6RAM7T+yoZwSrDZScTnnCXrqwRsqn40NkvyznS1qyysGx4y9NEU8K1VWH3IhtrKKsQ60+6FDWioh9tHRGwkSo0oc/yj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774133169; c=relaxed/simple;
	bh=XJlrdX5VZJ8zSBd80Oib4ohlM2GNjLbDvHBu4mYSCvg=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version; b=ujClOyrwi/lDeBzRXWG8j+GAjzlnNPcvq24ePSabUfqMtsWG/6Csfkse5m+6fn598dwrnle5YttOOquExhMQFog6EacU3l7/TkeXxEJjAbOkJlnLx7ijWf4pv2Y1r/mIuJ/seSrKv1Zvbqvddy82C4MgPhduUHZ+DNYIR/gx/X8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GLOuP4rF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GLOuP4rF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1A90C19421;
	Sat, 21 Mar 2026 22:46:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774133169;
	bh=XJlrdX5VZJ8zSBd80Oib4ohlM2GNjLbDvHBu4mYSCvg=;
	h=Date:Subject:Cc:To:From:From;
	b=GLOuP4rFHfKnl+UaMA9CvX5iTv/9f511oQbw7XiA7r7AdrFGOEdoADLW/62h+EgfK
	 OGdfidp+u7Epv1eKfIkX8vvZGUT3eb5vNvXb3eHYqvMvTUPZvNx9DeVAwNlvpzHvfc
	 H/vAQHYLNuSoF6R3xVIEvWIjLXxfbWMW2r6170suawJt6gG+I0mUE8UoIJgAJCZkyx
	 eRZtPqCVj8ELYFxCQiF1RvMEt5ohmJJDl+c3xJs+wCE6m1LFYajodNQSX9IMwxEAra
	 oYdDyXi1NSOqmb7PAoeqdsA89KkE5WYvNJ7fZ5AmZLhdZlxhYDcDznbSi5EcRjXEZK
	 vA53UKzhp6Ejg==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 21 Mar 2026 23:46:06 +0100
Message-Id: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.0-rc5
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

Please pull these driver-core fixes.

All commits have been in linux-next for a couple rounds; no conflicts expec=
ted.

(I will send out fixes for the remaining busses subsequently, so they can r=
each
you through the corresponding subsystem trees -- treewide commit [1] for
reference.)

- Danilo

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?=
h=3Ddriver_override&id=3D7144511c6614967b4c16b716a9674b12c4e7f2b9

The following changes since commit f338e77383789c0cae23ca3d48adcc5e9e137e3c=
:

  Linux 7.0-rc4 (2026-03-15 13:52:05 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.0-rc5

for you to fetch changes up to 2b38efc05bf7a8568ec74bfffea0f5cfa62bc01d:

  driver core: platform: use generic driver_override infrastructure (2026-0=
3-17 20:30:57 +0100)

----------------------------------------------------------------
Driver core fixes for 7.0-rc5

- Generalize driver_override in the driver core, providing a common
  sysfs implementation and concurrency-safe accessors for bus
  implementations

- Do not use driver_override as IRQ name in the hwmon axi-fan driver

- Remove an unnecessary driver_override check in sh platform_early

- Migrate the platform bus to use the generic driver_override
  infrastructure, fixing a UAF condition caused by accessing the
  driver_override field without proper locking in the platform_match()
  callback

----------------------------------------------------------------
Danilo Krummrich (5):
      driver core: generalize driver_override in struct device
      docs: driver-model: document driver_override
      hwmon: axi-fan: don't use driver_override as IRQ name
      sh: platform_early: remove pdev->driver_override check
      driver core: platform: use generic driver_override infrastructure

 Documentation/driver-api/driver-model/binding.rst | 48 +++++++++++++++++++=
+++++++++++++++++++++++++++++
 arch/sh/drivers/platform_early.c                  |  4 ----
 drivers/base/bus.c                                | 43 +++++++++++++++++++=
+++++++++++++++++++++++-
 drivers/base/core.c                               |  2 ++
 drivers/base/dd.c                                 | 60 +++++++++++++++++++=
+++++++++++++++++++++++++++++++++++++++++
 drivers/base/platform.c                           | 37 +++++--------------=
------------------
 drivers/bus/simple-pm-bus.c                       |  4 ++--
 drivers/clk/imx/clk-scu.c                         |  3 +--
 drivers/hwmon/axi-fan-control.c                   |  2 +-
 drivers/slimbus/qcom-ngd-ctrl.c                   |  6 ++----
 include/linux/device.h                            | 54 +++++++++++++++++++=
+++++++++++++++++++++++++++++++++++
 include/linux/device/bus.h                        |  4 ++++
 include/linux/platform_device.h                   |  5 -----
 sound/soc/samsung/i2s.c                           |  6 +++---
 14 files changed, 224 insertions(+), 54 deletions(-)
