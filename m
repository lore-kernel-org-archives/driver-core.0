Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACBB3423EAD;
	Mon,  3 Aug 2026 21:36:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785793019; cv=none; b=BBa7De3DResBfRPLchpqM1L3Isrumn1Fe4CRn1abgoTb7wYE5Y+aQihtw0opmUL7W1rP6wLVKruX1nDwqNPIL634oG+LP20JWSmW60HhSQuo+w2rL+QjPv8WV9RbVwWKRnCptuxtLr4uXSNPrZyLyloBXOC0nDr2598F+BQe+qQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785793019; c=relaxed/simple;
	bh=YIyHV+I7qHjL2KGWvTOThmz06ayPhb4j6bMCnXsjwis=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=b1hF5W4g8s7zqH/+rz3uE4IrwfuVQDV+v4wXfQVsjTxB8hJrgfxmtIUYbII25xP5u3MxpcW7dCeW4PigPwJdusi8el8wLTcoiB+5xieGvBLXSoEI5bE7dNT4MV1Y0+E38AFAEGuRl8YPZClF8Wma2a2gamiv/FtZ7lme6y08n4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oUQRdD54; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oUQRdD54"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 26FFD1F000E9;
	Mon,  3 Aug 2026 21:36:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785793018;
	bh=r5LWXGYC09dLfzbSRN3laucHPglO7aqPFA3IS1gNVeU=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=oUQRdD54eMFty/EMlp8iW5HmsJdlgdnTF9kBI3twgoCuV4n0ShlLNA3yhTkJvzQ5q
	 TTRH31ExCR4/mAFu+ylJCR+KxDimSUbm0lTADGDy/Bwsu20AhbhwHjq0a6zRm3dNJq
	 +fxOpVNcSciN1BCQdtP68B/xDJKkryV/sVmee79X5kBMI83i3hsJHzezSCdOoR3EK5
	 x6haZHODvJ+p3X35dQJ5YTgf9e+6daSgjdTaorXmRgi4aGTDcg+O9yzrBUMezWB2Po
	 ubcWtRIZ1NT8JZ4Cq9ZmloK1GP4iU/NDFfKRA4tZcNst4zVTJJ4W1wZNXF2k2Vy0Gy
	 +x5OomwNGFFfA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 23:36:54 +0200
Message-Id: <DKFMSHHGF3DE.2SUUP3FB7WXTK@kernel.org>
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware
 files
References: <20260731201017.2580713-1-ttabi@nvidia.com>
 <20260731201017.2580713-4-ttabi@nvidia.com>
In-Reply-To: <20260731201017.2580713-4-ttabi@nvidia.com>

@Miguel: One consideration for you below.

On Fri Jul 31, 2026 at 10:10 PM CEST, Timur Tabi wrote:
> +impl<'a> Tlv<'a> {
> +    const MAGIC: &'static [u8; 4] =3D b"NVFW";
> +
> +    /// Parses `data` as a TLV firmware image, returning [`EINVAL`] if t=
he image is malformed.
> +    pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
> +        // Verify that the magic bytes exist and are the correct value
> +        let magic_len =3D Self::MAGIC.len();
> +        if data
> +            .get(..magic_len)
> +            .is_none_or(|magic| magic !=3D Self::MAGIC)
> +        {
> +            return Err(EINVAL);
> +        }
> +
> +        // The payload is the contiguous sequence of TLV blocks after th=
e magic.
> +        let payload =3D data.get(magic_len..).ok_or(EINVAL)?;
> +
> +        if payload.is_empty() {
> +            // Reject empty TLV files
> +            return Err(ENODATA);
> +        }

This seems redundant, if payload is empty the below loop wouldn't execute a=
nd
the !has_vers check would return EINVAL. Which seems consistent, since empt=
y
data is kinda invalid.

> +
> +        // The spec says every TLV must have a VERS tag.
> +        let mut has_vers =3D false;
> +
> +        let mut rest =3D payload;
> +        while !rest.is_empty() {
> +            // Validate and extract the header (type, length).
> +            let Some(header): Option<TlvBlockHeader> =3D rest
> +                .get(..TlvBlockHeader::SIZE)
> +                .and_then(TlvBlockHeader::parse)
> +            else {
> +                return Err(EINVAL);
> +            };
> +
> +            has_vers |=3D header.tag =3D=3D *b"VERS";
> +
> +            // The `length` field of a TLV block contains the actual byt=
e length of the
> +            // value, but each TLV block is aligned to a 4-byte boundary=
.
> +            let Some(stored_size) =3D header.length.checked_next_multipl=
e_of(4) else {
> +                return Err(EINVAL);
> +            };
> +
> +            let length =3D TlvBlockHeader::SIZE
> +                .checked_add(stored_size)
> +                .ok_or(EINVAL)?;
> +
> +            rest =3D rest.split_at_checked(length).ok_or(EINVAL)?.1;
> +        }
> +
> +        if !has_vers {
> +            return Err(EINVAL);
> +        }

[...]

> +    fn find(&self, tag: &[u8; 4]) -> Result<TlvBlock<'a>> {
> +        self.iter().find(|b| b.tag =3D=3D *tag).ok_or(EINVAL)
> +    }

NIT: Do we really know the tag is invalid just because it wasn't found?

> +    /// Return a slice of bytes.  Returns ENODATA if the value is empty.
> +    pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Result<&'a [u8]> {
> +        let tlv =3D self.find(tag)?;
> +
> +        // Treat empty value as an error, to avoid trying to parse nothi=
ng.
> +        if tlv.value.is_empty() {
> +            return Err(ENODATA);
> +        }

This one seems resonable; but we don't have the error code in place. The co=
mmit
message says the series depends on [1], but this likely goes through the Ru=
st
tree.

Either we just add this single error code in a separate patch or Miguel pro=
vides
a signed tag for [1].

Since this is a perfectly trivial conflict, I'd go for the former.

Miguel, let me know if you want to provide a signed tag, otherwise it would=
 be
good if Timur (or myself) could send a patch for ENODATA only.

@Timur: In any case, no need to resend the series for this or the other two=
 nits
in this reply.

Thanks,
Danilo
