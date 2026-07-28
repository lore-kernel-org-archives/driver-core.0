Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8475D47A0C4
	for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 23:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785281379; cv=none; b=iwcisiAVI/8LyV9sxxBkYjb1LHGHS5prZq3R786DrMhudqthyZBXRVQSzCbiW7OvTLfwaUp0SyLjx+u9FxX3tCk4r5cBnLT/1y2gXyFGL+p6gRZIsVxqNic3pfK1nE3gd7krgoRrTsP6rzG2TPiDxSBTwNvpNjZiLMRAakFAWTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785281379; c=relaxed/simple;
	bh=lMzH1GE+iKbOtPjkrcpk63ibuXDoMGMXvQt/koZqnqQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fOh+fh1WovWj4GkfIZt4Mnv6iBnwwUEBU6gWtRKHHAnUdKMPE8P7BDHL3DdG6IA+hCqCY9EnVdKC4xRL9xZXQI+9R8TcsuCElmRHvcnj7Hu2lKX/4yfGsI6iODb0L4dznkQoaqm2R5BthO3tp/xp1i/jjf3R5ITiCIXmw6eztSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=osnYpXxa; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="osnYpXxa"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38dfe910e9dso294851a91.3
        for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 16:29:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1785281377; x=1785886177; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=TcnuxxaLXXCjqu1rDtFOdNvCOQDXn343+yTz8KiZZQE=;
        b=osnYpXxacsob18FKPCPRYXY6nG/uxAVkHc0ElNRYRAtD7vh8lSz0cr2q1PuB0QWTbI
         p53Fo3vtU/h1ggKYxOA8RwiSM5J639eIlEKq2d1x19AbI3tv/kwq1EEnGs/AX49Ltkdz
         8BPwSEumnecj8PjXofMna+E4dW1MVj9idlx2497SuM+gE0ioQ16cZYZglWOUxe2O1wU7
         01dcyXQWiUuasoZ9PGF7+MFR2PRah060OkKvnPASk1KRVCJYqEFvKoLUtgwsmJuiFoYb
         6AuHk1jHAGIkq4lAGGDLFn/GzowWNke4NBtxctip0JlFYZ2M3upQuAa2yzt/yRglN33f
         bOvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785281377; x=1785886177;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=TcnuxxaLXXCjqu1rDtFOdNvCOQDXn343+yTz8KiZZQE=;
        b=BK9ENpPWMuju8QDxbfwptS4ZbNxkhmRpBQhgr6T5q5JGfBac04vSrbTD0AU6NnILbU
         CAd845oNMDgThQDerxncftDcVsRBnUoPJjo+Yg22+tUHcEDou0a+Big8Qcq8cYngq1bU
         yS5mfWYFSVs4niCO4bOskdVQHxkJKUfLvelu9xV1feVKiG0Sn8McX0FWQlhxvVkjAvad
         mNZuEr0fe5/Q5LDeFmRz4ymWwMuwUUSdEH1mmOVFqVis38+hmQFDwvMwjtDaxY7KKO4w
         +i+10KtIkml/lCTaWProo+SG00NGs42ey9fcDSgUIa0KRKkhWaXulSLQCxkv+uZPCp+g
         d+Wg==
X-Forwarded-Encrypted: i=1; AHgh+RrHsWcraredF+laqznQfHeILZZ2Wv9nudGfhGQp0mgGEb3KoakFcVihIjA6KJruyfjmJawwcxE5Ki+E8g==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywi2cI0hqrevAw9KjXiZ6tCqeQ9P+dhw9nnPtGVNT6MF7H/Pu17
	tsmJh+oPaRH4PAKeGaFfyxHF3KiKgECpZmMIAbLBEuScBA6daXZANGPe3K8/oWc0MaY=
