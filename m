Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DACF25DB12;
	Mon,  2 Mar 2026 19:19:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772479168; cv=none; b=oIYaorpaiOYUBTvek7xPoY61iDEGBLShcvXF38+U75uxvXAFmLJnS/OjbywY4Y2OzYF930t/DJQqhs6AK20Q0ImZpGYKS24LGhY/tdYZq1PN3rhSKTgw3QMLtGY/6BUIBPRBCXdGSLv3A3mtNEG7lVC4mf86pDcLZMiAhTm2r/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772479168; c=relaxed/simple;
	bh=CCqxQjqLJhd6fJx5bPkSXLIDKDTwqURw1O1uXRSa1sI=;
	h=Content-Type:Date:Message-Id:Cc:To:From:Subject:Mime-Version:
	 References:In-Reply-To; b=O3BW8GCO0P9SoYovuMP9QRgdPibBE50krND7Z0EZ2+9tY5d1wYQpe2EvJ1JlWV7kQfc1zpLb8SpsWMxD70LtU1rEwoZHTda30Du32Faqj6d551XuA4Mgx/lUAt/93NloQ3INzCayY3R4mnYxgXLEj/9LtlFvPwRYjWnc8CUnoDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LotxE1kU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LotxE1kU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CBADC19423;
	Mon,  2 Mar 2026 19:19:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772479168;
	bh=CCqxQjqLJhd6fJx5bPkSXLIDKDTwqURw1O1uXRSa1sI=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To:From;
	b=LotxE1kU2IwVBddUpm+17cSw/qHTcqwJGYJvjOtHasczPSqR6vdykfw1spet2plDY
	 S+Os3c9X3aUVF5zJXgrJiDxVkPKX5WzrjfoxKDbpBFU49l8t8VOr7nDp0eqg0PNn5y
	 haULJ5iMkwJ/8brNzRZImM5qxYTW7HFUuLUG+yKDTgJM28oJgY3+e7lckqdDRd11Jt
	 UMdAZ8Nycs4vLYqPy9jrTJt9AJwZqP3L4BehBhiT00I6IPbk4z7X2ZFreqchxdlECO
	 Lnspn44RXBj7U+ttRn8jWnCyxJ2RNb+bhwhPsNTeoTMzd7x0yhj9gpLGZi3K8yWlP9
	 l050pzFEsVekw==
Content-Type: text/plain; charset=UTF-8
Date: Mon, 02 Mar 2026 20:19:24 +0100
Message-Id: <DGSJFB8RGH40.30AINI1WBAMMB@kernel.org>
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [GIT PULL] Driver core changes for 7.0-rc1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <DGCIBIK52SF8.3FVF3GR1R2302@kernel.org>
 <CAHk-=wgJ_L1C=HjcYJotg_zrZEmiLFJaoic+PWthjuQrutrfJw@mail.gmail.com>
 <DGRGTIRHA62X.3RY09D9SOK77P@kernel.org>
 <CAHk-=whAU=_wOO9WnaeO2HZVBhr6JLOkCSvToPqHyoL90dkyBA@mail.gmail.com>
 <DGRQ4L6IAZA6.3LD6VRCPOHDWX@kernel.org>
 <CAHk-=wjDwsXRcur+-Mf0UysmNP8Vz2XcETgdp60bJnK0Nm+C7Q@mail.gmail.com>
In-Reply-To: <CAHk-=wjDwsXRcur+-Mf0UysmNP8Vz2XcETgdp60bJnK0Nm+C7Q@mail.gmail.com>

On Sun Mar 1, 2026 at 10:01 PM CET, Linus Torvalds wrote:
> So the thing that would matter is the longest actual real driver name.
> Aren't those typically just a few bytes (eg "regulator-bus-drv" or
> "__typec_altmode_driver" being long ones I find with a bad grep
> pattern that might miss millions of other cases)

Yes, generally they should be pretty short.

OOC, I asked an LLM to figure it out (so take this with the necessary grain=
 of
salt):

	Out of ~7,560 unique driver names:
=09
	=E2=94=8C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=AC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=90
	=E2=94=82 Threshold  =E2=94=82   Count   =E2=94=82
	=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=A4
	=E2=94=82 > 32 chars =E2=94=82 6 (0.08%) =E2=94=82
	=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=A4
	=E2=94=82 > 48 chars =E2=94=82 1 (0.01%) =E2=94=82
	=E2=94=9C=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=BC=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=A4
	=E2=94=82 > 64 chars =E2=94=82 0         =E2=94=82
	=E2=94=94=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=
=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=B4=E2=94=80=E2=94=80=E2=
=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=80=E2=94=
=80=E2=94=98
=09
	Length distribution
=09
	 1-10 chars:  3,513  (46.5%)
	11-16 chars:  3,111  (41.1%)
	17-24 chars:    880  (11.6%)
	25-32 chars:     50  ( 0.7%)
	33-49 chars:      6  ( 0.1%)

> IOW, it looks like it would be fine to just say "use just a 32-byte
> buffer" if a buffer is needed.

Assuming the above is roughly correct, you are pretty close. :)

> Of course, if no buffer is needed that's even better.

Yes, I don't think we ever need to obtain a copy other than through
sysfs_emit().
