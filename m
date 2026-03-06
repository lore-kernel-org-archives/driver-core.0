Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 556522877CB;
	Fri,  6 Mar 2026 12:41:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772800879; cv=none; b=jQdovrqtzpzT7LySiu14+YxDMIKYomgzel95PMvLEywDpxluah347niKlwI2zLYAbGpGFRwYJlEBYDUOaQZ0PVfn1jQcbZNqWAAfhflSHjmcIYdTPpUgXASIH9B9CzZWgInHrwdPB4i9LgVWKbH4sd0S0fX7dQ6EnJhN6KdK7d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772800879; c=relaxed/simple;
	bh=7grlN+4p836KZnBvlQKTahk9XMoqLHRvj4JsmIxJIOM=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZiBmju5Qt9DDDhysvDCC3LozabAlRJ2C7pND7xlr7y/vUmUb+I/BG587pmQYYkqY6XDVhVgE/bPVIBJDPSP0wuERoyxMpgpDoUx0r/71M1bZXO4jPH/rKL4H0BPOUF7q5mh514XytCFLjycm7OEtQ1LPJWRIz+b31MFThSk+x68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SEsWAXrB; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SEsWAXrB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0F68C2BC86;
	Fri,  6 Mar 2026 12:41:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772800878;
	bh=7grlN+4p836KZnBvlQKTahk9XMoqLHRvj4JsmIxJIOM=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=SEsWAXrBJYhdnX/3dFIvwDIavwayIZKJybbzluztaMIKn0PZiudlITKasPL1fQe0o
	 xIYbzTM8jh6yd1h4XQa2nLQbjm9IZUEqmCCet5Aj+N/zCFP3C0Kl2S1+KO5fTKEvl8
	 s9M5UWGXfE65qnT96ySsxaoKCFeYcvj92kaIAhQOC9Ru/xss1ddDP61Am58q2nugHH
	 Ywni7XEiohLvvRsqviiNhAkpH/4XnXGX8UWxUYpAPE3aMxD9QL4Fbm9ORhfhVckZVB
	 tanh16y0pNUuE/roXD/qm98M/b7npRA6v3kHkKqH3WhwL5kGGqyiRIZY3FAqmZJ5ir
	 4ZY+Rhmfwlm/g==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
In-Reply-To: <20260305201349.32734-2-krzysztof.kozlowski@oss.qualcomm.com>
References: <20260305201349.32734-2-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH] regmap: Simplify devres handling
Message-Id: <177280087744.58128.1790360584598237582.b4-ty@kernel.org>
Date: Fri, 06 Mar 2026 12:41:17 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23

On Thu, 05 Mar 2026 21:13:50 +0100, Krzysztof Kozlowski wrote:
> The resource-managed devm_regmap_init() can be a bit simpler by using
> devm_add_action_or_reset() instead of devres_alloc().  This allows to
> drop the less-obvious pointer to pointer (struct regmap **ptr) and make
> devm_regmap_release() interface simpler.
> 
> Code is functionally equivalent with minor difference: devres_alloc()
> will happen now after successful resource init (__regmap_init()).
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/1] regmap: Simplify devres handling
      commit: b1ef855c62601ed4de2c4b0ff75a075877e3dac8

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

