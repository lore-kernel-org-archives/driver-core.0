Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0300B404BD7;
	Tue, 30 Jun 2026 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782818247; cv=none; b=rIn/N789WgjbQcxvWNFGeJiMx82hSLRNTLGdtgZC7fys4bkdDL8ZaBBM5FR1MtMg1ZIKG58p4fXqs0tKyjr+yoNiTdWcmKNDqiyMjiM2PHv3B9yGkL0jE9Ig5KGF0+KJNCuqPppBip+V5GB2dJemXz+B67dU/MYb8z07u2eAtRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782818247; c=relaxed/simple;
	bh=ZvuMnKN2ht0aaJpZc8rd//MxRc+pDgfx674SWDPzs5E=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LpYyd6+Ff4jN6uYbG0ar6sYXbzrWw34OsgyTRgy+1c8n5KvfgoAk3o2azNqS4bBvyJkwX3EirooiFlNzH6NecUbjfLvP+FVq02GoB3mu4ddIBWYdCwW9oCVvw+49eRi0wKnMJRveUSwlL5pblJfiPeOgEJuccIOs1E/9v4YAzUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OmCP64y+; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OmCP64y+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 95B251F00A3A;
	Tue, 30 Jun 2026 11:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782818246;
	bh=1qXT64OhLyZEoJym4nyCgxBLbYuZVA7Zt9PN0L7MfDQ=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=OmCP64y+rT0aJ63vXpL1uTvIjELXNu5uLbwBubx+lZ/qhoU8bqbZrQBT1P7A66HPK
	 VcuWAkfdqe2N3J1kr8nP73+/eCNygNd98pBoLrksD/YvPVrLseq4fb/EnGrdCncrse
	 Wscnzkx1LUL+8hMxGq/vzbdWdtx5ujk8YDDHFPrn8A6+iZaTLR5TipdO+N10R9McCT
	 T+kzWu7ixVXst/P0AelWc4o1oDPBdAccm2LpFsStWhLnXfAoHiHYhNDLGCsYUkeL27
	 /5fVx9e/HHM+F9g1M0qzqB6YFcCz/EYazdJHpBMZ2mfg0nL2Xjt3C0xjDdFpEy23XU
	 S3uha76nQQv/A==
From: Mark Brown <broonie@kernel.org>
To: Sander Vanheule <sander@svanheule.net>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20260618194036.3275202-1-andriy.shevchenko@linux.intel.com>
References: <20260618194036.3275202-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v1 1/1] regcache: Make ->exit() callback return void
Message-Id: <178273908161.47562.4222259876617439877.b4-ty@b4>
Date: Mon, 29 Jun 2026 14:18:01 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1111; i=broonie@kernel.org;
 h=from:subject:message-id; bh=ZvuMnKN2ht0aaJpZc8rd//MxRc+pDgfx674SWDPzs5E=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqQ6XEaVc/6/GmN483fnPZutO9LPF4asK+VWP1Q
 EeZbadb8VKJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCakOlxAAKCRAk1otyXVSH
 0HKZB/40sZfBlKq0K8lYIe3uFok1WatTlLuG+odKXiPiuMvZXPbpsPe586AFW7zg5ec/RYoG8wi
 K1FAyRXe71xOKfeH81bBddFzd4MbBiWxYGJhqMI+P7p/WzcPQhmVGVI2DAss3VmKAs1BGJcW23S
 ULJ42Fh7Mp1Zln3eQSekWkUxTa7jTuebeNKoO/hH6tzBE2aKxnxp+dQq58ffu1UBxVOgE0/WnCv
 IIWPPGbyJ7I5Yjk0tJogaSe0ZOCRPqlbvmsrZ+V7sBTgUaWfiZg3vxHn+tI5DfUbaF7MWY/VbM2
 W22ZbWcJITulIIgJan/QQzx90M4YYSjgC/MVqCDAxkcNx84q
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Thu, 18 Jun 2026 21:39:50 +0200, Andy Shevchenko wrote:
> regcache: Make ->exit() callback return void

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.3

Thanks!

[1/1] regcache: Make ->exit() callback return void
      https://git.kernel.org/broonie/regmap/c/e427e1832bb0

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

