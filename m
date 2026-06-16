Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E95343CECC;
	Wed, 17 Jun 2026 13:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781703538; cv=none; b=fE6CsEkCMIym8VMaGfZYFPHRrNbWHTwUfuIqc4KlTi8vfPoLTQxHP8vWUOtbSI4X8AKdUkvt+7EwCUiBzm5NayceQ6el1OZP+MB7SpK6KF8NB+yst9oUrp4ZzCyxfM6THfIb0CE7cpGsGNAc/JKjmChp/WKUnTYdZYuuZFdLqyc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781703538; c=relaxed/simple;
	bh=3VUlfp7+JEDqIuH82KM3YcEa/UyPk3oJdz8DOLrZQUs=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OutrDzIzJbPcvwI+PVOQGmBg9Ap3HVNZdu/rQBtelVki7XgLE3oupUIpBKb7UaGGogOga/tmTseeO2Ye9HoI374wP9aACSuB8vW7nDC6QjwAjJItTEkSaVu5hCDV+jGX7UivSs/nL+5SiJUNn3uHLBHM8U+P6gi8NIbiZq7QDeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KaQ9Trvq; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KaQ9Trvq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 241951F000E9;
	Wed, 17 Jun 2026 13:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781703535;
	bh=E+IXh4nPHeq6VqEsICFDx6LLOS9eBFJuN0vcqdOIkIg=;
	h=From:To:In-Reply-To:References:Subject:Date;
	b=KaQ9Trvq25tyX+eSA95XYGwasik8Gll/WGSUyc6fkFOw7gsOCAzDlQ98n6pfpBj2V
	 xOJjIoTiGOgO1791Kglo/Lz1XswhqT2RoBHUEpH0O8tllIys1Z9u20dg1ehcyiIolT
	 caa1BE6rBTj2SCsa1m7GcROsBoXwkNmO9ywRsFHZN4z9sF9faR9CmWmc7bOf0BIQrk
	 CBmXl6huvkdzSoV0PEwjHAcv/BiaGSFv2bVlj3J5jbnHNDouL6tc445UOBdUDJ7pff
	 o5vdcZ1LHpZqabLcaXw0UCU3mThlLPY1FbMTGFR0+19nqNYsOGhHhTchFl8aflmtjB
	 pxnADtFtlYpuw==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Francesco Lavra <flavra@baylibre.com>
In-Reply-To: <20260616114429.1852456-1-flavra@baylibre.com>
References: <20260616114429.1852456-1-flavra@baylibre.com>
Subject: Re: [PATCH] regcache: Do not overwrite error code when finalizing
 cache after error
Message-Id: <178161574172.103575.18346225443015450487.b4-ty@b4>
Date: Tue, 16 Jun 2026 14:15:41 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1165; i=broonie@kernel.org;
 h=from:subject:message-id; bh=3VUlfp7+JEDqIuH82KM3YcEa/UyPk3oJdz8DOLrZQUs=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqMqNtOaL3LAYvzuBWEwM4eajQFWwsxWn0SdrVj
 3wAq6IbZXWJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCajKjbQAKCRAk1otyXVSH
 0MY0CACBeXANa3GdCmSZso6eyeH1RRasdOcyIN2J5VBhHzTXhI0IrHZtFfyRziDCEe5AI5tcuMO
 MHdDpP6DNE7DvUKmvaUdEuxZxx0KhrHOHBDRC8I0Fcie2k4Q0by0/HD+hrk4io7Vy1CTJJ6Yu7D
 p0YEELV3ALJs5F9WZcfLXG0Ia5T7Pi0RZY3fycSBzBxMC9KnIUXbfY0yZCjuDoDi8RNgdL8E/49
 93mQpm97yFL2tZkVUE7LWKnj/WStITbaPbA9QhsRQypXQfdX+j9LFTnz6PrSNIYjZxtjThdqgvE
 jhwQtYkul0u3uMa6Ho9IsPoXfbNwA8buF7VGjYskK4GZGydn
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 16 Jun 2026 13:44:29 +0200, Francesco Lavra wrote:
> regcache: Do not overwrite error code when finalizing cache after error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.2

Thanks!

[1/1] regcache: Do not overwrite error code when finalizing cache after error
      https://git.kernel.org/broonie/regmap/c/9108f7fa493b

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

