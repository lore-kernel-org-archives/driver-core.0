Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792699952;
	b=Dxcj98NcCRxAtgzdGYFuXT/fzlBVxpPJ/oRzVnkk04dyI0kVQErPxaZdV6ZsyxH+420C
	 vUjUwWfTjTs9fi44pR5iS3ibFnyRRIUkx5+td53gTm2LkJBGclk7uLDTlvETbQpt4MmkV
	 UxcBq5RRoQt/ZZ23bDumfzXb8rUPO03Ks32/vD8iNBFcnvACrREmxNv6METzC2qZJx4Fq
	 OV3SSj/tccgHVxMxviKf1TePdcDxXctdFo6ni9LmbF197zrdExIvBHUpAH/AC8aVMVl2E
	 h0d2ge2Cr2R+przgATc5tfJxwlGivQPC/RsmtJq6pN/1aUT0jgUSnilZJzfeGGgeR5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792699952;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
	b=4atmnR83Vq9thXwV9v7x4Pa7Eajm+BNxn6ZkJ9ucxRw7N5hr6TltTAflpT+s+O0dvavB
	 DQTBQmmWZEypqK1SjwxxrlWR8zmNftqhy3fkXdyZbkCaqFgPA57dGi5R1JaPBjoFcuL5k
	 g5+12OOd3Pz+iox7XWEDOV2Maw+ZMN7SKK3HmyM6U4En+BjAzbyYNsEaKshWlEf0Dhn0h
	 5nklYo0qiANq4tqWlX7OwS5HFeVe3FiMJSixaX4T79TslGlLH1Syfbc9L/R2hOlFHfeQO
	 C7ViLOT/LYga+K6TnSvvgcs6DE01XRZlm3/TBAbb0KGnoV3BNu3x3bqk6kCHXt38udA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Hsz2YDwN;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E10F606A31E
	for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 20:12:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E10F606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Hsz2YDwN
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-53648215f9dso946341cf.2
        for <driver-core@lists.linux.dev>; Thu, 22 Oct 2026 13:12:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1792699950; x=1793304750; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
        b=Hsz2YDwN1KVpLJBEwO4+oW0hjBqdWAlWi76PW6TyL2YIEYJ4G2KC3WlnsqdB304IUD
         Xhzk4XjaHT6vThGJqS/iFFY+afIbMR9u34e96o9CAamy251OOy21deiZNSXtW3r2bJLu
         U0+E1otjePmQaOWZA37BtUXcGP5jyz8SPwAQA2ZTaVPKkaviZ12aMynajyYcpS8zYkRw
         aAE+WvJrI0mzfJU9S3Je83CqBWnJ0aVbErjbPEuisb5K12PQUMa1Z9cV/wP6caaEjNsD
         IohyWDaa7jTOtHyUJDbS1+pY1GyRsJ47rQddyc5bzCflLztbanhYNuV+LKT5Sh0fnb9B
         w/jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792699950; x=1793304750;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I8JrjL/Toni0rgHeKLxMi210agLPfR373jhOEmm9NDM=;
        b=CIMEvsprXyhEMkMKJIcIvkzJ8QNoSCdLYcIt8ULoso71sWkZKC3jC+6tC7q0IRvb4z
         P8mzNkzndB4p1LKZDjKNpKsZLIvLyXP3o1l/PlPakkSd1QhaYeULxcbHQOA6Gvhm23y4
         qymtEyc/rXw0DtLRz+U480XkoQbLrvM6xAkOv0jqnESfMnaqooB0WfP1VwTfG2o7iTO1
         xOzLkpt7hvIgCEpaGq49lhSrqQ9jEKk+JmztVrH+TBRQEV6H3jq6DpyVByDJxFat24At
         4Zjma2CXRWSy6rP/Zgsf0+37995S6OLJhIvLj5Ug38oL/7cS6f3hEQZBzGQiG2V/Wrhe
         zpzA==
