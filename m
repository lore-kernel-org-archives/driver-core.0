Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3562155C82;
	Sun, 26 Apr 2026 23:22:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777245760; cv=none; b=LphpTbSf/i6WSQRFwzKM5t+DIpa3cHc2jSKw0JAlGCFlau6p3uOQysMCRtFlwW6H4iJhhxSk+yBHAHKYgys1/SeYitmx/5csWHGPEc1qzl4GjKk6lt+TehS1K61OUWzgqySoyzb43Wn//QTzHCcrG+2d6g3CQn7aTa1vH+bROVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777245760; c=relaxed/simple;
	bh=orqz2mRcZUKZiHZW9GTq9x44PkvtNmdegWLXSMtbT5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=u71jKigwrlAlSXd/OrmdAJMMONg5/zUB9cCGw6j55B4qA94LeBMgYDfqypw3cHVz0l3vmzUGbndTZ53dYtYlhTkrdIcfWU/LJbOAz9WX3xqjm525qdrF+Z8RfRkbH+y/ezgGXtYpmEPohaId293nKnJ2jf3I6Fjyek1ohmTh3CA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C59u6eiC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C59u6eiC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 21B0EC2BCB4;
	Sun, 26 Apr 2026 23:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777245760;
	bh=orqz2mRcZUKZiHZW9GTq9x44PkvtNmdegWLXSMtbT5A=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=C59u6eiCwtDJd9JgtuY6LeV3/0rq/QXndxZdBnD+a0rasKYwZmdixAdJGTIvhkeC6
	 LDF6fdvu0ys979JfRXZcdQDFSZoW/CjvA6PQhySL4aUCEIQdIdUtUblfM3wwHT5Tkf
	 t5eU7sFULzf0KUllHZT5mN249D2l7jUEN3VCr+RrQQ5SptDpQAF0hPUb1Pypq4oUH3
	 fupJht4H2zF69zxMpoQ4sGVwXk/QPshosOK6a5pFOnM1NC55skknUF2yHCd57aJE5b
	 uXNLcV1w+CP/6Y1cvx0GAc0i7pCcm4Q0gBRgqXJigDLxf4R/7DM4fV1pdrgaCHdABY
	 sHxJ23PvxQulw==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J . Wysocki" <rafael@kernel.org>, 
 Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
 Colin Ian King <colin.i.king@gmail.com>
Cc: kernel-janitors@vger.kernel.org, linux-kernel@vger.kernel.org
In-Reply-To: <20260424112425.32129-1-colin.i.king@gmail.com>
References: <20260424112425.32129-1-colin.i.king@gmail.com>
Subject: Re: [PATCH][next] regmap: sdw-mbq: Fix spelling mistake
 "undeferable" -> "undeferrable"
Message-Id: <177724010094.266775.3336175787542373376.b4-ty@b4>
Date: Mon, 27 Apr 2026 06:48:20 +0900
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1160; i=broonie@kernel.org;
 h=from:subject:message-id; bh=orqz2mRcZUKZiHZW9GTq9x44PkvtNmdegWLXSMtbT5A=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp7p4+y17PDwaf6rYuxZVgz41OnmAf5W221vs/B
 ceE+cm6nemJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCae6ePgAKCRAk1otyXVSH
 0K4vB/0fQWc/dJSIhZ8EFVaoj7s3PQ6xhCdcVy2Ds3xa/YcSnkhKtLmNDER18KYger/vo0TOkT+
 3x2JE+nnjjkv7soJA/dqCRsp/G3hQpWOZ+eprVe/DeTxRw27v9kpciqRewRy/+iWI3INeLQKGwV
 hNu5Y5Rn6hblaO7mCVCVuyQ0CBIPAjlIvIHYaTSWkSPqHnTMUdhNHCK3TJl2cdzEa1h1HWuzt5j
 6+CfuTk6CjCO5dC8Ztojtx2B9RxqVzVmkXTN+KHLYznLr92DPh5HfWTJ78Nw7qsCWx6KY7lP6H2
 Z6nHxoz+sVxfCY89NT38XoeJy7ST7Myz5xL3HKEzIW3TpSjm
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 24 Apr 2026 12:24:25 +0100, Colin Ian King wrote:
> regmap: sdw-mbq: Fix spelling mistake "undeferable" -> "undeferrable"

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.1

Thanks!

[1/1] regmap: sdw-mbq: Fix spelling mistake "undeferable" -> "undeferrable"
      https://git.kernel.org/broonie/regmap/c/4b7774eeab8d

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

