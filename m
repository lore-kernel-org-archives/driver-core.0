Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795617527;
	b=g+aUaoARD37kVEhYAY2UYRm1eYGKfhMps3yfZ4CDEZwnb+pzwTzl3QyrS7V/sVmp+Y+F
	 A/S/f2bgiEdxdIitj4nLg0SurpSUtiJc0WsFVGDy7bOWeZutgYs+/017Rtp0FNQ1/drWU
	 CL0hkVkpwqpVcotWI/LW6TW4EGyceAXxv78iPBQeTRikE6PjlBj9+fBLy3yuDi8NYksCD
	 soDGLC5SsuZf3VSs+5Wkeqc3zYn9LUru8Hcbvk1OxFXnNtYYLwpu74Ot9pFUv5CTnzf+s
	 pUBXmq2lO373/f/TOlRv2PW/3Zf7NZnfawmqXogkecLz4pLHMQTP+KOoVEOK1i9Vb+g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795617527;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=dCtVGEXy/TUgxCZ9qLhPI3rUEmqk4eMQKQPU17VUyZ0=;
	b=auRMfIY5wIHq4wf0pHpiP3Ducagu+dJIBqOURVIK7/AkUJOcwYQDOZ4t4ZJW+cgfh/87
	 JHC6SQ7NMmOdsnJCqRYtR2DJNHXahar/Bfh/fu9NyW9AdIOirI/0xDAcDRdicNoCU1CTW
	 xGfCZ9mGU6Ks1Kxt9K36cnHSv4DjMPn7sjEH5jlZUmxwmSICBjars7Wk+XfHfAbnIp4+Q
	 yOcvYUudcCaIUmAaT8rzw73KuyLA3MaBeTAFqaTQ6EOsRRONtMPV3EuTipBf91WHteEOc
	 8DqKFAli+YPx8xwrCrbjPovH3CPsHE4lDYU4yFNx9xOwBEEuCFhzYelrvHbo/0W8hDA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=ziepe.ca;
	spf=pass smtp.mailfrom=ziepe.ca;
	dkim=pass header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b="Ef/me8xz";
	arc=none smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 529BC606A32A
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 14:38:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 529BC606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.a=rsa-sha256 header.s=google header.b=Ef/me8xz
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eac01ff101so2129800e0c.2
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 06:38:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1795617526; x=1796222326; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dCtVGEXy/TUgxCZ9qLhPI3rUEmqk4eMQKQPU17VUyZ0=;
        b=Ef/me8xz4f56k95vG/I1VgHqJFLRI9TmsTgvV7BXRI9xAowekSDWXzmrpjFSSceQ38
         ZMRgrUj0Q0ujWsdyl5K3T28rrrD0nMcI0NhrpQ7gWkSHRkzFDVQk+EQXLLmTYuuRmDdf
         qkc5i+X9HdDPUSBA/fZ4FU63+ZC4XPHEYxyIo2WlmD3ZU5j7/VX17XabD/usqzt5m1Rz
         YAYBAXF78zxJO67qF9nUiScLzEnpww9E1a/xJcxoVMpqRqwSoYvKhb4rrTlg04o9BlBv
         mQ8QFyNjw3AD/qB7Ci+JGG2t8hJThjX5CeAf+OjZ8J9KdV9iYGsa3fa8jvZjXQ07fmyn
         Nz2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795617526; x=1796222326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dCtVGEXy/TUgxCZ9qLhPI3rUEmqk4eMQKQPU17VUyZ0=;
        b=wtsV3iCEDj8gR5xmMSp3EJaoiGfm9MH4V+f0FRJJwLxQQFBe0uDFyZpCGIHS5EDCbH
         eyj9tUQsik7lQJ3Xl+Gm7zSYYc8fcYlDUzLItlsecMANSHYGHty3ItT6dSCau+uoVZmu
         KLorH0j3K8+G/0loOzA0BHpJ7l7SyRmAOcG4I0sFySxh6yYDWxT49VY006VHYjmdlOfR
         WBi0Xfgh6ZnWHDIf6LqXIm+HprDiHfQaLdLFxBgyrJU+DiGZDPcPJgatBvp80S8FAe1u
         jlePuXluYM80IH8n4GenHmJDuwcsGRAOCtvvZWMeCYUChxjSq76yghwvBODTWNvqMQ3q
         HHBA==
