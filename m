Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792959401;
	b=tSQV7rBZR03c4sZ8dyDACYE/3MtTNNO5oGkDVrkrXA1qA5PX1H/LVfc6uhGEvAkaLzO2
	 pLw9hX5Y5MRCNf9VuuyoV08FiyPlq/IzhVBUYyWwqSP1m65l1Z211tcu+GkaR8TOStROY
	 vVqMm9F38sVf4pldpHSrMtRcsvavvZuy2hsmcmuE1nkCmnOdjUD6B4wXYxXJ5IluVyCoZ
	 7yNWtvL+UP2BladgOQ6EIcnN6WF7krs1CEFMiip8gr2s5s1CtY6tAzGHZfAqSB8L7L/Ci
	 tYbs+N58cDv6mtM1poFzdnVTvJ2eXPQ2GgF0Sp8lgloeZjIl7mSWULVgXHWLltehmGw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792959401;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:X-Mailer;
	bh=uBM0P5AgsQXktIUVJpV9bT1UztKARyF/NcxqP+Nynek=;
	b=1F/4PFGwclbw16UVrMZ6ycUqQ6s05W+Myh/FM3rh2JkPbQhWLiuZzerUwPlprS+7CSog
	 lF4NnLXG2W4RqjpggR71PUSFI8luUonUN4hsnAa2Kr0OcS5Ig0egyMlg5ItyJtc9iG97W
	 v+ZfnZNxSUxzUTAlDCur6rkCQvcGScy5jERGsCXlq/Yf0Jigrc7y6kx2TIxG9YBjP5wcx
	 8zJiL/EWfjN4+rfnmCZkes+nIO97QLOz3gZFWRgnZWivuKSUcvNjx5zQ0xXqs9jnzoeiA
	 2RmBJs03iR6mWr/Papu6oRxMIai1NCkEXxfhBfW6DTySGdIqK++kZ3ETn51LyRh5X7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YqAYdfmV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F5C7606A31A;
	Sun, 25 Oct 2026 20:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YqAYdfmV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E82401F01825;
	Sun, 25 Oct 2026 20:16:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792959400;
	bh=uBM0P5AgsQXktIUVJpV9bT1UztKARyF/NcxqP+Nynek=;
	h=Date:Subject:Cc:To:From;
	b=YqAYdfmVTVGmha2Z5SQ2FllCG40ih7Rmfyt9rnM8Tgb/byn0mmcBoVZVl66zKEEIq
	 woW3H9DPDbbfNdJSodvmnYREeXysX+9+DCAgAclGiiR2dn8alr6f+w29M1a2z2dGbv
	 gUjWJx+Wj5rUupiaHlpm5H1wa2tPoizhUeu5Dpmyhot1TUxih+XqdefZh85gyBiaBW
	 3DX5aqSXw4Q01zOql5C85gLttwA6sAgA6mnRXZy34hcrMKQn1BcKw32TcBCrgCK5Nr
	 bk0vRL7B1nud2M+53eARVSRD5HYQd+c1TReGLcrvgQvFCrZLuQYyXIg4q0n92ZpFog
	 Nawss08X4mCDA==
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
Date: Sun, 25 Oct 2026 21:16:37 +0100
Message-Id: <DME7288WXCGZ.1XSS13X4IVJ5W@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.4-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 <driver-core@lists.linux.dev>, <linux-usb@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3

Hi Linus,

Please pull these driver-core fixes.

These fixes arrived late in the cycle and missed the main driver-core pull
request for 7.4-rc1.

Thanks,
Danilo

The following changes since commit 72d3fcf802c45d00b300f25b848a93c3a2bd7c7e=
:

  Linux 7.3-rc5 (2026-09-27 13:55:01 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.4-rc1-2

for you to fetch changes up to 187a62f99da29b1a55602b0d401a783d8dc86161:

  driver core: take parent lock in async device attach (2026-10-16 22:36:09=
 +0200)

----------------------------------------------------------------
Driver core fixes for 7.4-rc1

- Make parent-lock requirements per device type instead of per bus,
  fixing a use-after-free on USB disconnect by limiting the requirement
  to USB interfaces, which retain a reference to their parent

- Honor parent-lock requirements during deferred and asynchronous
  probing, fixing USB interface probe races, including duplicate
  endpoint creation attempts in sysfs

----------------------------------------------------------------
Johan Hovold (2):
      driver core: fix parent lock use-after-free on USB disconnect
      driver core: take parent lock on deferred probe

Mario Peter (1):
      driver core: take parent lock in async device attach

 drivers/base/base.h        |  1 +
 drivers/base/bus.c         | 32 +++++++++++++++++++++++---------
 drivers/base/dd.c          | 90 ++++++++++++++++++++++++++++++++++++++++++=
+++++++-----------------------------------------
 drivers/usb/core/driver.c  |  1 -
 drivers/usb/core/message.c |  1 +
 include/linux/device.h     |  5 +++++
 include/linux/device/bus.h |  3 ---
 7 files changed, 79 insertions(+), 54 deletions(-)
