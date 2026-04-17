Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D483B3859EB;
	Fri, 17 Apr 2026 12:27:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776428843; cv=none; b=Ga1tRlXJY3GcZahDze7yhGUJ3PM1beJ4rd22POl8VVqBv5Ps3s2DIyOJQH6cJ3LjTw/4lDD+M2brBuJU3fWh4k/O+/V8UXGUu2CEcWETRKJWHXrDeEHQw0/56R8eXaPdIEkEaydjmrcQ6i3UKes2p26zGy85aFAQ6kVO8ex0qcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776428843; c=relaxed/simple;
	bh=XDQ2/MkC95HcLun1tcM+P5u5Tazywv4FiW28ZjP/72c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=XmOqsd96efiwAd3yJhnZq/83rL9htjuw1vXmIbXT8T4DXwB4jqSUssuS7SkJZcjbnALvpjZSqfq5MvlQ9mJgiAjKR0llGHVO7BocfZfWZW0mLFwG/9Mx/g2BWuhvF2Bqzme5kDz4CotGl7eU/HaBoe/iCJz7XBrSFYmVnt45144=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eIVmwdFc; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eIVmwdFc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E38CC19425;
	Fri, 17 Apr 2026 12:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776428843;
	bh=XDQ2/MkC95HcLun1tcM+P5u5Tazywv4FiW28ZjP/72c=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=eIVmwdFc1hrUX70rrgSu6te0SnHpzpJb8Edx94NzC3lLP5gdKL2KSq/Oh74Ku7j3C
	 qaBem3TkXXwebO17+d/qEhl40GPz4XPCxdYpHOrOmmJt8VTdjGykJJoHF8V9nr6UOu
	 83NPrzXlniOk1VO/Tq+ZGkDTQ7sfmD2YAoW9tRRyDTmBPYWNLZkLMRE14XrAYgeDLf
	 KMiCIop4XK77HcSFyDk5pphi2PHisx0VyA6FmXQfRomRRTNtkMc+7JLbbcC6T2pq9N
	 +xkS8147EzQS6J8DQPI7HRYT0/J6ZPaRglqZEreSOYG4kbjBMKDxWZLgCdGI+VfLfe
	 xVh7FzG6g2Z2Q==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, Yuho Choi <dbgh9129@gmail.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
In-Reply-To: <20260416235630.78408-1-dbgh9129@gmail.com>
References: <20260416235630.78408-1-dbgh9129@gmail.com>
Subject: Re: [PATCH v1] regmap: ram: fix memory leaks in
 __regmap_init_ram() on error
Message-Id: <177642405980.37967.8507961006938952945.b4-ty@b4>
Date: Fri, 17 Apr 2026 12:07:39 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1138; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XDQ2/MkC95HcLun1tcM+P5u5Tazywv4FiW28ZjP/72c=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp4icpRM8gRqqll370aT/0eea6nkht7wNF3cnxx
 KFuCuFNC6aJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCaeInKQAKCRAk1otyXVSH
 0P1YCACFPB36JVx6IVzNZq3KfoKxXiBZszPWI8Fq5zk2qE+yCs9f6wJvzGQ+kb6Eegd9mn/LNYy
 Lo6KvFyO2JeVqhPMOySXZeLF/lgHomD/uF8mQEa+UoouSCOc4hlWTWZDLK+B0XowyK9bQ9QgM1Y
 T/Pn7TVxHPal6y4T4+bAdv+0PfJ7I2QBeBsTjOycMvO1ycXRlUvAucjUqrpwNzYtawa5r0vRNWL
 vYwnVDptMW4L77cuSMl6hCbaZs3ZQspg8zZobp1m1VdxUloOT1aS+e0S7NDB9Hk0MIsxnqDkQln
 EALDk2oQOtS1mUfA2xrEwc+sXjHKHIIAOrEwvZEnL+sf9ZOT
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 16 Apr 2026 19:56:30 -0400, Yuho Choi wrote:
> regmap: ram: fix memory leaks in __regmap_init_ram() on error

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.1

Thanks!

[1/1] regmap: ram: fix memory leaks in __regmap_init_ram() on error
      https://git.kernel.org/broonie/sound/c/7e555fcae40a

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

