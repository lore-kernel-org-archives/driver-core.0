Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AF0C4A340F
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 18:28:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778005706; cv=pass; b=aUG+TscabnmY/kjKX8hhHIStI5BeXRerAVXV9HbG45QdZlIVFa3nuBaORGSsfp7iq1OJBFOvXj5zZ8JZ1c+d7r+oqwk3CVPUtknD/fsigt1l9Gtk/Uc/DPRxiCfWHs2B0AvPgFKM/EB9+RNb8lvXhrfxjsIb2sI/UBOepPH6RGM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778005706; c=relaxed/simple;
	bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=V2Dq3O97C5UMR58KrX++JGmsyCaUMH84iWmC1B8BsDNhhznrLYmha5SHthBv3f2HooPNK8gw6xMvXNhVGZc6iQtjsXQFHbYLtuvESZJwOfqbRIWY82u2mrGB5ctW0FoWNGiH7Z6mWGgvZrcc19ml8eE3UHqPe1hUMUxBYSWMUtY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ASfG9/C3; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ASfG9/C3"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b8095668ebso320731eec.2
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 11:28:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778005704; cv=none;
        d=google.com; s=arc-20240605;
        b=CC5RFuFU2/69POKYOyr4AgGzueJJBBlUd88d1dmBvmY9av0bCUuFtoxqx21z4tFk11
         P9q9Wx0lH2RGm/VnK/pwWEK4Iv+TuDwbZZI/v/FOaHpUUpo75k0V0E9q4YySDBTTfL0M
         SxNwe0IkWypMo2gu3PeFmubwjIawEg7kFi5D8AH1KOET2jIjT1XjL0EEJSrrxk0hh9X1
         RzIyYvBo9oUCrmsZrwtwIs+xIntgka2OcMwg1c+NwpgTgeqMJNR9unXuKSahCwEStkk/
         nPKOl+oUtqzVXOJie3qELiBca1BchdelS8/vD4/tpvWOKMXimEb0mdjEN1f62E/PI8gq
         VtMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
        fh=WHLqc2WAVafjyatx/fKqMpUkNss0cDmrtFpMjBXG6P0=;
        b=JM77j99A6ui5dcHkJSEf7nGidEFXFxwBeVVd6B64qzQlDR89IpY731uLVtmR+uiEZo
         4gX4QWQho1lQ1cexPjUavcJ94McvwgtYf4JDI0NX3EItYN9P3h0hEeTgJAx53frh1ARF
         ZIyGkCT3Phcj23HEBCvsZK50rkAfrOeafcbwaIJcVbS70npjEi0+FAizYMeVDOE8dElP
         bxObuC9on4MZD/ug7xtmzxItWDkgz5myJqkk0wR5CtfiGyL6FzTqsatSktRGVXYyycOG
         II7xnWAP47kg6GiG0v/wgnLjG1SMCIhaEDQ+mMrkzkvtkADh/wSoLgIQ1UZ7kiF5+1c3
         75AQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778005704; x=1778610504; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
        b=ASfG9/C3RCykcQkX0mMTnawbQ6O7HQPaUrJaStSyJafiENLAmcv89IMzi2o6x6d5wd
         FAZXqhGWnd4duwOBYwA7gFG24FYhX75O+i9Os6GdzaLygUGRZXmr3ZKo/zQl1cnHUZVa
         TRwKx8eVO7y237tvQjfq9P7Y9FMqsySWwTmAT/ZSATUodbofnuadLPjP9uwZT710AdM0
         Y72WY9anXtjVkUr5t7Op1eH0EYlxqwtWCl65i/gTMDG3Sr83WXKzKC6VYOy2EtWBf8KT
         RgA2ntynOy2xDTAU1+m81YWvDcdg2PkfnAWQuwud3fuPPfgsDBaNzG5ytDokzGY8nfs6
         mmyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778005704; x=1778610504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u0J/DG3q3l3oTdmjlcJn4ywY61k9yybeZt0U6uv+BvI=;
        b=Wrw7+EUUAqWbDGRkNRg/nracw5ltav95uA5vCWRzZwHO/q6/MrwIMQ6DspmnDDbFBl
         rfzf0yXMmvcyNW/cTdA4Yo1bjMsw7XouHKqHOatqDIfrXaUhtv9rjQBT5qfHU9lJKsj4
         MaLWi04Z+PtXw7afID+Zgpuj65+Q2mZas5pYBBojn7YvMsMAWi4o0MyNUQ1nyHWCLlTU
         xLLbjHvXeFXF4FJEO7FQhOc/r8uTqbTt4IxrRVFSrlqcTK9j2eKlzwdP14KWSiVlKc25
         DBV/Wx0meMD74w8aAsT8DvNQNJiDyHbwrsn323I0QPcyQN6gF6crzcsxPATtZkNlNqQV
         +VbA==
