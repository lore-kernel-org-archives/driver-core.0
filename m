Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEF9C1D435F
	for <driver-core@lists.linux.dev>; Wed,  4 Mar 2026 16:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772642757; cv=none; b=lMbhbwqG3nBw84smyWFLGMHasUroFT3afxRv0mshvn0vtlvnMaRLXfO2NfUyA/NwLKToAAohxDqhZSYBFkVlKgzhd4Mp/VvPplig1amBNmrrchWaTlO9QMFFxgXsyu3qG8Fk45Yjj2MoKv8PXvaJdxAfkWqmNLiIyvsjpNzGUGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772642757; c=relaxed/simple;
	bh=6pAgg7PwRmYTS9sfT7RMwokWO0KOx6td5LNtCpZdbfA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=skiAfq+EsDZbuqKBcJ2eh7p9lXHUnrdWht2eolqxoXCy0w2q/476Ssy83Mc8OYlLuX9fDgN95m6SF5nuejw4rUwrUX1PRwzXvyM5pzo0kPt6IE1dF4f45i28tlo2QX8mG9oY6pzfkOuGCsGfNMlZ1oqAO2QoR95cgvQLPbwh8D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=PzhtVEki; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="PzhtVEki"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-899fbf92bdbso49291256d6.0
        for <driver-core@lists.linux.dev>; Wed, 04 Mar 2026 08:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772642753; x=1773247553; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Q6mBd5S5w+Qyk+kaNVLUq/NDaIG3PNFY6vyWjAmF/Cg=;
        b=PzhtVEki55OrSraWieegGzja30FOysUk015yF/EhRfPZwT+X/vN+AGqzx4iY1zIpdm
         q7UJ79JEL9dVPqXp5kw1SlZ8Qk1On1ZXzhRJwD6fK7GFA/teQL0/K5JoQTrQl9TIM5BE
         U5AC0ZpqHwVNJOXTEYlsoth/PK8aDzMK9uBhfPw6VkTxhMzQ6/ZUiwHHOtVOZ+3ubXyG
         DjfBRuUmWQU2faoCtCqSLQNeCwAotXBJkxZbCGzOf325uESz7H1BnGO+3bBedBaJ82vi
         9k43vghl3QVvlBH6gCGSlIUtytzQFXXA2PX6ej4QfU/Z1u/oXqSFQxO2GhqktaGqkv7B
         wz3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772642753; x=1773247553;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Q6mBd5S5w+Qyk+kaNVLUq/NDaIG3PNFY6vyWjAmF/Cg=;
        b=FIC585tPbXbcHg2OCqZJTjmYzcqaLu76Ni7j5Gtcc+jwZwdYZdUtMGYzbR8ZhxWTqM
         5Zr2glelKIZUxLfsW7N5HOOIYoXgpQCjjP5duIWEwPD3e+Uov550vkaY9mO/9AouicJa
         z75HAF7oZH+/xfejUMRjlN/J2Qal2+2RB9khK0vURUQk55RsNWScbHuieJfP7jKJ+f9k
         8EH3ycqj4t/2LHmEGgk263BuTbHOWrJHYpr+ho9L9OyvjM0oae6uIP86kU47GqZ0Fl/g
         LUOV6J6UAZ5WgS8QMhpzvqh+KmyR8pG5VrNRk/u4JXClpaUL6lcS+FHAxcyz69U8vj0s
         JX8A==
X-Forwarded-Encrypted: i=1; AJvYcCUQR9k2Kq0FP9AJfBEPb4OSuIJK5i4nwQH+V8K4cUqLSlQvD2ssK55DJqtHyRNEMI/CHCJq5Scxx+L6Bw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2OVC6Y+KdYEb6YQDXvbNLplivKqh5UufM+oIn0mhiLUeaEteu
	AFuiOwgMduxkEZ6ij5yP1a/3/OQo+LzqYv+OeQiJXdXdaGBdu7nXHA4e2bpbKuF5nSE=
