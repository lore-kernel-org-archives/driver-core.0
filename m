Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3B7839656D;
	Tue,  3 Mar 2026 19:20:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772565655; cv=none; b=I/8lFdmirGAJfCoikZh/Il0Z/WsG0EdgSMAOAFLQ5+NSGoiqIhWHNaaD6/WgKWgFRgOrVV6TbF4Cde+m94c4jp3GHmHWdB0mkbb/FKBoqP6jO9mhs+gO9xRtFRtImXMF08HFiXprX1q4fFUpzH7yfe6OcJvPtyOA7JRF2fluTO8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772565655; c=relaxed/simple;
	bh=xPyzrXXknDGlQAabDR8G3bl9jKR7Mg3LJjOznNcqx70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Message-Id:Date:
	 MIME-Version:Content-Type; b=OFuWtQALIr5NwKLbREGsDRE9bNnWSatoyjv5hhthBCL8ip2mkknJ5f+cP0MIyXRlfnlv02ic3qVTDTapg/9eCk/V1IkHSVJSbKmaeBuxXm+00VXUid2wTCFecBNi41j5T2vHFk0pYG8o4JCaQicnbjr7A8Hbr5fz1Yhy9r2nv00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cjEtUje3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cjEtUje3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E47C116C6;
	Tue,  3 Mar 2026 19:20:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772565655;
	bh=xPyzrXXknDGlQAabDR8G3bl9jKR7Mg3LJjOznNcqx70=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=cjEtUje3/Rd5zi8iCGaEl6wr/hcK4x7YLKLJkfKUoM9zE4pyfr5dGAatd5citKAHf
	 btQ2mYwXdbC2XQTV3GSDRoUidvcl3v+ujq2MyMPtgMI+TqcH6hAc2zApY6dcAgyxYT
	 p1UwAekV7Fr9v+UNBtozfvDcSYX5uWFGaeio0IQzpZARK45dSZaEllmi/wuiZWkPQh
	 Ad6kCCiVsHhvI8GLG3l97k8QGcI5opw4LcvbPBT95HGxDbiUKkBRyq3EZ2cQpr5b9A
	 rdByrMCuhMBpxdpwg7UuEPpD7Pd/g241SmVe7eM7bLMiXmsiaNlRUhcbWC2ZqGS+Sh
	 TRAhS1P55P3Qg==
From: Mark Brown <broonie@kernel.org>
To: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>
In-Reply-To: <20260303092820.2818138-1-andriy.shevchenko@linux.intel.com>
References: <20260303092820.2818138-1-andriy.shevchenko@linux.intel.com>
Subject: Re: [PATCH v5 0/2] regcache: Avoid accessing non-initialised cache
Message-Id: <177256565408.593362.14430861700818639895.b4-ty@kernel.org>
Date: Tue, 03 Mar 2026 19:20:54 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.15-dev-6ac23

On Tue, 03 Mar 2026 10:26:23 +0100, Andy Shevchenko wrote:
> Refactor regcache flow that populates cache on initialisation phase
> based on the values in HW. This makes code robust against any possible
> accesses to not-fully initialised caches.
> 
> Changelog v5:
> - added a precursor patch to make things clearer
> - also put the freeing resources into an order (Mark)
> - dropped applied patches
> 
> [...]

Applied to

   https://git.kernel.org/pub/scm/linux/kernel/git/broonie/regmap.git for-next

Thanks!

[1/2] regcache: Factor out regcache_hw_exit() helper
      commit: 9891b52ba12e9d5fed5901b6b5f6e0cdcd424390
[2/2] regcache: Move HW readback after cache initialisation
      (no commit info)

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

