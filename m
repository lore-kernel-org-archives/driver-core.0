Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A11D175801;
	Tue, 14 Apr 2026 03:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776136207; cv=none; b=d6Ei15pX8bvddi37DIKcBYpu8yo/ZHlZdz2mZWpbhbqe1Rf80/4BzSei/mKhZKEiS0HPXyqOeZFpyOBnoqa4CPr/ZsvxuPosJ+khFmpipiYA9JzMiNGrEFpmPPaWqeNKmC6dmMDYU0TtXmSNeUvdS8NFqclZqLq1kbH9USTMdDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776136207; c=relaxed/simple;
	bh=MJsT4MfJhbqAIu4yj/U8w/jjS/r1pHj0oc9glhHfzgM=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=tiMDZ/OtI1vmgHTILC+kIzgTWMKeRf+uV2W1RprPRi9CPN0lCQYER8nY3Zkg5AoJF7D8gHZVq9Bi338miMGy9W4kRtoLeiXql4kq0OpC2Ium1cpq2EGEz4L8enoYd2fRvVFPT1tjwkJTSEqIPV65GLOmJhuh6+/lgkgZ9cpCqUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k2MD/Ewz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k2MD/Ewz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B877C2BCAF;
	Tue, 14 Apr 2026 03:10:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776136207;
	bh=MJsT4MfJhbqAIu4yj/U8w/jjS/r1pHj0oc9glhHfzgM=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=k2MD/EwzSk1DBc1PMzDqD1Ic/JsLY8MaKr2L5SplV57gVp+aK6hqChnEAc9loH9BV
	 t2gELIEPDSpbBw268CHEk1HlIh4Z4I2xJHVTsydeHqk25vuPcXjNYZEhiqNqCKA0uK
	 K8wMbXMcqATg6kV5RQdSVJ6GWVSSmrGiCADRjbtZi7CVwwLCJGYRi6JEPIs0FB+9Rg
	 veukU4NHWfghetoFTtGXSO98r5FP3ukfT7k/yRm8QIkQs2OoKT6mQSCjt5+YvBUbbi
	 1ka4sOBD0bS6XSMCIq0RgMEWZHnn40EeWfiNzSKDKBI9aPsDHFkXb2+yNAaAD4QiNl
	 SbuKvHq1wBVfw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA4D83809A0B;
	Tue, 14 Apr 2026 03:09:39 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core changes for 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DHPWC2SXSROE.1RM1PTZNOC627@kernel.org>
References: <DHPWC2SXSROE.1RM1PTZNOC627@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DHPWC2SXSROE.1RM1PTZNOC627@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.1-rc1
X-PR-Tracked-Commit-Id: 6c8dfb0362732bf1e4829867a2a5239fedc592d0
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 4793dae01f47754e288cdbb3a22581cac2317f2b
Message-Id: <177613617837.668097.10657290112866955393.pr-tracker-bot@kernel.org>
Date: Tue, 14 Apr 2026 03:09:38 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 11 Apr 2026 02:24:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.1-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/4793dae01f47754e288cdbb3a22581cac2317f2b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
