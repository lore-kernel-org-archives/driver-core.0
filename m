Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60A4353A69
	for <driver-core@lists.linux.dev>; Wed, 12 Aug 2026 16:33:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786552425; cv=pass; b=E1haWmlD0v3jo079w0mdF0iq/zwRvOQ7YpKeVJS6dV558Vd3jdjI+sVpi+L4qf85bXc5SPIcbnGnibwCys4Ekd6UdYLY3USg4ABF95GO+fZwSeIyoURXecX2C0EObDX9PrlfKqmKl9g4Uaszj+AT3L9/hblx5g9a1/08XDxwTkE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786552425; c=relaxed/simple;
	bh=gOIsyGGYeGZsd7+1t35VENt6hUZ6tCz5k0UwrPgrJB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NVvvWg/retkM3IxYkuAO9E2shsz8keQn9rD8V2x1H6Dm8ztmWcqqcSxT30JfLJ07K3h86abyTBmWogCdPFqkFU5qupqPH/Bo1fW6+qSVU6NTjytC9ah+6ukIMwQ4zXCxHGQK0XUjp0Rsu6INwZADMtbMUwJcRbpFKx2eMzKRamU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=s6i7E+sg; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="s6i7E+sg"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cf420670bbso2637325ad.1
        for <driver-core@lists.linux.dev>; Wed, 12 Aug 2026 09:33:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786552423; cv=none;
        d=google.com; s=arc-20260327;
        b=YJ3rbuB1v2FUrNN+m8OoAphQISCi15mFVdRtXcfsbXeMjQNHI2XX9v8hL6XUzl06eH
         rgJQU7SVzUTNj09Srayk7rxafef42vhKfVpCy6EqlS/ZldqNWhobMHWv6Lcy3InCQ6nn
         HI3BJq6ZXaf9wquUqK0Y97Y3odiFHfJQyp96vDEZ0WNr11ePUAjzTskzXKcZhIZA+tbE
         lhabeCeFcobGmhSJvSyoOhq0G6zyqX3tPyedKorXY4gASewyVxHbMRchtFzpsuYpXBVL
         vZgboSqUMM3/FE1p4cJQnUz/cG6pKXpeb9bVvugO+x0fQpiuV948Qoos8/u79ZD5Kfzr
         3j2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        fh=1GBMyC79h/Hh+Z4fhukchl2ryyU0RbYjSo2UaQz9HR8=;
        b=Z6TCVoZuhSY52J/ZtX2u/jxO/UYhU6KMWqiXJpT/nOFjB7Pp8AN5rbsw7ODlBQAwcR
         Peb6t/5IKdqfu6t956NUTGpNchesMWX599j0sYwSaPvpX+c9c1Lnpvzctmamx+YCE8/D
         H6Fec2EVWMS08Q7azK2Et9NUa0W4GKT7mAmyPY9aj4mWFd7/MTrPSkUB4PsnUcCBdrO4
         LNPL9RcAGk7dgIF2TpqX14o6kDQW5YIeCICv4oUAgKm7cbG0/rYyhHVhG1TGO0pIYvdF
         gRMhuCwi0eLlOsfLVgQDN353VWRFUqeqROWT7GFNlbb9QhYA7LgkppJ4kM/hXk3Jknwp
         41Xg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786552423; x=1787157223; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        b=s6i7E+sgbDR0v8T1J0EsvXDnfgyA8SxXV0600GP3yAOPzqJ1NTFWVgOvkoxFLSokLy
         NMkaZIYVj9PQBIrP8jPMfeC5uHmOtJ/5PAYbM05SrMNJQpLATefB3qh8TBTB8MDe2EUM
         1w5elAJFx+4Yu1sZiUUpfj1ZVGhsaiabAx9Iuo/uz+CVWR4FcjXW/46XLaxX3810uZwS
         h8B/XXR6fa+3Mn0dBrlsQpikZZ0zk3BuP3+L8qrp0eIvMTy+XY9y/Nhc7KHuIF3/OkWe
         G+7cWLYWNCXgQ8zJr3Po9xuVLZgi70xu7jkUdjjaHBbHfWGxHSPVFuVAsjHChIpkW1YW
         Afqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786552423; x=1787157223;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D4SZ6u0V1SghQBdqtC98mKtc1SLMxMH5ah0RWt1B7vw=;
        b=Nqzu/KGyfEj38O2y7zB+ilEKtP5rrha2YhnHIECS4KScMC09k+kb6aO5pPt6Zp578f
         LGhSbGhiYUks1F2Txh2QXDINfjew4Uzp/TTpjEFrdtmIDafub9PJrXiVR6qmkq+MR98N
         CjhRu/67iEmR3qmaTgDtIl/rv9zshIy4ggqbuZ5pivqg1M/QpmJkyohrnZ6QUgZ1iv7N
         tjKugXAC2DXVA501evR7j7xDQFYWWo7xSqgy2LLJSu5VT6d37forHNJm1fTQGYiptm8S
         kduvp83dftzblr/OQRqSmH75N+GeQVRO4dYBMrbbiJakM7syo7PSt+hq3QJgiuCvluHj
         3O+g==