X-Gm-Gg: ATEYQzzN5jqQ5kwVZkepr7W1s+PQyv/MS54v8tDdNfASVo2Iow12Q3VJlEjpPiXm87U
	9iTxaqCc+Qkz9pQSyNCfW7oXW2vVamsWYbpIWnl2aCHAoDHT3hngdu2GEhqrw4yxtgm2Gs8lpN5
	bEHV29gfDJYhZOrRFCzwcAOHuRT5u8O6JjZ6DLke9KE0ls4nVAUpmWcu55uYbT+TryLI2tdlJ1S
	92zjZFfTiiMMvNJR1WSAmceRaH3smltT5BlKn4RZv3nTv8na9bmt0c4dcXI1Ll2d3OhV3oNnM2a
	TEyZwk+UI6aFk8M5kMK+QwHa9H1Mw/k2oqOtHQYKQSOrxWf5N5aImAsuva0C5tma4RfgnrNhJDQ
	PYNc87xI+LC4lLIsNon1rw6vqxSuFTrIkbdTpM2zx0fuEzB7fkUS2lm9Vb3Wp6ojfjzYRBieeJI
	G2YHF2HM938ltc/q5p14bmmTs6sbbmHf6AtAiFIle8y//ibUU4LM4xlfjUlGuekX9lDIAHPGRr/
	RzINdJgHQ8dC3beIWA=
X-Received: by 2002:a05:6214:cc6:b0:899:f2af:bd85 with SMTP id 6a1803df08f44-89a19ce9729mr37872326d6.45.1772642752542;
        Wed, 04 Mar 2026 08:45:52 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-899fdf30e99sm69421516d6.3.2026.03.04.08.45.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 08:45:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxpM7-00000005CBf-1l90;
	Wed, 04 Mar 2026 12:45:51 -0400
Date: Wed, 4 Mar 2026 12:45:51 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Peter Colberg <pcolberg@redhat.com>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>,
	Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>,
	Moritz Fischer <mdf@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Boqun Feng <boqun@kernel.org>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH v3 00/10] rust: pci: add abstractions for SR-IOV
 capability
Message-ID: <20260304164551.GG964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
 <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304162711.GI12611@unreal>

On Wed, Mar 04, 2026 at 06:27:11PM +0200, Leon Romanovsky wrote:
> On Wed, Mar 04, 2026 at 03:57:57PM +0100, Danilo Krummrich wrote:
> > On Wed Mar 4, 2026 at 3:26 PM CET, Leon Romanovsky wrote:
> > > On Wed, Mar 04, 2026 at 10:18:52AM -0400, Jason Gunthorpe wrote:
> > >> On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> > >> > On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > >> > > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > >> > > capability of a PCI device. Provide a minimal set of wrappers for the
> > >> > > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > >> > > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> > >> > 
> > >> > <...>
> > >> > 
> > >> > > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > >> > > into by setting the flag managed_sriov in the pci_driver structure. For
> > >> > > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> > >> > 
> > >> > Why? Could you explain the rationale behind this difference between C and
> > >> > Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> > >> > for a practical and well‑established reason: maximizing hardware
> > >> > utilization.
> > >> 
> > >> Personally I think drivers doing this are wrong. That such a driver
> > >> bug was allowed to become UAPI is pretty bad. The rust approach is
> > >> better.
> > >
> > > We already had this discussion. I see this as a perfectly valid
> > > use-case.
> > 
> > Can you remind about a specific use-case for this please? (Ideally, one that
> > can't be solved otherwise.)
> 
> You create X VFs through sriov_configure, unbind PF, bind it to vfio
> instead and forward (X + 1) functions to different VMs.

No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
will blow up the half baked SRIOV and break everything.

VFIO already has its own sriov_config support, the right flow is to
bind the PF to VFIO and then enable sriov and do your assignments.

Jason
