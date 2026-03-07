Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3487371871;
	Sat,  7 Mar 2026 20:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772913641; cv=none; b=B6Ma/2m/bnKKql6zs8Rixw5hMKrKXL0ClLSs5M5SPGjCHm4cSmVLpa4du//FXNpK4qE3HA2o2F6S4VnmFexxkMiotZXCV7T6nZG0Pk3WW/PjVbK8jnS/dtpsgFYYJ5LyYmeWhw2h6DcTOFVuD9BanP2n4Z0QlNKmwDp89555vD4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772913641; c=relaxed/simple;
	bh=bEgfvSDK6EZfPlD34g9iWvziJGTeC0otflXs1x7RqLY=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=S8e1UOehoWVRNHzRnTYUVsH2e563Tl912D9wb1dSXJu/BDq+6UWOHkH3kUPU8+aUKX14YMbyExO6nofImkCOSLGBzKXY23Pb9nIwUaMtjhZ+ByMylkY1pwD0x5G8pmxHzlemEtUi2Gf50XLIGQiKKEmQz+EGILMTizSi0twexSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BqeefSX9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BqeefSX9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FE31C19422;
	Sat,  7 Mar 2026 20:00:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772913641;
	bh=bEgfvSDK6EZfPlD34g9iWvziJGTeC0otflXs1x7RqLY=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=BqeefSX9KUozKbeemOlKy+jmni+TjyEqiO9x9pPQxt/D9sSTJl9R3v9JJq+RNdVZh
	 p+J8k7vcxxoUesps/oSdgbIGdnxhIguTq9bL5TcwO60sq8Gahh4cfoPFkt8DFYEyta
	 jbBN+bhhjb0Cnk5WI6f7BjIAY1i1RKNpgS39I6uYreVI+kgflr6tkkg8yPWhFBoKSP
	 l/gLwVd/63c4G7+Dd5qzwDXHF9zzS2VO957F2IbBjJwPenHO4x8cHObHWUCiJvOrRD
	 l9a+KTn+9eXWtVpmwgg5raI7RItpJi2/uEVeUlfnoTcQOzdxuOZONqwSuGY2Ou6FSj
	 KtTVjXqb4/rKg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 7CFC63808200;
	Sat,  7 Mar 2026 20:00:41 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.0-rc3
From: pr-tracker-bot@kernel.org
In-Reply-To: <DGWIRQLTVEK8.24EJBMC8LDQWJ@kernel.org>
References: <DGWIRQLTVEK8.24EJBMC8LDQWJ@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DGWIRQLTVEK8.24EJBMC8LDQWJ@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc3
X-PR-Tracked-Commit-Id: 9de68394a61528d40f575c3e6719cc75c56f62c3
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: e33aafac04bdd8f03300651916386e296eb8020a
Message-Id: <177291364072.308260.7489950538108912515.pr-tracker-bot@kernel.org>
Date: Sat, 07 Mar 2026 20:00:40 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 07 Mar 2026 12:39:17 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.0-rc3

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/e33aafac04bdd8f03300651916386e296eb8020a

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
