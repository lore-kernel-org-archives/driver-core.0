Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795706091;
	b=1O8/9rC3cS2jaPotVoiPRqpvsSJNbPgfIjVGvaEowNK2tDODLUhR4BUSgNGjodzaJZau
	 rzpabBM0LmRGDTtmsPQe96CFPKSQMdctWwh8ySn5z6x47KXdV37w7PHny6Q7/4DzFrwxK
	 fsA3YElF7Zupy6muh4baNgVI8TImD95wIdyMXJXAyI/7Bzmf5YN9BsXLHFak7iV9t/Jlp
	 xm5kG/lEnLukF0eA8iFUrPqDfdxvV/+3CidIlQq1xRUx0Xz3etyeV522dct6u0JrYPno7
	 bxdZ3j24I35HBeKP4Iju6tkcFnpieVGqXoZTKhYEJh7NemVOPW8mk8O9wrxUzBsZ+iA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795706091;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Fmk7KvplZu8IqXCFaSm0h6pjbCmnVJRD63HoP6Br6hc=;
	b=QhhgRZB1zPoMcWfKdYM3w5OlLYhCifo+7AtYvF0W62S3JwBh1ZVwRAw9zfN8KZTHU54M
	 6qeJYibFokicnMRQ35yX3jQW4vHh5cKUzYr9257w+ncCajmA1JiaYANElnGJhntnMZ3c5
	 lDSfYBaC0cPKbd5Lw0+qfDSrxj+XU8UUMz+JC2uz8p5jyf3KcUAQoDskKETcxddNp5UUX
	 ZjWvHOtljUPDS/Dk7pKX5Tth1uMVFfF6zOw0Mt0uFZh1BuRQ4kZzm6hLhND/jnKHiaZ2v
	 ejiJpWMlnztrf2QUh/BtLVsCmV8871j/iFuQbWZlfg4I7Sjqq1WE33369Gpo4z/U78Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CjppQh2P;
	arc=none smtp.remote-ip=209.85.222.50
Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3759606A31E
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 15:14:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3759606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=CjppQh2P
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-97ca72f2cd9so3800977241.2
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 07:14:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795706090; x=1796310890; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Fmk7KvplZu8IqXCFaSm0h6pjbCmnVJRD63HoP6Br6hc=;
        b=CjppQh2P+eyPwIOGQ+UmQnp0d/uhx6KyOfYxZ1uLohZRS058XnYrvmbv+/Qjv0ukqG
         7Dy32TqKPbXN3l5CktAYXcA/UFbUztNlVw0g4hpjysx71DuwNS/rQgyqmnMeqStBLiVN
         AWF5vEYXxIVCAala3lN01DcnrvhPE7AhqtWZ8r9+ZN6HhvaqoMJvSOh3FCVwJYetpVIS
         IprLpA4BzdiNSI2M3rULDrqLTHtM/YPQJ3B/4yt5dj+SkNPuHWCQ/t/3FNV3xEGfDggu
         qHNelrHPWJs3IpeOG1j/TNm9qczucuOdVDsmRQMQSMq6r7isSg+lmOcHQhAAsfPl47yE
         1nYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795706090; x=1796310890;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Fmk7KvplZu8IqXCFaSm0h6pjbCmnVJRD63HoP6Br6hc=;
        b=MZmj2B+qqEhzynMyeOm2pZxmk/ICpKO6VZg+6I5v/1FGmMjkJATmPL/7BeyzUv141o
         1Ybyui93Drk4fKR0+yS1XjWwzrh5vv3eqdt2rQk8otgklaoxMtB5AKTF6jopV1M17i15
         LPef7O1R726zY0+RmHmbpXIPptdeJ5zpwDbQW0BHyu0zQnIoBC7hFca+kifyUaWQOayz
         O6xDfmNOJ4aJ3MqkRM8Ov02LpK+KIKQWYxFYBVuMeaONTL7kUoh0Osiu+mZxobONZDPO
         FD8+i6uZ0ESQKDzcLhvYkfMIfKeEwp79ARdBWcwSguRu23Ah8JsJeZJjps3MY6p77VLv
         Scqg==
