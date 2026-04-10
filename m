Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9147323EA92;
	Fri, 10 Apr 2026 16:29:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775838546; cv=none; b=EtKvSP2HHBSK6TZJ1sCqHlSykXFQfgc8hUdM57z3FlRSDsfqmwYEhS4M6KHrdjSmgmROAZTUffNSaU3Iv7wbx2oC3x+RbcjNG6oZnuq2uMNJoZqbuPby3mGKHSgM7YfNTNfaxMWRl6FqjqkdNb/trqEqDj7jh4/1hPvbcTAyeEc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775838546; c=relaxed/simple;
	bh=6xLSHYoDMC0xfGM/B4QtjaI7CY72Q098fZsNPHo55VE=;
	h=From:To:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=LD8mw/9QKN1rQ3svT8DLQQZZwlIAYMrR7MsWO/NS+GQH555VuoT1Dv0vKx1gwz55bywDg6VzMuTvCFrtVPJTOv+NCtaEtXKat8AZ4Q0WZmV4TZa9gzbLNoHUDlvgm1Q4TKbweLq1eExLI/iGU5pqQaj9e2LDZvQ+cVrWydHzsq0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PkftnhdY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PkftnhdY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 638C8C19424;
	Fri, 10 Apr 2026 16:29:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775838546;
	bh=6xLSHYoDMC0xfGM/B4QtjaI7CY72Q098fZsNPHo55VE=;
	h=From:To:In-Reply-To:References:Subject:Date:From;
	b=PkftnhdY2knQDEuHZ46Zk7aDMReU37uk4P6dQOrc75MqdSk2XXNuDlGqye77mHQkx
	 fpe+tEngASTZFAZmK7Ca8pYxW13XsXycmOP4IgYHbzh1Bg0Uj+BDfTjx3qXC/aVPx1
	 kMwfI/ZnUfaGNRVGaleN0FQqSWG8zcue6mWZ1FQPRUkHEvWJHli5gOdHmPGRNpX7Wr
	 cX+LAc+miZ0fndMAvyD3+/Nt4mozzYETv055LkUNJRnxHP1x5svAdxerIsZi3dcLER
	 1d0nNErOJMSwB4xkLAqWTttzlGNxOqft2IsTjFmkfHxvTzOR7DBJMyvXivzJXz18l4
	 IVv572BgJZILw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Pei Xiao <xiaopei01@kylinos.cn>
In-Reply-To: <a81256a8866b163979a20406abf01df7d7440104.1775788105.git.xiaopei01@kylinos.cn>
References: <a81256a8866b163979a20406abf01df7d7440104.1775788105.git.xiaopei01@kylinos.cn>
Subject: Re: [PATCH] regmap: i3c: Add non-devm regmap_init_i3c() helper
Message-Id: <177581798138.1070744.15627310024357565044.b4-ty@b4>
Date: Fri, 10 Apr 2026 11:46:21 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1116; i=broonie@kernel.org;
 h=from:subject:message-id; bh=6xLSHYoDMC0xfGM/B4QtjaI7CY72Q098fZsNPHo55VE=;
 b=owEBbQGS/pANAwAKASTWi3JdVIfQAcsmYgBp2SVQwx6i4rDgMtzfrt89fLSOio4LhogJuDtk2
 07BxJ49o1mJATMEAAEKAB0WIQSt5miqZ1cYtZ/in+ok1otyXVSH0AUCadklUAAKCRAk1otyXVSH
 0IMyCACFHlLDYrsZEgi8lhnqFCo1jmj/7IlWwVXsJNuWvWgbHzXfzC/TPFNARVshM/FwD0ercXE
 Jglb3Wwz0KN9E+XoDbVh8JW0w3h9S0iZH4ntp4nBY4W7zVPBUsJHV01tm55fmm+0A1XdKxxCp9b
 WWysOLBYx6k7/EUgK/Wqk6bH1A07JKauUESGnhHOr61ETHdZL5QRG00UDJtEC8w9LDF9QSZmmjU
 Rtoh0yf65qgoDYvSG+qMSuubFzSFyiFLA9hxYcTuHJhH5jfEueTV+aSdRj3KJvk/iNoVCn05N8h
 sLXHCFQFnsArTjT5SEUDAUVm/zmekNTOEQ1rLe21vrxLcePS
X-Developer-Key: i=broonie@kernel.org; a=openpgp;
 fpr=3F2568AAC26998F9E813A1C5C3F436CA30F5D8EB

On Fri, 10 Apr 2026 10:29:24 +0800, Pei Xiao wrote:
> regmap: i3c: Add non-devm regmap_init_i3c() helper

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-7.1

Thanks!

[1/1] regmap: i3c: Add non-devm regmap_init_i3c() helper
      https://git.kernel.org/broonie/regmap/c/8ad7f3b265a8

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

