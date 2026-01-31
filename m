Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DC024729A;
	Sat, 31 Jan 2026 12:27:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769862433; cv=none; b=IPZW5m/0Jvo9+8xuGzB3bAEF8rdBdDQWHswdFq+3X8XiGdETzUtJGgKC46S8yzrHYX3wPiy+XCiJOuR9iqTNP3t+ZrdQ4iMgaFOx3MbfPPM4rQ+ILvD8hxtmeIKOuYpL53aGSA9osguvf6ChKuvb1mv4H6McCmmyE0arsIzV7nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769862433; c=relaxed/simple;
	bh=2fTkhAUP5p8/EG0o4I2HX5HD4RSHs9zkMP98Fcb/6XM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=rWloAdGrNZFWJOWXcfnjZ1asuno7tWdzv+jq4MWDxeAws/3hbFM4f0i8V1lNnA8Ier0ZucPlyi4ap/QF3W1l6WOuterNo4poI4T9gVj8dQHKHDDrCdYHxa7aV0VakE3TZXPTjdalyBBUM8SJ8hNu4Ux16rEvNX9PXQST6q4tRzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EHJeQ0It; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EHJeQ0It"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5D5EFC19421;
	Sat, 31 Jan 2026 12:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769862432;
	bh=2fTkhAUP5p8/EG0o4I2HX5HD4RSHs9zkMP98Fcb/6XM=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To:From;
	b=EHJeQ0ItVPSJjv4Jmi+vbS4l02KXRVHbuPygJkkFwtXr/bXADaVsDAgBcvTjog/zi
	 MnL0byblG1dhDo4GmZ4xiinVA3SW+Qq7nXDPipRavAjiim9Kg9JShwQRWcgnYhSK1x
	 HoHqWiXSdA2DLJJDPqmxxueUORw6vAKKrXnOQz/XeMHrrVQgcKFgtttGg5CZUyTMa6
	 +sDqrpjbbST5XynxHPuh+5/Tcf2bu6Rr6Crxoawt/tCrm5bSGeN0tB79mM7p75qS4J
	 VbuKNHuo7vffsGmjuY8XNP8uIGsNk/odg6PPIRoutntFMOUb/5pTU2mpy8raWq2/iK
	 +/caWR1/xwcpw==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 31 Jan 2026 13:27:06 +0100
Message-Id: <DG2RVAALGX4W.1L637C8NXXEEM@kernel.org>
To: "Eliot Courtney" <ecourtney@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH 0/9] rust: dma: add CoherentArray for compile-time sized
 allocations
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Alice Ryhl"
 <aliceryhl@google.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Abdiel Janulgue" <abdiel.janulgue@gmail.com>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Robin Murphy"
 <robin.murphy@arm.com>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Trevor
 Gross" <tmgross@umich.edu>, <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com>

(Cc: Lyude)

On Fri Jan 30, 2026 at 9:34 AM CET, Eliot Courtney wrote:
> This series extends the DMA coherent allocation API to support compile-ti=
me
> known sizes. This lets bounds checking to be moved from runtime to build
> time, which is useful to avoid runtime panics from index typos. It also
> removes the need for a Result return type in some places.
>
> The compile time size is specified via a marker type: StaticSize<N>.
> Statically sized allocations can decay to runtime sized ones via deref
> coercion for code that doesn't need to know the size at compile time, or =
to
> avoid having to carry around extra type parameters. The implementation
> follows a similar pattern to Device/DeviceContext.
>
> The series defines three type aliases: CoherentSlice<T> (for runtime size=
),
> CoherentArray<T, N> (for compile-time size N), and CoherentObject<T> (for
> single object allocations). It also adds infallible dma_read!/dma_write!
> macros and methods to CoherentArray, while prefixing the existing fallibl=
e
> methods and macros with `try_`.
>
> The macros keep the same syntax (i.e.
> coherent_allocation[index].optional_fields =3D expression) even for
> CoherentObject, because the [] syntax is needed to know where to split th=
e
> actual CoherentAllocation object from the fields. This means that
> CoherentObject is indexed with [0] in dma_write!/dma_read! macros. The
> alternative is defining a separate macro for single object access, but it
> still would need a way to delineate between the allocation and the fields=
,
> perhaps by using commas (dma_read_obj!(object, fields),
> dma_write_obj!(object, fields, value)). This would be inconsistent with t=
he
> array/slice syntax.

We've just generalized I/O to support arbitrary I/O backends (busses, backi=
ng
storage, etc.).

With this we can wire up the I/O traits to DMA and generalize the dma_read(=
) and
dma_write() macros accordingly. I.e. we can extend the I/O traits with
field_write() and field_read().

(Lyude is going to work on this as a more integrated alternative to iosys_m=
ap.
It would be good to align with her regarding this work.)

This has the advantage that we don't have to duplicate all this infrastruct=
ure
for I/O memory, DMA, etc.

I also think that CoherentSlice is too specific of a type. I'd rather have =
a
generic type, maybe UnsafeSlice or IoSlice, that just uses the I/O backend =
for
accesses.
