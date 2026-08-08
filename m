Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC2741BA9F;
	Sat,  8 Aug 2026 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786200731; cv=none; b=gO1Is9QfIgz7kp/eAEnNZKSwWhKlkgcll2vOquBRBhRO31cI6AxAjDeuviU6mwIu8hnBZwH5bMNVfIRDs0TPi3jqcl72FkmQ0ticv9V8nttEDpZPeI3RxE+JxV+QhpFljDzX2t22wFYA8Z+JNzUpNILDGF/+CpUYeh1Ko5hPKic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786200731; c=relaxed/simple;
	bh=njtiUvt9VOSNOUTNaf3sJDVjTcbJFgl20AxfaC6hHzk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=B2MxI70iNEs2PKw6+Olw/ryNOEb1l/zdWYmxxyw+b/X3ZSjjyUTNLEeBKexJGwzkHiqYhPPnsKwIp1obx6tcpEXeBF4zZAdDTningD0n1l1nghk86reAZuPcRTFCJAJiSFMSLflXaClAbAOQ98RR4QxSMcEzgIl7ca0RjZjGdcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dv4TaLg8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dv4TaLg8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D6821F000E9;
	Sat,  8 Aug 2026 14:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786200728;
	bh=QiePBBVErDH+yUV+/ek4BwBsTfzkb0I1bEJphchAxiA=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=dv4TaLg802ugAKtAyU0dxHV5xKP8slru3S/nmabq+lW+OwXGdvrkgsf33TvSoArR1
	 EfHx0OtrmuTO5VW9PBrglcL75/ms21FWAtSVmgbRqa9LyrrzgYIZpkz2ScgR8+k6sw
	 RwQHxsbMlM/nPCF1Yt954Fl1nLDnJ6pb8TC6/ZG6BY5ksktwdtclMPc7oDZtQbD4+2
	 I/OocTJdpsZnlGMfpLovF2IEiPe4Ay1CbsDnPPcuHrrqd0XgtJZH3Cz3UnhKi9RqQW
	 1JSJCHbNX22aR2G37eL3x/sNvScTqtNnyOSw5qI8kR4L/Q7XTK/hlB0n85KEE1TmoB
	 YhUXAZhtL8pCQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id D0CE6380CFEA;
	Sat,  8 Aug 2026 14:51:27 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.2-rc7
From: pr-tracker-bot@kernel.org
In-Reply-To: <DKJKQUUIZTWH.3KW3FBXD1831M@kernel.org>
References: <DKJKQUUIZTWH.3KW3FBXD1831M@kernel.org>
X-PR-Tracked-List-Id: <rust-for-linux.vger.kernel.org>
X-PR-Tracked-Message-Id: <DKJKQUUIZTWH.3KW3FBXD1831M@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.2-rc7
X-PR-Tracked-Commit-Id: f88db65aece9f9d26287b6377b7c7730ecf9f11a
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 361efac9e90e03d97e46743c49558466dd5b4bb6
Message-Id: <178620068648.2671154.15493748394029224290.pr-tracker-bot@kernel.org>
Date: Sat, 08 Aug 2026 14:51:26 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 08 Aug 2026 14:51:24 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.2-rc7

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/361efac9e90e03d97e46743c49558466dd5b4bb6

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
