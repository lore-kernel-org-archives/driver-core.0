Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795448110;
	b=hhuazCJJ5hv4CTaqNQBm35kjJVgg07P9GKSt0VsssS2ifCmkh0MQgo++5/glwDpvQtrj
	 feIPVym5IzfS9hyoxQCtmA8YFnDy382+nhFTkFCvu8fyTMV1Npp51El8afYv081paUVDN
	 Tq/vvkOshx2lf4Drh2vPo+7ZA0vSQh21VsUUy1/N+EhftYwGISGimftXaOunE1uRq4QRL
	 bHuW3th7Qu7BA8KGd1T4nEDJCmertjkD2S6YwvirUMd+N2NTQ/00CDIplfzyZ/WimWYoA
	 1qI5Elh8Re45FKoyjd4o3x01/eQYZP1MwLPywb7c0/n34CYkZYiIlrFNKyBWrOjx5vw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795448110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=jVozDBZgp+27gMR99l+UaMITrh6vU8pxKuFZh102SrU=;
	b=Lca0yNY84RZ4yIgJ4mpACs00bANPELtYh+9IifJPJyICyr18xgbCC9LcGO/oz/OyjWzF
	 bigKDM7PV1WM0sgqs+ZcCXcNCbfH4+0VPj/OBCCdPgHkNwfOG5oxNM7v1wamqT85Lj9bN
	 rMxIwEhYcRiHgERHMTtztAIwWeyrhAQZEqbwwiO9hAfir9Xv66+I2OYhjIC2klNY4BxEH
	 P6SFWuIKa6rBdz95xvMhiPouTca8TejPi2T84mwq2Zx6nDa/s1yFgZj433OgvSuAqFL1N
	 8jYj2oYA6I7Ujd5JnyAeit/3s9xjNynE7JXQJeJCFB90iAGn5LTnoFJSH95k1XvISWw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="i/FamW0d";
	arc=none smtp.remote-ip=209.85.217.50
