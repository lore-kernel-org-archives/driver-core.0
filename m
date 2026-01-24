Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE1926F2A8;
	Sat, 24 Jan 2026 14:05:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769263558; cv=none; b=PkCpPIbalZ5hi3ZkPvb0SaNUyeMa1aEspWX3XrwEs8P6gQJqsssCBGoZr6dBrm3XbM2nw8fYNPUNYmeJBeIa72bNR4PUlw7skUzMzkkdU/zuCZB+qu5bmejZzcgdzWiCh/vRRnu168orXbZq6KsUgqv8f6byEf9aTuMoX0No6Lk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769263558; c=relaxed/simple;
	bh=7uF5LGTRjHfYWUzWETKPzVLb5tnQKyPYJlDJ0Pq3n2w=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From; b=c05yg9i1bKKgIpoIRvw7yx99oE+WgrDBmIrvpgR8sJjG0tMaLHVkfn3R6tRQ7FvXD6W2vA+ywe8AlZJ5Vh2fi89vmkZlhrsJi+rZWMK+1DpJTvscACsYlYq6gGCTogRWWUCWMetnkw/OPnPiTqfeUY0KB539IshijwAeGIJwv/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bjwK92oH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bjwK92oH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37E9BC116D0;
	Sat, 24 Jan 2026 14:05:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769263557;
	bh=7uF5LGTRjHfYWUzWETKPzVLb5tnQKyPYJlDJ0Pq3n2w=;
	h=Date:Subject:Cc:To:From:From;
	b=bjwK92oHB6C0ut65qqSz9jyEz3lw20hqjWuAAhdXD1jh29cD1anEbWGsV2Udm3+78
	 elEvjPuXpyOtNOjAyomMBumo+YP5AHQ5scYLqJUAiELsBwmbEJ/mK+eGk58JBKkfdz
	 I/I4FwTwywOlhfmJH8gTJu06dsJYnKipj8xj58p1d4B2x+stLoCth8AFboE4sjq/t8
	 ccn83q5GPNS8LhdgpPt/nKMpCqa+Hh4Y6XX6JZz0wk5tlRU8pLlK0jvNhce62YYd+b
	 1D9w0HNO6x0iaAb3SrmSujqvbgyM4H6w2KF82kpUJXcR1FFG7OfdPP/UgsoqRRQ59Q
	 W2xGUoKkr8CmA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 24 Jan 2026 15:05:54 +0100
Message-Id: <DFWVL46MM928.V9LOBRWI8BLZ@kernel.org>
Subject: [GIT PULL] Driver core fixes for 6.19-rc7
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0

Hi Linus,

Please pull these driver-core fixes.

All commits have been in linux-next for a couple rounds; no conflicts expec=
ted.

I held back two fixes [1, 2] originally intended for -rc7. Patch [1] uncove=
red
potential deadlocks that require a few driver fixes; [2] is one such fix.

Given how late we are in the cycle, I want to give these more time in linux=
-next
to ensure we have identified all affected drivers. Expect to see these in t=
he
upcoming -rc1 pull request.

- Danilo

[1] https://patch.msgid.link/20260113162843.12712-1-hanguidong02@gmail.com
[2] https://patch.msgid.link/20260121141215.29658-1-dakr@kernel.org

The following changes since commit 0f61b1860cc3f52aef9036d7235ed1f017632193=
:

  Linux 6.19-rc5 (2026-01-11 17:03:14 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-6.19-rc7

for you to fetch changes up to a995fe1a3aa78b7d06cc1cc7b6b8436c5e93b07f:

  rust: driver: drop device private data post unbind (2026-01-16 01:17:29 +=
0100)

----------------------------------------------------------------
Driver core fixes for 6.19-rc7

  - Always inline I/O and IRQ methods using build_assert!() to avoid
    false positive build errors.

  - Do not free the driver's device private data in I2C shutdown()
    avoiding race conditions that can lead to UAF bugs.

  - Drop the driver's device private data after the driver has been
    fully unbound from its device to avoid UAF bugs from &Device<Bound>
    scopes, such as IRQ callbacks.

----------------------------------------------------------------
Alexandre Courbot (2):
      rust: io: always inline functions using build_assert with arguments
      rust: irq: always inline functions using build_assert with arguments

Danilo Krummrich (6):
      rust: i2c: do not drop device private data on shutdown()
      rust: auxiliary: add Driver::unbind() callback
      rust: driver: introduce a DriverLayout trait
      rust: driver: add DEVICE_DRIVER_OFFSET to the DriverLayout trait
      rust: driver: add DriverData type to the DriverLayout trait
      rust: driver: drop device private data post unbind

 drivers/base/dd.c             |  2 ++
 include/linux/device/driver.h |  9 +++++++++
 rust/kernel/auxiliary.rs      | 41 +++++++++++++++++++++++++++++++++------=
--
 rust/kernel/device.rs         | 20 +++++++++++---------
 rust/kernel/driver.rs         | 86 +++++++++++++++++++++++++++++++++++++++=
+++++++++++++++++++++++++++++++----------------
 rust/kernel/i2c.rs            | 31 ++++++++++++++++++++-----------
 rust/kernel/io.rs             |  9 ++++++---
 rust/kernel/io/resource.rs    |  2 ++
 rust/kernel/irq/flags.rs      |  2 ++
 rust/kernel/pci.rs            | 27 ++++++++++++++++++---------
 rust/kernel/platform.rs       | 27 ++++++++++++++++++---------
 rust/kernel/usb.rs            | 27 ++++++++++++++++++---------
 12 files changed, 209 insertions(+), 74 deletions(-)
