Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E22E4A23;
	Mon, 20 Apr 2026 00:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776643456; cv=none; b=aKZb3OR0PSadf2qRfxfe03i7BPFnBuTzL0bo7hRjFn3/YvYYfm6pyPb2nTTQKDMR8BHqL/YSCgXa532q4UxYasCAsSbB2QIiS3jfTxhbBJHFmLyvEG6myQ0e+cCQT2HjV5o6lJM0Til9hL6vOO01yzjpiG7A9GWPZdZ3yqM49Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776643456; c=relaxed/simple;
	bh=tbkb6xf9e3d3290ndCYLYTYAIFC/XnWpfJb7H6wBoEQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=E6OnKMRmz41dquacIY57/OL4xlIB8I45rrdSmpHJElvuaNDqn3u+7zZNG8Uo9od3OBOFqJ77sk9R7HYeBv8RMhOSWm6kPp3M1fxoEzeA6wZ0fQtFgmshJXxxTgWJ0qUojMUAGZAvN71476aZE+cKfTfHUW+E1G65B/0qQN9XOHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OIEBQM2Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OIEBQM2Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CC9CC2BCAF;
	Mon, 20 Apr 2026 00:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776643455;
	bh=tbkb6xf9e3d3290ndCYLYTYAIFC/XnWpfJb7H6wBoEQ=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=OIEBQM2QKvxLhAUy8RFAXYmpquYBGLdnPM8rutaagVOoeLzZXcwlGWvP7mLNAb1hq
	 49A9twANl0JbvyBz7jjq6cNrexPaR9SWBB6DYLKqiRHh7X3yr2bERM1mkVusRMSb++
	 bQsrz1CiSGXnceWaWaPLgalZSKuXY0lalXV2sycPidxIiOESUWHZM/gkSVHrImMzKk
	 v+pFNF3OI555U6LDP3P+ksWj1MeMNGt+WPOxlVK6Ix1EvGeMNx29IuO7Bip1CivMh9
	 Eu1ZNjxTkpcsuwbhOMe+EDvpj42bpvJixI8W4iQwF+0Y1pmQMfYDI+atQDc81/OYrU
	 kr1ElcU8u3S9g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Apr 2026 02:04:12 +0200
Message-Id: <DHXJJISFLXVK.2KURIQTX2A763@kernel.org>
To: "Linus Torvalds" <torvalds@linux-foundation.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [GIT PULL] Driver core fixes for 7.1-rc1
Cc: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Saravana Kannan" <saravanak@kernel.org>, "Andrew
 Morton" <akpm@linux-foundation.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
References: <DHX8VZYC4ZPZ.10EVXYC94K10Q@kernel.org>
 <CAHk-=wgKsB6SqFbOgPVpBLh5vz1T+h4MxTX1qDEYH=KH9=bXAA@mail.gmail.com>
In-Reply-To: <CAHk-=wgKsB6SqFbOgPVpBLh5vz1T+h4MxTX1qDEYH=KH9=bXAA@mail.gmail.com>

On Sun Apr 19, 2026 at 10:28 PM CEST, Linus Torvalds wrote:
> Ugh. This just looks disgusting:
>
>         device_lock(dev);
>         dev_set_ready_to_probe(dev);
>         device_unlock(dev);
>
> when all it does is to just set a single bit.

It does look ugly indeed, but I think apart from that it is not that bad; t=
he
device lock - except for the exact case where dev_ready_to_probe() is check=
ed -
should otherwise be uncontended.

For context, in the original version of the patch it was just another C bit=
field
at the end of struct device.

I noticed that this is racy as adjacent bitfield members are not all protec=
ted
by the same lock; subsequent patches from Doug (queued for 7.2) convert the=
 C
bitfield over to this bitmap.

IOW, the atomic bitops are primarily an implementation detail to prevent
concurrent modifications of different flags from corrupting each other.

> Sadly, I think despite being disgusting, our bitop memory ordering
> models are incomplete.
>
> But I think dev_set_ready_to_probe() could/should use
> 'test_and_set_bit()', which turns the bit setting into strongly
> ordered (it only needs "release" consistency, but we don't have that).
>
> And the dev_ready_to_probe() should use "test_bit_acquire()".

To be honest, I did not consider this as we generate all accessors with a m=
acro
and all other bits that we convert over from the struct device's C bitfield=
s
would inherit these semantics.

Maybe that's not necessarily a bad thing though -- another option would be =
to
add dev_set_##accessor_name##_release() and dev_##accessor_name##_acquire()=
.

- Danilo
