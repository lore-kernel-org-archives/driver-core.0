Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A0AB3563C2;
	Thu,  5 Mar 2026 21:14:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772745248; cv=none; b=jpZ6Ae6BukJPzz2AgQSKJOcixYKnvn7jHKhFmw4sjtDCvDvBZwoWxRIY52JC/83mR3eQ8yIPd4aKPtxuOkBc4QCACwXgpBccSZZB3sMUnN+aP9mZGoJsNmIrXtMcf0Gl4/xcRito32If9YyKCd/2mkEEHpHHQMtDg+vZkyNDb9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772745248; c=relaxed/simple;
	bh=o7SvsDX/Z0CGm1kMo2nNS+eOhJ1B4ZN680h0Vvw+fYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=FztmR8JIYeASq1+3SvkbrEhz1PRzOJGV1AAFLz9HebRdZVfv5B9xQyWfUFyZSG9KzwZjbUgnjTnmxEfzNTUbzBepdCg9iheklaVODbIUsW38nrKVYElcG9hSkgDdGLfr4XhJxhXOniTOP8Y4BKzqpqeOO0U0CCdiSm5jru0RUcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KUhBhY5b; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KUhBhY5b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C42C1C19425;
	Thu,  5 Mar 2026 21:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772745247;
	bh=o7SvsDX/Z0CGm1kMo2nNS+eOhJ1B4ZN680h0Vvw+fYY=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=KUhBhY5bxFy8E+O1cE6Y4sRKxFwaWjBRpOoNLh9I9iO8Pf95c05OaH2xmyj8v5acF
	 GRFKDoZgja7pcaKU3yuTzuL8LDsTE10XjIvLY6rvYLhavNb7qGYhyB4TiI0TeRmIHw
	 c+LyMREGJUpPdyr3YDMU+KZnoz2gipLMOuwmr4UbOE+licdT7GESk3vsrZsByNhYkj
	 pE4vaOF+/FqJhcdnyJ3RjCnh/dM9jL6/uzB+PpaHaeMe0gaHfwRguDPiPDKX9XFN1T
	 jKxdJu429jUQjdRp+4yHM8JE5cP9QrykWWDBg+8yTi6aJpfytkLSkvjjdvgII1iWfp
	 qOmphPHpuV6Lg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20260305085449.3184020-1-andriy.shevchenko@linux.intel.com>
References: <20260305085449.3184020-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v6 0/3] regcache: Avoid accessing non-initialised cache
Message-Id: <177274524654.231455.8271605638828669582.b4-ty@kernel.org>
Date: Thu, 05 Mar 2026 21:14:06 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23

On Thu, 05 Mar 2026 09:52:59 +0100, Andy Shevchenko wrote:
> Refactor regcache flow that populates cache on initialisation phase
> based on the values in HW. This makes code robust against any possible
> accesses to not-fully initialised caches.
> 
> Changelog v6:
> - refactored to make sure we always clean up the allocated resources (Mark)
> - dropped applied patches
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/3] regcache: Move count check and cache_bypass assignment to the caller
      commit: 8e2d279724944f788edc633e4888107eae666a37
[2/3] regcache: Allocate and free reg_defaults on the same level
      commit: 0cb7ae981894ff1fd0283813a17253250a747cf5
[3/3] regcache: Move HW readback after cache initialisation
      commit: e7662bced2e98ffa2c572126677deb9cf55d43b3

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

