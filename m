Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E7F503BE1;
	Sat,  5 Sep 2026 19:04:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635061; cv=none; b=KYQgB48/abORWAt0wn1Ld4krv0LXVTHkDseHKFqyWEa6Ij41q3FGl5zA/hR5miT5a4QYNIqGJlvfe1dxNyg8gkF6V+JlpD/0MW/CXaJLKh/+p67S1cSJF7iSqcxx0nBN8TS2U/Luu3Gt1ov5WaDJlR4jooJcLe/KRg6fsZyzo+o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635061; c=relaxed/simple;
	bh=3PKqR68qlAXpWYCDCsb2pa60Dq73qV795ShAArVg4og=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=ta5sJn6hXs6L37qEcAkaEsg1K2E6ySNfpbYqyeYmhiO8lP1IuPpvxueQEBZ+Rmwod3t4MlVEoGZe1b6wa75UO+KIF2zkWY7BARRSbzN1+0kWNyjPaC8iE2P0TzikgpmJCxJiKc/G2CmrOeD7seG2II576N7TWphQoQB1VzWzyXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VzwSflsn; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VzwSflsn"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D02F1F00A3A;
	Sat,  5 Sep 2026 19:04:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788635060;
	bh=aYEsHFPzEvoogHPMqIdbp+QL0E+vLvhu1+JQ8QWRANo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=VzwSflsnA09RUQgNsbDv3oaFOp8ICtx4u9W/A/ud+tknKqVIk95I3NSh6Vl/yWeK1
	 6lWOYPFc+yBUIjg/JToTfMdHVfFvhyM2RzYX9mG6f6SO+flh3kBDXFqM9ST7Eqc7GV
	 iOPMsUQ3/Hpj10w0HA5S2cqrCGSaa91Me/DiEuBGstBK3GvZ3gzFqY0dLiuNo876iW
	 uqtoN4fcDUZCeoHMsyhl+05T828Bs/reYCSqiREziyBUzZ226zG7rTQhRayldomrYX
	 49UQUV+DuE6F0OX2ZuBnRCR/6ajndDfzhcNsxVhwm0LmQCIUYWjIbTJ87mdg81ci7I
	 u4MZ84RUroKSA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0FA13924FED;
	Sat,  5 Sep 2026 19:03:21 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.3-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <DL7M1DO08S9L.H03E514TN2H2@kernel.org>
References: <DL7M1DO08S9L.H03E514TN2H2@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DL7M1DO08S9L.H03E514TN2H2@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.3-rc2
X-PR-Tracked-Commit-Id: f6d752278c13839888425294c110174fb6c87e3d
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 9f0346dcbea363787186c94ef94dd01aaa215afa
Message-Id: <178863500032.1324450.8181158385380881123.pr-tracker-bot@kernel.org>
Date: Sat, 05 Sep 2026 19:03:20 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, Tejun Heo <tj@kernel.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 05 Sep 2026 20:56:09 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.3-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/9f0346dcbea363787186c94ef94dd01aaa215afa

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
