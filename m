Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B78636CDE9
	for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 09:14:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777540482; cv=none; b=eBA+CiZaPgH9T91qz4seAYWmWwSrYLymwoXgfI9CSIh9aDzWoZTLe02w+vOnaRAaV5tp/fk/OCr748hITyDh4ruM9avydlHIzTjv3oIUODlklJr4gjAZWwvOUpLi9jdeC85vhr/aybhTwzw2Dg/lyG2LJvFl+uKBTXJ2pdPMF/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777540482; c=relaxed/simple;
	bh=sVifEoF/oe2xdwrFV3e2F++qf+hnysQw0CLe/H5O8ts=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CgI33NTnV2GGEq4Lsb81n/YS9RLTo+eioDTL2tdcArhCxkbO2p8XZhYUkB5LT8DtmLH9t+Kg4LX1D03SWY7jol83x8Q/Ec1/qQM432wSBzZtYFrPr3XaMLOQ0VdBGwtDqXP9BN1EBnX926+Z5bj4cr2zXYthWPo10dMec5eCxXQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ETuz25Gt; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ETuz25Gt"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bb9fdd62dceso58475566b.0
        for <driver-core@lists.linux.dev>; Thu, 30 Apr 2026 02:14:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777540479; x=1778145279; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9iVxD0Q/b/KabKpN0s2yCS+iq2LiFZxDqstnJNGVdg=;
        b=ETuz25GtScBuI34kRbZdH+q5ycRbvYglNTmCnKn1RdCw4+CIVlu+cU8txrgzgMYfvn
         GFOVI+oFNoHn8hhpPFKS66BlrsjtqIZD2u9D+37g0tpdhbNMkUer8F2zzL6wBQpw76jO
         Dgap/FfxRdUjmBquK0QBMigSJ79z1t+uccxwo8wojv0j18i+APFq34wtycf5DCvHtskG
         e0GH/1SL7MI5k9QIT75NzHoK/MEI6hDnsxK5PfT8qWJ5fw4t/TLC2fYACy3FrlwYeKrM
         YeATtHAZ4gOkk89Vh7Nx/se5ldVc7OfVPyzY1C5uqAMN5REaYrqPd85E2CcylbvqV4k6
         yGjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777540479; x=1778145279;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Z9iVxD0Q/b/KabKpN0s2yCS+iq2LiFZxDqstnJNGVdg=;
        b=SaPJ+4wfHSQq4Vj6579ZqjqD0MvxxflHx0TByOUNUknFxkUjk6+vETrNhZ21fhT30h
         Jc9S/ujeohYaV4S5Qh0svdWVtF7w3IRW1GZo3OLL2eo9sVnTe+jAYHMP9e2/96rOLyxh
         3l/6CjTyZ8ZFEKSCN6TJpgClkFJocSf5pUzPFS7YZfLZ+9xWljvr5gnY27MMQqsH/e6j
         Z3Fnfml9R14Ldh8vljw1d2TXSHnyaa2SoPedxBbefNC1WVq2ftF/QXgrfHH2zWOsW5xd
         enm89oilY67KCsfg4MBwD9OnYLEVZ3GVN3YL5bc0yvLpvBxsENkRhHisgNNQRbZV47QK
         qUWg==
X-Forwarded-Encrypted: i=1; AFNElJ82SXGfnFQ386foc+mVQehOtz3ivZLN3J2CfxhgsIUOkhcjOoGSr0aWdAHoRf6wRvN9lmVNoEjb7SSeDg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwBI+eipIZwSrVcX0OlmBh8xq87Fo+v738UmEE91RGPDXi0WxTH
	OXu0AbMTrDeabmNV7c5wTE2FEAeMFU7oOMi0vHDkl0gQ7V6AHksWLOpiQeJlHJzGZck4OPuSFBt
	8BuSaduilesGlKH7TOw==
X-Received: from ejcqw42.prod.google.com ([2002:a17:906:6a2a:b0:ba5:8db:d6f4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:7b98:b0:baa:2d37:cbf9 with SMTP id a640c23a62f3a-bbac5abfee4mr145636666b.1.1777540479322;
 Thu, 30 Apr 2026 02:14:39 -0700 (PDT)
Date: Thu, 30 Apr 2026 09:14:38 +0000
In-Reply-To: <20260427221155.2144848-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260427221155.2144848-1-dakr@kernel.org>
Message-ID: <afMdfs0segrRBx34@google.com>
Subject: Re: [PATCH 00/24] rust: device: Higher-Ranked Lifetime Types for
 device drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	viresh.kumar@linaro.org, m.wilczynski@samsung.com, ukleinek@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
	robin.murphy@arm.com, markus.probst@posteo.de, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

Super cool to see this!

On Tue, Apr 28, 2026 at 12:10:58AM +0200, Danilo Krummrich wrote:
> Before:
> 
> 	struct MyDriver {
> 	    pdev: ARef<pci::Device>,
> 	    bar: Devres<pci::Bar<BAR_SIZE>>,
> 	}
> 
> 	let io = self.bar.access(dev)?;
> 	io.read32(OFFSET);
> 
> After:
> 
> 	struct MyDriver<'a> {
> 	    pdev: &'a pci::Device,
> 	    bar: pci::Bar<'a, BAR_SIZE>,
> 	}
> 
> 	self.bar.read32(OFFSET);

I think we should establish a convention for how to name the lifetime
early. Using just the generic name 'a is probably not ideal.

How about using 'dev for lifetimes that correspond to the lifetime of
the device being bound?

Alice
