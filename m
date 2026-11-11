Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794403574;
	b=CUW39sCC1ddN4T4vCnHrZxQXk4G/fAJPeBR8kXxeiFy/3qi4OlrHLZTNyLfCR/bUkwYj
	 uDor9lbtV1K+bjBNFAPnYU5/4betARzQJqTAYazGxTbWAHD44J3xnfsFmUEu3SSBLcOoF
	 cGLJ1yRmHBmzcuzavPlJsmzxwpinMDRjaSSsCN3rB0QEDan/Hd56cPKTwGwG4WZPQRWSJ
	 Ky0rltSt6DCvD3l6BsaMCLGtTsvtbPGkIZOjvjvbExbqLG6i3nCI3HpfLzCIxGP5I6uRi
	 LR/4si1g47ylk2VsakA9J2hOBxcySpzUCtH0DilF6MKYN0XVdtYtQJvGimbZ7fAY23w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794403574;
	h=Received:DKIM-Signature:From:To:Cc:Subject:In-Reply-To:References:
	 Date:Message-ID:MIME-Version:Content-Type;
	bh=oWibahG2+QM42E0pwbef1XpX0UCKvPhGaW6o9ujTid4=;
	b=2efsLMvJvs5G1Gp7krkCKfPyr0eFqr4joF8E635li1WgJXWV/qgEZmflAwzFzZcwTgFB
	 Ih20dMKuMiRU09dUBa1H8LAa92QqA5PfHAPtaX3O+S8gh5IgZcwszBdPBMVD5BTKKSXsa
	 yHpPfNtTO5c0rAp9PTfZdE16HQR+Qs++ea5O4est3JwHxTsd/9wTWNFg4OJ68upepvo35
	 j9wS0aPPIvtaH/TBoTXKbDbwtn6ykz/z/3Omm6V/CBe+GBoTmK7Uni0YfDJlB275A1yUe
	 BNITGy0+dDualLuiRtVSnsj7P7rUgUjGJ6jk37bijXB1U+FojGi9p09ffNF2so6A9QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fusE+kuT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAE1606A31C;
	Wed, 11 Nov 2026 13:26:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=fusE+kuT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4C051F00A05;
	Wed, 11 Nov 2026 13:26:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794403574;
	bh=oWibahG2+QM42E0pwbef1XpX0UCKvPhGaW6o9ujTid4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=fusE+kuT1Ng0ykR3xMZISIR5SNUWUIbhSXbteiixscNE0XQZ/4QF+lakMcdMxFHHi
	 M1mf2UJ2QPW3x9uw5PvSrA0AiNKey2XpD3ViEAZuZxBMJECyLvyXNBuR3XNQgDseCj
	 Whk45lzZ+x8Mpy4LUpd0w/baDScc9ZMbhNDMRN84OrkG6G9Ugfr7+e1ccIwv9RNxnO
	 /8bt196Es0Cjr24URtzA0XQscyM0tSANiVymhCILjUq9OJs53Wq2zeq2Mg+H7fWrO4
	 mlxPOy3d25I6SxQYUZynbD7a5RayOrPhbilrd1qgBTVjJzpwTgPs0ciRjwaOwRlNDN
	 TalR3lpEjL2pA==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Lorenzo Stoakes <ljs@kernel.org>,
 "Liam R. Howlett" <liam@infradead.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Trevor
 Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon
 <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>, Onur =?utf-8?Q?=C3=96zkan?=
 <work@onurozkan.dev>,
 Lyude Paul <lyude@redhat.com>, linux-mm@kvack.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Subject: Re: [PATCH v5 0/4] rust: byte-wise atomic copies between `Page` and
 shared memory
In-Reply-To: <20261111093017.GX2668804@noisy.programming.kicks-ass.net>
References: <20261110-page-volatile-io-v5-0-a91ef252c24b@kernel.org>
 <20261111093017.GX2668804@noisy.programming.kicks-ass.net>
Date: Wed, 11 Nov 2026 14:26:01 +0100
Message-ID: <878q2zwlcm.fsf@t14s.mail-host-address-is-not-set>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain

Peter Zijlstra <peterz@infradead.org> writes:

> On Tue, Nov 10, 2026 at 03:44:18PM +0100, Andreas Hindborg wrote:
>> This series adds a way to copy data between a `Page` and memory that is
>> shared with actors outside the kernel, such as user space threads or
>> hardware, without introducing a data race.
>> 
>> The copy is built on `SysMem` from `kernel::io`, which already accesses
>> system memory with volatile or byte-wise atomic operations. The series
>> first makes the requirements of `SysMem` explicit by requiring freedom
>> from plain accesses for the lifetime of a view. It then adds
>> `atomic_per_byte_memcpy()`, a wrapper around the kernel's `memcpy()`
>> with explicit safety requirements, and routes the `SysMem` copies
>> through it. Finally, it adds `Page::{read,write}_bytewise_atomic`, which
>> take a `SysMem<'_, [u8]>` view of the shared buffer.
>
> I am still completely confused by this. In what universe is your magical
> atomic_per_byte_memcpy() not memcpy() ?

This Rust function is the C function `memcpy` in all known universes.
The commit message even says so.

There are safety requirements for calling the C `memcpy` from Rust. This
function makes them explicit.

If it helps, we can rename the function so that it is more clear that
this is in fact just `memcpy`. The current name was chosen to encode
some of the semantics of the function in the name.

`atomic_per_byte_memcpy` is different from the "regular" Rust memcpy
function `core::ptr::copy()`. `copre::ptr::copy()` is lowered by llvm
under the assumption of no concurrent accesses to the buffers on either
side of the operation, and so may generate code that is UB in Rust under
concurrent reads or writes. Examples of problems were given in v2.

We need a (Rust) function that can copy data from A to B in the face of
concurrent accesses without producing UB. This patch introduces such a
function, which happens to be just a call to the C `memcpy` function.
Letting every user call `bindings::memcpy` directly would also work, but
then every call site has to discover when that is OK. A Rust function
gives us one place to enumerate the safety requirements

Best regards,
Andreas Hindborg




