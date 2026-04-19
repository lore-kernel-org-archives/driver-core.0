Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B341A2571DD;
	Sun, 19 Apr 2026 21:54:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776635674; cv=none; b=dA+JWccRtHciKUlJAsy/gVvO+51KYMUevH+B6HSWqF2Xp/3dOydePuMJFsjT9eRJBkVJBOplKctQtyjz4CLpbHezXbTeSlGJlesz0H5FZT7e1wPDEH0yuw/Lf3AGtCFFGqshjW1I1h28ZoGt3rZWdV4+2Wury7CDqrRKaFelEUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776635674; c=relaxed/simple;
	bh=5JrbZvcfCH2ACW9a9Rnxm1N/fm7SKV8ILGMG1h+99I8=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=H7y3QB6RUG2h70aiLOxhqCZciAush2RBINxwP1KgcJjwdzxhGqaAQ1OYhwst8j9Ofshg6h1rKZ0OzcoPtFClfUVDG0gX70aqUjUAhJaKnLZFclB87yZpfnLPizo7ZbNTp1P8QlcXvC05cAU+9xglfzPB6Iv1OFCPn7BipOx52/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ns490ntn; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ns490ntn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6795BC2BCAF;
	Sun, 19 Apr 2026 21:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776635674;
	bh=5JrbZvcfCH2ACW9a9Rnxm1N/fm7SKV8ILGMG1h+99I8=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc:From;
	b=ns490ntndtY7A6/FeOWahkNCpOXBXYOFDHFOKJ9pqP3/MKqVvzqzWrSAVmoM14w6F
	 mp0riqibrzMo7FdPRfUOracV7YCTqrb2DwnCDtIKkS3AQygYDg6VWDX8bwPbuM7xTj
	 cgoDesCtGlsGoQYaj4xB/Cddvzj2MW0D64xBW0dKdvCRN5dmt0Xzto2TGxkpkowPgA
	 sZDQWWnbRL/oi/DPutwLeSP4uw7Ru4l4kZUeusnbSiAe6VNWICAF7/McXwgdKLMZXY
	 tkFrTvjupKV8mmgFOyVZd26eP5KuvA94UbGiERR5rqBww91CZYQbvJ/AhYRGBjiklv
	 Q602tbeO8V1YQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 030D3380CEFC;
	Sun, 19 Apr 2026 21:54:01 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.1-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DHX8VZYC4ZPZ.10EVXYC94K10Q@kernel.org>
References: <DHX8VZYC4ZPZ.10EVXYC94K10Q@kernel.org>
X-PR-Tracked-List-Id: <driver-core.lists.linux.dev>
X-PR-Tracked-Message-Id: <DHX8VZYC4ZPZ.10EVXYC94K10Q@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.1-rc1-2
X-PR-Tracked-Commit-Id: 5b484311507b5d403c1f7a45f6aa3778549e268b
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8c2bf4a2e5cb4b325e328cc8808858a68616067c
Message-Id: <177663563949.895827.4845155482165583337.pr-tracker-bot@kernel.org>
Date: Sun, 19 Apr 2026 21:53:59 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sun, 19 Apr 2026 17:43:18 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.1-rc1-2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8c2bf4a2e5cb4b325e328cc8808858a68616067c

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
