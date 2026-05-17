Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FD55F9C0;
	Sun, 17 May 2026 00:08:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778976492; cv=none; b=dS7GKU/atqz08c/DHq5fTgJtZAeeFtxbf5W0UjEoxTgP/kkGqExY1i8VrJgLsy3OLPKsIVYCMJWL62OSK5gWJTOGHG829nraoqin6VxdxrwmV1EcYyy9kZIlanCQ1/+xqD/crM+c19NYbEo2vXOBMF2YCMcaTiFzLUJBuaAkw7k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778976492; c=relaxed/simple;
	bh=e1rtlXG9/rr0XldsqlEka1j0pERpw4TPK30NLu94J48=;
	h=Content-Type:Date:Message-Id:To:From:Subject:Cc:Mime-Version:
	 References:In-Reply-To; b=e/ftTI0Np7C5rFqpTjTlW5dzGqOOgIf1NHKtlBJAl3LtTJCj3Vc2tNFKb4OiPP72E+bF9K6NAEA9StQN9hibguQp6bcwunHwxfwnnzNdeoaw7peLx2Pw3oNGcjBcxv3BtDxEEkuOJ8vK2dTVtuBDRppfoDDFlx62ds2lcpYWQhg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o+zZhrdg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o+zZhrdg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2C59C19425;
	Sun, 17 May 2026 00:08:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778976491;
	bh=e1rtlXG9/rr0XldsqlEka1j0pERpw4TPK30NLu94J48=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=o+zZhrdgGHzWyYdTntBIj6Gx/xY8e9jy+ePDtS0QZU4+kpOY2TYfbfdGv3BYfashR
	 9Pi57aa6/U5lJah+PnwMRWRapmeMJTMXIPHKS3DCs3BrhV8sOG0UIFwfqyZSqFEb4Q
	 U4+kAKycJUF7DO1OARhQq4emTDzF3c592/7fMeadU8RD8P4avi1fyv69eTIP0sbz3L
	 dkI7LpfgKc8bUM7fWNvLn5onuG1IbPvv/X1oimsuyfrGo4Usw8m6hNL7mp/4Oxt33T
	 GFyz2x25uaa8im7z/HarbHSkR4FnobbPbiHtN40Q0T3QCGdLaewFXAS7wydeDq1ALY
	 qxpx8/YM5YxsA==
Content-Type: text/plain; charset=UTF-8
Date: Sun, 17 May 2026 02:08:07 +0200
Message-Id: <DIKIJ81CV55B.3TA7PV8N4BN0E@kernel.org>
To: "Beata Michalska" <beata.michalska@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [RFC PATCH 1/3] rust: Add runtime PM support
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>, "Bjorn Roy
 Baron" <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl"
 <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Boris Brezillon"
 <boris.brezillon@collabora.com>, <rust-for-linux@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
References: <20260514150957.3501924-1-beata.michalska@arm.com>
 <20260514150957.3501924-2-beata.michalska@arm.com>
In-Reply-To: <20260514150957.3501924-2-beata.michalska@arm.com>

(By far not a full review; but please find a few comments below.)

On Thu May 14, 2026 at 5:09 PM CEST, Beata Michalska wrote:
> +#[cfg(CONFIG_PM)]
> +impl Request {
> +    #[inline(always)]
> +    fn resume(dev: &ARef<device::Device>, mode: Mode) -> Result {

Those functions all require a bound device, so this has to be &Device<Bound=
>.

Also, there is usually no advantage to write &ARef<T> instead of &T.

> +macro_rules! define_pm_callback {
> +    // Bare callback with no associate transition nor fallible descripto=
r
> +    (@parse_desc $name:ident) =3D> { define_pm_callback!(@default $name)=
; };
> +    // Callback with associated state transition
> +    (@parse_desc $name:ident ($from:ident, $pre:ident, $post:ident)) =3D=
> {
> +        define_pm_callback!(@default $name, $from, $pre, $post);
> +    };
> +
> +    (@default $name:ident $(, $from:ident, $pre:ident, $post:ident)? ) =
=3D> {
> +        paste!(
> +            /// # Safety
> +            ///
> +            /// `dev` must be a valid `struct device *` provided by the =
PM core.
> +            unsafe extern "C" fn [<$name _callback>]<T:PMOps>(
> +                dev: *mut bindings::device
> +            ) -> core::ffi::c_int {
> +
> +                let dev: &device::Device<device::CoreInternal> =3D
> +                     // SAFETY: `dev` is provided by the PM core to a ru=
ntime PM callback and
> +                     // is valid for the duration of the callback.

This doesn't justify the CoreInternal type state; in fact, we can't justify=
 it
here as those callbacks are not called with the device lock held.

It is guaranteed that the device remains bound during the callbacks though,=
 so
the Bound type state is valid.

> +                    unsafe { device::Device::from_raw(dev) };
> +
> +                // SAFETY: PM callbacks are only invoked while the devic=
e is bound
> +                // See [`pm_runtime_remove`](srctree/drivers/base/power/=
runtime.c)
> +                let bound_dev =3D unsafe { dev.as_bound() };
> +
> +                bound_dev.drvdata::<T::DriverDataType>()

This function does not exist anymore, please use drvdata_borrow() instead. =
I
understand you want the type check this accessor does for you, but it shoul=
dn't
be necessary. It should be possible to design the trait in a way that the t=
ype
system ensures that a driver cannot pass in the wrong type at compile time.

In order to call drvdata_borrow() we currently need the CoreInternal type s=
tate
(which we can't justify).

To support this, we should add a BoundInternal type state, make CoreInterna=
l
deref to BoundInternal and implement drvdata_borrow() for BoundInternal.

> +                    .and_then(|data| {
> +                        let pm_ctx =3D T::get_pmcontext(data.get_ref())?=
;
> +                        let pm_dev =3D match <T as PMOps>::DeviceType::t=
ry_from(dev) {

Please don't use a fallible conversion here, take advantage of the type sys=
tem
instead, e.g. with the AsBusDevice trait, see [1] for reference.

However, as mentioned above, I think it should be possible to tie bus speci=
fic
driver traits and this together so we can check types at compile time. So, =
maybe
AsBusDevice isn't even necessary.

[1] https://lore.kernel.org/driver-core/20260506221027.858481-2-dakr@kernel=
.org/
