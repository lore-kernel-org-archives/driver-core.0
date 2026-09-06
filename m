Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B3783DA7D1
	for <driver-core@lists.linux.dev>; Sun,  6 Sep 2026 00:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788652906; cv=pass; b=aUlByS4ZyYcJ7q6zxd8V+ZpeCP8gfBd32DQiinQZLVPXk+3GUM3uwQDImgzenKZfGEWJzHmPEGnK7yV1pMiC+fV7a4omCrSk4zinUQ27Yq1wGyYLZnY9uYLgArNz+4VhikOefE9xh+GRNFT0V5t4Ob71w6JbxhebYNXdrtJ30zo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788652906; c=relaxed/simple;
	bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wy9xjIdvfu/BHv76brWMVnz4Y+cUOE7fkMSBJyA3VauTngRydVuXNkJ9iuq6l2llGd5KQ+oYwiZ0wP/M5jM8/jtzv5A3nvfDIoFGXeWwwVopw2jzawpmBM8+v7eJFUWaR6UFEzfaazlmjTG0co6Iovc9ZRbG5hzk+jyoWQnY2eQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B9vOx79Q; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B9vOx79Q"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396672b2565so313782a91.0
        for <driver-core@lists.linux.dev>; Sat, 05 Sep 2026 17:01:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788652905; cv=none;
        d=google.com; s=arc-20260327;
        b=KWrzuFevc8W/oZDt0WvZmCKjRC5D8ER1NTSWItCxTE08GLhPMx9q+bzvfUEIGXahob
         Q3bbThBvAqUf7sAbdvFCJYE8177+sZqEwMFcWPjIIwrLCFmcJK9zcFkqky6Rq/3u9sxM
         2VBcXIjoXCizY2/EV7Yyflj45iSwcKjgqlMdcsrfDubvwwPA/1YaYjapRWfRPfjHF0tk
         H1IltdyJknCJyvwyNmow+KC5VrGBif8gDQ9lcTyMpbQbHqYQkaUoWGwkbeSp/0CRCUKY
         SCYsg9Z+X69r/0P+Mi0Ji6FgoQrsgx0yDpuJAaZnDeiaUQILN0AKrvf9EkRndoCG1Sla
         kBQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        fh=lcMBLsj8XejBdAJvG/LZQwIn1Dqx88L3tITWWmzbaYA=;
        b=clc5FNK9uuj8f3qg4lXJr6Wh5U8DgRp2DUgKOwVoW7CCfv3luR1TdxVh2HwMzdqyNA
         BgoMl8SMIpdSjHsxW9Sdlcf4ZSYSXBQEEYxgvBD47f+X4/e2aw1sgC0y0hnHjqqCE5eV
         EWCeEstHMptENsND0hKqlTYKi+0121/6EjsKQb5zaXZLyH47BTrHRuOrQ54T35TIfuUU
         C4DvFI+4Aghw1s1PUdT5iUmZWAaZjcVZxwvp2CDSc2ud61yfzJi7qLf30//pqjf+6Uco
         vnlEgxnr5Leg0fs7QSQge1pdin6Lrs9K1BJb9OIQ8evq6r4ZQR3enFC0RdPVUGfWKEZg
         MxpA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788652905; x=1789257705; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=B9vOx79Q+EPdXo0OF6g2Mr3sG315yXYg1UL4HGbt110g25F0YkgZb3qlwOfXXBB2Z5
         9WImc4ZEs4XVbeXMqmvy3gwUIMiQ4enIuEG/EXNI8dpOXsLEygAe+lmoatQ1Ynf/MgXO
         5X6/3OIakvLUWSlUQBVa7KQyv/jhYV2aVL7cMzelzH8mqKaP8fYINON5MRWSum7iJYbY
         hcxIcdaViRors25TD5qniyh5289mkrDwjiwZWukFIn3kT0l4uYWT+nLsnVB4e14+e+3C
         KF5Q1QpDKTmQjEeIx1NJU2ZSx1olLg4wBiWTKszeFzWaGEtI+hOTti2PGHKNc6bun9br
         U1gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788652905; x=1789257705;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2MqN60FsZvPdTZbJyxVZaz/7XO+slkluE367ZcdhXfk=;
        b=UHa9Q7q2jgkiLhDiriX4EEPDgXzIy9oX11Rk13Lslx9I+4srBP3JQ20Evaf67j/62G
         s2+/Xhw7WH7Az5SZBr4KEdp82ZIUChL83D0293V0hHAOQn+uzK92tw/FVe6sSqCknwWH
         rU/jlVsgeTB/Y+pbeg9x5/L40zEgbDlwa8xbiAVzu4kH5shd5mtwR7kJnZFn6V0hfuW4
         asWVvcU27Wo/xp7a7lcYEyKM3YhXcR22U50yYJx3AlimXrtCZfCzAVFFqIWjmqLB/Myp
         e4k+yZfGVy3PdJxOhhgMt7qRouBCwpzWUqimRMVjW63d+EZIA7s4kKRm2NBETs6PgzoO
         9PfQ==
