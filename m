Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9116288C2C
	for <driver-core@lists.linux.dev>; Sat, 26 Sep 2026 00:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790382356; cv=pass; b=G8sTubg6BDI17AvjfxHGoiUN2Uxdxrqg93hAkn0wkE94upzs+cL9mv0DytQw4coWU1TycO1NPkvPX42SkrPdPjGy5+AigrE4jSrUlaIrjpUpDqnAa4v6UbjXPCUdyy0t2XRcrxv5CKZZoihqHjTLnwZk+dJYXM4olwcQqfAiXiw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790382356; c=relaxed/simple;
	bh=stBv6XxR4bS5JeDhKyV2gpw1nW9PIFIyMTfo2TZqiWg=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=EwFP8fZ4B0BR3G6oplYB0oSQxdI5iaOMKDJcvaIUIm33ck2TNS/dIRqqUYrynsTh92c60HF0rrQHXH99b7ca7dE51+yJiU8FCXLRCdIDEABWNjZHdazopBsrWf4I2fl9h3OCEgf8elJeGN/Fc9CwiwqwnE5o0gYz0RyIO2ZUB+Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=P027i1jn; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="P027i1jn"
ARC-Seal: i=1; a=rsa-sha256; t=1790382318; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lGxavf0Ur42rP5a420MNWR/7lt+nRaQokJGLu95xmqYvBTTd5b1dzp6B7JlslFifGnflRl9rbV19EjsGfU52nsa+O0/0Uw17yOcwoKuGaEazmLIFsgkHkqOUuQvHoRDOUqEJ0+danY504Zg+rzTXu0Oxs106enYM0fx+2fjAsfw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790382318; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VE5Wf5825e0haFEm5+skLcLxZ4CTyshP5h2MRJRTVwU=; 
	b=hbfyJ+rJFim6qNhPyAtCUbVp6xUs0sjgnzeWENneZ4BeDLHYX3CkmRzbjBR5ratXIxSh4aSxgJCIlWbcLFRym2gqYXcRq9udxaNkOwbv8ZianrT2Hrniysa/OZcw2e1F8a2rV25Ebk/Vsgbw6FBNCbdK4/PHdc+dQWrG5QijYjI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790382318;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=VE5Wf5825e0haFEm5+skLcLxZ4CTyshP5h2MRJRTVwU=;
	b=P027i1jnQ5V+kG9pgzaSvKDu/u8qE3YQTiQfZXkANKNTnne7U4EZ6zhv9lPtPEkA
	o8NLHKGCG9gyIBk0HHEFnf9o84annhR49FQfml3hZbyr4tPzH0+Qxt+pu3Jp9TAYt59
	2ypfErNFAhLpqgSejm0icsLGn/U1TuBsViglLvGM=
Received: by smtp.zohomail.com with SMTPS id 1790382317563773.78645222011;
	Fri, 25 Sep 2026 17:25:17 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH 6/9] drm/tyr: add CSF firmware interface support
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260915-tyr-interfaces-v1-6-5d28f1f75aca@collabora.com>
Date: Fri, 25 Sep 2026 21:24:56 -0300
Cc: Danilo Krummrich <dakr@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>,
 David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>,
 Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 FUJITA Tomonori <fujita.tomonori@gmail.com>,
 Frederic Weisbecker <frederic@kernel.org>,
 Lyude Paul <lyude@redhat.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Anna-Maria Behnsen <anna-maria@linutronix.de>,
 John Stultz <jstultz@google.com>,
 Stephen Boyd <sboyd@kernel.org>,
 dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev,
 rust-for-linux@vger.kernel.org,
 kernel@collabora.com,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Deborah Brouwer <deborah.brouwer@collabora.com>
Content-Transfer-Encoding: quoted-printable
Message-Id: <B97A2808-7C25-4098-A88E-54FD5BB305A1@collabora.com>
References: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com>
 <20260915-tyr-interfaces-v1-6-5d28f1f75aca@collabora.com>
To: Laura Nao <laura.nao@collabora.com>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Hi Laura,

I've left a few comments inline, plus a request to split this patch at =
the
end. I'll get back to you on the versioning parts next week.

>
> +/// Maximum number of CSG interfaces supported by hardware.
> +const MAX_CSG: usize =3D 16;
> +
> +/// Maximum number of CS interfaces supported by hardware.
> +const MAX_CS: usize =3D 16;

