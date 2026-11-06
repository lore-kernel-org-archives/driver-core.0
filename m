Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793979918;
	b=Bb+gOsszt8i3HN49GCT49JzVR9i69ifv6tAQsVAgsq9fjYXDApUcK5VlNSFiP9AK23Gn
	 zddM0gh/35cKczDXEXEo/PEs9aZsTTCqPHRMLihY10CPtG3orwgIeP2+fgH+YNo49SHh4
	 yqWQYOlgJ9NjECZbUUz6sNeh/kuGYK9PpAKXlVnSSPhcAFPQWrBWBU0rUz0/VtScFszRW
	 OjJXaO8V80rTSdThlykZ3LaYuSpo0XJk9ok/ZhnhGlfDGlS/BrxUkvEaTkpTc83L34rEm
	 HWmwBCv2ZhohvkYsUneQQH/nXohDHqLh5n8tunpsoUFYxIawh7Y3tSXCtUkdTiP0KFg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793979918;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
	b=KNJFd4Z6DMixikfqMc757K3bBOG+yCFLQq7i4v7BYEXuPCsBUWXRSnLq+NgQTPsyJHtP
	 ZqKJWveCsaEFsamBiKIV4Qv4X9mSmdcIr3iirV5mbdRgAOc6XRxkqd/1OKMl2eKkSUi7e
	 ImdqK+jEEHBANJom6/ChHiCggt26jcP7r24GB5swFaUDKOqM1MjOPExac9J7nqdZRSInG
	 uYeXl/dHvjstCdB+d5eSizoZhoCSs7EC/15A+yqzGiIDgJeYGev3w0Ue1Cad3Yoo34TMz
	 fuCm0IUpbRWtyph3/prDiRJEtGfrjEjR8aw/9UeaEVLFvO7TuBWwbdmWA/9tNHtYNNQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldxLw3BF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.175
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0951E606D80D
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 15:45:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0951E606D80D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ldxLw3BF
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ac99992373so5685741fa.3
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 07:45:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793979915; cv=none;
        d=google.com; s=arc-20260327;
        b=S162hpcLWzIJfc+5Znr3GszeqKltzNYoBCQ9kIXpAclJAiFX2KNuY2ZKNvr6iF1NoT
         vtlHVEIm6ZquGn2VERIvDThi4qe6WXHiq52z7p/gb6t+Q7YZikj1crv+IsMvkyNst3mG
         L4HuOZnxZZlYHDdTtMs/gCwtnHhiT3STZoDx+G0tlooSCInlNnOa8q4TjJhMqeaQnW66
         8ywm0OGWqy7cVeAGQ3cSqid2G26K13k4BKFXn4fr5SLqCsTvZ0BqaZOiG+FsdplWhclA
         ala1XKe+8E6zStagOU7i4QDpifgdRC0gUIG9pE5Ho7F2+8t+P6ud2emcV6rj9wDFPoXN
         a9vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        fh=lA+/T65aYT30Ew2UOo63tO3R1FJUPu+DXSWbDqLU96E=;
        b=FGeEHBpJvYokCvDjlW9HiWRZCcVnVuyTq8tJPss66uL0Cp6YLH2tDB4IwkwvhrHyHs
         u93AfXKzK75S+twXs60S4kkzgDRrftsGBUiFWq5MeVczGNdDlZjpC7c9PPXjnY44bpKL
         QDm39zzEmAQP3az4I3j7uGwOMyU381IO4WGqcsMKNj5ql/PK8C0ZKnKHnUfMZuE5BlxM
         zttF0B8s1d6QHEUnU9VTZu/huwm+wxv0ymwgBe3e4XPx6uWT4kpjv/gD7W8oCEYAxRxH
         TXsR+g9P2wzPqoHiOBuMGPUo31WrSoAudAe6q0equ1Z+3nXUjkI1FLD9SScUrkdqivtH
         19XQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793979915; x=1794584715; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        b=ldxLw3BFQsUOmHaKxggG3InjtcSFuwWP2XQBVBohzHUJIer2O4ivuLnTfYBrLSaIGF
         D4gTVzaRVJR039rEfh48X2ViLYbO1uPZdPsQFdKAv6MrX+1rDBy7qaD3s0R9N19LbcU8
         JKH11YPintDDLp33GJFhvb3yeQPgPql4eQyw/wYAKoUEc/6k6PQxvmXQTV1soLh/a7JQ
         ABEr8e9r23Q3nybNRVtJS7lQTtLJqtKHlLYPh1h893j79AtpnYMs4m7cDcVnY3VsWc79
         hPNNNjN/d1foani/lwF2HAJVNYTx+6g+sDWgHqA5tonKH0dncwGvStkbZa/Vv30dSIg4
         Ua2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793979915; x=1794584715;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=l5tSVn8Mj/CO6j1uR03XuID6rPx5lFsALyBs+/EQOlk=;
        b=rW51qHuc4iUCwSLvI/kOHpzMLYz+I1KLcayZzUUXnwX8n9+7KTq0LMN3PyC1eNsuhe
         misyTaAfCkdHYYeCHYJJ3aR69YPtThZCBQ7V8hqXRnRolXqERbXcw5PD8t8hYGVcOj4Y
         X3WYEIOa2QNSU1fXgXRaW3f5j4XgM1+YmSKBMW21BJ7niqMFOlSBqRj/joORzPikeUk5
         uUSDrJfgr6w2NrALEILaxXZMV9g65NONeJHp06R2uGjurJhypXMq2rU1wuVcRNw8cf4Y
         hkIdb43HZStJIr6NKsm+T8y6DRtIuLBR9aaOXyWq4EHPBu7CGi+RDfgiRrsX7fVQ8Hbp
         KOhA==
