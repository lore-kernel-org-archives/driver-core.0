Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E6C2D5C7A;
	Tue, 30 Jun 2026 21:27:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782854829; cv=none; b=SVB1qrQ87CZ9XwbxSnndZnCQYctQ13PuegxEmeysCkRzAXbeE5XEIivDGzNQuXKD4DaMJ/0hnXk00WS3BJskuPUFi7noWFdjAfbIcHAB3AphJ4Gf4m2OksxqP6o34Qzkk/rkL7lPwspoVP1ZlIFPbJN5VLDjBSE+sMVh/vPfHt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782854829; c=relaxed/simple;
	bh=/InUm6RHkv772UffL3kodbWj9NWhKSLf/9Owm0zEcnE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=CcZMvq7C9j2M+lYol3hdScPcAIg3kNjjCk8futfuJWdoQvHqFd8I+4Gm2o/5E+9ekHJHKv37cFvzc8UcL61NcxJD3xB7j+ksBuw1kwIF+uaOO1NgFM/k6+9zT/FNiWkn7xvf/XoYapjqYYg+6FOOuKMDKoaaWHjoqrgBj9R+pLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YmhlD5yf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YmhlD5yf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 011441F000E9;
	Tue, 30 Jun 2026 21:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782854828;
	bh=QwXyVJSl4nmAXDcVsI6fa2y+BOMVig082sl359P4SMQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=YmhlD5yf+yWapR3J0b5UOTjTyCpMdp0QRE1x5jTMimJmUZTAk3zUTcm5TTT61mOlI
	 zmIhPkk7DpmJdiOJ4ymb/S+lEW3AbRaQ1DE+8GO+cQ17xeqlMySE8k+6SNrTeyiuIN
	 p9LF9AnEEll18qaPK42xYF8lkCEuf2wKmW0iFYhUSBEHyYTt+tH4miGsXWt4Fbtonc
	 w0sdiRij+lXjh/LgSsx7D3/vwxsfBYQY6UPUWdhdzJG+qZOICqgs/xG4Ysc6IkdEbg
	 xKBp+l32uv0Yz7tND+wbdApALP6MZZsetb8pTqHIb3GbLEsrOy3rcABtBkPoTdXIjQ
	 9BjdIL+/n2ZGw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Jun 2026 23:27:04 +0200
Message-Id: <DJMPAFJHWAMI.1SAJ3TCR5SYCI@kernel.org>
Subject: Re: [PATCH v2 2/7] gpu: nova-core: add TLV parser for firmware
 files
Cc: <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "John Hubbard" <jhubbard@nvidia.com>, "Luis Chamberlain"
 <mcgrof@kernel.org>, "Russ Weight" <russ.weight@linux.dev>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Gary Guo" <gary@garyguo.net>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260630194749.1209490-1-ttabi@nvidia.com>
 <20260630194749.1209490-3-ttabi@nvidia.com>
In-Reply-To: <20260630194749.1209490-3-ttabi@nvidia.com>

On Tue Jun 30, 2026 at 9:47 PM CEST, Timur Tabi wrote:
> +Tags and Length
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +TLV tags are always four-character words, with all letters being upper c=
ase.
> +Duplicate tags are not allowed.

Technically this isn't enforced by the constructor.

Maybe a good reason to implement a HashMap? :) Just kidding, I think it sho=
uld
be good enough to document for the constructor that it doesn't check for
duplicates and that if duplicate tags are present, the first occurrence is =
used.

> +/// /// Iterator over the [`TlvBlock`]s of a [`Tlv`].

Stray '///'.

> +///
> +/// # Invariants
> +///
> +/// `pos` is a byte offset into `tlv.data` that always lies on a block b=
oundary (in the sense
> +/// of the [`Tlv`] invariant): it is either the start of a well-formed b=
lock, or equal to
> +/// `tlv.data.len()` (end of iteration).
> +struct TlvIter<'tlv, 'a> {
> +    tlv: &'tlv Tlv<'a>,
> +    pos: usize,
> +}

[...]

> +#[allow(dead_code)]
> +pub(crate) struct Tlv<'a> {
> +    data: &'a [u8],
> +}
> +
> +#[allow(dead_code)]

Please use expect.

> +impl<'a> Tlv<'a> {

[...]

> +    pub(crate) fn get_string(&self, tag: &[u8; 4]) -> Result<&'a str> {
> +        let tlv =3D self.find(tag)?;
> +
> +        let bytes =3D tlv.value;
> +
> +        // To make sure the value actually is a string, make sure it's a=
ll ASCII.
> +        if !bytes.is_ascii() {
> +            return Err(EINVAL);
> +        }
> +
> +        core::str::from_utf8(bytes).map_err(|_| EINVAL)

Technically, the error path is unreachable after the is_ascii() check, but =
I'd
keep it as is anyway.
