Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4BA1483821
	for <driver-core@lists.linux.dev>; Tue,  1 Sep 2026 16:42:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788280972; cv=none; b=V7zaxDhGs0tZnbRrj+fnXhRSyp/+o6Htl8K5E5Fg4R0iqiFBJR0Vb9gUfldBq4w/rKysWd7/AXjo9WtfFu1fJY7u/I5DQLds/2cHGOZZJjbSleNOuAC2mRkXDjY0h3wNcFsfKlO/VWHRSVSyJ5jzmVxYvzpFCFizmJiamLusiAw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788280972; c=relaxed/simple;
	bh=kl7hPT6dcYIkQgcGIP2OiJqB6Mi21uMkaKppuGPE2Mo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=VhsLyQW1bKiyTDRaUur94YtEk2yeEZb9f4c6ic3EdQVFzITbiO8bNhv1b7nq0ZIlcGNVacRgOMdUBwjLelnE0e38JqjlnOEO09TGNvC9fKerC8SxhfiaML8PlRKg85A86+JD5/H5nCWWs9TgHma38rcsKJWM6gVjmEMw3pXWdbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jdeBORbC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jdeBORbC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 340901F00A3A;
	Tue,  1 Sep 2026 16:42:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788280971;
	bh=jTJZyP3YGROsk98pRhQJIpx/1isdggo6KinkZ46ueAo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=jdeBORbCKKYueBQlG/RQyeMVj7UKUZqNxiHWonsrCjhaPHGxfx0S0jP5hxiyAxcQB
	 ISjq+Ev57zGKjWMlD0qPIkPdty8BKw5kipVg/2vNtOby8MSWIwOjasOo0S5ksj3IAG
	 Jfljn+dCx2nYSqH8PCqTWZQSdHxUqgEsF+HGjGen775cU/Yhhkk9VBaxbGBgAcDv9w
	 4yb0qQ9kn5t+RoDSVp7ddYAj0brOEm5ourkPOfdcDesiEZ/PsVFBb30gGO7xNbWAEe
	 GLPC4817v/YAmdkKftKT6LqlCGaVmaHDJTZgrSp7ALZmSL8C7fTlZbKKlVdH8hNltU
	 JfEthv1pz0JBQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Russ Weight <russ.weight@linux.dev>
Cc: dakr@kernel.org,
	mcgrof@kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v1 0/3] Remove Russ Weight from kernel development files
Date: Tue,  1 Sep 2026 18:42:48 +0200
Message-ID: <20260901164248.1327630-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260818194648.1014604-1-russ.weight@linux.dev>
References: <20260818194648.1014604-1-russ.weight@linux.dev>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Tue, 18 Aug 2026 13:46:45 -0600, Russ Weight wrote:
> [PATCH v1 0/3] Remove Russ Weight from kernel development files

Applied, thanks!

  Branch: driver-core-linus
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/3] firmware_loader: Change contact for sysfs nodes
      commit: 6db237eb5167

      [ Since we have a driver-core mailing list, use it as contact
        information instead of myself. - Danilo ]

[2/3] CREDITS: Add CREDITS entry for Firmware Upload
      commit: 0d3e690c1129
[3/3] MAINTAINERS: Remove Russ Weight from Firmware Loader
      commit: f6d752278c13

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for Linus's tree and should land in the next -rc
release.
