Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D08D63B2FDF
	for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 16:20:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774282848; cv=pass; b=bkgVz05q+uQvq7dhH+1bf+iCZJBDloSkOUQVcX0D/Cxb6m3mOSJ/945RI/Tke6TM19cADjNgP13QdmeJCzZWbyjHZJVmk3+Wjtnrgo/9bnuVFiEDhTHQ7MXsumJ0baOLlsdCGBuF3lqnW3+/RI1vuIjrPMtPty6kYQyo/9gpokA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774282848; c=relaxed/simple;
	bh=V94g1pzKL5dHi5fv8nGsDMXp1c7cNO9ZtyC0nibAyPA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Fm3tvphOHUplsEeDSBZgS0pDHyydb328NXmcgE2L7RWxl2GHoJP+XwIp2xWNy49qaTS2zUkqJbDMD/2IkWOMLyrTUQnb0yXp8qxenVZ7O2ID3/khpZffby2OqLq47sbhMMftTqKzVZgAhvepKl/d2nT3r+OuaXsu5UNSpk9M7R8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sjPtOpcl; arc=pass smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sjPtOpcl"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-669d7666d77so998035a12.3
        for <driver-core@lists.linux.dev>; Mon, 23 Mar 2026 09:20:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774282845; cv=none;
        d=google.com; s=arc-20240605;
        b=jMpi+yyB3uIzXQdhwWAAdpvMkgGRiTu3pTF2MMOV7pD46SuS16drhe1dah0mbsZ14X
         /Lt9FmdM3j5ITU4HamZ92wtlS4wcQ4zM3xLXAl/JhKUDoUyJTDychv8Q4Lmokk/8/RI9
         xsyRmgpMqOaOU+pNqyd2aDuEiyR34z7SBORpsFypOULYgOw71nWsoAEeZ4C9fC/CobI8
         dcYS0DhIiez0+R8GVf3FQ2LUkLpBpbiNuLs8bXDv4qKzk9h/JKsuvshzVQbXwlivb9TF
         XgCSW0l81u+9OgyoFqrjhz34YjUwSbNwZcn4BNvfyB/j0lH9BxWTFDqFuBJLx4y/R8RR
         3FBQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V94g1pzKL5dHi5fv8nGsDMXp1c7cNO9ZtyC0nibAyPA=;
        fh=FvCoVSya9pjVRpQv/WgeSLxqjF/Far6y+eGwX7okmI8=;
        b=M3XJ2XQbMfmuY0ceNxKXo8PSRzh1Ldwi45j5+4ylxsQplV37GofBrrLJ+eLhFwsZ4s
         +uiXiLuRBWbJEny2j3EoC5jz3tLSWf5CWfLMUk9qsHbwS6dYquc63boE3N80pshROAMc
         GDWMKM//0KPq6zw3ArAOxgRHEXIntT2KHUcMghcq4Y9Bh4VICHLYDh+1Feg6BIDOj/zd
         7J5tvpvX5P/PaezU4DUUKTbc/hyGAiMNurjF1btqkmx4BvfBMc/iY62Ku7C1btNPo8Q3
         8xsVZb+GeRFYz/fcKmldSqUxZFoCbfwgHNOvZBbE81IDHyjcRv9zCLI17CBYIu9MyVI6
         dzjQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774282845; x=1774887645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V94g1pzKL5dHi5fv8nGsDMXp1c7cNO9ZtyC0nibAyPA=;
        b=sjPtOpclXQcjyOIcvZ3zmqw6NO51v8hfaXIzRmDjetpCNDfOXUiTM3zOLTbXh6rMPC
         ZUZOcDzuCESY8w7CX+0Hvrf+q3z6vHOloBsfsDzpzNg+lmW7Uf2mjJISVnMgcU6Oov+2
         c/QVQzv1R4jF5ocShzLwFLStdC3MqZ2kK1F1f8yHMt9r76u+9U8djifsqurBVXJBEaLy
         9M55UZEa4phV1ulLAOXPSvrgiR8nH6MtknOJKE/DG6B+sGm5Qt6UKEzl06yNkugkDGb6
         e8zPPw26mu6hZWGG5d/33ZBFSlKSclZiVASwiHbK1l6Ex6rJmx4eSv6iZlWV/2Hn2uHt
         bUng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774282845; x=1774887645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V94g1pzKL5dHi5fv8nGsDMXp1c7cNO9ZtyC0nibAyPA=;
        b=PhJvZRtMD/drGrsTRCEvshTwbLrWH2QD6TRLU3UgA854kdpD2IqiLXOhPZoQbl6t6N
         4yhaTO8jmw6DDpZ4ms1Dj23j6VRCKQ8+UFqm9TbktnrPGCP4GaAbiP1b8iwFBUC4Fe22
         SfnQ/1DmzQsuCT3gopdKAUCK9sgRGSOXPDWno+nDecaCa1d+1QaPklN125sGn4QWfx4u
         ir2YlAopY5ETg3CzYr9bWGaTwwALylzYwOwxVW80L8/eU6mtzZJmkTegCJf9fv6/c5g/
         dOIgFl1jOaDCvj91mIWRsZKnPu4+FpesUTMYuX+ngKjU6gsRGYoD4lmK9GmwL9hLxYwk
         8K2w==