X-Forwarded-Encrypted: i=1; AHgh+RqGvxYc2KaqSf0VEko0dRQQlnbaWjAaxsS1VlRDhGHIjoDpm6zOZD46xyV6mj6R4XyEL54VwiQe/FY0hA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwYrA7tMg7qM2eG+tsjq1mp3iRiVJYyBFq+HfSgqLMFuu7EnlNB
	Tvar11WNfP804Frjlbdj+BmwnXKkvVjAgEu6WvuVmglaA0Unjr11eGKmp66iTSg0UHDBZEYKOdg
	xPslyF26jXyt7xAudhE0knIQss/jh/B4=
X-Gm-Gg: AR+sD12k+ot3Pm4S5Y1qnaXNGu/L2NzLnGSCtpsCIz+BJ4M23XjdEjM0nRrgrX0nZCn
	daz5Fpt4rMOGNOazJuAklCesbkhGhFOQRpIg0PPMdoZLeG8Y60GjP0ULaTsjZ0sRN+A65aphWsj
	bmPOxWT7geZBKb4MUah+vwWuYjd4vMtiUR31DkOF7awF+TOoNV2/be1x3Goz3w21zHXF0dnY5qs
	cbDxwYqT7WaIZnZzXfbTaROjkSkeoE4gciUhZZpIDzNTSr8I0Ck082v4igxqtlDgbtpa9L1Rvip
	3orKCAqqM5Kegdg4Qt/58vROA5wWI8d9QCNUnalDD6xdyiDGPXOXLuKKjKFaolOIFHuw+TvSnv6
	bAv13M6tcwnUZEorAb5l7GWwmROB9XsMDi/z5QEha5ssrZmWnV8+t4E6yhR6r
X-Received: by 2002:a17:902:d552:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d3456e7622mr58880125ad.4.1786552423044; Wed, 12 Aug 2026
 09:33:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
In-Reply-To: <20260811-fix-fops-owner-v10-0-7e71776f9dbe@linux.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Aug 2026 18:33:27 +0200
X-Gm-Features: AUfX_mzHM3XF1m8TGRbbbrVs79_o_CCgi7jI9gpogE6umN7ICq8ixcdhm-skrqA
Message-ID: <CANiq72=bhfofrbdf1qeA380-eWeKj5yXhC0NzaU_nbB9SpxYHA@mail.gmail.com>
Subject: Re: [PATCH v10 00/10] Fix missing fops.owner in Rust DRM/misc abstractions
To: Alvin Sun <alvin.sun@linux.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 11, 2026 at 8:41=E2=80=AFAM Alvin Sun <alvin.sun@linux.dev> wro=
te:
>
> The series moves `THIS_MODULE` into the `ModuleMetadata` as a const, thre=
ads it
> through `#[vtable]` to set `fops.owner` in DRM/miscdevice, and updates co=
nfigfs
> and rnull to use `this_module::<LocalModule>()`.

Applied to `rust-next` -- thanks everyone!

    [ Fixed `clippy::undocumented_unsafe_blocks` lint by wrapping with
      a block. Added interim `#[allow(dead_code)]`. - Miguel ]

    [ Fixed `rusttest` by adding a dummy `LocalModule`. Removed interim
      `#[allow(dead_code)]`. - Miguel ]

    [ Rebased to avoid the imports cleanup patch. - Miguel ]

    [ Removed Acked-by and Cc. - Miguel ]

By the way, I removed the Acked-by in that last patch since I think it
came from an older version as a series-tag that didn't have the patch.
Please let me know if I should re-add it.

And since I was editing that commit for that reason, I took the chance
to remove the Cc because Petr already gave the Acked-by which you
collected, so normally you don't need to keep both in that case.

I hope that clarifies! :)

Cheers,
Miguel
