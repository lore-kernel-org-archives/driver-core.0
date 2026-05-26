Received: from mail-106113.protonmail.ch (mail-106113.protonmail.ch [79.135.106.113])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10AA2DEA7B
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 18:46:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.113
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779821168; cv=none; b=HJ3mTWYn+fDOAHcPNiJD+k7Ij/4vgM/G60reVwlmftezMEfuiWHa2NeNIdMLHP7bZRxlEh83BWIB29udhcbi4Eye3Z1fCm/btpdIWRkRnQyMCfk33OeMXUNhM+k9bBRTIBmkCWsk0cv+7LIBhe2SyAt180PV/aIw+/tb5lZ+T+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779821168; c=relaxed/simple;
	bh=CRTTGcu7wb5jhV3h0s6trLVPvCHZPIi9okcf4vc0FPM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Ia3WEE2cN9vKO1jTWRbSuu3pDFMZIjfbc/qlrsR/Y1S3sRbDfosYCarar9U8yOVNvB3xhjPAKbomsm1TJePgC8PUwgbmvgFw0zU/q75LSnH63AkK2BydfH/KUARVzG89BW1LUQoqYUjO31LXiRA0dWqs+Zdaa3bgM3rMkMgYiCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev; spf=pass smtp.mailfrom=onurozkan.dev; dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b=TT4W3Cvo; arc=none smtp.client-ip=79.135.106.113
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=onurozkan.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=onurozkan.dev header.i=@onurozkan.dev header.b="TT4W3Cvo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=onurozkan.dev;
	s=protonmail; t=1779821157; x=1780080357;
	bh=9xq5fmXg8mztA7s2NHsqINpX/vRAi77nvoyoZMU6q3c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:From:To:
	 Cc:Date:Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=TT4W3CvoDxFP1qoXSevuIdLoOrbx1mxlZg2PAPwW803O65szL9eabvORUUhRuStrQ
	 eeYNtw9agBSgAjbnUjkJS2gPEt3nyKTT0WUx0EUnXPMzTgCnRDYaWZ859iov3kGiDG
	 /L8lVNS/JO1GWtedK6KwhkJUSJc9Lwpaq2aIXhnK8V4We8LggM5ZA7GQkbYKyymHic
	 fynZiD+WFEW/JbEdpw+t1iVQiXdCFn8G9WN9a93xBXU/QekAAtJ6LkNu9jiuwAxmeT
	 czpTBz+H+Ssd274rSV9nRSjnzZ6IooZW267hYx51lYhUFLCCOy5l13lsfhmja8RkLd
	 C5OJz3JiOEENA==