X-Forwarded-Encrypted: i=1; AFNElJ+9lad6BepuBEcCwamRXyWovft3+7nTiX7flHY/ClWOouLrpy047WXAhPQ5JTRVcOSDTMr14vSXUytVZA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxOheFlE82+rlhXoKDXwm2uWWaU7ZUFu3m5AGosArm5+qvyFkrU
	q9jEg/Y++UH4C0ge498Di/20Umz/2CF8VDMitcQsRQ+RxVw16robfbHafHsxf6Z75lveYF5QKCG
	6ul0d9gdwle2T/ff+/GwHOg5PLnNozPw=
X-Gm-Gg: AeBDieuNFN9mwhuECcynkqqaNwsiVC3bOIz2PCDMP38no8YmUPlLYU68Nqa4e06WXQc
	Ll7Gtqh12lPvuGXtlpyIzWLy/mqXddmcidbSQK5rA+fvYSpeRMMBYio6XzAF3GC6cFSt4XCuOGg
	MXQJ14TON7vTejh8+pcwGuzRu+XtYAeRd9eVlUUlnXrEIm8ty30cYycV2r/Ov20VngdhVBzagYc
	7aP68tqqttoR4+bdauL3FzFTQNQmB9i+Mn5yV4zDPWxV3wfii9Dz6QBuqxFJ9JEEou3owX4ecHv
	88cZnjNsIN0pX1S3uZZvyo5dJ0m9DvAy70MoqqY7Y37GqxpmJaqNxZwTcer8mUwsMeJCBbaud+2
	4U5YB3+/ngMz8UWZsBW+OcgNsKYCXNhIbAA==
X-Received: by 2002:a05:7301:6784:b0:2f5:2154:c7b with SMTP id
 5a478bee46e88-2f548a8c16fmr96868eec.1.1778005704160; Tue, 05 May 2026
 11:28:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260504111421.72130-1-x@2005.tr> <20260505082323.37335-1-x@2005.tr>
In-Reply-To: <20260505082323.37335-1-x@2005.tr>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 20:28:10 +0200
X-Gm-Features: AVHnY4I1gAHbg4OBDbK2BRfiEoG_N6cd2k5zc2o6_6hC4CBMbryprYyf6O6Wea0
Message-ID: <CANiq72kGEB4769kC=-S8e6eY_xqwHTtmbuTvVqjsgL18SGPUYw@mail.gmail.com>
Subject: Re: [PATCH v3] rust: io: use newtype for PhysAddr
To: x@2005.tr
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Joerg Roedel <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Robin Murphy <robin.murphy@arm.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	iommu@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 10:24=E2=80=AFAM <x@2005.tr> wrote:
>
> From: Favilances Noir <favilances@proton.me>

It is great to see more strong types, thanks for this!

From the other parallel patch:

Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/1204

By the way, please try to fix the email From header -- it can be quite
confusing to see "x" in the mailing list and other tooling... :)

We also probably want a few more `#[inline]`s as Sashiko mentions.

Cheers,
Miguel
