Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79E4119F137;
	Fri, 24 Jul 2026 01:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784856152; cv=none; b=s4IaveIMv2QI726eg+J0LwCO5e//jYJ2TJgfHXui1eWJtqfUDLU96knTWi8bVSS2gs1tiXaeZhUoV+JZ3pGdUcXM2GCj8BZNqZk//IOYf0qE1qK5i9CcdiuAbNUM2oHN1C3p7xLzg5SoQvYL5BRVyzYbhr1nqfvLFsXZ0D2P8M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784856152; c=relaxed/simple;
	bh=6NQM5XvwtUb+B8XOW0XwWF8C/FUU7g+URzK/FueCDhI=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=d4HLAtcqwGV33E7iem1bGJvv8IB5bfb+wF5JMigktUBkpGM09rYIpaDy7EGvHFKZ/oOQd8EjLM2YDwS6G7SElpvFKgdsATRXmq7A/uVw2wvKWHyG1WaLTsKzIB0H6YR+YGAC7YqOW681hrQhU0UkmnPkHDXRE0hg53CeOOcR3zE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IOZXoxUc; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IOZXoxUc"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 970FE1F000E9;
	Fri, 24 Jul 2026 01:22:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784856151;
	bh=649P8hKCqGligbxriMvTB19/b7vOCEVkFLD+Bd8Avhw=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=IOZXoxUcivkMSZCMwwO86Q2FHNv1vezCfIzuXv9NZ55/PfEm7zmMr2hRVCLDwemMm
	 f0G4/E3MrkGOirOeZ2yetBoYH6FXnjWB4TAKZi+8VvmQ+R+zTzMiO1Y7o6UIKhlZ9u
	 gKAvyz2Xd775aOp5RD445+VmYr/K3U9zu5M0GlTQUxh7Oi6qIyT0DRtEjVd8GzzMNE
	 3WDqpFy588VWyhNOP6jy03Tvz15VPBeGrR7ofizDzYTIKe4khyqa4sp0L97NyNVO+m
	 DfI1YTwaZ+k61VRJ0ZQreDPMP4HcV7JG6IZIsoA4Z3EeGwGkmycRmNLmj51ikrarHg
	 S9kmpMsrHOcWw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 24 Jul 2026 03:22:25 +0200
Message-Id: <DK6EP5W2N2U5.OTWCUSAPJWFD@kernel.org>
Subject: Re: [PATCH] rust: dma: return zero for Coherent reads past EOF
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, <git@younes.io>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>, "Trevor Gross"
 <tmgross@umich.edu>, "Tamir Duberstein" <tamird@kernel.org>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Timur Tabi"
 <ttabi@nvidia.com>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260720-fix-dma-coherent-eof-v1-1-d92685db8da6@younes.io>
 <DK6CCQDJHK8E.1DZHVZJDLS97P@garyguo.net>
 <DK6DC28Y2CZY.2IOLKS3T81VG8@nvidia.com>
 <DK6DXU51V88J.23CVF9ARSSGT2@garyguo.net>
In-Reply-To: <DK6DXU51V88J.23CVF9ARSSGT2@garyguo.net>

On Fri Jul 24, 2026 at 2:46 AM CEST, Gary Guo wrote:
> On Fri Jul 24, 2026 at 1:18 AM BST, Alexandre Courbot wrote:
>> On Fri Jul 24, 2026 at 8:32 AM JST, Gary Guo wrote:
>>> On Mon Jul 20, 2026 at 8:21 PM BST, Younes Akhouayri via B4 Relay wrote=
:
>>>> From: Younes Akhouayri <git@younes.io>
>>>>
>>>> Coherent<T>::write_to_slice() calculates a zero-byte copy when the fil=
e
>>>> offset is beyond the allocation, but still calls
>>>> UserSliceWriter::write_dma(). The latter rejects offsets beyond the
>>>> allocation even when the copy length is zero, so a debugfs read past E=
OF
>>>> returns -ERANGE.
>>>>
>>>> Return before calling write_dma() when the offset is at or beyond the
>>>> allocation, matching simple_read_from_buffer() EOF semantics.
>>>>
>>>> Fixes: 016818513936 ("rust: dma: implement BinaryWriter for Coherent<[=
u8]>")
>>>> Signed-off-by: Younes Akhouayri <git@younes.io>
>>>> ---
>>>>  rust/kernel/dma.rs | 4 ++++
>>>>  1 file changed, 4 insertions(+)
>>>>
>>>> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
>>>> index 200def84fb69..36b72fb9ab46 100644
>>>> --- a/rust/kernel/dma.rs
>>>> +++ b/rust/kernel/dma.rs
>>>> @@ -1005,6 +1005,10 @@ fn write_to_slice(
>>>>              return Ok(0);
>>>>          };
>>>> =20
>>>> +        if offset_val >=3D self.size() {
>>>> +            return Ok(0);
>>>> +        }
>>>> +
>>>>          let count =3D self.size().saturating_sub(offset_val).min(writ=
er.len());
>>>
>>> This saturating_sub is redundant now and should just use -.
>>
>> Or even better, you could use `checked_sub` to perform the test and the
>> subtraction in one go, while avoiding potentially panicking operands.
>
> I think the code is clearer with separate EOF check length calc. This als=
o needs
> to return `Ok` so it's not like that you can use `?`.

At a first glance I also thought of checked_sub(), and I think

	let Some(count) =3D self.size().checked_sub(offset_val) else {
	    return Ok(0);
	};

	writer.write_dma(self, offset_val, count.min(writer.len()))?;

would work perfectly fine, but compared to Gary's proposal it still calls
write_dma() for offset_val =3D=3D self.size(), which is harmless but unnece=
ssary.

Another option to avoid the panicking operand would be to keep saturating_s=
ub()
and add the check below the existing saturating_sub() call.

	if count =3D=3D 0 {
	    return Ok(0);
	}

But this is also less obvious, as it hides a bit the fact that the problem =
is
about offset_val when calling write_dma().

So, I think using the potentially panicking operand is probably the best op=
tion,
but I'd also be fine taking the patch as it is.
