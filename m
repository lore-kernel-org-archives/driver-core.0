Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA693F58CA
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 09:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783501495; cv=pass; b=n5QyBLl0wU9J4u7MEtGzToneTUNdgmzupxuJSfnp5PN6j20q+K2xdly20SbEOEJB1kCrqmugjDCwMMsGOxOHS8X9G2zGNOYXMZdSxFtbCe2oJB/sQrb2OMSv/Pq2hUSFvjeeJIX04ocFlpqnJXZKyDMJY1IfHRT0YQHWsDOtPnA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783501495; c=relaxed/simple;
	bh=TSK20oxFL4fPpCXh3LY+/9/D15oE9Tg/thOdDQh+fTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIuIZXCYc0O0eA8Cx2JvsyswH5Ez+jTveXI7s1p45HBNp54Vne0o7RbpO6dhuNHsUInmthzz9fRBnCRvELE2I/NhanaFk3UmesfhhZbm/71nxP3Z+4/ofgFawPnQX6wgmF6+GgmTGluaBwAvrTIJrQ+kXwTEQzYgI5Ol5dVxnk4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bd+r5BpN; arc=pass smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bd+r5BpN"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3860f32307bso39761a91.0
        for <driver-core@lists.linux.dev>; Wed, 08 Jul 2026 02:04:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783501493; cv=none;
        d=google.com; s=arc-20260327;
        b=od3oH43rWGUuhRE25fZlrZbbfCO4MzLQYrY3doX6Itd8BZcCFQ+wlC60iLx09hgQY5
         IpannxMc3SoFJ3WCCYpf8c0wONjr695JJ1wsaZ0TUL5nFq5Wj/gGXyDqQqyt1E5aws+b
         78ZVHA2Pkixvc36f6ji5R7n8NerN3uQ4edqW5QkllY9vLv7d879WB0YaC1uNFdoVW981
         fBNv0keaakg0ac2PBql5MYAX4adVlgUs/rueCc/4nSeY4hiT0ksoffD8uCes8wpO6Q2M
         sIT7SjJ/w8/ppuI/CK53fQDh8k+3NyIxnt0aDV3kY/1e+eul7aMCWNI8qxs2Af7nsSK/
         39Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=guYA+I/KzG7Dz59dLyzD4w7QapXwzT7sJq9m8Mey8v8=;
        fh=lpzBK8zXFYhAmXWhLNdSRDj6mfDGv+x/p3M7U+Vk6y0=;
        b=J/LpIW/TtfwDL+/Z7HJJuWXnRhEM6bpLsTeXE3AlXF66yoSSdVldH+9CzIfLaVniA+
         7QzH6vAlepEjLsqkEO3VpXNI3IYogKG2gD8l5NfPtsx7eumPaSSMl7v89N9Lr99mJhXz
         V3YWYog52+5uHmVosFOzvk/iEkhJ6pxaBoimNYACXvZe7afuaVqnR/pLF5EWs2QNvzu4
         jXKt66Z5xyoDESl4GpSWdDgUiIILFuWwHOv6pGB+jJSVOCWhO/eNPXot8tMZa2qAXodw
         kbqM2bAqvGpXPUXoaqeHUpBzIpMSPVlJf6ntvXi2mTeD4HUD/9yuyrRYJCgWSZ7nBwYU
         dTsg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783501493; x=1784106293; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=guYA+I/KzG7Dz59dLyzD4w7QapXwzT7sJq9m8Mey8v8=;
        b=bd+r5BpNFrjsgvOG79o8WOWDd8KYtWxAC0S32Zl7MIDhkUKHK0Sv3I3wOESWrq0o8A
         Y52E+m3RQbcq2TR1btv0NNjUYl+vfkTuvEXxri5Mjp4M0e1VOBUOu9y5ZtJ6Yv538C91
         wPt4t70wiZqcmr4B9cNmyRKwGMUnSiFzg0bO1q4g3MDb4gbMgW/GyptJ6WRiNI7LjffS
         jcRtZ9oMQO46pPgEfGxnt9eE6ty/34E0tVeQKvSOtzDcERg+JEYBcX9DCTonJJAi/r+w
         jZ0Pmis32gV57IjZ9WVN2XkFtMDKYg4LgmHqvXr453GRr9TXIEyYOjUcqsCn0ht2WZLu
         Qf8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783501493; x=1784106293;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=guYA+I/KzG7Dz59dLyzD4w7QapXwzT7sJq9m8Mey8v8=;
        b=DLdOmOgkOhgPQHdzIE/U+5zmHTztqG1bGEZM2zqTkwAJWVokNOvZeUJHpJXmSn4pHp
         VNlGk0gw45x/tYOUxJkv7RkTl5lCWzIy+98BFuMjdxmsfqeYca0m+GtY5c+pLr6YBTLs
         GFZvgGC73KOc8dO6/yQNV0w5zPiG1rv8kv1uhg2EXzRltxtjYTeBZRMk1+/Cjk8VvTkL
         d6U4rCdQeqc+1f9oyM7m3km8b0FB4l9dOsdBOHEr3ktttlE9Wn7hjNURoZs5djmncl8I
         6nEZ+Le4GwEbC2peU9KUuUswcdU2+RAOM9ofE5V3x6+GgRClLPa1xIDbsfqV5umVfR1v
         Ynlw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9Ub4+jbvvtc+DHYV14ik8RmiSHnRKuKhPtjbpZDWR8bKs6tGuOD/awmQkpYvh97ZTwmNTFl0rmWaVOw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1/GfV+bA7E/54bt8PPLzzBcUWkD/jSAbqzfDuKVe+rTAQ04dE
	LTEm1/18LVt1BQjOllErkxS6CV2FRDWjaGHe0IyAHjBed5QWXsv0hEmGvZNf3nQDg0Wegs0NRYm
	WaoO2zLM0M6B3VNqOAagVV92bTR32uEc=
