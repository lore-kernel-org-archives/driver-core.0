Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C976384CDD
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 16:33:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784219596; cv=pass; b=a55vJmyfM84G1jpPzkoOrp8821zBPwbErWWdQkg5tIGuXJW5An+4T4qUSoNksw4ES6fuqIjPs1pb8NhdLsPNugvogEzn1gmJzJqpqLqb+2iNFSJqtRGIzvkanExWtGbL3BzeTGSRHs/rfeoOjc/AN9Qctk5uAdRpKZP0TpgCJRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784219596; c=relaxed/simple;
	bh=tNGDQpr2wtelauRkyEV1WYWMk9U58mWKPY6Z5KYDsrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AH6fG10oDBuWmlszoxgoV9C9XPZzlTO73pK3DqHY/AgFuhBEUA2UhV7ZFzBAc6+Z+aUQJr2vUpN7OYVeAtI0I1/txUOK+BGildocCDBStsYwCsacz4FCqN/1LgmfGFmetSXwhI1u22/u+P8P0NIX01+5A/2ndkCLcGom19blfcU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZXIHYxA; arc=pass smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZXIHYxA"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2cac39b729dso17120545ad.3
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 09:33:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784219586; cv=none;
        d=google.com; s=arc-20260327;
        b=e26QvaOunD9tkt9rX4B20SFG94hgT/Re26yCwqaYmV35cfsKTBVflB/wWnuAv58FTe
         JDfzYRWgAA453f24S9NsLl/W4A0atnGLThFEh+lQr/9U0+jEpXohlAp5N44ww8KdlIWb
         BpHJF351jvcWC8j6roDWBdcpZXONVteg1Odl3hIscCOZAQFqzY9uRmaSJQhgMDEq0uOu
         J/pSYTeE66SfcWJw5pq0PhMaZvNFP+sfIwtyr/zTv60g9+rMnACjAUp3wIuzfZQwTOaG
         S5eweNLKyWHJZdfZYC/bW1YBZ+jV2XbJvwaUGgL2Okw7y/Bh2gFQwZZKzdupfbL34jCp
         sMDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=t1C5iI6y//WyP3i7clmyabllqAGFWRzFp8nqIFUV6NQ=;
        fh=jhNkguSV8pRi/+2GEYsfjVJDumHT6wpy34h/Jl0nmmM=;
        b=nV/xSUAzZv7fEiT4++7XA+AGPzLScS+j9io0VPXcMgNelrkCXSub0Lyc1myW8aUe64
         K7G/aPUuA5w9VZ8n4d33E5OOtGI1I6Ss2V20fIxXr63jOGmW4ZW5hvvAvIykmUMq7JnJ
         zqbp8I//CL5zzXZ5Zy8lk/0ixvchE6nNJEr1+I2fZ5vXC1jgsa0Bs6V4hjV1u3cesboB
         U9pw6zS2t4TnMeQIxd1jJfKzSGszaw0i1YflzTjBBUrhVg1Yl617Tlm+CLy/IRK75MCM
         rL3Zr+zqcvYepzmYHLkaXYlpdjmkNKpF8qlUa99mlR2UTlwYCRfgQOurPmgpbHnQnEzw
         T7Fw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784219586; x=1784824386; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=t1C5iI6y//WyP3i7clmyabllqAGFWRzFp8nqIFUV6NQ=;
        b=lZXIHYxAmWUa8ut7DK8a0aa4UfEg6Lg4TqdiJHZJTnSqldQlIehSSNaLA/Xl+SJLs+
         qb1aQWNBvDyzAhhVl7qzLOZozMHEhGvi0miTO+c/2yX64HosEK4RQnCBdt6LOB+2CAAe
         LuBPCnxzlCKn/UnZyKsl1IzxZ96cnsNlyC20ekonTSb+7F5Ce7zFlL7RsfRxCpv6aaKP
         h6oagdsUa/8xvQU9sxfopJUL+jSrTOLUPTyge645StAwvBoz5dxE0Ic2wmckQVfs3n2H
         bVsiNgC9GJwoRC59HWmnlh2v0wWfOtCJakGKrw611yPqzt9sBNHvCzUkkd0uKuPXjzUx
         aKiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784219586; x=1784824386;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=t1C5iI6y//WyP3i7clmyabllqAGFWRzFp8nqIFUV6NQ=;
        b=kvjiGVA213nm57nw0ZFEQQQTbNSuqXJU+C4JweElfoaS1BKaItBwO0p+CFl7/q0Gne
         5s7HNsuT2p99PevsubuRozDXjMCNXAunkYPch9/CxzQBAIAb/K2nkoF2/x+1mdSrLK4G
         9YkGyVLTsG34lTjTXzKdn0IGPGkLpFvzaGtPYgxpJomsFC7fcRrg/PFUMfE6BqcBPMzl
         SEiw7GzORMhNUTaUrOWUeIx0dRDQX6D2DOq7RujRCYwH+rPxPNTnSeOZkspl/zfbvKYs
         EzNaKKyIfmb8rMoio4NQtarLSpQV37ERa+yaJWPmtXdpgRI7Y1ZDIiPsdfCENdXqHLPo
         2gqg==
