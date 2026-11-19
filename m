Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795100940;
	b=eMRFzJeepkWqqBl2QBw1pRrzGaGig65YSB8GUXeO2EWAbbLGYPKTAA3eII5hx4YbCynf
	 VxD78J7InBlDiRclITtbZdCO7LhK4PKVxMWGokiwa2amOIHOpOdb0gyZIn7d9YU0IeO2l
	 C13awuGwZaP/H0GPm12ElHS7YiRoe+ixuGpTFlk9HcvvSlglT2mkJzBmldLCDUuo9TcTz
	 PZq/XxOvi1zEQdwWGzZ6TKrfwZmZSLHEXVcdpNbnrTrja7krvJD9ooKAE8JkQkE5lcL1w
	 Kr1KbdOX2NXy/fjR1gAGDRWf6FTHbOZlbkcHvhpvTykpqMF/8PO6ksafLtcVvt0o+iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795100940;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
	b=d/Jf1nQkx534YbxeRyAcIkJQhqfZyobwYP5kIFfhS0D069E9IGqCLZhsIbTGTirBU06I
	 +3icI5Bm9ed7NG6eOd7KbmS0n0XyuvqiqIm+jtNG8e3VDLHmGXA7eohFKsBC0z7zx+Ifi
	 yNBjXetpvZZtHUKwdM3rtk2LnIbJMAQvynKKETOyh6o2Z8ALvbz1aTWfc3XlkCpYnOJzO
	 pn9TnUkWrkWT9KBl9q7ppRaF9d3ZP34tzhHYJaQmZZof5jmKkvUBhGkXxe1tqibfPIKx/
	 z1uJOehAQB/PBJv0U9V8MzvXUM+KGTYy3sqLNR8uFsXsP78BLW3Bho6Nsea1UL3e0Ew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U8cfhezj;
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EFA2606A7C5
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 15:08:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EFA2606A7C5
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=U8cfhezj
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-55b8cd4e2abso23992851cf.1
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 07:08:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795100939; x=1795705739; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
        b=U8cfhezjT+1CmbBB/7rELBh+mJ1Pui7egbmv3itDklbCODE579efZR7oVB19Uf/QA6
         4JI1KAm6qySqXaaT+R25zCQfxP3z1ocnK6ZFa9DEVqsolxhBU6+5BDg7vuThMthe77iX
         zzvFqXGA2xNVNKZ83oZsuU2dAFRZVvGulLZ5FPXd3FsRwnsTxvPn446dCE4caRfHrE3Z
         9VPi8Jv8+RtzWbeKCS0sv8Le1aAs6djk86hyDvteVx5O5+06rA7p0D3WpenYUdIFIZIa
         fbnBGmbYbthMyZj5JCAjhijl1snRRNymgNriWFtrmjxjVEwfc1s/NWxsUQ/yezgo+OVl
         juRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795100939; x=1795705739;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=UfEaEG1JfkCAIJnh2gYW2V6ds/usdTdH+yyNEqHOfA4=;
        b=BgT+I8OQrCHcKskSUmUZ6iq7xpNpith3oMGyQxB5cMJuiTyxVJsZ0f1vaRk/Kfd7lo
         LWjyqNxPM0PnSRVIAFYrhqWd41HUQq2unoaN/56sDDXD1j1zm6Tcq9eB5AUbVhi18oxp
         bSuYWdg2yIVv4gWrRh+jB69nuyzJFXf/eBw0/TRm+KhvAMevY0sV0g51lL/T8va3/qrz
         6ZlgJl5ne74uqjWM60qUoP5LOXhGzMZ8m8ksO6IjEeZ5PjgOPZ9LxecW0l32LUAfiLmS
         Vhz8VuO37b1fe9Dxyt3s1PZYJN0qp8LiABgUNmIV7eJMbihKRl6pSPSGMe12I9IHNP5u
         vIIA==
X-Forwarded-Encrypted: i=1; AL+hErE8+alwV/VzirZwlifbGYfqiy2wnJBgq2N3+Vrl29XalGWAsmCLJrHtKZK910ifnpriwDOh5aubpKmkeQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/IUKfsKvipdzHWi1n5+YX6gn3TQjAb8CjvCdCYB4qWitYCYL9E
	l+yeP45zRPjCVjHKJlD7hpp4iuyHKREhRq3CuGipLT/KReJ2r5tT1evajlLSdreCWkA=
X-Gm-Gg: AYBFou1xoziwBFxm3m4QsaAq+MG1yIktnwlSxFKGOBVzdvoDqz5xG5jK0g0P1y6UL26
	BoApKCcANjXnkX4RZkI33gNNzOuBzUUfzJfCIvsN0y424+efGSY6fum0zm58W+WpWQWMiLJB/Js
	/H2u+kBHqdKEUAeAK6pWWQNJaSIiKRsKPGuH3pRQRT7iMu7p4DZF7Grw1jdV2F+3ef47TLTJobQ
	SuHOvxY9DtP145rtnnUdyjG6ab0CmxQpNu7tCmYzEY+Z8Qr6KDK87teIPlo8OMv7BzBoNhIjHzB
	qhNHA3rozCHdSRz3A0Hi+lqn02Ij017JCb5ka5HhD91+Qd5pSxs0f1Nd+Z2Xo9SzU+VkvBWaq6u
	+4LyA0dWJop5WyKB8FTpyP12s4V5Y4P5/mYavOnOFAHelKSlklKNf14DBbboTsbAxKwTNQiFb7t
	2YkXEmuUzQtwf0gnKcYMLPDgdBzoVwOm2wrRSBMg8JeK57vpvd8VyuyFTXytzFihO/oCflEJ/3t
	1LndkJthmex54EQ2bLKL1Cah2NudadRe4UMGUEg3xeo6ha63E6qLt08GTNdX/WdPqk810WjroN8
	D+kTDw==
X-Received: by 2002:a05:622a:4e06:b0:535:2e9:e474 with SMTP id d75a77b69052e-55d76993c6amr3007681cf.4.1795100938908;
        Thu, 19 Nov 2026 07:08:58 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d669bb8d4sm25325301cf.3.2026.11.19.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 07:08:58 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3kv-00000000xbi-0Yi3;
	Thu, 19 Nov 2026 11:08:57 -0400
Date: Thu, 19 Nov 2026 11:08:57 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	"Joerg Roedel (AMD)" <joro@8bytes.org>,
	Will Deacon <will@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, iommu@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Detlev Casanova <detlev.casanova@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261119150857.GK3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
 <20261119143151.GH3115493@ziepe.ca>
 <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>

On Thu, Nov 19, 2026 at 09:52:59AM -0500, Nicolas Dufresne wrote:
> Le jeudi 19 novembre 2026 à 10:31 -0400, Jason Gunthorpe a écrit :
> > With the additional twist that alot of embedded HW has apparently
> > choosen to not implement SSID but instead has a pool of SIDs that one
> > device can use, functionally similar to SSID.
> > 
> > We'd need also API support for unbundling the DT iommus=[] SID list
> > into something that the SIDs can be attached more like a PASID.  That
> > need, I think, has become clear with all the DT tricks and fake busses
> > to try to work around this issue. :|
> 
> The word "fake" never flies with the DT maintainers. On that subject, I still
> don't know what you mean with iommus=[].

When you write your DT you can list all the iommu streams in one
iommus property. Like this randomly picked out of the DT files:

        iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;

If you do that then Linux sets the struct device containing it to
put the same paging domain on all of those iommus.

It doesn't make any sense to open code this in drivers when you can
just have the core code do it by writing your DT to match how the
driver wants to work...

Jason
