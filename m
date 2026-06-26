Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF2ED381AF
	for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 18:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782498680; cv=none; b=CFuj1vNQhYd1GzcLxBT0CQtHG+xowQV1JQMrDSJ7IY9zg27Se/R/oiDoOHl+cF825351d7siun+z8GMeTzusyLXh2RhY6TqN6cJj7W1dxMhK8f3v7n6PCu3ZTqPDLE7yma1CLyD1urqQZB4qw2aiZxeRaiX44RHDGVAkktsXr00=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782498680; c=relaxed/simple;
	bh=eicChBWA6csvl0tpth84CHLD34v3QTKt9eCjMD6sZH0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=meNEtuVjzo9U7YycsXa7+12UGBWleLW6K+SKmxyk+BMD+QSrUG6CNR47y4xS1QsnEd3qa214MxX0QcFU7pL5ENy7dkYPBcfhf/Dik+jySeC0DpH8SAKlzAG4fKdg+Qhwk7lUeRgtZ+EddWWxhBNV2Xrb3oW5Mf1vEF6s+x+hjck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=E3w8ZcgC; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="E3w8ZcgC"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-845c908143eso795427b3a.0
        for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 11:31:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1782498678; x=1783103478; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LdlqEAkSsX1mWLPPHhw2dxLIgWsK0t8JlA6NYh+SJ0Y=;
        b=E3w8ZcgC/HbOwlqwhDpF/JfAhhPc60qxiSL8q859WOBmUSH/ObF7FYk85SNj2zeZuM
         l8O4XLQZfVlzG9q6Mu5jLpqAI0LfHW1BJUZ6nGLAYnUrvGeaKIWGZwYPvwQP/pTVTkeL
         l1mJUfqoSaHSBqIwulWx6YY/c9yd5xhPSHte4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782498678; x=1783103478;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LdlqEAkSsX1mWLPPHhw2dxLIgWsK0t8JlA6NYh+SJ0Y=;
        b=lHyvK6vAu25IIPIEm2o2gkr2JLrYZl5FJLnF22rYlpkduKgIskx7OC88BFtRpjtVIe
         onTiBteYIMv7XLW0jp9vtbFSuXMxLAMY6lMqp1/KwTDlpzMQjeC/6MamHkQSJERv5kmo
         6zo5gVf0+CtR4vtjnVJ9AkMRJSpgBoC52EWM/CzahjRDpQeFZI8qHYjq8UN7QkhebI6h
         JyicutZJC/B3ZXrF8fjvzwyYkS4pNUrlwUj/7uoy2P/aZm/5dZoScpcnwlt8IxFWz0Lh
         9NGlly2pYK+7SsREBjvjDGfjbw6dBNaymK6FVNtlpGMxwMAjB0K6ZdQARe0Szy6XCVDb
         dYnQ==
X-Forwarded-Encrypted: i=1; AHgh+Robart/56838bahYr++y4rdgW0XX8G1oK42HeLRM1YGY6Rgon6jxyn7uynKDn+gheJPaCwpKKs7T49pCg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0mUb8Qndnlqd9EPd3jw3I4eUttKmoyf8gx/mPdkVtKU+7bGlL
	9CcqQT04jF+dfkSaDFBTSgiHdoH9kgA1KOICpfTV6vAAqSQYyhFsYH5cU0yL9wIz5r/8DwDD4kl
	A63YsTm4=
X-Gm-Gg: AfdE7clG9eL2AmBa1vM7VmtMSJooiHqa+8A2DOfp9MtNE/GKNHFSwXmmRnxazel1VM8
	sKzuwW3fi0B/PgbI2vGbMoQZoX/xwAHblBK8BZO4rFeOEkqsQFW7Yrf2foP50FZtgyiecwrPaZl
	E4bZQAl4qah8CU5vvqdxyenia1YyiWQYMEu98e9SX9qcUBONUrYdSMQFK8kpCsQppsk3pW4DZB9
	gyepHvyH4yQ/0ee41CgK6KvK7UDia+nEVNHYNqfw66T8akHMTz9CV0+8CjALOE7dZo5nKPYw1f+
	Pl+lY78bbtSxUmK32U3hmZP0piBiY3vRI9VOqfQYuX2l9Ww6C+o+wuJRLs4NBaRQMrwrnTl1cfO
	f2xuj7xv20V9JeTEvTUwPRq8+JGFtzSklEhW+QO4SZJdI08xRO0LivBkp2V/LjXpg1YvO9ncLSl
	iPA5qL3xkD2J3EJ9qYoBNGbnxFCUNVRuc89SEIIwTXzheMjdBcgfxnrKMjRZXAyyYoElkycAEFx
	crT
X-Received: by 2002:a05:6a00:2d88:b0:842:5da3:9b8c with SMTP id d2e1a72fcca58-845b3af923amr7671942b3a.36.1782498677784;
        Fri, 26 Jun 2026 11:31:17 -0700 (PDT)
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com. [209.85.210.173])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-845a4121fdbsm7105266b3a.51.2026.06.26.11.31.16
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 26 Jun 2026 11:31:16 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8454160043aso1093815b3a.3
        for <driver-core@lists.linux.dev>; Fri, 26 Jun 2026 11:31:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RrxzzwC/bqGf1l8b1WKPmgMXMusIe/bLHv5PZzMlJ9CnQnnN2YX+IXsYl+jk319z8cEWl81XWM7yQTG1w==@lists.linux.dev
X-Received: by 2002:a05:6a00:94ee:b0:827:2a07:231d with SMTP id
 d2e1a72fcca58-845b3a40812mr9020025b3a.17.1782498676342; Fri, 26 Jun 2026
 11:31:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782490566.git.u.kleine-koenig@baylibre.com> <976ec5b0529016d63ca3cadf8792f7b2324ab58b.1782490566.git.u.kleine-koenig@baylibre.com>
In-Reply-To: <976ec5b0529016d63ca3cadf8792f7b2324ab58b.1782490566.git.u.kleine-koenig@baylibre.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 26 Jun 2026 11:30:34 -0700
X-Gmail-Original-Message-ID: <CAHk-=whM6kwmSXnD-9pcSNLzvZLFyzXzdm08NuEr-ZH8WxQKPQ@mail.gmail.com>
X-Gm-Features: AVVi8CdXCuSrrbD1r0dswuj6qG8ieBDIb0UXrbzauKRFI089d0fQjdB1FuzaizI
Message-ID: <CAHk-=whM6kwmSXnD-9pcSNLzvZLFyzXzdm08NuEr-ZH8WxQKPQ@mail.gmail.com>
Subject: Re: [PATCH v2 04/17] driver: core: Include headers for acpi_device_id
 and of_device_id for struct device_driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Ok, looking at these patches, I realize that I hate the pathname.

On Fri, 26 Jun 2026 at 11:01, Uwe Kleine-K=C3=B6nig (The Capable Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> +#include <linux/mod_device_id/acpi.h>
> +#include <linux/mod_device_id/of.h>

Honestly, that "mod_" part of the path name makes no sense to me.

Yes, it came from the old header name "mod_devicetable.h", and yes, it
comes from the fact that the device ID structures are also used for
module loading rules. So there's a historical reason for the "mod",
but I don't think it's a particularly good reason, and not a reason to
keep it.

None of the structures are called that - they are just called
"xyz_device_id", and while module loading may be *one* of the uses for
it, it certainly isn't the only one - or even the main one. Arguably a
much bigger reason for those device ids tend to be all the bus
matching code (ie acpi_match_device() and friends).

So let's just get rid of the "mod" part from the name, ok?

              Linus
