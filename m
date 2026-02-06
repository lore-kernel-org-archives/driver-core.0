Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BFF936D4EA
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 13:20:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384022; cv=pass; b=BdxCGzLk8WOiOfUpb0iKzWGZo933oChIFAj3kP4riNIjNkdupR+VYMZF0fHD6l5ghfPtNmKhFEmwUxdeZyAuBMKtSFYombou7mpyNm++MsODfI3XFUye+ELj8vxAQUChDxG/DTHrTAA54aIPBbK2ghvfGZcYDb0VhhBSx8TD7Hs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384022; c=relaxed/simple;
	bh=mQf2QLV0AOTOBRRP2eJEVNn6uQeg0zDVuwg7hcmXByY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IBIFHsqN5aX08U7sPnsVQQVe5G45a/aXxQF5VYGTaoarkMcSKH1/4mt7D3zVh761NJO3icAj0vuDKNwd6v/YfuY9H/MHPeawMpTdakJVmPHto3umWmL1C0NL/wpLHPQ06yw/LkbgAYmCsluu0RQGA6aY/8oWup0XJ1JtKBr88bM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VJ1wBN2D; arc=pass smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VJ1wBN2D"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4806b43beb6so7219745e9.3
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 05:20:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770384021; cv=none;
        d=google.com; s=arc-20240605;
        b=cfvn0HTOVMpl+OcXm5KQNA9DVu/EgvLEiZwWKI5YngiUjEP/ogtH1/6xfTy825Batf
         3MWk+6Elq+JupIm9vrI8Tn2jLroyQcmvJwVPw6/E9c92dp+LnYnJpZBcdQ7PYiX3iZqs
         TimOn5b5pNkITNOUfMX52CKkNDXU1rGvki+pzd4Yk3u3lyHmmyPgITEGxVtQKgbZdsSo
         ndDXgSKf8uObdosuZUeOuNv+Gd18UJfTHYDr5wpLrZPax3ffLtHTlVx9tLiUA3Tphskv
         gGIYdmnbJT74AcwE4TymCkC5wblwBVqYi3G+jMAMj9I12eW/RbnsJSwbjwQwybEmtNAr
         BS7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=giEB9d3mcvaw2rNw//LsrV0vaK9o6mJRCg5+UHz3c/c=;
        fh=KM3wE21A7SPzwX5TAXRUysbXs89414dKXgartxK5etU=;
        b=FuZwu7LdWjqY0oNf8fqIPTc9UWZvTV9DPf5g0S3iMh8QADF552EE5Yf1s17mMPvP1Q
         7YpVZoFm9t8TTbV1itWoBqHvGrZbcRz+4circBGRZkvj7RN/AMbfmDcZCniQMAtCkVA0
         QiKfl8nuxuqzUK9Y8hXmAvg3t7fb+lM2rOB9llnhIXARf5UVeMoETYJbPCYK8FJwGq4b
         j5klIrbg4rlCOm+LNe7gESjSf49c/bz0lEFK5JAreYhBmEVbdXBmRsuuqoNETh9I2OeD
         yU1BYDGzx+DkcS7gUPiiROvx+t5uk2I9si5qGWyoWT3ZQGJ1/zeZe3yJzyFQFkgIXsdd
         9gKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770384020; x=1770988820; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=giEB9d3mcvaw2rNw//LsrV0vaK9o6mJRCg5+UHz3c/c=;
        b=VJ1wBN2DhvABPcjLlvQsjHPOQ6EixDEQRLgaluZ/w5MkjAE7P9cGToc8r2LZBEPsPM
         6T/pgrdrqQTnlLhu6ojgs6jXx77s8mhxG6J0BfKvBsAkzrdzAxx6HnXt1mXgAmE9qHdw
         kXjA0zkIo29faV4tqICnNAXlinnx4skNnhGGeh56QaqB1yViSvYakoqxtyM0VIXmM75Z
         fftMmssG0xmgUu5uwDDDsocZ59TFweX/1ncKh21626ERM2hQiPFlxlVyVkOrLzmAxbe4
         IV1m5DCbxEwsdDz5KSu3WT2G0H2NEuIl2xSr2LVC5nZ8J2uaC6KB/XODARb5TVQmVulP
         XFIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384021; x=1770988821;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=giEB9d3mcvaw2rNw//LsrV0vaK9o6mJRCg5+UHz3c/c=;
        b=tlT5Bb1UslAqv3Q3xotwMmJoLHofPXBJWHsL0gyRRu5x+8sr4mbvlyR7wHXnqsz6ne
         lNnt+rpUt0/Kaca8JaL6BUCkj405w9IarSikgGt5u4pUOvIemgVNxr0K0fZ/isyFJFwB
         685y5kxAdsCDEj709hh+3vrwFHFcR8CxUFrpLbnILePINU1s5sV6PMB9pFZMWEGDWnTW
         cuBCVSu0CZh6hnVZ+Rb+jgTi6J+aA0WnGmSiEpqJXX8hW+1vPKfjVm32n4QhtKCZIv7h
         SxOkLTN6GpFusngXFtHWuOhlxiFT//30zLeiv4nbYesI/6Y1wlXBF7KIm6vyJ+cmg1qs
         BJ2A==
