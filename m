Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA8F3E7179;
	Wed, 20 May 2026 11:25:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779276346; cv=none; b=VJiTNNR/IvQY49cdtvoMediQHH7gTJX6ItsoEZEWAr/M5OAjcpXe1Cl0Ot39bGMUjQ3hek61txR5xAvdx1NBWlptdmwGe1yKIIEBmZ+/Fw2KeqYlGh4eaSg259P48K5ne+KaoI0VUbP4j6xSyjf/pQwk0FsWb/U8hCilAjNUdP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779276346; c=relaxed/simple;
	bh=BsmiFAr8kKAYh7+xmxZmdGPjjZIZ9TigBFfIKYDWbI8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oLF+XcsgKIzg1qeIiwR3G7J0wjjC/NpcER/t2FIqK5UAvZotjCt2M1DWkpto6gDQH9FPJPK+q72HLN058Q6p4R3swfIzXS/y5Ewf44nwF4BchcWVo28lPTB/wXc7Xj+udNgMYcs2Z/xZY6JkNKlYEfmA8apz3tyfrR/HTQOpVcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=V7k+tR30; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="V7k+tR30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779276340;
	bh=BsmiFAr8kKAYh7+xmxZmdGPjjZIZ9TigBFfIKYDWbI8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=V7k+tR30G5GkycSThJH6a3X3xjRUcOedA1yq54F/8ZaA5CXP8psA27vZwDT0TxhBo
	 kFdDOs/wz9U++Rvk0O0lEUverP1IKK0pCyumegJ75iFM3p/pHOT83MbX5cxejxlK2J
	 ONNyaQhgCG7QFqu9pb0iQGqoRSi284q81BLjWbLElUb7oOPeotBAWEZ6Hx5VN1rtow
	 nJ+4S70u6Biezh0/KQvhXmPrm3pvuNhc9Gu0anaZUbdbXOTelce6uhhjWnkuOXWZV9
	 YWlN2ClZ7S+i1eW6VELh6+yA6EDxn0CPy+6Rp4rOVT3/ZPz2TWxwRJEKfb8mmTdFsH
	 L+R0DA/ic1Zmw==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 81AD517E040C;
	Wed, 20 May 2026 13:25:39 +0200 (CEST)
Date: Wed, 20 May 2026 13:25:37 +0200
From: Boris Brezillon <boris.brezillon@collabora.com>
To: "Danilo Krummrich" <dakr@kernel.org>
Cc: "Deborah Brouwer" <deborah.brouwer@collabora.com>,
 <aliceryhl@google.com>, <airlied@gmail.com>, <simona@ffwll.ch>,
 <daniel.almeida@collabora.com>, <acourbot@nvidia.com>,
 <apopple@nvidia.com>, <ecourtney@nvidia.com>, <lyude@redhat.com>,
 <ojeda@kernel.org>, <boqun@kernel.org>, <gary@garyguo.net>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <driver-core@lists.linux.dev>,
 <nova-gpu@lists.linux.dev>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 0/6] rust: drm: Higher-Ranked Lifetime private data
Message-ID: <20260520132537.5843f8a4@fedora>
In-Reply-To: <DING6NMJ97JA.5HC3ONKUPMW5@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
	<DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org>
	<agYbppHWXk_hW99M@um790>
	<DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org>
	<20260519205947.3c9d99b3@fedora>
	<DIMWGLNJ922I.3PCET9O1J83TS@kernel.org>
	<20260520083813.7addec83@fedora>
	<DING6NMJ97JA.5HC3ONKUPMW5@kernel.org>
Organization: Collabora
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 20 May 2026 12:55:40 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Wed May 20, 2026 at 8:38 AM CEST, Boris Brezillon wrote:
> > So, GEM allocation and GPUVM are required are required early on, and
> > both want a drm::Device of some sort (Unregistered or Registered). So
> > the question is, are you happy with having [1] applied before/after
> > your patchset to address this chicken-and-egg issue I mentioned,  
> 
> Yes, this is exactly what I had in mind for all of my replies, but I think I
> only implied my key point rather than making it explicit, so let me do that now.
> 
> What I'm saying is that we now have all DRM ioctls behind the SRCU guard, which
> means that the drm::Registration data is always available from DRM ioctls.
> 
> Now, with this precondition, the real question is whether there are any
> resources left that should be bound to the lifetime of the DRM device itself,
> which I don't think is the case.
> 
> After device unbind nothing is able to call back into the driver anymore, so
> there is no reason to keep the corresponding data alive within the driver's
> private data.
> 
> There may be resources that are kept alive through a separate reference count
> while userspace still has open file descriptors, but they are separate reference
> counts and should be independent from the driver's private data.
> 
> IWO, the fact that we guard the ioctls makes the whole class of problems go away
> that we inherit from having to keep the driver's private data alive until after
> remvoe() -- the DRM device private data becomes obsolete and we should probably
> evene remove it.
> 
> Instead, we should use the drm::Registration private data for everything.
> 
> With this, your chicken-and-egg issue is already solved; the DRM device is
> available, you can populate all the resources you need (GEM, GPUVM, etc.) and
> then pass it into drm::Registration::new().

Okay, it starts to click. So ioctls get passed the drm::Registration,
which has both a device and some driver specific data (I guess it's
even hidden behind the File abstraction). During early probe, we'd still
be able to pass an Unregistered variant of the device, and then our
current TyrDrmDeviceData would be attached to the Registration object
when Registration::new_foreign_owned() is called.

This probably imply changing the places where we currently access our
TyrDrmDeviceData through the drm::Device, but hopefully there's not
many of those cases.

> 
> In terms of making any of the resources you store in the drm::Registration data
> available in the bus device private data, it becomes the same pattern as for
> everything else, i.e. you need shared ownership.

Yep, that we can solve.

> 
> So, let's say you need IoMem<'bound> in both the drm::Registration data and in
> the bus device private data, then you currently need Arc<IoMem<'bound>> in both
> of them, which is fine, but I think we can do better.
> 
> Eventually, once we have landed the series I currently have in flight and once
> Gary finished his self-referencial support in pin-init, I think we can even
> avoid the reference count. Here is an example.
> 
> 	struct TyrPlatformDriverData<'bound> {
> 	    _device: ARef<TyrDrmDevice>,
> 	    _reg: drm::Registration<'bound, TyrDrmData<'_>>,
> 	    iomem: IoMem<'bound>,
> 	}
> 
> 	struct TyrDrmData<'bound> {
> 	    iomem: &'bound IoMem<'bound>,
> 	}
> 
> 	fn probe() -> ... {
> 	    try_pin_init!(TyrPlatformDriverData {
> 	        _device: ...,
> 		iomem <- ...,
> 		_reg <- drm::Registration::new(..., TyrDrmData { iomem: &iomem }),
> 	    })
> 	}
> 
> I don't know how the pin-init self-referencial stuff will exactly turn out, but
> this is pretty much what I hope we can evolve this into.

Yep, makes sense.

> 
> (And sorry again, now that I spelled this all out, having that left implicit in
> my first reply was obviously unreasonable. :)

No worries, that's the usual back-and-forth happening during reviews,
and it's all fine.

> 
> > or are you proposing something else (Option<Subcomponent> so that we start
> > with all sub-components set to None and progressively populate those, which I
> > remember Daniel was strongly opposed to)?  
> 
> No, I am strongly opposed to do that (as well).

Got it.
