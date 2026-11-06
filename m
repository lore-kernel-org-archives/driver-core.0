Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793986267;
	b=tEe5Cxv85Q4CwZ+np/j4xfryDNiF590gEB/9ya1SMZp2alrGYi53usLJ68BXTVwm8WFQ
	 RJUvA9uhyY5cABrZjVvm44QH9/SdQ3jnnSyzi+ZH+AgBinWKbUlHE0VrSXDLojUwg3Aia
	 eldmwKpMkR8FXUSAJA67lEwHdenzUBwRoGol3uZwbADL+zyWhysMzOtO+kibpu0e3BUMr
	 dy5vJUe0ZfNQR0XYLyU65QfiFgF5patWnfQhRLVDPh6EulcfkL/IfumXmp2f9TJKCvX6I
	 pd5cjrCm3RiSS4ZW9j24c23jD2kFU3OEllMIvibITDdP2eDojcEdAKve5G7JXE+282w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986267;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=XofOEQXNLqFn+X/AdUrRbjVcp2Tpjks1Mv/4b0yulcU=;
	b=Sp3cFbZev37lm9H8sNRXscCA+lSXkyAZIt4suCJi2cNQ99kr3TZayG6oEphNLijBpEGK
	 cfRmChe1cUaGsuog8U3U1/u+Mh0OkHDQhssFlx3CUs88ri+WTJMgq44iOweuSvnlh1Epl
	 P/G472G3Md3IGzk1f8RfpWSBPwTXyP3lPTtQ4aZx4wp4crareLwB+f64sV2PISvgO9n9J
	 D0npOhfS4HFYmWCgmQcSHuvBXq9/9Q3IDtKUFzHD/UY7TuijBdgG5+OY3sPyDtSwn8yqr
	 od6hELvvFGcaA3WmrqbyXi0fIvKohbNJYZPK4C9fVSPiNH2vWuqZcHS1z1ExVNi3dCg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8058606A32D
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 17:30:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8058606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-91791ec1b83so6845156d6.1
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 09:30:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1793986256; x=1794591056; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=XofOEQXNLqFn+X/AdUrRbjVcp2Tpjks1Mv/4b0yulcU=;
        b=in35xxpqBM6rdfsbShYcHSyUj63tCA6rN95tCGGTqlNYv4JPxXYTU1Hayoshqbnd/h
         Q7lHxOUVsJWk5p3+5COh5cbyCxLqJ6aBOzgAT2HHZkDuaIEcozxALUj+/MSL+VHimkJV
         E0lWBrBUO2Fshm20ZVqcIMFB1gorN1vxw/HqyWyF8T36ydIkxnTZx4x/vTnTOnr+1BtC
         3EJS1usyUbV/I1cLI743swb7hmv8bwFuUed3iz5hsC6MKNLn1nRXT2eCMQi+NvmV7Vyp
         8Y8eAk5mkUgBCfWiXmAZhoYLH7y+KKD6XCCgKyatcqrNZ0ZbyrWCybES4+yJZxcwVbiz
         vJSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986256; x=1794591056;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=XofOEQXNLqFn+X/AdUrRbjVcp2Tpjks1Mv/4b0yulcU=;
        b=RQ/SuICnl3paEkFek7q7yc669tTtsWrG7fzgNAuN5NOGMq4GTKTHeRDzwoHQtE1vBn
         019PBiMIWQ5Y/MncfkMY+WU2U3ISg7dphlof+jPtAa8LpTGlZfskbZZcpYGRxfDZ/wU0
         +6BYo5nn1WhJ7p2HCBhWUK2F4RuJ/u8XyIlL9rPbpJmlIphlpY9z8DD1UrqM0HhEfA7V
         1KQkbMGlYoxvPEox1BwGU8jKFs1+Jd5cz8N3W0QEmIDsdmO+Ftt21bsyZWxPhzJ5e7XL
         aTi5lMgyCimCv4Mz2hv2ZeZAUQfYU439we5zMbLySE7EAadEGEk5T5BazabSs8BpXwHF
         XE7w==
X-Forwarded-Encrypted: i=1; AL+hErHg5euhS2vj8IYV8xw4NncHgvvigegKL93xl1ai2x0ma7rFkljn0u72vis1OTy7ggdNTSPUeqCjZp7KeA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/3x8MIyVKBUrCd4z62sje0WUyGurmh5SZHWubviMZ05+d6Be4w
	pJc7aObeZIkUezZyfXp65K1MFoOieXIz4B0C9QHmwpDr9KXdVuA3HldE5+xHtin8H5Q=
