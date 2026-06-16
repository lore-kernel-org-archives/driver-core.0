Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 196E73624D4
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 11:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781608025; cv=none; b=r31odvZSkVvTNzThBJE/InSL0XcKVrG3FfLfflcJyWv3+IajuFFRFZUJ4DOF7lqz5+fP9ZV16Oxvv8ux2y3Nn0RJ0hME++AvgHyv0AGdRzwqGi+Z/NNqtNUC6sx0SR1nlOgrA1adGQfS+WW5uMEICnBqxd1e/YaKSMvtNYN83Og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781608025; c=relaxed/simple;
	bh=8L7LN5GWKaXLjw308PhIswoJMOtulW5cOuUEITh9aLI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Hhg8IhD/8r8O+Riwq+rfryG21Ls7Mhu6ztj7nP2aTl0NQr5n7V5eqEPBfXpsHsXkX1UeHw0VA0HFTd/iHHqXOiajx/Uz5Nh+0NVITbK5QlSOJTWwlB9hwBpV4ibfnNwNsPj2qDDegqboSPn2saCUQc1+h68uCb77MC4VP+w8ag0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=UgZJqOkw; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="UgZJqOkw"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4891b4934ffso44295e9.0
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 04:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781608022; x=1782212822; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=eJ3fUZ+/EYmTkDXUK4ZNvux/ajtwZf6cg0AECRGmMnI=;
        b=UgZJqOkwQ08PqFEVWOGA1MujonBsvT2h4/pSMOfeiDjzia9s3CHUzC4eNuhbUrtBxK
         +uzsXdLPBkeijaAXPM4qXkLqEJGb9jJj+ySsNEkSgcMEmUzYrmT6IBPW958aQCkXKrdl
         r+lJJ/kXOyzrNMvMVSVWYvfW4j/LTIpXLW/c8Ug5svAWOTnOptSIbp+hSO1KNkadE7wp
         UgayipX8GRSt4vZVb0TL+EtO4hEZnUgv+ZsiE8+1+c7Vo2up06b+nh/13Utove0k5S5w
         TwbkRq3hQ24Sra89kZw7+dOwmSLYJ3MdIOU1UPKyGFSEeIWh0BmKrPwbu8L/TLeZtuSY
         B8Zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781608022; x=1782212822;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eJ3fUZ+/EYmTkDXUK4ZNvux/ajtwZf6cg0AECRGmMnI=;
        b=QL8H5K7UjcRkr7UBTXiR59jjh0Fgv7TAeYoKQRuLMrSXWsa2mAp37w0uyCcN4KaLwQ
         iw0cg3zpIjTVGLoCZch80z2h2wpv5xWeVRLDZ7AA4xcK4eFYAS4Wm32zKfxMlgDJOjST
         Y7qo21NbmRM7D9dFg65eW0SSFGnibaW1HWM+ZSci+liocjglVLkP602aiBPCly/YtkdD
         euo56NrTWHp21G5uiqOI/aGNFOTlWlsOfV7f8cTu+U+4Zsag+Y38jZbUWT5sGr+Q6Y9T
         8PP3N3FES6Bs85yk7ENbYCz+5A6S2z5Z60QipQspB40ZCR8knCz57ApEmntPpQiw0tW/
         2Mow==
X-Forwarded-Encrypted: i=1; AFNElJ/2TCUzcfsIqW9dTDyg94t/lUjbJ6Y4uEeIIvXwf0xOJeRTjzTvkXjv5Q1tV4HOykvSLlDyr/RELO+vTA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxMXsqQjMc7SIGDob0DWIicmkD7BFsE91xs3A35vjYGNh5nxaai
	XT6b09CF4JI7oE/+BCpNDs6AOKzCMcxU8M1mzI30lbkWUeI8lVLXC2XL93RoYORa/Q==
