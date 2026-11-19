Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795106208;
	b=fpDYEZzrzVRHt4r0vAr3Qsb3Etlscul4pDbc1te7545KsxBFwAxUG5QwG2KpUWA/r3+x
	 aOf0yq7UA2i+TyQTWntIFVvseckCG/2c18gjTVrF7//pI+dZs/qPrIMpyR6iMRk63HV8w
	 KxYfSu5SXe25/pZQvsjjjg1r2J7F5wLEhZoIyoLHb2MfpAW2AEx+UOp+CiA0gd3Od5vVh
	 uVod2VV3/Y2OF/JEY5jMDHU7b7ZjZc96VxlGQFNl667fUVNzyfNKp5pl91coUOljl1i8f
	 m/nikjtIKo9NWxaOiufccApeliPwqv8bDOIpO+5qtspJdwrBRHlhA4sM3j5SlIf7C1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795106208;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
	b=rmhKvbRViauTCwjZralSRzKDLN7TT4GgkTp6s3hJ1MJuGCyeeqEmFid4HOXqGgQ9cPDn
	 sB6JQugUAu1Z5ZUHfbxqke8qNTYgiAPMor1eXiniLlZrt8FFMcPelm8PIHjeeX0TyL67H
	 yOovF2fiqh6RrRUTp2+PTj/tkySxRstD5CgUBiQg7HmwTbaTWb48Ct2cD4eyF4Q50hYwc
	 U99D0ISYNY1UKHf72bLZoqncG8EpPmkRFflcty1/LL/a/mZNfKBkoAiMyv9xWgqmnVHGi
	 iA8y6HJXbcYI50GnlrhiwrjpTgPIkEcG5w9JF4M6aBxIelxoIogK/+2ttbGdv3BtE0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="ee0vMFY/";
	arc=none smtp.remote-ip=209.85.160.176
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3764606A330
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 16:36:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F3764606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=ee0vMFY/
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5365f9a04c5so32016501cf.1
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 08:36:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795106207; x=1795711007; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
        b=ee0vMFY/lHFOPnkS5Lew2i4ol2is42BGif9BdComERN3a7LhFXEfy6T/SKbP3jnWid
         tfgQSFZ4CsNorGGXUw0VV7aKAssg1uhVh+1lg3ZmSfOwVieQzmoBe73n8aTTrrdhUIBr
         JOVrZGjNhx2d0GtxuJraKUYFBRY02wZCWOI/WK0TUHpsuCZyKw0Y2eiLpwpDxEhoJp3H
         hD3gU9zNJgvLrvjRwAFUfzUlcAoKPcYTHNtDoqIPmNRzB5S/P1/rLjAD48ZloxmE6IpE
         kYzuRjttuID09ybq4OiQm5/d2lcz3hrXUQ77ODNEiWG8V9dmDa18sfdAyv9WKRoUyRCS
         UNKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795106207; x=1795711007;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=Upj9ElOF+MkYEJ4cOgUjnMJxMqLP7rtbsy3TKzTJtFk=;
        b=mvNu95qIkdwdOw7O5ocss7VOsKpbTQmYzlSQ9pRGobMh1nNaowBKLqzEXwg+hMpDR+
         Y874p5OCNJ0tBdfNoT71Mh8fv0HLd5MJjy7sKctn1qvYAHcAB12JQHZ1Nr9Snn2qTVrE
         rVp3knqi2YlfQuc311TKgps+mEm/dC81A5GdxyXuvRPtSN7etI2K7v8hDHft4OyECFzW
         7ipeegGcJmiqbt3vu+4qWXef16NBIdBVGF0Po5kINKPSbOHy16M29MZIuo3NmN0rDL0p
         Hum2PRG3iNIuXl3d1KbT8VY9UuNZ246Iwdr6P9GqmeZspAc+jTiKK8ZFFsluj12Hz7a0
         l0IA==
X-Forwarded-Encrypted: i=1; AL+hErHKK/1DTw+QyIHfQzqU+FzJE75yeBYRR9zqh4sXJZUG78QuuG8gwhsPRmzy7uOyRm0Nq+TYLACocR7hcg==@lists.linux.dev
X-Gm-Message-State: APuU4Z96qLElE6ww8Zb4Jf93M5nOYgMm/GbFZthCl+y3c8B5sDifHKwr
	sNGIg9ZQUY75i9CdE0z25HFzt1d56uegpraWyO2yOBGRK8g1PQ47QWqtp8UNrwOTmtA=
