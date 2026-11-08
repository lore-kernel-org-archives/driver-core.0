Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794169194;
	b=Q/QqXygqLbh5FDmGeKxRHbxAmsbIZIZRwo2SeQVwaGmoFSfPgTuPblMPZzEBrtL73F+S
	 BRWu0LfKKsNHlICIEtcLwGpdNwy5cuHRRMdpVsFnoVC9h/VwJ9fe0iBSVtpA6mIkyXmHW
	 gXmr9/gG7Imi8PdFKrKO9AV+j9WzRfBw40mvag/rt4XX0V+nQ/Q0PHvMR1nMbwbgfqBNO
	 Hz6jBiSV+9MXQEmsaPZ2Mcc6kprSG0ja0UNZX0nOz4aP7Z4D6Z+x0WGRd5YALScEoKkxl
	 zwiFbHkj6PY69utnsAs2CZoSf83GUCk97+bEO2zefNpnZuHQRcJtDcSjy4IlZnDnRXA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794169194;
	h=Received:DKIM-Signature:Received:Subject:From:In-Reply-To:References:
	 X-PR-Tracked-List-Id:X-PR-Tracked-Message-Id:X-PR-Tracked-Remote:
	 X-PR-Tracked-Commit-Id:X-PR-Merge-Tree:X-PR-Merge-Refname:
	 X-PR-Merge-Commit-Id:Message-Id:Date:To:Cc;
	bh=vVJHahKLRfuti26XmDg37bz5Fc/+nIlq0gjYZ4oJAJs=;
	b=wqmVSdJePs6LLI97LEUl6DqRxMDQZh9FkBIBFn2svAMCzbwh8bQHOcimG37vKWpq8+Iv
	 575OE4MP+WsQTHairXASIbbb9f0iMZ+hJEz5Scsy0/BxJdY/vHfYihx9l2g/fuJu1Q6jn
	 4fL0oNcIhUYR56AQE1+6yKFRPMadP06Fg3CrAu9aYobxGMLK0tYYxrBbh6NkTL8W/xIbw
	 GlGAwORbTv47iXj2kvtjIhf4NSPfU7ga4DlD8xqc8AQPcf+ogNS6v9pBvqbhPXrUFZ1KU
	 7KtSmw0AIEnvWoQ0KoDadgd7bR6x/CYul0FsibwUWWUUsOspjfl4CaFChCXZWs9cRWQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="ciax3k/1";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC4EC606A326;
	Sun,  8 Nov 2026 20:19:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=ciax3k/1
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A56A81F008A5;
	Sun,  8 Nov 2026 20:19:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794169193;
	bh=vVJHahKLRfuti26XmDg37bz5Fc/+nIlq0gjYZ4oJAJs=;
	h=Subject:From:In-Reply-To:References:Date:To:Cc;
	b=ciax3k/1qULPfJeeXuaIuSFhRcK8SvkjPttgonWlKV+bfVkKuw2qMs0QTi7XxEmKW
	 liNB0Caz7Yv4MYTQ3WTOmHc7JQkvg5XI7Pz6U5/0zVvCyK44uT62CqpcqIjLkwNwMf
	 W8ea4t8X5pL6yc+r9bfwdExyZTVUwk/fJThCo42iH910WKr+WpaAZL91SmdXZsNh3I
	 FIK+UVi5FDHl4S5I1BxVaCU6sbj9a9mc8dxBsC2bYqnU/76EDabFvfX5HPgpOE2jPL
	 wXVDLGB5jzXdAjTQI9onNCL4ks0zz7We5FLoZo5ZvB67LcGgWFZ4XshWjJKNcvwsRH
	 y8/f0nMuC+Ovg==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 9B2F1380821F;
	Sun,  8 Nov 2026 20:19:53 +0000 (UTC)
Subject: Re: [GIT PULL] Driver core fixes for 7.4-rc2
From: pr-tracker-bot@kernel.org
In-Reply-To: <DMPU2INZSMAU.3H6O1U564A48B@kernel.org>
References: <DMPU2INZSMAU.3H6O1U564A48B@kernel.org>
X-PR-Tracked-List-Id: <linux-kernel.vger.kernel.org>
X-PR-Tracked-Message-Id: <DMPU2INZSMAU.3H6O1U564A48B@kernel.org>
X-PR-Tracked-Remote: git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc2
X-PR-Tracked-Commit-Id: a42ae51fe3c36cef82dc687ea594ca232a785fd4
X-PR-Merge-Tree: torvalds/linux.git
X-PR-Merge-Refname: refs/heads/master
X-PR-Merge-Commit-Id: 8a65162514fbad21a2c58ffed65f42b27e92b163
Message-Id: <179416919213.1696319.15270464270588340501.pr-tracker-bot@kernel.org>
Date: Sun, 08 Nov 2026 20:19:52 +0000
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

The pull request you sent on Sun, 08 Nov 2026 13:37:45 +0100:

> git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git tags/driver-core-7.4-rc2

has been merged into torvalds/linux.git:
https://git.kernel.org/torvalds/c/8a65162514fbad21a2c58ffed65f42b27e92b163

Thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/prtracker.html
