Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794507725;
	b=Ff3y8x1bGxlm0DyGfku+i2mAZVtmMkaQzoxLAOsbF0B3TZsgBZt2NuII4g8Q8K6yzMQW
	 Bn5UQymc5RKgPMLH/S6VfqQqkLkJ31rtz+ICFPKNnJSjBUkqA1qRKS/Ah50qAmG8ZQFhG
	 VgQK315ytApBoiaytUeH2hgLs5j4cXu70Dfunt8zccrXnRSGXTp35MH/Mrzr3tSmjx7UG
	 kWbWX5BbBp6IcbegySUoBISColfXhfHBjBeYP/DQwlk+FWlJrNTBEbg8gOwa22ywGJeFP
	 lpHzeqhvQ7C2LCjDXvqx0DpxpzPxnk7oO4fLLrUpHVojaJGOlJSW2aq7rsoJXy+uKJA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794507725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=/9R53hS2lq3Ijq537Vl1ow/wvMt9akHjDmPhIy8wjS8=;
	b=NqTmCbgFojxSH0QEbhDcx471XbNiw3v135mnjgtb0iN4VK2M/gK+xfVzTn+3O+TUou4x
	 FM98Dexj1ThFN+QreiNxTZhF3fZKbc9uzt3CnDuYrPkiBQo75L59QrjFUB+sFRSuK8NiT
	 I94gLndycHjhWATzRJQ31F2sJnK7MTT4r4/3hxHYzHT61lnxVJbjKx894txeju67hC3AC
	 Hy+YQCrax/83tGjlju9fooCo/kvaaYN1p9dx/19DgNb17Y6WliJadimiF/muUjL4OVXxI
	 kWO/E4sZ2wvYOGsRGNX+pPub6ljkdHC9z0QvQSOlxLGP7Af0MiPASQyFW3MelKXekpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AnrF4ya9;
	arc=none smtp.remote-ip=209.85.160.72
Received: from mail-oa1-f72.google.com (mail-oa1-f72.google.com [209.85.160.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC15606A31C
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 18:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC15606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--justinstitt.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=AnrF4ya9
Received: by mail-oa1-f72.google.com with SMTP id 586e51a60fabf-45e83fd0663so66678fac.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 10:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794507723; x=1795112523; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/9R53hS2lq3Ijq537Vl1ow/wvMt9akHjDmPhIy8wjS8=;
        b=AnrF4ya939fesARLcRAyau8h4Ds8G2/jorQaqH3dw1rMGRe3CaUBNbl4AS7zHWKGAf
         YKRS+Ww39W90uGGnBa3VgR5AyBvrCNGS541JojzbThc2MtREb5HThcxv7zjyxlxGmzNo
         NkOvixFz+Uu8rnoQyNp9opojKBDPIzYLw8N1K6Tcq7Dtv7lqtF1mLghjUeheGHcRTJ9R
         Ng2I6cK2D1COkThUjJMryuzV/Sk9vmk6sdu7nyEPoIwhpbkCjOtSI6OzkuYfbBjNdsGD
         5K24NDQ4EZHNdTEYGhgR9WlmMreUtTapEVdvVIgG4WcOs43kaIerGdyDxGQ5W753qtdY
         E/sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794507723; x=1795112523;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/9R53hS2lq3Ijq537Vl1ow/wvMt9akHjDmPhIy8wjS8=;
        b=ivS3yra4aVFlgp0z5Y6huLhFKeR/ELmZD6y5fzyoRgM2sRdjwqKN1PcpMDPVyNABHp
         UeN9OJ3puJzrVzx9Y9Y3AtaYwhxzUqWp+pSkb/4jHLDyDYqGl/2bZ8Rrncx1Ix+RALBU
         1PwCJH4c8LtmcXMeH+jlG7TTx68ek57nAOjbYiOmPCH1Sy0m/wE1y/TswNKr6+ID8mfN
         zxos0GlGT/8uBCKtUKMq5TiyRRpAAvjdBys+wL1Ym0tOwPQnoD9Q5L1IAVXsIaPYyNsK
         qtRtaDpMNAeCzxsmmkV5RZKF8A7p/7uJEhhC60V3etZpuxe21zvRK+u4j/y8f4ZmO9sh
         gHCA==
X-Forwarded-Encrypted: i=1; AL+hErG8Ku9zFsEwcL0VZQb+RYN3aDYxEYtVtsusE583Vh/MEtsCthYq2AburuYXhfAck+xISZUJBdi+kiGlGA==@lists.linux.dev
X-Gm-Message-State: APuU4Z/9VZ/WM/UnqZMoPhGtoU1FQiranDyboB4/JTWbS+A+xxOpQQA6
	XrAtBfxRQfCCgEeIBeXld+8uq9zbZ/SfTWSMo70AUmpzbeSGedQmnEs5GmVZLXWd5Ie//Ae6O55
	py28INPoMSDz9jcKmsTLmCrPllg==
X-Received: from iohf17-n2.prod.google.com ([2002:a05:6602:a5d1:20b0:9c7:6dd9:edb5])
 (user=justinstitt job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6871:6687:b0:4a7:d759:9b8a with SMTP id 586e51a60fabf-4afdf7a6881mr466138fac.53.1794507722962;
 Thu, 12 Nov 2026 10:22:02 -0800 (PST)
Date: Thu, 12 Nov 2026 10:22:02 -0800
In-Reply-To: <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20260914223212.i.829-kees@kernel.org> <20260914223219.901347-2-kees@kernel.org>
 <20261112004039.GA523044@killaraus.ideasonboard.com> <avWNCC3_Ff0knO6J@devuan>
 <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com>
 <202611120905.DF88D9849@keescook> <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
Message-ID: <avYBdaCYclTyX9pX@google.com>
Subject: Re: [PATCH 2/2] devres: Provide kmalloc_obj*-style API for devm_kmalloc
From: Justin Stitt <justinstitt@google.com>
To: Linus Torvalds <torvalds@linuxfoundation.org>
Cc: Kees Cook <kees@kernel.org>, Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, driver-core@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset="us-ascii"

Hi,

On Thu, Nov 12, 2026 at 09:23:18AM -0800, Linus Torvalds wrote:
> On Thu, 12 Nov 2026 at 09:09, Kees Cook <kees@kernel.org> wrote:
> >
> > One thing Justin was poking at was adding a "strict" mode to typedef
> 
> Honestly, the sparse setup is superior. It does that 'strict' thing
> (except it calls it 'nocast') _and_ it has 'bitwise' that is a nocast
> that also disallows non-bit type checks (which is *very* useful for
> things like "this is a big-endian value: you can only do bitwise
> checks against other big-endian values).


Cool. I wasn't super familiar with how sparse handled `nocast` and
`bitwise` but your insights led me to look into it deeper. I'll take
these learnings over to clang when I get around to implementing strict
types :)

> 
> So the compiler addition may be worth it, but  even the "poking at" is
> weaker than what sparse already does.

Right but I suppose the benefit is that compiler-enforced things are
caught vastly more often than sparse-enforced things. Plus, like I said
above, maybe I can aim to reach relative feature parity with sparse's
own analysis on this type of stuff.

FYI, there's some prior design with `strong` typedefs [1] in the form of
a wg14 proposal. I've also been keeping a close eye on that stuff as it
develops because it's essentially strict/distinct types with a different
name.

[1]: https://www.open-std.org/jtc1/sc22/wg14/www/docs/n3320.htm

Justin
