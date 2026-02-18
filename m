Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82F4239E75
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 02:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771380234; cv=none; b=TiNgivno7+FN1xfkVK11hIWJbhmZc5aiRad2N7ljSu69fXwWHyrW6lqkhgACBNdks9E+WavSSyu6vC0vq0ATPazQlmoq0oaXVqeTM7TQNxUpTy8VglLCpMsIzT+M6+xqgEYbdMC9+kD5PCXrRwGxkiqas3wyjz4sBLNv6PGGEx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771380234; c=relaxed/simple;
	bh=PUEtUvlnxfRwbku097xynciK1P/oSr9Kiu2SbUO2/mA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Ir+wj6hGj8K7kX+eUHOdNBOeA1+pkdtQrZ6AMMa7ZG7TajaOcidqTdzjajK0F42RzJRql+qyLb2oC4h7hgbPujy66K2FaM2g88NynDzd/oOZ7iZeRDy4YXE8om3xXmIk2fOlabR7Gzxl5mwpdau8YGmhwOejhU3tdk39FfNWVIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R73iIZQN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R73iIZQN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771380232;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
	b=R73iIZQNFuwW0gReXiCntsc5CjhZkfg4EPN1dw1iuyx9WyqDGde4FMDCcL7GeGNO2Q7qp9
	4ofjbeGquk5FwsL1qKpeUYNxXyHFtyXVp3DIG4zPb4wzBk5RYZPnig0s94X2d3Z30bf7iN
	ehIgdVZkfl+yOhU5BaHvJmVl6PZvQWg=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-81-Vhhu7TV5NHe8dCJa6tZO0g-1; Tue, 17 Feb 2026 21:03:50 -0500
X-MC-Unique: Vhhu7TV5NHe8dCJa6tZO0g-1
X-Mimecast-MFC-AGG-ID: Vhhu7TV5NHe8dCJa6tZO0g_1771380230
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-896f84e69b6so726246966d6.0
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 18:03:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771380229; x=1771985029;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=o4cHvKSBZESAOv4yzpaqvORLgvpDRThGyDvq3HOoF2s=;
        b=IH+SmfHcUH1PMPzbqaTXbYjLEqWh1834cT+9DYO7p2wx82YRDhQzJH2DivnK9H4vxQ
         NeQk+hmoudpPIJXycX9kba8vPBZqPNUhtzxrLFTXvrFF54isRyARYsKcZ0wbcCjz0Rvz
         bEIGkLz8voEuJ/9uSknt3+rVljefoXYeoeabKwOSxatI2DsOlQ82DmT6+UJYDRAkckRd
         bJwJ/TkRSojKZAtti6qEIESrUeyN6WAItCArejyU0h7fLOOKJkLEKXa7QUTpJwhLZ05Z
         m3U854a6O4V0GWK0T1Vd7CnvyIlBc7mRfSuE0ehkIxV7YsJpCY8wy96MQQr3kdIy0m0J
         LftA==
X-Forwarded-Encrypted: i=1; AJvYcCWerGayJo9BDDqnEHj5pl2QfZABUKbIyCPqY1+9rZ2tVTp0CvTru2ihY36yngnTTQBT+7jCZlBKHeddIg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxSAcUfGe/5eYEnWpD5fVGGz1K0CLQHVTKxXRzRNWJr6KxrwJUa
	Ruu4iVoZx1DVMK1vNBaPFYMyREddTK/OdZHf2bRo8EVzD+QSd8Xi2buKa5QK53gX3ukoiY5NOVi
	cPaZ5MpK7R7VxjjBssvrxwhxWzqByCjRHSN9KtqgMfq2gi3DtcWcxsl2qCNW1FxNa
X-Gm-Gg: AZuq6aIC/pqpEk8nHa2VAf2D2ugulhJr+oFB0QFB6Z3LrJwjwj6LYKj2zCFpgrs4fNs
	iRmQ132cKwT9o5mfjFMYvDBME91E+KfK0A06ItOqIvq7WXVMpn3NO8TjZvye3ImSkL/djqG3PFT
	2C15OlC/c1K1aTJRz/9rFZ9o8SIct2CRHk3COKYJxcC88SMkbu1B/YUQxv1ItwlNnHAIgRwKLnU
	gqUk9jsCM807HE4ND8Y2gJVnZoPrNxPZGH48UwX7X1UsIzuAQtLPRV90485JuStVn4LawrIl/xR
	axhit8TSAZBlk2xKpntkZzbe6bLNApYu7gIRL5HlmyRbNWeC4+bWdKZoEYVGs+vuOSfK8v7b3Tq
	pNoRPZmfRLbpunlLQQUJNmw==
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id 6a1803df08f44-897402c95aamr190213076d6.8.1771380229544;
        Tue, 17 Feb 2026 18:03:49 -0800 (PST)
