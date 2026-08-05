Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A15353D300F;
	Wed,  5 Aug 2026 20:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785962397; cv=none; b=ebmu0jl0VggEUfLbwnmoxfCenyHnFiDOpnopo4n6m22ho9vGrrv1GshpiN0lHOWUKsM+Hmdrv8q42vzvutCeqfQH4XrxsRcx3A2QvO87cP2imdKh+85TxzFCpM0gePE6+QAYkisj9ZwGD63DrYk5B3evFbLrvPeQKdPxZecirlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785962397; c=relaxed/simple;
	bh=HDyA1AHqV1GG5znDjIJMQn0uh8/N2gKM1KJPkKkMP1Q=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=OUkFCGJWhvGqunnd81WY+163vo3GmoAGxMtjfToThAWWEHJBbvn5l/nlFu2vyxrdF4JLI4pXwYW9LZAN/TB+KBu7Bh+VM5FZmANoc8ww0Ncb/ihuMx883T17pO4qISEdk4NWhlGpakP9aJcY783EKgkrF5b+D9wqGZI3cn7VDB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IEQKVUUG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IEQKVUUG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FF291F000E9;
	Wed,  5 Aug 2026 20:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785962396;
	bh=HDyA1AHqV1GG5znDjIJMQn0uh8/N2gKM1KJPkKkMP1Q=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=IEQKVUUGYgAOPLuRXTcVmhOdc3PtY0k7BSdBbqZleZxR7mgiIDaPDpbHzCRItbKqQ
	 TiJc6rIaVvez4uxezNfnhwJkPpoAyA+2mpryh56weiQVj04QbK3i2GK/g3SobPoTKX
	 8tmXIXXr8lQm1aNZ12uRPDThZUrKMGHOnVAPCBW+5HpGeCavZIe1tIBcLARa/Sa4pF
	 fJ7DIEQWOwQyMGwtY4A/e676AmDgeJB0XFWdws1lYJf6rU6DLHlCL01sgSQ0JFPFHn
	 rcCR4Ws1ki3c8Vqd7zBeGFuUdEmpclOJ8p9nS790tmxoIFRZ/C1LTLwyh8ll+SV3AE
	 HxITaHbeouFxQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 05 Aug 2026 22:39:50 +0200
Message-Id: <DKHATVF1WAE7.NGVXJQD12XQ@kernel.org>
Subject: Re: [PATCH v2 2/3] rust: dma: rename dma_handle to dma_address
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Andreas Hindborg"
 <a.hindborg@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Trevor Gross" <tmgross@umich.edu>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "John Hubbard" <jhubbard@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
To: "Robin Murphy" <robin.murphy@arm.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com>
 <20260805-falcon-dma-projections-v2-2-4cc9f3f13ee9@nvidia.com>
 <3a87960b-8a20-4947-a8b5-d5197174317c@arm.com>
In-Reply-To: <3a87960b-8a20-4947-a8b5-d5197174317c@arm.com>

On Wed Aug 5, 2026 at 1:32 PM CEST, Robin Murphy wrote:
> To be fair, that is sort of the intent in the C API as well, to be clear=
=20
> that DMA addresses must not simply be treated as physical addresses, and=
=20
> aren't necessarily address-like in general e.g. comparing two=20
> dma_handles is pretty meaningless, since they could have different=20
> values but still refer to the same underlying memory, or vice-versa.=20
> Adding or subtracting offsets within the bounds of the original=20
> allocation/mapping size is pretty much the only arithmetic that _is_ vali=
d.

Yes, I did suggest a dma::Range type [1] for this purpose, such that only t=
his
kind arithmetic is possible to do.

The dma::Range type should have a method returning its embedded raw value w=
hich
then can be used to program registers etc.

This patch is only an intermediate step, that clarifies that intent of the
current usage of dma_handle() (or now dma_address()), which is not to serve=
 as a
handle.

[1] https://github.com/Rust-for-Linux/linux/issues/1248

> However at the Rust level, the abstraction itself can convey (and even=20
> enforce!) most of that, so for the sake of clarity here, particularly if=
=20
> Rust programmers are likely to have their own expectations of what=20
> "address" and "handle" mean, then I'm inclined to agree.

Yeah, as mentioned in the link below, the handle that represents the alloca=
tion
are the DMA container types (such as dma::Coherent) themselves.

>> Link: https://lore.kernel.org/all/DK75LUA4NLGI.3P29AIZQE20V2@kernel.org/
