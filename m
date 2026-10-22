Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792685133;
	b=LrNb86TIwXUl6T9MjV2/w4qGm4DL4qXCwvwGsUeVt5NcVkQNCbSkvR1AAszdFPqQ4Iw7
	 dLEgIwG/45vwdGjMrubRna9NO1XH9unugAg0eFoauCU5sEbJTSVAWyZORErsU1ULToFt0
	 WKxMCBsIwadt2GLmNN+pmizA07NA76isaHXV6BC3B/onSBlRcx2eayTSRhFu4Cv8icQD8
	 AuwLwY5VzI+E0RFqLD6hPLjq0H2+wcTFtPDIv8eEZWj4IotT2BXGLCpWdxUXme2kmpcQV
	 LGbtR+jKTWHDc8V5a2bOJ3oV43ZVztnyYi6azl7vze81WA8PjWYrXjcVW+oOKwnM1Nw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685133;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
	b=v6J0sv30xNUS8ZAkHY/8yPJBzd+sxIAPslZIuGKjt7EKopu5Soqw2FF80hyQtaatO9CR
	 jq35bOPDmkdSnkY3F8jWQVXrx0cVhjeNOOTdl9egDQArBg/VkNQWHA5iipa8hyxLvBt3J
	 jCyh0qcoqfCADMBn5CxDSdhTtyuoa/2xaZKGBz05DHAvOHEn37Xl4nFHAKi5RBdC1E1xD
	 FDpbve/Kd38/vigCvib3ObNap/JPXSl3DdY/ooeKJvsCFkz/2rhqSZXdIWpBXQwbPhl8g
	 1Q8SofO2CGLWLnZG1/WEBpdCl8bI8RNA67FJkkM0ka/ob/ee4iks4Fq6JfjLZdnOsPg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BkNKHea7;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.48
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC935606A319
	for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 16:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CC935606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BkNKHea7
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-5bb7c6980f1so1695684e87.2
        for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 09:05:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1792685131; cv=none;
        d=google.com; s=arc-20260327;
        b=Xqjo0b9C+QpU5NKbvdcCVSDvJXtccS+ios0w0wRxwnsuu42/RExMGh4IHU2QlDrt9j
         I/dCVkytY8XUHusOmUIacp0t6HjctakdlUjclgXVqUjY7lorkLX0xQXs//VE+7mrCMvK
         K9LEJgTGx1i+mIWbKqYRfST1BWwDnx2yB1j9/PTZeHaXliYX6j7HTM3mJqxtk0i7zJP6
         DQSB/9Q8EJzcPxw3yWI9MvcdUSUEX/dw8UzZct0goHEkdmo3JrIX1Z85YMrhMSSZRAht
         fo+sDuaoZpNMCkHE49aOeSmhW8v8OJpQ2eWGRbDmaqNgv4nG4n9/AKzwJu0iHJqeXlzL
         R3/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        fh=pE2f/xz1x4E4VT/0Z43dVaNtHdtb81W4tQUr443VGGI=;
        b=Ps3owpvNEm8GTgYTCoOPw23ZNxtuzZiElNi96zKpkrBO3Q7P02hjbcNbAPxzTHgnD2
         g5X4MuT+xGJibcTIv5shDQOTjnxWOFoRcnghUjt3mmvifs4hbGIXtMKGoaFbiOyDbfuW
         Wga+hHuznKj3D3Qq8copT5+gjkTFJQjyydKETH1yCmCzuw4YRSKvahVdgw5tJ9KeELej
         YaPp6XddDK7F+N0FLs40OQ2mbJ3P6Z3O4Cvb43u+L/BNZW1CQ8U/nwLBVgfYZ6qngxVG
         91X29mXwrK4A+OFza3jBwZPcSnJCZ4cXiGDCPrTkZ/LgT+QwYbWwUQrbWbfWaqGcmmjG
         7UgA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792685131; x=1793289931; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        b=BkNKHea7d3y7iuIvLDSEIXB6YE00jdFGJdqOJYxRmUpoj10irzfpIjYDShw4g0f+G1
         e6vSAZkUilW97ObY4dkcfR1QSPExOluc9hI6YKAp8rSWtNg/oy9z0lV/ZJP/GF/zJIQM
         NA/kDdSjVUeBRCncIoemRCJfemf1eec/6MDCIQ21hbeLBRmETW6UI5nOOcKTEhiE1bsB
         Kez6a/mHaW+VXlhH6+6nM3++eu2RdJQx4bkhs+xLTEorITJfCtGpDJyO4IxGjAHVn+VC
         E9oekNY1mm4W6DO7lywmEbPVV3JgDiVF8cNLoSg38VC5BwOmT++FYmKbGjc04jNNsgvn
         118A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792685131; x=1793289931;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mocTbU6QYoGmhL7dstIxBqOB3/wT12OUsHUZqXTiEeg=;
        b=j4xOUaZEq5GDXzwcq9U3LHq2z/oZbfwOfIJFaE1NZVRdkreSIgddU9QVYZ9JDSEBex
         o/J5HIWwyi27ev4ZzIaVFdrsrYqxOM2xHSDyuMkZ8NEQJPw+oDt25dFKdvKhKIVj4JYZ
         IGIslhSp4m5jI3QfdwoN28RopDgOdi5BCoqulf7GVqv5Sov8eRADpxpMIavZgX+EMyqK
         KhWBNDRGA66/nlbVPqW5Q29piT+iaRh1ZIrxgBhSEFMsynUkJBaz0+sDsge3gJjrmR1N
         Zmz57zRqZ4R+3/ZG7O7VSPnvpuyWupFIGH+CLaHkz0EwTnHioGEmbw4+e+10459iAskE
         HzGg==
