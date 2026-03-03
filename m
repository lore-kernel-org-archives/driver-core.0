Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC07642316B;
	Tue,  3 Mar 2026 11:20:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536825; cv=none; b=J+Gm9wodsR+mV2Jf+himGbBg/XY2nQufAumJtG9mirB1U1fhGReG0lW8vlB14W1LOXqD1DsMa+QNb7pw5yDRBj2NcnZ9mTtVB0E1dgDz7QhlfXmlge0o5RQgAPnWYBSSYWAUp5zsPhaGbYeHZaVVjKxSpe4pzKdzokUSH8LN9Bo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536825; c=relaxed/simple;
	bh=pHes8BwuxHHeTbf2z5UcrAdxAGxn01lvUFPtVAnrXm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=IcfeY7MwgKdUlP7i/xzyXJumjBdvT7sYq99WrrYCokWqfwwO8j2Jow3nJVOVCeAIT7XFMxi9UvrHFpiQq+QJkrQAlqAFRZw4h9s7kX+k3sCV2X+H0wDrLNRYa1e2Ojo4SDtitS4eJASkRZZzojM30tQ91XV3DmugpvYFgq+wSZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g0BN+rl8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g0BN+rl8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59559C4AF09;
	Tue,  3 Mar 2026 11:20:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536824;
	bh=pHes8BwuxHHeTbf2z5UcrAdxAGxn01lvUFPtVAnrXm4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=g0BN+rl8vVahBElqQ2k4iNq6QXS3JcqUj/PsKXzvLNXuL5UiV64622zX1HVCNUEcz
	 YCGiBCY8lSv6fghlBKEksQjwSclqIMPrDHQ7zXuEb5hdE08R/9vBTElFzyVRYjQZRN
	 ytIOww+1D7ISrVdhjJ0X2BwGe7bm3MBUqqpyQcmrBieKO2DPnnMpsUwypui9VNGzgD
	 ISMXcO0HKQjZ65OTssHfQXWDt6zhDqr01f1HILNfBdUjQk5a1mOFm1ZPRG0ApmpWNH
	 MnvgWa/4Ur92m8KF7d2FPO+vm5XqUFvvD2xNl83cGwvt+jpY53Oat7xKojHV30yQHR
	 eQy3lbrkxICLA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
References: <20260226135918.381979-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v3 0/3] regcache: Avoid accessing non-initialised cache
Message-Id: <177253682310.22980.18277668572941309756.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:23 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Thu, 26 Feb 2026 14:57:08 +0100, Andy Shevchenko wrote:
> Refactor regcache flow that populates cache on initialisation phase
> based on the values in HW. This makes code robust against any possible
> accesses to not-fully initialised caches.
> 
> Changelog v3:
> - dropped unneeded churn in patch 3 (Mark)
> - fixed code to pass kunit test cases (Mark)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/3] regcache: Move HW readback after cache initialisation
      (no commit info)
[2/3] regcache: Define iterator inside for-loop and align their types
      commit: 8e29bc88e11928926fd97fc9acd58b8afa38de9d
[3/3] regcache: Amend printf() specifiers when printing registers
      commit: 9ab637ac5d3826606947f4e861107da958eda324

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

