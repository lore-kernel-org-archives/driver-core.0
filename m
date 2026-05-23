Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCAF9242D88;
	Sat, 23 May 2026 13:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779541808; cv=none; b=W1nRrXShJkUOXEjElFRGdbejj5Y7fZRbKCkyZWFU9yfmG2doYqOcLdPj2LKPE3ZqS5EJY1j8Z8DWUwIi65KaeL5L27oxHgd+8bvIydiYhVtwznC5qzGN75Dchxk8/nsEUO0VrX9wM768ywz1yCsH/3ey/pvIj9xwnT17ip1PGPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779541808; c=relaxed/simple;
	bh=PC/X/AMeryfDdGrl3Lor45226CKSgjiNPjqIP23DWrQ=;
	h=Content-Type:Date:Message-Id:Subject:Cc:To:From:Mime-Version; b=kXtvJaOYuNx90LrXLlg7OMQzejzARu7qvPS15Z9bZDySVV/kJR2i5YkU1LxoBiNvT/paafiueBgxItE/ttiPtmnemN+wzForxtP9BuwT0z+E1Oitf1w62DX8aZgQIjtzgG+3Xbm2x7Vs5ZVsr9sOWDYVgnLH9frzUdAAbe4vXTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FngO+sSM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FngO+sSM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA7BC1F000E9;
	Sat, 23 May 2026 13:10:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779541807;
	bh=Yk1pM4oFUXVZ0V6AmIualujL7hwlg7ecRS49+/fGnSY=;
	h=Date:Subject:Cc:To:From;
	b=FngO+sSMvE/QFimyJvs7QuPKUvvGAqIbatN30aBc1jVtxj+vF0iMu9iJ6sy+A5uk/
	 WRrwytkTh1W5mI6mqNqrW6oJ/REzzDQAXfzvtmsU6MD28kkG/b42uNC2TEB/PndmkQ
	 k+SEvP607AZFgFPH+Rp7zvu0Qu6abO6BNge9W6zk52fjnYNdneYbEicNYlid6VaVtN
	 PvBPCUHdtHE0W2XXb6ta6XybL+uIERVlci1pFngSat9iNnCsK7FqX2vKHYS0zrTFmQ
	 X3gvmXPFwH66LOgix8kD8ZPWSPL7Wmp59wVvti7XjVcQrsb91SEPzVTGVXdfLC/gOr
	 2+RGfno810PKQ==
Content-Type: text/plain; charset=UTF-8
Date: Sat, 23 May 2026 15:10:04 +0200
Message-Id: <DIQ2X70CYYKK.W7Q958FP7DBO@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.1-rc5
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
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

Thanks,
Danilo

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731=
:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.1-rc5

for you to fetch changes up to 215c90ee656114f5e8c32408228d97082f8e0eef:

  device property: set fwnode->secondary to NULL in fwnode_init() (2026-05-=
22 12:24:08 +0200)

----------------------------------------------------------------
Driver core fixes for 7.1-rc5

- Remove the software node on platform device release(); without this,
  the software node remains registered after the device is gone and a
  subsequent platform_device_register_full() reusing the same node fails
  with -EBUSY

- In sysfs_update_group(), do not remove a pre-existing directory when
  create_files() fails; the previous code would silently destroy a sysfs
  group that the caller did not create

- Set fwnode->secondary to NULL in fwnode_init() to avoid dereferencing
  uninitialized memory (e.g. in dev_to_swnode()) when the firmware node
  is allocated on the stack or via a non-zeroing allocator

----------------------------------------------------------------
Bartosz Golaszewski (2):
      driver core: platform: remove software node on release()
      device property: set fwnode->secondary to NULL in fwnode_init()

Greg Kroah-Hartman (1):
      sysfs: don't remove existing directory on update failure

 drivers/base/platform.c | 16 +++++++++++++++-
 fs/sysfs/group.c        |  2 +-
 include/linux/fwnode.h  |  1 +
 3 files changed, 17 insertions(+), 2 deletions(-)