X-Forwarded-Encrypted: i=1; AKwUvBw+x6UD+cU87BxraO5YdRw1edjFw7cJasCdc5hxpBAWR9TJWy47lGKGAGHmvUWCCnYfIRzkt9i0xi95fw==@lists.linux.dev
X-Gm-Message-State: APuU4Z8LcBB6LhlM6BiuP1KTPs94m4TWzti/YXAQoy8afaJSyOcDDznM
	6xvBtA/WwN5G0Kneq2jjEyRE3Sfphu7foVXiU8xLsKtogtTImNQFOzGy/VTxzrcXC6IiQzQeA9k
	wOJVJi9NfMeJ4oUQoQeDH6H/klYMPV7g=
X-Gm-Gg: AYBFou1jTc1ai5bX7r+9DCHGubUaEq0kXfxYOMPIXTWOXhtAlG5/UJGBcLqAEJKEhAv
	iqE+Ys6NiUIWl/dJticDIhnqyM9lFsyaiNr3Y2m9tH+h6sen5gkO0keZYl0fHmoMZcf4coDnN6p
	ZBXzwNQQ5c5WXfAdMDt05MoU+ZS2vJ0qGzb+UOsE4+603bKG6HG6iloZ+CPeU7CV5aM0W/MeNYU
	Z3VfHQDzbvSm9824hVm/a3uQgwIfJcMViClQYpm+DIHyt8Iad8zV6k4wVMgav3YxYerfqiasMvj
	CdglbxPyzzTUkYbjOxdPLJBSAcOXXK+4cwWENe47hOFvJmOgl4epIWu4Uc6RbWeKQiGG1wwcxfp
	GFZ9shbRm874WXKxZLJNAuvjyJri4pD5ni2HUunY=
X-Received: by 2002:a05:651c:1612:b0:3ab:2a19:8624 with SMTP id
 38308e7fff4ca-3acf3a11804mr5879131fa.5.1793979914945; Fri, 06 Nov 2026
 07:45:14 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com> <tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com>
In-Reply-To: <tencent_173B7731E90B9624F9F82613DC3031B70907@qq.com>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Fri, 6 Nov 2026 22:45:02 +0700
X-Gm-Features: AclHuK-XTflrXNbXUwnG9Gy_4IC-jvOmhlr3UlYx53CWnDfOKCsQP4T4U6VaP7U
Message-ID: <CAO26r3TMHb=YxzwS7DYDUTS9U454zrq05yC-b8ojva-pAdCsRg@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Shuai Liu <847807867@qq.com>
Cc: Igor Korotin <igor.korotin@linux.dev>, Danilo Krummrich <dakr@kernel.org>, 
	Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Lars-Peter Clausen <lars@metafoo.de>, Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, 
	linux-iio@vger.kernel.org, linux-i2c@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Tue, 3 Nov 2026 at 16:53, Shuai Liu <847807867@qq.com> wrote:

