Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 191CA31985D;
	Sat, 23 May 2026 16:23:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779553428; cv=none; b=MmyNyW4cjJ88OBNth+1wo8xB9WGIuh9G6B8ramNEqYwaacCsMnrmftdn6A30Acn7GGpQc8EAh5k3ZGw3esMW+ZczHJ/FAnUuAeZO0ZjF/j4rLqBBNnhMfdKP6i6zLMh94kwcmcdHUOst5E36rJmPoYzfL4RFxt7ynRRXzAIpSFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779553428; c=relaxed/simple;
	bh=tSOWgMwDVjShGtERniyIBCXDGv/+7DG2jLhfKNM4OLk=;
	h=Subject:From:In-Reply-To:References:Message-Id:Date:To:Cc; b=NkelCSko10nsnx1dknwf9y9b52vWyVYCjWgATynge7bqRKRKTreJesCce+Z5yB8a5y9tqrJbtxd99WSeWYvoGE0flMB9mwhVweDq4WyEBLx/R5bGrHgSSaGMT/bI2+i2Pu3uXhWSoALRiyvgktFyGIYg24RZD17q+0OITtTWgyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NMbug3SX; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NMbug3SX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F31E71F00A3A;
	Sat, 23 May 2026 16:23:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779553427;
	bh=Ws82LlOxo/G2lT5W33XdEyyC9kFnuVv1WDGI+3JBRU0=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=NMbug3SXbdWOn5tk26MB0ZI7sxI6pKY3iSMIq+2OFyxkRwTTkUY6U0kLpMLJKvKDo
	 ioDiqDE/eShSmGiVQ2b+Ne5UF6YzlfTyhetSnLdIbZk+wyBPE7/llV4BuZ0UxkycO/
	 POAihVk91S0OQuBRVAdZqqr8/2K4jWVSxgfAe+lVmJIwSLCmbcQ1Rbf6XZ03xAI2Vt
	 JykzpuCPODBMkn0Oiwy/0xALQIxsVf0H/ZWGPUwAlQFmK5zRvFdwL154oQCx8XsrEW
	 mR3UV3zZC53Emz9S3LPvHTRBZqiTPt8VsJR8PRMrcxcHj0zxmdu3GG+nw504W517yh
	 D0SSBwNiyLr+Q==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 939DC3808205;
	Sat, 23 May 2026 16:23:56 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.1-rc5
From: pr-tracker-bot@kernel.org
In-Reply-To: <DIQ2X70CYYKK.W7Q958FP7DBO@kernel.org>
References: <DIQ2X70CYYKK.W7Q958FP7DBO@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DIQ2X70CYYKK.W7Q958FP7DBO@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.1-rc5
X-PR-Tracked-Commit-Id: 215c90ee656114f5e8c32408228d97082f8e0eef
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: c8561c73b4a8669bb13c57a5853318cd02655f9b
Message-Id: <177955343514.1611769.3624788145670672509.pr-tracker-bot@kernel.org>
Date: Sat, 23 May 2026 16:23:55 +0000
To: Danilo Krummrich <dakr@kernel.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Saravana Kannan <saravanak@kernel.org>, Andrew
 Morton <akpm@linux-foundation.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>

The pull request you sent on Sat, 23 May 2026 15:10:04 +0200:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.1-rc5

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/c8561c73b4a8669bb13c57a5853318cd02655f9b

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