Panthor allows up to 31 CSGs and 32 CSs per CSG (see MAX_CSGS and
MAX_CS_PER_CSG in panthor_fw.h). With 16/16 here, we fail to probe on
firmware that panthor accepts. Can we match panthor here?

nit: both counts come from the firmware (GLB_GROUP_NUM and
GROUP_STREAM_NUM), so "supported by hardware" is a bit misleading.

>      /// List of firmware sections.
> -    #[expect(dead_code)]
>      sections: KVec<Section<'drm>>,
> +
> +    /// The global FW interface.
> +    #[pin]
> +    global_iface: Mutex<FwIfaces<'drm>>,
>  }

The CSGs are not part of the global interface, and a single mutex over
everything means that all CSG operations get serialized behind GLB. Can
we split this? Leaving the versioning aside, something like:

pub(super) struct Ifaces<'mem> {
  glb: Pin<KBox<Mutex<GlbInterface<'mem>>>>,
  csgs: Pin<KBox<[CsgSlot<'mem>]>>, // one lock per CSG
}

#[pin_data]
pub(super) struct CsgSlot<'mem> {
  #[pin]
  iface: Mutex<CsgInterface<'mem>>,
}

i.e.: one lock for GLB and one per CSG, with the CS interfaces inside
their CSG. You can build the slots in place with KBox::pin_slice():

  KBox::pin_slice(
      |csg_idx| {
          pin_init_scope(move || {
              let iface =3D CsgInterface::new(mem, csg_idx, =
csg_stride)?;

              Ok(try_pin_init!(CsgSlot {
                  iface <- new_mutex!(iface),
              }))
          })
      },
      csg_num as usize,
      GFP_KERNEL,
  )

With the split I suggested in 4/9, the views borrow the McuMappedBo
instead of holding an Arc to it, so the McuMappedBo should live next to
them in Firmware. This means that the shared section moves out of
`sections`.

Now, a field can't borrow another field of the same struct in safe Rust,
and pin-init doesn't support self-referential structs yet (Gary is =
working
on it). Until then, I think we should do what nova-core does in
88b70f5a05af ("gpu: nova-core: use lifetime for Bar"), i.e.: take the
reference with core::ptr::from_ref() in a single place, and justify it
with a SAFETY comment:

#[pin_data(PinnedDrop)]
pub(crate) struct Firmware<'drm> {
  ...
  /// Firmware sections other than the CSF shared section.
  sections: KVec<Section<'drm>>,

  // The interface views borrow `shared`, so `ifaces` is declared before =
it,
  // i.e. dropped before it. See `Firmware::new()`.
  ifaces: Ifaces<'drm>,

  #[pin]
  shared: McuMappedBo<'drm>,

  /// Raw payload of the shared section, for reset purposes.
  shared_data: KVec<u8>,
}

and in Firmware::new(), perhaps something like this:

  try_pin_init!(Firmware {
      ...
      shared <- shared,
      shared_data,
      // TODO: Make `ifaces` borrow `shared` through `#[pin_data]` once
      // pin-init supports self-referential structs, and drop the =
unsafe.
      ifaces: {
          // SAFETY: `shared` is structurally pinned, so it has a stable
          // address. The reference is only stored in the views inside
          // `ifaces`, which is declared before `shared` and therefore
          // dropped first, and the interface types keep their views
          // private, so no reference with this lifetime escapes.
          let shared: &'drm McuMappedBo<'drm> =3D
              unsafe { &*core::ptr::from_ref(&*shared) };

          // `PinnedDrop` does not run for a partially initialized
          // `Firmware`, so stop the MCU on failure before its sections
          // are freed.
          Self::boot(dev, iomem)
              .and_then(|()| Ifaces::new(shared))
              .inspect_err(|_| {
                  let _ =3D Self::stop(dev, iomem);
                  vm.kill();
              })?
      },
  })

Note that boot() and stop() have to take dev and the iomem instead of
&self, so that both the initializer and PinnedDrop can call them.

The key here is the field order. Fields are dropped in declaration =
order,
so if someone ever swaps `ifaces` and `shared`, the McuMappedBo gets =
freed
before the views that borrow it, and nothing catches that at build time.
So please keep that comment on `ifaces` :)

Once pin-init supports self-referential structs, the unsafe block goes
away and the compiler checks the field order for us, or at least that is =
what I
understood from Gary's most recent talk anyway.

