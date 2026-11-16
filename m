Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794835022;
	b=RHZ8VFw9d6pPjAzmTKSOK5obiqkTtSdfMrTDpswLqKmlOI1UfTZ9PGpkbzWg/WPdZM5q
	 esq1jRxPaWh1c0/mH6lTr5cvPIgCHqCIOWP0jWaqG/EJxLYtBPjK8z4OR9E2nNgoa4vbR
	 QaU53FfvOgdPSjQGt1Z7xZpRgBIXzuWARY8NpV4ZmkO4YnxfzxVWzlSHDot5jCAoUlsLe
	 hVWkM7nM/jDq2gQaQgLNFAxS7XSnPW/ms8OpGL8tSJWaT+R2bKVg8vxCtUw1c8zzZj69K
	 CSrmE/9emhBkIFi1mO3F+TAMR9EJs4mhh4vPrd6mobmjeNs7KZV0CsbkrlxKwjISxXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794835022;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=asTp5bvNEu4eGE2GCVQMMsDOsCHNqmXbn8TvpTtPgLo=;
	b=dp6CJ5E9bHet2PeRDuNdNYQOkU4lnSgVxqWSrIPjNvxGYbsBULuOaQ46dMtTfNol0giY
	 pRhsx0FKEuPe5CkC8yJoNu3VaUPjaSePuBYpZDf+GTgi/rC4Z52yWYufZOWDSbtfG2U6g
	 G3GRLtVtNzwWE1thFP8s9lbCRUcsF9e+FW6tyDkY+eunyQsqv4tJSR0qM3f9DfR5UvJcE
	 FCjAM3cMVpdspOW9kCC3V6w07Iaxs3pDGVEa002Xol9VSvcW2ulEke+/llF6YClNZlupB
	 ycwypNwS+8ss9IjOe2Oufg4RfERRjwqUYfyk9F91f0mJXZBTTQQuZbzi6yGDDUD8kgg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTM1fwJo;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DDCE606A33A;
	Mon, 16 Nov 2026 13:17:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=BTM1fwJo
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6EA8A1F000C6;
	Mon, 16 Nov 2026 13:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794835022;
	bh=asTp5bvNEu4eGE2GCVQMMsDOsCHNqmXbn8TvpTtPgLo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=BTM1fwJoPXzyN8641dSBzZx3E93fZGda5QVIJ/Fw4SUGv9OJjknAmfekyJ9lnxQhq
	 LvGJBk+JtUdFP7CF3mXpE6ROaK2DGAe8A86qh4vOi9gxNXB4midPpUtQkULDAJKkXT
	 EDtvSFaU3Jb7cBcF19GqFNmUmf1ny13cGeXfz8suO2F1oxozx98IUvwA0f73bTMVMV
	 9BYjeaLMTqNaQvPq2xjvdbT1mvzrPc3ic/vrU+WuSGQw9fhwhhpVLxMnkUNXwkL66S
	 u4MpjvOZZ7q3oky/RMIBWOZ5HV53D6M3UQ4qZsRZl6cnRc+juPmFmUAwtrKWWJogw8
	 AWv5siFc820bw==
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 16 Nov 2026 14:16:56 +0100
Message-Id: <DMWNWVWXJ45A.2F8WUTKWYNY8I@kernel.org>
Subject: Re: [PATCH 1/2] rust: scatterlist: tie owned tables to the device's
 bound lifetime
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
 <DMWC45NN5L9I.2NUG81ETBC84L@nvidia.com>
 <DMWN7AJF6SXX.1HN3UMDROET7F@kernel.org>
 <DMWNC5DLYRO8.1WSI80QE8AOKH@garyguo.net>
In-Reply-To: <DMWNC5DLYRO8.1WSI80QE8AOKH@garyguo.net>

On Mon Nov 16, 2026 at 1:49 PM CET, Gary Guo wrote:
> On Mon Nov 16, 2026 at 12:43 PM GMT, Danilo Krummrich wrote:
>> On Mon Nov 16, 2026 at 5:02 AM CET, Alexandre Courbot wrote:
>>>> @@ -81,7 +78,7 @@ pub(crate) fn new(
>>>>                      let mut level0 =3D CoherentBox::<'_, [u64]>::zero=
ed_slice(
>>>>                          dev,
>>>>                          GSP_PAGE_SIZE / size_of::<u64>(),
>>>> -                        GFP_KERNEL
>>>> +                        GFP_KERNEL,
>>>
>>> Stray hunk? Maybe we can move it to patch 2 since it reformats that par=
t
>>> anyway.
>>
>> I noticed this before sending too, but for some odd reason rustfmt insis=
ts on
>> this with this change.
>>
>> When I noticed I was 'whatever', but now I got curious. It happens when
>>
>> 	level2 <- {
>> 	    build_lvl(&data)
>> 	        .map(|l2| SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KE=
RNEL))?
>> 	},
>> =09
>> is changed to
>>
>> 	level2: {
>> 	    let l2 =3D build_lvl(data)?;
>> 	    SGTable::new(dev, l2, DataDirection::ToDevice, GFP_KERNEL)?
>> 	},
>> =09
> When you remove all `<-` rustfmt starts formatting macros again because i=
t sees
> the macro invocation being a valid Rust expression.

Not exactly, that's why I picked level2. If you remove the <- from level1, =
but
not level2 it doesn't format, but if you do it the other way around, it doe=
s.

> I think you can also just remove the try_pin_init! here completely?

I remove all the pin-init remains in patch 2 as it propagates a bit, keepin=
g
this one purely mechanical.
