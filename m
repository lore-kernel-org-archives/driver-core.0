Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBA8730D41C
	for <driver-core@lists.linux.dev>; Sat,  5 Sep 2026 19:22:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788636166; cv=pass; b=X+Pex6Gy8lTDUoFdrCuW5TipYe5vQwdsddO/5iA6UOo8vWnsBhDiMz8/oCoqQovXO3JW8ndTKHS1CIpGf6azAYOsmAM4jCx77J2aaueSw+cEbHWWzLch1L0QW2FdQrG/vPMKW3gwqDPM9IJYOLTiRrbLtF+WwEpzztYPXElYx0I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788636166; c=relaxed/simple;
	bh=yF37/Nza90qpovsTyPIotV3GHJX8YLw3YQa4ToPG68s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BUAUQ7VBf45wNBrIVnvT7hSxkBDYGjChVGGFDTX6G1mH7e+c1cblV8fa7wyAF7ZCM77ls0INb3CN2KRgkRMOiHHqfVrwkZ22j+qMexbjaPsjDs+Cni9w1KAYBcO0CzKHmfmNFNnLuiWNPPFok2ZFNp75zzndjGNpJnQIeQirOoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rAQUYjhb; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rAQUYjhb"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4cso1212085ad.3
        for <driver-core@lists.linux.dev>; Sat, 05 Sep 2026 12:22:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788636163; cv=none;
        d=google.com; s=arc-20260327;
        b=FDgjzmxTooFcBEYaaeTJuLzcGzbsfiJpzpiZNmtjGW5y/ilah710LbSqqRUFV0zAub
         Iu1JWhfvV4HqHQVBN1M0hP7AcDWdlbQ5DCe3fOrUJxJ9ZPxww9ZmXjVg8SMh1r8J5gvk
         /u1GFQExDr00lEiGSPXjQM139Z1oB5Oo91LSvj0rqP4q4RTOwPq6N6/3w9vooYXYybnU
         TWDgMZvyvv8EG7A/k8Ra+8hFclvL86eXnIBGfQfJm8oKJE3rKytGi29j99cqah8aNuEM
         x7vn2g1CSD2siG2teeot542TlSDRgq62YExcsN3qWP75/tdFWsNbmNMfCA7dZ7ag2ibr
         zyLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        fh=mbvN8iXI/LLOnv7a/l4nTeMmg2uoL5+skI10JDX+Dm8=;
        b=rUayHROEz4C/JQ+P+isQFY6ANiaibazj1tLtOkG/AsJZ7aTQLvRtM6fqmbojkcpMeK
         aeEU9mor8nMt/CFFArUb5f88iHsn4Ce4HFXO2nNjddYcRxQBaDEf3IBwRi0IfFyh6F3T
         yBGBMAlNm61p1VRkr8di+tdLUxXv1F0JVjufTB0cpvpRvCzL00Fzg/dNptHyzbooiE59
         ewaE0vLKYV/g8UU/aGsPP0DcitS0SGdo/RJf9hsijATbzrwbs8d+2vz11CUWw5eBAnbP
         DfROEniN65HOQy/2+XzGA1Ztl5Uy8OO2f9SXfvBk7a+Srdtk9g50g7WGgy4XEGE3TUvh
         SUEw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788636163; x=1789240963; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=rAQUYjhbyfzNpF5LPki1fkEAyufgIGeHcEB8+IXqh7/eRI99JascqJebopU9IxdTi0
         B4h7R/u659M4LVs4Bsjd3v6PnO21F8+cEV05riMu429O3x9J6vrsaLqRNpKiKJMY9b9L
         VsqC0MVvOcVKEhwm1S3T+0EIq1oH1MfTLxtMZNWWk5rbTa1FrqIMVvPu1v9g9UizCj+0
         lJB+raBK3VUZlMzKZHxlBl9xOmF4oHKjUxi/aNeHHcCg/XhEIy8LnzDgK8kg/mOgTvW0
         ajCnKikaxGb7R9m004+6zuQBz4DZmlEl6eW3B9o4dE6jVMtlQklG89mV+OfhOBiEALRX
         IXng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788636163; x=1789240963;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F0hp8ol4MVmew9w5JiuEvACCnB101tW8NVpWQVhjcY4=;
        b=tGivrOYW76d1pIdGzsI02BD3IArKOZN9YZNPBuGUqR6gETPQAETk+ejRqeLXpz1YO8
         SCSEG8gboDXoBUNoXccpEmA8EZ3ZMtvHX1YYLuBUbO5FU3myuwz3SjbjOzLFhje1jVD0
         Q6rDPHk2gTAu6L5zETzGqfKe2z04HFJAcwilx81WKQ+dxSP106B+kIe8ODmW/zq4oyNp
         mlFfwiUJFdTeiY3KvdfO1Y/+8KqtVNT4yQAIglngzlIJ1U9uhM+o4ySimO/godrc3rXF
         UoVOs7NX4YAwDURYTc9qSyTKxdPg8/G6ofLBgdhmmMk/JbQ74yIGMXXXb1O+wqm0qjO1
         EwTg==
