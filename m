Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442040;
	b=1AISl8nYEexBShni9i1cAIGv2S1n0XWDVyPIDggirLMllWXBtCIWmgt7Wohl41KfdXql
	 lykJA41PSSdHt3+ngUoHEmmM9H9j6r57LZ8wMY0ILcCSuHTaXBctd6Lm+cG74rWO6BAWi
	 iNflNOLVfj+05uLdsqAr9yK8o5dVSxuZlrvsSmGJ2Vh/1Cu2abEG0B77JWmtsKacMgcZy
	 dbTab0hQ6BP0wYcaKgsXXJke1oliwIYKv5oSq5osTLERQ6Li4aWyXbwGngKZ1+RLpL6x5
	 nXcne9zQOlLeik+PD+lq0vg+LhDbyVeWSoh9iF84m/tTpStSGBPjLJi058a8eJOo+bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442040;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
	b=dmT2OmWVJp/iqFjYFEpeB1YFKd7RHgRxymyJxB5sOipaqKD5ZE5Bd1932y0dnzdM7f6E
	 UBa70zOj38hSlRtr4xbl64BOpfBwV1DCS/hxJ6eGpQKyjmsqTKg976MW7Qh3tLDM3/FCo
	 CAzunSOGLOWthR8QKr7oN072CnGQG0/6hA61E4O7QWyEtQFIRYGH0+CgBwsMj6sbqcMzF
	 jngSjMMNC0jVmah9cx8XvbPguRcp4KBfSiKr+z0HvxEW3x3cNhhcysa1e1V1SeSk9CAOa
	 loLhCMlAgQhfufWpDkCnRfvkshSdSSdm8BhIJqu5Yi9wAS02Iog/9oUszLoR23UMmmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaGQtaPj;
	arc=none smtp.remote-ip=209.85.214.169
Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC274606A31F
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 13:53:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC274606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=SaGQtaPj
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2f048bc09d7so98325ad.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 05:53:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795442039; x=1796046839; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
        b=SaGQtaPjyQqTzIS0HQBIVTfCrjBLwcBrJeB/jkbZyIdihQqnWziI2ZxcCy4tAUIkPp
         JAN6UGKbznOQKsoS/rP8wbuN31V/811bI573fePxHFER9+VFpMPDvZbDzIELrEg2tK+q
         lQ7Co2YtXEpPXvXlUsGXfYo4nzgUB378G2pKuxL3uMPlerN9PYDr/u9QlT2YpDjlxfkN
         yZIUU1NILjL03DCipg705AIWu28rMNHsenvWNM2Rqf6pWtOj69FjkPpkoFPPzvUMhyHl
         ZYXV6oK62Q/OAwJI2bl5SmpwsAVgCI+QWGhQ7Vd3TFnhKkzKXySTjcDqPRJNYbjqKeri
         kXaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795442039; x=1796046839;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=MOqSPuzgFkgUUA2YNUWCC5n6SqQAFa4aMwyIiBrPSGc=;
        b=P6/VFbkYZikB6D3zqanGcIglMTp1M/J1wmR9VT8oRjL5ayr3koruS58OwkPL/6yThM
         aNV3XGwAGHEgRcC4aQLcnSwYyFYWIHrqkxX1UmCU6Ggk+ESrZYZ4Dz8Kcy6P8apbNOYZ
         2iyUFPijtQ7EnXcXV9b2+eAjrzb+UHSMwO5IpPKfidUd87ZkrCl4ovpT618ezbNkQwVF
         hBPE50+MWrjUrRktPx3ZtL8l9ei0qEE+wZb2AWymjc67mRsO5Fe5ULhjWHab9Iv+pMUD
         4zuss2sjcJBEEgnQRUpsQhLA1yBOtS87uBNMoOesckuqg/l772ZXKIE/fOnmZ5BslFel
         lUzA==
X-Forwarded-Encrypted: i=1; AL+hErHKo8xssDbqL0JqAEVT50MuhlbPwe+U+j9ArCGOBLZcap0TkLkX8yC19hL18Bwi7WypOKXJxVyXPsW/Xw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9Z3tGvQXyslmVXWsUSm9rGM7wRfEoKN4YYatH4CgNl5gS7Zb/k
	9klCApiEtQa9D0WFp6EQ7Q2JJePxc+MdLxM9yG89+Gn1WOVB0Ou2dL7NoD/PYT+4VA==
X-Gm-Gg: AZFdTZcSx8yqHIBEUbGTMrzYVRypvRKw3LJmruZVOwvB8bXRNiADrGVJXM5a1pxXHr9
	6HWcNltv/9BTBTQS7yE5h4pjJvTzAC5FwKeD1nZrIQBgPoKoZxBT8fdy3PuNnuQwpQwrcIK7NPa
	j4ey+C1rFaqy6NElk/AwRyB2e7t0/LQ/Vrr039Q1wuYyW8P6d59GC0gfMxhdP1nUC85b5MujxiO
	K/zZm4G3PUpv3TjMmcuth2bD2YmJe/eG9/Se2WWHBnx/1HpmEpvu0tP88haR1mXIf3VTy2AJtbe
	8OUhRiNHsyR21ghRk0s2QrczNRaFE+e+NxrnTd/9QQkczqAbQ9eNhh4nY+9N6aBp5gtIDoVHdng
	iY8nVIrK51dhZfN8yjJA/tzVD1o9tZqHSa5Vc7mmAkybFaFxYVPuw56QaBMfJ3vG/Ma9HlVGWzw
	QTrUdRv0LRnzZqpeYpLfdeSpun//xG+7yZmj4GxteK9ep735sZOidHOtPPmWTrk9sgcjT/Vbc/6
	yGmHiKR5OhIvx+da/OAPQcrOn6ZZqxZvIt1FknTNL2PLko09q3Vt0y5B8t/khVmC7OcQkowZaJT
	MlG3lMb+Exp84bX+XOPTFXPkHk3g4Pi2y136+5tF8a+daDzKoS9b5KPLQqdoVuaqFTk=
