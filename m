Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794781772;
	b=oajzxy7QiJ9iTz7qFsRJWNxqYi+Xt8F6hQ7RvulVQna+BgtTcJ8nRY8+0BFcnO6Nqwju
	 sd0e2c9KOCVSo2QsdLhT0+B1XIXtcjbH6MUVF1afrUoKQ1gfYBfsrWG+CWdLXfs6n1v82
	 +jCQ8YX90ea/gS+RHj8tSLWm/BBa2Os7+m2BZXyJiilM6k1zZjlAoBwbQZHkBEyXyNchK
	 orBHym8CGsdTq+MT7PYNCN9gF0wUZAXpLDSnTIRCQjZdGtB4biyGBfLPspW7ebslWSTvt
	 jP9/X3GRxiyeKM7CtJ2rxN0oLcpCD3mCJq0trlg5WwTNbGdGWhCGj7affnaHAC4GRDg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794781772;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=gMr8x9gc3sp4Q2OpeaIplM0+Fu2/2dfaK+mGTIxMP6U=;
	b=T5BmiS9blaB+DYpxlf3AXfMLjysnpfZ3hz7SLRooh6pxH2h/fxdqKaQR0FkGegeWH6XQ
	 3oYR1/J8YCdUR3mQBAgo7m52UbitmZlBdGObGk8cLgVajcasfSyHM3OsptPT1ir7TUF9G
	 NXhjVxtniWm/SijjOk/kLilr58bP8+DzRjveyEyJ/CYOt8r+1Y1zFwREpm64qeqWuMl+r
	 cJEEvd0AKBQRzZbhtZVBGxI6SJhBvf2t833JDVnNA+EtuFaRnkT2pcTj1MsE9P/NPbd5G
	 FKLUk2cC1NIqVV4yIHkQuB+ZhbL6lBkofqHGV/zujt3KV+6GNn0Gn9wF0rS+nuUs61g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyErgccL;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 084D1606A332;
	Sun, 15 Nov 2026 22:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YyErgccL
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 81C6E1F000C6;
	Sun, 15 Nov 2026 22:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794781771;
	bh=gMr8x9gc3sp4Q2OpeaIplM0+Fu2/2dfaK+mGTIxMP6U=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=YyErgccLM+YOPVd4Lp4tZGcEtMCpdtOU8K0ZY42tRYKzTYqdo0sgdbAdyJ/XfyzTW
	 xM3xBXP8G63LJFkNI5wJC7X5WGtfesUTAdPCgudsp9Ibmaxn5OuefLBeav9zSZNMnu
	 vpr9X0mXfB5yg5QQbVZk8d+zuDKR6QbtLundNTk9bdfLUXtwKlLO8Zk3DorKORYkb1
	 zIIQ4FMdINaCbUi4YlVg9R8oRI44tounvqLWOg/1+kuavvjRkabYRQlqF0Q3vd7JiE
	 25iuQaljTu6KHOFcjZhuXBL4FVziX7mxNiWJAejwxffgNGoy9DskTnsRg1vTXBvemm
	 XzZ6euL9mTswQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 773D9380823F;
	Sun, 15 Nov 2026 22:29:31 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.4-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <DMVSYA69PH77.2CG5RXFA0OOZQ@kernel.org>
References: <DMVSYA69PH77.2CG5RXFA0OOZQ@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DMVSYA69PH77.2CG5RXFA0OOZQ@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc3
X-PR-Tracked-Commit-Id: f8623ce596492d2e96ca57eeec992938d3d79f00
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7893d906220694e2c8a13dfb52ec85b853cbbf7b
Message-Id: <179478176998.2784423.13283150015262548802.pr-tracker-bot@kernel.org>
Date: Sun, 15 Nov 2026 22:29:29 +0000
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

The pull request you sent on Sun, 15 Nov 2026 14:01:11 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7893d906220694e2c8a13dfb52ec85b853cbbf7b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
