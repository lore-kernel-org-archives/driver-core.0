Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BE6F378D71;
	Wed, 19 Aug 2026 18:41:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787164862; cv=none; b=evHJpeCRm7APVHUgBK0/HWGwDTtzcKdNEpl+HzWBbz0JO+rEAKZCnG9ule/D2E32v8yzqxSQ5GN8AC7IzEGPzFe9LjIUBJEk0nhGlcV9X9yjNNAIeQ0wLRSipWJEVUNXCE1t5Xc0lVyPWeSaWUUCYrHTocloB6Zj89LOZrQhGTg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787164862; c=relaxed/simple;
	bh=VBBPBUx9/TYkJrJ31UGHmJ1dxR/jerS0bSBpXpz/xfI=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=iWydtIRUaNk4W+tWeoyM4+1uq/vCrWlEAb+Xji/82ePDisTD2dmwt8tgg0RDVOKmcdHQQZqHJGKf3N0P0dMiPcMi7Rq3ejwrh0BO6PMP+9ktSzvRCXZNlBLLpJNzszjuUygFMXcIrTpuYbGoa5fW3/yUbAQbVE/uSgPyqj9Rdy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P/rz1/Z5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P/rz1/Z5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CC41F000E9;
	Wed, 19 Aug 2026 18:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787164860;
	bh=QVYHb95vU8nHMWZMZANlCetvpriksu8SZD4z9RAYORU=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=P/rz1/Z5POj9C9JG3ZMPiOoPU8ObX2/n7xqMbfXswuB5rx17xAMdum5cmlGO3S1Uv
	 JYueK9YSmSoi4V2LdALGMc/zUc+SUZgBPDusFrAthBB1MN7KDkItoP5nXi0j+cIWP+
	 f0d1e5BmGe+T8/GSslLCLFY19wx2RB6gg2pTo/BHaOGtSWfKfmClOeNktlOTJ+B8RC
	 ig1Y252LtG6joPTAWCTpEVw2iPstrXdJc8ZzbA2xIE6tGFCB0tx7MxDElfYAA1kgJg
	 7t7zKyQV0yTtk7E9hrU3Hk/KDIel3RqE1voRLlDgU7iZrNYBR4++V8mMzs8Fh9zlei
	 njU0PyT0fgK2A==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 93BBD38119FF;
	Wed, 19 Aug 2026 18:40:12 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core changes for 7.3-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DKSB95C4BVQB.3V84CCMB2WN8G@kernel.org>
References: <DKSB95C4BVQB.3V84CCMB2WN8G@kernel.org>
X-PR-Tracked-List-Id: <driver-core.lists.linux.dev>
X-PR-Tracked-Message-Id: <DKSB95C4BVQB.3V84CCMB2WN8G@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.3-rc1
X-PR-Tracked-Commit-Id: 3b5ea0f078e1b72276e99c237f3dfc2fd72938bb
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 59e6295fac26b8e85c1ea859cdd89fa1e47519d7
Message-Id: <178716481128.3644097.10256421880465319519.pr-tracker-bot@kernel.org>
Date: Wed, 19 Aug 2026 18:40:11 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Tue, 18 Aug 2026 21:19:06 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.3-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/59e6295fac26b8e85c1ea859cdd89fa1e47519d7

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
