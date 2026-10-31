Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793407241;
	b=mLB6S3VyuUD2OcJf63VKk7ZE6kA6WVK5M4P9j3ImTWjcLajiGVupVx6nFudfNFY4iPwD
	 9IDmZ+nq3kiXageQKJUTPYIsa6ckdIk8Edy35e5hk/1V5kb1q4SwpTUgSzWxEJiEhlMXV
	 UQTCFe1A9fVpXH3TfDAkMK6bgdCUb/S2wIxqh5WwzIUFC9FahT106XhvIVLJ1NyAqjvMO
	 h1gaWJ2apKexxJNwJ4eo4sTNU3NChvr4KtsDsNXL85xEx6d+2Uv9BkI5yAV/lcg9lQncQ
	 PbgU05uZDEi5lu/kYK3StbC+77lOrZvM3B5Wm2vcuGne3OJxH0fouzRwSz1/RFUdapA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793407241;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=XIrVq3kPI22LYKRdffakTBUEt4uVyLiadT26NI5zzpI=;
	b=sYZngUKaGt92tdTCIz5K3N0QnWE9Fa0UTz9vRZBqWLvRqLVa2T9eodZb4fDdFD3qdt+n
	 TJLITLwHGFmVj9C9Q48fiA2tzG1Te7BWo5joMk7pC1xShyS3vpD8EdHrl9T3aRcH3GI9H
	 Y//iEaKJ6B8cgU3/gqOszB/MY4rL+8bDL3d2bBXMp76FdaHFRw2k2+IjP2QzHrAlEMDvg
	 sbO1dwyadSjvlH3obF298D/LsDILGC3koJmFDA93In2CVbAz29x15nVzKQ+OMy/gdKKm+
	 Z0T9YbCmgFyYZgEvAvCzeYvkafmMlFsodmzbsYq/vpVpBWc8y6bbEoSh+XZdfNfn6SA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX3MoHCf;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FC01606A31A;
	Sat, 31 Oct 2026 00:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AX3MoHCf
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ECE851F000C1;
	Sat, 31 Oct 2026 00:40:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793407241;
	bh=XIrVq3kPI22LYKRdffakTBUEt4uVyLiadT26NI5zzpI=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=AX3MoHCf8a9hVc2/9WbzlY4QtvFg2jKU99S+Z9C6rudeTsWapcFTXif7g3Aww18Vd
	 EVi3ptb3y3swvDwzIqdIQPLp9zMrJkAP7NDWG3dlXSHPKsMsk+xNUWN3CpPuk/Xp4o
	 8gI9SQxv5LveUcfSdl78GFfcZspvMU9e/OBtXh2wZ2hOjlI4g93xLKUSlH7yXcWXvt
	 E1/zOBFCDDlndJRha0MR2J5Q2yv0qwHfhAP7qbO9HEVNePNsDWqf70QAf2dk5pTkWm
	 ne7VttT8rXWDFtzt+43bmQ2p1Dak88PH4od4eHqKmea+oWN6N88HGLLO6tUzByGrJH
	 zE5GZ6OBBvn4w==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BCDD03800478;
	Sat, 31 Oct 2026 00:40:40 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.4-rc1 (2nd)
From: pr-tracker-bot@kernel.org
In-Reply-To: <DMIL3FNP8HDY.3K2425TJD0OU2@kernel.org>
References: <DMIL3FNP8HDY.3K2425TJD0OU2@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DMIL3FNP8HDY.3K2425TJD0OU2@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc1-3
X-PR-Tracked-Commit-Id: a287f97d4256b5f5527f5b5a54f8ada55e1482c7
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 2a500a04d6f969318c05f46aedb6e73fc1963a00
Message-Id: <179340723942.1872657.5495369132087270175.pr-tracker-bot@kernel.org>
Date: Sat, 31 Oct 2026 00:40:39 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list

The pull request you sent on Sat, 31 Oct 2026 01:07:07 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc1-3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/2a500a04d6f969318c05f46aedb6e73fc1963a00

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