X-Gm-Gg: AYBFou1GOuFcvVUWdJ57xnXf0NJUs1rhWDmpYRDb7IQbYoVy2i/mQMYoso58hJxKjwp
	Zd4mBjvqDDsJSk8xT7s1TFdUSP3ig9khTMFE3cpOoHoRqGS3X7o4l8A8pVdn7T0o8pqM589dTD7
	ZBp7HXONDt6EdBlp3TVh0Z72Gk+74NWAsf5JE0joME67khyeTh7N3FHraThQMif0UDxMm2f/MtU
	YqoMTXbjH1KZ8wqWKkXI3PiFFJTeXX7QORb/l2xCYsXw4wFWUvDlSeE5PVSeLJfULVi5vYbQfs7
	pjfauTmKKzYNlMSIIo8WB+eE5EQr2WwjuBBj2a2D+30WMPLUJ22W71+JwA0OTrMb6rj+vVo7dMg
	kXf0hltEu4U7MUdSUT+cg+r4gfcBIYdsxfA9FTiK4cMgaJmxy5SuJfdM1uVUGFCgv6NK5qGSRc/
	1IdJREC2RDfRWG0xPEnWkHxt5KbNNomfKID9+dhwBLWqRsS7+6iYHapbQimiViHKXwGd5jUvNdc
	Wia9HYI5MIGiHNYYThWCZD2FzXsn1fBaDDNkO6o0ic6ipGEsShdJzFW0ghJf77zixJtOAAv7mCN
	6pk7EAS4d/ZnYqWpyMVBU9SoHhbNSknv7z2DWJuuLEuI4a9GzBeRaMdvIzXLncIoBmZozIMySc4
	oyX24wO/nPWmCYPqvfD2kytQxqtG9aI0=
X-Received: by 2002:a05:6214:c69:b0:91c:73fc:a5a8 with SMTP id 6a1803df08f44-91ea9742db4mr40471196d6.9.1793986256339;
        Fri, 06 Nov 2026 09:30:56 -0800 (PST)
Received: from ziepe.ca (hlfxns010zw-159-2-239-150.pppoe-dynamic.high-speed.ns.bellaliant.net. [159.2.239.150])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6acceacsm25406486d6.43.2026.11.06.09.30.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 09:30:55 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xPNmA-000000076Mk-3tnC;
	Fri, 06 Nov 2026 13:30:54 -0400
Date: Fri, 6 Nov 2026 13:30:54 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Naman Gulati <namangulati@google.com>
Cc: Christoph Hellwig <hch@lst.de>, Luigi Rizzo <lrizzo@google.com>,
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
Message-ID: <20261106173054.GH663069@ziepe.ca>
References: <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org>
 <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca>
 <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca>
 <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca>
 <20261103080933.GA4213@lst.de>
 <20261103151021.GK3889730@ziepe.ca>
 <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>
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
In-Reply-To: <CAMP57yWvHO0pWCR3-9q1gtwVe8WV4Y6i69trmw+BJRVYf3JB1g@mail.gmail.com>

On Fri, Nov 06, 2026 at 09:21:08AM -0800, Naman Gulati wrote:
> I drafted an implementation [1] for premapped TX and RX buffers on top
> of the existing networking page_pool. It is implemented entirely in
> the networking layer and extends page_pool as the default RX
> allocator, to the TX path. There are no hooks in the IOMMU, DMA or
> page allocator code. I wanted to understand if this implementation
> correctly captured the feedback on this thread. Key components of this
> design:
> 
> - Chunks: as in Luigi's series, memory comes in 2 MiB chunks, but each
> chunk is mapped once per opted-in device through the DMA API and
> records its IOVA for each device, rather than using a shared IOVA
> window.
> 
> - TX: page_pool accepts a memory provider for pools that are not bound
> to an RX queue. Per-CPU page_pools take 32 KiB pages from the chunks
> of their NUMA node; TCP copies sendmsg() data into them through the
> task page_frag and allocates its skb heads from them.
> 
> - RX: an instance of the same memory provider, sharing the chunk code,
> backs RX queue page_pools. RX chunks of order-0 pages belong to one
> device and NUMA node, and are shared by that device's queues on the
> node.
> 
> [1] https://github.com/torvalds/linux/compare/master...NamanGulati:linux:netdev_dma_pool

IMHO the netstack should never read from shared/decrypted memory. If
you put it in a SKB you have to be sure the only touch after that
point will be a DMA read from an untrusted device on the TX side
(sending it to a trusted device would be a fail) and the final copy to
userspace on the RX side.

Everything else is very security questionable.

It is unclear to me how any of these page pool proposals meet that
requirement since page pool typically provides memory that ends up
widely used in the netstack.

Jason