X-Gm-Gg: AfdE7ckoO4CaEDGEOxS0N949hkhpCP5m6So9IsbQay585RgB/qw+CcoQFAmV5PRGgs9
	bey/g+lprPtbHFZVU3BtTz7Qs1BNvUVPrmWYi4AAYehUfhAYdDpq/Ea31RFQSO8TjWCKV3MfAnm
	WC4H/VRgu7yyXyGIlinwhWQ44zfjrK3Nx2rsRtU/Ayuyysa3k9APkfe8UGktiGLTdnOk5STnehB
	nqNCLgxcwQca5VxhpfHZB3hvkGZ0xYKtVYE+HIetZf1mM7Ab1NZ90PXvT168u2nwJFkZTJP2W+r
	7TAzmC4sC01qq7ni8Q3iuFrHQvJpoevEazyLQviM2EZ3uWfLpcUU0xyeitgRFtjR3lAuLeBh9y4
	1qe+Kz6TEB+Nt
X-Received: by 2002:a17:90b:53c3:b0:380:9cd1:d985 with SMTP id
 98e67ed59e1d1-3894249b34fmr1433674a91.6.1783501493402; Wed, 08 Jul 2026
 02:04:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com>
 <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net> <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
 <DJSEKYNY1LJ6.3SWGGDXKIURC7@nvidia.com> <DJSET0S73YYD.2HCX79F9XAWF3@garyguo.net>
 <DJT1OEEX0LQU.H9DPHR1SBN9X@nvidia.com>
In-Reply-To: <DJT1OEEX0LQU.H9DPHR1SBN9X@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 11:04:39 +0200
X-Gm-Features: AVVi8Cdb6NxHFf7927_1Qu0u2gy3sTXoJPcVLX398UrqIxExItRjkOXEdPdZUYY
Message-ID: <CANiq72n2KwCE1DCp2HR6CJF-vR-VNBYFgXYv3j0Kvv81dH6rng@mail.gmail.com>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 10:25=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Done: https://github.com/rust-lang/rust-clippy/issues/17379
>
> As for this patch, I guess we don't need it then?

Thanks a lot for taking the time to fill the issue! Linked to our usual lis=
t:

  https://github.com/Rust-for-Linux/linux/issues/349

But why do you mean we don't need it? It is still reproducible within
our possible toolchains, right? Or did I misunderstand something? Or
do you mean it is fairly rare and thus maybe not needed?

We can also always just disable that particular lint, and perhaps
later on re-enable it conditionally when fixed -- we have support for
that now.

Cheers,
Miguel
