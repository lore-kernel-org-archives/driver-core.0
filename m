Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795527859;
	b=0SsQssppqP5XxaRb5ju4e24griDr5wgZFTxpqmoyy6yJ951ijc+PpAhBfl5+qf7qqzt4
	 qqcyJ5xfXw/sHz0nmArmXIonyDR3GRkAolNMg7R5kjeoCaQuAGJ0PqCyr/CCO2lbED/bx
	 GR3mpFWokzIZu9ue75NnP0YtNqV/4jDZ2m0aHIclKLNISCujh7Ago22XagHIciyVlp+Y2
	 UJwBxIUFNQFyJMGIgDP5r5HogxYd+OeddZCGvPgpcnJzLhca7oh5DtMaJnxJGiPthGoDx
	 W5bx03UFopBXSagyfvjZvZqXI+q1uZgCUkCBzpbsi7NQ7x8B5XmqJqnIfmQck7XI6Pg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795527859;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=GOO2liEeh3ZNTv2cYVirV3xpcqc+Z2dTdYpM4j0pd4M=;
	b=oHkwwG2CmSV9/hhO55nyM+aXvPC4jvXFt05uRY3NQTMn57EaQ5SIPPFyub+CjLUajR6P
	 9bg6wGixeo+S8pMXpsXXVEc4r1mgqicriqbiqlDEEWykaaYZbuZbPFuLmgO3cq0Ex70wm
	 72e2j+A5E45iOhmZl034ZkCM//vcUGjpYSpLUECr+0HgIDuve2PTHPRuOH9Gzvdf3Cxoa
	 E/W0n+PjMFgp7GwZ0Ov9v9qY4DnMiIEUHGOyW8ApUzygW3eDH87mIpjUritOd0XK83Y2l
	 CHJIvWNwAad+pZ89CxdJ09qc1r5yWlggEpLyblTLbgZiujpczTOumb9QmbIrMGPXF2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="fxBd6d1/";
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07FD1606A326
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 13:44:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07FD1606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=fxBd6d1/
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso62635436d6.1
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 05:44:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795527858; x=1796132658; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=GOO2liEeh3ZNTv2cYVirV3xpcqc+Z2dTdYpM4j0pd4M=;
        b=fxBd6d1/8uC1nMuxQ26Hy97S88WFxPZpKH9iERv491Rw3cwRIDH6U6QK5PqpwalQaP
         y241V5L9IQCKoZ+XwCrcqq/ZsiZkim6aOF9ev6lTFe6GuaKjZjlzBtMj0fUiJo1qUmpm
         Z2dx2RUoaAKBK0N8wU3UqeIk5J3TuOPwJYg31cSLwqdBZTvHv+qGbDbgG+K0TqBC1OaH
         Ov8zmAdg364g/mUbDSGSED57D/F86datpbDZZ+SOjLpeVCu84VIHTjWaLftjRrIT9IEa
         h9by/FazbgIVm3Z84KxjHt2hz/vJ9mZaWXmok7YA3cu88hdd3KBaF7GXojSqjhmNzkr9
         WKPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795527858; x=1796132658;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=GOO2liEeh3ZNTv2cYVirV3xpcqc+Z2dTdYpM4j0pd4M=;
        b=xAmg9wW8Da/8O7DguGLkDaZ0G8Y1IdXOf5ok+5sCITBY6AaZgS7qX81s2Wuw9KN+Lj
         13CUmCmM5xnkmmxtThwnq5ofWm6yU9vMzGLdMeGzq8JTwqZkwoTkccQTP+VY6TliQpRd
         TPr2ikpYgj5jh0ZgTd34kCwZE2cp0h0nGIhfHKiGjc7l7QMIxlRWf/UFCXyBelZCPUhv
         qwF17SRk64XqnONcU2QoA3nLY0Huo2QPiLYTHxfOs2P9V4flUqf9OjE6NreIywm2XZzt
         attgCs0i5CKgcZdN21OXugcWj+uksPzf/i4iraHSsWOCRTmpI9qDnM+Tyf2ZSYZjK/n3
         5GXA==
X-Forwarded-Encrypted: i=1; AL+hErHUyTDm+d6uZG6+0QP3Smvue7YlACK3kbK0R+sPN9eBg8c3mEAh89Fjahw+egemv7/uzvzcB5nKc18vAg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+HdDh1J0k10vjzveelRGSNxvBLtNYWr5t4wrPT/Wg/Sik2AF9P
	ypNsiFZYLKmvqKdNW6h85Xml1sS2QzxEWiVHwy5/mA1/wEBKGQE7YGxoyDCmDrH4xWs=
