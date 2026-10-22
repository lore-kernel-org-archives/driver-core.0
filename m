Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792650742;
	b=zPWr5CevJbzUSb2X9bE2JBAvIdbvJHEU03eW7wasSLody9iJoPxPFZub77lR34dKVt/P
	 JHcRrsbBkhH9bSeKhG32LP+RQo0c6W5XaJUrR4/PKzqDGZ1vITX3BBoQYUJCc1iR6VdpC
	 L0qAKH2QCEtPE4LjGbECzRRL4e8ud4cHDRMmCJYUKmor2p+abMEn2ZPZfSkqrbaLGyehD
	 EvmlFvbJ03u94rRQhFNN+k/Kt+bv+CytoCLxmvtKtDWxQ5Q4N0J367tl27NceZoDbzi3p
	 HrRkyGY+QQ1D3/HtDuBWsyno4k9YAOGOYLLMSth0HMmclLrj2DxVUDFSDXwlzpVM1xA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792650742;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=/2wjiCU8oPOTUtWf1+f94Cf8orYq8inxalqB5rW0q4A=;
	b=a8wJNPlKsIJExnEHsrYP/weP81eC2O6sDiiPUDzs7jAP3rSwXELbgJWWEAguaFTDLrjv
	 n8wSUWtp16JrPKTMDY4dzs7dzHbSfXSgGiZ7B+YRAmY1WHUEwFOshZiWnK3mF1touqFRl
	 vGpOYQf2OEMcIrODaos8NNKCN+lmCVtQ0cP7h+tPBsHcywRZttELbZ6/r4L6cleDKupHG
	 5k+bM8jh0nGUhpzF9UAcKAOKZhydEb+p01eARko0qbaxTOY/qD1cFb7BE9LJelnN+aBz7
	 tkJ898hBbr4yWWX/yi4Ao+sDGw70RROsPesEzOIOZwEfTVvr+boeu6W2E/YkYCmUYww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2VIzZJU;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669D8606A319;
	Thu, 22 Oct 2026 06:32:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Y2VIzZJU
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A5461F000C1;
	Thu, 22 Oct 2026 06:32:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792650742;
	bh=/2wjiCU8oPOTUtWf1+f94Cf8orYq8inxalqB5rW0q4A=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=Y2VIzZJUKq8s+CQ9uN+pp9XNoCKED0FpT/bA914iORBD8aX7pHnxLuBSP6Q151CHN
	 KMzUJZ8/3vfwQNIIiHsvynFUvdEgm30X6A6ZRu1z+qll+CdQisSi5RVipL1wJCje+s
	 EjlaYz+MyOAS7WGIJZfNZ5gUrIlKBeLxLPOXadewjpnj3QpZR8rdAxnuiz89zPcxwk
	 slPM8S4BXNL8Tkq976cqTAggi+RDAUyXN18vdcAzttRBPGtdikf7ymcVbFTtwqfIoR
	 yECVDlXjFvLFVpKjXIHEIragk6HBvZv8yBVY52ySoHG4juUs50c0VW7APpE7rxpfRN
	 /PQDcASHztfEA==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id F171B380A964;
	Thu, 22 Oct 2026 06:32:21 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core changes for 7.4-rc1
From: pr-tracker-bot@kernel.org
In-Reply-To: <DM72ZY5B2CHK.3CEOSQUBXTAHQ@kernel.org>
References: <DM72ZY5B2CHK.3CEOSQUBXTAHQ@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DM72ZY5B2CHK.3CEOSQUBXTAHQ@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc1
X-PR-Tracked-Commit-Id: d4ffc4896b3e709c6a5d7e5a78a1fddfc774fa25
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614
Message-Id: <179265074060.1493177.6204456561249826893.pr-tracker-bot@kernel.org>
Date: Thu, 22 Oct 2026 06:32:20 +0000
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

The pull request you sent on Sat, 17 Oct 2026 13:36:54 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc1

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/7be4bc52fd9e0e55dc9a2e0232b89427d2c4b614

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
