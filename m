Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A92D236437;
	Sun,  1 Mar 2026 20:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772396516; cv=none; b=aGTMaFZdqOiF3cUvScgYpvgB9hlCTyA5icqKMJ3A9FVy1hQvLPgamc+8QqjDQa5ZgLNWugC+PIa3K+gj6N8aXVu4Cf6iNmh1qIyn0WbN++UcBnxRONWmi5Z/9NZvnqXDNDzckVU8lGVuEldomxPlYYOOIoWKthvP2UhugKXCIM0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772396516; c=relaxed/simple;
	bh=4GYeBy+GotxMjL+edNMYEso+qubhExcn05CdUgWDyuo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=nZSRrbhyakma7a9iFmJhHrSvHm9cUwgWVfv1TA29rBMRR9jMcvZ6ULUkN7EIWgcvnx99nfjFSiUSCK3wzncSpK/HJ/JgoK61mXkLg9DJFhRMG+qJDamiYVeNHYh31HysZHQ0l7XfNSABqA9ihtVB721ZU7pG9gSLVn6Evr2UK7I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HYsJt8UG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HYsJt8UG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2482FC116C6;
	Sun,  1 Mar 2026 20:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772396515;
	bh=4GYeBy+GotxMjL+edNMYEso+qubhExcn05CdUgWDyuo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=HYsJt8UGGGCv/OwsNKA+mxkApmgvXbHYxGE6gZ+ffNxf/U4Df36TyyVUU/kxWu3NN
	 VkjeYB8bpbzDkUU4zSM59FppC19n6xhSczbvm49lRtKbMc9nRIAFQYalcxfJkzHI7V
	 4nhr0QVQwMeHuFwS0JIaKr4WfxBIou28XrsMlWhgtYpLN/cmCx+pDumsbqCyZ/pxOz
	 LpBfHAaKgU8Y3AS+x70S3KTRikmIWb7QtQRNd8bweO+od+0+j13DEksy49837A8/pr
	 lvaf5aGfFUSvrmA+3pl8ERJs2JmMCZ9MvXQMcQUM+gtr8My7V1yQeZIJo7Pf6Z+4xH
	 GnWvnr2kMUNag==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 01 Mar 2026 21:21:52 +0100
Message-Id: <DGRQ4L6IAZA6.3LD6VRCPOHDWX@kernel.org>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
 <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
In-Reply-To: <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>

On Sun Mar 1, 2026 at 7:17 PM CET, Linus Torvalds wrote:
> Use some really simple local spinlock lock to just copy the string
> into a local copy when accessing it - it's not like it's even some
> arbitrarily long string afaik (how long can driver names be?)

Yes, that's what my code in [1] already does. Actually, I think we don't ev=
en
need a local copy for accessing the string. We should be good with somethin=
g
like

	int device_match_driver_override(struct device *dev,
					 const struct device_driver *drv)

which internally compares the strings holding the spinlock.

Otherwise, since you asked, the string length is currently limited to
PAGE_SIZE - 1 as it will be copied with sysfs_emit(). But as mentioned, we
shouldn't need a copy anyways.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