X-Gm-Gg: AZFdTZdHyqAm13ea8PGY/sjBP8FBytNOGIAaM60AAEaNkjByCDPv3VoJd2rO9qscE9v
	fR554YglRUxqxdM7vV0sfOtJadCJuTcNnPYcGrzb19OQfEZj2EpFMBoelvifySDe9bChivL4HZA
	aD2YEjCAio9OrnIc/qd2Hv8m8LJcDGrzebOXOYNRhNa92ImekfU2fWgvNTsWTiPgVJcI7n5QjZk
	jpsnoEs3rNsfzWZ5CEhWcUK1AfZvOGQ8sGZrQYNkxsExyZerT4RlfetOvSg6fNe7clWfYTrlHXn
	8VgsAai/P4kZbRe72AiN2NRsrGhNcHM5mvPpQIhwV+YAA4OvAlxIvuHVq/N2AdV132rhKTn5YVZ
	Ed1si/KnMdK6o6x6niqA3oCGd3Ub/7parx67pKj0afg1zaSRd4f3P4i2uqgI3LWcW7RVSjni9MM
	DDf9ubsq+XXRgukcHwW+psq7qJDYqYMhf/ohHHJeqU1O3jZK2ri7i7A62v8/mPHntRQko7Frsnw
	DA2/If2CfqUZAReEGzCxbot8L0TShEuKT88x+SEcCTFBtNZc5PreqR4LF+lYq1M1za6bAV8GM0t
	EVbA6w==
X-Received: by 2002:a05:620a:6c01:b0:93e:c12c:43f9 with SMTP id af79cd13be357-949bab6e243mr2406376285a.70.1795527857835;
        Tue, 24 Nov 2026 05:44:17 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb3ba04bsm1055445785a.24.2026.11.24.05.44.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:44:17 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqoi-00000000QDP-3RBH;
	Tue, 24 Nov 2026 09:44:16 -0400
Date: Tue, 24 Nov 2026 09:44:16 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Leon Romanovsky <leon@kernel.org>
Cc: Nicolin Chen <nicolinc@nvidia.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 00/10] PCI/TSM: Support guest TSM drivers
Message-ID: <20261124134416.GH9566@ziepe.ca>
References: <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <20261123185826.GP14811@unreal>
 <20261124131754.GF9566@ziepe.ca>
 <20261124132536.GS14811@unreal>
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
In-Reply-To: <20261124132536.GS14811@unreal>

On Tue, Nov 24, 2026 at 03:25:36PM +0200, Leon Romanovsky wrote:
> On Tue, Nov 24, 2026 at 09:17:54AM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 23, 2026 at 08:58:26PM +0200, Leon Romanovsky wrote:
> > > On Mon, Nov 23, 2026 at 11:25:33AM -0400, Jason Gunthorpe wrote:
> > > > On Mon, Nov 23, 2026 at 03:56:38PM +0200, Leon Romanovsky wrote:
> > > > > > >> >> But it should not, as you are making driver core changes that will
> > > > > > >> >> mirror the same thing that that patchset is attempting to do.  Please
> > > > > > >> >> work together on this.
> > > > > > >> >
> > > > > > >> > +10000000,
> > > > > > >> >
> > > > > > >> > Greg,
> > > > > > >> >
> > > > > > >> > This series came as a surprise to me given the fact that device trust
> > > > > > >> > series is exactly for that - allow confidential computing.
> > > > 
> > > > Device trust's primary role in enabling confidential computing is to
> > > > give space for the userspace to do all the TSM and attestation stuff
> > > > to get the device into T=1 private DMA mode.
> > > 
> > > <...>
> > > 
> > > > Getting the device into T=1 should influence how the userspace decides
> > > > to set the trust level, but it doesn't interact inside the kernel.
> > > 
> > > The point is that I’m describing the reverse relationship: the trust
> > > level should determine how the device is configured, not the other
> > > way around, as you suggest.
> > 
> > They are unrelated. Neither influences the other. The user gets to
> > make orthogonal choices if they want T=1 DMA and if they want
> > adverserial. All combinations are useful and valid.
> 
> Our proposal is to represent these combinations with an internal trust-level
> enum and manage them in the kernel through that FSM, rather than maintaining
> two parallel sysfs flows that permit every possible combination.

We already talked about this when Dan proposed it. Combining entirely
orthogonal things into a huge enum is not a good idea. It creates a
combinatoral explosion, there are more security related knobs than
just these two :\

It is not even a FSM, it is a bitmap of enabled functions, and that
isn't an enum.

They are orthogonal subsystems, they should remain orthogonal in the
uAPI and we definitely don't want to use trust level to control the
TSM, that would make a mess of the SPDM flows.

All this was already discussed, it is why these two series look the
way they do..

Jason