X-Forwarded-Encrypted: i=1; AKwUvByU1aGvo4D+3MfeOMmgSXFrjXKLOZOTzhTnyIvNfDWD5NMialrgunXAlupSXb8T5MGHIG78MrrWciomfw==@lists.linux.dev
X-Gm-Message-State: AFuF++l8m19RwWPZJXb7gaSrHsGUNS19A9Sq41/S85xLAtDRaUTVPp5B
	Bt9N6efjRp1obLTcnZAxPLedF3xhppavXaZkMPh7K57D0k8jNOrcNlftDQkid95ahtHJEKdkLGp
	rM/VpzKWq8R+TE/Wc67swJvFkbZ19N64=
X-Gm-Gg: AYBFou2n2v6p+MTohs7kEGHhv/j1QPOizGZ1dov5fbpts11mTDcanslf7fdg2zF09mp
	sq6fgzEjshVQfDHiUafIO1JDLWHQnDZ493CIsuwVPkgMZVm6NJMutYiQ9d0uoLHWJQOe+KPikD3
	KmcER9GN9b9yMQ6zQuyoWAAvUn/BxOAE0QhtKbOLpQQtjpk4lCouIYz9dUq8FBTyPz6J0k/fAhu
	Emhhja3+AzouIQYiRxyCqM0N3q4Fbc2nb+hVJTuE4jIs7t2ky/k4J2BmOihdrjoscO7RqF9L+n4
	sz0prqUf6sIy0f6ddCGzDF0TTrs36vKdDtHhEfFR+zHpWdiE0L1wHMijaSfzdHPTAL4X3Et6H1g
	hl5EmK5AY4/YSvYRQ5aTxvpVQztJV5no114napi+IsbLnze8+bUzE35oAECa2
X-Received: by 2002:a17:90b:3907:b0:398:bada:832b with SMTP id
 98e67ed59e1d1-39b3d8a3d1cmr7786501a91.6.1788652904655; Sat, 05 Sep 2026
 17:01:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net>
 <20260901-typed_register-v4-3-5552b1d59525@garyguo.net> <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
 <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
In-Reply-To: <DL7RX130417U.10PL9U4D6JU9L@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 6 Sep 2026 02:01:31 +0200
X-Gm-Features: AcwNN1XKuKFBV9qEAm_z4sB5Fo2qHcAE7av8dqRfbpy9oR-6X3rQ---1a2fINJY
Message-ID: <CANiq72n2B=7TXtmtQXEC-VZQNZ6NQTkPsxnnNCiWWYb=U4TyZQ@mail.gmail.com>
Subject: Re: [PATCH v4 03/16] rust: mem: add `AsRepr` and `AsReprMut`
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

On Sun, Sep 6, 2026 at 1:32=E2=80=AFAM Gary Guo <gary@garyguo.net> wrote:
>
> I'm not sure why we'd want a self link.

It is to follow the guideline about using intra-doc links on things
that can be, which prevents mistakes and improves consistency, and in
this case, for huge traits, it may help readers of the trait
implementations section a bit.

Cheers,
Miguel
