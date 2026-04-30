Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E2828150F;
	Thu, 30 Apr 2026 14:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777558756; cv=none; b=JTJEHGpp18nj0xEqv120qtvyNxTlPGtoUCFgiCRAE1wTUvvOnmhrBv1R7KmyYT8KqcdZQm2E68Coy8ogF3hGi6aE3hBLyH0Q/sjEEhaqsjHyMqWU5WbJ0YzteRJ2nhX4Q/l7UhqNjnZICV4PYnkOXOhkjtRjQSXj3p2NYlp+Qy0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777558756; c=relaxed/simple;
	bh=5o4/RYDMXlLNCBj69ZCaFVM5lxPQdfnoE8Au8ur3foQ=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=i5E6Jx5ZzIZHvWpeRKjemHYS5ODh2oY1/1skMtb8ycMfO0ca0TWD8zQfokcl3dewz6cq25yAUNKa5XnBaAJyq4Us7twxAR5FXg8Y6exa8hI9Sqx4MokouQmTVZvw1eQHMH+2BW72IKkVou5t8Q5BrIDsxyPFvKWr3c0cQ+1hc6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gYi//yM3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gYi//yM3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BBF8C2BCB3;
	Thu, 30 Apr 2026 14:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777558756;
	bh=5o4/RYDMXlLNCBj69ZCaFVM5lxPQdfnoE8Au8ur3foQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=gYi//yM3z82fLfcFpV/AAM2QKPEZy1kWDD6e2P1LTjCm5H3PsPyUKmMnRm1UIoJqE
	 l2zPZjA9l3eHf3mHkObl3xldS3uvki2tQ30NDiSPGYYaVz/t66Gzm5Sh+Q/AryuNpJ
	 A6CM/DdmTsOW2Em3/roqEXg6irns8GcBlVZSpJdywfnSF0MbJ1bSwe5D6eXX+k9OUj
	 ewYbiz9F9V/a5I91i/M+ZteVBNfPMxHQQ8mFc1+Cnwsn4/DlVnlEVoFgPvPMVckjsV
	 WAbsia1Pt/6A+so7A8kAqKYtXdxV6r/uNK9RzoMLKAD/gGmPkSnVrpjrWPcszuADfV
	 t+9LxFpNbJHmw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 30 Apr 2026 16:19:10 +0200
Message-Id: <DI6JZKW4N7VD.3B3233F8PNOMU@kernel.org>
Subject: Re: [PATCH 1/2] rust: auxiliary: add registration data to auxiliary
 devices
Cc: <gregkh@linuxfoundation.org>, <rafael@kernel.org>,
 <acourbot@nvidia.com>, <david.m.ertman@intel.com>, <ira.weiny@intel.com>,
 <leon@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <a.hindborg@kernel.org>, <tmgross@umich.edu>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260427221002.2143861-1-dakr@kernel.org>
 <20260427221002.2143861-2-dakr@kernel.org> <afMaAfcxpDR3xIE1@google.com>
In-Reply-To: <afMaAfcxpDR3xIE1@google.com>

On Thu Apr 30, 2026 at 10:59 AM CEST, Alice Ryhl wrote:
> Is this really Rust-specific? Would you not want C drivers with the same
> pattern to do the same thing?

Unlike in C, it has the effect that it allows us to let the compiler ensure=
 that
the initilization order in probe() is correct.

The only advantage I see in C is that it provides a dedicated place for dri=
vers
to differentiate specific private data for when a driver registers multiple
auxiliary devices per instance.

>> +        // SAFETY: `ptr` is non-null and was set via `into_foreign()` i=
n `Registration::new()`;
>> +        // `RegistrationData` is `#[repr(C)]` with `type_id` at offset =
0, so reading a `TypeId`
>> +        // at the start of the allocation is valid regardless of `T`.
>> +        let type_id =3D unsafe { ptr.cast::<TypeId>().read() };
>> +        if type_id !=3D TypeId::of::<T>() {
>> +            return Err(EINVAL);
>> +        }
>
> Right, okay, so if you put C stuff there, we need the layout to be
> compatible with Rust type ids.

Correct.

> Still, we could have Rust expose a couple methods to allow C code to use
> the same field with a null type id.

I think there are multiple options, e.g. two registration data pointers, on=
e
common pointer and a boolean, one common pointer, plus a type id pointer, e=
tc.

> But I guess this is all future work.

Yes, I rather do that once we actually need it.

>> +        let data =3D KBox::pin_init::<Error>(
>> +            try_pin_init!(RegistrationData {
>> +                type_id: TypeId::of::<T>(),
>> +                data <- data,
>> +            }),
>> +            GFP_KERNEL,
>> +        )?;
>> +
>> +        let boxed =3D KBox::new(Opaque::<bindings::auxiliary_device>::z=
eroed(), GFP_KERNEL)?;
>
> Use __GFP_ZERO here instead?

This is just moving existing code, but I guess we could add something like:

	pub fn zeroed(flags: Flags) -> Result<Self, AllocError>
	where
	    T: Zeroable,
	{
	    // SAFETY: `__GFP_ZERO` guarantees the memory is zeroed, and `T: Zeroa=
ble` guarantees
	    // that all-zeroes is a valid bit pattern for `T`.
	    Ok(unsafe { Self::new_uninit(flags | __GFP_ZERO)?.assume_init() })
	}

>> +        // SAFETY:
>> +        // - `adev` is guaranteed to be a valid pointer to a `struct au=
xiliary_device`, which
>> +        //   has been initialized,
>> +        // - `modname.as_char_ptr()` is a NULL terminated string.
>> +        let ret =3D unsafe { bindings::__auxiliary_device_add(adev, mod=
name.as_char_ptr()) };
>> +        if ret !=3D 0 {
>> +            // SAFETY: `registration_data` was set above via `into_fore=
ign()`.
>> +            let _ =3D unsafe {
>> +                Pin::<KBox<RegistrationData<T>>>::from_foreign((*adev).=
registration_data_rust)
>> +            };
>
> Nit: Please use `drop(unsafe { ... })` to explicitly drop.

Same here, just moving existing code, but I think it's fine to change while=
 at
it.
