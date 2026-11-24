Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795526276;
	b=VYUQNcqYRV994twg9XV7r4EqNVgYOpyrwJOUsWihPcaYoGA87SsT4xAy02eLjQFTyafV
	 KeHxDCVKOMGL6XOKs/s1/556/2bIFVNbcng4w46y9WPXmTmMbv80rFFPybgTyTZXCcPaM
	 woQAvIIsVfuQDi4Wxh3qd6dOEGnj57C+pZh1vemis2OZbOL7Kwk8qi08Pp8+xZW+hh4yk
	 Xp+Tqu8Tj48J9B1KY7qCz7FpLGicxRCJg59EGYGLf2XgjYueonOU50krs0Bp7OnQ2Hv+V
	 berVUW0/vdorH0aq4lNMzpXZCHjcHz2F9zOobxv8EHxIzbDdnT+8RRSWME31F6n0j9g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795526276;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=JQr5O3TAm0LrUQZ23OaV0ywjiZMgF6OfZ39GqtSUwII=;
	b=KoN9Qk/w4kckTCK9YPs8ogvTDaqJFLsY8f7kjCpR0sDd7iiDC35LZ1ajykudnDlvUL3M
	 2dxSnunK11VU9oOfPLFGBByfMYr4Rym0w5w2A682H0C8KyO3jfRY/lf3FbShMzDYAe050
	 L7uWKCmyXM9U8/o2U9K2l51tfyvlRmibuBhWnzZz3FGL78Y71iaR50DBQs/6Vx/q85sbx
	 jRXY4XHXk8Midd9IoSakXDXM4IgOun4O54QeWJfbpKQq96fsrRQeHRTWokFrOUWsBSl0e
	 CvzJKTd+76TFJHs30by5Mw4uQAwWbf0hmp7hR7ebISyU4TgzE+XEqtVop8ZGaf48aJw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TpvdSgOk;
	arc=none smtp.remote-ip=209.85.219.42
Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44B8E606A321
	for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 13:17:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44B8E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=TpvdSgOk
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-921318b2eb8so60139536d6.1
        for <driver-core@lists.linux.dev>; Tue, 24 Nov 2026 05:17:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795526275; x=1796131075; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=JQr5O3TAm0LrUQZ23OaV0ywjiZMgF6OfZ39GqtSUwII=;
        b=TpvdSgOk6WWTGFrKx+ao/aLASu3ndPzaaz5li6JnfDuEhWglOpNDI5WFworLuX0nTe
         qpBnYjSpJNdhCbC2gmEIpIsdBPbT2Zmgqg7/k2rNUzvQY+ejQ5cJO12J+e52++rmzesM
         5umcH2u+3NOE/kslAqvgxLmN2+4sWO3hTbDBO2/8vEG3A5T6Pl2NQRjHgrGyDp9hJUh7
         nZDDXLHaRmYb0bYKcaqg5eFd7TZ2okx4ZRhDzBcyHLfzM8dXDjuW/GzZj+SYhSw8YSiU
         j3AW7MdeUNEnbYls2zPXGVFNVytP9l4PvBRamUJ11wmoireW/QepFFY3RQUgQ1YbZ5uN
         8KPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795526275; x=1796131075;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=JQr5O3TAm0LrUQZ23OaV0ywjiZMgF6OfZ39GqtSUwII=;
        b=lxgj6mPv0eWX9c/kM7gicnDHSi2YaN/TLcRyb/OrWj6DICG5EOm/N+zdl+KJ1TpzHk
         jgKAs8mjsOgOUK7RSPbeKYytky4cgTg/lTHDegYHOLbkf4YJbSghp7yoMwQaoxs+7Fa9
         4voFPCnLjygYUPTBatFDFhOoYfBxlI9PDP4HAa5r+lDFA24bKgqBSCCgztZKbdditWHW
         cHkhC6PlzFhxCCjSGsM3Z5e4BEjfnadoH61Dth9Kog3F8rUPHdtbDB+HGx1X8rVPHK/h
         VfVwUl8lAvH5J4XihEGXDbQUzsK8Z63t7TMOckUMw9/LrLwQ8pmry92/9TMztF6A7Y/u
         XmzQ==
