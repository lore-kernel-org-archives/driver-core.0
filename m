Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794506128;
	b=RY/Nuh9HatNZG9xqOIIehiufHZ4QKxBp3qRwgOGWYZbSkPExHqgUjUkdSm9erAlywiuV
	 gh1kC+v6oXNEes+Axf/L3GolW1OaQqHtaiMqWvE8j/oG3iIGC//yblvVU4zV+plcmfadm
	 JSnU7ZBFBKZZwHouasJsLm81UWehLJDOvn6GumJ12pST1f22oiDRbG8BkrHVbKH4ceXVb
	 j94mT0bc1fq2Zr60cuSrSJ7GWNDwamIRRNX++l870PG5RX3maUAuwL7UbA1vbW0clBKT9
	 WLV77PpHkD/j3FyGngpFtBts0sbTbwSjvB68f+fSE5HY1rLFQcztB1mWk/zwhxfoMow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794506128;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=nLM7EJdjaO037/pI6q4xA/LTKNh0utgwqJExJ58n90k=;
	b=wO2uR/qnPgkTdHMLN4ZKj4nVLrgkriffrzF6ONPxjSMOnRIlpOqWTnQP/bIbp83FceF+
	 WjbOV7lstEI+27QgpEd5osR98YJtsXM0q9WSJYzk9bTNncgS3pvcNDZiRo2J+A8FQhAYi
	 ZWCem/2uXV5ve27oVK3a3qMtK53rVBxBXa6N7atDtr4W4luR48CSCfDVgiaL2JLx6i141
	 auonUu6VLHz22DEWTsaEshWIDmZG/2UWDwmM1DNldA/kYQ+pauuBlvwEMMsOcLjEpNSJz
	 kJ3h3wS9IrVwW6LCGof9SGTek2nWm/UeYdaKfgNz9ZKITF5u09XZ+o0rADL/OWMEXQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linuxfoundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=P1ObGLDm;
	arc=none smtp.remote-ip=209.85.167.52
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEBB6606A33D
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 17:55:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEBB6606A33D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=google header.b=P1ObGLDm
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso102341e87.0
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 09:55:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1794506126; x=1795110926; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nLM7EJdjaO037/pI6q4xA/LTKNh0utgwqJExJ58n90k=;
        b=P1ObGLDmLmi7NuDETlRRXr3jmnRCRZxZEfM+lTBBb4KYuqRWAVTBWuNES/Zr36c00F
         PpbKlmvv/zqFpDX+fzcG9HDdXPLyQlNWVnTR7s1ko6xLXGyH+IygPlSHftOe+z7uLIAV
         mEnsdMAPOx6/Hiv2ifJytQL+2b5ycZNcXbMcY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794506126; x=1795110926;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nLM7EJdjaO037/pI6q4xA/LTKNh0utgwqJExJ58n90k=;
        b=CcTmlLKpbQJd4mg+Ku9V1B3WsayH1j/QNgwkatfvEs3urLtVcY0kJNv/3Ac4qqmCQX
         smIpAHF7UcYxwCow2gCP38Ha0Cav33Ua6eSqqyji01uXtjD7RJyKAeFVago9bypNvLMX
         if18dhlvkwLue8Dmvzh7MI7I4m/1HBaHodpxzYy/+aH7TyBU+lcs5FopIrLoOaUSgs8J
         wcpMujvZR1gPKgeFGDSQ7E5s2OFwE3g9mzomz8QIJjIlQJMa4fnsEMlEC6qyUVSqUyBh
         y1RpFbgJdVcfZQ57iYM2g7pJibBit8QrNCHoEXkWnua0LkeseIFYqS3LQMikEa9beC2D
         gTUg==
X-Forwarded-Encrypted: i=1; AL+hErHVCHzl41pnynwrcrDVpzW/7xwwd/DV8yv9/Rs6wf89uIdFwNnw5vzuiFynBvE0s7eX8ZUzTAimeVCyhg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+KWTzMMZJB19Vu24njxudtt28j6Je35SKRFW3azuusPsdqkipz
	WC0eCHeKHJl8sJOOfqzdXMW+OPUstxnzpZEnRvQegV5dJkOPNPT8efcEVIKt6krS1XnCAjTDno5
	qn2/Jj9V2Gw==
