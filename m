Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E641F136358;
	Sat, 24 Jan 2026 19:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769283837; cv=none; b=UtSeT1R7Y+iwaky38P+i0rmPw2RPhk1rGAn13dyY61TWCmTlFVyzNEzOwOpn/xorg/JyJ/4pnMl5nxkMdKvqm9R1krqSM33EmkFOCSkTNJ2MYxSOD8VESUB1wX4sNqz18vYMhfUt9f7OnHkSNKh0sf9iiml9V4c73q9t0LEJjj4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769283837; c=relaxed/simple;
	bh=ndR7EAzoNSa+05WA8Q0lmOjfIVyphmNxyYVTaKQdyAs=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=cy/jWp6C8vtu/Q4k9oMYCO1N5nyDT+yghRLGoF4g5IslQyyAc+NcPjBk/FAf1jyAUNZeeLbeUoUUmveGn9Qz/3Xn9g+dCkUOceseQxU93u3ehuo2irKo5VSFev18lMIYu5MOpZBeNBrzRBtSrKr4rO4MoL/rvnEMwDgysXTxqYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Wc93BrRk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Wc93BrRk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C8804C116D0;
	Sat, 24 Jan 2026 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769283836;
	bh=ndR7EAzoNSa+05WA8Q0lmOjfIVyphmNxyYVTaKQdyAs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=Wc93BrRkPPhThFSPbzI/1ijsAL+8uYotgPbYqexb2a+z481aQqruWiowYY8F0J+oq
	 9mzsuGkCxnT43BC2QQbYY6471aU0/28+S5+bK1nyK1tx43QdAQq9GUWAmyW2iyFvyX
	 isb3Dg4FFigKzQ8PL2Re6x/QAzhv4iAM0rx986unjanFwq36SRPp9/vRH6tR1lifqt
	 hG0ly2cN5M57Edp36VNdgxNFp7arB7ho63ZaEggm1014NRRGFhPrE0CS7zeW9KLBzN
	 +WLLZ0q0mRnFYGYrvywriAaGubpMUmb41ppyo3a+0VZNva/7E8kpKlW7hjJ0eXI5lq
	 G8KMochcztw2Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4EE48380820E;
	Sat, 24 Jan 2026 19:43:53 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 6.19-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <DFWVL46MM928.V9LOBRWI8BLZ@kernel.org>
References: <DFWVL46MM928.V9LOBRWI8BLZ@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DFWVL46MM928.V9LOBRWI8BLZ@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc7
X-PR-Tracked-Commit-Id: a995fe1a3aa78b7d06cc1cc7b6b8436c5e93b07f
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 5dbeeb268b63ea2d9795b3e5e8ffb48c236f5bb0
Message-Id: <176928383189.3355073.8552712992970781355.pr-tracker-bot@kernel.org>
Date: Sat, 24 Jan 2026 19:43:51 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 24 Jan 2026 15:05:54 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-6.19-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/5dbeeb268b63ea2d9795b3e5e8ffb48c236f5bb0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
