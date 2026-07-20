Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B813F37A837;
	Tue, 21 Jul 2026 13:54:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784642090; cv=none; b=ZAsHXQJVH6JzUzwSeVAZEYkaYT8qGRBQBC37xt8ABwQmaAoLpqkBqmA4ks180RA+g50iuL2tOpSzpfgDA7BDkr1jX5fgAY7OBQJDwgNVwsqHn8mX4AbRGjJy53M6sl1Fbg6L2/I6ifBdHkNYquoNk09Cg3vzQojFEKD2nin1ukk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784642090; c=relaxed/simple;
	bh=FF9rS+ReoCXHytOSPXaCePL2FdI2VEDWyNA4Fj7nrA4=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=ZW1m5wLLfTQKYKpgwBd/Up7p9okp3kB9H2oWnUC5YgJi5IoMwQfnqXerThB2OySs4b9zpy0fc26P93eGWcBjoRYawipP8h9MFiHamv/hwMhjjB6R5L+/tfr5ZlHj2d2maqKg4sHwVRJEi1cI/1f0y6XdaFlYpB6n+vtqOIaFjnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QbebBn3b; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QbebBn3b"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6445A1F00A3A;
	Tue, 21 Jul 2026 13:54:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784642089;
	bh=8s6CKK6FCeMcD+wqnsaLU2czurQavQAzB/tAK2UyUco=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=QbebBn3bNEyeN14QKmNhAdESPJyF87kn5hQqFJ/I4EJn/tPKB4qALFibWrA1cpSZF
	 H0phDl0dgWhATo9d9RmUIZGds72C88fyQPAUeB1LsFBF6Llu0YbsbIs7x5QRCTIUtg
	 97zeK0YBzYtCSHvbPUlrvgStzNDwgxGqwCs7OholeOlPY5M9Fq6foBxw5e4A4Bv+xA
	 dmuyqjlUJI22Jhur5k8RBZZzDMODh1fR6hKFi9tPkK2Xdwro+THrFwLUiZ4x0iH2Lw
	 B5vxGpRLiYKJi0BvH+OG96rsVCjOcDoEU1YinsOMapAwmf5h+rxmC/D2OWq8DGhoWH
	 1mT5Jq2rr/7BA==
From: Mark Brown <broonie@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org, 
 phucduc.bui@gmail.com
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev
In-Reply-To: <20260720033238.52479-1-phucduc.bui@gmail.com>
References: <20260720033238.52479-1-phucduc.bui@gmail.com>
Subject: Re: [PATCH v2 1/2] regcache: Warn if regcache_sync() is called in
 cache_only mode
Message-Id: <178456956836.8049.7756959916636897984.b4-ty@b4>
Date: Mon, 20 Jul 2026 18:46:08 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1282; i=broonie@kernel.org;
 h=from:subject:message-id; bh=FF9rS+ReoCXHytOSPXaCePL2FdI2VEDWyNA4Fj7nrA4=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBqX3onsoa24cCFWqO7K9PbGrgDWg4ePM9M6BFQz
 T71DJJa8QqJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCal96JwAKCRAk1otyXVSH
 0Bc4CACFS9XBoadKp6uDp9M3o1PSi9ABItcLU/vCt0MWEuhDhaSLQijSQ4dovvlcxHX/3PHiFHC
 8ixK7dbCqAXkka8DaTcSTksWGrLGDvwKdCzMdiVPAseYuvhBTzBPiGMgYomz5dvLVIedSvOy+Hv
 bVfm0g57Bvlv2t0cnYxeeZ3Hmvyb74ObcjAGn8uxmV7xgrvzvXhUFwHY11vANwWjqXw0FmUcp6D
 skNvyjZzFvotJMbl1IlF6niBY951vA37osrEM/xe/psKhLmRb2bpnI4HYh1nwyX8jcITus8F3fh
 Icr2XbYhnggxlaEmXaxPrGbTPYuEb4PYxGY7H3NoyCZAXQyI
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Mon, 20 Jul 2026 10:32:37 +0700, phucduc.bui@gmail.com wrote:
> regcache: Warn if regcache_sync() is called in cache_only mode

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.3

Thanks!

[1/2] regcache: Warn if regcache_sync() is called in cache_only mode
      https://git.kernel.org/broonie/regmap/c/86fc3483a4d6
[2/2] regcache: Validate cache_only state in regcache_sync_region()
      https://git.kernel.org/broonie/regmap/c/afc8e3ee8307

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

