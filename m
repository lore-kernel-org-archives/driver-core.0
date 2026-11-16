Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794857904;
	b=YSPXwarVCHiOaKnwplhytiWO6acgT6yHMIBK2MiFhHg5DeFCEsoWG/7ro2QC3oZiZtcI
	 Ntwsizhp2sb3AZY3OtntNoQy6HWgGtL33lxDUhI0EurgXGtx35kEqCnCh2pac0goKejYs
	 GH5zPTIRkG0Vks/FiammZdqpnCTBajz6BvvZ9SLtXIdMqCgsnzWEKHIAqk0daw1tuxKy9
	 2eT5lH0jTSIcy+Om3dSvqgrG79rjkr9Nt8ItmKQTz3rw48mZkxm/SW1kSTSzXvlcJu8ze
	 YTfG8scb4noy4AWtaiMjjx8UDihGgxhB4PLo5DDxHq7QwtPacQ+hlAL8vJWgmMXIkVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794857904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
	b=KsUxgWDmbqD1K94FO8/RAdQGPvzYLjwS1seDXNlntyWpMFf/9VGvB/HPIVXZUfmiDCF7
	 rMum4jVODRFYWsRf+8Ux3iHSAvYv7QtPpTPmG91KWUKH0iKHRwhSUSB9CLsWSMSvsmZC5
	 MigQHhI5PEepXMIko4hNZUY49r+mXas8caXw/m//6i+Z8HF67VcWFSe9nWNndayOF9XJM
	 eRJbjaNg3UT5y4X5rvt1doEpLKb8P2kpbynP7isxx1tCHZEih3oFYU3FwqI+JM0jBdfm1
	 aIoD8k4822aecP+vGmM+SjupWUkGFxsvA7/XUokQag0e7ldJ7ryth7miXgmhgBIF8sw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="Oz/pqUsW";
	arc=none smtp.remote-ip=209.85.160.177
Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B251B606A323
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 19:38:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B251B606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Oz/pqUsW
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-536717a4d83so40463611cf.2
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 11:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794857903; x=1795462703; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
        b=Oz/pqUsWGsKAilIf/MKBWa2zhzyGIlo5Bcw1f3vJgRtG16ebwCORr65FErvalnfvvq
         sMg2e5RfEROdqxqtXmZ2qZipErL6GjlIGPcJTQ5PUg3xsz0J+hmcoBLI1K7HR/MyobTQ
         BzhDfZ9b1DkJS5bABU9nONIH6faEHtGGxXV7CYyMteacD71NLrTxrsNToD63K8fek8iP
         MmoBfBlVxlVns/CxXDFsoTfUH9qGVnsBShQIczMtVx/oLpunBRd+ip/BDrJN97Cvez8Y
         Mnr/07KXFVovDN2bjs2K1Nw7FCgDr7KWkqq2rDZbi1jTW0eIslZ0ACC+ohUlhh1jVl/Z
         Lhuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794857903; x=1795462703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xatal/xzM8Wu83lbCyLkMOJwyZhivB3yqJ6pyXmU5Uk=;
        b=Ri800QyswHJ11DQcXsg9b60+q9l5srfBN5rsVIBeH4+PAB+X2HhG8tVX+WYiE5/T7b
         v3Mfw8hW90JW5L3RaiUSg8bRd9DZdO0z5T+guveae2cLX+7IvGl6UTTw7Ld7PxKY0FP/
         AEe9Yn7RsTj5+g9djj7ycxamUaRFU3E9/EIclR+lbukkG5CuY7u6SRmambr5rsLuK5S4
         WjKQjnw2zEoAEcqtTSpa7BU6AQEGxB58Qp6PScXAYLBGX2LccS21CDE40c3nyZswglYn
         fCxWYzvZavDx9H5V78ZDwbf3V+mbbB3xw8PlCS8e7OJYMdQkIL0ho0PggleP5lqokJrT
         m1iA==
X-Forwarded-Encrypted: i=1; AL+hErHcBSxS9d+Zhadjdxuy6K3umFm0BoQmx/vHcTus5UNXHL6RoMTyoRYH9dCF6P/RW7raJGUS0ocfa6p+nw==@lists.linux.dev
X-Gm-Message-State: APuU4Z/vukE256DazE+RPDt5xpPtulWpDR/VSnleVHox4OGx2Dtv3mLz
	ThC0luS3YP4EknSF0ruBdqQIYnLt4z7PeGXY6FQaKQiBrtNTsJvvui9mMYIjPy37K3k=
X-Gm-Gg: AYBFou34Hy6xRFo6bvxBArAvAuR8uBB1iK7YO5XhsCnxrNhd843JsmlkZ2OQrhS5C64
	3OjA6pv6wPOTUaEjN8O4V+eFx3B0KtXgk5QF731TQzLUMxwGkos+6MDGMaTSpEWyUkRUZdS0a2N
	Os5NGF69ltNnCFWWxZv/rumAFKCIxtXgUrjeYgHtrBRxPa+idSPwjyzAGoj1xyi6U4lO10nP7+0
	sIvy9DC+x/wbJCyGwo4wwWR+WswVmLZrof5TSD+xaPxL8F7jm5Yancp3HlvLBSLHjFgO8ZpBvv1
	Nw7dpzh0LupMPoydL/LFdQyRBdcEh7qmwJCCIwzsu7bDyIvj8pBeVWvvac1nm2ozT/f6Of7eCXw
	LpANh9b56lEoxcJf69It+MpQsjfXbBDqXwU93/funuefrib53Ir1MvoMlDmZgD/TdqKKpDKu89x
	PNePryqlDR/JZM6LjQQm4TVnNLc+sNOazaP+sHv+8Ra2nIj6nxVk04o1h/htV/VgXX7WtdBTJSF
	1jH5SGbrIR/aYe3pcCs3V/MPGgdtNwh9Kehwyb5tEt8km6083CfeAGnA47kTsdNFy2kl85x/doS
	ryPRlw==
X-Received: by 2002:a05:622a:1f94:b0:53f:8b7e:c0e with SMTP id d75a77b69052e-55ac755ea54mr198728171cf.24.1794857902540;
        Mon, 16 Nov 2026 11:38:22 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d3610521csm36870131cf.23.2026.11.16.11.38.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 11:38:21 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xT2Wz-0000000AK3c-0tcq;
	Mon, 16 Nov 2026 15:38:21 -0400
Date: Mon, 16 Nov 2026 15:38:21 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
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
	Detlev Casanova <detlev.casanova@collabora.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH 0/6] rust: iommu: add a paging domain abstraction
Message-ID: <20261116193821.GC2452510@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
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
In-Reply-To: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>

On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> This series adds a Rust abstraction for IOMMU paging domains. A driver
> can allocate a domain, attach it to its device, map pages into it, and
> install a handler for its faults.
> 
> This will be used by the upcoming rkvenc driver that my colleagues
> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> [0].
> 
> As part of the security model, each client will have its own IOMMU
> domain. This is needed as the submission model will let userspace set
> most of the encoder's registers directly, so the kernel cannot check
> every memory access that a job makes the encoder do. With a single
> domain, one client could make the encoder read or write the memory of
> another client.

How do you plan to get the paging domain in the first place?

Using paging domains directly is very complicated, I'm not excite d to
see DRM trying to do this at all. IMHO there are many unanswered
questions how it could even do this safely.

It would be better to come with a user so we can try to understand
what you are even planning.

> Patch 6 adds Domain::with_fault_handler(), which allocates a domain
> with a FaultHandler installed. One handler can serve several domains.

You intend to use fault handler?? That's even more esoteric.

Jason
