Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D0A42E013;
	Sun, 27 Sep 2026 19:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790538552; cv=none; b=G/VVfWiK51NWjolxlDShO1Bq4VcdxS0DSaftKVqAtU4ETcSytcayYcW5MjnQmMRc3N55VWsd0CV03nQ5KFmugwgEe4O6PobWyfc8DE8hzGwCFrPh2oeKzZzbWJZwTy3tOxuaz9SHJvuLChJjWNWTCjjCoUhPVCB7pDDpugrixTs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790538552; c=relaxed/simple;
	bh=GwOySFet2MlbL4kh4RhIE/oAp2AR+r/c9H2tgNObVY4=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ub5Xz1fB9EatCffUF3DxlgZh+KMolZcyoYA3gz2qVVPDaGO7sC96Vn9vRvKICU9DccVeWsD7Asc7tt2ZkN+KlSG9IeMPH2za9EtsabH8WmS1aWPrZ0KZUgLITug5rrFLItfGG0BvxlLsaOPHhLMCoF/hghq49u1aB9rQ/+U477w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dXNI4ulT; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dXNI4ulT"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D98E31F000FF;
	Sun, 27 Sep 2026 19:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790538550;
	bh=cSmpWtwq0ca04AIwTLwpyfbwWnVhpW22aCYvTKTg1J0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dXNI4ulTU2Vs4vYHsYTQ8Y6DlfRPoF9EYfk4F4DdFb5nxo8EtvqFN+4evoW9zrjGX
	 K8XOZ/W0dfxb6poGEP9UfbiOHSR1e4YqA4fTJpJq1YOsiKqHH9rbh2EcsRsUbLqJDF
	 10cw47V7RcAYR7Fts+2d29RpDrrSOq5CP/6dBvXi9kNUhLXhP/NWXRvbr1f/bRVtiJ
	 5k27YitkDw9lLtaiXyiwfsKhX1I2YKKt0gdbalnkjAug5MtZ4pidMiF2aQHm77vZVp
	 wqOhEurBQKG35gTAtHYUIKzYVRQoErSfca2YjGIH9YMQCSgBc0ovuhapFQWvICgH9n
	 AYKVXPnWVzJaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id B8B3B380AA5F;
	Sun, 27 Sep 2026 19:47:57 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.3-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <DLQ5OCF91IVM.1KEJWJ4BPRT27@kernel.org>
References: <DLQ5OCF91IVM.1KEJWJ4BPRT27@kernel.org>
X-PR-Tracked-List-Id: <driver-core.lists.linux.dev>
X-PR-Tracked-Message-Id: <DLQ5OCF91IVM.1KEJWJ4BPRT27@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.3-rc5
X-PR-Tracked-Commit-Id: 77be3641f3e3a56e42a5ed889372ef395a933f3c
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d266640c6c760c9bc215bf5a3ece122ca488b6f5
Message-Id: <179053847637.2777566.13740034313370143568.pr-tracker-bot@kernel.org>
Date: Sun, 27 Sep 2026 19:47:56 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 27 Sep 2026 16:07:29 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.3-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d266640c6c760c9bc215bf5a3ece122ca488b6f5

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