X-Forwarded-Encrypted: i=1; AKwUvBwB42CCwLvGs/DhjGAG2DHOFCX/wZmCN0HtsTONHsxts1UJ0U2yvss6gkuXzXwbTLIzC+bDpR6awp3U7g==@lists.linux.dev
X-Gm-Message-State: AFq9FYK/4o86HIl+RcFwrtxz2B2r0mLQ+Wf7bbTFvb+YEaVe0oF808Al
	5UnPSa7C5EcUhZhuGVpLxTZRkDr2vWzKhFsXH1jXyZg5kSOs5PIlgkBnvSZUBHbbwYA=
X-Gm-Gg: AYBFou32N8uvgBLgsuV9OyAK4PmR7Sq+g80FOFIi9vJ9lwfM4ZTV2AFxMzlzFRWgRb2
	3dHJKE3eb2/rb/2eHESQu576zxehnmOGB0bV25ppMCZbKekhyqwhV2NzSS0dU7yEI1HtmVOUtNl
	NpbVyCpUUZuTFCNhAMXo7hTeaztHfTWo/yOhuSGT0fWlaydFALr38hATlxoPlANW1pZLSxZ4in5
	rGtzw6UObLZqTHxDArUKzNQHXgqBezOiIx/zw6zYyLLttyVFEptIEfF5+tbuLh5Vrew49ikE7U9
	7WrEiC0XdXByQjXu1heOnMhmyMNkA6RzEd6qmYISCAZwZG3M5Gf45UMvxqCoijXnKtt/ZsBN7j3
	hf9U2G0b33iuu3dLpl5D38hprEn9gDO6WLZP/Wl5WhT8FRk3bQz1pH8vpuVTPO0c0EAa4y0Iv4I
	ikmMXYw9kxupQ3RDyyg01iW2opXUUptT+1N4ll+7w+8kic9/uK1fZ5v+qy3j3MpAKlggHWVFhfT
	5WLRQZCzrJzhySI7xhnaMyfv9W9Mpg7oh5aAnd8Q4AZUrnJdWl3EwaD3WLlV0xJRBI2xT7VIgoa
	fmGI+6KJS2W+97FigRvoaMZD0n5yRrpjaikq/Q==
X-Received: by 2002:ac8:5a85:0:b0:536:6378:c7fe with SMTP id d75a77b69052e-5369b8204d9mr99553871cf.47.1792699950468;
        Thu, 22 Oct 2026 13:12:30 -0700 (PDT)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-536c14da10csm1768631cf.0.2026.10.22.13.12.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 13:12:29 -0700 (PDT)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xJz9J-0000000FoSN-1XEC;
	Thu, 22 Oct 2026 17:12:29 -0300
Date: Thu, 22 Oct 2026 17:12:29 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Luigi Rizzo <lrizzo@google.com>
Cc: "David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Jesper Dangaard Brouer <hawk@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Willem de Bruijn <willemb@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Joshua Washington <joshwash@google.com>,
	Harshitha Ramamurthy <hramamurthy@google.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev,
	netdev@vger.kernel.org, linux-mm@kvack.org,
	driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
Message-ID: <20261022201229.GH3381610@ziepe.ca>
References: <20261003212241.3432303-1-lrizzo@google.com>
 <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>

On Sat, Oct 17, 2026 at 07:11:28PM +0200, Luigi Rizzo wrote:
> > We should probably just find a way to describe that this is a POOL that focuses
> > on physical contiguity in some configured granularity.
> 
> Before embarking in a global renaming, I would like to get opinions on
> acceptable alternative names (possibly with a short prefix usable for
> identifiers in the code). I could think of the following
> 
> DMA_PMAP (for PreMapped or Persistent Mapped)
> or, ahemm...
> DMA_PISA (Pooled IOMMU Superpage Allocator)
> both using dmap_ for internal name prefixes

Can someone explain what outside netdev would use this? And why you
couldn't do this in the netdev page pool?

It is not a common workload to have the DMA allocator be the one that
allocates the memory. Usually we are DMA'ing from memory that was
allocated someplace else.

I think Robin is right, this is just a special case of the dma pool,
and it certainly shouldn't be something as grandiose as a subsystem..

Jason
