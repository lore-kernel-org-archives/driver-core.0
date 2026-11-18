Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795033692;
	b=klGdE034FHk0VKr4gk/wj/vRH+4RQwT7GhtEWmBwVaUtD++eGsMRV7M1zgrh15wvE32w
	 7mcNJmmfHAXfe4a56zkDKnvczWJww51x7TX8xoW1lYQeu0GSxN8Z7yqmoUeAj8bwyCf8Z
	 1Q4lJpdEAFTjzF8dIbni3Qtu4jXoqGzSbp1d/O9c7K9RO0e7O2npt9f2bGQiHPj+I9UKE
	 9a3sHFLW82JuFy95FihVjhfxB7Fm2ILwCHV0qX/xwubrBPHMySRhSFFlbxi9KPea6vmNB
	 TlGDxERnVFbBk8aCxrCSdmtS9eemGorWea5pDoGf8/xs7gNp9cmLf/z4FHiuE3G7hmQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795033692;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
	b=2JO71U7xTUDk7OUBSpaDoz+lyVLR8LfRTfrS9X1d7gIyYWJgXNn1MaAqmSm7LM4tw8Py
	 hjawxVGf05DyHg/D/fVcYINXWhAfYfLCBoufQ48mz/r+oz0rCQRBkp0Yw/2afrGcthnDF
	 j6nzlIAA00SSgU2RTiSZUdorbPApzXqpV3RxH6bq1RVe9bNgODyJEUkhxYvL+OXk0B54E
	 WZg9Gr1UJ/0lOkn2Y8QVmPVlX5OI0K+E3a+Kla+wc4vOjOSWjyzfxYhs36dLU05GuFbaH
	 OOdhicHRlM/m8ubgUJD2x5ekVa8fEUIBeJwAdUoxY0OsM1f4yOSXymX4I5tB6Hk32mg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3KrQbI3;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.173
