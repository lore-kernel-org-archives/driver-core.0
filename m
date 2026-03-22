Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D454937188A;
	Sun, 22 Mar 2026 18:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774202703; cv=none; b=O0qwbbh/PFGG6xWAD2FVZTCqfKjYVVT06ofAOAWFYPmbdNk5K+B2R4iWKpEw6awqM6vkMPtfSFejelvR4lJaUM1Naqg0YgtaDePLFcmZNrMfP7514V+hKJuBz2qkXxNLUgy1cb4zVhRf7ECTC0cep0Gx80W5C21v9RE1iWJ04cw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774202703; c=relaxed/simple;
	bh=+MoDhlcghGa+Mk1uEctk4FhMbcQlzbvAT9xZZqTqels=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=kU6oc6wXiM2PUsvGYT78SHvuE/FmtJZJ0ZJg5NUzeW06a2eGJTZ5hSGkkwX8niWLaIZNZ0I/GO+xUCiAMsbSaILnU19VFAc/GJyIR8lPruljIiEOT7GRBb3iISM1df3eKMcXJtdutMWUoF7veLpIAt0iPlmXVg6JW8AqTAVJ1Jo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=opOwyqkg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="opOwyqkg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B49EC19424;
	Sun, 22 Mar 2026 18:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774202703;
	bh=+MoDhlcghGa+Mk1uEctk4FhMbcQlzbvAT9xZZqTqels=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=opOwyqkgFN0mKI9e1ZrYASwSTfzuCK7EDm8loA5YpdK8Y5aeL4E5c6+wlc4Nw0fC2
	 YCvDdNVZOCu/PcK/LydBXI6iHsCgVhJi9sMV66fhnkSmSa3cGIhyKPLPhE3ZFp8B2F
	 j4BgHXvxkNb5AEefl5P9udDGUYJ43ZeKpimQLSPLIG0WNQ2UFTZO3J2cfhbKJhAz5E
	 kHPU7u20FnSm4Q8l5WPMQEotbij40bLeV/iAB28Y/WjbrOGdH5i5zqkdVablEYFwgc
	 yXF+DDz19xA5GOttQkgt42Orb/u/jqjPAyvdfMJH6cJmYxh+c7MNna/OvYPlaFR5EY
	 Pd9XYmdls8UaQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id BA1543808200;
	Sun, 22 Mar 2026 18:04:53 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.0-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
References: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
X-PR-Tracked-List-Id: <driver-core.lists.linux.dev>
X-PR-Tracked-Message-Id: <DH8TPX1KOFV0.1DHVOFVS0T87U@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc5
X-PR-Tracked-Commit-Id: 2b38efc05bf7a8568ec74bfffea0f5cfa62bc01d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: d723091c8c3e076bb53d52ec3d5a801d49f30caf
Message-Id: <177420269229.3161632.8750155664449245352.pr-tracker-bot@kernel.org>
Date: Sun, 22 Mar 2026 18:04:52 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 21 Mar 2026 23:46:06 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/d723091c8c3e076bb53d52ec3d5a801d49f30caf

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
