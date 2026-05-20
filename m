Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B192DF717;
	Wed, 20 May 2026 06:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779259102; cv=none; b=ISP60EnKur6w/7xhgixPHrEoHIzQjVNNKO2hF1WNk4y6dbWdid3A0y0fLriOTz6ooASpr0NQgS4KCFcbM8eh1PynyMRnbzd3ObQhIwUYRZtbduddQnlDxgpgHrqHTC+YrbmAAJ5hmc3mDBqo5lNuvZ0URNFY6c677TsVECI2TZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779259102; c=relaxed/simple;
	bh=5/0w95zT8qqc5wrj4w7eoqfoe/TewRnWkweqFYLCcvU=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=GyY98R2yiKvsWPrf1Gx8Vu4PSbs3Fh9eHB1WOV8qOE8KN9hWbmqCdvV6cF+aMbUm0Tm3RB1CfVy3ZhHaDS+9LinnQ07IVzll3xzvJfdleaETwHQ7H/q5vR4M5TcfjZr5YCTfdN7irsowXMG12C0E9hR3WqUG9W5M3wYOd53zAXw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=najsP0gI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="najsP0gI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779259099;
	bh=5/0w95zT8qqc5wrj4w7eoqfoe/TewRnWkweqFYLCcvU=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=najsP0gIbKnp9RTVVKkSEUmm0+NaIs7t7Va0y1UgYoLC/+/Ukj/MN2cnMT7DXz0d5
	 4vN0GdbUza8rXpkdH7CKb93SoK2a6wAiIKtguyywDBWpEit3IsBdjEZzjoOrBiGDST
	 3ZX5FBS/Ls5pl6IRN9HoXq5GMmOmOq7TxBLRQdDrzV5JrNfnYEJqKAPgywVfXyDBQq
	 Y90Tg3hR9eOms5ILHB2YtKGCTLfGITliI2ffF1vERRNXIj78aoVkNSwfIaXDH5WIlv
	 YgAevaWQdqM/IY/v+5QfRPzwesoAJa5MF+F/Afsvn0iLdmoIWN8y7kHz8WnJr0dnd3
	 WaH/avzLxzX5g==
Received: from fedora (unknown [100.64.0.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bbrezillon)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A2F0717E0698;
	Wed, 20 May 2026 08:38:18 +0200 (CEST)
Date: Wed, 20 May 2026 08:38:13 +0200
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
Message-ID: <20260520083813.7addec83@fedora>
In-Reply-To: <DIMWGLNJ922I.3PCET9O1J83TS@kernel.org>
References: <20260506221027.858481-1-dakr@kernel.org>
	<DICCEKZ3HU84.34ES3SW3D1FNI@kernel.org>
	<agYbppHWXk_hW99M@um790>
	<DIIMVPTLV3O5.3Q3DHU66WQZUA@kernel.org>
	<20260519205947.3c9d99b3@fedora>
	<DIMWGLNJ922I.3PCET9O1J83TS@kernel.org>
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

On Tue, 19 May 2026 21:28:17 +0200
"Danilo Krummrich" <dakr@kernel.org> wrote:

> On Tue May 19, 2026 at 8:59 PM CEST, Boris Brezillon wrote:
> > On Thu, 14 May 2026 21:07:11 +0200
> > "Danilo Krummrich" <dakr@kernel.org> wrote:
> >  
> >> On Thu May 14, 2026 at 8:59 PM CEST, Deborah Brouwer wrote:  
> >> > let unreg_dev = drm::UnregisteredDevice::<TyrDrmDriver>::new(pdev, data)?;    
> >> 
> >> You shouldn't need this anymore as the drm::Registration itself has private data
> >> now that is bound to the lifetime of the underlying bus device, which should be
> >> the correct lifetime for juggling the GPU page tables.  
> >
> > The problem we have is that, to initialize some of the sub-components
> > of the driver, we need to be able to allocate GEM objects before the DRM
> > device is exposed (registered), and because the data we want to attach
> > to the final registration contains these sub-components, we need to
> > defer the data assignment to the registration step (which was allowed
> > by [1], but apparently this was dropped from the latest version of
> > the series for some reason).  
> 
> I'm perfectly aware, what I'm saying above is that you probably want to store
> those GEM objects (that you can create with the previously allocated
> drm::Device) in the drm::Registration data. This fulfills this requirement *and*
> ties the lifetime of those GEM objects to the lifetime of the underlying bus
> device being bound to the driver, which is exactly what you want for GEM objects
> that contain the device page tables.

Yeah, I don't think the problem Deborah was mentioning was about not
being able to allocate GEMs early on, or making sure those GEMs don't
outlive the bus-device. Oh, and BTW, we don't use GEMs for the page
tables themselves, those still go through regular page allocation and
are entirely handled by the io-pgtable-arm.c logic. We need early GEM
allocation to populate FW sections, and to map those to the VM attached
to the FW we need GPUVM too (because the FW also lives behind the GPU
MMU and has its own page table that's populated by the driver).

What I think Deborah was pointing out is the chicken-and-egg issue,
where the registration data is only fully populated after all
sub-components of the drivers have been initialized, and one of these
sub-components (the FW) needs to allocate GEMs and map them to its VM.
So, GEM allocation and GPUVM are required are required early on, and
both want a drm::Device of some sort (Unregistered or Registered). So
the question is, are you happy with having [1] applied before/after
your patchset to address this chicken-and-egg issue I mentioned, or are
you proposing something else (Option<Subcomponent> so that we start
with all sub-components set to None and progressively populate those,
which I remember Daniel was strongly opposed to)?

[1]https://lore.kernel.org/dri-devel/20260320233645.950190-4-lyude@redhat.com/  
