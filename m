Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98BAE1448D5;
	Mon,  2 Mar 2026 00:32:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772411527; cv=none; b=DxmGYhElX/Z5bQvsm+KxGTMkze3+r6ZphMsCRigRyUCe+89GP1FJg8bIskaLhsRFcdjx6Ix4up7d71n1pNRJixOmUVuasUIArR87kahylLekCMoLXTjglYn3dpfy8eol/DwP1b8Q11JZc5yBoiEpT9zZOwbg+P3FXGplCk6cBuA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772411527; c=relaxed/simple;
	bh=X4BqFgfef+BYo+lRMvKVtU4vcor5y6s3S9IfvTfuKOQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=PTNYrxmO7cwWvcGecTKlxGNFuI2CFXRqLPOf7bB/rINJunMZO28uI3Z80sQwbE+xO1Ay2Ht81ZGFO2uxFUJ4ld8lry8+l5gqFtJkzFksBamFwJKjdjeBV8z1fzhs3f+nYWrC8ec0ctt7IRiE/3ITNDa0WD05jgYi5B4IKDfDcvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IfjGa2wC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IfjGa2wC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6945C116C6;
	Mon,  2 Mar 2026 00:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772411527;
	bh=X4BqFgfef+BYo+lRMvKVtU4vcor5y6s3S9IfvTfuKOQ=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=IfjGa2wC+iGQr7Fb/ihozsfA9MP3Tcc7aMKbbzWc5mNRaG7jHncCS1BC5NoGNKIAj
	 SWSTdxkEiEZoBHKLZK+oNdgKXKo4HdL9QalsjhTnkmWNgiFteZXVEDG0QHkWqNyRNP
	 ExGqqPbqUQDy/2NJQ5eTI3387EyZZfhCHvofqS4eUM4QgbHDY3KvLBT0J2rWwAeivN
	 h7+avMdEGa2tbqk3t5VP461JkBaCZG/OaGnO749IJBdxhZJ93K/pyMcBvF/J+vLYKV
	 R9A8my7y2hJwkjutGNmmlbtGpXdE9EEv+f8CvtefBugWcfYTn6vw3UuNdNVOgV+gLk
	 oA1JTQray4azw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 01:32:04 +0100
Message-Id: <DGRVG5HM7NU8.3S1TSSFMVI4ZA@kernel.org>
Cc: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Danilo
 Krummrich" <dakr@kernel.org>, "Linus Torvalds"
 <torvalds@linux-foundation.org>
To: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <hanguidong02@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH] Revert "driver core: enforce device_lock for
 driver_match_device()"
References: <20260302002545.19389-1-dakr@kernel.org>
In-Reply-To: <20260302002545.19389-1-dakr@kernel.org>

On Mon Mar 2, 2026 at 1:25 AM CET, Danilo Krummrich wrote:
> This reverts commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and commit 289b14592cef ("driver core: fix
> inverted "locked" suffix of driver_match_device()").
>
> While technically correct, there is a major downside to this approach:
>
> When a device is already present in the system and a driver is
> registered on the same bus, we iterate over all devices registered on
> this bus to see if one of them matches. If we come across an already
> bound one where the corresponding driver crashed while holding the
> device lock (e.g. in probe()) we can't make any progress anymore.
>
> However, drivers are typically the least tested code in the kernel and
> hence it is a case that is likely to happen regularly. Besides hurting
> developer ergonomics, it potentially decreases chances of shutting
> things down cleanly and obtaining logs in production environments as
> well. [1]
>
> This came up in the context of a firewire bug, which only in combination
> with the reverted commit, caused the machine to hang. [2]
>
> Thus, revert commit dc23806a7c47 ("driver core: enforce device_lock for
> driver_match_device()") and add a brief note clarifying that an
> implementer of struct bus_type must not expect match() to be called with
> the device lock held.
>
> Link: https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kern=
el.org/ [1]
> Link: https://lore.kernel.org/all/67f655bb-4d81-4609-b008-68d200255dd2@da=
vidgow.net/ [2]
> Reported-by: Linus Torvalds <torvalds@linux-foundation.org>
> Closes: https://lore.kernel.org/driver-core/CAHk-=3DwgJ_L1C=3DHjcYJotg_zr=
ZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com/
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Follow-up regarding driver_override: https://lore.kernel.org/driver-core/20=
260302002729.19438-1-dakr@kernel.org/
