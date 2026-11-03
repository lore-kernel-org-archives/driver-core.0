Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718626;
	b=xAowdBBsGEpPRK3OGiNzxbTCjzuvUjGvWXf0/8XaUnbw3flU+xZmCCNW4iGrEB0FIyQc
	 BFbuWOkXxrO5HMND0hmBcsRtXivAcK1NydBztmmGpBTCz5h48ayuBwDXC2g5GCfkVTU9o
	 vmIxlxCR1HkFoPf3NYw7p7SI0wubJ2iMeRKQCsar8tlHjCCE245IJgKwsAjDVU5Ersw6u
	 Pxjrf4IYpYTUrFlWpVwt6nAZOb43sS4pk0GhXUxjhGJb+xl/fBkX4ko7aeyOlXE4Sdm7L
	 V/r4o7PrKchpoRb2DLTeEm0IYhcUMMNbAp/ETu9q5j/4/ZoWcCWlaVkdMg8ff4Px8KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718626;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
	b=nnT9ZUtZwO7kdlosWTR3R/u70GVA1W/xD9Cqsv7vlW5TKSYHJyCWZ5u+AZIT6wX5WDoi
	 fPCObFc7+DgheEpyndKNeX56coEbI1nHi6G5E4fkWCR7/xf3byrhwdvLlzUtLh/Q0Le5B
	 4jocIU0s3bhxb7ljJz+W3RHmqD13kI+c0j+aVhG9T0jEqq160k3OwJSu09XZ4nq9PtBQE
	 W2Ef6Y5C08Ehva10++in6ZkUiYVJo4FrQokSKnf0KixAWNuU3s69QTZ461Wb8YXDE12tn
	 vWctHM3Y9JMgzasYVeUhDFKdOmOqKtpYi1T6f1p5cdO5F2afrfGyWykrx6hjP7e+/QA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="ckpbcc/N";
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80060606BA28
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 15:10:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 80060606BA28
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ckpbcc/N
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-5365f9a04c5so70842791cf.1
        for <driver-core@lists.linux.dev>; Tue, 03 Nov 2026 07:10:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793718624; x=1794323424; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
        b=ckpbcc/NSgjx5ZA8eeMYcxbuCasE27AKGP65UY+axFwfo4G8/bR+qep2BJ9egP1IsN
         6/Ekd4yoA013QslDsGHB8PCjpdo1CIPGhnY2u2cu//wGq+0nCbGILTKreUQ5Hwn5Q1VF
         idC53fE28Rjchb4GYCdyk4Kw3xGTcpoZznSBQsOx7P74Ow+PMc1TSCmGFTC/zIPhCMCH
         Ut1nvKKqK4iEdWfrMO+FbvizVZcV0Kp3Py+7wGrc9i491x0owmCIVRZ6zhR/McFjiuXl
         MkhAzbUKhUcvh7n805UZPvf0tnP3IxobCl/vi5oqYwmdMLK9bijP7m1eyMaxCkMOPAxS
         mmoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718624; x=1794323424;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vt7h2p23Imler/JHYQ9qmz6AHyS0w7TaI6hUPIpmc2U=;
        b=pDHnZ1PldVEJF9evT2sZNq812YhmrgwssiTWDP69oXqP8Zx/J1cNBJAqjSW7hTOQfE
         FmVnM3APGNk+ApIY4Kv3PLbWeV5hYCfa5kXuo5ev0fLCsReZlW2BShYJHStjOL8vbGfy
         oXmVIeqL2mWWnbErXA5xhlrfys/o5oEJcvsjILgmBGqlS0oxEWh4D0Z7CXu8kXepzhjT
         4nyULLCtYtmem1WFZKc8e29CRUpaAeOVY7wdQZ84z0Vq4AP07Uj+GSGHyzlBeT/fWL6/
         3w3nMTbzMN3vIvnVfkkM/39FoYssDMURHKZ1LoJ+ORc/yYII68YI6XdW4BTVRvhhsRE6
         vpdw==
