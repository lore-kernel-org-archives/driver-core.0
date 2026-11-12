Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794505648;
	b=Kj8mV9W9HAIgyB2WO8TZi2iQU/N4su6g/D/sh2n7Z00RB3Kv4pIJFgkLmuobQ3dFoq4Z
	 BM8RypQhXNA3shwg9OQqSC+HEg3eVa3TPW3OdhA/QUs2iIK6iV91YAO5CjVUpbsyBoLwP
	 q0/Cu44OSOJI1+aqzwMMKufZXY74NoQ+tXWTw73naXhkxqTasM1HR/a3WUeaDGwCMzamu
	 4pq5Vyog2SlMdwR0esk/aSg1TPdTpjWijtR3HqfCPMZC+VpxkNyoEwvWQfH8TK+/vQL5L
	 Jjh1XO8PnZPTa8rr0K6s+2nmh0sVC/6noEdDjHksqsEhTaJpqvTaWWnm2WIgV1uqkuA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794505648;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=CPqL/jXjgacEff5dEPASqy6/Bbk+NnoKXgfKHY7JVag=;
	b=HHJIbSngWfVYXKYth4KV8lfSvuWs4wpdNFvXNwPHci8LlYjZJkO7yAb2a5zqjKgqWkvH
	 SjPk0keKu5hbVz5ixq3Fm3yaMXqBa0peBCMqkgtzsWQNqSuofLwyf7KgMiMLKicEIQNGU
	 qa/Ma14yIr+rUFhRfYw/jHqWKrrka//0FPAGPCe/0rXDJOSwOG8o7G2oHJtiSjjIwedl6
	 IT7xnQPiLq83hF+uexOjxo2zljJbP4al/8XWr45J0dojAE6xviR0QYOg2iGR1q08iLl6i
	 eq9cpILRQx07aJS0MIncRHbkp28vAPhks7Sp8wCBh5Yr/rUEmNoRlEIxz4cm/h604rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BxkZuiCd;
	arc=none smtp.remote-ip=209.85.218.53
Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62327606A323
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 17:47:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 62327606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=BxkZuiCd
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c4395d31228so628901466b.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 09:47:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794505646; x=1795110446; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CPqL/jXjgacEff5dEPASqy6/Bbk+NnoKXgfKHY7JVag=;
        b=BxkZuiCdUmAz2E63jZmVdxf+6l8Jke7N4huTyrDLvn0aLFKBx6j9b+sQ900PmX/WNU
         UjNTFbifNKJJMSlgmnZhcaYao0ukyTgNZArRiN/Z4m9rv/lTLgl/XiPGbuzSvEVat+Gk
         jGRVMkdDp5jbrheqvuDeRXGjpeT/4BjnhudsY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794505646; x=1795110446;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=CPqL/jXjgacEff5dEPASqy6/Bbk+NnoKXgfKHY7JVag=;
        b=JaUmrW4E+7l+W9giZwnxAMEC4VyvozFfljp3/Pw/wYNN5iRge8EAKVOLfdq9UPz0uQ
         o7EHU9JIDn/ZE338iz7+c5eTuR9ZJnBQrj0ADs7l+cqMTCxRZlvrvcXoDWYvO64FqoMM
         81Zk2nm7gaxlKygvgKRaWePCzr4GCRKk3s0WXNR0TfKesm5QPMNbih/qiN8wDSUyUnJV
         zFzdZy7plPcsVN8RPuor8gKLzxfupJ7tOUtw/AD/J/zvDjO6a7Op3d1Zzs+saeK/Y3rB
         tRyj2wuqpA5SyKBZVtYwifafmeDXsISyVIZkoIXhjJrVgfIpXoNQO2VssVEqkwuoaf1n
         K+NQ==
X-Forwarded-Encrypted: i=1; AL+hErG5sUkVO3da+1He74xY/E+Hw8d6tWNJ7yrQcoCwRbbe8/g3vJR54rQRKm3XkYMvRrDKp/sZ1s1LZsgePQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8A5mjpqg7kWNuoAd0pOxdeTtsULNGosuKmvf7cKIiiwSePz7d1
	XvEHVx9iJSAWgFkalgTzJmmPQX33Fi6o8afD1JtM3otmZdyzxnCLzp5e4mUxyYEU9uUJwsqAYdj
	R98kUhpUd4Q==