X-Forwarded-Encrypted: i=1; AL+hErEhq4W767jwkosBuySnxBWC7/mtNkzJMhH8eKcc6rsoJnk0r9E0plJIvd9a9mOi+1p3LvzauUjyNgdGxQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z91CSftURKEP7XF9LAWjmGs2AC1DXlnxKUJH6TPOVXpbyEolV35
	3euLYcy2JTY27ssUQzXp2I8DQtUvnXS67AKhzLOv5QpTXwlFopW6/qQpxsEBXGxgRjM=
X-Gm-Gg: AZFdTZcO3Vn+wm1wJGR2Wzb/TTNtd1RXEpkqXZkSrd2TjMxaKW5N/daUFHN+36I5IS3
	V++CokZHXAtkkfsA1ZodsnJCDl38lbkbWq26b5x3YtRzyl7X5Tfc52BYMLE0eXi86P/597tWONB
	XY28HCvNm/BJxjYOxnXAXGilO1hHjO+IhmYKnCY4FSVsJDOKXjM1K8kS7fjezD7m0hRyC7USKMH
	deXE3QXf6Ebe8OX9o25lM8QqvmspJ/pRGzO6OUjAncYRV6zHBpSWEE4y6OivzHRh7t/PnaXaTsg
	H1O+IXrgaNfBLzQLtcRdd4qTSVk7h49vhNHwoC3Wkgn5KPURc6tyEkiIUIdkkPP0Q5q8WK98ky8
	6lEhSzHgSyTUTvWS5Px0TrOxfbGo/QesN3XzgUNEh42Bcv41QcAI3H935qK6LhKRIQLwjdnwg0e
	CRcJbE+Gk12Xl/0eO2eoEUPkDHGYpziyOofI0q+wgACLqGMjEFjd1MT3kUPTF+jTfJG+wKgPm+j
	kVMM475sSo6lIxSedDT/Ndc7sk3u7bnPqpZZZXO7HKqx6i8L9Wtk83bH3lGjgMHXnahD1VJuUd7
	h+urGA==
X-Received: by 2002:a05:6122:1816:b0:5ec:4112:6839 with SMTP id 71dfb90a1353d-5ee8af18034mr9201283e0c.15.1795617526133;
        Wed, 25 Nov 2026 06:38:46 -0800 (PST)
Received: from ziepe.ca ([142.177.118.84])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349d383asm163086316d6.22.2026.11.25.06.38.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Nov 2026 06:38:45 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1xWE8z-00000001lnK-03Mz;
	Wed, 25 Nov 2026 10:38:45 -0400
Date: Wed, 25 Nov 2026 10:38:45 -0400
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
Subject: Re: [PATCH v1 05/10] PCI/TSM: Add association locking helpers for
 evidence acceptance
Message-ID: <20261125143845.GG246011@ziepe.ca>
References: <20261123083337.2731019-1-aneesh.kumar@kernel.org>
 <20261123083337.2731019-6-aneesh.kumar@kernel.org>
 <20261123153507.GH179082@ziepe.ca>
 <yq5ald6h9r1g.fsf@kernel.org>
 <yq5aa4mx9nsj.fsf@kernel.org>
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
In-Reply-To: <yq5aa4mx9nsj.fsf@kernel.org>

On Wed, Nov 25, 2026 at 04:32:36PM +0530, Aneesh Kumar K.V wrote:
> Even then, wouldn't we still need pci_tsm_trylock_association() at
> spdm-start? Once spdm-start completes, we can ensure that the
> association remains stable until spdm-end, but that still does not
> eliminate the need for this API, does it?

If you have a valid attestation device for the TSM then the TSM is
guarenteed to be alive.

That is the invariant we need to create to have a sensible subsystem.

The session cookie, combined with a revoked/disassociated attestation
FD guarentees that userspace cannot be confused by a TSM host
plug/unplug. It will simply see the attestation FD it has open stop
working entirely.

Jason
