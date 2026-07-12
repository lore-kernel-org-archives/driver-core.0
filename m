Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9F172BD11;
	Sun, 12 Jul 2026 00:16:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783815364; cv=none; b=WUPEu4hKVEi+d/fA6todbCnSDddAC1hyzgXx8iA1NMIQkQSQsionAG+T0KlQK6fo77x8N2NdYOHdpQhk23zyGC8RU685w+m0eF72wHjCL2DmsQZ9YUuTDOyIPVG1VBmRm+1aRw1g3x2FNq0/QcglqFa+u6Nit3AIddgiUuktyXU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783815364; c=relaxed/simple;
	bh=4D9G4qWM7xRObbCV2lxt95hsS3c2PMkz33THpj/AqrI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=SpMK6AHtNx6IB6VOzxAY36mEBbdAzYzvzFDrNYTm0mHY52QSzGvjHyFBvVGCI9HZt6y2hT8nceeJOdp0Ybi0vyXRKtkhmLfTgStFP+g2V27rS2yjxsLQNz5/cHJR1GlV3hG9npHLVBO0LHdlGOqlOO/51V1DwCTtWf8iEgLhA1c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lJ6ZSGIF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lJ6ZSGIF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 873C71F000E9;
	Sun, 12 Jul 2026 00:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783815362;
	bh=CIyWQwgfJugCd2j+GBzbhoDwGEKsyDpv5pJUnwinIK4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=lJ6ZSGIF9hvdneybtXwlTRWIAigFK3v1zhSnkCoRKf1mo+475CanYNC8eqtAx+fEK
	 6kJ1QUL85SR594afZWu01BsqJAhbPRshklyA+ZTTXPUnBgXDnMj4SPgMfB8SHOXY2Z
	 d56jFn+SIeLOpfGLZY+jXR7eljTeLhmwncWi/Xv5XdQHwJ0XXXUM7+JT+vz+8bPcVw
	 xyBefT+CmUUAJpvz/J3X1wnkd6Ys1nTxLvMF+xmsnTgMWP32vggEXLXUJDy2G0/eif
	 3TxvTLp2r/ZsZf3ngU3yWkWx9NiEeThiii2DjPBn/d5OAcypqXnUEjEpUlb3ZAqlm0
	 0X2gRlTasaOkg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sun, 12 Jul 2026 02:15:58 +0200
Message-Id: <DJW5RQK7LB7S.14DKQQKY9OHR5@kernel.org>
Subject: Re: [PATCH] rust: firmware: avoid UB in example by passing
 parameter
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, <driver-core@lists.linux.dev>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <rust-for-linux@vger.kernel.org>
To: "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260711180231.229525-1-ojeda@kernel.org>
In-Reply-To: <20260711180231.229525-1-ojeda@kernel.org>

On Sat Jul 11, 2026 at 8:02 PM CEST, Miguel Ojeda wrote:
> diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
> index 71168d8004e2..3aa9de3c4a04 100644
> --- a/rust/kernel/firmware.rs
> +++ b/rust/kernel/firmware.rs
> @@ -51,12 +51,9 @@ fn request_nowarn() -> Self {
>  /// # Examples
>  ///
>  /// ```no_run
> -/// # use kernel::{device::Device, firmware::Firmware};
> -///
> -/// # fn no_run() -> Result<(), Error> {
> -/// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device=
>` instance
> -/// # let dev =3D unsafe { Device::get_device(core::ptr::null_mut()) };
> +/// # use kernel::{device::Device, firmware::Firmware, sync::aref::ARef}=
;
>  ///

We could take the chance to also drop this empty line.

> +/// # fn no_run(dev: ARef<Device>) -> Result<(), Error> {
>  /// let fw =3D Firmware::request(c"path/to/firmware.bin", &dev)?;
>  /// let blob =3D fw.data();
>  ///