X-Forwarded-Encrypted: i=1; AKwUvBwOVtyGpB9/cEIz++lPHDfA/gvsE22L3XZlj3Dk8YIscxE/TX1/lg3MV2yFelXjIgH0bwUqE9PFHYy5XA==@lists.linux.dev
X-Gm-Message-State: AFq9FYJsKftPoy+AlNQjlJwECuWthyBLs/ogiWe4ODmFU6jNdsf6IzJG
	mkXKkv0xVE3VJdFSPh8I6d6AOfCpwmLvXlKtvtNRlv7rhdaaDvj8zi0RFgsnUjFKa930f/0HVFf
	XF0APXDbS4IW1N0WvAEHR/SyUeFjZfug=
X-Gm-Gg: AYBFou3EuXh/vImXRerE5msXmlALvBN6haBQaNOrJaJNuStV+YJ0IxzeJaaBVGvqfl2
	RlhuYjmpAlYhK1oljDgDV4ChHpK9R6Ql4QtxyxHfMoTnol/kirri1kTgrHeDsq+bEf6r+Nq4lXN
	KSFgvbFL/rCQHAq37qT8JyINpvslxOZhhs8Ifq1s0nZf8p4KqCiPMgVKOsJ5eflVDCLzOApjdZ+
	cTSeb4Kbe+dfapItabn+fx2ao+MJ6VWRyjPyJxvQ/uOJkO0u1e6A1r7B6/PfvB408JRirpoEn7F
	W35dpZ5vVYpuXsdbdL9Q3iq42Eh3MG8pFMdoLIinhymYJmvmJuLHPSs5vHOug1IeIxfPH2zunIv
	5mrq873e0Z4EyPS5fyDQj5/pLwDDZPOWedlMvNw==
X-Received: by 2002:a05:651c:c01b:20b0:3ab:3f1c:c2c0 with SMTP id
 38308e7fff4ca-3ac441adcf0mr12071131fa.22.1792685130710; Thu, 22 Oct 2026
 09:05:30 -0700 (PDT)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261016154819.17936-1-muchamadcoirulanwar@gmail.com> <179260197668.3127.18219777718091081046@linux.dev>
