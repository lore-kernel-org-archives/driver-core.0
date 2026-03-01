Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B83A2737E3;
	Sun,  1 Mar 2026 04:04:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772337863; cv=none; b=CXnhuEiLg7TqDvZ1HajGglzvoDjSi4Q30HIDSsHbU85wxxlt1bYcCveZbPmNUDtS+KohxOi9Yj2Dslhcya5GyvuiCiG46AHoVrvLW//1w79omqrnr/UHQu047hhpLjUkGwc9c8SwpPLr0aFN39qwNIwbOQvqNv12IittAIBySYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772337863; c=relaxed/simple;
	bh=I873bR1NnNvRQZkAmS/uVtcFrj3ycYPAOFBc61YTgbg=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=qkYGH5wSNoQesZw2bQ8566w0loihOAiAHqklUvAmrUMwDMZ6CD2XCqB2fDGgFeB2GqStwMOl7ZOyOeALW7r1Xb7NyRoE4ktTDWlV+kUPmcHOHVwAbAz5j1z/4dzMiRg/aRWGIBwBb5pnu+PsRKJ4spfWjE5F5r2GcGwSjB8/1h8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r/9DsQbX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r/9DsQbX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DB97C116C6;
	Sun,  1 Mar 2026 04:04:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772337863;
	bh=I873bR1NnNvRQZkAmS/uVtcFrj3ycYPAOFBc61YTgbg=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=r/9DsQbXcqiLiOqI374w/377OHpK1yU1bVI4TYSrXFc/ca4r5zrnobPYxw93b78yv
	 uQexBqGbf47PivIAtXGN2RRNByGhnrdBDP7kAJyRuOCOEM3LWoVWzcX2r216OMgMXH
	 HfOnG7beXtul7YDW8DpfzO8eN+FNj9EvFoRj5WI+gCgyP2Wf99RmREYYEn/8X/CcRA
	 0A0YURpKoJfr8QusEgo8zN1TVhwd4J2PAAZaHzNUpp/Fcd5xBJs5iHJdcj4NhiFWdC
	 KRWLW961pJ0PU63h3WuAzvgWv/l1s4fAcOcBnnZ0tHQ2fcxkJF3HxnEzgW6CNrNvMj
	 9z+j5z2GHwiNw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CEA139F202E;
	Sun,  1 Mar 2026 04:04:27 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.0-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <DGQW0ORGGBDG.2BEBG5GGS0NJG@kernel.org>
References: <DGQW0ORGGBDG.2BEBG5GGS0NJG@kernel.org>
X-PR-Tracked-List-Id: <driver-core.lists.linux.dev>
X-PR-Tracked-Message-Id: <DGQW0ORGGBDG.2BEBG5GGS0NJG@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc2
X-PR-Tracked-Commit-Id: 78437ab3b769f80526416570f60173c89858dd84
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 63a43faf6a68ce0045c874b32e60acac2089a41a
Message-Id: <177233786598.3243406.2729159051678646579.pr-tracker-bot@kernel.org>
Date: Sun, 01 Mar 2026 04:04:25 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 28 Feb 2026 21:46:13 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/63a43faf6a68ce0045c874b32e60acac2089a41a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
