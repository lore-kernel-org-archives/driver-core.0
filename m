Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73AAB36D51C
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 13:36:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770384966; cv=pass; b=Xe2rCSqd6wUGglpuqpS5a9tVdypf7j+iY9JjnBWlPLw05GyUM724YTIUqnZOMlwTdWButhSBNjnSONIGZcZWdggvbyFIIJ+CvDJZQXZdzM85vWlsbFsIAcytNangWVwII3IgasX7+lChKcS7MkB3Sk5ekmhuKu6OmxWSvQfVI8E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770384966; c=relaxed/simple;
	bh=B4wo7bz46IWb5STejM/RV7+exK3z33y53ajLExf832s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YPRk/PUu2rcRKZBTXbcazv372ostvitIsyq8rfuBgz38yxKLf9NxbhAEi63xXoKhEm8HwGUjG4sDZEfHtReliMMw+RV0bN6xJ6G2/OVrCdNyJ30qyrCwJsV7Hzfc31AvgcRJ3rOr4wAUd60LPM8Qn3ZJsVIOJy7wm0VxzLx9I70=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P3PCgKwV; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P3PCgKwV"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4359108fd24so1412892f8f.2
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 05:36:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770384965; cv=none;
        d=google.com; s=arc-20240605;
        b=UEtd2Z0vtY3jcYSttPjIAXWWgW/9/32ND/xnI3N5sDISdmPL4wVl0TS4FrcDA9s698
         EAlogj9VIrK5ddr1RtBC2DVJFZ8fAuGXJdhLwLbD5yhzM7KCfhM6c44Rlx4ACB6A3V4+
         Omd0S9teDgcfhiJKWmfDkjdI9XOXVV2A7k/JVSFmuQfxhAUfIEPcv6HV+/l6/+m07TiL
         O98q9i0I8Jwu8cE33I7o3Ew0vfP05qS8Qldbz8d084pXOaHaBgZu6E8FyyqAcjFEoasQ
         qGNBqUWfwt43sH9toyxDhk+iCr4ORbLr/mEX/KMMhnB4agIyQHvRd7AId/Vos6rRI3ZZ
         +B1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Lu4swG8oa8yIWuIllYhwtyx7jJ4M+hbyB3/+/m/7kB4=;
        fh=u0QD3OowRzhglEGKHgk+0CeRwtpGw/UywS20wwzxC3s=;
        b=AVNEk38W2EyP6VoS87qqDXna2mgjiLiTi2Hml4VN0b/iMh6jYfxvRWo/GEyCjbs7kH
         h4oclZAKuMpkFgwrnSrFt4LTqLuTjUHaOvwhnZiEKYZ7N5hfmhcOqcK//otVkEhF+GkJ
         11jtPjvUoSDqXWIGh72PNfRv/sOhOm9/E8OzxKyKrfGhwL+p/hl3DiXFXTJjuXpPw0o/
         K1dD80hxe8D/8wg7qNyw5uuYyFAc7dAGGd4h2ShCceT9tjS0YEJtS5NBQPBMwlhwpXWU
         sz5uW8xG+y+d2m4RW854z76kG3ndIRUridLORPPPJSwiIJPcjeMz2wPALcCtuqVNnPgb
         uROQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770384965; x=1770989765; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Lu4swG8oa8yIWuIllYhwtyx7jJ4M+hbyB3/+/m/7kB4=;
        b=P3PCgKwVS/S207UPXeNzSZoI/CYCkjZ1Yy9vF7MDNqrDoE5kcoqBBxxM3T8et0Xrmu
         w8dTF4HUBM+UyWKXWaB9guygDKS4ND5jQxZClc4eGHYoRkmZ8j0RHLcJ6XinIaiYLex/
         4/Lv1WbIehoHMHCm8WKfncXgVEMd1XSX+TwiTY8SauXB0wAjBrFP3x13AO/eQhNjn9+V
         ltd422HqVVyZ3Z+ADrA+HLQLZ1jSYdr5hgNk+AzuL2/XJ92hb9e5MWV/cE69IsmY8EQE
         sQt4LISJ8LLD1wLnFpBfJJueJFkEtoMv6qI9g5oKa/gc+bMOJ5R4bYoYpNjX3Iwdt4vZ
         KeSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770384965; x=1770989765;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Lu4swG8oa8yIWuIllYhwtyx7jJ4M+hbyB3/+/m/7kB4=;
        b=ierT+rycyX2/M/QsendyQPLGGvJCgj8/Mx5ZYPhaN/c3rHxTLjjWx3Nv4J05+HmzwF
         Y1SqAI4mMl3/BT5cjUvWPmSeR7hDWqwLeE8L1PbNq5kdBVD6chpCRoyLZQ+ij23dg7qd
         HV9SPgBKfmDhET9etO/1ENdchMkaNESjUBIw8OMgsNvvrc7J/KqRcX/dqRB/21J4KPTE
         ubvj7SuKwOdSusGtyMEfZByhxNgPPXW6phB4QcIeUokceg3Axouk0VqBD0m4WHuFzWSH
         7WlXz4ZZlbhHeDmqCzmdbpr5ok645fyKWdrPgqMPrkE97h+v0RUX33TKrBwdjN5P2f4E
         yT2g==
