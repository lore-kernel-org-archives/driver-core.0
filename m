Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4053A1A9F91
	for <driver-core@lists.linux.dev>; Sat,  5 Sep 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635932; cv=pass; b=UMJc319rHX2PIWjyDjeFQSs6A4MMJrM1CDbhb4G6jJnw9PYqlwa7ACMYSDob6p9rvAWMr+vJZCU7ywJYtvctSNKihBEvD2+hMNksMwNt9WQjnohJ2Dvsi4Ov4o2KPRdG370RPvRrGLc2t6pJSrNv+oJV5kRKtsKEnlYmKsSDKBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635932; c=relaxed/simple;
	bh=1A9tdM4UxvEUDadWxG3NZidYXbKcok5wvUqTQR6GVlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvKO0+GTxpd8S8gcUhAQcrVLJTg2wtSkf+qruVJKnSuGUwm6Hq9QKHUqiXWxFvyMCZeCOkwF6kgCc/W+86/e2jV4Pu5aGPpkJWC0+mA72qcnc7SZwnMqBlfbKL6VJ4SKo1Ji8IZh8izv/c5cxPazgVXqMTf+yY5gkRtyOWxNgd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V9Pei3Qo; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V9Pei3Qo"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b1a806664so170633a91.3
        for <driver-core@lists.linux.dev>; Sat, 05 Sep 2026 12:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788635931; cv=none;
        d=google.com; s=arc-20260327;
        b=GiUKGuwQt/G35QJrY0XGJkBjk0XZc+HHDyuFpEIiTiRbIrxC3yEWLNyh+NlTPrmLN7
         Ku7yi+CYUQ7rlyQ/4W83lM4mpS6pHuHrTKCq8OW0ChSnUoMu05mDGycpQKSoVJDPOx2z
         fPepdaPuFYBkoi3pmXZ5ckaLJASRQozwR3qVAFxbIFydbs+O4AtjvcS4nGjLBgDVyEo9
         CLWV/mYD37iAVRgQ4z0kOtLnIElK9yiUgcPgeKvWaGu2PfRlp6ArSMkAr+UAnqsVvz3c
         I+mZkGKPw84THM93FZdaCpUxwB7DzeV+SM8Y3LQ96P/m7oKGhwQwZ2yhUdBVOUwLkzbo
         JROA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        fh=G66xPhCXwmaIdRI3mp++R7LrBkcVTpTMJxBAbITPpYI=;
        b=FJrl2wUD39xZQDz0oMqbmvtWA8aX8nnEvxeKc9yV6EWnOa4LMNQ9rAoFoL5ovOz1ED
         8nt2P5do+1xhIrskcejQ086vQouRzHcKMNRIQET5H1uZnewgcW6UUhPOEa3V0NKCgqpE
         Zo1Z5LGYtUqDphJU6Ex613PtBbKVEtoK+aePSMlcBRlOZVBKSSlUWyTYYCmlnBwYXIwL
         res2iTQzWiGcYNhV9GXU0+0pIm8soy9xaTq6xpnULH+GSoQbnktALc94Ggshiyho5SvF
         /pWIsKUDSrR24Mi7zNbj63jgsIeQjGo6jXPXeB562SYUlFBhQDc6vlhcNbnQQ5f8rlTo
         /eQg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788635931; x=1789240731; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=V9Pei3QoiFmHeUCk3mwRXF9/718n8xpxO5dDGDt83k4Vl6XxNvO9FalqExCz8izFZS
         ogDeLb9a6fCp9Qgbw53kt39rXqh8uHGXpQ2J+Y8W80uRIxbbC1zOxhNggxGEq15suhpz
         7af8eerdWMxY4iPUgTS/lSrhLftK64NXCD0J4B/dFPPMU+FwiJWa05ZqQnk8dDRYhZUZ
         3RHFmkKweqivyOTScK0oV1mS9fIa/zL12C8sJyBtGo0psEhDyNnf4Eff/UUl8cZlvCRk
         561XwrZ9lqzW8eIHR9urzTUINryfyNvcavCerNV5jPLi6+0b/pzCICeaUBy8FbUeR61g
         s/ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788635931; x=1789240731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=YWadofMNs1AbX/+ikVnrCHObFxG1bOTYrxUDHqU9TvNVdYrXvah91BF2Jdm5jYc4QK
         w/acHs10UKZevqd3pDPjjJGFbDwixROzhzAgapdw+D3fVRFGCIAiWuoOY5Ww6QaJ+jlq
         rP1G465g/m/Zj3IwDkiZcai/0YRCW58tLVzjS3dCIzVmInhV5af3QpOk6EPHUHfuCMvN
         V6N7MZOyvDQA0rehlVfbHaWtrG5ZO7DWCpN9vePbrGxWrDonlWgG71Cij+sGLIj3il37
         cJhtw+93ll27XVUrWZMfU5fy+l63uH4sYOJtSJNEnE4BM9mFB7NSqtvLttm3MeBMuN8d
         Cxjw==
