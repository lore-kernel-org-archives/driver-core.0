Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F751496D2D
	for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 14:49:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791816571; cv=none; b=V9r96ZUf6DJXTd6QHxlWISB0kIZVbpjqpJhWx9de7rDufAvRb2D2aVGAqHhj3lvKwJJjtxJYZoUqbFUb915ekFjY1p/XECw2ST43rje8xxxuIq3DGgU4ajIQzB9/PpHNRQTbmKZ10NHRblU83i0Hc77QNLVzrarw4GpBUDX3U/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791816571; c=relaxed/simple;
	bh=9zUPL5NVEOabXBETdoVcRvq0NcBLE5K5KiwUVsZ6rXg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nFHjAUwiHR6soyJNvCB9idYFR3LzN9YDgZHJaggqvwhl9f/qYji+eXAt9H5wZI2uWze4wZXxpZ7vHDy4cAuXlY4w43ARza/jEKbnJf58zA7IF6uMvGKSULXMS2oEMDX0v3kehMqUkoIn/nHi6x8PSm3XKW/LJv12yw+5CiDB6Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tuDs1W7e; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tuDs1W7e"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a018493d57so80795e9.0
        for <driver-core@lists.linux.dev>; Mon, 12 Oct 2026 07:49:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791816568; x=1792421368; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8W07NsiEHCJwsJueJBy/t/T/wHddWfvjW0+P0EskkyI=;
        b=tuDs1W7eNh+eGFUcttMjt+OqSARUelnqANs7c5T3hNckA4uXaL5gRY3YUGpxFRErkM
         J+g1Qd6eem7fmPTK06S7wf/b2XacLNuPGlV/pBCr6bQWDnFeofPQn01saViXn0obSUsq
         bnh6DDh1ofl265xFGeLLCnRBCc/5ICkve9Gp16r72tHz4eP8Y+rYHNntlXzzxE/u6Ijk
         m8G6WYNYQ3SGWal2ZYjw1ykO9T7OsLElef7/91FtoCNKWdVOD6vMGEQkHXG74nLlpqva
         t4baYO2WFAD6bhVW79g1nRsi4/ow/ytRaB+zxAALIMlvlkr7p6ebql5sNcRdnyAlNfdz
         ddzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791816568; x=1792421368;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8W07NsiEHCJwsJueJBy/t/T/wHddWfvjW0+P0EskkyI=;
        b=M0sn+Z8Pt67XVxFhYkvCFKyIEl5Bc+rrWeXh/rNizLRIRMW+3iPo+edzsRcJoMIQ8B
         AcPT06UZkVLFz5+z82voubsTc++QM18HBPOFoRUeLM+9rok1XGKFK3x6Fnmxr8UpHEvV
         f2WXkqG8ttOEYg0lEAuBt5jm/TQUbK8+5exapUCw/rKX6CjEbrVsv/sEAA8wLEZSF31y
         ajez9ortobP6Zk+3cW0ljpVdp6OWUv0bf8Kx3KE2ml824LGw/4v4D5Uv0w+L/kHScZcf
         d1Oxp/6L7pWS88p6LEXr7bD+3lLg8bs3fuo4+v89IpMGcqda4VscwuGC8RHD/6h611XL
         ctQw==
X-Forwarded-Encrypted: i=1; AKwUvBxGfudGvXiUqG0ychzVF8GQgWnNkwD8ABi5NRWHBEpdnQYHY2nwoVwS1T3ZfenVJpJKJ/CF3bjYKU8UDw==@lists.linux.dev
X-Gm-Message-State: AFq9FYKPOMcgomo7nhP0id0yPrfX7M/wxb7zpXtNf3oxbiZ0CmgHlpvv
	QM87eqESb/gUj8G4xBFRiZc0ncimRFFGPJDfEPJK8xkx4x3d5yNyXdCGDGy/ZjotzA==
X-Gm-Gg: AYBFou0cnizJLRGkmVn1eqI3gPQVmpN7NM6tAv7qtvvbwyTcqJXkF8gKFJgxCTVKgY9
	zTMj2+eNt6mN5osK9lpTKzptZ4r17NP2gqwSNvOVcJAZKuz3LMmioFAb9WmNfYNNrhSuGKfTqaO
	e0cFiAFtDG+v2NWncXnt+/dErKCkcRcT0S+i4pcNczH2GsoFDy9GXO/e4liU4dS0+sMZwotCVnc
	HXZc0tGr7cL+LaUl4XYKOKJaNwL9rwOnIhKc0nXvOH9tHqv+J9wMU6ydDyuQEme3iOIeh1k0xSZ
	udablecubYv7Zb2urqEHUqWyyLXuG3Dx0g1uvgcj7EmcMX8Zrvl4OYzApB0NyH8wN9xb4HvnktG
	wH+AFJ3dx5Pgcibt4rNt5jMPoZxYg7e0KezxhgS1mUdzp92k04ui7GmKnSKpxYJcUxPPz1ECTnh
	nrmZbRbQyDK5kZk2tFIuZNRXf/Xf/49UsD+gccStvYbqmffa5P4RoFiHSjosuOe+HZYzazXl8Ru
	g57kxi/G3BHRQFDR3jc2N1CDdlHP1IS3eFkgABooNheHq4jkBY=
X-Received: by 2002:a05:600c:8b54:b0:49e:b733:7277 with SMTP id 5b1f17b1804b1-4a19d710a67mr1241395e9.2.1791816567153;
        Mon, 12 Oct 2026 07:49:27 -0700 (PDT)
Received: from google.com (250.192.189.35.bc.googleusercontent.com. [35.189.192.250])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f249692sm172738315e9.3.2026.10.12.07.49.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 07:49:26 -0700 (PDT)
Date: Mon, 12 Oct 2026 14:49:22 +0000
From: Mostafa Saleh <smostafa@google.com>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: Luigi Rizzo <lrizzo@google.com>, Luigi Rizzo <rizzo.unipi@gmail.com>,
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>, Christoph Hellwig <hch@lst.de>,
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
Message-ID: <aszzcpW6fJWGcQCZ@google.com>
References: <20261003212241.3432303-1-lrizzo@google.com>
 <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>

On Mon, Oct 12, 2026 at 03:51:39PM +0200, David Hildenbrand (Arm) wrote:
> On 10/3/26 23:22, Luigi Rizzo wrote:
> > Here is a subsystem called DMA_PMD on which I would like feedback on
> > architecture, possible enhancements, or kernel components that could be
> > reused to avoid duplication.
> 
> Here is a feedback to a subsystem called DMA_PMD ;)
> 
> Why is basing this on PMDs (and embedding it in the name) the right approach?
> 
> On architctures with large PMDs (512 MiB on arm64 with 64k), would we really
> want to use 512 MiB pages, or rather something smaller (e.g., 2 MiB) that might
> possibly also have TLB benefits (cont-pte)?

+1 I raised the same point in the LPC talk.
AFAIK, this series tries to solve both IOTLB pressure and CoCo bouncing
at the same time which might be too strict; as for CoCo there is no
actual IOMMU, so there is no sizing constraint.

Also to reduce bouncing, I think it is sufficient to use the SWIOTLB
instead of having a new pool + recycling, the tricky part is how to
abstract that to client drivers as this would be needed beyond SKB.

Thanks,
Mostafa

> 
> -- 
> Cheers,
> 
> David
> 