>          gpu_info: &GpuInfo,
> -    ) -> Result<Firmware<'drm>> {
> +    ) -> Result<Arc<Firmware<'drm>>> {

Nothing clones this Arc. In fact, I don't think we need a separate
allocation at all: TyrDrmRegistrationData is already pinned, so Firmware
can be a pinned field there and get built in place. Gary is also (very =
helpfully)
on a crusade to remove all Arcs he can from Tyr, so lets not add more if
we can help it. (Thanks, Gary!)

> +            // SAFETY: `ptr` is a projection of `view.as_ptr()` by
> +            // `cpu_offset()` bytes. Per `MappedBoView`'s invariants =
the
> +            // window lies within the CPU mapping and the mapping =
covers
> +            // `size_of::<B>()` bytes from its start (the =
resolve-time
> +            // `reach`), so the typed view's full extent is valid; =
per
> +            // `FwInterface::new()` the window holds the =
architectural block
> +            // at `align_of::<B>()` alignment, and every field access =
stays
> +            // within it.
> +            unsafe { SysMemBackend::project_view(view, ptr) }

Once the view stores reach (see 4/9), FwInterface::new() and
FwInterfaceMut::new() can check it:

    if view.reach() < core::mem::size_of::<B>() as u64 {
        return Err(EINVAL);
    }

and this comment can then just point at that check.

> +/// State of the global interface.
> +enum GlobalInterfaceState<'drm> {
> +    /// Interface is not yet initialized.
> +    Disabled,

Once the interfaces are built in Firmware's initializer, I don't think =
we need
the Disabled variant anymore, neither here nor in CsgInterfaceState.  =
The views
don't change across a reset or suspend, so once built, they can live for =
as
long as Firmware does.

Although they do not change, they do become unusable when resetting =
though, so
how exactly we should do this is up for debate. Can you investigate a =
bit and
propose something? We would really like to get rid of places where we =
have
enums, checks and Options introduced, specially when these infect =
everything
else :/


> +        // Validate the CSG number reported.
> +        if csg_num as usize > super::MAX_CSG {

Panthor also rejects too few, i.e.: group_num < 3 (MIN_CSGS) here, and
stream_num < 8 (MIN_CS_PER_CSG) in the CSG path. As is, a firmware that
reports 0 CSGs makes enable() succeed with no CSGs at all.

Panthor also checks that every CSG matches the first one (see
compare_csg()), and that every CS matches the first CS, and fails probe
otherwise. Can we do the same here?

> +        let csg_control_offset =3D CSG_GROUP_CONTROL_OFFSET + csg_idx =
* csg_stride;

^ checked_mul() and checked_add() =20


By the way, this patch is about 2.8k lines, and it mixes three different =
kinds
of things: the iface_layout! macro, the register layouts themselves, and =
the
interface themselves, plus more. Can we split it?  I think something =
along
these lines would work:

1) GLB block layouts: iface_layout!, the GLB registers and blocks, and
   the GLB enums.
2) GLB interface support: FwInterface/FwInterfaceMut, GlbInterface and
   the Firmware changes above.
3) CSG block layouts and the CSG enums.
4) CS block layouts and the CS enums.
5) CSG/CS discovery: CsgInterface, CsInterface and the per-CSG locks.

You can use #[expect(dead_code)] for anything that doesn't have a user
yet, and drop it in the patch that adds the user. This should keep =
everything
<=3D 750ish lines I suppose. Some things gain a quick r-b too, like the =
stuff in
blocks.rs, which is basically a datasheet copy.

Lastly, Onur's reset series [0] should land first, so this will need a
rebase on top of it (after the Job IRQ series). After that, the =
registers
are only reachable through HwGate, and I think the interfaces should =
live
behind the gate as well, so that a reset waits for anyone using them. =
The
lock order would then be the gate first, then the GLB/CSG locks.

Again, as I said, we will tackle versioning separately, because there's =
quite a
lot to discuss between all of us there. But ideally I'd like to keep it =
as a
separate patch and towards the end of the series so we don't build any
dependencies on this idea and can drop it relatively pain-free if it's =
not
well-received.

=E2=80=94 Daniel

[0] =
https://lore.kernel.org/r/20260912-tyr-reset-impl-v7-0-077ce72084eb@onuroz=
kan.dev=
