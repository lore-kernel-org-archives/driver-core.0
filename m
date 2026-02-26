Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D978364EBA;
	Thu, 26 Feb 2026 11:47:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772106429; cv=none; b=bAbI8uSWkYYy8MtREdOQUkBpKE1ZdDFH37a898bslOLwtZuUSTTJgO/xbI9Knphg/XdkxT+ZmHKBl31+4EpfyaWMpjX9i+szugRdYojUhHY3as/dwHmFqtOHhunwIDfsX0LZzbf+7KpxwFlFE2tUdfJAYLTchLP/5mqz6hmIJ18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772106429; c=relaxed/simple;
	bh=wD7YlZhBWMIySNbPdJ9JMRGS7xOoVIp+/zV3qDywtA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=jKg6sePojY4iaT4kPUWHVkFSaYcC2YPaM6QvopwaRUUfXBjDlvfyX9vzAMrb0cDftrxUQBuJ0p6jOzQS0pt19RH6cvmWSVn/Hwd5h9jJBiEqJIOJSmb3AI45qXAN3yplXDdYLIZqIbz8JtbmjLALInL6fXdQHsL4gQ2brNWPCHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AD6wrDMW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AD6wrDMW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C4B7C19422;
	Thu, 26 Feb 2026 11:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772106429;
	bh=wD7YlZhBWMIySNbPdJ9JMRGS7xOoVIp+/zV3qDywtA0=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=AD6wrDMWT2hctrPz4T2G72LHrKxx7z7AVxqaDvsfUMzaF0YDA4NRTwmW/qX3XM+oz
	 UY+VHPA3HePNR3/QiPfI741IaQfaX+wvof8KsBJ0HnvH5UVws/VZ1BqPe1TmLkcjH0
	 UZf6X0+ZDNvwdKciyGkAx70phXJUmf3fOfNUijuThSjD255DINc3jSi7DdFdCjz+Fu
	 1khk6pF8m35rHtdq0k22hk0biYTHlBPw3PFCdquyHsdvkmjsvMuLQrSacbQCxDB2i7
	 gQm/rVsgVDO2oEDg1uRBTZ4OUwlJutTikapJPQWv/aizFhPzy2arGXTxK8rYQUWDOh
	 ygfbT6zu6DYKA==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
References: <20260225161659.3811671-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v2 0/5] regcache: Avoid accessing
 non-initialised cache
Message-Id: <177210642785.56240.14456507795542446077.b4-ty@kernel.org>
Date: Thu, 26 Feb 2026 11:47:07 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-47773

On Wed, 25 Feb 2026 17:15:54 +0100, Andy Shevchenko wrote:
> Refactor regcache flow that populates cache on initialisation phase
> based on the values in HW. This makes code robust against any possible
> accesses to not-fully initialised caches.
> 
> Changelog v2:
> - rebased on top of the latest regmap changes (Mark)
> - added two more little cleanups (patches 4 & 5)
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/5] regcache: Remove duplicate check in regcache_hw_init()
      commit: 1fcf171178f021ef2005d47e281544624b93c5a5
[2/5] regcache: Split regcache_count_cacheable_registers() helper
      commit: c2bcf62ca75c541ec4297e6ff02a68ddc2e02029
[3/5] regcache: Move HW readback after cache initialisation
      (no commit info)
[4/5] regcache: Define iterator inside for-loop and align their types
      (no commit info)

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

