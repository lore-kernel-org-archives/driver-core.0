Received: from mail-dl1-f54.google.com (mail-dl1-f54.google.com [74.125.82.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2E4436A02F
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 05:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781154597; cv=pass; b=Ad1+CXzobNgEWAuNY36WhO7vsyOLhykIDlkSaVzwc7VhbWjsNajRTWOQSeiO+bNYWurI3l1GdEj9jrkGbdgtFAf1MeP+WXwY71cqPnARyr9O/Pf3Kld7QueVVLFT1baRoxMuwyNHRrV6QV/wK9vM9jooXQlbF75o2/MbY7/8Y4w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781154597; c=relaxed/simple;
	bh=8CQLlPE10gtfc+80LGNUmW64kb5+lwCt/hJuXkDKz8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zt36tYqgyQXYWMZcoAstv58t0JRinmOIIRJwlT4p7cWe2Xp4PQis7k+p4Ot+5UM5LzXOTz/l/00pStQefn6QQXf0IGM98B7RiQs4qVHi2fdrmiNylysNL9D0QJijip8mwQq5OlqDu4MTHIP1r14MCIyPMoL80nGh3HwY2kReu7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WN5LWP4w; arc=pass smtp.client-ip=74.125.82.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WN5LWP4w"
Received: by mail-dl1-f54.google.com with SMTP id a92af1059eb24-13842cd7b13so9503c88.3
        for <driver-core@lists.linux.dev>; Wed, 10 Jun 2026 22:09:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781154589; cv=none;
        d=google.com; s=arc-20240605;
        b=BPynn2Oxdl2AT8lBhOPXETnoDGxUXRt7xTyWyOdIST9oHBZ9zhProtb6AZic19iR8a
         mBwzPq82XXRuGJJc/3Eu3Qjp+ABw7SulCl43vEcgpybl0GRJxRT13RW3cS0rX8rE9HeI
         VhWq15imaEmSFF3KrSZyNKASYsxduupbOlwk81UsWAr4UwlQhPx3hBD+481gzfhc3Vbw
         ijVepkdbCi5rgXa88VHsjKEaN/tp5EBfyulRRBRvijB4gxfxTNPyN1G2pVH6GzUUd0Zx
         SccUGrDpNO4OintNZMwjADFQR0K6po4+4jmq25h1xasfNDtSyQV5cFfd04zSuIxOR10u
         2cLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        fh=Hb/2iiL5ugQvTRf4pzAa301NqmjNCDj6aq6Brw98jGM=;
        b=PN5wps3xA8asDAl3JPzH+WMBZ2g0dEBLxwXqSowZvfsgpn1mA5nmncA2mLk70XJuZ1
         1kOpggBCs4fd+f5V9NonntdtmKDwEv+IaVFDiMVq1laaBqeID3TZjyT4Kn++FwKVBV73
         ktJWs49uhiPNnRG68TFko2vaErVFhWM3Sl/qwcvSGZMsc8YI/bwB7/JaVCCNHeiD3Kbs
         Jn4QHgz7kCYrrCDHRjrTMVsq/aIuvjiQlp2UcRyOHTSrOQce+nKuuGhpQWwikskpRKkM
         8vbHjroV6EF7Hemik2QxvxPmz3lAGMeUKUdSeTHQXWb0VhdEmo50jBZdhGrIMEhlZiI+
         Kcuw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781154589; x=1781759389; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        b=WN5LWP4wJjst7PLke9zvRSLycrTw6/1EO8VfQZhNHXS5fgbgU76HdJTGCQFUwA92tb
         qGjPLY/WS5+DRKZ0jxxSCRW4gHrkNpLA+gwK0KY1jnmnD0pcge9Sw+nOT7Hpw4Nij7Vv
         +kQ9gx2Dq2Rwn5G5rjsvbWfZIQje4gOifnabzdyPdezQSKJ3nBr8rAx9XhuctJZ5E/b6
         k+nz/tRTX+oO37T6MzljRhTPncBTXyYkMOexBkiaDQ37qsvTTr/j8maL737t/ABXC01+
         k/ajXsCtlHBZ7jjPWo5t5eNT5D0dGdQWoXamPEwGErU3IMAcX/hrsySdkFJ2HZEHojAz
         APaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781154589; x=1781759389;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lyFerlgaYrMaDYJQQ4DjXG7o7AcnUs9BuBitZg+XRxc=;
        b=cfqhPkPpSWYxIzfV5BMP1aRxSFhOa7VMAragZ3nvxj7j+ZHdKh9He+VjNLRl9a8NaE
         ywJGxk6x5dGSntU3YlGShnNFHgkSd6AHMUV85ZxLuriBfh4RsctFWFxOo0SnGUaVmJ2x
         wkuLByCNQG1P0Y4RtztdZ7oW+oJU2iJPd7uzNIBk2ETwesG+vqJzoU0QaEMioqWU/wv/
         Xd7NR5lDlAz6e4nsll29+4SBojGo54fkxQNe9qxzoPE4A5890UeMxBrJZcRJz+ktnBq1
         gt8ckBRZI2Tu7CMWgnbID4zQQn/b5k3ool0hnnH+8rWe4jOmJ4z9II0ljypTg16GKmgM
         vFig==
X-Forwarded-Encrypted: i=1; AFNElJ80nCaQeobJC4MZSBS/OG2YJ7NJPtfRHAV24Lh0Q2TQdmXN1vY2W298Xxmd/O16vR7UTIpCPVYS1aJy1g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgnMlD4fP+WYISHCQlvf1387X6zIw57M1CsLkj+kzpogfc6bSQ
	ivzjW3UiPnDLbXKsmJ7a6l5r8H/JjNdyqNsqt92BXgIyLcg8IHbZfA/gFJzfruo6t5sTeBNwpQr
	E/OjO7u12jXFnmclZPfGcv5KqQqIGvvo=
X-Gm-Gg: Acq92OEHd9BLENOMkbL+C6FgpzzDL3Vfyvys3oETNKwlPn9YB9DhDy5UKwNVywMrC/A
	7yCyphLU1sheCS/psdc35oUNisPXmIhAUXmY/Pv7QchKndP3uI4mfS++d1I2/nDF+Yrk07waPIy
	7MJGEGq/Sxy0h+OnI4z0N0DfP/YIUDsCruBzliCR1ZLBhTCWO34VGuL9ebWGznvjDOs0w+G3oAL
	8MvdLp5xcSM7JWqXq7yfInMMSnXd7gZX8FZG+y1TaTr+UEaZsyTMLsgergvxLBdIp+6V3q4lz6B
	NT8C8bXviHzxVOJq90f1rQr1QQZvWd3F3CYsvEgDkw3xxtiL8wvb8/Rythd/pmgbiPMOOKsVYTj
	SsYPCK41bREv2NJ+F3ejn/pgdx2HmbChTkBB5zTIS+Izv
X-Received: by 2002:a05:7300:aca2:b0:304:d700:1e90 with SMTP id
 5a478bee46e88-30804a5f5e2mr536231eec.3.1781154589390; Wed, 10 Jun 2026
 22:09:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608-io_projection-v3-0-c5cde13a5ec4@garyguo.net> <20260608-io_projection-v3-19-c5cde13a5ec4@garyguo.net>
In-Reply-To: <20260608-io_projection-v3-19-c5cde13a5ec4@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 11 Jun 2026 07:09:36 +0200
X-Gm-Features: AVVi8Cf920yVhFg_hQqFb2LNc7XWN7dI5ldNW7tmfqMVwtmKAogJd1U0zilXmbw
Message-ID: <CANiq72nLZPG_Cnf+R5B4CoxzbLpOWy39A+hiVtetDD7zT6MgRQ@mail.gmail.com>
Subject: Re: [PATCH v3 19/19] rust: io: implement `Io` for `Either`
To: Gary Guo <gary@garyguo.net>, Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 8, 2026 at 9:59=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +/// General purpose sum type with two cases.
> +#[derive(Clone, Copy)]
> +pub enum Either<L, R> {
> +    /// A value of type `L`.
> +    Left(L),
> +    /// A value of type `R`.
> +    Right(R),
> +}

[ A summary of what I mentioned in the call yesterday so that others
can see it too. ]

We had `Either` in the past and we ended up removing it in commit
28753212e0f9 ("rust: types: remove `Either<L, R>`"):

    This enum is not used. Additionally, using it would result in poor
    ergonomics, because in order to do any operation on a value it has to b=
e
    matched first. Our version of `Either` also doesn't provide any helper
    methods making it even more difficult to use.

    The alternative of creating a custom enum for the concrete use-case als=
o
    is much better for ergonomics. As one can provide functions on the type
    directly and users don't need to match the value manually.

We also wanted to try to get developers to provide more concrete
enums/names for their use cases, instead of using `Either` whenever
they may have two symmetrical values.

Anyway, if we want to re-introduce it, we should likely add what we
had when we removed it (possibly just reverting the commit), which
included examples etc.; and probably add in its docs some guidance on
when (and when not) to use it.

Cc Benno.

Cheers,
Miguel
