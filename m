Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A66EEA8;
	Mon,  3 Aug 2026 22:21:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785795683; cv=none; b=eZR5x7OKLl0QOURqzB4hRSc+nM0DKWEYyMgIOtR5kHNOcnKmoKoAERGcujGcZ7rYYr/lCHXP2pSMHjJ4pNLRBPEdX5meUkuleaPD5gn9MCKprYinnBMCB23lDzg5HQLFFD/lPEwzxAwfnJVbRlxOGKSzGzb0NAxKMfmaPdjb1IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785795683; c=relaxed/simple;
	bh=xuXdgySlvCgHLOdGmGL+MubfZyFQvRssa94WG2HMgWk=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=g1hIOYFYKeOSercxnK+fqfGmUI5JYL/jVB5dDpenLoC52N20mFN35Qq5W8lvquKyWvuEL8s8lvHF7gwrOc4iuSucJnQ0emdujNETMatuglvyy0799IbsAYj2g0xSEOtVIR7QiAJlalMtllVFF33sTfsfiubmqqhFg9XFxF1Stm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FaJ7jRrU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FaJ7jRrU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B9351F000E9;
	Mon,  3 Aug 2026 22:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785795681;
	bh=xuXdgySlvCgHLOdGmGL+MubfZyFQvRssa94WG2HMgWk=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=FaJ7jRrUDw+YHd7ugnUXOXor7JZhM+UUcWKDINySpl5cQx2bO8jMqX/wC397GZSyU
	 zJqsJB5YBrtwPkIKKV41nNw2/NoungOXZyJpw4ixxlBnP1SebwPOh1EOUKDOwiGEe1
	 yOVP6+a2nW9sy3aoMYik+k98YSEVriSQsokd1f1Tv2JSqi8/PizDpIhQyQp49ubaFd
	 aUllZmB0ilb1vPaxfZcSksVN9Q6a7KVZcq3/G3grPHDwwjTJ5GLpj/7YwCuvVuQHDH
	 0GTcUwegITQ1WrlNZPl61fkr94LoxuZzn5RFLRiMAyegun1jncAGK9Byy6aisS+sAv
	 I6VE42CpgeO5g==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 04 Aug 2026 00:21:18 +0200
Message-Id: <DKFNQH0FLP11.1JGXFSKVTOBMF@kernel.org>
To: "Timur Tabi" <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware
 files
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "John Hubbard"
 <jhubbard@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>, "Eliot
 Courtney" <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 "russ.weight@linux.dev" <russ.weight@linux.dev>, "mcgrof@kernel.org"
 <mcgrof@kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "driver-core@lists.linux.dev"
 <driver-core@lists.linux.dev>, "nova-gpu@lists.linux.dev"
 <nova-gpu@lists.linux.dev>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
 <20260731201017.2580713-4-ttabi@nvidia.com>
 <DKFMSHHGF3DE.2SUUP3FB7WXTK@kernel.org>
 <0c53c38adec26bc5df6b4658d3da53075001d93a.camel@nvidia.com>
In-Reply-To: <0c53c38adec26bc5df6b4658d3da53075001d93a.camel@nvidia.com>

On Tue Aug 4, 2026 at 12:05 AM CEST, Timur Tabi wrote:
> On Mon, 2026-08-03 at 23:36 +0200, Danilo Krummrich wrote:
>> @Miguel: One consideration for you below.
>>=20
>> On Fri Jul 31, 2026 at 10:10 PM CEST, Timur Tabi wrote:
>> > +=C2=A0=C2=A0=C2=A0 fn find(&self, tag: &[u8; 4]) -> Result<TlvBlock<'=
a>> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 self.iter().find(|b| b.tag=
 =3D=3D *tag).ok_or(EINVAL)
>> > +=C2=A0=C2=A0=C2=A0 }
>>=20
>> NIT: Do we really know the tag is invalid just because it wasn't found?
>
> Well, maybe this is where we should return ENODATA?

Or maybe just ENOENT.

> I am expecting future Nova code to handle tags that may be legitimately a=
bsent, so maybe having
> it return ENODATA if the tag is missing, and EINVAL in all other situatio=
ns is better.

In this case it makes sense to differenciate; AFAIC this can be a follow-up
patch.

>> > +=C2=A0=C2=A0=C2=A0 /// Return a slice of bytes.=C2=A0 Returns ENODATA=
 if the value is empty.
>> > +=C2=A0=C2=A0=C2=A0 pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> R=
esult<&'a [u8]> {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 let tlv =3D self.find(tag)=
?;
>> > +
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 // Treat empty value as an=
 error, to avoid trying to parse nothing.
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if tlv.value.is_empty() {
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 re=
turn Err(ENODATA);
>> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>=20
>> This one seems resonable; but we don't have the error code in place. The=
 commit
>> message says the series depends on [1], but this likely goes through the=
 Rust
>> tree.
>
> Can't you just pick it up from the Rust tree and put it in drm-rust-next?

This is what I refer to below as "signed tag".

Some background on this: We can't have patches as duplicate commits going t=
o
Linus. So in order for me to pull from the Rust tree, it has to guarantee t=
o not
change its histroy (which it does not). Besides that, we don't want all the
commits from another tree, but just a specific one. The normal process for =
this
is to put the commit on a separate branch based on a commit base, e.g. some=
 -rc,
typically -rc1. Then we can create a signed tag from this that can be merge=
d
into both (or multiple) trees, so the commit only exists exactly once.

However, this kind of logistics typically only makes sense for features, et=
c. In
order to avoid a trivial conflict, it is usually overkill. Which is also wh=
y I
said I'd go for the former.

>> Either we just add this single error code in a separate patch or Miguel =
provides
>> a signed tag for [1].
>>=20
>> Since this is a perfectly trivial conflict, I'd go for the former.
>
> The latter seems simpler to me, and would avoid an annoying merge conflic=
t.
