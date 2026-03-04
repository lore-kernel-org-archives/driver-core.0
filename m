Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D177536CE0B
	for <driver-core@lists.linux.dev>; Wed,  4 Mar 2026 14:18:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772633936; cv=none; b=TroSDSxqEeIemwd5kRZOVskY4gtwoPSStm7GuiDPCOY6D3E3pwSvEhToj7hAvJ1rneI2kCw1+BbR3iKf4JBjY+95y5wD9K1ps7tOuXZBaa3agiogAnSA28nTD/UrKio/QxeBpAEM3Tm8VaUh/8QK46AB9N1rlZ3U5kc8FVMKRpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772633936; c=relaxed/simple;
	bh=ICcHAv5R0LkVRgx1sRn/PLrNOjP1Y8guvnLI6zDoVjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HuKfga5zPiagzJhdfQvCqDQxzGY81y3+Q4RkzqnT34v5wy0lHAsFe5pyUDS1LXGxpr95bP9mKOG+adksR0Ye+Sxs13+YNUmCTNsLJmyMl8TzsL5irnMvrmwMo6afhPI6Hjx8kpiLOGqz0iDQD7ta2Jtbp7QHNepCNcGU3FZaP+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=AwTzfbSe; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="AwTzfbSe"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-506a1b23c05so80344741cf.0
        for <driver-core@lists.linux.dev>; Wed, 04 Mar 2026 06:18:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772633934; x=1773238734; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=AwTzfbSemLXUN59LJJLTEvp2Hgu/YsePB1eVY5h14RMngZ0ATpfvWuv99NjmUlpR+C
         3BQCPyZEhqQyg1oC27RnXb6ZRxl/Wrv/G0dWLZDt5kzAj5tgvSb3CRAnQ6MiP2QyAUWj
         QtXW+8/yLS8ieihKJIiKJGyJ1N5uB2r/pSAgLldkjUR/ltTZyc8rgZ4l0hVsxKj41aRA
         uowGKU5zFhIj64hDURwh7hhVwnu+txqCIX5fdZk576zcROjgYo3rZanhaF0/DaMpdjPQ
         YLJXGFejCqgGOnMuCLZ0OZkdxwS9SUHfH5psShU304RoX3kSSdOpn1f249glMqYnCZjr
         6dTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772633934; x=1773238734;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VJb/uIHrYqSTg+GB6V2BLb5y0MXgSCVKzM/ARVauTlU=;
        b=vXsSqyz/5mIcmFFA5l14nI4CLGgeJymN4i31BZSXhvr8MeysPGz4oToNes6c0LPElR
         V+1K5PAMwAtEbgNXOunYFhLhgmLVtiwJNJCBOuMtdtnxWezNLhG9YMcNzDKmSJNQCPMF
         VYU4M5o0X7VEER1Mp8ZgpCBKRZJVv/g04jXJowPR6Mf25ULtauCYL9UOZ7X1eqK1gvpc
         XkIl5pNnxJ0C2M2kkoP3gZDsAEj9nU+KP58/v6PCpCVE+HLePkxEnGVAh/8Gytwod2y0
         QSfVaZedXXXldVM2P0Gm4LhG4/ta0rRCrknAbuufRpjQ+Cmpo9f8w6LgRwfKLW/dCRdv
         ZlTg==
X-Forwarded-Encrypted: i=1; AJvYcCVL9bhYkolI5pLiw/Jse+Dqt4Ky1Qcy9bgKTFolkRZM3et6CB3mWUdayZWT+MZ6OeUw/zXI8Wx+CfzZFA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy5zFvdfyyroirrzEFG8TAFWZG/Ht3SulVeDeDKRtN7nqAy0eXb
	qnKjmC/C7xU+39jyoklF4aYLFffHHxN4X93AxFLOkMQ2xTyiFp+zkkIQ4kbiqi8aeco=
X-Gm-Gg: ATEYQzxo1P1aD8Ctovrfy9iAMw7aY+Lv6cB8bj2k3srbMCQ/ddedZMUgV1TVyYNXEcE
	mes8LD6DEtXpbtY8k+yEc7dg0MS5tMO7oFTdT6YTW7YLS71h6RaxEb9/uTbtcFy4TbsbFKgsAH6
	wIguEid0xfhmQpvsJBbqph5IhMSVAr3kl2RXKzgVZRGVP0f5pmd8xkRxbl4eTsRs4rOahLbHgfK
	oB32qfJL02l4dpEpdPvs3vY+6LieI7SkPJEnrELha68uE6aL+swM3xtnNqHe6B/R2DUCz3hJLi4
	VIGtaKA0c0juQV+/6M6IJLFA15QHwFFoAECjrfztIbEXsr+A5IzIbunvi/vR3f0EUHtMoCSacY6
	WJYHKbWe9FSS6YBhulDo/+ePIq1B/hNa8d5y1u+UKnmMnI892X7f/tHLKU0HjdAiyEw+LaMky1X
	RTjiYrT8fJJG9mft6OTuvK4GnqNbRq+UCCAZMecpY5v7lxSlOWXkUwUPejonH+YS+hEl7UZS2+S
	kOgs62Kd2qDTVBePtw=
X-Received: by 2002:a05:622a:1899:b0:4f4:e15e:528f with SMTP id d75a77b69052e-508db3773fbmr27695511cf.62.1772633933669;
        Wed, 04 Mar 2026 06:18:53 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50744ad885bsm152669541cf.28.2026.03.04.06.18.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:18:52 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxn3s-000000056cr-144y;
	Wed, 04 Mar 2026 10:18:52 -0400
Date: Wed, 4 Mar 2026 10:18:52 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Peter Colberg <pcolberg@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
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
Message-ID: <20260304141852.GF964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260304084750.GW12611@unreal>

On Wed, Mar 04, 2026 at 10:47:50AM +0200, Leon Romanovsky wrote:
> On Tue, Mar 03, 2026 at 04:15:20PM -0500, Peter Colberg wrote:
> > Add Rust abstractions for the Single Root I/O Virtualization (SR-IOV)
> > capability of a PCI device. Provide a minimal set of wrappers for the
> > SR-IOV C API to enable and disable SR-IOV for a device, and query if
> > a PCI device is a Physical Function (PF) or Virtual Function (VF).
> 
> <...>
> 
> > For PF drivers written in C, disabling SR-IOV on remove() may be opted
> > into by setting the flag managed_sriov in the pci_driver structure. For
> > PF drivers written in Rust, disabling SR-IOV on unbind() is mandatory.
> 
> Why? Could you explain the rationale behind this difference between C and
> Rust? Let me remind you that SR‑IOV devices which do not disable VFs do so
> for a practical and well‑established reason: maximizing hardware
> utilization.

Personally I think drivers doing this are wrong. That such a driver
bug was allowed to become UAPI is pretty bad. The rust approach is
better.

Jason