X-Forwarded-Encrypted: i=1; AKwUvBzrUJbIECsU2Vk02P4eGDd5sVZX8vv3lumO1+6L2L7/PV+4p6uGuIPAg7mr9E3+bARq+aLnl8m8MmEBLQ==@lists.linux.dev
X-Gm-Message-State: AFuF++m0j30bdtmAvdYnGiC35dOY6bKevQMDrxD87pwGWJa2QGPMXH+c
	szlS4O8KnKahnxTDnvAyUqm+TjDxPXwTRie/wKJc0fBxxACVHaOZUce7oeRB37EsgnXXO3K0ZeN
	mt9NgwLae/VwI/Bd3kbR0huFrjGd+r2o=
X-Gm-Gg: AYBFou2sceOV0Gss1EejDTDBRQKd3XCP+H8EeGXMuseySit0T546P0yLSYCx7SzXhmF
	72eRSMvUGjHa5SyYg0xyAL6tbPSgFWB4gl8izMpiVt/bgeAJIEkToeIeXevUG/7zXUrsc5g2SzB
	RAzTkpWDyrkw3Rl2SR0njTma/UGaSijvebQaPcX1PcXRCpaUlFk2GONXR7W55slM68DZgbA96dA
	HsOvWNKY2+pZWVFCF3S6u+gw2aocR7s9+CcStDS6Y60d2JVrw98/oVdweRl7DVksPQnH5YwBoCY
	RXCmo3tMXKDjfbyrJBauE1SHUTOdPCUmFFAIMKq6N9vzV8hm3VMlBhCRJVUBmrUvyDitTI8kMRT
	H+p6Ev5oTN7ea9QpvrgC5IHmZ0soOhTGKVzvdNaMqUhdyz4djYIx5B6HkVYrV
X-Received: by 2002:a17:90b:384d:b0:398:bac0:238e with SMTP id
 98e67ed59e1d1-39b3d8377camr7470429a91.6.1788636163260; Sat, 05 Sep 2026
 12:22:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-3-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:22:30 +0200
X-Gm-Features: AcwNN1XYNGZeZdAbyqW_MpHHmRnUCoTfhvfgQ1L93n760L7NneO9Fvtxk2YGC7Q
Message-ID: <CANiq72nxtehkGdb9RZpd=MsjWzp9euoLw=MmCzvcqOgxxEwymg@mail.gmail.com>
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

On Tue, Sep 1, 2026 at 6:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +    /// Convert from `Self` to [`Self::Repr`].

I think [`Self`] etc. work too.

> +/// - [`Self`] must be [transmutable] from [`Self::Repr`].

We say "can" in the `AsRepr` one -- we should be consistent.

> +// SAFETY: `bool` has the same size and alignment as `u8`, and Rust guar=
antees that `bool` has
> +// only two valid bit patterns: 0 (false) and 1 (true). Thus `bool` can =
be transmuted to `u8`.

`false`, `true`

> +        // SAFETY: $unsigned has the same size and alignment with itself=
, and is transmutable to

`$unsigned` (a few below).

Cheers,
Miguel