X-Forwarded-Encrypted: i=1; AJvYcCX8i8DZduYSpVeVTLHhg3q1D9tVoQEyyFsmBFV/8Z/oa09RL+xhiPBhDe0kd9tTT/PkQKprYV4eizfp2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YwVgfQ38zTT5XYo/2XElFTwJhO/hl1lil5bTa0c8UwjcfNkN7Vw
	0n3+HFrVLGrjl2e6aiHHSzjg+PJnE216Tqxr1Shmxu9aizz2feUBSvdCZktZhhhbmKRsuGNZXrf
	3aQx5hR5q5X/off+L5cvmBRJdakt3nWDYzOtdqbU0
X-Gm-Gg: AZuq6aIOuSmVd/zhQzx+5H/4xSPMNUae2+v2nJzhs4T64k8ZJ5jejhjZ3NbCwQRGgJC
	AmbTooSh49C544uHtkH+eLQrKZKoC5D7ICnXBMPn3G2lS7l3zSui6FhFYnUukMKW2WqIRzVDvRk
	1Q5GdNAmoa5B/ZIyW0W0d9HdofkEbWaynYEJljcT8SguromAIxVta5aP6o+U8sIwamhSj/dXC8i
	FCYUsMeI5YOtHLK/aCALLTlB1CZtIPeRRClZOUl2jlEfF7c41PgBpEZyjx3O670d95kMA2Pj8H9
	19zbFJeWeIZ7DaDnH+wwkn+2KFWE/zF0SXdJ
X-Received: by 2002:a5d:5f83:0:b0:435:a3c5:a526 with SMTP id
 ffacd0b85a97d-43629658283mr4332188f8f.14.1770384964416; Fri, 06 Feb 2026
 05:36:04 -0800 (PST)
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
 <CAH5fLgifC=K1wssW-nWR3wvL9OHEQ9x2hPd2+ENj_mqtgEhyxA@mail.gmail.com>
 <2026020618-congress-tuition-8893@gregkh> <DG7X1LYSZ1IC.2Q4CYXM97A62A@kernel.org>
In-Reply-To: <DG7X1LYSZ1IC.2Q4CYXM97A62A@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 6 Feb 2026 14:35:53 +0100
X-Gm-Features: AZwV_Qif7hDzpSahBrdxC13G57b51wYhzQZmYj3nD2Tj3TDS2mn-KjrevwXcrOI
Message-ID: <CAH5fLggPi1zhQdUjt3WqDVUEWy1KVPK=iiQfbNSig697J7HS=g@mail.gmail.com>
Subject: Re: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg KH <gregkh@linuxfoundation.org>, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 2:33=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Fri Feb 6, 2026 at 2:25 PM CET, Greg KH wrote:
> > On Fri, Feb 06, 2026 at 02:20:06PM +0100, Alice Ryhl wrote:
> >> On Fri, Feb 6, 2026 at 2:16=E2=80=AFPM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> >> >
> >> > On Fri Feb 6, 2026 at 1:34 PM CET, Greg KH wrote:
> >> > > That's fine, because the rust driver core code should also be buil=
t into
> >> > > the kernel, not as a module, right?
> >> >
> >> > Yes, but the Rust compiler may still choose to put some of the core =
code into
> >> > the module.
> >> >
> >> > Especially with generic types and functions the Rust compiler may mo=
ve some the
> >> > generated code for a certain type instance into the module that inst=
anciates the
> >> > type.
> >> >
> >> > For instance, even though rust/kernel/devres.rs is *always* built-in=
, we get the
> >> > following error when devres_node_init() is not exported when the use=
rs of this
> >> > built-in code are built as module.
> >> >
> >> >         ERROR: modpost: "devres_node_init" [drivers/pwm/pwm_th1520.k=
o] undefined!
> >> >         ERROR: modpost: "devres_node_init" [drivers/gpu/drm/tyr/tyr.=
ko] undefined!
> >> >         ERROR: modpost: "devres_node_init" [drivers/gpu/nova-core/no=
va_core.ko] undefined!
> >> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_dma.ko=
] undefined!
> >> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver=
_pci.ko] undefined!
> >> >         ERROR: modpost: "devres_node_init" [samples/rust/rust_driver=
_auxiliary.ko] undefined!
> >> >         make[2]: *** [scripts/Makefile.modpost:147: Module.symvers] =
Error 1
> >> >
> >> > However, sprinkling "raw" EXPORT_SYMBOL_GPL() due to that is not gre=
at at all.
> >> > Hence, we could do something like in [1] instead. I don't know if th=
ere are
> >> > other options that may be better though.
> >> >
> >> > [1] https://lore.kernel.org/all/DG7UR3WWZB4V.2MYMJJH1VDHH@kernel.org=
/
> >>
> >> You can use #[inline(never)] to prevent this.
> >
> > Ah, good!
>
> I tried this before, but it doesn't work. It might prevent inlining, but =
it does
> not prevent the compiler to move the function into the module binary.
>
> For instance, even with #[inline(never)] on Devres::new() I see this:
>
>         $ objdump -t drivers/pwm/pwm_th1520.o | grep " F " | grep Devres =
| grep new
>
>         0000000000000000 g     F .text  00000000000001d0 _RINvMNtCsgzhNYV=
B7wSz_6kernel6devresINtB3_6DevresINtNtNtB5_2io3mem5IoMemKjb0_EE3newNtNtB5_5=
error5ErrorINtNtCs4gKlGRWyJ5S_4core6result6ResultBK_B1i_EECsjBm7MKWXKwW_10p=
wm_th1520

Because it's generic, see my sibling reply.
