Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794482594;
	b=YT0keW9C3p1KcYMJGBZh2vsBXmfr2QcKvrYe60I/W8tE6GXLUViYzk2b2Jjp2NS/uqF5
	 CFSwiwtPhTNO9N139t8yLixiEysFdIsbXgxclcFb40kuvOkVI2cfSlrbTNLP9/IhVyWss
	 bxQ8jvEVB9xL4fJ2DUf2JgRsrkJV+N2EvwAJbuh1tr0Gf3SZ3nBbLzLj2NRLAHJNoQ15W
	 m0kQtfCVq7srblmsWWqdHydU+YHHRTb+7gPxS/iANXb+aXsqpeX1ylZZ5RNnguqsoLrB5
	 XOLffvpFT/wlNcTqour1i4G636IDn3ZduwBgjy5siQR1X/3a19T36+t0gq04g1P3XWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794482594;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=nS1zpLXR0Ltc9jPx4jJyxbCNLHAzN4pNMWWnCEovFkE=;
	b=vgrf4xwPAaWu2Fiyn+X2evfw2BsjN85LN85TXhdjIauPZ6pgF8s0d9du0tUjRkLYuyEI
	 KauyVCyacU6HsgL4zwGuiB156t0Py9KbAuxoO50uPLDGnvIgrGpPMuUz9NQK8ZhpYaZb4
	 2FBcqaqQqMbQqrB3NhTLzYVgGpnG8tZZy4MRXiFSDwgW3dqa79kAPML8GUqW6T/nsXmiH
	 GiEyuyhMF9ZVcadIz/n2WR9Nv57VqKdGAcPqo2NS94p4TXAGclclI8xs0nLVhkPnKMe/3
	 XhNj6PybKQnu5v3SBiLAYdwzBLXvfB0rMjhC8xWiblmc2zDH6YL41bhEn0hiMlhn+1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpMHpshI;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AED2606A885;
	Thu, 12 Nov 2026 11:23:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mpMHpshI
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30B4E1F01561;
	Thu, 12 Nov 2026 11:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794482593;
	bh=nS1zpLXR0Ltc9jPx4jJyxbCNLHAzN4pNMWWnCEovFkE=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=mpMHpshIC9+Z6JINvsrLzCOtpPD5vvGuEs1nJLsPeOiJ769IRzgxOQHYt+waJ71Q4
	 NIJpTftbU36FFTWRnVKrO/ISmjIe9pJZBJ1+0tU2hSp4Jr5Dl0KbMbpBgw0ZhoXXmU
	 61VJ9HAAgTjM9GR4ZbNbQ5mOwAWu+SoJIWeSriIenqBeKjUDRltMtgpe4AiLSELU5z
	 9klfs9H9OH8jIoDRahjVqV/RLnxSOwAmQIKTaGDNzAtYywaRolcUEcLGFnwm08/Uvb
	 5urWG1ZoIbmE0J4fY8+F2xryyAbOSYd5PPOUlSRIh7BoCsedfKgdH/yXDBs/OQMkvG
	 506NIeH2QDFNg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>
In-Reply-To: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
References: <20261110093820.454682-1-andriy.shevchenko@linux.intel.com>
Subject: Re: (subset) [PATCH v1 0/4] regmap: a small set of cleanups
Message-Id: <179442317606.513646.4119576994084921273.b4-ty@b4>
Date: Wed, 11 Nov 2026 18:52:56 +0000
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=broonie@kernel.org;
 h=from:subject:message-id; bh=vECO2nGHp6mmFONnkP6rFQ0yXK3OJ3PiM3rZZQoYdLE=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLK+LpzHqDa7bPqd3Dk/nG708kYGZMpvLNM+JSR8+dj+S
 0kHXYxfdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAiWbcY/pm2q607HHGX0Uyi
 a5Hyys8vznO8EluSdLnufdiqfW2sv3QZ/mcsnNxhsCrRcMuVvGpz9hmpN1ccbk7ZH8afKV7722z
 rCQ4A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 10 Nov 2026 10:36:58 +0100, Andy Shevchenko wrote:
> regmap: a small set of cleanups
> 
> This is a mini-series of a small set of ad-hoc cleanups.
> Read individual patches to get the idea.
> 
> Andy Shevchenko (4):
>   regmap: Switch to use kmemdup_array()
>   regmap: Drop never used devm_regmap_*_free() APIs
>   regmap: Defer assignments to the later in some cases
>   regmap: Drop duplicate ret assignment
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/4] regmap: Switch to use kmemdup_array()
      https://git.kernel.org/broonie/regmap/c/ed8939e50466
[3/4] regmap: Defer assignments to the later in some cases
      https://git.kernel.org/broonie/regmap/c/ac5fd39a1718
[4/4] regmap: Drop duplicate ret assignment
      https://git.kernel.org/broonie/regmap/c/64db965e43d4

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

