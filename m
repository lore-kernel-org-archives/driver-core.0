Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795616300;
	b=2VjlfJfGVGjSeb6LoHHbVPQUdItr1bixYTxsuwe2leD/l/406RGRBZ6RJjP+Hg3/sVMg
	 8xbJhaEeuO79OJQKxOkQ6VKd1QTIsnwkS9PNmrOOtNt0aZr0RCGpmitU4fjK/dyTdu1Xs
	 o5VuPKuXAwfzKUfTkGmu++8UhYaDDxGuEI17mH65IoMVSEYNIHSx3ZexCizExpK0TH7eZ
	 8rWgin8bDZbgDpZib2sqjScIdnY2G/07fkiKN2b08QXQV/x7tylVuw+VQ42r5bgXjBhsW
	 4/wFFbH00JkuEOMq24iTuPeAFJOb39GjyxLwA35ZSuYB5Aadllj63FZRfs7CtFPjdAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795616300;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=5bQ37Dr+87om1NS6c4tle8Uvo6AzgbEUJjiMwoZ0S2Y=;
	b=EmTgbFkx1j2gHgZMpl1yfRspTaBQ7oPMoVr9mDbZih9O4vYjU+6xuCpcIZ+meAhHfXO4
	 3SzcWoRCzFFXd7bftbZL+OUAU0FLl64rP2a2PqGnBaTegJLgFwc7yLHMwef2FUsYoXuwz
	 Z4kugDEEyFd/QUqoxrIBhe2AaWALii1WoZibZ7yCLJN3AcdbMyucKd7Zu0uPK1k2/ALe3
	 sr0pbehEaOprIz3h6soOMszgRpvwfuVlkf9i5KhRm8dE+WEI7Bij/P2YTvIRUdMtGaDuf
	 2fXkadZlnBYtP/SaozOkYzc7W47ZPcSsMPf/SMwmoFNPFxf9b5lyig9d0LpI3HV5dDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nSGECwOx;
	arc=none smtp.remote-ip=209.85.160.172
Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BDDC606A326
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 14:18:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6BDDC606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=nSGECwOx
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-55d360ca878so53738731cf.2
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 06:18:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795616299; x=1796221099; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5bQ37Dr+87om1NS6c4tle8Uvo6AzgbEUJjiMwoZ0S2Y=;
        b=nSGECwOx/IH9Ow0CjCOosSbhj0hMs+uxX4hcfJg8vCaphCA0cBH1Iwc+gx9xV82SgM
         PDdW/1xbsl/Au8nWOUUJ4LePWf1qxDv8g4jAD9GRJsG8fqzDtkXkwrA5edDEGIsGW9yR
         GoeQ2ox2dr8RNU0UPrm1VuJ5om5GqY5+EB+ZQPMzSQ/wLF7f5f2mCLCrJmM7XnELJyP8
         fB8IcE8uWGpAaxNiZOC1z2VS2b/VnNTX0g3P/zi4sRI61ffKHGeQToVdU8gSVmfrTD3y
         6llm3A+xKM+O6T7LJ/tH0uqAWv6gFykFjaQx/GG6FAYr+g2uxO8GZjnjw65w9gUA7rvd
         c+OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795616299; x=1796221099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5bQ37Dr+87om1NS6c4tle8Uvo6AzgbEUJjiMwoZ0S2Y=;
        b=cM/4QxqL9a2ceHUm1jradS4m+1XxnzcvEFA3iIfCdSNmqHX8mXojLXsYIG7cR+yWbP
         sWh8Jptf3zqY7OUO6eF9g8dsVspjc+8hSJbczvnltxH/GFwvOG/0REj+2hepUStvjqs7
         O0Dgfj9OwB4aUE6vahmD1+NmjFiuoumzUEPY/aFIYhUYJnMLM9H7h3Sj1wTyde0QlTS/
         WRQu29fJIrDiZt9BFb8NFUksnRvIMROb8F1aZ9HmJfYLTp8x1zJ8di06FBD6ETD126Gu
         GtaMhyoseLr55FKbVz2NgPKNzFhL90xIO+FTFF+GwYnDVsKgnHTfTstba4xAvqV227E8
         FxYw==