X-Forwarded-Encrypted: i=1; AKwUvBwFICNR0nYIcwlvOYnH8ExEDDh4Cjt2psNzigzy6iiCSXdlU+stDJDrCMm9QxalZrUuLZrgVbKaszYdyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z82LSRsZBrzPeip3rHLq3Rfb3H8FRxFzUvMzReUeDkf3UhcIN5o
	NSEO8NwIv/iyQFAYukVPuZttikqdx5JFmH99rdvTPbntNiWZLP3PgZhmLI1dLhIdMXs=
X-Gm-Gg: AYBFou1fmN53y87gxVp4x9wUIW9fJrzPAp2uXEMJtfeizMrA5CwNMQslfuVKb891RoQ
	UFuvi/C0IMmDeGetj0RsrZGn+jdRKnKb7KBTawgqnEzScVvOPD+wE804gdfxAePODcf+v1AvTOs
	g1e+eRQRZXJV0Ze72sEGNXmsYNrVRpl+99dC8jOIBLjilm6PGopCfnjUN4HdZUqt0vjNBw2tksE
	z2NgoTkQKe6BLzoVeuPFcuWevo9DVFLeV0DGXZc4PpufBHPV+OnI9avhKMho8jTG6MttdIV9Nip
	C/mfMif0s0WWsa/dtgsfk59itsR9M1BdVPwlCjMIAcTOp0jrE9cZ+ap6YZmJqMhoLZEqj6CGW+h
	0lEYyXycjDmAeYatq7weUIbnteom8O7fzSRl0iZp33W51iYyuwyvRKUv1EXaYxjlUOgn78W26bs
	DYC9MTMK0S3hz480v9wh7ASVGOg6Y4UO1iq2svYrIrEZyEPTIf9Do7k2ZenMs5VPjpZJ5aWkFt0
	EStulhnMd5xeSGgHUcNvBPN1sFhylGBO4XoLc0x32CMe1JobsyKtp2fDabS6dV+7U0T4Ev9bRa6
	YdPnwlb97QdchKiSoApyTsQd9VrKLmgGAGZ0k7LdQYF5KJo/UvR1gavGPHQwRarGGO53w+w+pt9
	DDbUkWBnxeA==
X-Received: by 2002:ac8:5a06:0:b0:536:26db:d4e2 with SMTP id d75a77b69052e-542b639bb42mr236124421cf.15.1793718623983;
        Tue, 03 Nov 2026 07:10:23 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5498b49dcbasm27980831cf.6.2026.11.03.07.10.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:10:22 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xOG9V-0000000DAq9-0szH;
	Tue, 03 Nov 2026 11:10:21 -0400
Date: Tue, 3 Nov 2026 11:10:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Christoph Hellwig <hch@lst.de>
Cc: Luigi Rizzo <lrizzo@google.com>,
	"David Hildenbrand (Arm)" <david@kernel.org>,
	Luigi Rizzo <rizzo.unipi@gmail.com>, Joerg Roedel <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
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
Message-ID: <20261103151021.GK3889730@ziepe.ca>
References: <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
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
In-Reply-To: <20261103080933.GA4213@lst.de>

On Tue, Nov 03, 2026 at 09:09:33AM +0100, Christoph Hellwig wrote:
> On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > Disk I/O is still potentially affected by the same problems
> > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > in confidential computing...)
> > 
> > The disk folks already have a proposal to address all of this using
> > io_uring and preallocated buffers. I really doubt yet another version
> > is going to be interesting there.
> 
> Huh?  If you mean the dma-buf I/O it doesn't really have anything
> to do with disks, except that this is the first user.  

Yeah

> The dma-buf iovec can work for every ->read_iter/->write_iter
> consumer, and should be adopted more broadly.  Including by
> networking instead of their own totally weird different world.

I'm not holding my breath on that one..

Jason
