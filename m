Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93ABD4FECCC;
	Sat,  5 Sep 2026 18:56:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788634575; cv=none; b=CnEJ+tHHjZpfEecsIBF+lKpRJj6XHXln5lICg3EI5dslJhfVm2xKJkXgam4ildgvTJ+SaaLWfudfXQF/zHD/EpQ5SZigNj0yc/SW7fbHgJoUt0RQhIhBmbPnP9LNSYqhr+QF1edkc9rjvMQJAd2kAyktQ9AmKYRf+DrmLeD3wjQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788634575; c=relaxed/simple;
	bh=r2i8R31Vuv/54OjiEZ4cWThh73/N+h0I2uUDcAUiBjs=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To; b=UmqpODb+UesBcqydO7hvT783kWxz/jPHJmcdbhgKp7WTMBRhEfk842+8DmO4kghf/UM27FLheT1elKQKhPUvwIkoapPo0Zirl2hIY/6ZjdveKBNrkrg7JNWBM2HFWvXAQ/toe1/z5gq0AJh7rlJUUqH+GP72jWshhmf2VX93iaQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UIja0TC2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UIja0TC2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 50B3B1F00A3A;
	Sat,  5 Sep 2026 18:56:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788634573;
	bh=tJh5um/UyUsu80vjCaSM4CCUI2Z4Nx7wKDsu6lnL5J0=;
	h=Date:From:Subject:Cc:To;
	b=UIja0TC2y4+1wkpy6YLXlKN0LL1dEb1T2slSOjC/05de+2hqy8pgjyjvL/5ebOexe
	 FVh90Wg8DiRxGKLsvWZU4zs/jes96a+hLrHvdN11Fgzz6CF0KVN2fDwmjDIXOMo6Y7
	 1WAGJFHiWQKY5nA9OVnMJ8TODkCFfT2u5fWiFKF0udmPbX9DHrFJDftDJeOWoYGAOV
	 xYSfmPJ50U69C4udAMq6kKo44bvW2vrZVgIcaz98qVJ4CYtHGyQyq2TjodxVJXp8Xr
	 yTrQ8hp+KhdS4AAUViCrV/uEche91+hCNIZejxOwr81l46aJWQm9o8gyP5yl9BFdwI
	 I6mtnNM+qIU2Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 05 Sep 2026 20:56:09 +0200
Message-Id: <DL7M1DO08S9L.H03E514TN2H2@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.3-rc2
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, "Tejun Heo" <tj@kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2

Hi Linus,

Please pull these driver-core fixes.

Thanks,
Danilo

The following changes since commit cee9395acd8043be0644b25c34bfa86623f2b935=
:

  Linux 7.3-rc1 (2026-08-30 13:34:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.3-rc2

for you to fetch changes up to f6d752278c13839888425294c110174fb6c87e3d:

  MAINTAINERS: Remove Russ Weight from Firmware Loader (2026-09-01 18:40:54=
 +0200)

----------------------------------------------------------------
Driver core fixes for 7.3-rc2

- Fix kernfs listxattr() not returning security xattr names (e.g.
  SELinux labels) when the kernfs node has no allocated kernfs_iattrs

- Fix silent truncation of IRQ vector indices in the Rust PCI
  abstractions

- Don't select OF from DRIVER_PE_KUNIT_TEST; skip the test when OF is
  disabled instead of silently enabling extra kernel functionality

- Russ Weight is retiring from kernel development; update the Firmware
  Loader sysfs contact to the driver-core mailing list, add a CREDITS
  entry for Firmware Upload, and update MAINTAINERS accordingly

----------------------------------------------------------------
Geert Uytterhoeven (1):
      drivers: base: test: DRIVER_PE_KUNIT_TEST should not select OF

Hengyu Liang (1):
      kernfs: preserve security xattrs without allocating iattrs

Russ Weight (3):
      firmware_loader: Change contact for sysfs nodes
      CREDITS: Add CREDITS entry for Firmware Upload
      MAINTAINERS: Remove Russ Weight from Firmware Loader

Sophon Zhang (1):
      rust: pci: reject IRQ vector indices that do not fit in u32

 CREDITS                                        |  4 ++++
 Documentation/ABI/testing/sysfs-class-firmware | 14 +++++++-------
 MAINTAINERS                                    |  1 -
 drivers/base/test/Kconfig                      |  1 -
 drivers/base/test/property-entry-test.c        |  3 +++
 fs/kernfs/inode.c                              |  4 +---
 rust/kernel/pci/irq.rs                         |  4 +++-
 7 files changed, 18 insertions(+), 13 deletions(-)