X-Forwarded-Encrypted: i=1; AKwUvBzKCf+Q2GNas5G7RgyXmRnLJmEeUcEDp6m2KUyKV8SJkl4eC7am8NSRDldXTzIdzUzYblXANs5TwjwWRA==@lists.linux.dev
X-Gm-Message-State: AFuF++mpB7vLKgwuUrIC9ybwJFs9rEPsORHqk7In69JcagtvGsz0U8MT
	IfQXOKm0gkih8xCjGvAqL76L3HWmLWDpV9bgQCPa3C3A1aNOcCzCuOuPIrCjuiqEoC2aPaZV3Ef
	ZTGkq6YrjMgk4GaCHOdqFObdul3jyOog=
X-Gm-Gg: AYBFou2FX1nA1EG7muiQmc1zVJn2n7QIJf3GXXQjBgDmM7Oq387+f2ATQ7CyQ2fnqzz
	0T8TzVpyhp9Hzi9AErUmqsb+X2gSjj+v/3fjvBw9nBDfDSjuHbyjjfGf4HFiYfhI/hKuMWyv2yU
	SvarhCeee7YcMiH2CX5oidHluGM6cp0ibG0lIR0B8o0yXwz7uzgAKFzFlAKfnXh1jIjiROioLMQ
	idP2e3X7t5RoAq28GU7L6is6UMykY0ZAnpNz50YkgJqYG/Yxkxxb6T9NhlYE/nA0k7X/m/eg9Tg
	K/QBXvk0ZK4ydfvohLMZTqAh7j0fKrg31dZB1XX9C2PTvdGjcy3w4ChW2lDTBV6y/uqR6+CVIXm
	PjYyYfUS1nMMqqW6/Sm36h5mzGvg1hbukvc7DKSLpPeOjj8v+xWCAvDrt0w9/
X-Received: by 2002:a17:90b:3843:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-39b3d3db82emr6481594a91.0.1788635930630; Sat, 05 Sep 2026
 12:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:18:37 +0200
X-Gm-Features: AcwNN1W_ZpD7BnW-6N9vI0Wb1kb0jyPzchOyBf701rQL7ntZoTH7GyzL5sIHsSA
Message-ID: <CANiq72k4NQ6yJByyb73Sy+iwqVc=i5CuZy2b5uRVksA+gkr9qA@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] rust: mem: add `transmute` with deferred size check
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +/// This can be used when types are known to have the same size, but onl=
y at runtime.
> +/// ```no_run

Newline between them.

> +///     // SAFETY: We've checked that `T` is u32!

`u32`

> +/// This is typically used in generic code where it's known that type wi=
ll have the same size, but
> +/// the compiler cannot prove it generically.
> +/// ```no_run

Same.

> +    // SAFETY: transmute is safe with `IntoBytes` and `FromBytes` bounds=
.

`transmute`

I think we could also link to the intrinsic and the `_neo` one,
perhaps with a permalink to avoid drift if they go away, but not a big
deal of course.

Cheers,
Miguel
