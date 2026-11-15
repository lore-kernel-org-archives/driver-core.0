Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794747675;
	b=AkSrcROkpQ0mXPrGhrUChQpegDMHNR1/2SGSMMAQXBrj4VQQgkkFBs/lZ6dkx+2PHZIo
	 FGaIi0HS4DJSlJl+UJB94H46/2a+YxPMfrCOqq+gmecrcXJlslBSgsi48xhbvjysg9nZ/
	 skiXu2nT1c96LcxVZnGfR2gXoP8Alq20DpYV2mknOXYOLnvaLNJHC7b78VytaU9G5e0uz
	 fmXTruAOlQnMRo1O7HHL9P07GVadM2NZ8cZbqUWUMHa3N96sZHDt49gAIkFNzGeX6RlgR
	 Zbc2Ubvdc43W4dnNnqj6W85oAgSrLzfTrsxlv3RCjGlkHxOL7oK2nf2H2I5PF2FYHdw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794747675;
	h=Received:DKIM-Signature:Content-Type:Date:Message-Id:Subject:Cc:To:
	 From:Mime-Version:Content-Transfer-Encoding:X-Mailer:X-TUID;
	bh=mM72r9bgeUhuALLlO0ST4vStkW2ccfAXLBKu9Hx1vwM=;
	b=TRAt27UI3XsopKVkel18BW1isqA/GBLojjsPwyR+7w0RmVq2tBVNmiaJmiaEQwSK57p0
	 59XlUtuQCk+2zrb7ooPsNObk72tOg/v6o220v+IZv7KT7/bB1+qGPs52if9341ihY3Ex6
	 w8CZ2PKlR5M0PveM9DeCYd+CP6KbjkLvjY9ZL6TABo9zTmfRysp/4C+dZJnguWCAlsdth
	 GZzV9JMGWt7mUSW7aUVO/TN7RfisirrWosAO54pb2VdR33/Z1rsHa/PrWXWpElX/nu0qn
	 RG+u1YKBG7VvG9PCC6N2afgL7JXYCG0nGgfizJnowGoeqMekmE/R0+KPWkOYe8eZNzg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f512kerf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B3D606A31A;
	Sun, 15 Nov 2026 13:01:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=f512kerf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92F31F000C4;
	Sun, 15 Nov 2026 13:01:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794747675;
	bh=mM72r9bgeUhuALLlO0ST4vStkW2ccfAXLBKu9Hx1vwM=;
	h=Date:Subject:Cc:To:From;
	b=f512kerfxMj1JK5TCR+RC1Ib3VJMr7m1iIf51mLVg5JO6jtKg2f/u4TEsygEiZlOn
	 6+us36Z4gfpTne37zZYzgrleZzGolPPoquW5EkiCa/01sdfue5PrmMrXNiIS/9myjr
	 aFd/BBdYllqWRKcyncxqnSdPCcKmSK3M/5d0nXJMQ0hOAMbp7bFSds3Ao4jUl96JPK
	 ICkCKVS+UQUOFt4dz6uag5sV4Qbh9HIdANyH8hLFEqRIh2Zql4VKJVk7Fo9gE7obxJ
	 3cAFum2JauGUul0hwnNtRNxBihKcTFDzDP9ocupTgdBKQ5i5+cPmcXq28jHQWqSCHe
	 3D9K2RjlrVbgA==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 15 Nov 2026 14:01:11 +0100
Message-Id: <DMVSYA69PH77.2CG5RXFA0OOZQ@kernel.org>
Subject: [GIT PULL] Driver core fixes for 7.4-rc3
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Johan Hovold" <johan@kernel.org>, "Saravana Kannan"
 <saravanak@kernel.org>, "Andrew Morton" <akpm@linux-foundation.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
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

Please pull this driver-core fix.

Thanks,
Danilo

The following changes since commit 7475ea8b58616b33c04afb976cf0fbaad9dd63fb=
:

  Linux 7.4-rc2 (2026-11-08 16:22:20 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git=
 tags/driver-core-7.4-rc3

for you to fetch changes up to f8623ce596492d2e96ca57eeec992938d3d79f00:

  software node: only let the owner release a managed node (2026-11-09 16:4=
2:51 +0100)

----------------------------------------------------------------
Driver core fixes for v7.4-rc3

- Fix a use-after-free during device removal when a child device reuses
  its parent's managed software node (affecting Xe)

----------------------------------------------------------------
Bartosz Golaszewski (1):
      software node: only let the owner release a managed node

 drivers/base/swnode.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)