In-Reply-To: <179260197668.3127.18219777718091081046@linux.dev>
From: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>
Date: Thu, 22 Oct 2026 23:05:18 +0700
X-Gm-Features: AclHuK-_6y3CZAcHO0wx7PGRH7qXj55F0nJkQUzx_zuArGiTC_UADw4Zf8xvi5o
Message-ID: <CAO26r3QK+Q5=JR5TeMzEX-WiLpgYWd8Zn0O1qx11LxTgN96BPg@mail.gmail.com>
Subject: Re: [RFC PATCH v6 0/4] iio: position: add Rust driver for ams AS5600
To: Igor Korotin <igor.korotin@linux.dev>
Cc: Danilo Krummrich <dakr@kernel.org>, Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lars-Peter Clausen <lars@metafoo.de>, 
	Mark Brown <broonie@kernel.org>, Brandon StJohn <branstj@gmail.com>, linux-iio@vger.kernel.org, 
	linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Oct 2026 at 23:59, Igor Korotin <igor.korotin@linux.dev> wrote:
>
> Hi Muchamad,
>
> Reviewed the lifetime/teardown contracts you asked about. read_raw() has
> a problem: it takes parent: &Device<Bound> and recovers &I2cClient<Bound>
> via TryFrom. That conversion just got removed upstream ("rust: i2c:
> remove TryFrom<&Device> implementation for &I2cClient", use-after-free,
> unrelated thread), so this won't compile anymore. More importantly, Gary
> Guo made the point that needing the conversion at all is the actual
> design issue: a class device shouldn't reach back into a generic parent
> reference during a callback -- whatever bus-specific resource it needs
> should be captured once, at registration time, and handed back via its
> own private data.
>
> Concretely, this means dropping devres and letting Data<'bound> carry a
> borrowed reference directly, which it's designed for
> (Driver::Data<'bound>: Send + 'bound):
>
>   pub struct As5600Priv<'a> {
>       client: &'a I2cClient<Bound>,
>       #[pin]
>       io_lock: Mutex<()>,
>   }
>
>   unsafe impl Send for As5600Priv<'_> {}
>   unsafe impl Sync for As5600Priv<'_> {}
>
>   unsafe impl IioDriver for As5600Priv<'_> {
>       fn read_raw(&self, _chan: *const iio_chan_spec, info: IioChanInfo)
>           -> Result<IioVal> {
>           let client = self.client;
>           ...
>       }
>   }
>
> In probe(), capture the client once via deref coercion (Core -> Bound)
> and split the driver struct so the registered IIO device carries the
> same 'bound lifetime:
>
>   struct As5600;
>
>   struct As5600Data<'bound> {
>       _iio_dev: Device<As5600Priv<'bound>, Registered>,
>   }
>
>   impl Driver for As5600 {
>       type Data<'bound> = As5600Data<'bound>;
>       fn probe<'bound>(dev: &'bound I2cClient<Core<'_>>, ...) -> ... {
>           let client: &'bound I2cClient<Bound> = dev;
>           ...
>       }
>   }
>
> register() then just returns Device<T, Registered> directly instead of
> transferring it to parent devres -- that transfer is what forced T:
> 'static in the first place, which is what made storing the borrowed
> client impossible and pushed you toward TryFrom.
>
> I built this end to end against current rust-next: compiles clean, zero
> warnings, and zero changes to rust/kernel/i2c.rs. Happy to send the full
> diff if it's useful as a starting point for v7.

Hi Igor,

Thanks for working through this and building the changes. I'd be glad
to use your approach for v7, and I'd appreciate seeing the full diff you
offered.

I got the lifetime model wrong in v5 by storing an
`ARef<I2cClient<Bound>>`. I only realized that while fixing the
documentation for v6. In v6 I stopped storing that `ARef`, but ended up
relying on `TryFrom` in `read_raw()` instead.

Storing the client reference in the IIO private data rather than converting
the parent back in `read_raw()` makes sense. I'll check the lifetime and
teardown details as I prepare v7, and I'll acknowledge your contribution.

Thanks again,
Coirul


> Cheers
> Igor