X-Gm-Gg: AYBFou3oJ9CZcsnFxOZEpBzAClBBX7lbOksRMiN/x3hz0Wh7f3kv5JL8inBSsHjKaQR
	VTwBeZzzK83ftjVeD64Y6v0tZq9MmckPPTlF26T2twgfzReMbX3+XcFvHv+KWDutjy9UFlPKTLx
	+hNOM3IPVWvwtg0yAMytBeFDz+n12RHEdG2cvqPauN3hma3N27rWBnUBYd427cSjZ/gpwNFHP42
	+53+X4tnXu3/aE2XCTgB8Wx4C9x8xaUQfZ2X2RIJ7rDaRKf4vs6wVVEjs9ZO76ADqecz7YylLpm
	xLAHTzHbAcDUFs4qfqjrFTAPLzt9K2QF0hJuxQoaNoymC35/pzaqF3X/yNSMW5or+SjQp+KYv0r
	Bg6/VKK5Jbz/UkcgKF6JeCBPlv4eLjQzh0FARMoq8Gv1Srj5Qla41fkxQr54LHVS2/Yra36SHcS
	QFjwua3Y9QjjDXQBmB5xgEEtRqnDjxFK6LNiG/xHXxZ1P1OBGJLoRFltYdlGJA/l6T4oaggVl3n
	/g6TQT+d/wXHBVhOGDjkubXEOWirG4ZaC7K5oh6M4OfO8Bm3evf4+xHCgRadWg1sk/usv8cgf6C
	X4BlUasjtvMGaf4VmsINhyacpmQ00EebcpdrbP9jGsuECJlW/En9fiTSvCSWTsRft5LdfCDk3My
	fzwIsoIL6FPyT+gCwYL+1oIo=
X-Received: by 2002:a17:907:3e1e:b0:c42:2d07:4c38 with SMTP id a640c23a62f3a-c5066c8b906mr609008666b.26.1794505645764;
        Thu, 12 Nov 2026 09:47:25 -0800 (PST)
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com. [209.85.208.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c5095a5b93csm3495566b.5.2026.11.12.09.47.25
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:47:25 -0800 (PST)
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-6b2237b596cso170071a12.0
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 09:47:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGL659XuY2AA6Om92SeY5oHBHD4O0B844QYx9LipmppP03bMxoCKuUuIf8NsSr2GmeLoRX7ROcJTDuRig==@lists.linux.dev
X-Received: by 2002:a17:907:2d9e:b0:c50:4b7a:de71 with SMTP id
 a640c23a62f3a-c5066c973bfmr611766466b.28.1794504214466; Thu, 12 Nov 2026
 09:23:34 -0800 (PST)
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
 <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com> <202611120905.DF88D9849@keescook>
In-Reply-To: <202611120905.DF88D9849@keescook>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 12 Nov 2026 09:23:18 -0800
X-Gmail-Original-Message-ID: <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
X-Gm-Features: AclHuK_HNQpT4tCfX_FLYbv7PC35fGzeh8ZhM2vC9ghehMzLoLgyRTCdJiNaTCw
Message-ID: <CAHk-=whAF3brA9Wrcf3KDhNn_653zhUsoqe1MSneYJWtS5505Q@mail.gmail.com>
Subject: Re: [PATCH 2/2] devres: Provide kmalloc_obj*-style API for devm_kmalloc
To: Kees Cook <kees@kernel.org>
Cc: Alejandro Colomar <alx+linux-hardening@kernel.org>, 
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, driver-core@lists.linux.dev, 
	linux-hardening@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Brendan Jackman <brendan.jackman@linux.dev>, Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
	David Hildenbrand <david@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Mike Rapoport <rppt@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	Geert Uytterhoeven <geert@linux-m68k.org>, justinstitt@google.com
Content-Type: text/plain; charset="UTF-8"

On Thu, 12 Nov 2026 at 09:09, Kees Cook <kees@kernel.org> wrote:
>
> One thing Justin was poking at was adding a "strict" mode to typedef

Honestly, the sparse setup is superior. It does that 'strict' thing
(except it calls it 'nocast') _and_ it has 'bitwise' that is a nocast
that also disallows non-bit type checks (which is *very* useful for
things like "this is a big-endian value: you can only do bitwise
checks against other big-endian values).

So the compiler addition may be worth it, but  even the "poking at" is
weaker than what sparse already does.

And the 'struct' model is honestly superior to both when it works -
but can add extra overhead (but can also end up being nicer than both:
instead of casting with special "I really mean it" casts, you can
derefence the struct and get its value that way)

              Linus
