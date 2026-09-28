Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE36357D08;
	Tue, 29 Sep 2026 10:02:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790676162; cv=none; b=KvUC2CRtxwULpCJEnwk0bEoPddKFxzam94k4Y/rDACuawS59Ms6PqR1xKbQgHVHTxyF2xzgrPQGIEHIJGUgNeJ5GDywBVlJpMb90KB1z2M8hZoVfhYuPvf0YCX6uPuwepoayRMHsbdQvqE3KUF3Ze5UI4gTrV13gCw0SLytulkg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790676162; c=relaxed/simple;
	bh=Ckh2edlgD8pSknkf616R4gEWATYDE58unwFe5zCxFh4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=Aeq97/vrdMOgFTCIcVbgUw0Htwaf/Emf1wnm1KTZkB0r+rAvJH+51hNkzM+H4AoCoWa/QhV2HrF58BmxQvWhCyvRELBp3xHFdScE7CyEs0uVvBS3SWz+piO0PTGXUANzkEuuoJTdnMRGbSYadFDW+hsysD9xhDTRf/jbpg8PKoc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P27SZoG7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P27SZoG7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54B841F00899;
	Tue, 29 Sep 2026 10:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790676154;
	bh=36q4a2p+FUw1btR0MIsYjhi8bRxVrc6Pe96L4kpGQpY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=P27SZoG7S+tUMJ2AMrw+Ul9q5TVxIE/LrfXT7whMv0Hp20IJoXP2uzaQhzPyryn11
	 jtcPe1Cm1CU2KX8ob7tkSngfRN+rD6xzzs4rg5LiW+BoSXHh4b/7fGJMnvvVkXnhIf
	 QBHfQI1p/j1har32HQmWnGJ2Y1WEtApwIqSGjZbdocvLTxJfeBNHSaNFAOSwYBsT1Y
	 9kUzAhfyiOW6TdbMORQ1sJUmAR7E5bPXNIgkSLein/svsyMY535DYe5PRXNjxnNCso
	 UB+aL8zvfI9jq48p8aTpYRb5LCOMymudSUWFOpKpD4cTFeGzuBjiRadY/IIQw7UbNl
	 djmCDMZNNEByA==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
References: <20260924-regmap-lock-guard-v3-0-8a6127223c16@nxp.com>
Subject: Re: [PATCH RFC v3 0/4] regmap: convert map->lock/unlock users to a
 scoped guard
Message-Id: <179062150526.139547.3870545428656485907.b4-ty@b4>
Date: Mon, 28 Sep 2026 19:51:45 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1660; i=broonie@kernel.org;
 h=from:subject:message-id; bh=Ckh2edlgD8pSknkf616R4gEWATYDE58unwFe5zCxFh4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqu4y3UhkEt0UETSd83e2WBmjH2m6tw1TPQYFRn
 fsNp4dftfOJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaruMtwAKCRAk1otyXVSH
 0LPrB/9NFa28KPT0lcapOxqeM1/p6G6IrExV4sxqMXF12+mviXbuxblizSFnSC/jPotky7yU/LB
 SqAv17tRlzRo3UtcWdElls6ASA35yWFRjxKmtqhXTQSzV+/mXhn5bYiOmzFQzK4CEeRsm4ItBGP
 JqXnMc9A7XWuR70IEpg8WKuquwwYPBKUw4VaiYG4R1XI8cgMnLOVwCfwDb2hGvDJP/9Dv8b8fQR
 Sd5fUnhiF/EHHOJSQwyRYMYzm47RD75iXXU4LMlivvzxi8m9aV8aB5c2PWYp7POTD6gRdXWQLFT
 GCSRB0LAkLlibsCJxtVyo6tsuVZCvtOr0tUNvs3WbPHvOLLa
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 24 Sep 2026 14:30:51 +0800, Peng Fan (OSS) wrote:
> regmap: convert map->lock/unlock users to a scoped guard
> 
> The regmap lock is taken by calling the lock and unlock callbacks
> directly at every call site:
> 
> 	map->lock(map->lock_arg);
> 	...
> 	map->unlock(map->lock_arg);
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4

Thanks!

[1/4] regmap: convert lock/unlock to a scoped guard
      https://git.kernel.org/broonie/regmap/c/80328b41ea28
[2/4] regcache: use the regmap scoped lock guard
      https://git.kernel.org/broonie/regmap/c/23f1120dcbea
[3/4] regcache: rbtree: use the regmap scoped lock guard
      https://git.kernel.org/broonie/regmap/c/555a1bd78bbc
[4/4] regmap: debugfs: use the regmap scoped lock guard
      https://git.kernel.org/broonie/regmap/c/9999d5a07ee0

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

