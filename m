Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59D3D3F2109;
	Tue, 14 Jul 2026 21:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784064287; cv=none; b=ZzuO+tkObO6oIuY0ZjvKNebTDc3iuflRJGmtNwRnxam+bPevGQXyT9JrkLHF5D/VUO90zdpT4bYj5YoQH7AGK5ZiUm0jVO4R6uT4/xfoTmwtKJLqazVf20m7zE82TQdloZNiiTyl97PE7u+ETPgA96lCA+E+kdyEzDs/YLI/+Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784064287; c=relaxed/simple;
	bh=XodKX8kDzYzSf5RHFKYCtHkm+Us4gQYc38ZaRVstET4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=nSyj5xS1iS0f6rvQh40lufBPba5FJ7oZrGoIQ94rw9/a74JQngsTx2pPkOumbhGfDOGsAOmxkw7uoUdxTlnqgSixUaQqzdry2qJ7NBP9E6caIWlac9T67wyOF1QSsIiWGVQBdC3ZhVHqd0TH5KlLmMyqZQ1wk9H2V2qrB5ZXAho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=X+I4BXUk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="X+I4BXUk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0596E1F000E9;
	Tue, 14 Jul 2026 21:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784064286;
	bh=rABmSSakLSqgXlownE+lacAZiRrP9NZg28o0uWsuo0U=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=X+I4BXUktCuoZ0UUmCvyTJ2vBjOhkzc6zQY4KOGrlqwFBQEybsnhn/H3y678wYK1q
	 Bm/s7sxRPtRxL/LkaNeffgeD6E58VSzwdwaxRVG1HKlwZj8xI8eg+YNMCoI/cQXqNX
	 79pD7Fr2sQd5VtdLfIztnDfYxmCVlk9RMkxJxTBH8yonZuAMv/wjaOghk7N7NWhMu5
	 F5LJHqrcn3ipSoZX4LXqlRGzejCw/kUrMtTmUVqGmkqcOU+9I6Kk6L6XOvZOAYNToE
	 0MQIJnGxDl25VOIlKYD+NssdpCS481lkAfkEPhINUK9k/zm/fcvHdBCFxaaLPeR+QW
	 yxJgxR/N+7gaw==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
 phucduc.bui@gmail.com
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev
In-Reply-To: <20260713050312.38729-1-phucduc.bui@gmail.com>
References: <20260713050312.38729-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH 0/2] regmap: Improve error handling in regcache_sync()
Message-Id: <178396517374.7914.8263258886614694556.b4-ty@b4>
Date: Mon, 13 Jul 2026 18:52:53 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1537; i=broonie@kernel.org;
 h=from:subject:message-id; bh=XodKX8kDzYzSf5RHFKYCtHkm+Us4gQYc38ZaRVstET4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqVqkcxlgFi0x3uEmfJCtJjUy2nQx/9tUh3Qrje
 nnfrhpCgv6JATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCalapHAAKCRAk1otyXVSH
 0D2pB/4wX1giBM5cuXZOn0rGXB/K6wk1f95hwaDuOlzbw6JNbCL9zHtoTRJZS+kfDn2O4mdHTZ/
 0Bsv/3Itbl3haNqqu/OiUZGjoMC9TR5C/36rUq/NCT5xSs5AFdqYhPiyhGR2SM4AQKEmnTP7nEk
 NNKRIUoooOXEN7K/bdJp3n/WeEHAtWphljypeCmK8wFqqGf0pjWc+MLokZ9NsqDM7J9wKo63gu9
 XE4Mzcg6KZ4Zg+9yseUyfFxJV2nPngzp782ssr0Lt7QCHmYRd7hHWMIVw5pohfsX8op90tQRbQU
 hEXBzQ6m0D5KmXbNzh/10w6DgGLoLed2QU/XE9nFklxT1ERc
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 13 Jul 2026 12:03:10 +0700, phucduc.bui@gmail.com wrote:
> regmap: Improve error handling in regcache_sync()
> 
> From: bui duc phuc <phucduc.bui@gmail.com>
> 
> Hi all,
> 
> While working on a cleanup series converting mutex and spinlock usage
> to guard() helpers, I received review feedback that regcache_sync()
> still has a goto-based error path.
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.3

Thanks!

[1/2] regcache: Preserve cache synchronization errors in regcache_sync()
      https://git.kernel.org/broonie/regmap/c/85da24aac16a
[2/2] regcache: Mark cache dirty if selector register rewrite fails
      https://git.kernel.org/broonie/regmap/c/a7d168db6bb7

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