> 1. clippy warnings
>
> `make LLVM=1 CLIPPY=1` reports four warnings on this series, which the
> Rust CI gates on. Three are `clippy::ptr_as_ptr` in the IIO abstraction
> and one is `clippy::useless_conversion` in the driver:
>
>     --- a/rust/kernel/iio.rs
>     +++ b/rust/kernel/iio.rs
>     @@ -202,1 +202,1 @@
>     -    let priv_ptr = unsafe { (*indio_dev).priv_ as *mut T };
>     +    let priv_ptr = unsafe { (*indio_dev).priv_.cast::<T>() };
>
>     (the same pattern at lines 334 and 397; line 334 is already inside
>     an unsafe block and just needs `.cast::<T>()`)
>
>     --- a/drivers/iio/position/as5600.rs
>     +++ b/drivers/iio/position/as5600.rs
>     @@ -133,1 +133,1 @@
>     -                Ok(IioVal::Int(angle as i32))
>     +                Ok(IioVal::Int(i32::from(angle)))

Hi Shuai

Thanks for catching the Clippy warnings. I reproduced and fixed them,
and the Clippy build now completes without warnings. I also replaced
the ignored, AS5600-specific example with a generic `no_run` example,
which is now compile-checked without being run.

> 2. ignored doctest in the SMBus word helper
>
> The example on `smbus_read_word_swapped()` (rust/kernel/i2c.rs:841) is
> marked "ignore" and references driver-specific facts (the AS5600).
> Ignored examples are not compiled or run by rusttest, so the helper
> currently ships with no tested usage. A generic, compilable example
> works here:
>
>     --- a/rust/kernel/i2c.rs
>     +++ b/rust/kernel/i2c.rs
>     @@ -841,8 +841,15 @@
>      /// ```
>     -/// // AS5600 stores the 12-bit raw angle at command byte 0x0C with its
>     -/// // high byte first, so the SMBus (low byte first) word result must
>     -/// // be swapped.
>     -/// let raw = client.smbus_read_word_swapped(0x0C)?;
>     -/// # Ok::<(), Error>(())
>     +/// use kernel::{i2c::I2cClient, prelude::*};
>     +///
>     +/// fn read_hi_first_register(client: &I2cClient<kernel::device::Bound>) -> Result<u16> {
>     +///     // A device whose 16-bit register selected by command byte 0x0C
>     +///     // transmits the high byte first needs the SMBus (low byte first)
>     +///     // word swapped.
>     +///     client.smbus_read_word_swapped(0x0C)
>     +/// }
>      /// ```
>
> 3. repeated unsafe blocks in the SMBus access helpers
>
> Patch 2 implements the `FallibleIoCapable` impls for `u8`/`u16` with
> five near-identical unsafe blocks wrapping `bindings::i2c_smbus_*`
> calls plus error conversion. Extracting four small safe helpers would
> put the safety argument in one place and turn each call site into a
> one-liner:
>
>     fn smbus_read_byte(client: &I2cClient<device::Bound>, reg: u8)
>         -> Result<u8>;
>     fn smbus_write_byte(client: &I2cClient<device::Bound>, reg: u8, value: u8)
>         -> Result;
>     fn smbus_read_word_data(client: &I2cClient<device::Bound>, reg: u8)
>         -> Result<u16>;
>     fn smbus_write_word_data(client: &I2cClient<device::Bound>, reg: u8, value: u16)
>         -> Result;
>
> For example, `io_try_write` for `u8` then reduces to
> `smbus_write_byte(client, reg, value)`. Happy to send the full diff if
> that is useful as a starting point.
>
> With 1 and 2 applied (and 3 sketched on top), `make LLVM=1 CLIPPY=1
> drivers/iio/position/as5600.o` builds with no warnings and the rusttest
> doctests pass.

I also followed your I2C refactoring suggestion and added the four safe
helpers as methods on `I2cClient<device::Bound>`.

Thanks for taking the time to review this. I'll Cc you when I send v7.

Thanks,
Coirul

> Thanks,
> Shuai Liu
>
