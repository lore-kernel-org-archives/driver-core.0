Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAF31DF987;
	Sat, 14 Feb 2026 14:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771080809; cv=none; b=clEP4VvmboHVLnzZlVoQmYYBufsf0S+VPOvnWI/4kURknKjhN6JGdcyJi4CXm+8ZVad28vmOMskR109qIgw1Auz8yIOYvwfgZy3eh7/Q9BcW1zE7w+66gQ1L3cymcE7GZlRQCwrkDe74RM2IQbiaVJjlCC6ZQjhfGGTch2rWeXQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771080809; c=relaxed/simple;
	bh=B84BhG0f7VIWVg+V0e3xhcHAwzs0D8cINdqp3ahQUy8=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=T633Z/6xe3T2SrSibqEoVDwnZ/1hUS4Cysu27V6R6AL1upFzTPToDp27rxHutq1yHOtQFeR2BIWZRBoGSYJZefNRVEsjBbwlJuEmRQ0+Uq2jakva2/nDro2XrLS0PZab7OFggUAGWDUVgk3njC55iaKgmGRWJhDf9wEaemgFtIU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=o3BOsUVv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="o3BOsUVv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44AA3C16AAE;
	Sat, 14 Feb 2026 14:53:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771080809;
	bh=B84BhG0f7VIWVg+V0e3xhcHAwzs0D8cINdqp3ahQUy8=;
	h=Date:Cc:Subject:From:To:References:In-Reply-To:From;
	b=o3BOsUVvxZY9CnI+6/0hFmHgckZBcUhqk2r+rVc+OTgpKUjD6/9hXdF0tP7eh0xR8
	 9b1uw9YvEO+++g2T+xDXK6GVf4neZ/ZhoU5adYZNprhv99Ax1K8k+txzTTMP2hY2gD
	 bOUZy39KEGRRX+TesXEWq+fUUfohD1N7yWDd582hbjF7VMOf1VcxUNlJh7mtBtVtow
	 igIdexZ2sj6kPestbQGqb4XDahDOmLj0qZ+tdqHXI+7yJZBHgzmI7fTjaS9G/wWhF0
	 ytTmTtl7NzK7Jo6YiWl7WCUV3OJuK5dGSpyZvE2ZIQrNB1eFe+5svVlVVzIVWGkcIl
	 7WUJWfxc65AHA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 14 Feb 2026 15:53:21 +0100
Message-Id: <DGERQW278SQX.3GIPMUSC46PQ6@kernel.org>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 2/4] rust: dma: generalize `dma_{read,write}` macro
From: "Benno Lossin" <lossin@kernel.org>
To: "Gary Guo" <gary@garyguo.net>
X-Mailer: aerc 0.21.0
References: <20260214053344.1994776-1-gary@garyguo.net>
 <20260214053344.1994776-3-gary@garyguo.net>
 <DGELM1R9FJNE.30QDHV2IXV0BI@kernel.org>
 <84ef050ac2c2cf858ec766f23d1fb90e@garyguo.net>
In-Reply-To: <84ef050ac2c2cf858ec766f23d1fb90e@garyguo.net>

On Sat Feb 14, 2026 at 11:46 AM CET, Gary Guo wrote:
> On 2026-02-14 10:04, Benno Lossin wrote:
>> On Sat Feb 14, 2026 at 6:33 AM CET, Gary Guo wrote:
>>> +    (@parse [$dma:expr] [$($proj:tt)*] [.$field:tt $($rest:tt)*]) =3D>=
 {
>>> +        $crate::dma_write!(@parse [$dma] [$($proj)* .$field] [$($rest)=
*])
>>> +    };
>>> +    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr]? $($rest:tt)*]) =
=3D> {
>>> +        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]?] [$($res=
t)*])
>>> +    };
>>> +    (@parse [$dma:expr] [$($proj:tt)*] [[$index:expr] $($rest:tt)*]) =
=3D> {
>>> +        $crate::dma_write!(@parse [$dma] [$($proj)* [$index]] [$($rest=
)*])
>>> +    };
>>> +    ($dma:expr, $($rest:tt)*) =3D> {
>>> +        $crate::dma_write!(@parse [$dma] [] [$($rest)*])
>>>      };
>>=20
>> I'm wondering if this also works:
>>    =20
>>     ($dma:expr, $($(.$field:ident)? $([$index:expr])?)*, $val:expr) =3D>=
 {{
>>         let dma =3D &$dma;
>>         let ptr =3D $crate::project_pointer!(
>>             mut $crate::dma::CoherentAllocation::as_mut_ptr(dma),
>>             $($(.$field)? $([$index])?)*,
>>         );
>>         let val =3D $val;
>>         // SAFETY: pointer created by projection is within DMA region.
>>         unsafe { $crate::dma::CoherentAllocation::field_write(dma, ptr, =
val) }
>>     }}
>
> Rust would complain that the outer repetition can match empty token tree.

Ah right.

>>> @@ -91,17 +91,17 @@ fn drop(self: Pin<&mut Self>) {
>>>          dev_info!(self.pdev, "Unload DMA test driver.\n");
>>> =20
>>>          for (i, value) in TEST_VALUES.into_iter().enumerate() {
>>> -            let val0 =3D kernel::dma_read!(self.ca[i].h);
>>> -            let val1 =3D kernel::dma_read!(self.ca[i].b);
>>> -            assert!(val0.is_ok());
>>> -            assert!(val1.is_ok());
>>> +            let result =3D (|| -> Result<_> {
>>> +                let val0 =3D kernel::dma_read!(self.ca, [i]?.h);
>>> +                let val1 =3D kernel::dma_read!(self.ca, [i]?.b);
>>> =20
>>> -            if let Ok(val0) =3D val0 {
>>>                  assert_eq!(val0, value.0);
>>> -            }
>>> -            if let Ok(val1) =3D val1 {
>>>                  assert_eq!(val1, value.1);
>>> -            }
>>> +
>>> +                Ok(())
>>> +            })();
>>=20
>> I dislike that we have to reintroduce the budget-try block here. Ideally
>> we could add something like `try` at the beginning of the macro and then
>> automatically add the try block. Feel free to make that a future series.
>
> I don't think this is an issue. It's visible inside the samples because
> we are testing the values, but in practice most users would propagate the
> errors out.

Maybe we should just have a function that returns a Result in this test
that's called from drop.

> I also dislike that the budget-try block that we have inside `dma_read!`
> currently hard-codes the error type.

Yeah me too.

Cheers,
Benno
