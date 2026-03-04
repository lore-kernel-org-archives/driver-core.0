Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD0243CD8A2
	for <driver-core@lists.linux.dev>; Wed,  4 Mar 2026 17:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646334; cv=none; b=n0ECf5w8/PPGZqSTiZ0y9KMu1J4Cs2qVs1yufMYudFQ5VmOjOLT0VnTNwZwKKK14RkBMKCJrkLA9F5luyQfCTlMeeDIgadGfT7MOunBPTzLIi3Et+wgdjY4eU+IG7o4HXi1QpDg6yyIJqCtDYo1fD/KxMHIW8fOMOBlY9ROYGXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646334; c=relaxed/simple;
	bh=Z/NZQvcQCIgLMH/ylHiLwhG3hRbIZ3DJdjrycXHaYe8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jq8NAHkqNPpsoGEKouP8Yt48gacToYLok+RBYQpos+KLAQhPhpCntE6qNElMSzuxWqcstwCAtEgOr01Oh12kTOPpY8XvsBkrKaxj5zw1G0X+feXT1zLNB2WVKKUkMTcbg9T99VBQaapwUXWKe5nSa+/wkzbbWbwZ0soxVHmp8R0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=RS9GzaJb; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="RS9GzaJb"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-8cb420fbb5dso421481785a.3
        for <driver-core@lists.linux.dev>; Wed, 04 Mar 2026 09:45:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1772646332; x=1773251132; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nSAtzjXqss+uxlpk1YxZqBQHrNvbCWRFoP2RW9VjGUc=;
        b=RS9GzaJbOBju6yF66H1q6oX/g3hlZwcfMkAYEEAOLoZvIFIfA0RrpZ2+j//tbet7B2
         3Wz781m1GNOPUnj7zKBavczqryv3JCX22Vux9LZ0MdsjD3GiyjnSLZDpBEFA+qfUvXa4
         8ruBDMl2pcoyitBHWANQPO4RzvcRaUC+KvJ3eIkU5x+B+F/wrkZC8w3diS1VQ1YMutJ1
         vC7omrnkScuYn2m+k2bDYcfod2YZcty7BE6sfWgTTKZgavMBcTErSNag5I8AWanCalGG
         s9UKX4CPED0s5noQd9lVa7PH35lYHmfr6b86AZzCBdC6sfs9oNxKjrvx3nb3JB50hTnL
         DGHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772646332; x=1773251132;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=nSAtzjXqss+uxlpk1YxZqBQHrNvbCWRFoP2RW9VjGUc=;
        b=XM+U+7LhZGF3hMtbM8qiRUJfC91sk1NHGpYDMaQOA7K/1NUo3sZR+UOY85c/UkUzhV
         QbQyv3zwg+6il0PItFn7Den869hnvdgMUmicycWdWGZljzKAylBAu3bsr/wj1MVVtGG3
         kF7E4/NyCwXud9Q4t5UjFv9Z8S5d2FdzxvdQMrqr5206VoH8lJIErNj5OIPPbSGinnK5
         7RLcf1wmq3yVkXzpIIzyVhv90SkN7k4hui+5+qp6lprtyhalygYIGD1r6wtvlNTFuxsC
         r60cD7sJxatPfOlW2fqYLRqFp0c8yiO6Zjxi9Lo90cCa88WIsvfeqmEZgKOIGbMAr4zo
         jwWw==
X-Forwarded-Encrypted: i=1; AJvYcCXI9AdkmWJFeTxWysbRLJQ1WwRT+rdYoa6/BCOGHq/gWkXvwSmaLINAxJXaIRT8Lot7CsmjjHfhvU6Fvg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7XGOii9El+a+rexrO/7L+dklMmKEdRUYtHCwVIDbBCpIcUiC8
	ZZlbX+KgLF2gU+3Aos3Ex/0KJNB3vnwWzUBjlgiXhs0RgEz5A6g43Nuz+aok0PFOQw0=
X-Gm-Gg: ATEYQzyidBFeUmUaqqVg9ObYxLnctCTrE1J66w/EfiWgwYh7FTSmUJwScaZrFqQ0aZu
	geSEB59B/SMOy8VcU+622nevHQE/yrVMKNrHSq1RyVwkvT+rakJvNC9owmdJMjdmHuMZTFQveBU
	ZzC8vR2Y9/twple6Iia8weFfXucC516CWi/jvNYKaYwXnH78Db1AcuSDk9FEa62DrGjkzTX0HxV
	XPbHN61RfwLZq1FYZlwkjfqzqNQmo52Q48fIEGMjVK7g3USFSsAQKaAXw7WKq/93nkfY+U87xSH
	qLySXo5QJsNjnoPAEztBhV7Wjv1/1CRxnngQEHZmvz4wJ1C/dvKq3JkVDwRbSEafUSNfq2KBhKk
	lKW/HvNM9dNLYfiTL1WYXBu5JJ8MHicVXnS7BkXYKZl5WCTjK4Br2/TuJ7dLhOlNwmOZroWvZMb
	rYNlTAdKvv8KXr0E6ZfNckdnhXxztUsl7kl1CdDKWCO2oPjTdMe/zAxkPENuRFYtkl/CVQRcqjX
	skyCi++
X-Received: by 2002:a05:620a:4481:b0:8c6:ee09:5eae with SMTP id af79cd13be357-8cd5adb8d1cmr343907185a.0.1772646331749;
        Wed, 04 Mar 2026 09:45:31 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-162-112-119.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.112.119])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89a1fcb781fsm8074876d6.23.2026.03.04.09.45.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 09:45:31 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1vxqHq-00000005ET5-2S2S;
	Wed, 04 Mar 2026 13:45:30 -0400
Date: Wed, 4 Mar 2026 13:45:30 -0400
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
Message-ID: <20260304174530.GH964116@ziepe.ca>
References: <20260303-rust-pci-sriov-v3-0-4443c35f0c88@redhat.com>
 <20260304084750.GW12611@unreal>
 <20260304141852.GF964116@ziepe.ca>
 <20260304142600.GB12611@unreal>
 <DGU347RJX5BV.1CZYELSZ9GS9D@kernel.org>
 <20260304162711.GI12611@unreal>
 <20260304164551.GG964116@ziepe.ca>
 <20260304170249.GJ12611@unreal>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260304170249.GJ12611@unreal>

On Wed, Mar 04, 2026 at 07:02:49PM +0200, Leon Romanovsky wrote:
> > No, illegal, and it doesn't even work right. When VFIO FLRs the PF it
> > will blow up the half baked SRIOV and break everything.
> 
> The FLR can be disabled. For example, PCI_DEV_FLAGS_NO_FLR_RESET flag
> will do it.

Well that would break all the security properties of VFIO.

> > VFIO already has its own sriov_config support, the right flow is to
> > bind the PF to VFIO and then enable sriov and do your assignments.
> 
> VFIO started to support SR-IOV in 137e5531351d ("vfio/pci: Add
> sriov_configure support"), which was added 8 years after VFIO core was
> added cba3345cc494 ("vfio: VFIO core").

Well, time to upgrade, I see no reason to allow Rust drivers to
further propogate these mistakes.

Jason
