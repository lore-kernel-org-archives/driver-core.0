Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793035512;
	b=NfKCIc9hmqV5kfrSuK9dLbZ64oyXE2d+GbT93tbwXGbC8A8AmJgoARVnTB8EF0WEsDk2
	 3x1L8EePENhIooSZhYCcpD1tMZAMiNyNU1hoxGbgqsVmVkSZYpxF20a0EhkIz3755dwRe
	 27q2ztiPWZVoI0ZjGpelwkGP3TbjOPr4juzID4FHo6agmmR0ogygZODQ2D4A6dAjEEjHx
	 bAljx1dnwj7KMilIquNrwJSgaVuLXALkS3tzwHw+H62NN4UbnFYcahIaWOfexDDtnNleq
	 d0TLLYlfvHftDEQ3VQvr3ZnqXtpVPuWOWoWzhF2fmzXSTXRR3CzepHXrH0ZulIELrmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793035512;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=Ve1em0WUiVhfs92cCJj6cPFNkzrHbV84VQlCPQJkvMM=;
	b=MYzAID/MSIefIdBUGjuxQ8/tvBg9T3dRRscBzvFurYdTPzCkIqCSM/iIPlR9ON4NC7KU
	 uZq6tA2ousn0ZpBUBnUvx77phzB8oAJAvdI45jN7PpWRHrjLEUWoeZZrhCiH5TUTaT44U
	 anynCvf+TG3J/vn/wfh4jmfaer2ifTYSVtNCCtmdbY9Lz8ejslXrB2cHTyfUeeD3/KUrB
	 1LzuZ0LHCT7g11nBXqmrGmkv5o3ukOxpTLlXB7ISOxIDBk8Dpmjc9DQiXjL7ZAdiuIsa7
	 k2UjYkpzRkCyDwg47B8BwSuPa7uQKd08BA95WVFaOD82N8l5fHWZCjmzSyQ76UoGQMg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mtu0qkvl;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D85E606A33F;
	Mon, 26 Oct 2026 17:25:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Mtu0qkvl
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B98F1F01825;
	Mon, 26 Oct 2026 17:25:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793035511;
	bh=Ve1em0WUiVhfs92cCJj6cPFNkzrHbV84VQlCPQJkvMM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Mtu0qkvlQ2Jnu5/RI63xZMZCEEUoukWGl+wppoGptPvYNNEoHHNIrX6Jy3JVmv9hs
	 z2Dp1gtR4eTQfVvztZWsknh2KIz5zA5tjRymx/B+FLvzRn9m/UTc+vHrNaamrGvz46
	 w24s0yeJVnswGGb0lw0p2tJ2xweknr/+Q7hUoOVK+06DDruHSKf27aaF/WTsCIpo0m
	 z9s16zFPvqp9bWj7ToHPObLRWQqtrfKBDamhF3g08wh3ndPiDsvPT0erWgfK8Qk0R3
	 rDcIHO+Qs7SwJgqfffymbI2NSEK78Ytq8YixFxzjLhbY8ebTTev/DC/tTrns4Bztnl
	 gN+PKHHGl4YxQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 816883AA58BF;
	Mon, 26 Oct 2026 17:25:11 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DME7288WXCGZ.1XSS13X4IVJ5W@kernel.org>
References: <DME7288WXCGZ.1XSS13X4IVJ5W@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DME7288WXCGZ.1XSS13X4IVJ5W@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc1-2
X-PR-Tracked-Commit-Id: 187a62f99da29b1a55602b0d401a783d8dc86161
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 0cc3ad8f4d2e2009c2005278c754caf7c07fe0a4
Message-Id: <179303551017.3291751.18363392359285544875.pr-tracker-bot@kernel.org>
Date: Mon, 26 Oct 2026 17:25:10 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, linux-usb@vger.kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Sun, 25 Oct 2026 21:16:37 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/0cc3ad8f4d2e2009c2005278c754caf7c07fe0a4

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
