Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8078E1FF61E;
	Sat,  4 Apr 2026 20:28:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775334539; cv=none; b=sWaC7JSl4FCsKitMhHKLbe+XRVA9wEzQcKFd3ghR1O3BK+IQLqRjxtd0loIdsNpFDnBXFTzQL/bkE+Vk3DiczSc98gMHuZnQsC8HNVQxGtdKqneMhTZDanfYKHmx/0YyDahRB5aVuy9jEWj5CiR5cjd/LYxWGOv4Vd+x8TGO8Bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775334539; c=relaxed/simple;
	bh=QoaLjzCSUgzo51li7WpRQtndE9W8B0LmWEY04lFFRf0=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ZBsc0s3+WjHQtVmdsFZ6NLo38XaGLKUm3Xy54LTgZzedvtvGOHgzYSlQ22wdbJnAN/ViPzBbSyd9Ew6ha+oGFs1Pg3rUxV1Cu8EccwhjiU/hOXW45rNryCYPQIS27DcxSEJtCKw0hVMX3kVDkCsBX5una7na3+0beCnvO/NukgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eRTAR+ef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eRTAR+ef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DEF5C19421;
	Sat,  4 Apr 2026 20:28:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775334539;
	bh=QoaLjzCSUgzo51li7WpRQtndE9W8B0LmWEY04lFFRf0=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=eRTAR+ef6VWIfgyxtPdSZUpLVl+KJJSsgXY+zROqGzIzxuUNbXk7BRO/RnTVMkZwh
	 /dV/J4XrQ+OcS2Qky33Ryv9F2WI4bHgnC/PVaV2KKnky62Yb8+l3hRRgczBNohE8qj
	 17XJPlvef3IraUwv3iHOgFmW02++fgnE+y0GyUllXAA5KkEO+aCdGEVRgLhNWrpYek
	 GwTUbinviz0i6TEO8isAYaCztf/mvfy2GtIOa7pDlAo3xBi3VH3XtmCijKC1QHO3db
	 5OpNNjfiA6SbVUo98f8ypmc+oEzjhYbC5RSnKwB+HvGEfNDg6GefLswFdWT0Qzfj2y
	 JYMU2tD9QLNEw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 04 Apr 2026 22:28:54 +0200
Message-Id: <DHKNKHZCH7NG.RIKDM4A9K61D@kernel.org>
Subject: Re: [PATCH] rust: dma: return EOVERFLOW instead of ENOMEM on size
 overflow
Cc: "Aditya Rajan" <adi.dev.github@gmail.com>, <ojeda@kernel.org>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <boqun@kernel.org>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <aliceryhl@google.com>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260403212822.294288-1-adi.dev.github@gmail.com>
 <DHKECN57N95Q.2DN7NG4GUA24F@garyguo.net>
 <DHKJNOFD1P03.15QMM3BFH0KLB@gmail.com>
 <DHKN8U9VHH45.1ONRTFLAVID9D@garyguo.net>
In-Reply-To: <DHKN8U9VHH45.1ONRTFLAVID9D@garyguo.net>

On Sat Apr 4, 2026 at 10:13 PM CEST, Gary Guo wrote:
> On Sat Apr 4, 2026 at 6:24 PM BST, Aditya Rajan wrote:
>> On Sat Apr 4, 2026 at 6:15 AM PDT, Gary Guo wrote:
>>
>>> Thanks for the patch, but the behaviour here is intended.
>>>
>>> Neither our `KVec` implementation nor upstream Rust distinguishes betwe=
en
>>> allocation error caused by array size exceeding address space or runnin=
g out of
>>> memory to allocate (`AllocError` is returned and it converts to ENOMEM)=
.
>>>
>>> `kmalloc_array` also just returns `NULL` when overflows, so arguably th=
is
>>> behaviour also aligns us with C side.
>>>
>>> Abstractly, the system is indeed running out memory because it cannot a=
llocate
>>> something larger than its address space.
>>
>> Hi Gary,
>>
>> Thanks for the reply, I saw at some similar places where EOVERFLOW is us=
ed,
>> that is why i thought we should change this error code:
>>
>> * In nouveau_drv.h, `u_memcpya()` does `check_mul_overflow(nmemb, size,
>> &bytes)` and returns ERR_PTR(-EOVERFLOW), it is kind of same multiplicat=
ion
>> overflow on `nmemb*size` before an allocation. Similarly `mm/mmap.c` ret=
urns
>> EOVERFLOW for arithmetic overflow in offset calculations, it also has a
>> comment `/* offset overflow? */`.
>
> I think these cases are all related to values ultimately controlled by
> userspace, and the error conditions are propagated back to userspace, so =
it
> makes more sense to distinguish errors.

That's not the main difference, any of those primitives may be called on be=
half
of userspace with the error propagated back to userspace. Please also see m=
y
considerations in [1].

[1] https://lore.kernel.org/lkml/DHKMLRW67JB9.2VGA6EGTLYSCU@kernel.org/

> On the other hand, for KVec/Coherent cases, it is less useful to distingu=
ish
> between the cases. If we want to add EOVERFLOW, then we'd need to extend
> AllocError to have two enums, which I wouldn't be against, but I think it=
's not
> worth having.

I'd rather not, let's keep it consistent with other memory allocation
primitives.

> (I wanted Coherent to use AllocError as error too, but as it does not sup=
port
> zero-size allocation, so I didn't change the error type. I guess one opti=
on is
> to handle zero-size case by using a dangling pointer similar to `KVec`.)

I'm against this, a zero-sized dma::Coherent allocation does not make sense=
; I'd
really want to see a real use-case for this.

>> * Also I saw existing Rust kernel code already follows similar conventio=
n, see
>> `rust/kernel/uaccess.rs` it uses `offset.checked_add(count).ok_or(EOVERF=
LOW)?`
>> for the same kind of arithmetic overflow check.
>>
>> * For `kmalloc_array` i think it conflates overflow with OOM because its
>> return type (pointer) can't express distinct errors, maybe it should be
>> improved as well ?. When the API can distinguish (like here, or in nouve=
au),
>> the kernel does use (or maybe should use?) `EOVERFLOW`.
>>
>> IMO two failures have different semantics for callers, ENOMEM is transie=
nt
>> (retry may succeed under less memory pressure), EOVERFLOW is determinist=
ic
>> (the input will never work). Using ENOMEM for overflow could mislead a c=
aller
>> into retrying a request that can never succeed.
>
> If I allocate `usize::MAX`, it'll never work but the error would still be
> ENOMEM, and I see no reason to differentiate `usize::MAX` and `usize::MAX=
 + 1`.

Agreed.
