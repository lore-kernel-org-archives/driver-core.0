Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794946859;
	b=5aaiHf8TRroo6qhZKo2wax260gjamzRDDx+q6vI6O7vhl/55GtUR+GHEc0epxNtjmcL5
	 owfn3sN8oF/tJFQXLghWgYIPvOSAjAutFdb2yPJDb96FO+iS260WnwID5ZsIACPrKnWxH
	 yJ5THBfqGGrMn4BqUi/taSXjfSqV1V0p0Je7uLeyWNm/MJW5nmjJh3dVmGBaYOqzmTW00
	 eB3a/XUECHAfzusfMV0m24o+5TU7uJCkrNVJUpewfcZ/u5nuXHegmtTp9mqGK5FIkff1T
	 S0iZutcxDndC7MGRCmYr0CfoLIf3RbAAYohhzWC8PZ2GaWH2JMCOPlZdP6DqWGVy9wA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794946859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
	b=yn3OIKCjGIwwHCyNKb1glO8Vdzm+uJwNGroCFb8ALvuTG6mJoheGMLae3O1b29p427Qf
	 HqAvjWmr/hcChUMyxpzwFpfQkQw1t7c12m7Bx8SXsOis0dMDdMU5O1dcGk4axO0AybSmd
	 NSkuqhnm8TtoqnjBqpuLj73D6MyGB/zggCTQZn19/DgcOx66UnnfhFCkg9RVFj/Io4hPe
	 zYhqVwKAj4DkKUYYMohwcc+eFfojNMbXnH9cJhICEvsYepMkcxuL9xKtVStxt18e4L2fp
	 vzc7L1W/+gCjbzjHQzha0eSQw0M9V35VhMeW/mkjV+wmah53Z3pKhkgOdVvCUC1T32A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iwmZCCph;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD87B606A32C
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 20:20:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD87B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=iwmZCCph
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-91e8938fd01so976566d6.3
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 12:20:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1794946858; x=1795551658; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
        b=iwmZCCphdPD1x9NpKAGRAkLHGnlZn3QfyJv3qfvp9XPhhRSewqxyZI7v73r3RSgDwH
         WoCzvgoEyD66b82fUx5PV0mYDGtZsqMB2x08McWwSU0bVPqDCdkvt7gmhwsn2ZkLJcsd
         JhisddqNJ1wjNCqZR5B3+1OENinsuBPGUZJtwHsfJ3TuNMs/WtwZ/bFXeiOcVEyEAaTF
         t60LXKwXWB06ooE+0kMS6+Fj9THBJm8GS/SWf4hOryW4k9HUoyjOfltj9X5R7uYCcy6w
         6vLWNZQ9NufRM7LscjCTN5MzdlmcbwtG6NSy4iFk7XiQscs8jvj99KZFGuuf4mwcq0dS
         2EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794946858; x=1795551658;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wJnPRAtsIC+/lFKvaSJITyDCcMmwBTIjrSEQdzWYjus=;
        b=Y/3XCbPihhm/2CBGSRx2aEbvJsaMTqH8p+MFe5ucjb4wr9mAfwtotUYkkDF/mEKof/
         dXyFyhoRNsbl7S9Jf/OTP1dBN5rJbfiBzV5xINMLtgCZwaW6Iio6vnzoCKnCMr91jFgB
         3II/5mktZKzJFEZWodXUn5cKCrVITiQnwyesYS7rWyJFoYvDH5bk/dDmckgC03DEYP0S
         d/nS33ZfazR9mVNjfdcV3iTMzKsQAHFV/DM7dGemgpdRa/hqQ+aAckr4ttXWP+C/ZKsS
         jktKJiWNy328XUfst4KIDozWs9Oj8xUgxeg247ETyARqRerEPRP77G/7pnXRLBnf8vEH
         Vr2g==
X-Forwarded-Encrypted: i=1; AL+hErE5APcuZ0eKUnr0IHrZ8e0YGzb1VYHhljiPHntEbAf4fAcPBCGKyBf7UQ7tgsdv7wY1L8MMOT4gzaCQyA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+OvUU+gn/05/X4PbACKktGCHJ7DLnLGBZI1+fqtnQJ2ACf1zgL
	z4GPkzoxxRBTSvTyr2qAdRImmUgBrlTUuajtHwhim1dxVjyO5Im/DRz4hxLkV9DkDow=