X-Forwarded-Encrypted: i=1; AL+hErFgg67qz4v5nioFTz6KV+as1Sw7OQvAAEPAHqm5sJTOHhMazpTNKa94PpnpT1SBJUVGJsBNclVj6GYCrw==@lists.linux.dev
X-Gm-Message-State: APuU4Z9v20QbKznEURdUoAzrw6XY67apSdgUPApc3HBUYgxyfNQeDoi9
	TfC5itH28pRQ8oxtCt68/bz0V+/l/4gf2lnuPjK6/5pTFoZqyqxRZ4p9Sr/rdikZ7GY=
X-Gm-Gg: AZFdTZek8B80ZKzqvBI1DUzrinU3HvMNjhuD2xtmeMdAxcv3hXugOXRdOfYhvRECXZj
	BObvmVdjuahdVI3CJPLM8KSxHPQkp03ORBI2isVeM72w4D8EueQmLdR47yd4FnSyCMz6VEtH7Ik
	YKP9mX/3CIUFdBfUMnmt2n6cIrR431aJ6LeRdCd68/BebMoaRgj78Jb9Nk4bDhapYK1IBBSg279
	aYg9bvRVk23n6GlyZwgjWv8zSFpZC2rYqH3/5WQ6ULIf1cjx15bWnrjEA5vNseUfNhSb74zi6Ia
	g1U+PjdPFrgQFbB7stOnGy2BmyTRvA1U6FXEUreQTl1T7+qFWCUgASJea2z4P3N3xErvsy7QhNc
	imZg4sU8f51NoBdFZ21WYZU2h8A54J9NKSo2nUPOf6zELMRpNErN7L6kXPyz9ThY3DsceSqzxGJ
	xq4FSkwN0qZXzpPFOtRKGp/13V7ljXkALuVtYImr5vcBWGJGSEluXdbcUpvTWM4Ie5I/urEIi/6
	6FerhFPTfWCgM3vstyK0Svpgr1b4nfnztD0j+HUp9DtXcqxnh9U2NDxhISrKTOR1rarakYpzPCm
	9KyZmLQ=
X-Received: by 2002:a05:6102:84c8:b0:7c3:2168:d603 with SMTP id ada2fe7eead31-7d71e329ce9mr10299312137.0.1795706089640;
        Thu, 26 Nov 2026 07:14:49 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349cdfbasm193141456d6.17.2026.11.26.07.14.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 07:14:49 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWbBQ-00000004NdO-2PDc;
	Thu, 26 Nov 2026 11:14:48 -0400
Date: Thu, 26 Nov 2026 11:14:48 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: Alexey Kardashevskiy <aik@amd.com>, linux-coco@lists.linux.dev,
	Dan Williams <djbw@kernel.org>, Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 04/10] PCI/TSM: Defer TSM vDEVICE allocation until
 device setup completes
Message-ID: <20261126151448.GO246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-5-aneesh.kumar@kernel.org>
 <5e04323f-dfdc-4956-acee-bcc09926726d@amd.com>
 <yq5aqzg99uio.fsf@kernel.org>
 <20261125141947.GD246011@ziepe.ca>
 <yq5ald6gul7q.fsf@kernel.org>
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
In-Reply-To: <yq5ald6gul7q.fsf@kernel.org>

On Thu, Nov 26, 2026 at 12:34:57PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Wed, Nov 25, 2026 at 02:07:19PM +0530, Aneesh Kumar K.V wrote:
> >
> >> That is what this patch does. If IDE setup is not complete but the
> >> device already has tsm0 attached and connected, pci_tsm_context_get()
> >> returns an error from cca_vdevice_init(), preventing the device from
> >> being assigned to the VM.
> >
> > If the device has not been fully accepted on the SPDM side then you
> > should not be able to create an iommufd vdevice for it, nothing else.
> 
> That is what this patch does.

Well, it doesn't exactly. It adds some code without any users and
doesn't explain why we need to export a lock or add more core code for
this activity.

Nor does any of the naming imply it is only to be used for iommufd
vdevices.

It is problematic to be hacking the core code without any drivers, I
know we are kind of stuck with this, but lets try to limit changes to
supporting stuff that is potentially about to be merged. viommu is
fairly down the road still due to all the dependencies.

Jason
