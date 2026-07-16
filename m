Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC02F41A55B
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 12:18:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784204298; cv=pass; b=Jh8UHkQ7yi8x4EIQaAmc2hS9zLSZfqBpxWB4vu/46bWcq3ty4+Oi0IQaybcPdWiXinIChikJJx1beSwluKQjGSZXNyepdO9GwNUZluvnmQsl3ycRmIii6ZAgiDZfTZlyTfjXuKvkYv6TTjhKCNr3an7+43d3/SIni+EXBkRqieE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784204298; c=relaxed/simple;
	bh=qeCZE0Y3mr/J0JsfPOHL/DiAQ1YvkRmztyR1MwtxFq0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B1rlANNRE5pZrgN8ul9pnb/SgQwLJrZS9c9+SCO/7Vnth2kgicOalCabnmhtvqN0NKDElD04Mckt2mhbEm4c53bTnmDwNpBSJk848ZcfrLO3baxcSw3YXFTcF1EmA7/qwIyn5gV6RqCdl/pkKUR5yb7jDnieoT5KhUhDIdTxllc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gbAk3sQS; arc=pass smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gbAk3sQS"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-ca6bda96134so407208a12.3
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 05:18:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784204293; cv=none;
        d=google.com; s=arc-20260327;
        b=qe7Rez9OOGNfJz9XAYLir1G3GqTodXvs4NMVMzrVnP6kGfz0sVz5p+OktuBZ/MqmHc
         qKJc06ahvKRXe/QVX0njtSW+REP7qZ/A+pdoMgpbKoATNj8I8qZClRXDGI/DMhLZjuLB
         JPOGvE2gOMztud42VrPeKNsJqnLeekkV5DTfnLT2jGz1S/ru+CKgehHf5EceJddT2ql2
         qwKULjLIRKqiU9BrV6R6/1lo6VBlgRhR3UQygJQGGzU69Bg5Ye84KGfDAOAF+5Rymt9t
         CR8Zch0Ze0Q+aTWxR5UCPVI3P/BHb3ozgH5tNHMa8+t2arMWV7h6kWAOjn25dajDlu05
         Zanw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=c918aQ7k7uX1GyNkZQnbAfatOcsaumnLiScuoFWDMmw=;
        fh=jlmzumFG9wDlvyOSTuBuj8tCgzSdl1EYAM2MJgigQTw=;
        b=BhJQOVMxsbFtH84uHL470usesba7XWBqAHi9+ONwCF5RlDgPIkgEtdqlmwih70zA9U
         Y5Rev6o+MjBHZTMKXVedBwdW4WTFpInoMGq/l8W9rw7OYQ857HijIsgw8YuybKCxDW/c
         VvHKSLnsSuyhLkYAOuHY2W8QEcbrFH22PZofRsGGSVRQTQogKSQwm1kszZKGYRce0AKv
         IBiyxABqrTuNzfQO/zb4aBn2x9Q6+RygYtuonB3PeAKW81qG4opd5il9TuGmhqKzz6/Z
         V5PoN7CrHNTv5ko+QX9uxhCcA+GkWIsFAu9CPT8RjRD1VtDKi53T+f7HQnVivVA55iTq
         vdtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784204293; x=1784809093; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c918aQ7k7uX1GyNkZQnbAfatOcsaumnLiScuoFWDMmw=;
        b=gbAk3sQSmYDWmerBBAycS51fSJO06MAoxUOmZWLnmcz0tasI+xMPczr/5z9MPnlXdN
         1Q8zcamv4k5rzVz40AZo2abiVic13Vpu+lGeViNYYuvbNpX1IYhjDUGEd6hIxBHrRHbo
         NXRZ0t11at/2lUdLHjF157V3Pw/rPqTydG6LPIpppWP2C9xzBOcbiYtSQgt5iwXZ1dqI
         g57v+oiIkr8THABznd62Z6PO3jc70r0hmad+Hxvx0Z0uVl61OO17RrbOm66q4yOMemyh
         l6KFlPCVElOWpnYjL5uhb89pSLWHp+ErIB5eZTM+I/7HLcQeeGlyexQVJmevbf9ZhHCN
         mvDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784204293; x=1784809093;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c918aQ7k7uX1GyNkZQnbAfatOcsaumnLiScuoFWDMmw=;
        b=MSktGzmgJ3Ow2SRoP3G3MnizudhMFEfbVfYErf3juoYvnV/jWNf2A0m+iSQapX5Hil
         JzpQuaZMY+rEdMkw3t3Lkf7S9UU1KMf7FdCjGTacvNjhVzmxDMfizypnIStetBaZ/OmK
         dWASXIGYMsF4KiiPmnyFFAZHlFOAgENaDhT+HIFnrMunebzGOb7F+1gk1kRK3Fdnq0P3
         AfEapQN0/RJScGwQR9fEmlHbueyAUu6cr0PVbjkIx00jWNFd0LdtNcNrMVcEjxqrHgZz
         tKxIvtbxRUaAWVV9esyaJbq8BtDSOx8OmoKnJ1lfUErbWklbtxcE2S6das3iVgqn23po
         EvKQ==
