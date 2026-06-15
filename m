Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B2322C08DC;
	Mon, 15 Jun 2026 07:52:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781509928; cv=none; b=hq9Y8NnYgV2puNRIFrRqBMgiqWC4ENfFH60OlfyYXOVqE56uNSv2YuEmLYw+yb3lyL0E5wQmYm0GHpJXC6aIxU4ojt7gfy62pCCCcTfdIIWJKi7oyAOOFyoMWNMVhpz8xpVAeZ5eiqaTc/Z4s05V+unL/1Y58a3CAP+oWAWTjbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781509928; c=relaxed/simple;
	bh=xM4RGtLhGxMepYfedE2bLSBnHM6tvfxnZXnKzAWKTXE=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=QqXet6n4/jUKZ2n0M6Ja2IRUKHW12VpjMUP91oaIDw6b1Vk01ffaj+JSoJaqh2bfk9Nmwduxa2wdcRs+zgO1Ubgh9uJ7lFWeZsu6Y3ihpgXoG3aFDb2W9+lkvhoy78h1sM94V6pNupGXaYQ2JKhzxMyJZKFafNi1ZzwSVhhrmPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aRYknlOa; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aRYknlOa"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A0B01F000E9;
	Mon, 15 Jun 2026 07:52:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781509927;
	bh=ELWNPaWIom4kZ+k+ANS7ljYFf1fiXcy9P0JlK1CSuRo=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=aRYknlOaicYhnJOgooLS13vGb6m83dOUwCFBk93URP6hXV3cudFoii9ayPKrUucSK
	 sFv5/bYlAPyyUya4yq4dXxvnLCD+pJ11K7kvmeOtbrFI9hmTcMpeXEw+yfNXB/NXpC
	 lASB58eMoiT2svSwq69FhdsV5ganTnSIdz2qVtQ5i8NzoM9PcjWSDjjvQTjJ30glK7
	 ubODGKxXpdcoOqdhJxEJ80/Pf0XV75HHN0TW2twhuBcAXWlC+Xx80Cvuexl6cwY1hU
	 rtwd6IMQ8TRUP04S5aA1gLmFtraAEiC5mWlxUQxJgUnL83vjiOEb9Wx/FWtFNH/Hwy
	 7tiUm1jWuJVRw==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939F73A56756;
	Mon, 15 Jun 2026 07:52:03 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core changes for 7.2-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DJ84318BOPGD.25U77KZQOCNFP@kernel.org>
References: <DJ84318BOPGD.25U77KZQOCNFP@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DJ84318BOPGD.25U77KZQOCNFP@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.2-rc1
X-PR-Tracked-Commit-Id: fe221742e388bea3f5856b5d9b2cb0a037020ea4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 36808d5e983985bbda87e01059cccc071fe3ec8d
Message-Id: <178150992228.2920647.9766311643827080878.pr-tracker-bot@kernel.org>
Date: Mon, 15 Jun 2026 07:52:02 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 13 Jun 2026 19:52:42 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.2-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/36808d5e983985bbda87e01059cccc071fe3ec8d

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
