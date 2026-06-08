Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5CB2E718F
	for <driver-core@lists.linux.dev>; Mon,  8 Jun 2026 07:05:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780902329; cv=pass; b=U+LypYcmkd0GDGibGRQkvhAX/rjn6AFeiZPPuaXSBbnUebacKAtYrDfrqaHySFL7YfS2YpqpWYMSqgaw9/Owc4B8LVirExKxJ8IKiSKb92cl2PAP5ZeAtTsICL3QZzIE3xtzfWFrjaSlkFZ3M7bwXv67bMm66DdL05tRgkB+HXk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780902329; c=relaxed/simple;
	bh=E6S/j+KIAIqX6WyFaTTwCZ6dEIy8HQ+cgTxVUvZ+vuU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tQ4oa8NHA3/32CAQuCJh8mfbgiyWLtZoROmPuocYKqKUSIDydPCp4uYKBYrjdGnMVCWAOp+LIMXmaZ9wmmbAFwIK8Coiys+IQXqfW1tPgJQUE8od6i7wg19q7mjBxsW3FXx8JqrIrsXpJ7BtSp6+kX2ZEcbcDouXnhy4F4aWmjY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JIiOTd/x; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JIiOTd/x"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so321891eec.0
        for <driver-core@lists.linux.dev>; Mon, 08 Jun 2026 00:05:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780902327; cv=none;
        d=google.com; s=arc-20240605;
        b=Yg1HLhhw72OIRU8KBopoESrxkg/hcSVqYnzLURS2w6nN9qay8OwpC5ZrxLYxF8s8ay
         3tIuSQ11qP7rklHgfN8rlFFCrXoV8kqSMpjsoVPhssGXLLbi/MDAWF7cp+lxEbp3QMoz
         CTGKzxs5VBpsA9jPu4jkUtEmPNh25jVV83lCZqxfouYLXW4l2BbdpjDvrety6Su5bpmW
         3JU3wSOhtLFL9uqKn7BhB9aq+3rcceAwe+1AZrEZQWvA1w5jMcS82YOAx4QeXMBuxXBd
         +9qvOBMyxsT4wV1WVemUxNhRL69WF4/XDMOOLVfMnzDY+JzkZdHg6Mh3vGjJGCoeYtFT
         l9wA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        fh=0IY7fausbaYGM/mV4nM16m/i0ivxW5sZNmYj4dfBQ/E=;
        b=NwLxa/E0WvnnLhFUekfwkpHxc0pULzXOd0N+c4FGtwmrhp56XIM4MT918dxoBYsODC
         IGtn7uCwCjPzVgQiJHMsDQqN9FM383IxrMCDcLglYknbu0eu0Cs+gpafJybNfmSwjG99
         ILeRFjD0lHfPTNdrHM0lDAeP+KP9IWixNKEIShQrvEUyu8ceTjvlwx5MMKCVdOCHdh5R
         6qLoGR4++U2So0pq7aiwVJy4LtpLxK1jkaDYqgmiSpOyPihAxXJnpbhmQrSlNcHVWqbT
         oY+ew/dKllFkhmOTFaL2kWn/IoBtwBzX6S94iwX7nATVVo5XqPWrEdU6HmREu/1keuxZ
         DfJA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780902327; x=1781507127; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        b=JIiOTd/xEtoe6MZ2zT8gnqNIUVyTBEDZJdtpyrEV8E/ns27Nupv2cOzZocCE5UZNCW
         dWu6LaJ0n62gY6R26xz9Aibuau0+GYG9NaIuwmRJQD3wr45ZcYog42vpyqP2OZ3m8hFo
         /Hp4aEACnshl2arwoB6/+BNq5x6+y3mS48YLHAtZFjnosP1RDIQc+3LQC9pdSG+D7KRm
         u0SHRJtQHGu8qEffKLOTUeCCPmLYoChbtQ6E6/DC3u4Itg7dBtv9T6aBYTddbHiaS6Ft
         cWR1LSX1Ku7Fn4tZpOs8jLJSz1qJ9IKeO9kdoF2GhQxURl7b8vHay82a54mCHZ8bR5Tt
         uqUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780902327; x=1781507127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OTgjDjW0iNyWJGjqvsWZoe49w6xSITfHiVT/lKWAqV4=;
        b=kUReFRwmlwBrly8+O6lsXJxDVKhRMjBnj12FuVkj4Dpr+UgnNIq/ZFndIfYNOZF6Vm
         1zkNU9Zh0C8/KvHQtgZqY91u9F3T97Th8zZUeSIETrbJ7CnaURouzQOil8HGPRhL4Riv
         qdi15JviFHLK2YJodO1Bul8oP+vgR4wHMbEfc8zDWh+aWBWQ5wqLZ6aaDeIwHTihJuj8
         Ey5ZsO7sIUXq/PB4XebslYY7xUcbV1+o+/4phuKnqpGIB/YZH6jEZ9xASUBRckg5a+yB
         hV36krNPYgKnBQLboWadgwb+L7wAsxQE5EJcpw2M5zQBz5qYSOuFwiDnE7FPR2EyxTfj
         FJkg==