X-Gm-Gg: AZFdTZf4pk2/8uItdWfVrBfyDtn0FAFRWX2Itk7deLwtNVrRR4CHw85JpcrzYfZP5Dc
	58mRarVhXihHrIQ4Oo0RHX4vTDCWN5QRR7KZSznGTFfEfdtP5YhKZ58uJt/Dgi1aFbDCYWMh2YK
	OzoMTXmr65Wggty0H7OLW46U5ZptAoEq6Sw5aAvrQLdHwyGxBzeY4ftgFnf6KknNJZIKGv02Pgl
	UjkdczwjRADMcTv3uP9/gEaLU7XiMzPeg/TsT90gt5QdWJ/ldJ3U33UUlqBornxBQU8I7ql7ZMA
	/Ho2b1t8svHkxt69IXwc9F3JpX5AqiFQd2JzySd9g5o5lTxoc9TBy1zSOKwlQtBnwQAQvYpQd1z
	lfBLIzstOc40qUUQLFtTBJW6ck1WvJO5ufrox62TAQKwh9BWelw8mB5JP9d7ouX+GYXR1EU/DAn
	DEC03DAnB3xCwEwzqCtybW7v7YNVGF4co2HTP/lrBL03jRh2cBNDFyazf/0QsDk+wSMEQRJEvvD
	zju2mhQsHoL+HH6pJiJfFnrm3lsxnkjiOvTHe95RMa25I6HCfHoygHyDvCHCSS4X1r9sU/iAXQ4
	spIWgg==
X-Received: by 2002:a05:6214:3018:b0:91e:97a9:cf02 with SMTP id 6a1803df08f44-92114d84a69mr5475416d6.11.1794946857364;
        Tue, 17 Nov 2026 12:20:57 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70c72sm2569566d6.33.2026.11.17.12.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 12:20:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xTPfj-0000000DL2h-3OIS;
	Tue, 17 Nov 2026 16:20:55 -0400
Date: Tue, 17 Nov 2026 16:20:55 -0400
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
Message-ID: <20261117202055.GA3115493@ziepe.ca>
References: <20261112-b4-iommu-domain-v1-0-c29e86788dda@collabora.com>
 <20261116193821.GC2452510@ziepe.ca>
 <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
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
In-Reply-To: <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>

On Tue, Nov 17, 2026 at 05:09:11PM -0300, Daniel Almeida wrote:
> Hi Jason,
> 
> > On 16 Nov 2026, at 16:38, Jason Gunthorpe <jgg@ziepe.ca> wrote:
> > 
> > On Thu, Nov 12, 2026 at 02:00:07PM -0300, Daniel Almeida wrote:
> >> This series adds a Rust abstraction for IOMMU paging domains. A driver
> >> can allocate a domain, attach it to its device, map pages into it, and
> >> install a handler for its faults.
> >> 
> >> This will be used by the upcoming rkvenc driver that my colleagues
> >> Detlev Casanova, Nicolas Dufresne and I are working on. More details on
> >> this driver can be found by watching Nicolas Dufresne's talk at LPC 2026
> >> [0].
> >> 
> >> As part of the security model, each client will have its own IOMMU
> >> domain. This is needed as the submission model will let userspace set
> >> most of the encoder's registers directly, so the kernel cannot check
> >> every memory access that a job makes the encoder do. With a single
> >> domain, one client could make the encoder read or write the memory of
> >> another client.
> > 
> > How do you plan to get the paging domain in the first place?
> 
> We plan to alloc a paging domain when a video encoder session is created. Then
> we call iommu_attach_device() before a job runs, and detach back to the default
> domain after it finishes so the next job can attach its own session's domain.
> This is so each session is isolated from each other.

If you do that you can't use the DMA API at all in your driver as you
have to set 'driver_managed = true'. Is it OK? If it is why not just
use VFIO?

Or are you planning DT horrors to get yourself a DT created "DMA
struct" ?

> > Using paging domains directly is very complicated, I'm not excite d to
> > see DRM trying to do this at all. IMHO there are many unanswered
> > questions how it could even do this safely.
> 
> In a very simplified way, this is not unlike how GPU drivers currently work. In
> fact, from a cursory look, this seems to be how rocket (the NPU driver) works
> too. Since we are merely porting the same ideas to video codec hardware, I am a bit
> surprised by your discontentment.

In my experiance any place I see DRM touching the iommu it is
immediately suspect. We keep uncovering horrors that people buried in
there. Yes, you can point to some DRM places doing something like
this, with a convoluted struct device scheme and DT hacks to make it
functional, no you should not copy it and certainly not entomb it in
rust. :(

> In any case, we need this isolation due to the submission model used.
> Most Vulkan drivers know their hardware pretty well, so a level of abstraction
> on top of it like V4L2 is unnecessary. Therefore, in order to achieve a leaner
> kernel driver, userspace programs most of the encoder's registers directly, so
> the kernel cannot validate every address a job makes the encoder access.

Sure, but you haven't explained what the iommu gets attached to (ie
where does the SID come from), how cache flushing works, who programs
the mappings, who is managing page pinning, etc.

Are you sure you shouldn't be using iommufd for this, tied into your
driver? It was intended for exactly this use case, to allow drivers to
delegate their translation to userspace. Though that doesn't relly
solve the questions about what it is even being attached to..

> The fault handler is used in the same way it is used in GPU drivers: to kill
> sessions if they fault. This way the driver can simply refuse further work from
> a misbehaving client, for example. It is also the natural place to enqueue a
> reset if the codec hardware is frozen as a result of the fault.

IIRC no GPU driver does that, they hook the obsolete fault handler not
supported in new iommu drivers not the new PRI based one... IDK we
have even wired this up to work this way.

It is nicer if the HW can tell you it faulted rather than expect the
iommu to do it.

Jason