Received: from mail-vs1-f50.google.com (mail-vs1-f50.google.com [209.85.217.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 807DA606A333
	for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 15:35:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 807DA606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=i/FamW0d
Received: by mail-vs1-f50.google.com with SMTP id ada2fe7eead31-77bf892b496so1150920137.0
        for <driver-core@lists.linux.dev>; Mon, 23 Nov 2026 07:35:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795448109; x=1796052909; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jVozDBZgp+27gMR99l+UaMITrh6vU8pxKuFZh102SrU=;
        b=i/FamW0dqItDKDcrh3YbiVAMzqFr59iuN2XqiRyjTzhAwQfMU8S6oLV6LTanYRcOVM
         ilZo1vYlPgRc3m6Uteam1cUHRpNMKm0mA+C3rDE4hX8ygwywpxz6Ew+0kxiEy/p2UIQd
         kUGakSNyZ7uEE86lr3JK+gSbvNpoV2cq6gVc5fru5/0SpvBBi9JMyKnhtyAIi41j5Rvz
         1oFEiPIbHhai+HGhF73sb2slrwFLc/dSSqvKreY/Q59Yse6N8opLHTxR+29KvuadJH88
         16JY4LYooSm8rdutY3D2aa46c1tJgBhBcjI8P42I2mrI/Zoe1P+mn2duVw2Cc3alcQTq
         QSsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795448109; x=1796052909;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jVozDBZgp+27gMR99l+UaMITrh6vU8pxKuFZh102SrU=;
        b=ZuyKYk9C4V7lyTQE0hbS8di8tArGGraZDIDcvukrcOyuKzfYsJ/1w6US8Da+7Z2Oaf
         EJOV2D3RBHtgYQ4/uHlHW2ZTJTqnmsBTChBs4nbVQ6Xy5CkzsBpWvs4kWpi2xP72hdc/
         ZtLC9Yjzq8hW6r7LXROBtMp8wh5kg1piSWUtoYCTzVin1SonEunre1QesXFHaZkZ8KE5
         Ycv7X5wF1WRecX6SeZoEbErBg6P4Sy2w7jn9qW5v6mY7Es6S5lCu+rbqx4kChE084Fo6
         OxrLvIlMm+nXH6e2RDuXRTvfi1/gYtrd5vy4EaY6q2W3WJjaX7XFmFcLxlmY1+67qL14
         ocUQ==
X-Forwarded-Encrypted: i=1; AL+hErGkF8CvvyQYHBwxN45uCvt+OobplZPxWzigjzVYOXgdopTk4xWRJRmKGt+gnZLlkljbrB6R/pORjoh9HA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8QaycoJ8xDcko+RX72Lm3rE50VOWGesn/i+NU+POtWSHuDQxml
	yituB3+0oyrBpogWK8/ylUpeNZxd/++dJA0UHxrD+xeJn6LXEEy9LWg8Fz9HWY/X9OU=
X-Gm-Gg: AZFdTZedT73GjnraZfeZCf5uVMNSs3mXQ/0kZNYlf+nmMTxsj5ReftGlrw+eEtA+uSf
	tHCQnDgRshHaQmaC4sqj+KEjjSYRJR09n2xdOGB4kOVztJscpXnGEUmUA5Y4jALJtsUe9Keqt/r
	ktPDlV/PjTqlKpawHGTWvqGUmoUdZ6MM9XCNOGFFGFKMJ26tvHPGY79jWvkAhMeNbS1uxtwreR+
	DNnvl4/N5MFmPW1O1o0Il5buLuXIoBN0WlL5ba3mOou6oz8f9Zp+SAEfdrknUzl+7G0fXkY3KNF
	wLL+8SMxmMwziymrJ3C8C+2Nwt6CuKi8VafCaYWcyZ7zu1XWqb+GSF4qkUqEhaihzBZIIsXoMqA
	j1MVj38O6AeqkQ/0QNLdrrX+oq5h2nuQQaXGsB5rgtXTDmtv4XMSGJGyzpsEGjUiSHfRhvIui2j
	eBeJa1VIUzMWfzQoYZXMAczok3mbaQ32Sj79hn7DevDhkWWhcOig7fzI6ykSKJ8skkD4WkxVW3G
	+9RM5i+hvkfKcdAWeNcdPtcZmRWfLR9R32ttOy4k4YrHz07vBifJ0TTdSjHXN+YSQLvfLl2sT0P
	L+jbQa/0FyQJkTY74xHTVSgHbiwCVbPKOpWJiy44VP15swaE5qYotjjm7akrgP1vnB6PKxQ2Bnk
	cl34=
X-Received: by 2002:a05:6102:5811:b0:7d2:76af:fcce with SMTP id ada2fe7eead31-7d7393c88e2mr5087905137.9.1795448108741;
        Mon, 23 Nov 2026 07:35:08 -0800 (PST)
Received: from ziepe.ca (stjhnbsu6iw-159-2-142-59.dhcp-dynamic.fibreop.nb.bellaliant.net. [159.2.142.59])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-949bb0315f4sm823500485a.3.2026.11.23.07.35.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 07:35:08 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xVW4R-00000000swq-2uP1;
	Mon, 23 Nov 2026 11:35:07 -0400
Date: Mon, 23 Nov 2026 11:35:07 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
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
Subject: Re: [PATCH v1 05/10] PCI/TSM: Add association locking helpers for
 evidence acceptance
Message-ID: <20261123153507.GH179082@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-6-aneesh.kumar@kernel.org>
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
In-Reply-To: <20261123083337.2731019-6-aneesh.kumar@kernel.org>

On Mon, Nov 23, 2026 at 02:03:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
> Later attestation patches let userspace finish device setup through
> evidence-accept after host sysfs connect or guest sysfs lock returns.
> Those commands use a saved struct pci_tsm and must prevent disconnect or
> guest unlock from changing pci_dev::tsm or freeing the saved structure
> while setup is in progress.
> 
> Add pci_tsm_trylock_association() to acquire pci_tsm_rwsem for write and
> check that pci_dev::tsm still points to the saved structure. For a TSM
> implementing devsec_ops, first take device::mutex to prevent driver
> attachment during MMIO validation and device acceptance. This matches
> the device-mutex-before-rwsem order used by PCI DMA preparation.

This doesn't seem the API I'd expect here.

When we trigger SPDM session start AKA lock through the CTLV it needs
to capture some kind of 'session cookie' for this locked that ties
back to whatever the TSM is using to prevent a hostile host from
locking/unlocking while we are working.

That cookie should be held in the attestation driver and when we get
to acceptance it should be presented to confirm that nothing has been
tampered with.

It is a further reason why we can't have lock under sysfs control.

It should be attestation that provides a general purpose lock that
serializes all attestation operations including lock/unlock so we
don't need a TSM lock like this.

The driver should rely on that lock and use its internal mechanism to
process the cookie.

Jason
