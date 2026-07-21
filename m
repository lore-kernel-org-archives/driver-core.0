Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF2EE3EE1D6
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 07:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784620239; cv=none; b=JLBkEb7V6ttqF2ksD6nCzN6TEOAyKcvi7UTk0G87qXhppVs5dK+mVJPKQgS1lH8Pf8T8rHoZ763GLTRl9bkVip2X3pBd4bHSSF8z1m6Ox38nrzHTXV2WJv/KqZ8EhB4HYe9hervdUIGK5ScN4boI2sH0ljofEEyE+8Wah16bDd8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784620239; c=relaxed/simple;
	bh=v1HyQ9w4CQ9GtjNjR+yGGPjV+zdr+mSawSgmUOS7+QY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=UHyfQIPzqpADong+zUxw24mnfk0DEm7bdLsw85QOg2e9Z0FYXMBsRVvX5HKFGgeomw2ravAKYCQ53mN39ugQi1L2Qrv6+X0YXWxVWdKencx6JRATeNZhMQPZcZ1J24YKPeXT1MwAacC0q8Ga2GPNTfy1TXPYZyPpSIlwhF5FWUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QyV3lwg/; arc=none smtp.client-ip=209.85.128.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QyV3lwg/"
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-492488f8583so146543825e9.2
        for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 00:50:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784620235; x=1785225035; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jZN0cXKJfka9i5ge5e0ezdkYWG8Vmfnfz35ybXd+mtU=;
        b=QyV3lwg/bwZRmR8p9Y+w4OJdx96nFTyLSyR85YKIpaAIzPEiGJMfIhNlcpOkEYRXYp
         wxTniPud39iMmo4HJdMqzOF1dmXpYL5iYCo+oHE4KEiVZfFUEBBPoYOcg/4RqUMYm8no
         HBGCBsyV+Kh5xkgGJsE7cJxBiYBh8g1I/iMag08gfvOldjMXLWHhEmNAT/zUxuplzXbU
         NdcySph6IfYO4564G7R9MNY5C/pESDBTPTzrDxgfvcKqR7inY6mb+fktlgVrt+UBYO6k
         qsA1elNp7HA8ocUDzrbv2cs6d/bkdUr7CJtWMa2XvZqkCGuT05tTE+jtpje3REZ6BLJt
         O2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784620235; x=1785225035;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jZN0cXKJfka9i5ge5e0ezdkYWG8Vmfnfz35ybXd+mtU=;
        b=h3itnj61oCCT1Rm6WxlawRp5CgRQWKCpFqHXV5TM7MwyWTsCbEz1ay2il3bAYeteWC
         3zZ9h6ygXO8qvyv9pmUPZxNNb7UilR8g2dqQ7errKg3glmUsy85vfGPo8sxvTPRnEA53
         zscLDjxCIUTpv8tLER6JBDH4Fejaqf/FDxUXNi8bPutrq+Hh1V9ye02NRtTilHA4ZF8A
         Yl/VpuAwo3FY02bV2a1JLrmkOuHzZOTEDTXFPSGyZzU3uVkYTaNDLo99zaVcKi3kv9fB
         20VdSNQDj21jJNC5AVgfIuNCtvBQWLTijMfp0g6iKm33EkMQnWzzUWMzip+IlJRnw7/9
         sN8Q==
X-Forwarded-Encrypted: i=1; AHgh+RozoiTZ9AYbcjkbbK7116uwdMOMIMiJpzb20GXhb272CqgwL3u6fc5079vLTO5txpNbpPa/z+SGm3VAmQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyRK+UrsVXYp/9trVxOV900MGJ9gQ13v3BuB5qhGk+li1K2e4qe
	yBJr5UBCyJ5sD/ZipwJiGc7VtvzmLX5HCD8qYX3OX23wP5s8OLiUHnRjwOXZ7Hcy3gixaZfDwNL
	/RPTXMqF5BOkCy7mZGg==
X-Received: from wrny4.prod.google.com ([2002:adf:ee04:0:b0:47f:4fe5:ede6])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b26:b0:495:6274:56c2 with SMTP id 5b1f17b1804b1-495627459e1mr65586805e9.2.1784620234926;
 Tue, 21 Jul 2026 00:50:34 -0700 (PDT)
Date: Tue, 21 Jul 2026 07:50:33 +0000
In-Reply-To: <20260719153631.559341-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260719153631.559341-1-dakr@kernel.org>
Message-ID: <al8kyaXILj4oepq7@google.com>
Subject: Re: [PATCH v2] rust: irq: make Registration compatible with
 lifetime-bound drivers
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: daniel.almeida@collabora.com, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, tamird@kernel.org, 
	acourbot@nvidia.com, work@onurozkan.dev, bhelgaas@google.com, 
	kwilczynski@kernel.org, gregkh@linuxfoundation.org, rafael@kernel.org, 
	mhi@mailbox.org, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Sun, Jul 19, 2026 at 05:36:05PM +0200, Danilo Krummrich wrote:
> Adapt the IRQ registration to work with the Higher-Ranked Lifetime Types
> (HRT) device driver architecture introduced in commit 2c7c65933600
> ("Merge patch series "rust: device: Higher-Ranked Lifetime Types for
> device drivers"").
> 
> With HRT, driver structs carry a lifetime parameter tied to the device
> binding scope, allowing device resources such as pci::Bar<'bar> to be
> held directly rather than through Devres indirection. However, the IRQ
> abstraction required Handler: Sync + 'static, preventing handlers from
> embedding lifetime-parameterized resources.
> 
> Remove the 'static bound from Handler and ThreadedHandler and replace
> the Devres<RegistrationInner> indirection with direct request_irq() /
> free_irq() calls in the constructor and PinnedDrop.  Registration<'a, T>
> stores the IrqRequest<'a>, which structurally ties it to the device
> binding scope.
> 
> Also remove the &Device<Bound> parameter from the handler callbacks,
> since handlers that need device access can embed it in their own type.
> 
> IRQ handlers can now directly own device resources:
> 
> 	struct IrqHandler<'irq> {
> 	    bar: pci::Bar<'irq, BAR_SIZE>,
> 	}
> 
> 	impl irq::Handler for IrqHandler<'_> {
> 	    fn handle(&self) -> IrqReturn {
> 	        let stat = self.bar.read(regs::STAT);
> 	        ...
> 	    }
> 	}
> 
> This eliminates the indirection previously required for IRQ handlers to
> access device resources and aligns with the broader goal of expressing
> every registration scoped to a driver binding through compile-time
> lifetime bounds.
> 
> Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
