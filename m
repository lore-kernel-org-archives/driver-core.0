Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795620170;
	b=pgo/KiZ/Fp1tD8EHZ3sLI386hZxylX3VhtqAYc2GafUolW4DZ4dh8W9FqdzLhxcaSSIr
	 cN0LtMfYmBE5ejMbsvnGu7QMIzOewfhyYfmiYoFGY8+/KtEHh8kUr6tmXtHXkwlw3VN8y
	 TGgIXJLB4R503dNhl3+U70oGczznrdeWKAZRM1xgJIg7CYxOe0uYCBi+O2BmJIZk2Sv+1
	 GroT3/9kgnikfkkF5uKMDtULrWyGBCTibmIZ8GOv0Eqfjxh6NH3XkxRO6g1uOJrQBZKrJ
	 JvlFEsJsJDr1rxOU7VnKVHY5T3s1z4lLWOU4ZH3EHEIxWVK7sltCWnH1sXce9epYNBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795620170;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=SLu1wneeXD4cJMfNUKzRuKmXcrHvbSKhGvp27m7wiOs=;
	b=tO2daDBtoC67eszb1zBRmajChfRLOMU+nfsgwlGdrsju9x8ElbCNq20Z/U3zkDT63cyb
	 bUFanUNGNfzf5yi0nP4HxchKqWkL4xTHckbEGW/WeqvRDazcarBjiMkulGl1NjjMaYD7k
	 JfuIJIqy4dAv+dTcWEUmld1+szPlz6bYzYK6tyNGYjSXMPctd1buX5Qw44OWw1Moic5lx
	 FF8DAylPKdlSV/0AseRPMJ8o3wi4LV7zH1rE10VK9UrkmHoxSH7f4EVZtlKkTwktikbCo
	 1QcacV5hHa/tYhf4vIJAdX2Nw5SBvy8lzX/QVkHFXuF1At57Kea8FzyLqWidLUXaXxw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpi1hwEM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBC8606A32C;
	Wed, 25 Nov 2026 15:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=dpi1hwEM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B73FB1F000C4;
	Wed, 25 Nov 2026 15:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795620170;
	bh=SLu1wneeXD4cJMfNUKzRuKmXcrHvbSKhGvp27m7wiOs=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=dpi1hwEMja/XyxBa/tUy/m0J4qeFN1GPKUiyz1UXQCWX/+AEbkF5rGndm1F0e7PnP
	 ny/tcmRfKMhrr2HwRj496uoKtFOVAD3U7/h4T1x7BygCvryqPq7yaXqD3zJZmRafIS
	 ttZ99sH4FKfYwvuGaxzKqEYcG+rGdpWOW8/10V3QjUZSsxGtWHZV8DTWrXN4fjSGds
	 uw4gqmd5quTm1tM9lkD91ciTqd6Bw9PaiFfS5ecJ1fkF+WSjI775YY7CA36YOWdSXj
	 OuLFQfM4lbnHQP9Tl9LkvCDLQy9HB9GwkqMk8N6/v2bAsPoJLkLDHz5uhqY57Qd007
	 C7rAH8WtrFTdQ==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Peng Fan <peng.fan@linux.dev>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20261121-regmap-improve-2nd-v1-0-6b5fd59451ed@nxp.com>
References: <20261121-regmap-improve-2nd-v1-0-6b5fd59451ed@nxp.com>
Subject: Re: [PATCH 0/3] regmap: 2nd clean up and improve __regmap_init()
Message-Id: <179554600460.947306.3310654390179422300.b4-ty@b4>
Date: Tue, 24 Nov 2026 18:46:44 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1620; i=broonie@kernel.org;
 h=from:subject:message-id; bh=yVz1RXlb+qiu+HRQRGCg9y93n2KoY7fb4Ix7Zb4W4Ws=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLLZ/rofqF0Z/vGKl1HoEgHjhB0MhUdPrOTX2cvHlVz9a
 tLrp9IyHaUsDGJcDLJiiixxWdwv60ter+E7uLANZg4rE8gQBi5OAZjI8j0M/ysWyNTlycRd3OXZ
 tSeuwtAn886f2NcrU7tmru/cxrTpqRDDfxeDwtZbM78v7Dv5i3216YG6BAGHqUoFu5/bHj/gdJR
 Jjg8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Sat, 21 Nov 2026 20:44:18 +0800, Peng Fan wrote:
> regmap: 2nd clean up and improve __regmap_init()
> 
> This is a re-post of patch 8-10 from [1] with addressing Mark's comments
> to patch 8 [2]
> 
> [1] https://lore.kernel.org/all/20261113-regmap-improve-v2-0-5dfd6a89078f@nxp.com/
> [2] https://lore.kernel.org/all/179510759875.116416.1025341724543668395.b4-review@b4/
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.5

Thanks!

[1/3] regmap: drop regmap_bus::free_on_exit
      https://git.kernel.org/broonie/regmap/c/ebdd2afe9fb1
[2/3] regmap: use cleanup API in __regmap_init()
      https://git.kernel.org/broonie/regmap/c/bc6647f5e8cf
[3/3] regmap: kunit: add test for regmap_bus::init_limits
      https://git.kernel.org/broonie/regmap/c/68bdabf0eed1

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

