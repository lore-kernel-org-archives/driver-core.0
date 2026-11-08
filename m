Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794141478;
	b=t8YME26hIA2wIMwf1XY/ach2C1LUC5lkMoooD0wmo8SrDKZigfUNH1TCyyN7wOFp7e7B
	 yg/b5cFvVOH9zA5PKogVzKfaw2yCKeK87kxoGdp7WZTdabC3hgZjWpr4UosEMXeG8jIm9
	 LGM/HBJ0nXwwxV7MgAkYzRHqQYNBdddc56ZKcRMKMXwXG/KVLjn9cTO5HCJLEZykAX8AQ
	 4B21j61OJ+uda4t9QuFzYKe2lclL0Owo0ofjM+e0w1hvs++Cmqg8+1RvXiKc+mX2tyjGl
	 a1yu7JLY+OSo8gDnmjkHnyqjRpWOOxvR1DBOuC/8HDEu4t5hn0FV2nyiHbe8HNuHB9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794141478;
	h=Received:DKIM-Signature:Content-Type:Date:Message-Id:Cc:To:From:
	 Subject:Mime-Version:Content-Transfer-Encoding:X-Mailer:X-TUID;
	bh=LPWZeKvMF5glukvyoics8CK0yautXj7LLLbv0OwV4ug=;
	b=lmZLiSuuwfNJhrkoTfH9vUvGf5pLL3ELejpXWJibC/VowGmk3ceAMBSuea9x+5G3T91r
	 aU3cVX67WiDLLAo6piMjcgOsEwcbemEmzLnswnoEiK/+m+h1npGHh2F9oq2rXPJ7wIHIS
	 Jzesm8RHQ5pgn8DX99FbZHYgh6XTFOCND1XxO/IQYDUNTFVDdzeRy8+qk8Pyw5YXb2D22
	 kUclVw0zIw4BT/s0TYx/XYLmshy8kNnfp/YSC6+SxVS4WnYz6q7nWeqW73MQnXE/qvH0i
	 yk8lWORbYcgFBDDnW+V/T/Ztw5l5CTWSBVh2Ra5KwGdhlw1ycwCwfq9akg9xL89/d9Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+U7Uq8w;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80D53606A320;
	Sun,  8 Nov 2026 12:37:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=N+U7Uq8w
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E30F1F0089F;
	Sun,  8 Nov 2026 12:37:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794141478;
	bh=LPWZeKvMF5glukvyoics8CK0yautXj7LLLbv0OwV4ug=;
	h=Date:Cc:To:From:Subject;
	b=N+U7Uq8wqn4Uu+pD0bIwk20e2FkpEbAoDEtC77FtenFQ7Z9KnL2wMGGwKx1i/ogig
	 Q3MkpsGHvtfkw27NpbyBCZ6Kna9gu3GfTYW2EgyB/7zYp+mQberQ9PrrRDZNtLRu3G
	 gn9uXPIO2IbqdkyuKoQJg9fzZMgl6xWIofG6nP4hk/UncAe6ZAmsvWzUN48L01STcV
	 lnqvcuyRvCptkAbJkMzKFy87jtkkIBrC/B13RpmdBw0+alOzUikjf7WKw82p7JejT1
	 +XrIefeLrQO49lMW77ma78nKWurp6V5NWjG0TvGY+bJ6n4IVoeGK+eXpqbrSDGC4vi
	 xvC7hhq4dEJrg==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 08 Nov 2026 13:37:45 +0100
Message-Id: <DMPU2INZSMAU.3H6O1U564A48B@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.4-rc2
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
X-Mailer: aerc 0.22.0-0-gc2f86b7abde3
X-TUID: hFHoBW9FpV45

Hi Linus,

Please pull these driver-core fixes.

Thanks,
Danilo

The following changes since commit 6628e7d4c6b25c8d18f1345e3a20d21829aae7e4=
:

  Linux 7.4-rc1 (2026-11-01 13:26:31 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.4-rc2

for you to fetch changes up to a42ae51fe3c36cef82dc687ea594ca232a785fd4:

  MAINTAINERS: update auxiliary bus entry (2026-11-02 16:42:24 +0100)

----------------------------------------------------------------
Driver core fixes for v7.4-rc2

- Fix an unused-function warning in the Rust I/O code that breaks builds
  with CONFIG_PCI disabled and CONFIG_WERROR enabled

- Fix kernfs sparse warnings on SMP Alpha when inheriting a parent
  node's group ID

- Add Johan Hovold as an auxiliary bus maintainer

----------------------------------------------------------------
Eliot Courtney (1):
      rust: io: fix unused Flags::from_raw warning without CONFIG_PCI

Johan Hovold (1):
      MAINTAINERS: update auxiliary bus entry

Shakeel Butt (1):
      kernfs: avoid READ_ONCE() on a kgid_t in kernfs_new_node()

 MAINTAINERS                | 1 +
 fs/kernfs/dir.c            | 2 +-
 rust/kernel/io/resource.rs | 2 +-
 3 files changed, 3 insertions(+), 2 deletions(-)