X-Received: by 2002:a17:903:3c6b:b0:2ca:4bb4:4bd with SMTP id d9443c01a7336-2f062bd72b9mr7103195ad.5.1795442038751;
        Mon, 23 Nov 2026 05:53:58 -0800 (PST)
Received: from google.com (105.211.142.34.bc.googleusercontent.com. [34.142.211.105])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b73b2b3sm7836326a91.2.2026.11.23.05.53.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:53:58 -0800 (PST)
Date: Mon, 23 Nov 2026 13:53:51 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Daniel Mentz <danielmentz@google.com>
Cc: Will Deacon <will@kernel.org>, iommu@lists.linux.dev,
	Joerg Roedel <joro@8bytes.org>, Robin Murphy <robin.murphy@arm.com>,
	Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>,
	Nicolin Chen <nicolinc@nvidia.com>,
	Ashish Mhetre <amhetre@nvidia.com>,
	linux-arm-kernel@lists.infradead.org,
	Thomas Gleixner <tglx@kernel.org>, Radu Rendec <radu@rendec.net>,
	Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rafael@kernel.org,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
Message-ID: <awRFb6Q6WW1Ys0vq@google.com>
References: <20260929034510.2023173-1-praan@google.com>
 <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck>
 <atXTtaxz0z-U-XSJ@google.com>
 <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>
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
In-Reply-To: <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>

On Wed, Nov 18, 2026 at 12:27:58PM -0800, Daniel Mentz wrote:
> On Mon, Oct 19, 2026 at 1:24 AM Pranjal Shrivastava <praan@google.com> wrote:
> >
> > On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> > > On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > index deefb17e31eb..794b258550dd 100644
> > > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx(unsigned int ssid)
> > > >  #define CMDQ_ERR_CERROR_ATC_INV_IDX        3
> > > >
> > > >  #define CMDQ_PROD_OWNED_FLAG               Q_OVERFLOW_FLAG
> > > > +#define CMDQ_PROD_STOP_FLAG                (1U << 30)
> > >
> > > I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it's
> > > plausible that the architecture allocates that bit for something in future.
> > > For example, if the index field was extended, then I think that would
> > > cause problems for the driver.
> 
> Let's cross that bridge when we come to it. I think that for the
> driver's internal llq.prod, we can deviate from the layout that the
> architecture defines for SMMU_CMDQ_PROD, and as Pranjal pointed out,
> we are already doing that. If the architecture eventually consumes the
> current RES0 bits, we could save them in a separate variable and only
> overlay them when writing to SMMU_CMDQ_PROD. If the index field is
> extended, we could artificially limit the index width in this driver
> or transition to a 64-bit type for llq.prod. Also, it appears unlikely
> for the index field to be extended beyond 24 bits, because
> SMMU_CMDQ_CONS allocates bits [30:24] for SMMU_CMDQ_CONS.ERR
> 

Agreed. Thanks for pointing out the CONS.ERR part, it does make
extending index beyond bit 24 less likely, although I think non-index
fields can still use it?

I like the idea of extending to 64-bits with an overlay thought.

> > >
> > > Do we have to put the stop flag in the producer value, or can it just be
> > > a flag elsewhere in memory?
> > >
> >
> > Fair point, but the flag is SW-only, i.e. it's always stripped via
> > CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
> > via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
> > uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
> > SW-only marker in llq.prod.
> >
> > Keeping it in prod is what makes the check + slot reservation atomic in
> > the cmpxchg.. with a separate flag, a CPU could check it, then suspend
> > sets it and samples the target, and the CPU would still reserve slots
> > beyond that target.
> 
> I think that the suspend thread needs to ensure that potential users
> of the command queue either (a) observe the stop flag (or some variant
> of it) or (b) are accounted for such that the suspend thread can wait
> for them to conclude their command queue operations. For this type of
> synchronization, I believe we do need some variable that both the
> suspend thread and the command queue users access with cmpxchg or a
> similar operation. I guess that in some alternative design, we could
> use a combination of refcount_inc_not_zero in the command queue user
> threads and refcount_dec_if_one in the suspend thread, and I believe
> one of Pranjal's earlier patches used a similar method. The beauty of
> the current proposal is that we re-use existing synchronization
> primitives and don't introduce any new variables that we need to
> access using cmpxchg.

Agreed, and that also matters for the perf concern John raised.. a
refcount based approach would add two extra atomic RMWs on a shared
cache line to every command submission, whereas with the flag in prod,
the hot path only gains a bit test on the llq copy it has already
loaded, right before the cmpxchg it was doing anyway.

Thanks,
Praan