X-Received: by 2002:ad4:5dee:0:b0:894:6cb7:da94 with SMTP id 6a1803df08f44-897402c95aamr190212556d6.8.1771380228953;
        Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Received: from localhost ([2607:f2c0:b1e3:9a00:3d5c:8422:4052:e7a6])
        by smtp.gmail.com with UTF8SMTPSA id 6a1803df08f44-8971cc7dc1csm176656526d6.10.2026.02.17.18.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 18:03:48 -0800 (PST)
Date: Tue, 17 Feb 2026 21:03:47 -0500
From: Peter Colberg <pcolberg@redhat.com>
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 10/10] samples: rust: add SR-IOV driver sample
Message-ID: <aZUeA1hmYlZIILQg@earendel>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-10-ef9400c7767b@redhat.com>
 <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
In-Reply-To: <0e762787-7270-426f-81ee-b24761617c18@de.bosch.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 3cagFSmaz4lzhA9Eyas6sTkBqxhwtSDKBEitypgaP7w_1771380230
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dirk,

On Mon, Feb 16, 2026 at 09:27:44AM +0100, Dirk Behme wrote:
> Hi Peter,
> 
> On 05.02.2026 21:59, Peter Colberg wrote:
> > Add a new SR-IOV driver sample that demonstrates how to enable and
> > disable the Single Root I/O Virtualization capability for a PCI device.
> > 
> > The sample may be exercised using QEMU's 82576 (igb) emulation.
> > 
> > Link: https://www.qemu.org/docs/master/system/devices/igb.html
> > Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> > ---
> > Changes in v2:
> > - Use "kernel vertical" style on imports.
> > - Demonstrate how to reach driver data of PF device from VF device.
> > ---
> >   MAINTAINERS                       |   1 +
> >   samples/rust/Kconfig              |  11 ++++
> >   samples/rust/Makefile             |   1 +
> >   samples/rust/rust_driver_sriov.rs | 127 ++++++++++++++++++++++++++++++++++++++
> >   4 files changed, 140 insertions(+)
> > 
> ...
> > diff --git a/samples/rust/rust_driver_sriov.rs b/samples/rust/rust_driver_sriov.rs
> > new file mode 100644
> > index 0000000000000000000000000000000000000000..84d057629c7b03d743179a4e05ccc092f814bf6b
> > --- /dev/null
> > +++ b/samples/rust/rust_driver_sriov.rs
> > @@ -0,0 +1,127 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +
> > +//! Rust SR-IOV driver sample based on QEMU's 82576 ([igb]) emulation.
> > +//!
> > +//! To make this driver probe, QEMU must be run with `-device igb`.
> > +//!
> > +//! Further, enable [vIOMMU] with interrupt remapping using, e.g.,
> > +//!
> > +//! `-M q35,accel=kvm,kernel-irqchip=split -device intel-iommu,intremap=on,caching-mode=on`
> > +//!
> > +//! and append `intel_iommu=on` to the guest kernel arguments.
> > +//!
> > +//! [igb]: https://www.qemu.org/docs/master/system/devices/igb.html
> > +//! [vIOMMU]: https://wiki.qemu.org/Features/VT-d
> > +
> > +use kernel::{
> > +    device::Core,
> > +    pci,
> > +    prelude::*,
> > +    sync::aref::ARef, //
> > +};
> > +
> > +use core::any::TypeId;
> > +
> > +#[pin_data(PinnedDrop)]
> > +struct SampleDriver {
> > +    pdev: ARef<pci::Device>,
> > +    private: TypeId,
> > +}
> > +
> > +kernel::pci_device_table!(
> > +    PCI_TABLE,
> > +    MODULE_PCI_TABLE,
> > +    <SampleDriver as pci::Driver>::IdInfo,
> > +    [
> > +        // E1000_DEV_ID_82576
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10c9), ()),
> > +        // E1000_DEV_ID_82576_VF
> > +        (pci::DeviceId::from_id(pci::Vendor::INTEL, 0x10ca), ())
> > +    ]
> > +);
> > +
> > +#[vtable]
> > +impl pci::Driver for SampleDriver {
> > +    type IdInfo = ();
> > +
> > +    const ID_TABLE: pci::IdTable<Self::IdInfo> = &PCI_TABLE;
> > +
> > +    fn probe(pdev: &pci::Device<Core>, _info: &Self::IdInfo) -> impl PinInit<Self, Error> {
> > +        pin_init::pin_init_scope(move || {
> > +            dev_info!(
> > +                pdev.as_ref(),
> 
> The `as_ref()` in the `dev_*()` prints can be dropped. Example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/samples/rust/rust_driver_pci.rs?id=600de1c008b2302b56d69ff27d12a9d8d14892ac

Thank you for the pointer, dropped in v3.

Peter

> 
> Best regards
> 
> Dirk
> 