X-Forwarded-Encrypted: i=1; AHgh+Roqmlz4cWX5lnqhPbURpYM2U00OlTCohT2UL8i+K13ifS5WQkAA20PLtV8+3Qd0UzBwiZX5cpToH0qwRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyD7vjBW321SKgjrvK/ycnA8Je+T9CVHpqUYOoru0gXsTnzFTFE
	38+BrjtUNyqWt2yIyPZCqW2KQ9p4w5qh02UXI6rwR7A/G3LIPuf2Xys2pJXp2W5EXsHi0jA7bsK
	sy1RR4jGSWUo0qL6Gopd0yXWeDnu91Eg=
X-Gm-Gg: AfdE7clMHb9hJpZ9638yHeFvBEqe58pBfr7CRCH/F3K4+vVFDcxZ4+EVCHM2jrLUHZ3
	uifps522FGG2SHc9aF4dmmmsrB2EYggssnWZx9SbKa5YvbxczcSZRB08gN08Q3oh1HG7w6YzeGl
	T9aNdHKWJjFYX3IgzAG7nCIboqkaPnLMSyGFtsIO7ihdWW1Ek+AAVVsQEsKdNUre7CtMSllZmtm
	3KMFo38OstbBojAKUcmuqCLE5XeQ6ISKjoEyWQKLAJtNbvC3zqNkQ0KAityvWNH4G5b3fWyvp9m
	Yf7turJ0m8fZA/OgxL/0ASA+WVE02cFWQJZSh0pLnyLAVt6bIDjoPAlDXe552dPa0ab94pSPIxG
	TLA==
X-Received: by 2002:a17:90b:4c0f:b0:37d:f70f:fbf8 with SMTP id
 98e67ed59e1d1-38dc76069b8mr14068130a91.0.1784204292951; Thu, 16 Jul 2026
 05:18:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
In-Reply-To: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 14:17:59 +0200
X-Gm-Features: AUfX_myevnsR5Su-h4NLGTu3-mxvvsCDC3uCj12Aik5QGhF3XPcyxIyrYw2aShM
Message-ID: <CANiq72n3BYGfB9VvLk4-bBQzGy9YhDxFvCrjkjJqBbcJa5YRYw@mail.gmail.com>
Subject: Re: [PATCH] rust: device: avoid trailing ; in printing macros
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 12:22=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> These macros are used like expressions, so they should must not emit a
> semicolon. This is being turned into a hard error in a future release of
> Rust.
>
> error: trailing semicolon in macro used in expression position
>   --> drivers/gpu/nova-core/firmware/fsp.rs:79:34
>    |
> 79 |                 .inspect_err(|_| dev_err!(dev, "FMC firmware missing=
 '{}' section\n", name))
>    |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^
>    |
>    =3D warning: this was previously accepted by the compiler but is being=
 phased out; it will become a hard error in a future release!
>    =3D note: for more information, see issue #79813 <https://github.com/r=
ust-lang/rust/issues/79813>
>    =3D note: this error originates in the macro `dev_err` (in Nightly bui=
lds, run with -Z macro-backtrace for more info)
>
> Cc: stable@vger.kernel.org
> Fixes: 5c7ca6fa603f ("rust: add `dev_*` print macros.")
> Link: https://github.com/rust-lang/rust/issues/79813
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

I was doubly surprised since upstream made it a warning by default a
long time ago, and yet we didn't see it; and since I hadn't seen in my
CI even yesterday.

It turns out this just landed into today's nightly:

Link: https://github.com/rust-lang/rust/pull/159222

  The semicolon_in_expressions_from_macros lint previously
  suppressed warnings about non-local macros. This masks
  a lint that will subsequently become a hard error.

So that explains it. And this is the one that will make it a hard error:

Link: https://github.com/rust-lang/rust/pull/159218

Ok, I will land this into `rust-fixes` then, and send the PR during
the weekend after tomorrow's -next.

Cheers,
Miguel