X-Gm-Gg: AR+sD13rYG60r15rtOHyP9o/X+SpTaM+3ybdArU4CvCKiA67hF85tiTaDGLvQMLraf5
	d0r/kddp6ikEKheMEocyJpwZ7tBjZDvEZ+77RrM5TY8CvkdE2fZm5F16I4S5q3kLtQpqsd0R+C7
	wkASdTNNZM96aNcinjlKyo3+El+NucSREuuJwuJYc+CdZz7me2lo7nRqsA1gZ+ZL7lhlYWNOOuf
	Tlhp9Nlp/k8Fg3FMPKP6Xos7vEGITpKmkfeiv6WF21IbPQlW27uXg1YPN/yAzpO5CTOWcX8tTOW
	QBpK8wmOwL3iKqkjpV5mfHQxiDE7odI1irv+BnjkmH6zK1t1MjoBJXipX0OSKgkn/K+5AoA9Qje
	E0Hyeg2SkGIDt5fFq3WYJF1Vj8VUC8h8MtAerSGUdEs1NEe4oR/xzvkotv2dQAi/4q5Eyz4CV6D
	Sr3OSRStTlKY2MCe4Ivf2AsdoljTFi92QLtGLz4WLsYbeX8Rw3u/lyG1urKlq+LS+s
X-Received: by 2002:a17:90b:3c91:b0:38e:542:6485 with SMTP id 98e67ed59e1d1-38f6a37c1afmr4515935a91.12.1785281376718;
        Tue, 28 Jul 2026 16:29:36 -0700 (PDT)
Received: from ziepe.ca (d50-92-54-205.bchsia.telus.net. [50.92.54.205])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38f814e523dsm112041a91.2.2026.07.28.16.29.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 16:29:36 -0700 (PDT)
Received: from jgg by jggl with local (Exim 4.95)
	(envelope-from <jgg@ziepe.ca>)
	id 1worEt-0001oO-LX;
	Tue, 28 Jul 2026 20:29:35 -0300
Date: Tue, 28 Jul 2026 20:29:35 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: Alexey Kardashevskiy <aik@amd.com>
Cc: linux-coco@lists.linux.dev, linux-pci@vger.kernel.org,
	driver-core@lists.linux.dev, ankita@nvidia.com,
	Aaron Tomlin <atomlin@atomlin.com>,
	Alistair Francis <alistair.francis@wdc.com>,
	"Aneesh Kumar K.V" <aneesh.kumar@kernel.org>,
	Arnd Bergmann <arnd@arndb.de>, Bjorn Helgaas <bhelgaas@google.com>,
	Daniel Gomez <da.gomez@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Dexuan Cui <decui@microsoft.com>,
	Donald Hunter <donald.hunter@gmail.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Luis Chamberlain <mcgrof@kernel.org>,
	Lukas Wunner <lukas@wunner.de>, Petr Pavlu <petr.pavlu@suse.com>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Sami Tolvanen <samitolvanen@google.com>,
	Samuel Ortiz <sameo@rivosinc.com>,
	Saravana Kannan <saravanak@google.com>,
	Will Deacon <will@kernel.org>, Xu Yilun <yilun.xu@linux.intel.com>,
	"Fontenot, Nathan" <Nathan.Fontenot@amd.com>
Subject: Re: [PATCH 00/15] Device Evidence and Trust for PCI Security
 Protocol (TDISP)
Message-ID: <amk7Xzm5jmz+6SPJ@ziepe.ca>
References: <20260705220819.2472765-1-djbw@kernel.org>
 <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4c43da3e-c598-48cf-8491-cb958e574c9c@amd.com>

On Tue, Jul 28, 2026 at 06:20:10PM +1000, Alexey Kardashevskiy wrote:
> On 6/7/26 08:08, Dan Williams wrote:
> > Major changes since: "[PATCH v2 00/19] PCI/TSM: TEE I/O infrastructure" [1]
> 
> soo with the recent sudden sad news about Dan, I do not know where to start really so I just start...
> 
> Here is his unfinished work which I'd really like to see finished to
> progress with the phase2 of the plan. How do we proceed from now on?

Yes, we do, but at least I need some more time before considering what
to do, sorry.

> The direction appears to be set, imho the immediate TODO list is:
> - address "not-netlink-y enough" concerns
> - teach pci_iomap() to map mixed private+shared BARs (ones which contain MSIX for the starter)
> - always call pci_tsm_ops::enable_dma/disable_dma
> - ditch the module trust parameter?
> - add a knob to enable/disable DMA and keep TDI in RUN

I somehow suspect we should probably reduce the scope somewhat into
smaller chunks at a time and try to follow this as a skeleton, but I
haven't studied it carefully.

Jason