X-Forwarded-Encrypted: i=1; AJvYcCUE6glZXT7qGZONIQxJWtsClAtOnyeLQ7kTbQzULw8rvQo5JXZWw4uIed8oBTY1OIVIDJYn7RZrOCHIKA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx71ibMwkpkdzCsJRo4oVuTWFoYxCyY8RdOKVIaYGOI5l3VLkfc
	4Z0rk4xjdYwFdKgVFcaGfoVFvqXLB7AAPC7A5bRLIOCK+EuJLyOlMZRSZt9bI5/20X+ydus0XlR
	x2wmTZYvH7w8V7JTqlRRmJBZ5Fb1haR5/E+FZ2YK/
X-Gm-Gg: AZuq6aLtSjqsOhkScFb9rXz7khceIiGW80QF/FfHAy+Xs45wEDj4CwPGCiofd3DrGgb
	Tl0pG42+Sskz/PRzXf65JVAkv6EfFlD4ref1REWTcztUW+WM45N0N1EpI+CYm4Xrimn21DcOHdn
	GKvMygYaEaXoMhh3mqMvILtrs+169Xz8R2eyq9sRrytIOeSoTK9ybCM6DlkJWMC0Q4jmusj9Xbe
	IiQ/rCFNalfQulCTcD1ub8F2V65uHH83MV8dXVH37eNTY20NHDWC/SiVK1xOeomimI+rkCkPF0f
	d+ZgzTnD7U3hduf/3qXR97NPzg==
X-Received: by 2002:a05:6000:310b:b0:436:1973:3b05 with SMTP id
 ffacd0b85a97d-4362933bdf4mr3662885f8f.2.1770384020241; Fri, 06 Feb 2026
 05:20:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260205224706.91996-2-dakr@kernel.org> <20260205224706.91996-4-dakr@kernel.org>
 <DG7TFGPVWGAL.3IXTEQW3K5TFR@kernel.org> <2026020633-democrat-moisten-631a@gregkh>
 <DG7UGTYDW2G0.37554HSAB6IXY@kernel.org> <CAH5fLgjS+QEGdGnxUBCeMFCapeErRJ6n1rDenbF1ahc5xsJv+Q@mail.gmail.com>
 <2026020642-consent-showman-25a8@gregkh> <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
In-Reply-To: <DG7WO1ZQZXUL.1BBSOAP7U2CHG@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Feb 2026 14:20:06 +0100
X-Gm-Features: AZwV_QhmeQoam3n0jzo1uBFXlqRkMsie5VCc-bSVoXtcXTIAOau4NBdt9NeFGMA
Message-ID: <CAH5fLgifC=K1wssW-nWR3wvL9OHEQ9x2hPd2+ENj_mqtgEhyxA@mail.gmail.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 2:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> > That's fine, because the rust driver core code should also be built int=
o
> > the kernel, not as a module, right?
>
> Yes, but the Rust compiler may still choose to put some of the core code =
into
> the module.
>
> Especially with generic types and functions the Rust compiler may move so=
me the
> generated code for a certain type instance into the module that instancia=
tes the
> type.
>
> For instance, even though rust/kernel/devres.rs is *always* built-in, we =
get the
> following error when devres_node_init() is not exported when the users of=
 this
> built-in code are built as module.
>
>         ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.ko] un=
defined!
>         ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.ko] u=
ndefined!
>         ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/nova_co=
re.ko] undefined!
>         ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko] und=
efined!
>         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_pci.=
ko] undefined!
>         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver_auxi=
liary.ko] undefined!
>         make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] Error=
 1
>
> However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not great at=
 all.
> Hence, we could do something like in [1] instead. I don't know if there a=
re
> other options that may be better though.
>
> [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org/

You can use #[inline(never)] to prevent this.

Alice
