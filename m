Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794501274;
	b=21aqRs7dIvRr2m16k9nj0chL9lUHj2mtkdzq3tcBtWm3kqLTMyLVU2mkUtIw0i79r4RH
	 EBGRzP4CXIh40vekKyDmLBbFtbtuvZvHoxtI74Ar0h9hICYn2pAM7ZjtN0nnJ46uQjwAc
	 1I6hX0pifBFlAD+XwzyvwaoD1M5pPcn0iq0lsKGw07U/4kvxSSFfB9V+P/KJzN6QuHnVg
	 st/gsvVneU1yvEmSOETpTKQjJzIMEUVuy4PVZc99cfC41qQRWerzoRfHC/1xM0qEwNMFn
	 j5LNJdRxfg1SqbKoNIFdqq4HUYEM28UyC4mvtqjgBQ+GAxzJPV4paFxr/TwLn5kTQEQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794501274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=BkOan397muuCEgFMqk3a5KpizGYyvJYTBVZxmg+BXRc=;
	b=fqKZfkP8nPE07znaeju1qlm3xzCcdsXZpTtrDhrLlvOH8mqeuS0lOxn9EBVBMkOB8eWy
	 UvCgxsTAjcmxaboMGyYi8IwaKxOm32ltf60kRY1yIKQP+KGaVU78GcqD8RWoFhhnkkJ/L
	 OhfKeXnyh7xLY/pj/ahegxA8yjFQYWg/7bkMHwGGkB92/fq2mhT3LkOtcWC3bInC4tOxI
	 uQZ/xob26PpdKbAcARrLivT+Dgixm6uY53mLPeQ88KFx7uZPECMlxYXDzi1Pnr8PXUjKc
	 TFRJ6RIcVQB9di+UDqI2b7JRN+e+SklWqLviCy1LwAL05MzZK+7e3KcQmxgo3iY+Qrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=dlNo6jXg;
	arc=none smtp.remote-ip=209.85.218.45
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F9A0606A323
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 16:34:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 1F9A0606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=dlNo6jXg
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d28f75d62so119607466b.0
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 08:34:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794501271; x=1795106071; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BkOan397muuCEgFMqk3a5KpizGYyvJYTBVZxmg+BXRc=;
        b=dlNo6jXgbBOD+GFWTmUxXhJ3/2EnWT1IDQf0ZD1YtIXn21EmBfe8lOH7cNy25l4+BW
         3qngYumNPMec5JThD/h1AxPSuo8BsQ1NIKsk1ddUCBAKHw7Y8w4AikJgAoKgnA6TTgEO
         eBNtbYzBuX35gNqdgrWcTMzxPVsnQeWpw3pTI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794501271; x=1795106071;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BkOan397muuCEgFMqk3a5KpizGYyvJYTBVZxmg+BXRc=;
        b=JWgwAzTWIUO5sZVuOkGQaE8VLuWZUfq2FMyFVfJ72YT9DT/aHn4M5lAZ1XYskeYZQR
         ppUTUQFsBsK+MREH68TWWC8Xv61WZyaf7kFts8uIQifX5gqTaOd+bBgpzjuZEOoKCbMm
         DOC/jKsWhUUoR2h/Ar+VRIBPEvVKybYU8s4i6xLwnzUFaq6KpKwMuWbDp53nMrX96Oig
         muU7Bz57WsUvhGxmaLz2KSAE3fw9X9JiQDdTTlzdYCD+WufXlFrvsVpTTW2013M8xMce
         +BX4j8hBGubLRlD5uNlvB5sAUUHrnvTNsqFTGNFpp57lks34oLGlPbGWCtKFBTvZrSqI
         HcRw==
X-Forwarded-Encrypted: i=1; AL+hErFv4f0v0mh4pkwG/RUzqF/+Ip6i01mtOeNfzHquoOZwnKVbb+HtZ5Nm/wdPni06x5+LfVqnrsCZrr48ug==@lists.linux.dev
X-Gm-Message-State: APuU4Z8NiKiNOzp2jT/guYHQFzcpRLJ423eOI2dm92oSTDit9EWGDfx4
	ZGVtnkJH1cJUEm/yfSIYeo4g3SPh7OiJqsEA1mDj+IaNc9QUFszMW05f+pmx73uCmRCFQRPO8Ob
	tAsWaW8rJRw==
