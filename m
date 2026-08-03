Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4118B3909A2;
	Mon,  3 Aug 2026 21:39:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785793143; cv=none; b=TZKlxtoyAXgr8vNO9Or1CB5CJqh7Up/nMmRXN88L+VitLgXl4mQPoFNfywJ5RvkN0zDCuriurfxiczjYAhvb5L9Rk7sRxU7C+40r3RI0sb13oMRsBXF5gZN8FFHheS35ut6yrgYyvYJuRppbsGli2FiLwY/h720EgEkhYr0o1b8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785793143; c=relaxed/simple;
	bh=Csfv6swJwCX5DXMwWmbL4Wg2xIz+SUybtDMfEzEf7B8=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:Subject:Cc:To:
	 References:In-Reply-To; b=Js+0F6UTM7ewIE0CzXeJvsafdTyORYRX/wXsvYq7MplTN+wfjSOQCfcQAuamsjZJja5gJy8q7JFPWBmQWmAnyWO45IVO4rEAqyYFzi2drNsYuUYTqU0BMB+USupRsX8brc8xYmyj75uaR6CRsNFp7NTKrPYBEd0FYjkodgw9YYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AYqMCAO3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AYqMCAO3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63E761F000E9;
	Mon,  3 Aug 2026 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785793141;
	bh=BWz+TFrwihEEPq7Ce7G9SQ8Mn0MhSUzg6sWk7Wf+WRU=;
	h=Date:From:Subject:Cc:To:References:In-Reply-To;
	b=AYqMCAO3URHaDcbRfpyCNbaNXrX+OWe/7GTIDBQraJSq0LFd/nvvHqh3eXI/dKfJ/
	 qV63GjH2TNAZPrDLXKmSN9LjNIAiUxP6viL88sTPfuLmS8c7av0fUGUxvW66qgF800
	 5+DrzYAq4wLXMyZ+XzW6badlkkQ7RTd2ViT2SPnr60PwJptdfhV1XOJVxr6CqeWUux
	 3X3La62ZJHZ791HE4z1AKNvKPltuTBJtRCx6TrFqWbmsMFN8Gxb2aJMDR376XMbW+i
	 Ste9IfokjENKtQPr//VZ0NEGT/lWPGFespjMNVdb4Fnm5q7fWaolo3L5s4iM1IX8BZ
	 H5SPC3p2uiOLg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 03 Aug 2026 23:38:57 +0200
Message-Id: <DKFMU1XNJYZN.63NOEFLYN9XU@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v7 3/8] gpu: nova-core: add TLV parser for firmware
 files
Cc: "Luis Chamberlain" <mcgrof@kernel.org>, "Russ Weight"
 <russ.weight@linux.dev>, "Gary Guo" <gary@garyguo.net>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Eliot Courtney" <ecourtney@nvidia.com>, "John
 Hubbard" <jhubbard@nvidia.com>, <zhiw@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>
To: "Timur Tabi" <ttabi@nvidia.com>, "Miguel Ojeda" <ojeda@kernel.org>
References: <20260731201017.2580713-1-ttabi@nvidia.com>
 <20260731201017.2580713-4-ttabi@nvidia.com>
 <DKFMSHHGF3DE.2SUUP3FB7WXTK@kernel.org>
In-Reply-To: <DKFMSHHGF3DE.2SUUP3FB7WXTK@kernel.org>

On Mon Aug 3, 2026 at 11:36 PM CEST, Danilo Krummrich wrote:
> @Miguel: One consideration for you below.
>
> On Fri Jul 31, 2026 at 10:10 PM CEST, Timur Tabi wrote:
>> +impl<'a> Tlv<'a> {
>> +    const MAGIC: &'static [u8; 4] =3D b"NVFW";
>> +
>> +    /// Parses `data` as a TLV firmware image, returning [`EINVAL`] if =
the image is malformed.
>> +    pub(crate) fn new(data: &'a [u8]) -> Result<Self> {
>> +        // Verify that the magic bytes exist and are the correct value
>> +        let magic_len =3D Self::MAGIC.len();
>> +        if data
>> +            .get(..magic_len)
>> +            .is_none_or(|magic| magic !=3D Self::MAGIC)
>> +        {
>> +            return Err(EINVAL);
>> +        }
>> +
>> +        // The payload is the contiguous sequence of TLV blocks after t=
he magic.
>> +        let payload =3D data.get(magic_len..).ok_or(EINVAL)?;
>> +
>> +        if payload.is_empty() {
>> +            // Reject empty TLV files
>> +            return Err(ENODATA);
>> +        }
>
> This seems redundant, if payload is empty the below loop wouldn't execute=
 and
> the !has_vers check would return EINVAL. Which seems consistent, since em=
pty
> data is kinda invalid.
>
>> +
>> +        // The spec says every TLV must have a VERS tag.
>> +        let mut has_vers =3D false;
>> +
>> +        let mut rest =3D payload;
>> +        while !rest.is_empty() {
>> +            // Validate and extract the header (type, length).
>> +            let Some(header): Option<TlvBlockHeader> =3D rest
>> +                .get(..TlvBlockHeader::SIZE)
>> +                .and_then(TlvBlockHeader::parse)
>> +            else {
>> +                return Err(EINVAL);
>> +            };
>> +
>> +            has_vers |=3D header.tag =3D=3D *b"VERS";
>> +
>> +            // The `length` field of a TLV block contains the actual by=
te length of the
>> +            // value, but each TLV block is aligned to a 4-byte boundar=
y.
>> +            let Some(stored_size) =3D header.length.checked_next_multip=
le_of(4) else {
>> +                return Err(EINVAL);
>> +            };
>> +
>> +            let length =3D TlvBlockHeader::SIZE
>> +                .checked_add(stored_size)
>> +                .ok_or(EINVAL)?;
>> +
>> +            rest =3D rest.split_at_checked(length).ok_or(EINVAL)?.1;
>> +        }
>> +
>> +        if !has_vers {
>> +            return Err(EINVAL);
>> +        }
>
> [...]
>
>> +    fn find(&self, tag: &[u8; 4]) -> Result<TlvBlock<'a>> {
>> +        self.iter().find(|b| b.tag =3D=3D *tag).ok_or(EINVAL)
>> +    }
>
> NIT: Do we really know the tag is invalid just because it wasn't found?
>
>> +    /// Return a slice of bytes.  Returns ENODATA if the value is empty=
.
>> +    pub(crate) fn get_bytes(&self, tag: &[u8; 4]) -> Result<&'a [u8]> {
>> +        let tlv =3D self.find(tag)?;
>> +
>> +        // Treat empty value as an error, to avoid trying to parse noth=
ing.
>> +        if tlv.value.is_empty() {
>> +            return Err(ENODATA);
>> +        }
>
> This one seems resonable; but we don't have the error code in place. The =
commit
> message says the series depends on [1], but this likely goes through the =
Rust
> tree.
>
> Either we just add this single error code in a separate patch or Miguel p=
rovides
> a signed tag for [1].
>
> Since this is a perfectly trivial conflict, I'd go for the former.
>
> Miguel, let me know if you want to provide a signed tag, otherwise it wou=
ld be
> good if Timur (or myself) could send a patch for ENODATA only.
>
> @Timur: In any case, no need to resend the series for this or the other t=
wo nits
> in this reply.
>
> Thanks,
> Danilo

[1] https://lore.kernel.org/all/20260629183022.2709524-1-ttabi@nvidia.com/