X-Forwarded-Encrypted: i=1; AL+hErE9/S/VL7GDcMKuDgQjYTm5tZwVbxkLrcILAl14JUb7GLf1v9wM5v/0GoEmhFQcpNC0ZJaALM6HT9fSyg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/jkGcoHHiHAGmAvsUtJ7V3sLdkTV1j8BpU8Hnh2FhUd2MXjJyh
	u1HjORX6sKAlHGFXGwYA3v52dIftlwZ4Ld07UifEe4+iNfo/1ygbj3c5jl/AESBl4Rs=
X-Gm-Gg: AZFdTZcuANe5405zoZSqt8NurCMoV650PjGp6/pOaZDrbuvIkZ2D4D9cvfDa41/xZ3g
	KuSfp+Kicg51B8CH4o+V+JjIRDJ3v+mhQwZN15DB1FCEZOHjopYvH/BPgX+UKqr/2TaH5EZrgL2
	avhuCA98auJXHTrjoB9WAoXtrQc7WwGreooGj27jgULFfI6DqMtJjiKEvWZf0SuGfkqS3NUHIES
	zgR1pQ9Sa2vLK6sSe2sNauZSOyfksa16FXXDh5tFASoLEm1G6CkCAOLw8F4icCE5zppRU0jMR+d
	9pkpfz6PR/vaj+JbpXjK5/fbfuGP6AuRRhaX1einkBgAoZQpke910SfUd0WdncuHMBHzm3dbqaJ
	Y8Rl8CxxqspNYZS8B43fV1bfZ/pBE83eyG27laZvbKu6p3sX2GB4yBSpekv0KKSVPB0FeXRQ99a
	ORipAhX9J9RU/zFeEYbGFwAA0MfxToSnl4frM79omBh8PyNTohjGDmBnNYWc9X+6HbcGSGyyJyQ
	/laEhCi0tbd9vpLxO149nsvWB5d3GjCZxs9IaiY6uNktu8kY5Ypnc/XYTNIJR1Vezj2svR1RoE4
	Iqg9bg==
X-Received: by 2002:a05:622a:1aaa:b0:55d:3721:872e with SMTP id d75a77b69052e-55d76b34525mr321765931cf.69.1795616299369;
        Wed, 25 Nov 2026 06:18:19 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-55db5bc2f31sm27755541cf.20.2026.11.25.06.18.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:18:18 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWDpB-00000001jOX-3H6e;
	Wed, 25 Nov 2026 10:18:17 -0400
Date: Wed, 25 Nov 2026 10:18:17 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, Dan Williams <djbw@kernel.org>,
	Leon Romanovsky <leon@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Jonathan Cameron <jonathan.cameron@huawei.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Lukas Wunner <lukas@wunner.de>, Ashish Kalra <ashish.kalra@amd.com>,
	Tom Lendacky <thomas.lendacky@amd.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	driver-core@lists.linux.dev, linux-pci@vger.kernel.org,
	kvm@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH v1 02/10] coco: tsm: Register the TSM class before device
 drivers
Message-ID: <20261125141817.GC246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-3-aneesh.kumar@kernel.org>
 <20261123152903.GG179082@ziepe.ca>
 <yq5awlq19v10.fsf@kernel.org>
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
In-Reply-To: <yq5awlq19v10.fsf@kernel.org>

On Wed, Nov 25, 2026 at 01:56:19PM +0530, Aneesh Kumar K.V wrote:
> Jason Gunthorpe <jgg@ziepe.ca> writes:
> 
> > On Mon, Nov 23, 2026 at 02:03:29PM +0530, Aneesh Kumar K.V (Arm) wrote:
> >> Register the built-in TSM class with subsys_initcall() so it exists
> >> before a platform TSM driver probes, independently of object link order.
> >> CONFIG_TSM is boolean; remove the unused module exit path.
> >
> > Why isn't it modular? This is going to force alot of stuff to be
> > non-modular.
> 
> tsm-core.c contains only a small number of helpers. Most of the tsm
> implementation is in pci/tsm.c, and even that codebase is not large.
> 
> This differs from the architecture-specific backends, such as
> arm-cca-host and arm-cca-guest, which can be built as modules.

So, why isn't it modular anyhow? It doesn't matter that it is small,
the expecation is most systems wont need this stuff so we should have
a clear reason why it isn't modular.

Jason
