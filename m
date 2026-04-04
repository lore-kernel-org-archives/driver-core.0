Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F46A2D7DC8;
	Sat,  4 Apr 2026 19:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775331818; cv=none; b=Yb6uhJSderVWvCt2dkIPZf9aCTX84vdN946tfSDZwHnw2NJPxai2xqmBZmNchtdVLfJoYP6GLT0cHZf12bpVc6dagwfzv0Ljvgnw/uceszyWAvWd0gSfZZCXdZXu1MesEmWLOuXRjpVb5ChPWWiVnrfrUPk1h5uOrf3V3GfOpAg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775331818; c=relaxed/simple;
	bh=3NfWZrRA3LsWvvRxBxXwMhh9SGIhjakdPqS6cZT9xy4=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=GaLayrp5UnQI/92pWyigFFnGSPnNm9mu/ZvcKEaFthRLvogU1kpQEKmBQk5geZf677IWlwNh6Y+kJGdNz1YEvcxqZIDTAbgZJjTIsEpeLokHApeFRmgNL5y9jKMJWIFs6UpIY74YIKFDDwrIyHHSK3jytJKo8GPIYBqZbPEj2ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=H6MZFVNJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="H6MZFVNJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE17EC19421;
	Sat,  4 Apr 2026 19:43:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775331817;
	bh=3NfWZrRA3LsWvvRxBxXwMhh9SGIhjakdPqS6cZT9xy4=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=H6MZFVNJnSAj0tzJS6slzXuqqzNYQGE8Xz+k/mf6h629gtz5DtRvfcEYcIUBwYEv9
	 MeiL2lYB8qpJFBH5ERYg8ki7z7tF7FED9kpgs3APD1PrOwPEijK7W67gn7ysgyiZpK
	 WcpHg37dUT5PaxL4XcAB6sgYPE9py8mOzPCnJsL7aI6/lNBvjXiLvgb683yTEWMslX
	 yfU5F61aPK/R2ynD0YqYV/QUOn40RBqIXrP4YWMHjvpo4vGQbtL65E6Bvf1dMOteXg
	 SXFfU2auSxwKEWwXqRI5JMcpmkF+DbcxAUoCC2oRz4B15qIP5+DPrehpG/czIDcLIs
	 OIhymvP6bMntw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 21:43:33 +0200
Message-Id: <DHKMLRW67JB9.2VGA6EGTLYSCU@kernel.org>
Subject: Re: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size
 overflow
Cc: "Gary Guo" <gary@garyguo.net>, <ojeda@kernel.org>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Aditya Rajan" <adi.dev.github@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260403212822.294288-1-adi.dev.github@gmail.com>
 <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>
 <DHKJNOFD1P03.15QMM3BFH0KLB@gmail.com>
In-Reply-To: <DHKJNOFD1P03.15QMM3BFH0KLB@gmail.com>

On Sat Apr 4, 2026 at 7:24 PM CEST, Aditya Rajan wrote:
> On Sat Apr 4, 2026 at 6:15 AM PDT, Gary Guo wrote:
>
>> Thanks for the patch, but the behaviour here is intended.
>>
>> Neither our `KVec` implementation nor upstream Rust distinguishes betwee=
n
>> allocation error caused by array size exceeding address space or running=
 out of
>> memory to allocate (`AllocError` is returned and it converts to ENOMEM).
>>
>> `kmalloc_array` also just returns `NULL` when overflows, so arguably thi=
s
>> behaviour also aligns us with C side.
>>
>> Abstractly, the system is indeed running out memory because it cannot al=
locate
>> something larger than its address space.
>
> Thanks for the reply, I saw at some similar places where EOVERFLOW is use=
d,
> that is why i thought we should change this error code:
>
> * In nouveau_drv.h, `u_memcpya()` does `check_mul_overflow(nmemb, size,
> &bytes)` and returns ERR_PTR(-EOVERFLOW), it is kind of same multiplicati=
on
> overflow on `nmemb*size` before an allocation. Similarly `mm/mmap.c` retu=
rns
> EOVERFLOW for arithmetic overflow in offset calculations, it also has a
> comment `/* offset overflow? */`.
>
> * Also I saw existing Rust kernel code already follows similar convention=
, see
> `rust/kernel/uaccess.rs` it uses `offset.checked_add(count).ok_or(EOVERFL=
OW)?`
> for the same kind of arithmetic overflow check.
>
> * For `kmalloc_array` i think it conflates overflow with OOM because its
> return type (pointer) can't express distinct errors, maybe it should be
> improved as well ?. When the API can distinguish (like here, or in nouvea=
u),
> the kernel does use (or maybe should use?) `EOVERFLOW`.

You mentioned u_memcpya() from nouveau, which follows memdup_array_user() a=
nd
vmemdup_array_user(); and I think there are even more such examples that us=
e
-EOVERFLOW besides those and the also mentioned uaccess code.

That said, they all have on common that they are semantically different com=
pared
to a raw memory allocation, as they also access existing buffers the user w=
ants
those functions to copy from. Thus, a multiplication overflow also implies =
a
potential out of bounds access of the given buffer. So, it makes sense to
distinguish between -EOVERFLOW and -ENOMEM in those cases.