X-Gm-Gg: AYBFou39kbrEkxcxkTbh0xdbATWejg4y9Y+xLQMc/xdP04/H+/DN8rXqzO5hT7KpgqT
	ueBsIrwWGAvkdNbO/57ywk23T0KPPQLwBGrHjNZnq6dlNiayrXUOU29rUte0D7moYAwZKTqTRrn
	2c3971v1hJvNhd+vOozHUpt7xJLnOe9KhBzQVbo7MnZIPto/kNs+YKbLaBWKlT44LhJQv8SlMB1
	ZZNaIS5RPeQCYsTliJc5yU7s8v3/48j+/TG+YjOIh2vADkilhx/rk51K54xE1tvM6binNxUwyxA
	hgr6S27SlWPoon6QvY1iD131tZvlA9TbSWnQsJc8umTGTzt9zmDLkcpQD+RahCjmDxi+8ZE7V+q
	Gwn5W6zEh1ZtmjPL3R5jY5SWhgQp1daDCgc5pUmBUVFpl/YbgTRKahfUuzWIc8dyx3g5DFFP31/
	asLzfv5+F4VNeoYOj1BzZWf2xuT9RK1vMGO3fMmgJ33iXzXSlndAHSqifOc5J5obDX0pYMR3upk
	yHyo0f48O+Q2YJU7x6fzTU6gHzDxI72TB16qpEiDe9586SM9SojuWj0/Gr0O+R6BaGFQYjUqzLc
	qz2g3ZX+7h9kQSSdIwTo+SrnRwVoFkr+BollLVrgvtfvIezsHtGSuIoNwjX6s6EkQq7ei7jhI2k
	aI1bqg89Ml5lyn5x2KsUidv0=
X-Received: by 2002:a05:6512:ba8:b0:5b8:bc5e:b58b with SMTP id 2adb3069b0e04-5c1709f8540mr35361e87.67.1794506126042;
        Thu, 12 Nov 2026 09:55:26 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5c157baf791sm1828502e87.58.2026.11.12.09.55.25
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Nov 2026 09:55:25 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5bccb867d6fso102326e87.0
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 09:55:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErGRgOtfVhKbO/6Hr2kg1bgfhS3AMcqBO+Y4CaSANJlPVkuCoSpyrrcGB1j/5f0J5WwDLf2npy0ClWR/4g==@lists.linux.dev
X-Received: by 2002:a17:907:d86:b0:c50:62ff:efe2 with SMTP id
 a640c23a62f3a-c5066b2da47mr541451166b.21.1794505688483; Thu, 12 Nov 2026
 09:48:08 -0800 (PST)
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
 <CAHk-=wgYBrhvo2NAG_Ja-0ovPf=xO20Gcopv9Yrr1u=QVxECZw@mail.gmail.com> <avX3Y08tF8Z0C4LH@devuan>
In-Reply-To: <avX3Y08tF8Z0C4LH@devuan>
From: Linus Torvalds <torvalds@linuxfoundation.org>
Date: Thu, 12 Nov 2026 09:47:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wi1U9ry+MmK2_z7E=0KPpNG9zF212t-YmB8gc-qsUvp0A@mail.gmail.com>
X-Gm-Features: AclHuK8TqtfSnV8lmNLmK3LZjOEY1Z81GA-4LECZ876wsZ5FbRi5al1rfBz408g
Message-ID: <CAHk-=wi1U9ry+MmK2_z7E=0KPpNG9zF212t-YmB8gc-qsUvp0A@mail.gmail.com>
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

On Thu, 12 Nov 2026 at 09:33, Alejandro Colomar
<alx+linux-hardening@kernel.org> wrote:
>
> I don't agree that the code is worse.  It's _different_, just like Rust
> forces one to write different code

different *is* worse. We do not want to have random strange syntax
that differs from all normal rules for some little unimportant detail
when I already outlined something that has standard C syntax and is
superior from a technical angle.

Code needs to be legible, and that means that it should follow a
pattern that people are used to, not have random single-byte markers.

The goal is to be readable to *HUMANS*. And no, removing the (more
common) function to allocate just a single object in favor of using a
"1" is not human-friendly. And adding a pointless "," to make a
compiler think it's not a missing argument is not human-friendly.

And honestly, I don't think Rust is a great example of human-friendly either.

              Linus
