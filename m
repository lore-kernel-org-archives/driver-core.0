Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DE62C3266;
	Tue,  6 Oct 2026 07:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791270199; cv=none; b=hEeSADbPNV3vTXwMOCiNgAH+qvuIxPksp8uSpdHm0YDGRVEwCS+TXVdGpF25di8TiJc5J/9yu044x9Niiqe3xqIci01HsgS3X0lpmZC9ZzqAD1UJaCvb4QDeFX5TgetoYUMKUFma+n2r524MIRSVY2zAR69JcW6XtuawAkk5DG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791270199; c=relaxed/simple;
	bh=Fw36XhTXe0b1nKcvjkrW0Rc3WDJ1Wu2lnc6LFxgAq3w=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=K3nQ4qFBTbygMUsh9ZUKsm7TlOyWR3FRGyuAPMR5Vl0fWgzS+2Ww4GXxSdvcMjyfmcitQVCAkl5MusO/vGWa3vgi0TLkuc9awg7Ta8ejf+S5MCguqYKyxpSHLfmvDzOXZmDDNjq9E3D3BtyoRxkBA0nnZU0TdcP4MBXqqYozfxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iQOrFN9i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iQOrFN9i"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E67E3C4AF0B;
	Tue,  6 Oct 2026 07:03:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791270199;
	bh=Fw36XhTXe0b1nKcvjkrW0Rc3WDJ1Wu2lnc6LFxgAq3w=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=iQOrFN9icaXkzvwNYnnwcnEgucWmkSaAp241zZZ7XcNsGQLCuwqnx6WYvIJYyWtrS
	 dHFdBSZksZQbAf5y1uHvyTDFVSl0k7tlymUNvvWy23TBUbEsj/0+Vlp9OAKZjrwmQK
	 sQxI4MZv/aS3u6wsBTq2fV1JIehbnKUM/9bC/6bGfXSWG2G8Na1issy3viAeugNLfh
	 wQahbi14qjIiu7rkb9NbmOukFK4tpubhyTJ033h0GqW+XE1czZs4QWj9bzsyYPkb3+
	 O553oKUezmq2Ys+moWGTJme9E6pT88b8jPykK1T42zPKZxa/+HzE3EnN102F/e1+vV
	 TRCy1G5XxquGA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C079DCA5FF0;
	Tue,  6 Oct 2026 07:03:18 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v3 0/2] regmap: Fix cache lifecycle locking and teardown
Date: Tue, 06 Oct 2026 18:03:14 +1100
Message-Id: <20261006-regcache-lifecycle-submit-v3-0-37bdd82fd47c@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQW6DMBBFrxJ53UmNATvOKveIuhgPA4yEIbIJa
 hRx90AWVVdVl2/x3v9PlTkJZ3U+PFXiRbJM4wblx0FRj2PHIM3GymhjtTc1JO4IqWcYpGV60MC
 Q7yHKDK5qS2sD6zaQ2vxb4la+3+3r18YBM0NIOFK/F++3PCfG+Bkxz5x2o5c8T+nxPrMUu/ef3
 aWAAk5lcDWh8423ly6iDEeaotp3F/NTKrSu/ioZ0OCdbSpd88mj+11a1/UFbwfSLS4BAAA=
X-Change-ID: 20260925-regcache-lifecycle-submit-74f366be0fbc
To: Mark Brown <broonie@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Andrew Ballance <andrewjballance@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, maple-tree@lists.infradead.org, 
 asahi@lists.linux.dev, linux-mm@kvack.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791270197; l=1559;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=Fw36XhTXe0b1nKcvjkrW0Rc3WDJ1Wu2lnc6LFxgAq3w=;
 b=1TBN4aLDjXZNkcqUmaLZLH4OjfQzc8Jcun6vrb1+wdyzvEfLh1e+9zWeK/8G+R7wooWgl298r
 rv5E2j2yZhgBZJMaKrJ/YYeB1H18i3Ng5iGwnl4w+4sTgsNRV9sCsEv
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=VJ0TvyQ9TvfzYZa908YSE9kpkjFLLD5luv0bERu+boc=
X-Endpoint-Received: by B4 Relay for
 michael.reeves077@gmail.com/fedora-20260918 with auth_id=1035
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
Reply-To: michael.reeves077@gmail.com

Fix an "Invalid wait context" lockdep warning during Apple GPIO probe and
correct debugfs ordering during cache teardown.

Tested on Apple M3 MacBook Air (T8122):

- All 4 GPIO controllers probe successfully with lockdep enabled.
- The "Invalid wait context" warning no longer occurs.
- The regmap KUnit suite passes and lockdep remains enabled.

---
Changes in v3:
- Link to v2: https://lore.kernel.org/r/20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com
- Add Maple-state irqsave and irqrestore helpers.
- Use the helpers for cache teardown and document why IRQ safety is needed.
- Rebase onto the latest upstream tree.

Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com
- Make Maple cache teardown IRQ-safe.
- Fix debugfs ordering during cache teardown and reinitialization.
- Rebase onto the latest upstream tree.

---
Michael Reeves (2):
      regmap: Remove debugfs before cache teardown
      regmap: Drop map lock during cache init and exit

 drivers/base/regmap/regcache-maple.c |  9 +++++++--
 drivers/base/regmap/regcache.c       |  6 ------
 drivers/base/regmap/regmap-debugfs.c |  1 +
 drivers/base/regmap/regmap.c         | 15 +++++++++------
 include/linux/maple_tree.h           |  4 ++++
 5 files changed, 21 insertions(+), 14 deletions(-)
---
base-commit: 2c3418fffa9d037b2038a6db48be63f9e2291806
change-id: 20260925-regcache-lifecycle-submit-74f366be0fbc

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>


