Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795041955;
	b=Nqrg1eDl7TV0N9T9+Ofg98rxgzThbmoWja+9UTBENOUlVpovoPZKcfcEkgwtI2i3K90S
	 n9NY6KkkFGmLnyT+q+/u5tdeE+L/XNKXFZw8/A/ljYixqx88VkyhoiEa9iSLGI5Ikbi+W
	 QZ8OIimDE9327TZ9wdslD+x+5OzcV8LwO1rcVx0Q97PgdhSpilPcgVTWolKF9u/atDR8D
	 i7eujbrQypmkFMzFG0XlC/IZ3NX0NLhh2vodTKHBgpCDXPJX7oXBLvtZ6KqaZjev3Lszp
	 28IeEjRommdJkIXlOdwHac8p2j6wdyFmD4qWnJrpsQMlFJrYU1Lao/2Nd5Np309qSGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795041955;
	h=Received:DKIM-Signature:Mime-Version:Content-Transfer-Encoding:
	 Content-Type:Date:Message-Id:Subject:Cc:To:From:References:
	 In-Reply-To;
	bh=BYk/c0gsLCrf5jVqJaRR5xbeOm4kW9crjwwPAlxYeHQ=;
	b=5lURVk5uebIs9w5T7vc5K1RjUemdvW6LPUQKdALVLnv1+uCcsRxXPymoEtqaHLxE8BrI
	 JEx95uAlRE8Ct3bIa8dzrnNx4/LOvrorAhoWQB5WSsel3gBAyEm9GJLWdoIldndVMkBzS
	 kb+m6GtatjR1vv44v950Naes5mjaXyF/gTyuM8VkYfnUxyadXYrPhU3dKeeOMj09/E2l9
	 ch0uEXbgUGJspL7iG9mHlknlllloUoeUWdS5a4W8ai7Rvfpdia2g6FJxz6cdcjyuwU8tq
	 Wc6y8UHwwMi2Uiw/0I5wvZFoNeToBKdZzmL9dyW7sqdaA0W4LQDVbfAeLUw0G7Vc8wA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OT4R3ech;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F172A606A320;
	Wed, 18 Nov 2026 22:45:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=OT4R3ech
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C2331F000C4;
	Wed, 18 Nov 2026 22:45:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795041954;
	bh=BYk/c0gsLCrf5jVqJaRR5xbeOm4kW9crjwwPAlxYeHQ=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=OT4R3echz20YrVaDz2cGiE48b9X9zbzL9vkrT+mAkViLCRjJgi7IfPWvL5ItLyaoc
	 /hHi40GLVuT1bfxoSz6NWJRxulAw9mp+uboI7Jc9PjHuAeUIdpyH9WaHaxa+VFjjs1
	 RnsPa/PNx4Kr7sE9wmF2mQlH60p6iYJiNCOAyfAuYeD5fKAgUD3HANf4J8TGJS1mUO
	 YOJWm7GQJvwMbcAs/zf1iIpXjswNwRwGlm2Q3cg3pt3y/7KdS6tyU6JwxQlOKWEqvc
	 JZTnJqvu2adHU+OxVkB6RuaQGOIFgBia/l7Ad58h7Q5u/UgoxMpzrXih0Ins4QTJwq
	 CbJscQixm7CpQ==
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
Date: Wed, 18 Nov 2026 23:45:49 +0100
Message-Id: <DMYP9JMEAF53.13MHUJHT7J420@kernel.org>
Subject: Re: [PATCH 1/2] rust: scatterlist: tie owned tables to the device's
 bound lifetime
Cc: <aliceryhl@google.com>, <abdiel.janulgue@gmail.com>,
 <daniel.almeida@collabora.com>, <robin.murphy@arm.com>,
 <a.hindborg@kernel.org>, <ojeda@kernel.org>, <boqun@kernel.org>,
 <gary@garyguo.net>, <bjorn3_gh@protonmail.com>, <lossin@kernel.org>,
 <tmgross@umich.edu>, <tamird@kernel.org>, <work@onurozkan.dev>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20261114234324.82387-1-dakr@kernel.org>
 <DMWC45NN5L9I.2NUG81ETBC84L@nvidia.com>
In-Reply-To: <DMWC45NN5L9I.2NUG81ETBC84L@nvidia.com>

On Mon Nov 16, 2026 at 5:02 AM CET, Alexandre Courbot wrote:
> The `RawSGTable` documentation still mentions `Owned`. We could adapt it
> or (maybe better) just drop that sentence.

[...]

> `sgt` is removed by this patch.

diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 93f431d7f548..22d039f3fdb1 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -214,9 +214,6 @@ fn drop(&mut self) {
 }

 /// A transparent wrapper around a `struct sg_table`.
-///
-/// While we could also create the `struct sg_table` in the constructor of=
 [`Owned`], we can't tear
-/// down the `struct sg_table` in [`Owned::drop`]; the drop order in [`Own=
ed`] matters.
 #[repr(transparent)]
 struct RawSGTable(Opaque<bindings::sg_table>);

@@ -282,7 +279,6 @@ fn drop(&mut self) {
 /// A [`SGTable<Owned>`] signifies that the [`SGTable`] owns all associate=
d resources:
 ///
 /// - The backing memory pages.
-/// - The `struct sg_table` allocation (`sgt`).
 /// - The DMA mapping, released before the table and backing pages are fre=
ed.
 ///
 /// Users interact with this type through the [`SGTable`] handle and do no=
t need to manage
