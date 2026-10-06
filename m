Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88FEB3D9545;
	Wed,  7 Oct 2026 11:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372939; cv=none; b=hzGPenpmDS+IC2KdbFetX9LDA2tsJTliDKrn0/1mh0yKZXoFvt2WBAMD7LYWowTkrwmq5nCR2BylCdLzr5dgXrhPZfeQmzlxxNCIZ68UZzBFHzkHlzTFba3quTwQgUQXyTGfENE9iM/7pk9Wkk1r25/2bkgBlPI/SMTEBnlpxsU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372939; c=relaxed/simple;
	bh=if1QtF21btCYMGLwSLhli2AGyswT7VBJXoe7bvq74zc=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=QKUb0dNrMzSv3SbkYpjzlxspQAG5yaGp5dtEF3yqXo3crK78jWhHEQBVk2TVSKiRGJWDhS+bipQanZDBQ8HdU2//pAnAZOEx7dm/h8uEapGMZDvNi8VTORVoaHR5G37oXrX0J8DdzXAAhGI+xFXBt//4x52F/cwBDmPcwXykaVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=L+QRZa8D; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="L+QRZa8D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B550A1F0089B;
	Wed,  7 Oct 2026 11:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791372914;
	bh=+JBFGmZWdFbeurgO/BDqXCk0s+tmo4V65f++jmQJYZU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=L+QRZa8DF27mNy3Rdji/bEVUKEZnAXMudIkgG02t5mTCDDciogyEBteWj65Tqa3vs
	 RPwoqeu36vAxrJL1IRJMf0i9mk5r17WRDD/+yrtUZh7JfXysesy1ex+2WN22oyMKDx
	 UA4lVv3EAXZEADjoirKklZUNtFFzEvZ7PbmSrtEWA5pGhZLV2/sVFsjDx/zNYYZmb7
	 /v8KhZ5owMkfOummYJUm/zstf2qzK+ybl+JeHHJl9oGZwzHhR1sLxNCcgDh5jZxdcs
	 4Nw9mCaxvoatnVje9QidHXPiDV0HGgqzawVgMwNlXFUYoNdu+Sn6buygJ+Hl58HACc
	 ZKmFJqEkmNoxQ==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
In-Reply-To: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
References: <20261002-regmap-lock-2nd-v2-0-e172b0501c52@nxp.com>
Subject: Re: [PATCH v2 0/7] regmap: cleanups for regcache and regmap init
 paths
Message-Id: <179130291324.150114.9760230237322324458.b4-ty@b4>
Date: Tue, 06 Oct 2026 18:08:33 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2114; i=broonie@kernel.org;
 h=from:subject:message-id; bh=if1QtF21btCYMGLwSLhli2AGyswT7VBJXoe7bvq74zc=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqxi5tQRFFHDY7CyzMDhKVXITbDst5CrO2IEfd0
 JgiBdRdOSGJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCasYubQAKCRAk1otyXVSH
 0CrMB/9hZwrwMXmnBK7WR7yFZVZIl7WJjsl3fUHoJaljctmT7h8OO/fkfY2VMx3ZrHhSt4pa0cv
 heZICnp7ZFhwn68dQCIaFXGjHQCAGDQN51sGvUDtpDq6l2fdAo4RlwbQ2ISD9uOyFVHNeI7TsQg
 5FsOp55kA+WqaSgt60mlLDbgXSqFecyB1v/59sMyTXQtDgp77oSXLkcWl4IBkXZGPjJVfYF/2Ul
 hA5x5Ci4QafseY7+jrAeKvxSmrcTi5xENzW+zd+tM6gMVIXKFZBI6mYe3Qqyi6S2r1CoBI5CpzS
 BGOjTg/lXsiji56FPSvip9L+S4CkePyT/D3gedV9CNQ6QRwe
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 02 Oct 2026 21:11:16 +0800, Peng Fan (OSS) wrote:
> regmap: cleanups for regcache and regmap init paths
> 
> Following up the previous regmap guard lock patchset [1].
> 
> [1] https://lore.kernel.org/all/179062150526.139547.3870545428656485907.b4-ty@b4/#r
> 
> This is the 2nd batch to do more cleanup.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.4

Thanks!

[1/7] regcache: extract locked helpers to replace open-coded lock/unlock pairs
      https://git.kernel.org/broonie/regmap/c/81556a7aec22
[2/7] regcache: extract __regcache_sync() to deduplicate sync dispatch
      https://git.kernel.org/broonie/regmap/c/7ca8aa98e2ba
[3/7] regcache: simplify control flow and reduce nesting
      https://git.kernel.org/broonie/regmap/c/4e1b5ccf1eab
[4/7] regmap: use krealloc_array() in regmap_register_patch()
      https://git.kernel.org/broonie/regmap/c/8a889c83e478
[5/7] regmap: fix potential double-free of map->reg_defaults on cache reinit
      https://git.kernel.org/broonie/regmap/c/ca685a42b0fd
[6/7] regmap: debugfs: Use __free(kfree) in regmap_name_read_file()
      https://git.kernel.org/broonie/regmap/c/d64967dee82b
[7/7] regmap: debugfs: Use guard to simplify code
      https://git.kernel.org/broonie/regmap/c/a93de1d65c6b

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

