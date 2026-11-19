Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795098878;
	b=VR0Gb8GR8SNaqFS7imK3KpcnltvzWOAElbT7ZrsflrVglcG9NQ1CH1f2sUBAM1A0cBzr
	 /saoHFr3pivhHO2NnDt7B4bAKNFod8j0pGGxCuvATLsuKAIeQTfP2off36FxXVDXC0P/5
	 bNAyVJt672+U2q7+hFX4X/Mvam26l2U8Nf2xR8O8yuaLPAvYw3F4XaEW72TLjOMBHwdkm
	 byu1QJ5qFLQylTR6BS7+45aK3sy+HiJ6MHn6J5sq6agHFqbn3XfmbCoatmpp6ZvOdp3fx
	 OZLvf+tscu9B4DzOpzA5Yt5gAO71TjGEF5xXuYmd3kd9vTc+1SkgChK46GAPkHN8F6Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795098878;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
	b=uLx99N0bin5E8szgP0+lIM8L52Nt1W4+Sz3/QnwCXDJvxyN9piRw39aWiMzcWM75w6k1
	 +yUur3yK24w8fFJJqnksoVzIIkB5oPs2bqZOocR+eCf7w2QF+GG3WV4aDfqqQ8FChaRBc
	 slVKoMNWIj6pTREFXTmnMQhihFYFYzsOnAwK/m0bjhM0gen9+T2HnTXfXLvj3IqUTusBR
	 Vq62FQLPyGqgOB9SHSe5MQWHlS/1u8V6XFuO5RkOehQcC16J9+76WiFG+ZVULwoRSEC0o
	 Li7aVAwWcYSs+4YdqimTgQcw9aadfqZv0S+KsAkafg6eRejnD6h4fMpcbYK1KDTJHTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K3MXkWKH;
	arc=none smtp.remote-ip=209.85.219.53
Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 582DA606A333
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:34:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 582DA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=K3MXkWKH
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-9210f2622ccso25676776d6.3
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 06:34:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795098877; x=1795703677; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
        b=K3MXkWKHlr21Q2aDnKybn3E/5hxrJuWc0RHue9G5BaoSXMyfiMxNP11P7Cfc3tjf1q
         HvyKVHGH43VIFjx0bSOaUG1k7NNQ6k3v4nb0MpNtZUCuIZkW82awpgb+qmmVWrxiu+F1
         MCi9XCKSOyUEGCW1KNYRXkbe6rL2BBAXw5TT2UKQMGU/pUeNTEmDCJCgYFXVktc3HOMw
         eP+n5J3KkB+sZmOVDTEkygq8mm7zNShmRM/xIvsdmWSsD+uOyzUtMJiPVSNzgCc5r0Nr
         90P6rlRNm8Vst6hXW98JaZdjPGRGwF3Tj3MYFmFBRMuXTZNjnzCmmJ0F3eN0KDiCg27i
         3rOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795098877; x=1795703677;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D76bRl0iXWEy5tiDkPamZVFcHdRNx6r1Nq+m1WWa9kE=;
        b=LOb0roAcCOMRQO8mjqVM8k546qJ95s4hXiLKJfhVk2ORUXmDpXJ3J+jnmMDFH4DB2+
         A+VWaslw07KLBonkH+rQZIkRL8WBAXLxE4zd9zuw8DHXylLCH+2eFo/O//P+ymVuTqi7
         rzGZAP613HcyRLRAfHk8dn+IbsCi/wTegscttjs4goPyh0Ov9iyY0/6zngcTWj+D+JWu
         jg1hvb55V0eHHucrL8op9gU+soPZVqmytnz0w62VRzapNYMknvdNdvsIDoRpmUnhWeWv
         IBPnp2W/KgsEegRJLtYGDVUTHq17PPF0olUsQn9lzkEuDrfamymlsaqu81ixxTw7nNbR
         pxHg==
X-Forwarded-Encrypted: i=1; AL+hErFgUpl2flxk5p+3osXgUEai6BEuSU59UJKuKpgrJff7Gyf4ddZ2+QyoPhhqcz6ytedWVxwqza6kiG+cMA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9y2AD+b5cmgznOl49Y7OENTg/E8oX1wUbb1MmtjMlxWf3ULP3S
	YU5CEX5lJrIJdw6StvuFS0FVKmjU8PSnRKiry9TYtX/dveuMCiDJagwc9FLBGR/CzflcEpLVPxm
	C/zqp
X-Gm-Gg: AZFdTZc65HLrtR1aUYMcwTVNjLqUwcSf1Ei+h4YzGYle+sLIcOZzya09hboe71G7RmO
	LhrCIkbLQ3eIUkqifjz8FOdvMKvOm7juXs/8SgIMNeViyHzmW21DpdTTXE8bbZcwW3UlApEJdGB
	eSRhC0I3GJWngTCErpfzF3CG6iDGMakO+RUlGxj4FInQTdBGdcp9OWBWZ8ZdGhMcC6SWkK9f20U
	WQfwKr+OFZWUFNOkIGrm0KolTpTn4GtbYo/GevozA0BL9Z48Ss9n1wUcxEK42q+0Xg7LR+QEwwe
	rN79fIK+BAI0ydExgQTg13slE+wWwK0x9kToTtBl9Shtzgs8HrKISGPSds/8McvfzXcon9gGXeE
	l2ZDD5fM1sRG0tv8MClyr+kdS1PdhbzVDmfNoLYc+1fNtpI+ybd1Gz6SiA0M5NqzcadFcltdk6L
	aYu+MzLOkKlGDLNEZITCBI+Z/pEvpkoZV+m3sdZACwyc+V6TX3gH6YfLO0nU405RHAGuRwU/Nag
	qqHjknldamG8ezvzhPsQ9lqD3x7JxoZqpMt1QnvAEgpBlImA4d2ZY2Ow0Kf07Ew2YXmhScU3/+a
	fhcImQ==
X-Received: by 2002:a05:6214:5e02:b0:921:16d1:7cb9 with SMTP id 6a1803df08f44-92116d17de5mr70719896d6.40.1795098877201;
        Thu, 19 Nov 2026 06:34:37 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92133fe4670sm339426d6.17.2026.11.19.06.34.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 06:34:36 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU3Df-00000000tJC-0ytS;
	Thu, 19 Nov 2026 10:34:35 -0400
Date: Thu, 19 Nov 2026 10:34:35 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Robin Murphy <robin.murphy@arm.com>
Cc: Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
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
Message-ID: <20261119143435.GI3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
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
In-Reply-To: <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>

On Thu, Nov 19, 2026 at 12:24:50PM +0000, Robin Murphy wrote:

> There is a middle ground, where a kernel driver wants pages to appear at
> specific IOVAs under its own control. This is entirely legitimate to do by
> using the public IOMMU API "as intended" 

Yes, but, we never fully implemented this because we never gave a
cache flushing solution for these users. Which is a problem for safe
rust to expose an API without any way to do the mandatory flushing..

Jason
