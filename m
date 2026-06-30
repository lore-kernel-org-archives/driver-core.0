Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2D0B21D3F5;
	Tue, 30 Jun 2026 21:09:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782853769; cv=none; b=dgp6p1s4pl0G2nYL1R5zLOabqMotfloZHveEB3eLM1gG9TBVA/IFnf3QBscgagKHq6/3j/CucUanks/p0xlotSEB/hpva011J7msxqSw+r7DVygcKYYdDnmFeYBJt01nwtnjBCL5ilsXjbvu4Sjtf4FmaXq4M+2Zmewua+hELwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782853769; c=relaxed/simple;
	bh=Z8xN0Pgyzzrcaag0U4yXM2m9m+Vq39HOp9COonaGTUA=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ri1uXLc7lqyCcpAJbrnedW1eXOm9uuMfnKwkwso2VBmhtl5kPwa+wFf7ADy852M85/l+7KjnGUC8KqBh6NDyccOGbYzYwBmOzF9lpvWLvgJpFFxhhV/rFhnb9wecmi04STh5UrTz8yLL2bsZGhpF7hnljl4XespXSRsYBCwPSo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=az4n/La1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="az4n/La1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 13DF91F000E9;
	Tue, 30 Jun 2026 21:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782853768;
	bh=fdPR9l+Tg1O9caxvFEzXmCFAAok284e1i6Pl08baN0c=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=az4n/La1sS17TmTqXgO3EJRHTutMitAeADN+RjneX2y13sudprQkx0cV6aZkNLWEx
	 15rXWMRyaDSf5UuCXNrdUfSeWBA91WF3l7P0sYJyEXUTKo4Nd21rGs8H215UuYuEw7
	 Lg8HsDv10Mz5nJ3JSPR/8W+3LvgevjMhVOGQ5ZGcLVueqJXogCCbwrLxUtW6mFTwY0
	 E5iFtaRVmJNPNUBL87PTDYt9Vgzc6qQu44hcto8RywK70UO/qUOizQDCHc3r7WfkIo
	 SnVK+R2ojJX3ovBX8lKLptKEAb70Xj3evZTO6gcACEmbrzvlC7hDahvNYeBMuyEprI
	 EFgGZZZR87E1Q==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 23:09:24 +0200
Message-Id: <DJMOWWJLKVZU.1N9RUO41QFAE@kernel.org>
Subject: Re: [PATCH v2 1/7] rust: firmware: add request_into_buf()
Cc: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260630194749.1209490-1-ttabi@nvidia.com>
 <20260630194749.1209490-2-ttabi@nvidia.com>
In-Reply-To: <20260630194749.1209490-2-ttabi@nvidia.com>

On Tue Jun 30, 2026 at 9:47 PM CEST, Timur Tabi wrote:
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the caller=
 accesses the data
> +/// through `buf` itself.
> +/// See also `bindings::request_firmware_into_buf`.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware=
` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, =
not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmwar=
e::data()` as a
> +/// second handle aliasing `buf` (and `release_firmware()` does not free=
 `buf` anyway).
> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Re=
sult {
> +    let mut fw: *mut bindings::firmware =3D core::ptr::null_mut();
> +    let pfw: *mut *mut bindings::firmware =3D &mut fw;
> +    let pfw: *mut *const bindings::firmware =3D pfw.cast();
> +
> +    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings:=
:firmware` pointer.
> +    // `name` and `dev` are valid as by their type invariants. `buf` is =
a valid writable
> +    // buffer of `buf.len()` bytes.
> +    let ret =3D unsafe {
> +        bindings::request_firmware_into_buf(
> +            pfw,
> +            name.as_char_ptr(),
> +            dev.as_raw(),
> +            buf.as_mut_ptr().cast(),

Sashiko's concern about buf being an empty slice, despite being nonsensical=
,
seems valid. The allocated_size field in struct fw_priv, if set to zero, is
interpreted as "the driver did not provide a buffer" and hence the firmware
loader assumes that it has to treat the data pointer as a self-allocated bu=
ffer.
In the case of passing an empty slice, this would be a dangling pointer.

> +            buf.len(),
> +        )
> +    };
> +    if ret !=3D 0 {
> +        return Err(Error::from_errno(ret));
> +    }
> +
> +    // The firmware bytes are now in `buf`, which the caller owns, so we=
 don't need
> +    // the kernel to hang on to it any more.
> +    // SAFETY: `fw` is a valid pointer returned by `request_firmware_int=
o_buf`.
> +    unsafe { bindings::release_firmware(fw) };
> +
> +    Ok(())
> +}
> +
>  // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, whi=
ch is safe to be used from
>  // any thread.
>  unsafe impl Send for Firmware {}
> --=20
> 2.54.0