X-Gm-Gg: Acq92OFZ1KKH5q+i84i58TwM4gPhQ4cODRNpk9vEg5OydvP8RONGFTCdKSofL96Fr5p
	UEeOTHkq1HZENf7gXOaqHJsDf33zs0XV138jlT/5l94UT8B05hUa6wFCH0dNymDxz3le8XZ6vUX
	WipiF18S+AXIg8SnlTddW7y1zoSlWgHVrDZe+ZQewJbmgB5IGusecnqoGkYl7IVAlfXo0/gMimA
	vTo1K5bu54Z4NN0uxsNDAVgUM8FLzuW20o/jDnYpjrA5MU43XClmKH9WoUWTsqkP772Mge8HbSI
	kHfvKw3NAFnve5/woacqs0dKBYmjCV4Df3QVFxEnE/ckkzsfuhplNYwa8PFkpYDB1gLMcCUQ3l1
	5aA7Mobn2S/y1qaPkrvXNzMeT+m1eChyrsrt6lHnsYRBIeHrQLhumEDagRkHPgjkmcvwdKugn/5
	NJ9awkFQmFl9btxPMUTR65BSNSpEOLQjQvSok1K+6J3BwnysZUPK8haGIUpiKG1Q==
X-Received: by 2002:a05:600c:c059:10b0:48a:5aa3:ac1e with SMTP id 5b1f17b1804b1-4923088e313mr879485e9.3.1781608022038;
        Tue, 16 Jun 2026 04:07:02 -0700 (PDT)
Received: from google.com (140.240.76.34.bc.googleusercontent.com. [34.76.240.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4606f26393asm46289637f8f.5.2026.06.16.04.07.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 04:07:01 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:06:57 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Luigi Rizzo <lrizzo@google.com>
Cc: Jakub Kicinski <kuba@kernel.org>, rizzo.unipi@gmail.com,
	m.szyprowski@samsung.com, robin.murphy@arm.com, willemb@google.com,
	kuniyu@google.com, davem@davemloft.net, edumazet@google.com,
	pabeni@redhat.com, gregkh@linuxfoundation.org, rafael@kernel.org,
	akpm@linux-foundation.org, david@kernel.org, netdev@vger.kernel.org,
	linux-mm@kvack.org, iommu@lists.linux.dev,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] swiotlb: avoid double copy with swiotlb on tx socket
Message-ID: <ajEuUZMgS_NRmDcp@google.com>
References: <20260615234220.3946885-1-lrizzo@google.com>
 <20260615172535.080cf94f@kernel.org>
 <CAMOZA0KAHKsvA9yRcdrjG13S+=rJhw-Cvnw2WdLjGGY0azG0kw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMOZA0KAHKsvA9yRcdrjG13S+=rJhw-Cvnw2WdLjGGY0azG0kw@mail.gmail.com>

On Tue, Jun 16, 2026 at 02:33:52AM +0200, Luigi Rizzo wrote:
> On Tue, Jun 16, 2026 at 2:25 AM Jakub Kicinski <kuba@kernel.org> wrote:
> >
> > On Mon, 15 Jun 2026 23:42:20 +0000 Luigi Rizzo wrote:
> > > The use of swiotlb causes an extra data copy on I/O.  For tx sockets,
> > > especially with greedy senders, this has a high chance of happening in
> > > the softirq handler for tx network interrupts, creating a significant
> > > performance bottleneck.
> >
> > What's the use case? I associate swiotlb with debug / testing mostly,
> > so it'd be useful for people like me to explain why you care.
> 
> Ah sorry, I forgot to mention.
> swiotlb is used in guest kernels for confidential computing VMs.
> Ordinary memory pages are encrypted and the host or devices
> have no way to decrypt them, so the kernel must use
> unencrypted bounce buffers to exchange data with I/O devices.

I started looking into the same problem recently, to reduce the
bouncing in protected KVM (pKVM) confidential guests.
My first attempt was to update dma_direct_map_phys() to skip
bouncing and do inline memory decryption (for pKVM that is a hypercall
which updates the stage-2 page tables), however, that was really slow
compared to the memcpy in bouncing even for massive pages.
My conclusion was similar that we need to solve this at construction
by making this memory allocated from a pre-decrypted pool (which
does not have to be part of the SWIOTLB)
My initial idea was to teach some of the kernel subsystems (SKB,
BLK, SLAB) about "CoCo allocators" that allocate decrypted memory,
as this is not a net specific problem.

I am still looking into this, I was planning to bring this up in the
upcoming LPC.
I will give this patch a try. However, I believe that we need a more
generalised concept for CoCo pre-decrypted allocators in the kernel.

Thanks,
Mostafa

> 
> cheers
> luigi
> 
