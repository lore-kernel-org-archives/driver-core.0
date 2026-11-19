Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795119637;
	b=ror8T+VNimiLP1HaUDfFlZwLXriaXGkorGC7aUSa7JDzox8LUmYwDuun5HJgHWGEEuzf
	 F1U3UH2pWxxhxbS0MKTgAzI62UIfRiYNz/yaDWStsXzEjtrp9+uilQwx3M26bpqtTlVpX
	 SGuG+2OnxjkAd8/CrVZk9rG3Js4kSPzE3ZCrOTqyIJFsRXxeJC5xTOxEZheqPbyvA4scX
	 x+rppr2hGkiLPU93WftYIdrVKsez9Tlw6R85jktulh9NCUHhYZmkxYh/ylZlZ4WSn/wVD
	 DoGCZQvH2F3nbQfiZnxpkusVGlUzgC4s6C7ZeeCDybc8N4ztef7tZrd/G/Xs6eIh3ng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795119637;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=1PngVqjy6XbuVa4yi3mp7VkmbvcrVOwhL2KE+zN1fu4=;
	b=pUE+IfSk8GkQmQF9eRCQPPnFPFNqMojGEnIugSg2iUdVuv+yvrhnfoChonm6rslpxzog
	 1HNiKx1TGuaWUVXqZ1IbiPaMStt8JWsQoVOOTYJY6yqRciz0I1UoFDRw6fXRWN4cGEFuv
	 or+CYaX/U3NWTJ2EI+cCpWp9tiroCIlWZKOeofII3bcQmPFR1vkcONzqErzq7hDvgKeKm
	 o9wSWuvJNL4h60KrYWq2dJm7gDPPGNsFCRnw5e9BOJG3ggIEi4ir39OQeVUskbKofPBpW
	 8/Z/aiI8dS0Kdy/rviKEp7AAWcWt6ODyUhIoZw9N4yF7jN5CrNS4dLZGVZSLNMg/6sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPpxJUJj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BFEA606A326;
	Thu, 19 Nov 2026 20:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=lPpxJUJj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 553831F000C4;
	Thu, 19 Nov 2026 20:20:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795119637;
	bh=1PngVqjy6XbuVa4yi3mp7VkmbvcrVOwhL2KE+zN1fu4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=lPpxJUJjM2RZl2xZrdkXiDwu08/hI/WBivCN2eWu7pUtOaW+E7yV/4b6EPPt9T47F
	 5/66k/iEeTTjxGryhG+Kf+0t0NVR2BU98E2zi3fcI0V15IlAqM5iWDvPhoa8xoKxPk
	 Am/kxDkKdnrkfImbkaPF/X0kLlnS6Ogop5nmtH7+ayQMBINGsT/qit1oSHgUZsPiNN
	 CVnItyAFnL1aULM3n2bQ/zIqtWeVFmi3AzvQXL37Nw32bo25SRvNJaE9HQmlbmchRr
	 2jPDpJ18JNMjO2DCMAb0n8iN+9ju23ui4ar8Bje+Vc4eNLKGqAuW7Yx73eWM6KhKnA
	 pEMQ3QHBdTotQ==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, 
 Lucas Tanure <tanureal@opensource.cirrus.com>, 
 Peng Fan <peng.fan@linux.dev>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>, Sashiko <sashiko-bot@kernel.org>
In-Reply-To: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
References: <20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com>
Subject: Re: (subset) [PATCH v2 00/10] regmap: clean up and improve
 __regmap_init()
Message-Id: <179510913249.116416.15355829560665352192.b4-ty@b4>
Date: Thu, 19 Nov 2026 17:25:32 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2079; i=broonie@kernel.org;
 h=from:subject:message-id; bh=bDh1IuUijN00aUfD5Nl6H57mzn8c/ms6L6XNsJZS9Sk=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLL+Rwnur9zsd1G7o1K1PMyAd0XAxIaHDo7zJ/sqCLcI6
 6T/2r+/o5SFQYyLQVZMkSUui/tlfcnrNXwHF7bBzGFlAhnCwMUpABO5psDI8PRuyqNmrpTFDa7z
 ijUrIwVVjqrWqgVtLPys3e/HzSynyvA/rZ7/3QS/jI02C77YF2zdp3JowYoWx0nZ4bvEGB9+UQt
 lAAA=
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 13 Nov 2026 23:31:48 +0800, Peng Fan wrote:
> regmap: clean up and improve __regmap_init()
> 
> This series includes three fixes for pre-existing regmap issues noticed
> during review, improves the __regmap_init() error handling and removes the
> last user of regmap_bus::free_on_exit. Patches 1-3 are fixes suitable for stable;
> patches 4-9 are cleanups with no functional change intended; patch 10 adds
> KUnit coverage for the new bus callback.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[02/10] regmap-i2c: keep bus raw write limit when applying read quirk
        https://git.kernel.org/broonie/regmap/c/931deb7a04b7
[03/10] regmap-i2c: fix write limit clamping for adapter quirks
        https://git.kernel.org/broonie/regmap/c/94da81cb6fdc
[04/10] regmap: deduplicate fast_io checks
        https://git.kernel.org/broonie/regmap/c/edcc17880bf5
[05/10] regmap: factor out regmap_set_lock()
        https://git.kernel.org/broonie/regmap/c/25203a86e6c3
[06/10] regmap: factor out regmap_init_ranges()
        https://git.kernel.org/broonie/regmap/c/37ccd50b8376
[07/10] regmap: factor out format initialisation into helpers
        https://git.kernel.org/broonie/regmap/c/7ba85f2e9681

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