X-Forwarded-Encrypted: i=1; AJvYcCVtFibFo8TuKQam0pAjKeR2vwqJmn2ds1q1D9zYR/3kW6LNYyUQ/5k9Dem9IBGzle2l9Br8QNaUcbRoRw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwOedIwTA5wFsuZ5FXR3PKadmeFb5nVxDHBa+w8za890oKneMsy
	lJL9pTIil4fBPbOW1FE8eK2fv2MftGgOhCYA9clB+5eu1dAR8iBlxZ/1CH4FL6BiaqFb7zN0i/T
	2nTTrAlW8pMD5KbaAD15KxLsk4EXg6xf/6amIkLRt
X-Gm-Gg: ATEYQzw8dbhvm2V/x6xCTNcNlnN7lHGM6V6YIr7JPW0KllCVNkzhAv1+q1sj20OlTXA
	j6E0OU/9pX9w0ARWGXe+bBFpYja707+gLqj+1bQP0BIt8TqnYJ0H2T/Sb0L6rl8jKfdqWE4Q0XG
	NDZyed4kTN2STbDYYUdV/uGEkTxDaXppUzqTTSoojqhN2rWROtyiUQPLAJxVUe8KM91AXG2rh3z
	xCkRjLqHtv+l2xdbaodeH5eQWLU0mYUTpn3iI5ghmiag63HmJATCP2nXQI2TNHDhk3MUFART8lh
	zZ2yu4IpVICTftCN+FUjHP4hh9eNm8mIOC3A68xcKoSBvynqjiIC
X-Received: by 2002:a17:906:919:b0:b83:e7e:3732 with SMTP id
 a640c23a62f3a-b982f3630e7mr720689166b.30.1774282844692; Mon, 23 Mar 2026
 09:20:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260320160055.4114055-1-wusamuel@google.com> <CAP01T77hy3j5BZMBcYdadLfPe7dYb3zEGDF9daUxJHYy=+fcgA@mail.gmail.com>
In-Reply-To: <CAP01T77hy3j5BZMBcYdadLfPe7dYb3zEGDF9daUxJHYy=+fcgA@mail.gmail.com>
From: Samuel Wu <wusamuel@google.com>
Date: Mon, 23 Mar 2026 09:20:35 -0700
X-Gm-Features: AaiRm52TW1-EKDTCZ2bTgcJapMDIKftRA_vvryAeSsRy_n7c_tkgZmk8jNhLUuc
Message-ID: <CAG2Kctooz+1ywStvHv=wg0p6ZTbHGm4nf5nGUfcrOnDi6H6KSw@mail.gmail.com>
Subject: Re: [PATCH v1 0/2] *** Support BPF traversal of wakeup sources ***
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, andrii@kernel.org, 
	bpf@vger.kernel.org, kernel-team@android.com, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 21, 2026 at 10:52=E2=80=AFAM Kumar Kartikeya Dwivedi
<memxor@gmail.com> wrote:
>

[ ... ]

> >
> > The initial attempts for BPF traversal of wakeup_sources was with BPF
> > iterators [1]. However, BPF already allows for traversing of a simple l=
ist
> > with bpf_for(), and this current patchset has the added benefit of bein=
g
> > ~2-3x more performant than BPF iterators.
>
> See, it ended up being faster ;-).

Yup, thanks for the suggestion!

>
> That said, I didn't understand why you dropped the test. We still need
> unit tests that ensure the verifier causes the bpf_ws_lock to be
> released before exit, and an example program (like the one you
> benchmarked with) to demonstrate usage. Both are mandatory. See
> various *_fail.c files in progs/ and RUN_TESTS() macro for running
> negative tests easily. I doubt we will have any wakeup_sources in the
> CI environment, but the example has value nonetheless.
>
> pw-bot: cr
>

Sounds good, in v2 I can add a test for the lock/unlock kfunc. And
thanks for the thorough feedback, let me take a look at the *_fail.c
files and test macros.