X-Pm-Submission-Id: 4gQ1sr1VQYz2SccQ
From: =?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
To: Tamir Duberstein <tamird@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Subject: Re: [PATCH 1/2] rust: device: remove unused ref-to-ref transmute
Date: Tue, 26 May 2026 21:45:48 +0300
Message-ID: <20260526184550.4326-1-work@onurozkan.dev>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260526-trasnmute_ptr_to_ptr-v1-1-d89bc1dda3b5@kernel.org>
References: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org> <20260526-trasnmute_ptr_to_ptr-v1-1-d89bc1dda3b5@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 10:39:31 -0400=0D
Tamir Duberstein <tamird@kernel.org> wrote:=0D
=0D
> The Ok return value of `read_array_from_fwnode_property` requires a=0D
> reference-to-reference transmute to construct but is never read, thus=0D
> remove it.=0D
> =0D
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>=0D
> ---=0D
>  rust/kernel/device/property.rs | 42 +++++++++++++++++-------------------=
------=0D
>  1 file changed, 17 insertions(+), 25 deletions(-)=0D
> =0D
> diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property=
.rs=0D
> index 5aead835fbbc..87be2784f7a7 100644=0D
> --- a/rust/kernel/device/property.rs=0D
> +++ b/rust/kernel/device/property.rs=0D
> @@ -136,18 +136,15 @@ pub fn property_read_array_vec<'fwnode, 'name, T: P=
ropertyInt>(=0D
>          let mut val: KVec<T> =3D KVec::with_capacity(len, GFP_KERNEL)?;=
=0D
>  =0D
>          let res =3D T::read_array_from_fwnode_property(self, name, val.s=
pare_capacity_mut());=0D
> -        let res =3D match res {=0D
> -            Ok(_) =3D> {=0D
> -                // SAFETY:=0D
> -                // - `len` is equal to `val.capacity - val.len`, because=
=0D
> -                //   `val.capacity` is `len` and `val.len` is zero.=0D
> -                // - All elements within the interval [`0`, `len`) were =
initialized=0D
> -                //   by `read_array_from_fwnode_property`.=0D
> -                unsafe { val.inc_len(len) }=0D
> -                Ok(val)=0D
> -            }=0D
> -            Err(e) =3D> Err(e),=0D
> -        };=0D
> +        let res =3D res.map(|()| {=0D
> +            // SAFETY:=0D
> +            // - `len` is equal to `val.capacity - val.len`, because=0D
> +            //   `val.capacity` is `len` and `val.len` is zero.=0D
> +            // - All elements within the interval [`0`, `len`) were init=
ialized=0D
> +            //   by `read_array_from_fwnode_property`.=0D
> +            unsafe { val.inc_len(len) }=0D
> +            val=0D
> +        });=0D
>          Ok(PropertyGuard {=0D
>              inner: res,=0D
>              fwnode: self,=0D
> @@ -474,12 +471,12 @@ fn read_from_fwnode_property(fwnode: &FwNode, name:=
 &CStr) -> Result<Self> {=0D
>  /// It must be public, because it appears in the signatures of other pub=
lic=0D
>  /// functions, but its methods shouldn't be used outside the kernel crat=
e.=0D
>  pub trait PropertyInt: Copy + Sealed {=0D
> -    /// Reads a property array.=0D
> -    fn read_array_from_fwnode_property<'a>(=0D
> +    /// Reads a property array into `out`.=0D
> +    fn read_array_from_fwnode_property(=0D
>          fwnode: &FwNode,=0D
>          name: &CStr,=0D
> -        out: &'a mut [MaybeUninit<Self>],=0D
> -    ) -> Result<&'a mut [Self]>;=0D
> +        out: &mut [MaybeUninit<Self>],=0D
> +    ) -> Result;=0D
>  =0D
>      /// Reads the length of a property array.=0D
>      fn read_array_len_from_fwnode_property(fwnode: &FwNode, name: &CStr)=
 -> Result<usize>;=0D
> @@ -495,11 +492,11 @@ impl Sealed for $int {}=0D
>          impl<const N: usize> Sealed for [$int; N] {}=0D
>  =0D
>          impl PropertyInt for $int {=0D
> -            fn read_array_from_fwnode_property<'a>(=0D
> +            fn read_array_from_fwnode_property(=0D
>                  fwnode: &FwNode,=0D
>                  name: &CStr,=0D
> -                out: &'a mut [MaybeUninit<Self>],=0D
> -            ) -> Result<&'a mut [Self]> {=0D
> +                out: &mut [MaybeUninit<Self>],=0D
> +            ) -> Result {=0D
>                  // SAFETY:=0D
>                  // - `fwnode`, `name` and `out` are all valid by their t=
ype=0D
>                  //   invariants.=0D
> @@ -515,12 +512,7 @@ fn read_array_from_fwnode_property<'a>(=0D
>                          out.len(),=0D
>                      )=0D
>                  };=0D
> -                to_result(ret)?;=0D
> -                // SAFETY: Transmuting from `&'a mut [MaybeUninit<Self>]=
` to=0D
> -                // `&'a mut [Self]` is sound, because the previous call =
to a=0D
> -                // `fwnode_property_read_*_array` function (which didn't=
 fail)=0D
> -                // fully initialized the slice.=0D
> -                Ok(unsafe { core::mem::transmute::<&mut [MaybeUninit<Sel=
f>], &mut [Self]>(out) })=0D
> +                to_result(ret)=0D
>              }=0D
>  =0D
>              fn read_array_len_from_fwnode_property(fwnode: &FwNode, name=
: &CStr) -> Result<usize> {=0D
> =0D
> -- =0D
> 2.54.0=0D
> =0D
=0D
Reviewed-by: Onur =C3=96zkan <work@onurozkan.dev>=0D