X-Forwarded-Encrypted: i=1; AFNElJ+7cJPf6ifXCcKnRb6L9JmSDD+ANuW0g/1IMMwl6Ql5pkkXvzmqGtMwuMDfUdr6fVv4clxEZb+tRWz8rQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/7X1xw8fqeOfvMtbrOly7ZQ9KO9Wj59fomY8191iiGVzV8UDh
	1eS2Xzk3pxPv02SUcpmhbUsHkryWLB3evK3XQqUeFyNc2Uc4WAIV2rKlo/+NhnY1P6OWCly+Yo6
	Nqne8ej5I1H1GC7CskdgrvnSrVcC0as8=
X-Gm-Gg: Acq92OGfOJTciNz+oTwuQJOcBOrB290F3dWNk0IpXaJwDT1yRFHPZjT0Tbz51B6nMFR
	rUzdukdv1hYsrAmhBFxKLIzNp2MIdi0SiNVmFrLIUSBMpHFBuj7hHMM4fJORieNODA/7E+iTrq+
	jIJNigVvv3WkDOMc11XI8uH7fpt7+VwfqahtW7d6r5bxlakvE6wPOTPvrd48d/jq0HyHe9y3VN9
	+wsMF66VR2n20qgtVm4pwuy/pUlRGQBOmAZU8GHD41cLX6c7eDJu1E1ZNka9uDd4bBAjZ67JaLP
	1Lt6PJFb1MCD2UXz0oXO+PHuDs2dCT/zsaNh6grKAp7H65jBjtuzMY9//UuxpLpRykx9zF6wtuf
	uGX6tXdj7EtrFaci1Bd7zjouB/GYATYsX5A==
X-Received: by 2002:a05:7300:80c9:b0:2d8:7302:d3c with SMTP id
 5a478bee46e88-3077b36698fmr3200266eec.4.1780902327103; Mon, 08 Jun 2026
 00:05:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
In-Reply-To: <20260606-bitfield-v5-0-b92188820914@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 8 Jun 2026 09:05:13 +0200
X-Gm-Features: AVVi8CesUULmJzmIG8x0edIeni_P9lO4e6pOHsp_2M6-VMNw_x1NersZexZHfEc
Message-ID: <CANiq72nCi_jjQ=-vYGMNRe2P+m4fEZMcQDnUDb4Nr9+iAiHeKQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] rust: add `bitfield!` macro
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, nova-gpu@lists.linux.dev, 
	driver-core@lists.linux.dev, Yury Norov <ynorov@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 6, 2026 at 2:43=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> This is the continuation of the `bitfield!` macro which started
> alongside the `register!` one before being temporarily integrated into
> it [1].
>
> This series extracts `bitfield!` from `register!`, adds unit tests for
> the new macro, and replaces the `register!` macro rules with the
> extracted version.
>
> I have removed the `nova-core` patches, because the Blackwell support
> that has been added this cycle (and thus not visible from `rust-next`)
> introduces more uses of the Nova-local `bitfield!` macro that this
> series intended to remove. If these new uses are not updated, then
> `nova-core` won't build, thus to avoid conflicts and/or build breakages
> I think it is preferable to merge them during the next cycle.
>
> This version is based on `rust-next`, with [2] applied.
>
> A tree with this branch and its dependencies is available at [3].
>
> [1] https://lore.kernel.org/all/20260120-register-v1-0-723a1743b557@nvidi=
a.com/
> [2] https://lore.kernel.org/all/20260417031531.315281-1-ynorov@nvidia.com=
/
> [3] https://github.com/Gnurou/linux/tree/b4/bitfield
>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Applied to `rust-next` -- thanks everyone!

    [ Added some more intra-doc links. - Miguel ]

    [ Prefixed test suite name with `rust_` as mentioned. Markdown-formatte=
d
      a few comments with Markdown. - Miguel ]

Cheers,
Miguel
