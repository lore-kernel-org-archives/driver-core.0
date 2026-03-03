Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B758D429834;
	Tue,  3 Mar 2026 11:20:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772536826; cv=none; b=byaQ1swwI7sBzI9doMsNrJjj3ObJh1o769q+RM7JynRFrtF7VfU8f+TB4zvHk/4VOCgxvjSvytBbPLuRl4PBt7insghGnTJzQS6l/m6O09u+e6Fvur0UToxSlS696ntqdfUFBQNQdbBqDmdu2pJW12yXHOBsxn0vFXOWp6rTQdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772536826; c=relaxed/simple;
	bh=L3V4tJYX07pPZskL3yyr+i9g3iTS12jNKVP58j6D198=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=stfAYqipT/lAvGaKekfGGDiKB87WlUUoIS/ZHQ4fCpdPoStrnwHwR0LPHHESBr347l5xFjHnu1udfB8Vod9wwrQC+tOWP7CUnGtJx+8XxXva9hmnhXBb+1ZqMut7ezMKu+MG3BrZe2u1E2LUWvXgakB18E8N60VfNeCAVB1pbi4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DAgMo3q2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DAgMo3q2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7976C19422;
	Tue,  3 Mar 2026 11:20:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772536826;
	bh=L3V4tJYX07pPZskL3yyr+i9g3iTS12jNKVP58j6D198=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=DAgMo3q2vZkUhJW9ZxQ7gVubQXpqG3zekLqH7naviIUyH3KiMIku3zHYy2Pm8fk9w
	 ICSAanSJUG/Yoy4HOQ+HWvd27EiI0KqtywWo+A1UhV1v/G6M52z5k4TbZanSlZQRqa
	 lmn+XK969vOrH0FD+/Vq79SvUEZSp83k8sviguvWSOHvf+TrKowGqyBOQwcG6Ms+vx
	 g2oB0E7ZMxbEtrZHzstJLLVF88TJx8ZdlhfpBs/oXIX5drJ7KgdPbpxoUbtEoOIFut
	 TGJwZpBj7zQgmQRv0R132qy+WTLVcsTA8NJOUcZUXMrsbJwkczLqjpvr2u2x4Fa7Ma
	 rno6P3wXsgyRw==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
References: <20260302095847.2310066-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v4 0/3] regcache: Avoid accessing non-initialised cache
Message-Id: <177253682469.22980.6848298061373148002.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 11:20:24 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-38bf1

On Mon, 02 Mar 2026 10:56:54 +0100, Andy Shevchenko wrote:
> Refactor regcache flow that populates cache on initialisation phase
> based on the values in HW. This makes code robust against any possible
> accesses to not-fully initialised caches.
> 
> Changelog v4:
> - made conditional against 'count' to make it less dependent to the previous code path
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/3] regcache: Move HW readback after cache initialisation
      (no commit info)
[2/3] regcache: Define iterator inside for-loop and align their types
      commit: 8e29bc88e11928926fd97fc9acd58b8afa38de9d
[3/3] regcache: Amend printf() specifiers when printing registers
      commit: 9ab637ac5d3826606947f4e861107da958eda324

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

