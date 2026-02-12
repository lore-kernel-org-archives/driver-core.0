Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C0633EBF0C;
	Thu, 12 Feb 2026 03:58:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770868719; cv=none; b=oylPNcoYJfm/H9ow3sg7/+EqGqQUK5DQNo3PL5T2VUhR3pnLs0xCKA5Y8ecdEjA0cAJ2JTZHK24DDMorEz6QaZYbzlZW0LnEXycCLz6H4MiiIYe0KmAznR3O6G1wUOQZJUpc6N3HSHHsQfuuLAb5DqL0NYfu78J6r90Q3FC3ZpM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770868719; c=relaxed/simple;
	bh=xnNMOsTDCtLE4CdETGczZPyM2+341qh8R+bQBD1t8X8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=CV2ERxDf+PZBKcN3DHq+ASpA0UYuRQsYxs9oSdAN36UjHeiFoJnqlGgs+gXuxFvhH4rQQAHF9hflMWIR84Y4am+/dL8PfX4RRapT9PCKEcjYU2BxDFlQu55wZRGEEcJ/f93q7zgrUhr5Rf72d4t7NmE/bckmAEXqYPwNLiCPjlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOXPAL9X; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOXPAL9X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EE6DC19424;
	Thu, 12 Feb 2026 03:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770868719;
	bh=xnNMOsTDCtLE4CdETGczZPyM2+341qh8R+bQBD1t8X8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=SOXPAL9Xcdt5xwZ5Hj1fIAnwjWQjmBqYI6G4eHmIQbF0XW6b882O4GapoedcfoVDR
	 Yt67hr3gB0mpLW2u85MckeO4d564qwv6HtNwna0vj1ZwnBTZXSuowHg2cTjuPymhT1
	 ZZhe80MicloNpi7D//wEeSLMFWa9o8VrDhK2DtXIs20jw3X6huhjY9xB7Kas8G62MO
	 rNC4+MA0+ZLF41BUnbtCwKnF9s4zS79aAkYE77Cs1CYXiJ+CiGFSzCVvdxLcFljfpO
	 fbdRsmGAR5/kbcIubZwJ/KBT/Udq5zcqeSOi2lshnHNKs1El1vAC9ZmZGw0QEKASk6
	 Oxpm7hTJGR7UQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4838E39EF966;
	Thu, 12 Feb 2026 03:58:35 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc1
X-PR-Tracked-Commit-Id: ba268514ea14b44570030e8ed2aef92a38679e85
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c6e62d002b7f0613f02d8707c80f2a7bd66808a0
Message-Id: <177086871398.893578.12813280577174864290.pr-tracker-bot@kernel.org>
Date: Thu, 12 Feb 2026 03:58:33 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Thu, 12 Feb 2026 00:04:46 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c6e62d002b7f0613f02d8707c80f2a7bd66808a0

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