X-Gm-Gg: AYBFou0jpVOMGshKSvvrjnNzHPAcoiEMhAJekO7I2J/aAd787OnaAbOr70RpnEgRqly
	z3zFCky84d84sWS2zy4PxAHdijoKDMGm1JcggVHJAlY/o1o2YQgZl9oJnEwojYZ6aDBOuV723r3
	3i9wLK01QsIZj8IvStp8nLeXE4X56OJxM/CnS7w3ItW73u2fSa60H8msPQ1WoICMZVDOKxxu4C9
	kAebPMmJ8Ytjg68O/tj+n60I8evV3NFtNUesCdbsxzqzdJBO6yzQk5A+UZ3JNw0Qnl6GIqUhIP6
	BUibJJDCgnHi/zrfrbgeBi/Lk8bbRZ9kdhO3LM8DCxD8wV3XqLGCEl2nZ54homdDqEXto3O1lvs
	IwDJsdl17gtiEx6t8Iu+J5juwY0jzrXRijTxCsZfjb28uyxMBT5Sr+SsXmNc0iddJ+k0126cHTF
	ydmFtCzhDq1oT5tQp58Y5BUAngYxFCP2kDD1jG4xID30F0ptIyaUinXqUZpgbho96RgHIgH2pJr
	iiJIR+hKDTVUkgUoeiwWK7IVbFRbD55q0WXQWIIs1bV8jPiOJFd9Z+/0hTrMzc720MCXGpwU6Zc
	uQVb9g==
X-Received: by 2002:a05:622a:988:b0:55d:5ba6:bf25 with SMTP id d75a77b69052e-55d767ab475mr9697321cf.0.1795106206697;
        Thu, 19 Nov 2026 08:36:46 -0800 (PST)
Received: from ziepe.ca ([142.166.156.71])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55d66c52318sm27455131cf.29.2026.11.19.08.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 08:36:46 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xU57t-00000001A8R-0Ufm;
	Thu, 19 Nov 2026 12:36:45 -0400
Date: Thu, 19 Nov 2026 12:36:45 -0400
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
Message-ID: <20261119163645.GL3115493@ziepe.ca>
References: <3EB4C2ED-B699-4532-A562-68B78F6E29C6@collabora.com>
 <20261117202055.GA3115493@ziepe.ca>
 <b145b2ceb92c73a4fa0477d7b3895a6e3b4adf99.camel@collabora.com>
 <20261118160909.GC3115493@ziepe.ca>
 <fe60c0bd-1ee2-4b33-8ca3-564ee08e6db5@arm.com>
 <CF2BE3BB-4F16-49FC-8421-B2B823BB7BB4@collabora.com>
 <20261119143151.GH3115493@ziepe.ca>
 <32a64e144c11bec72908ce143044773808be5115.camel@collabora.com>
 <20261119150857.GK3115493@ziepe.ca>
 <da198506005be5c69d61105a5519121fe7bcdd36.camel@collabora.com>
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
In-Reply-To: <da198506005be5c69d61105a5519121fe7bcdd36.camel@collabora.com>

On Thu, Nov 19, 2026 at 10:47:01AM -0500, Nicolas Dufresne wrote:
> Le jeudi 19 novembre 2026 à 11:08 -0400, Jason Gunthorpe a écrit :
> > On Thu, Nov 19, 2026 at 09:52:59AM -0500, Nicolas Dufresne wrote:
> > > Le jeudi 19 novembre 2026 à 10:31 -0400, Jason Gunthorpe a écrit :
> > > > With the additional twist that alot of embedded HW has apparently
> > > > choosen to not implement SSID but instead has a pool of SIDs that one
> > > > device can use, functionally similar to SSID.
> > > > 
> > > > We'd need also API support for unbundling the DT iommus=[] SID list
> > > > into something that the SIDs can be attached more like a PASID.  That
> > > > need, I think, has become clear with all the DT tricks and fake busses
> > > > to try to work around this issue. :|
> > > 
> > > The word "fake" never flies with the DT maintainers. On that subject, I still
> > > don't know what you mean with iommus=[].
> > 
> > When you write your DT you can list all the iommu streams in one
> > iommus property. Like this randomly picked out of the DT files:
> > 
> >         iommus = <&sysmmu_decon0x>, <&sysmmu_decon1x>;
> > 
> > If you do that then Linux sets the struct device containing it to
> > put the same paging domain on all of those iommus.
> > 
> > It doesn't make any sense to open code this in drivers when you can
> > just have the core code do it by writing your DT to match how the
> > driver wants to work...
> 
> The will be rejected, as it does not map the hardware. If you check multi-core
> codecs, each pair of core+iommu are independent from each other, at least enough
> that they could be driven by different device drivers. And so they have been
> described separately in the DTs. I don't see a fault here.

All these multi-stream things have a choice how you model them in DT,
both ways are "describing the HW". Fully seperate HW blocks with
multiple struct devices or a single struct device with a list of
sub-engines. IMHO neither is obviously more correctly "describing the
HW" than the other.

However, the DT choice strongly influences how Linux works and drives
certain behaviors inside the kernel. So it is not just describing the
HW, it is very strongly describing the SW model too :(

Choosing the opposite DT model to what the kernel driver wants and
then undoing it with a bunch of code in Linux is not nice. We have run
into trouble when people go down this path and start asking for new
APIs we don't want to give them. :(

We had this chat with the DT maintiners too, I think everyone agrees
things are imperfect here. So far the direction has been to change the
DT to match the desired kernel SW model rather than hack the kernel to
accomodate the DT.

If you truely have HW with frozen DT in firmware then maybe that is a
strong argument to push back in this case.

I recognize this is all imperfect/problematic :|

Jason