X-Forwarded-Encrypted: i=1; AL+hErEOC08YSWAYTCkMDxCnGdC7Gr4aC60TTBOJsvlX7cp9sIVp4WZo0UVvTtYZY5jLlx1MEYyTomrRYRO6vg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+IB+LtTFcwwZLSeCeO4S6asGVDK7/6zjl/w/7xon9wD6e2DyCM
	/MKEcBGQO3+weJBaUGTZHao2C3WbXTMH00jG3o52t0gsoQ2GcunMOSLeeiDrdi3YubA=
X-Gm-Gg: AZFdTZfaS7ngtg77tpAN+jAs0KfU0N/FwlW2KQmnC3iG0I+NavlcuDksUoCkYsbtXxD
	6M7i3Sm/Zmu82OjwVq/jTaXnUV9WegAR1N0gsveLLLbl50XaDXOQF5ANzBIyWsbf1oQVeNbrFLu
	f3C8pAx4R8VD6sda4GjSpd7kdIwtByiIs2xBlBI+xVLEb4nytst8iOOY48MeXmkOmMDS80yQjxB
	7zSTUk9rBTroXJnc2LQ99Ud/kVnBHm2TYxAP7MlxFRUWmVtQLt4aOHTf9Cb5LI76G8ZmL1e3mBG
	eQciTBqZ2p+rrj7XC9mgyt2OEolBw4gByL8g0YMMGCn2qy6jb+mmrk4XNNi2IiOehqD6ruH/0yX
	eLsVSF/XHSqQgnlghdZxxWRFVfgrtYXn3XrDsJeyLgD3Me6cdxfyW4jj61RopvIRdyWbTdu3T/q
	+ierm1Ohe3ksZ4S+W5jaJWJ1/JqzneqyAjr0DoTbrtB4ICjkZR0EddG70yGGAxFUFFbtkj7u1zZ
	a/CS1583RefVC8EC5wLOHqyksiKssDfjuOFmEaHMn/Ke0AYHQ60tS/WjDVDMGMDFogOPnKuXT0X
	jqJ9jJU=
X-Received: by 2002:a05:620a:3722:b0:949:472f:226e with SMTP id af79cd13be357-949bab15455mr2786066785a.71.1795526275080;
        Tue, 24 Nov 2026 05:17:55 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm134605646d6.17.2026.11.24.05.17.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 05:17:54 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVqPC-00000000P5z-0Ouc;
	Tue, 24 Nov 2026 09:17:54 -0400
Date: Tue, 24 Nov 2026 09:17:54 -0400
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
Message-ID: <20261124131754.GF9566@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <2026112325-emit-squeezing-5d96@gregkh>
 <20261123090623.GK14811@unreal>
 <yq5a7bi3riha.fsf@kernel.org>
 <20261123115803.GN14811@unreal>
 <yq5awlq3pto0.fsf@kernel.org>
 <20261123135638.GO14811@unreal>
 <20261123152533.GE179082@ziepe.ca>
 <20261123185826.GP14811@unreal>
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
In-Reply-To: <20261123185826.GP14811@unreal>

On Mon, Nov 23, 2026 at 08:58:26PM +0200, Leon Romanovsky wrote:
> On Mon, Nov 23, 2026 at 11:25:33AM -0400, Jason Gunthorpe wrote:
> > On Mon, Nov 23, 2026 at 03:56:38PM +0200, Leon Romanovsky wrote:
> > > > >> >> But it should not, as you are making driver core changes that will
> > > > >> >> mirror the same thing that that patchset is attempting to do.  Please
> > > > >> >> work together on this.
> > > > >> >
> > > > >> > +10000000,
> > > > >> >
> > > > >> > Greg,
> > > > >> >
> > > > >> > This series came as a surprise to me given the fact that device trust
> > > > >> > series is exactly for that - allow confidential computing.
> > 
> > Device trust's primary role in enabling confidential computing is to
> > give space for the userspace to do all the TSM and attestation stuff
> > to get the device into T=1 private DMA mode.
> 
> <...>
> 
> > Getting the device into T=1 should influence how the userspace decides
> > to set the trust level, but it doesn't interact inside the kernel.
> 
> The point is that I’m describing the reverse relationship: the trust
> level should determine how the device is configured, not the other
> way around, as you suggest.

They are unrelated. Neither influences the other. The user gets to
make orthogonal choices if they want T=1 DMA and if they want
adverserial. All combinations are useful and valid.

Jason