X-Gm-Gg: AYBFou2Jy2+CSGM2G10I+xYBFzR3iiB+POxGOzyirfv5solQhWIySohf8J7cFZQKS31
	ebNF/pg9qxpYt3sbX+7RafPacmutYsnUkG1BUYxoSkffa27suNgJhRE2DDn+bE8LXh9F6VG9t6j
	laHM/zTCJYfnIux2LiLvHk0/ZmjYll1+pT9BZmK6E9zkIDLtMdf5zdmRizLs0SXZhLuql0cre/A
	AqwuvCFlHG1p47lYivPBUIh8w4Ypejg5bLFXJYk7sXi0oy7OGBUxmepETvWER41YZDWnij/YM3c
	b8TAhAG8Da12mZnFy8GrCnQP+isZKSen6DM6+3Ylc919W9/HsmqPBYL+Chr5u1D5kp2jGmxSwbl
	P5vKKJvVUEwKcpFAGcEXkG/Sd5v9GXao6KZfEdZjw17piswa16kmB80WpA7ijuGhxPqxmCCdXCR
	4NyUegIDsJ3kSZ9qK9oPXYN+Nc+/DXSbrYohd4zXjGGoulurtUpnlybd31OVG5xmPNOpxIgiV+Y
	QPWhROd9zAi0FowwIeI6JbCOYSCGe0a/yF5CKX5Pyas5329UvesQyoqkz6WU+dG4qjBotdlQQcF
	5tIUonOFK6W/9FFMMkJxRa8rJkBs9VJs4c9rkdad1MXVgSFtscwFZS17KkwDcl4DsI6DyIwZtGH
	KTQ==
X-Received: by 2002:a17:907:1c8e:b0:c4c:bff4:202a with SMTP id a640c23a62f3a-c5066da4745mr522408666b.49.1794501271400;
        Thu, 12 Nov 2026 08:34:31 -0800 (PST)
Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com. [209.85.218.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a67258asm365872066b.73.2026.11.12.08.34.30
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 08:34:30 -0800 (PST)
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-c4d28f75d62so119602866b.0
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 08:34:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEM+fZPEcKgpR1t9dNIrJR2HY7NTEa/klTiF77M8A94ToZQvti+gDY5KFE1+iY+f5+70XvSZY1eBY3aAw==@lists.linux.dev
X-Received: by 2002:a17:907:96a5:b0:c41:e75e:5889 with SMTP id
 a640c23a62f3a-c5066b5bba0mr524017266b.33.1794501270421; Thu, 12 Nov 2026
 08:34:30 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20260914223212.i.829-kees@kernel.org> <20260914223219.901347-2-kees@kernel.org>
 <20261112004039.GA523044@killaraus.ideasonboard.com> <avWNCC3_Ff0knO6J@devuan>
In-Reply-To: <avWNCC3_Ff0knO6J@devuan>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 12 Nov 2026 08:34:13 -0800
X-Gmail-Original-Message-ID: <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com>
X-Gm-Features: AclHuK9Nmkkll1Jqx8Ewj5iXnIEjw3xkEvFj8OVOVXeQp99rrxeYYFJHUsjvVTk
Message-ID: <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com>
Subject: Re: [PATCH 2/2] devres: Provide kmalloc_obj*-style API for devm_kmalloc
To: Alejandro Colomar <alx+linux-hardening@kernel.org>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>, Kees Cook <kees@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, driver-core@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 02:13, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I suggest removing kmalloc_obj() entirely, and using kmalloc_objs()
> always, with a second argument of 1 when we want a single object.  This
> would remove the risk of that typo.
>
> I also suggest having default arguments without variadic macros.  The
> way to do that is using empty arguments.  Linus complained that it hurts
> his eyes, but it really makes these macros much safer.

No to both. These are both "make the code worse to catch errors that
the compiler should have been able to catch anyway".

If you *really* want to catch them, make "gfp_t" be a 'struct'. That
way even compilers without things like the restricted types that
sparse has will catch at least that one.

I did that many many years (argh, decades - I'm old) ago to catch all
the 'pte_t' etc issues when rewriting the MM layer, and it works very
well.

It's going to be somewhat painful, but ti might be worth it. People
who only use GFP_xyz flags to pass them around wouldn't notice.

            Linus
