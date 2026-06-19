Received: from mail-vk1-f181.google.com (mail-vk1-f181.google.com [209.85.221.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED9CF37BE86
	for <driver-core@lists.linux.dev>; Fri, 19 Jun 2026 11:48:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781869721; cv=none; b=alFcL0F1S07JmX9NalrZ/BZ7oHsLZqW3JHM9vB1w98luDP13aY6JuJqxIcx7MYvNWr8qR2+DEC3JYIynTNuHS9FpHqW3NmbJpHwtpVoCGvmNjeylEflWL/aLKWNnlFQKJ8ORfrp+2wIlrJRXDuKnK9XQsbv7nQV1l7WI8LN0jlA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781869721; c=relaxed/simple;
	bh=yyWyYqE/jbVl1VgGKKGeJNCofu8gfjfeZlg7cKyJ9fo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P2wJxDQ/FTWSyQB3CDXPktxTNRymNqp/58a0p/OYJ6jh1PemJVt4mary4FcqjWx6UMsY6UUf+/i/FFS1CUvOzFzKuvhThldq23AhcRszWeQQJz1C2jq4NYAbQ9RJkvTbD80kKjMhgX+bsY/H7GaJo65V12ZAIlzOzt9lPy9P8K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f181.google.com with SMTP id 71dfb90a1353d-5bbc6c99b5cso601102e0c.1
        for <driver-core@lists.linux.dev>; Fri, 19 Jun 2026 04:48:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781869719; x=1782474519;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ItJpWj1GNu2tcZXuQZG+sYbJ7oV+gLF69bBweX98kac=;
        b=qmtDahZwEjXjFzjs0oM7UmD8rmC5H/jeI1d0YLaXJoZdIboViF5trZnroQnErcv6vb
         L1BEosBHgpIusltQC3zmXdKvlAWxlV8+YBvnDXrjEmGHo3kHZZ7KQptTyE1IGQuqIiBs
         l0ihfNA4dLtuDwrqmg02U1PE1Qr+o41qrMp/4WfKJsfT0ghkvn+Mmefev8Xr5o6F30zB
         w2zL0BP7H9h0HiXuWtHih0q8llXv9GDeP5ul1gWEZct/TvhoC50LrqeNrWu7bOqaSkM8
         PZV1sIhKvGLQw178gD/K/ZBLPprz/i/y/J+YSq7VGlnelVZCD0o79C/3/knbOMBMr5du
         R/Lg==
X-Forwarded-Encrypted: i=1; AFNElJ/21rYmJebnkv3sUXIbk1AydNBHPPcUqhynD9mGYDyxUF5+MDwcnL3GFkrQ3h+8BrMdXC5xQ55AoHJerQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwC+ayQRNMEJxhXWqB6T3fAqTiUp6zGn2e4y5ghQ18T4/ThHBve
	NR+HnxR0Gu3aF8SgEpqDS/mgKkOMjM8KB31P1NWgEL9E1kOo7futivuneOeAg1xd7M8=
X-Gm-Gg: AfdE7cnc2lwik+X337QVEz0Tpe73xTtXfMxiROy756SaFAXuTWNMS3v+oG1RpqGWw6l
	vHeZcjnYtVOWPzjZN+vrlInpXIPKPGZBqbPznufBl1wGNOi7jkr4qgapJXF33RN/mMbdECiT1hV
	aXCEr2rGxU4AsdXvYysUXqhjK0FhZbmrDwF/6qr1N1cVz9f7u81wx6QR0M6uuI+0kQFurt9+pDo
	EK0Ei3EkbBrT+eYF+vOF+PHsz/0PdHiyHwY9aiyYNkGlm1xoDBNUopGKnqpFMTUmI/NcKVtR+9F
	XZqYlik2+ZdyMJT9crqZHB3jjr7E+nWRHDeLPnohpld5Af9WaJ/+Cp7GzpfIYoyRrZ9WtDWPCUx
	0m8YIag32/GrIYwa4antQFLFNBLzjNkOKtVT9dd7bopiQcb91+51AW3BFxtWSWu41OvpZ+896jp
	cg6zHgPco7v4ujh5/7vAdwSm2Rn8Rw5EAQ0z2bdDIfD/VC6CL0qg==
X-Received: by 2002:a05:6122:179f:b0:5bb:aae2:1754 with SMTP id 71dfb90a1353d-5bbebcac41fmr1356473e0c.13.1781869718820;
        Fri, 19 Jun 2026 04:48:38 -0700 (PDT)
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com. [209.85.222.47])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5bbea142d27sm1695770e0c.5.2026.06.19.04.48.37
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 19 Jun 2026 04:48:38 -0700 (PDT)
Received: by mail-ua1-f47.google.com with SMTP id a1e0cc1a2514c-9667fd8e4ccso340421241.3
        for <driver-core@lists.linux.dev>; Fri, 19 Jun 2026 04:48:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8umzewwm4X4xFwCNCkifrCDXaHinMK8w0KJG7OiWbPPOdnrMuvGGcFtXmGkuCylwywSoERB0+FmZ18RQ==@lists.linux.dev
X-Received: by 2002:a05:6102:448b:b0:650:aa33:5dd7 with SMTP id
 ada2fe7eead31-72a01884599mr2039005137.2.1781869717237; Fri, 19 Jun 2026
 04:48:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <16fb40ded203d1e2b72f4eeecad3fd0c0d23ad6f.1781863296.git.geert@linux-m68k.org>
 <9503e60a-5e8a-40f3-b5cf-1d8d0f71c9a5@amd.com>
In-Reply-To: <9503e60a-5e8a-40f3-b5cf-1d8d0f71c9a5@amd.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 19 Jun 2026 13:48:25 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWoR6UNBC-hsi1V=vwx+9AWzRw9bT_OR0AO2L87nCnn1A@mail.gmail.com>
X-Gm-Features: AVVi8CdQDwS6tzm65LzLlS49GN4M-NumImqTWT8BmI9blTIGfCV8oYLJQhKk5Ak
Message-ID: <CAMuHMdWoR6UNBC-hsi1V=vwx+9AWzRw9bT_OR0AO2L87nCnn1A@mail.gmail.com>
Subject: Re: [PATCH] base: Remove unused DMA_FENCE_TRACE Kconfig symbol
To: =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, driver-core@lists.linux.dev, 
	linux-media@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linaro-mm-sig@lists.linaro.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Christian,

On Fri, 19 Jun 2026 at 12:39, Christian K=C3=B6nig <christian.koenig@amd.co=
m> wrote:
> On 6/19/26 12:03, Geert Uytterhoeven wrote:
> > Commit d72277b6c37db66b ("dma-buf: nuke DMA_FENCE_TRACE macros v2") in
> > v5.16 removed all users of DMA_FENCE_TRACE on the premise that the
> > Kconfig symbol did not exist.  Apparently one failed to notice the
> > symbol did exist since almost five years before: it was renamed from
> > FENCE_TRACE to DMA_FENCE_TRACE in commit f54d1867005c3323 ("dma-buf:
> > Rename struct fence to dma_fence") in v4.10.
> >
> > Time passed by, so remove the Kconfig symbol, as no one seems to have
> > missed the functionality.
>
> Yeah that functionality should be fully covered by trace points.
>
> > Signed-off-by: Geert Uytterhoeven <geert@linux-m68k.org>
>
> Reviewed-by: Christian K=C3=B6nig <christian.koenig@amd.com>

Thanks!

> Do you have commit right to drm-misc-next to push this?

No, I have not.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
