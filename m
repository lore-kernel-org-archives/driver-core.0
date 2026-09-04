Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DCF33D1CA8;
	Fri,  4 Sep 2026 20:11:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788552678; cv=none; b=abK7cxkCFRho5xPSdKdWZOwWjSrqU0UyyDS9QDsnDPB1DotDHNjWx/PwOsz9U71yqQplw+51Xh56FdpG5Bf7/c8T1FM7TW6bHbJg5eR4i7AogdHUNfQEssMyH/eMcIs0SiNJdHTC4LPs1tpkaDtpVoziatHMC5gfXjdhIki3QvU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788552678; c=relaxed/simple;
	bh=+hlN5+gfxB8nMiNsAtRCPf/eG1W3MrXEuFOdnVuxNhQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=U7wPWH9jHY55OpsXLlpFdcDvvoirSH5unfRzsoXiycuEOYydCNXfpbGwlx3gBHHrDYkHqVy1tOVSSLZ4SgRELv0OmNxh6+4WP9uII8VwZPBZOK9zN3fLL5DK6EugGsvLe/6h5iZt7g1TRgr7o7qkgD2bF+LpZw0x4VV5uxTeKeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5UMZ7P6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5UMZ7P6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FC911F00A3D;
	Fri,  4 Sep 2026 20:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788552667;
	bh=vv9m4H7z63klATJjy0B5XRQ3fsb8gsX3JhB1Swdvxn8=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=W5UMZ7P6EGGE6gd2e0lwEjs6GxRwgWpwnPit028rd2voWs5eRXUwaSJCmzxtYYJ3k
	 pR8z5t6g1QXnCBO6VAiGn702XPzxK7I8pz/vtEDKGwA3QbcevIos96JO1xGrxaBELZ
	 zn6CsH2GLTb0ipUrv+aPazJMyBQZAnmWlfvASTE1J3YPhHA9f8iWmn/atUgFzqii66
	 hxTSK46qkXEG4KxpwchtHrO7g2H21wyVZU6l4ptOpJWkMGfqGQxREtEFZ/RjN3peF3
	 ASWpbID8pSGZ2dBmbplXI9uaMHYp3sYlmk/804sqBbRGq/u/Agmtd4cQB3dIJgO0xs
	 HppNBQPh24IDA==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Hemanth Selam <hemanth.selam@gmail.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
In-Reply-To: <20260904110110.8823-1-hemanth.selam@gmail.com>
References: <20260904110110.8823-1-hemanth.selam@gmail.com>
Subject: Re: [PATCH] regmap: fix typo "asynchrnous" in comment
Message-Id: <178854114300.632048.10445735086752355718.b4-ty@b4>
Date: Fri, 04 Sep 2026 17:59:03 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1103; i=broonie@kernel.org;
 h=from:subject:message-id; bh=+hlN5+gfxB8nMiNsAtRCPf/eG1W3MrXEuFOdnVuxNhQ=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqmyXXgxSjUQLmeSyQ49klmIa6AMCdC3Ec4sXkM
 xx8X5c/TGCJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCapsl1wAKCRAk1otyXVSH
 0IAGCACFSMhkkEm/NoPGZIvY9RvVm0CI4gG9QGLINxO3KVIvKdKLkaCmM7MnEoQJEQBveVIedov
 XxRwaNT7LC5xZYDXPNzdz+YX6pdIl6yyzWDWSEkpSAOVT4p5fGniLru+BP4veJmLxI/mpQnheYy
 xwE1zgLwZsozwZvt4e+iVBlrTl/ZhsV3fIU8HCdbkTlBPRt4LM0bMjQyMBlijaZaP2D2a/HAob1
 5y+AKceURTD2hbRSP7src692egOYAShYdW4efd3VuB8aWy9n+GiaYwhH/atgfdttwVOAFXluGZA
 DQ0d3nf80033fxJnPMgNOPtMhZRD9e7vs3wGKKPabW/pxCof
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 04 Sep 2026 16:31:09 +0530, Hemanth Selam wrote:
> regmap: fix typo "asynchrnous" in comment

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4

Thanks!

[1/1] regmap: fix typo "asynchrnous" in comment
      https://git.kernel.org/broonie/regmap/c/8e51dd6db0bc

All being well this means that it will be integrated into the linux-next
tree (usually sometime in the next 24 hours) and sent to Linus during
the next merge window (or sooner if it is a bug fix), however if
problems are discovered then the patch may be dropped or reverted.

You may get further e-mails resulting from automated or manual testing
and review of the tree, please engage with people reporting problems and
send followup patches addressing any issues that are reported if needed.

If any updates are required or you are submitting further changes they
should be sent as incremental updates against current git, existing
patches will not be replaced.

Please add any relevant lists and maintainers to the CCs when replying
to this mail.

Thanks,
Mark

