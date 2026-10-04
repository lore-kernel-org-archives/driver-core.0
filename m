Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C69F448392;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791117523; cv=none; b=kaa6L8/oz/52GnDxnH6SCplinbRANWivtMj3xOXGSrr1dcqw6xtaxAtxk3Fpb8a23YwmR8UaicExcgDH+BbA7ul4R8pUAoE906T2D8/dLLM9VOGbngYwpBMXE/lWz4ZsHKovETtsWVRGmymRkM4+5iSLvFRutkhOg88DXiuvbpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791117523; c=relaxed/simple;
	bh=zxQ062qio0+lCxbspHzHxGXHzh0Zgd+ekU5PisbC9JQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=sWMaCe30R3/5FQ4wYFRph4uDWDSAZJqPwVw0+zVy14F5/OTEJTWc3bH9ENiHXDMC31ftjN36eiIVY9ZQdr2VZfduQvUqtp4uR3FmVEGtbqx5vxBSyUHt1dm/mNWv3e3bjaL+5igHQQk4xTh3BHm2bgQ4iWncH+Ju7st8Hpm5bVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UvfylfuB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UvfylfuB"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A00ACC2BCB9;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1791117522;
	bh=zxQ062qio0+lCxbspHzHxGXHzh0Zgd+ekU5PisbC9JQ=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=UvfylfuBIL3k67CdSlDR6mXIPHYNiUf3crr97suVE3uiL+tDahwkntUfujGFcK1kl
	 KFN1AOmPkBdIKoWDLxrd9bG5pAlw2qUAtAp6rIZhTNmDjqkx2OnTQYnRM5HuO/BRoc
	 RLO1Nm3KnvtnUIXTSmFpHKZncNWgk0X1h+LJqP5YBu7/r31phTj3s6V3I3e9OpOQF6
	 ymOc1ugB6edwzgoj19G85sVsX2Wa9bMPTMfEG1gXVlVwkKozIIzCRdhdIqRLhOo4oH
	 kT7K/Q5LWp5P4rnZeAQQ/+ZR8BD5EV128LPXByZVNmaFWn/enPxdlLY5lpQgkroDYC
	 7eUqJQwqoRBhg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7A651CA5FCE;
	Sun,  4 Oct 2026 12:38:42 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Subject: [PATCH v2 0/2] regmap: Fix cache lifecycle locking and teardown
Date: Sun, 04 Oct 2026 23:38:41 +1100
Message-Id: <20261004-regcache-lifecycle-submit-v2-0-976d405e89a7@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42OQQ6DIBBFr9KwLq1ixdpV79G4gHGQSUQNoKkx3
 r3oCbp8i/f+31hATxjY67IxjwsFGocE4nphYNXQIac2MROZkFktSu6xAwUWeU8GYYUeeZi1o8i
 rhymk1JgZDSz5k0dD37P9aRJrFZBrrwawR3GeQvSo3N2pENEfhqUQR7+eZ5b88P7ZXXKe82ehq
 xJUVbe1fHdOUX+D0bFm3/cfTg4YbOQAAAA=
X-Change-ID: 20260925-regcache-lifecycle-submit-74f366be0fbc
To: Mark Brown <broonie@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Liam R. Howlett" <liam@infradead.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, maple-tree@lists.infradead.org, 
 asahi@lists.linux.dev, Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1791117521; l=1215;
 i=michael.reeves077@gmail.com; s=fedora-20260918;
 h=from:subject:message-id;
 bh=zxQ062qio0+lCxbspHzHxGXHzh0Zgd+ekU5PisbC9JQ=;
 b=aLvjZRQXFqeKgA0yST2S/OUk8DNVjfWJFwjV5j8/bOuOphkj3zNmFFut2iFCF/P3FDUZE314x
 2mh/RakN5dQBdoHNu5Upl21ifeebKRCndbCmmsYg3ej1ylXGMtgrwT0
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
Changes in v2:
- Link to v1: https://lore.kernel.org/r/20260925-regcache-lifecycle-submit-v1-1-83b75ca79d96@gmail.com
- Make Maple cache teardown IRQ-safe.
- Fix debugfs ordering during cache teardown and reinitialization.
- Rebase onto the latest upstream tree.

---
Michael Reeves (2):
      regmap: Remove debugfs before cache teardown
      regmap: Drop map lock during cache init and exit

 drivers/base/regmap/regcache-maple.c |  5 +++--
 drivers/base/regmap/regcache.c       |  6 ------
 drivers/base/regmap/regmap-debugfs.c |  1 +
 drivers/base/regmap/regmap.c         | 15 +++++++++------
 4 files changed, 13 insertions(+), 14 deletions(-)
---
base-commit: 6addb4f385570ebc11c4eb499a4f1c149f313e84
change-id: 20260925-regcache-lifecycle-submit-74f366be0fbc

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>


