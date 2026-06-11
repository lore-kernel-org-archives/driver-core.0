Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 646003D813E
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 11:10:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176239; cv=none; b=omCPCBK0ymeKeNE7fd5ZWI1cNdtMex65kU7jxvaSXNZc1j16MDzgT+WPf9R5Cz2E6wE3l4PfkfXEXjXzEdBzhIJG9mGjAVekFtXZjsK8W6GPaHMArrwLaX6gNv8Gdh6gT5eEcXm4xdmdK8M0xQqNcZT+56zCpuyYpczzxSx+pco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176239; c=relaxed/simple;
	bh=X2feRBYV3vZ/tuaORdzmJKxvCC61hcSBv0J0dSxbdw4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=IUD/Z25x6ptTAIB9dDqC3glD4AVoqfaeg1QycqtjbOBTYR9Ivkjnu1bbhg85hQrruU8mmdRub9v2x/TO59N3KaVxatqHkIngTseKc9xbOB/99Us0qQBIOb4TzQGlzDmdUesRdNisXvvbOsairY3nRDOEIP9aXI4pKRzi9hzPBb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DPYdEtSb; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DPYdEtSb"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490c840efe6so6922285e9.1
        for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 04:10:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176237; x=1781781037; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hPEJWO7zc+9d/tXPog7CgsAXE7dhbuzsNKzaOmhd4=;
        b=DPYdEtSbE2fPFiSRaNGsFn9bGx9FMFVoDbIFJUfLpWkN1Ia+eqINt1i6AAMBvBqYYF
         y6K/vHbXRvo8AZUjboYHdEcmnYwbj+D0YnTkMDGmxgKSZEe7KkKumKJNAeS0DL/dLQZA
         RtbjnrOIkG2Vod4AvPLjb0Uw8BBdbIgl/5fFJubEEzPMGYcpOVL2TX3cZpsKAt/nQEl3
         yBhSzx9xJYFGU7ogZP0fhqux5mCTIaLa1tokWvvegcI8bmvpSYBT1FdfEWJNRMo7le7K
         gDzZ1JGkwPkExXHYZh8R40MREM0HAGjy2QDQx4kIls8Z+Jq7rQtuKRNzTqlz2FfR1ta8
         Gq7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176237; x=1781781037;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B2hPEJWO7zc+9d/tXPog7CgsAXE7dhbuzsNKzaOmhd4=;
        b=s6tFfKVKKobuO1D/gsBiEYAo0NtzF+wOXJQDWXa0t+tAWjocUcEnWV+RnotwW5zqHu
         VUI70iQtfqsUQcnN8RucLdyCrfYiG8G0/I5ALvYSbHFPDSf0nVFuO25+aWx+ejr6dUm/
         ZLBWSxef1WnJfD4MMPf0e7Q88QMxysWHTiexQ/X5siHX/CGvG/o6RtLWvZqIdcQzoqxN
         EOyOqFHxnlnNs5GEzQC5NMOflRCJcLZzBfOY9PwLVd3Dy8KXPUlM4iHDoSv/U2aMKOST
         hZvDPMoyE34flAU3mTvXsTXAGe6HBBT+V6XWQIbzTC+Uw2GNmbdpQE5a0zzHO/r2UInn
         9WMw==
X-Forwarded-Encrypted: i=1; AFNElJ97wUZNdtsMNXVW0wSziNXjL605uqJ5HQvuVDOjLNvQaucgM0Lw2vVQypczNygTOWnYyYfg20WQBmIomQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHnxQGxPzFyIQfg1oRsbzqQJOtw8GjSMtZjYL6xihK9xeRZGif
	yfHQJDiZyVHnqOgHOJCyP2J+Z/WaO5Hi5B3vSFJVY0OiWd7AW6CueWv1s2jE2QH954NAxEi4aLp
	KR6oVaYnq2GZ2HVnmeA==
X-Received: from wmbgx15.prod.google.com ([2002:a05:600c:858f:b0:490:b1cf:4fed])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4fc8:b0:490:af63:2cb1 with SMTP id 5b1f17b1804b1-490e52df887mr25369835e9.7.1781176236585;
 Thu, 11 Jun 2026 04:10:36 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:35 +0000
In-Reply-To: <20260610162433.923550-4-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-4-lyude@redhat.com>
Message-ID: <aiqXq_ufWWztHPQ6@google.com>
Subject: Re: [PATCH v20 3/4] rust: faux: Allow retrieving a bound Device
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 10, 2026 at 12:21:30PM -0400, Lyude Paul wrote:
> When writing up some rust code that used faux devices for unit testing, I
> noticed that we never actually added the Bound device context to
> faux::Registration's AsRef<device::Device> implementation. This being said:
> the Registration object itself is proof that a driver is bound to the
> device - so this should be safe.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