X-Forwarded-Encrypted: i=1; AHgh+RqPvAQfM8qB0RfcWVDv+/v3wg0j6ucwStFmT99aIbahPLDn39K8lbEREfSDvb7wFN/zOHQ9NwuMUgxosQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwXRh5KWI5DOrd/ML6ivbfq5iiGxX0h2z4IkB2lM8jP+fz8X7Ld
	fWHq1LgIlVvPhyNY1FcDz6+T+Ih6tKki18X9GlJqI5rFCrFit+10E6mXXIwsDEFB/7Aw/RMF2PG
	exG4j/4Gyz+BDUtFbxh+kOQCk+QWm6fk=
X-Gm-Gg: AfdE7clcdOdV3a9p/mykSsd8L8RZpABugV077weXMli1wXxP9uo9Cl5t9YHtWbNHvdb
	ss1wNlDoVMtpF+evDLrZ/4deb6UWN9Ghk8mBllbO3iB21INbivdjziwKtEmw3Gzyi9veD68cy4/
	ER39KPZUAII24/00VDiCb25apoisCQ2dtuYyameyriUwO58PpAAXxyxtUVtprdwrv713aWD4EXi
	GnUuX8lNCygXw7Dpr/Ntb99bXnLcRQRbS2JXuk2JgUC4uwm0zU9dyfYBZLjGB6UvtqXzBMcWpJk
	xE+g0cA0igCdK+UbLD5Lv4J9uZFYX1wR2rogxylvWTFNIeS2aMbjGlpjb9PLtTRksRJEhZzboFj
	lQQ==
X-Received: by 2002:a17:90b:4c02:b0:38e:bfe:81e6 with SMTP id
 98e67ed59e1d1-38e1a9d90f9mr7810297a91.1.1784219585950; Thu, 16 Jul 2026
 09:33:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
In-Reply-To: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 18:32:51 +0200
X-Gm-Features: AUfX_mxPokx3GaYpNkBp6-lei8Fb7lN_DjgdfGHoMR0h4GDo2j-4L4nqakTib6U
Message-ID: <CANiq72nhRy+LfZbEZt10artNGkpw7x8c9P3yMBrQiLEGv22ncQ@mail.gmail.com>
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

Applied to `rust-fixes` -- thanks everyone!

    [ I was doubly surprised since upstream made it a deny-by-default lint
      a year ago for Rust 1.91.0, and yet we didn't see it; plus I hadn't
      seen this in my CI even yesterday.

      It turns out this just landed into today's nightly (nightly-2026-07-1=
6,
      using upstream commit d0babd8b6):

        Link: https://github.com/rust-lang/rust/pull/159222

      which says:

        "The `semicolon_in_expressions_from_macros` lint previously
         suppressed warnings about non-local macros. This masks
         a lint that will subsequently become a hard error."

      So that explains it. And this is the PR that will make it a hard erro=
r
      at some point in the future:

        Link: https://github.com/rust-lang/rust/pull/159218

      Thus starting with Rust 1.99.0 (expected 2026-10-01), we will be
      seeing the deny-by-default lint above, so clean it up already.

        - Miguel ]

    [ Fixed typo. ]

    Cc: stable@vger.kernel.org # Needed in 6.18.y and later.

Cheers,
Miguel