Received: from mail-qt1-f173.google.com (mail-qt1-f173.google.com [209.85.160.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DD54606A31C
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 20:28:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DD54606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=l3KrQbI3
Received: by mail-qt1-f173.google.com with SMTP id d75a77b69052e-55c7445cf85so2581cf.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 12:28:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795033690; cv=none;
        d=google.com; s=arc-20260327;
        b=M4Ihd6JgVOiYlJgctM8BvWCA5HUGhfGfQ2VwqmU3TolaxSj3Q9A+Jiww0UtfBUuws1
         B9Ut7JjeulnXZarv7D0doBTlrI9ezkP32nROrLrnaJf8njpo6Qj1kBWkPAhRXX5L+FzH
         vchehEaJxnpTouZVT3NBNelZOrg6XfXP7cvkol/oI9zwe6IOP/gPRKA2WcR5jiswb5t6
         MhQHR7inUCVeOBNa1s1klTY+aCdqM321K5DyYmnolplHQIx2mOXWGOWy6lDHZe+jeo1p
         LAu5psb0lRaHzYWUrTJpkPkcVHpI+ItfR6/TigsptRVYqdQSuMQXjjspJ2jcVsWyS3ed
         h0IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        fh=IQza+rC3d32UEiPEGIqxfOnkqJtjJmPoMmyhZZpsJ4M=;
        b=S7gZpBpl6WsExahROKMWIp6EZOi71qeecKwFe7ArVUh0CslLjq7385WWkc4y/bRNEQ
         KQKZqy7emCcaD/QcH7cjGrrKAjC92bcmi4VqBlxmAnkWcw29V3DWk4E/NJVRRngiFAhf
         6gZg8Xgcs/vUXdaCk9VrI9quhXHQrUJ2tmK3kMXV+wSzUflXtuhb3+UacA+u3O2pephv
         qH+oRGLJo6jkDgid6MLLblEqDJocMrfEttyyD4Y7xeHHU2K/5Dh4FA6sULRs+lLJobix
         j3O4APv71yFlrQUASMHmpfj+OB4r/avWcxmbJ/cVSZCEq4yt4FZeHXgdhGZp3x9ygOMc
         71wg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795033690; x=1795638490; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        b=l3KrQbI3wpt7Pkcg+Tx0v4f3gUVat1kdGdMnIn9lSEhb5YCYI1mLAwJCaU26QtaAoE
         0OPkGfQePmFLkIXbeS3XAgNkPM1GpBxfTcfLyRGsy+tOKJApGncc+VHDuFNBCgFE7A2T
         a46wKfXuLWH0U6q78tgpwS92WlI9KYnUERPfn0OB1jzVCf17taEta57EsVEFhK6TYGRK
         oVNjsXGR4ErVwv3PzsT4mpFZTGYUxzRwhvaqgGU9a0Q9NYupfjm8hoxz808urG7zDk6Z
         VojHYeixy/ZVDwUWdb6fm5MIE8Bc/uZfWY/UJa8eTT0oT18mROptPmpPyedkxNrFSqsu
         ++Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795033690; x=1795638490;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z+AogC8EDUSE3HLZ3UU4rCjeQfZxM4jvNiwuUF4qq2o=;
        b=LtUhadPvixNDB0ddYsyARzLX45+xmek+vZP1sVU6kNprePuUjBBDm4v4M+otR4llKt
         RVK3dfZld7aVoxdOLfL6XgC0Ajetzh/DyS+OqWoW79dBy2WhkFmBRFVqome87X0lWpwN
         bC5d1TMS08Ka7ag1Sd/cY51ZaalYNyWlrx7OgY1m2Xol5HHPfi5gf/Z7NFvsdEjvFP5r
         cgE4LTIOcsETOMSnqR1pKLGXsVfE2J7wGbRIIx2I+DM7z2TcYyUeXhztkvzdZqSrnmoD
         BouTxxsenfnvlsCFP5TXK2SJoEHz9jYhO1LDz1E5sQmQZTTjMWJgHU7Hv3ge58/RhmzC
         m9rQ==
X-Forwarded-Encrypted: i=1; AL+hErFZaxkyQMZK2WHZHOdKE/ExQgRYLg/Nn5vzgr2Ith4PVrk9rUUQIMrO+VuiyAgAafmdB0j5EJWJ/ctW9g==@lists.linux.dev
X-Gm-Message-State: APuU4Z83E9cR+il8uqEfUjFVOQOWo/qBwl8mQJu6L3zG0EqAFgxXdnPA
	4GkgyAcyKBzylLqhElWuwwJE81fxDvjNX/qGSSbQnQBLf2uWO2ET6i/XMff8RVyinQdkhTbvIIy
	e7MGHbOAOi7IGrmTQmQr14Qna2ALL6EjueUVQxrSF
X-Gm-Gg: AYBFou1q6v9JniJ0lBc9pqo26z8jhVofDS0edAn/Ym7gpJMVSTbKIHYVws9FZl8k2Mh
	lS6T2mJVnrmcu/EHIaEBNhztzYvRDWVL5BbTjT5DjoybTIz8fW3+QM14vz2jjR+XRy76k+ALy8R
	RJ/Skp0H5ls5kQox0uPmekC3TcWoeVx1DQ9WN8ZGsahMhQhH8ZLyzWILAFuPNxcVvHNMglduWjW
	437cDD/jXKRWudMtG95IVe38GOlYwj22RheI7iqHg2rhr4XGkxukIO3BDjQYWWePKBz7QaOs3sv
	RhZQQdRNIzcQQqA7iMwspnITVl4DlODcGl5vNVxEWepfKqTqv8yJbXb4XeCUWOFxMcBGn0NOOjg
	NXwYsrZZ2LrpWUYCV2367bACwRhgfkJDYfHr38qBSK7hxtucJpOZz7hM=
X-Received: by 2002:a05:622a:4110:b0:55d:3243:574a with SMTP id
 d75a77b69052e-55d6962de96mr3088621cf.3.1795033689803; Wed, 18 Nov 2026
 12:28:09 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260929034510.2023173-1-praan@google.com> <20260929034510.2023173-12-praan@google.com>
 <asZSQRSYBjbUaaH0@willie-the-truck> <atXTtaxz0z-U-XSJ@google.com>
In-Reply-To: <atXTtaxz0z-U-XSJ@google.com>
From: Daniel Mentz <danielmentz@google.com>
Date: Wed, 18 Nov 2026 12:27:58 -0800
X-Gm-Features: AclHuK_palFTYhnGqFKwt0cs6iRNA8xAzy9LxCS_GSW4lMdE4jAyePa6AgRLHZY
Message-ID: <CAE2F3rDd23TcWELEu0hNZiw+At==HZjZ=4KWGc-KPoZ4YiFxSg@mail.gmail.com>
Subject: Re: [PATCH v11 11/16] iommu/arm-smmu-v3: Add CMDQ_PROD_STOP_FLAG to
 gate CMDQ submissions
To: Pranjal Shrivastava <praan@google.com>, Will Deacon <will@kernel.org>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>, 
	Robin Murphy <robin.murphy@arm.com>, Jason Gunthorpe <jgg@ziepe.ca>, Mostafa Saleh <smostafa@google.com>, 
	Nicolin Chen <nicolinc@nvidia.com>, Ashish Mhetre <amhetre@nvidia.com>, 
	linux-arm-kernel@lists.infradead.org, Thomas Gleixner <tglx@kernel.org>, 
	Radu Rendec <radu@rendec.net>, Bjorn Helgaas <bhelgaas@google.com>, linux-pci@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 19, 2026 at 1:24=E2=80=AFAM Pranjal Shrivastava <praan@google.c=
om> wrote:
>
> On Wed, Oct 07, 2026 at 03:08:01PM +0100, Will Deacon wrote:
> > On Tue, Sep 29, 2026 at 03:45:05AM +0000, Pranjal Shrivastava wrote:
> > > diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h b/drivers/io=
mmu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > index deefb17e31eb..794b258550dd 100644
> > > --- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > +++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h
> > > @@ -394,6 +394,11 @@ static inline unsigned int arm_smmu_cdtab_l2_idx=
(unsigned int ssid)
> > >  #define CMDQ_ERR_CERROR_ATC_INV_IDX        3
> > >
> > >  #define CMDQ_PROD_OWNED_FLAG               Q_OVERFLOW_FLAG
> > > +#define CMDQ_PROD_STOP_FLAG                (1U << 30)
> >
> > I'm unsure about this. Bit 30 of the cmdq prod register is RES0, so it'=
s
> > plausible that the architecture allocates that bit for something in fut=
ure.
> > For example, if the index field was extended, then I think that would
> > cause problems for the driver.

Let's cross that bridge when we come to it. I think that for the
driver's internal llq.prod, we can deviate from the layout that the
architecture defines for SMMU_CMDQ_PROD, and as Pranjal pointed out,
we are already doing that. If the architecture eventually consumes the
current RES0 bits, we could save them in a separate variable and only
overlay them when writing to SMMU_CMDQ_PROD. If the index field is
extended, we could artificially limit the index width in this driver
or transition to a 64-bit type for llq.prod. Also, it appears unlikely
for the index field to be extended beyond 24 bits, because
SMMU_CMDQ_CONS allocates bits [30:24] for SMMU_CMDQ_CONS.ERR

> >
> > Do we have to put the stop flag in the producer value, or can it just b=
e
> > a flag elsewhere in memory?
> >
>
> Fair point, but the flag is SW-only, i.e. it's always stripped via
> CMDQ_PROD_IDX_MASK before anything reaches the HW and only ever tested
> via Q_STOP(). It's the same deal as CMDQ_PROD_OWNED_FLAG, which already
> uses bit 31 (also RES0 in SMMU_CMDQ_PROD, IHI0070 section 6.3.27) as a
> SW-only marker in llq.prod.
>
> Keeping it in prod is what makes the check + slot reservation atomic in
> the cmpxchg.. with a separate flag, a CPU could check it, then suspend
> sets it and samples the target, and the CPU would still reserve slots
> beyond that target.

I think that the suspend thread needs to ensure that potential users
of the command queue either (a) observe the stop flag (or some variant
of it) or (b) are accounted for such that the suspend thread can wait
for them to conclude their command queue operations. For this type of
synchronization, I believe we do need some variable that both the
suspend thread and the command queue users access with cmpxchg or a
similar operation. I guess that in some alternative design, we could
use a combination of refcount_inc_not_zero in the command queue user
threads and refcount_dec_if_one in the suspend thread, and I believe
one of Pranjal's earlier patches used a similar method. The beauty of
the current proposal is that we re-use existing synchronization
primitives and don't introduce any new variables that we need to
access using cmpxchg.
