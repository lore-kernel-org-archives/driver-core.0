Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CCC24071FC;
	Tue, 30 Jun 2026 11:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818287; cv=none; b=jOVG4vRBssxaAUZUCCVAEwMEHcEMfvVuAawUpL0znKtlAAPh4NZDYCzSDfNkBrM6SfMmiLGNvSaPp8P5WEEaCkpG5cZEaVMwOWc8YJ6z390v2LioFUmAS8queUChH9Vr1P0IpFgGb479unF1Xo5KtMoao6DokOKOISJ9ejmkEkc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818287; c=relaxed/simple;
	bh=rL2X9OJRGBZfWbpiZOHOWkYVIl3JwwvaEG3SSjjlC7E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OYn7bOLcU3sKpuS6wpcbS8dZPg8TWW1mQZOgGgprH4p0nze5ARLVcNx0HWck4crDg7LjTRpffbfTvVjfFZrYq/p2164wBvmtgpzNh+2VShhhOV5zILhpDuDgg87XWE3edVzWytUzSsHRkqUPvGf0KN3tzUcRUF3x8PypF6SEkiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZyFGv+DY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZyFGv+DY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 336E81F000E9;
	Tue, 30 Jun 2026 11:18:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818286;
	bh=eQ3GvzMAQzns7P+jIgolRkBG8gE6axpXemqtRSMIWYU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=ZyFGv+DYhBpRCc5d4yzqr7qMoCChDCyQbai3K8X4gZ5VfZlfV7QCFGZkIn7/D2Aax
	 HZlnrHObybB30VMTNjl3jV/xacvEVHXFQ1ny0q29BVJ8RB8uZvXvfH69wMv8LMXsZw
	 c/FxDXDsuK1J3UuXVUVNsRkym8dLWGpB0Frh5P6nU2GGjhAsXWbFAV8aphJNMvJOvo
	 EqZH3JYIV3mPKkU0G9eRpp3+gRz9UR8A3YXKApgSwFcsfutvroNBtVOYFIBq98oVqT
	 zpFhrmvEwCyHUncVFnGRqF+8yR0AfcGhYjLoxuFMfn6Wn9GkcrDCdep9iTydslTX6a
	 xgO1SGwU50KmA==
From: Mark Brown <broonie@kernel.org>
To: =?utf-8?q?Uwe_Kleine-K=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
In-Reply-To: <20260626060427.2548578-2-u.kleine-koenig@baylibre.com>
References: <20260626060427.2548578-2-u.kleine-koenig@baylibre.com>
Subject: Re: [PATCH v1] regmap: maple: Workaround for another
 false-positive compiler warning
Message-Id: <178275697847.47562.10265315267028578389.b4-ty@b4>
Date: Mon, 29 Jun 2026 19:16:18 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1181; i=broonie@kernel.org;
 h=from:subject:message-id; bh=rL2X9OJRGBZfWbpiZOHOWkYVIl3JwwvaEG3SSjjlC7E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6XspCHidb/G4b1C+D/yj8jP01BN0+3YLoNzS
 /3IYMYs4iKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOl7AAKCRAk1otyXVSH
 0Go7B/9WlibxtFkIwYg0vGkJicWbl/6CpF79iivzOPwtjdiF6zsr2Z6L1/R+WZsjtO3ri6JeRWJ
 zvgXcYmZRjNP/VU0ZJGZXaCcrz23HEf8nL7/VcRsNlOwGK32an7k/12kL0w9WYGgi3uhwlHieXB
 /z/vFKzvYo/JZV2gyk9N7rjWw0ih94IlZEfc+c2j0X9J4vVP8XzuDyq7uKUhpwPB4+HcpjcoMHF
 EvPDc9O8nfGGFh3/CKnnPVOKm9alJ/7PT5e4LXy509wQ62YAZjpla1p/3uVbz6iD+aX67zpYBYP
 4PxY/R6+rZtniRJpu74DHVslGjin9X+ikMoX7ZCic6ACeO29
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 26 Jun 2026 08:04:23 +0200, Uwe Kleine-König (The Capable Hub) wrote:
> regmap: maple: Workaround for another false-positive compiler warning

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.3

Thanks!

[1/1] regmap: maple: Workaround for another false-positive compiler warning
      https://git.kernel.org/broonie/regmap/c/dffd32eb2b0e

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

