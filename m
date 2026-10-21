Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792681104;
	b=1Or4FdSCYPHNsCOBvyHEuoLIrAyPDTqGstIB0qiZPIhgZGEWYWJ/S2xUn+B3sewt+axJ
	 qYO7btMAvGPTkWsLbojT0RRXAczGOcsSJIrAerIpkXDNk99JW0E801Od9ttPBY85A9Gm3
	 WVXpJB36Dz2NecdgtS1fSipzqBPnbhizgp9ggXK5byb+OckZ5II2kMTMWwJGy93LY5Cfa
	 EWhNHtQzmSxKB2Y2VZAbccYQ4BOJn6ydScgIO5Nhk98HE768uq/rjsTztikOONGu+d79j
	 aEnmamZoJyodI9SBBfrE34BIo1Q5DF7iP2Kx8zfBxA6C2EWwuuM4Ci5a/GgYBJUd1eg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792681104;
	h=Received:DKIM-Signature:From:To:Cc:In-Reply-To:References:Subject:
	 Message-Id:Date:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=WiXgxjwizuyUVqCzXbnbDMrPmjqOsN4MN7Vc9pRXtsk=;
	b=VLu5175ctdIOrBXgZ50R0/BVd9oYZj8N2c3F18kIiJiwwUSicuYq1u4XnJJfO5Tq/p+n
	 CGXCKC+BcjT7VlRK0euWGj1Hgzle5YtbVAsvePcDE3EuEoQt0kECkr78uYoBYNov57xUp
	 B9eLJuQdWIV7ePAZCrPcndjHSKo3mtTVL7ZSz7WJUJ+CbrVoJID1SSoDqIK1uO+UACnoV
	 m4QtVY0VCzwdeHh4P639R0C/mH2Fcc+cO79uAONkXS4QwZqu8NmI27xNrLHHR9Qg3ie+y
	 OcX7YK4FOTeYOzWWkvjlZgEPoELMz1gHAp8Pbw0EyVsvGvVpH6WJTbCne5YDmjMug1w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ps447kTD;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9DE0606A319;
	Thu, 22 Oct 2026 14:58:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ps447kTD
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 854E71F000C1;
	Thu, 22 Oct 2026 14:58:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792681103;
	bh=WiXgxjwizuyUVqCzXbnbDMrPmjqOsN4MN7Vc9pRXtsk=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=Ps447kTDjEuvUEahzsoLQhrK+GxmsbZGWuPD4RQmuU+CENjP0wSQwdvwqtnAzNcSv
	 DnbdOzxMFslWzN6ens83vTUPYxt4Kzs7DMbcoMMcjyRF4+6H1CrSvPmbBYQEu7kLcT
	 xshIr5mzOqWfM5fOdu/cwTcfmlWZtEppUA20GGbWUPnLmBCR8nns1aN4+PGUpwmrFG
	 CaU8K7cpXZtXW7qYVEVa4lpXJrvtT46sQzsjrUG3APHTC0g4zpiD10fYoJO9Cudx+c
	 pebC3k9wi5KZm3XQ2ZAi+ffzdxRLtLyCULbnzNI9amznsMKvs36Eq92WJxf3H1eLUJ
	 FfuRDUnrcNKKw==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Qinguang Xu <guang.cy2023@gmail.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
In-Reply-To: <20261020-debug-v1-1-44e0491ede30@gmail.com>
References: <20261020-debug-v1-1-44e0491ede30@gmail.com>
Subject: Re: [PATCH] regmap: irq: fix incorrect index calculation for
 read_sub_irq_data()
Message-Id: <179260159860.3909521.14877027870846141809.b4-ty@b4>
Date: Wed, 21 Oct 2026 17:53:18 +0100
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1155; i=broonie@kernel.org;
 h=from:subject:message-id; bh=KCmYyeZOMRjK9LGCDBZqe/giZw+9pfkY/PKIxWhhVN4=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLJuqbSXPg903xKzPmDyj2Pmv78KeO8wfi5ndplh8klBe
 d+4B9OvdpSyMIhxMciKKbLEZXG/rC95vYbv4MI2mDmsTCBDGLg4BWAigncZ/tkwfdwUa7V1Ck/l
 RK/tJy4veFKy0lV8toaugvhsHsX4Y+sZ/ofJBlpNmvPf5oGPvvCJgrW7FzwW81p4uc7J31uxvVL
 diREA
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Tue, 20 Oct 2026 21:39:06 +0800, Qinguang Xu wrote:
> regmap: irq: fix incorrect index calculation for read_sub_irq_data()

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4

Thanks!

[1/1] regmap: irq: fix incorrect index calculation for read_sub_irq_data()
      https://git.kernel.org/broonie/regmap/c/1ea2927c1bc3

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

