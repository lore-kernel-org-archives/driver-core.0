Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793405231;
	b=2Nl59HDBD8LJY2Y8A8lLUeZlQTg1VimnFhOSQfNqwtVpl2NSwQQB2ouijDjATpnwoOe4
	 2h2LZsV71RzC75nfG1WSpRDCilE2QcPQ10g48SFACh6VDNhq4UUmMiczV1RF+jr6CfCR8
	 PGuMSxTYZqVY2QeVv0NeMnCMrUT39CY6RIOP1LN0ny8eSjwGJlI/5dKgsiL0wOWfVxIFK
	 vdIhMseB6C+jYjKPNMHv0qPj39/FzQ3XIMcPWvf2NpQeH96EehAXDLxJooY3ZQdxRofRc
	 VxP3aaryZax9xgD4dDmbE1Kh0op2wkrjfXK9ujwJ1ohI5ikVifEc2yBFezulyE9ioFw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793405231;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:To:From:Subject:Cc:X-Mailer;
	bh=BjpGGcbRegaCn9ilP7d4hJfHXRhNadTI4aR8Mcf5w2U=;
	b=VPAVihBeLsrQhvqSw3bJYcrgDPZ6QFryP0Abwu0ivbxAzTOmsOEFNRhBbRM0VZTXDkd4
	 nv4HtQy6hnBfV8vf9cFJ68XSai+UNqDhtdHtW1uMmWT7aceU4nO63/kZvylkpNkFZ7d+s
	 qu0t+7GqtHGQcrAgppvYB0nYvaVSjhSxtFhxQhLJ2CSY06C0nokb5HwDNY5HStV1/HXm+
	 V2wuoPRN58iaS69mZ1R9WLpprlTOpky24Gu9grH4P51L3ixDJdcjX0Bq05zlwYQBvSnkb
	 wBHwAq11j2gqrnAqUrkohOHjmZCsY54c4pOeAmso8FtwLjHh6VN+FGgfrwxRUexnAuA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlaaPSCg;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5C606A31A;
	Sat, 31 Oct 2026 00:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ZlaaPSCg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC25F1F000C1;
	Sat, 31 Oct 2026 00:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793405230;
	bh=BjpGGcbRegaCn9ilP7d4hJfHXRhNadTI4aR8Mcf5w2U=;
	h=Date:To:From:Subject:Cc;
	b=ZlaaPSCgunHQ7TnaAHNGJWE3zlPdqnwfz0i93JF/n4F66DjD1Hy0a3pWhM2NiBe/H
	 9nFmtfTXRG/X3fZxNZZrFmApI0NnrBaY556VoDGe4OwUuL9yKzh7iS4GiChOlxe+bz
	 MtpD/Z29DVJDOAYY0q2D9JTbXMWMGAzLCLx4BsA4yummQQDexDr88hLZQaTHBytY79
	 ba9huA896oWknVSh8Qxkf8nnQ2h7V24X96ILV64KkvitAJ/3CWE8TDDRj8MxwpybZc
	 Ko3nFOvBzrH3k1chWzNjZCinD+SG7g4u8rH25H+aD3BYuu3CXeVrZg+4kCv6rFs+Du
	 CzPQgh+45c2KQ==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Oct 2026 01:07:07 +0100
Message-Id: <DMIL3FNP8HDY.3K2425TJD0OU2@kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.4-rc1 (2nd)
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3

Hi Linus,

Please pull these driver-core fixes.

The main fix is a revert of TAINT_FORCED_BIND, which is too broad and cause=
s
established VFIO workflows to taint the kernel.

Thanks,
Danilo

The following changes since commit 0cc3ad8f4d2e2009c2005278c754caf7c07fe0a4=
:

  Merge tag 'driver-core-7.4-rc1-2' of git://git.kernel.org/pub/scm/linux/k=
ernel/git/driver-core/driver-core (2026-10-26 07:04:41 -1000)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.4-rc1-3

for you to fetch changes up to a287f97d4256b5f5527f5b5a54f8ada55e1482c7:

  Revert "driver core: add TAINT_FORCED_BIND for when userspace manually me=
sses with devices and drivers" (2026-10-29 21:01:16 +0100)

----------------------------------------------------------------
Driver core fixes for 7.4-rc1

- Revert TAINT_FORCED_BIND, introduced to flag manual sysfs bind/unbind
  operations associated with misleading fuzzing reports. It also taints
  established workflows, including VFIO device passthrough; a more
  targeted approach will be revisited after 7.4.

- Rate limit synthetic uevent failure messages to prevent log flooding
  from repeated invalid writes to sysfs uevent files

----------------------------------------------------------------
Greg Kroah-Hartman (1):
      Revert "driver core: add TAINT_FORCED_BIND for when userspace manuall=
y messes with devices and drivers"

Josef Bacik (1):
      driver core: Limit the messages on a refused uevent

 Documentation/admin-guide/tainted-kernels.rst | 54 +++++++++++++++++++++++=
++-----------------------------
 drivers/base/bus.c                            |  3 ---
 drivers/base/core.c                           |  4 +++-
 include/linux/panic.h                         |  3 +--
 include/trace/events/module.h                 |  3 +--
 kernel/panic.c                                |  5 ++---
 lib/kobject_uevent.c                          |  6 +++---
 tools/debugging/kernel-chktaint               |  8 --------
 8 files changed, 35 insertions(+), 51 deletions(-)
