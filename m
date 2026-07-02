Received: from out-180.mta0.migadu.com (out-180.mta0.migadu.com [91.218.175.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 648817260F
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 01:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782955105; cv=none; b=elQgF0wL2esIcck+nk1/XhcbXQaCJC+XBgkjYPMkz+0APz2er5RWJe539w0oPFM/qVm5N6zbrwu2FPMHgzthRIcGODaiJcmbbAUxLN0bNGMPwV6UlcPHj/jH7qVdWN6SZAW9S2oXvU5xbYtFJEZAdfT9qoXNCW6tTAlcaztzCVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782955105; c=relaxed/simple;
	bh=krBtYq4sF++LKUazcnPP7HUYInxFSBi0y04BiJIwrNc=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=MjQmOoIYYF1q9Jf6tEZxyq0KvNAwHlLDT68gDiEgYZTXBSXJtkO7yvfzIxi2pAffyCYymlVLj+hXbdWuMALGttO/FSLYKPVzVMLzBb9PyG2Jc5iKF62Gh89E09m3p2eMJ6UAHW0P0bVTGmh7TrGINX2ZiMjfS9+MXxZN7vouPBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=OExTzm9W; arc=none smtp.client-ip=91.218.175.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="OExTzm9W"
Message-ID: <40998dfe-1f0d-42a4-a974-2f59bdbd00d4@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1782955092;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aE/uPNiRfrzMVB4ucs55buovN9ayC9dNOCrKcDVqti8=;
	b=OExTzm9W4j2ce5w80nAtQp6w6Zd8YP1V0oT/OT9/BAkKnZRM4CqoRWkgsZNYD7sHBPWY4p
	YH26ZpNxZ42rtLrE7FYAaHfLE714c+KLj3aZ7ypAGDGo/yN+RIFSpEonH7UdW0LHH3LP7I
	C6GpGlpiFLUC5a8mV5thi9wgHxE3PCk=
Date: Thu, 2 Jul 2026 09:18:00 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Subject: Re: [PATCH v2 1/7] rust: firmware: add request_into_buf()
To: Timur Tabi <ttabi@nvidia.com>, driver-core@lists.linux.dev,
 nova-gpu@lists.linux.dev, rust-for-linux@vger.kernel.org,
 Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>,
 Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
 John Hubbard <jhubbard@nvidia.com>, Luis Chamberlain <mcgrof@kernel.org>,
 Russ Weight <russ.weight@linux.dev>, Miguel Ojeda <ojeda@kernel.org>,
 Gary Guo <gary@garyguo.net>
References: <20260630194749.1209490-1-ttabi@nvidia.com>
 <20260630194749.1209490-2-ttabi@nvidia.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alvin Sun <alvin.sun@linux.dev>
In-Reply-To: <20260630194749.1209490-2-ttabi@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT


On 7/1/26 03:47, Timur Tabi wrote:
> Add request_into_buf(), a Rust wrapper around the
> request_firmware_into_buf() function. This variant loads the firmware
> image directly into a caller-provided buffer rather than a
> kernel-allocated one.
>
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>   rust/kernel/firmware.rs | 39 +++++++++++++++++++++++++++++++++++++++
>   1 file changed, 39 insertions(+)
>
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..14934605ad98 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -120,6 +120,45 @@ fn drop(&mut self) {
>       }
>   }
>   
> +/// Load firmware directly into the caller-provided `buf`.
> +///
> +/// On success the firmware image has been copied into `buf`; the caller accesses the data
> +/// through `buf` itself.
> +/// See also `bindings::request_firmware_into_buf`.
> +///
> +/// This is intentionally a stand-alone function rather than a `Firmware` constructor. For
> +/// the `into_buf` path, the firmware data lives in the caller's `buf`, not in a
> +/// kernel-owned buffer, so returning a `Firmware` would expose `Firmware::data()` as a
> +/// second handle aliasing `buf` (and `release_firmware()` does not free `buf` anyway).
> +pub fn request_into_buf(name: &CStr, dev: &Device, buf: &mut [u8]) -> Result {
> +    let mut fw: *mut bindings::firmware = core::ptr::null_mut();
> +    let pfw: *mut *mut bindings::firmware = &mut fw;
> +    let pfw: *mut *const bindings::firmware = pfw.cast();
> +
> +    // SAFETY: `pfw` is a valid pointer to a NULL initialized `bindings::firmware` pointer.
> +    // `name` and `dev` are valid as by their type invariants. `buf` is a valid writable
> +    // buffer of `buf.len()` bytes.
> +    let ret = unsafe {
> +        bindings::request_firmware_into_buf(
> +            pfw,
> +            name.as_char_ptr(),
> +            dev.as_raw(),
> +            buf.as_mut_ptr().cast(),
> +            buf.len(),
> +        )
> +    };
> +    if ret != 0 {
> +        return Err(Error::from_errno(ret));
> +    }

You can simplify the code using `to_result`:

to_result(unsafe {
     bindings::request_firmware_into_buf(
         pfw,
         name.as_char_ptr(),
         dev.as_raw(),
         buf.as_mut_ptr().cast(),
         buf.len(),
     )
})?;

Best regards,
Alvin

> +
> +    // The firmware bytes are now in `buf`, which the caller owns, so we don't need
> +    // the kernel to hang on to it any more.
> +    // SAFETY: `fw` is a valid pointer returned by `request_firmware_into_buf`.
> +    unsafe { bindings::release_firmware(fw) };
> +
> +    Ok(())
> +}
> +
>   // SAFETY: `Firmware` only holds a pointer to a C `struct firmware`, which is safe to be used from
>   // any thread.
>   unsafe impl Send for Firmware {}
