Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430323D45F4;
	Thu,  8 Oct 2026 11:36:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791459388; cv=none; b=rYExJrh5BBcpKZL+sUtFt2BPDTz2VeZrVVU/xgznbM5Nnq/JLr3Oz2iQhOm10S4HpaMF9KH0B8VXE8L8k/I2jUN9SE97fcKcEmZjvdd2ESJ18HQlz0a1FUkMcCkeFscq2y67CRqAIpmETcZEDCt8qMivhTaktiflS5jCvZxMt9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791459388; c=relaxed/simple;
	bh=JRFpHcYa3BbaHjCnBJY+bzBnzztPjZULxzH5H0Nf/GQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=bf1Pn55JiNCl+opsfSBxp8Mwk1gcIviysn3pLC+d3dWhqVaLHneQO/HVVzz6tWKfFTFf8aFdkmaXt9g5J7aonB7FSHSLElyHXtpiT/Da+wGhGexrgGO752XlIwAAhR1qTZYcEeGo5GcfnNl3fe3Q8u3ok6UUJH/Mnnz3phHag4w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PnkSJDRZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PnkSJDRZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C8F41F000FF;
	Thu,  8 Oct 2026 11:36:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791459386;
	bh=3oDePWvCRAMim748IqnqzJUWmjjSuTTc4flWopRsV2U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=PnkSJDRZ4h4KhDG3EAosu1Wr6nwYHoWn49CKNpE/SisfaQIVjvq1QpJt/TCTLzw/I
	 MnHr38EzBXhhoSo2t8IU0fNwJpuew/00jVWfB/yaeF38+f0CSb0rPe7PxaLwDs7SQj
	 XUhCV2Lj3GZ0Ofwo17DBxvaPjdaEWJ4wYOFj+5XWD5ti5iV6gqJG/ttc6OzSiIWTIg
	 K8c97bIH3u7Acpqr3QnoZtb8sPfF18SPzU7CCDOfvWbmLo8lPuYpGJ9JQjkHvqFbMV
	 BveQlqccyfKLORAyVPfuRFzVkgAjiM0iRaxWmeJ7An3BQhFS/W8GRl7Rkd3OGJE9ev
	 ajNfu1rAwe6kQ==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20261008-regmap-debugfs-fix-v1-1-3df2f25c01b6@nxp.com>
References: <20261008-regmap-debugfs-fix-v1-1-3df2f25c01b6@nxp.com>
Subject: Re: [PATCH] regmap: debugfs: Use __free(kfree) for
 regmap_reg_ranges_read_file
Message-Id: <179144556412.2423942.5716116558719773172.b4-ty@b4>
Date: Thu, 08 Oct 2026 09:46:04 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1154; i=broonie@kernel.org;
 h=from:subject:message-id; bh=JRFpHcYa3BbaHjCnBJY+bzBnzztPjZULxzH5H0Nf/GQ=;
 b=owGbwMvMwCWm/754w+YLFp2Mp9WSGLKONxhuP+tWsUXkM3d7vesURiPmZV3cZ8/dv2YqtuGp9
 ZZbURdlOkpZGMS4GGTFFFnisrhf1pe8XsN3cGEbzBxWJpAhDFycAjCR1y8ZGX6vDnu4W3DTGYaP
 CZs8S20yHqVy/RFi37CG7fZWkw2xDHYM/xO5WPwSV2686Sryd7p6Y5j6j9hctzWVT34eaf7rM/c
 FNx8A
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 08 Oct 2026 08:49:45 +0800, Peng Fan (OSS) wrote:
> regmap: debugfs: Use __free(kfree) for regmap_reg_ranges_read_file

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4

Thanks!

[1/1] regmap: debugfs: Use __free(kfree) for regmap_reg_ranges_read_file
      https://git.kernel.org/broonie/regmap/c/f52260f49b10

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

