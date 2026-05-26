Received: from mail-vk1-f171.google.com (mail-vk1-f171.google.com [209.85.221.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D044218C02E
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 12:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799583; cv=none; b=gf9QfuMzasejTdyZNU09GrNXBZMfGoX5CeI/qrfUDXsn9qaFB/JXjUQ4ITcn08dMuyWKxVeUj2ToXA1qcH0NNr7h7sV2oO3lTlFiTDXbLMaPnC++BzlbQxoZI+t5A8cZ4tsuFvCibciHbOlpLP6RG1ZsIkTODY7T0K39Mbwy5kM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799583; c=relaxed/simple;
	bh=1KZuSJ54bOlx11+C6QvYz2C1CWXUb2onHlCMC1rn8g4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=beIOje7DH26lu+KhD/n9CfHigiUbY2wJ2UMak8HHUM7m/h7g7jPM79ws5XfM4lJtA2uy/NJPZMqssiZ3V2cFmvbGsy4R3k2sh6/x6h9v1YgfS3acZ1sUFTmnMvRGSoIfh92ME7Vl/rfUC65S0V1RlbiEoS4JnqqdjsdeESQ67to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f171.google.com with SMTP id 71dfb90a1353d-577500ac0e4so3327513e0c.0
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:46:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799577; x=1780404377;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3snD10qfTEx+T27DMfMG7Byy+g37m3U+s2y938/elLI=;
        b=B13WI5ovxJ+FhNb4TTgJvM8IB1wO86EZwZJIFAqvfdLak116dgJNl4KxFjYM3IuE2g
         ej2deUietsFXuhHcGFLPdR7GU3LtxgRZXYPeXFYSgbaEGU2y/Fbr7lpYsEtsNFlegFcI
         BsAj4OTfMfEXKklsR32ablklvZ4V6yZat7/Iz39T0dhFAxD1CPcFiLCaFZ3fzmte24gJ
         +evD6jYfilsTYCCMtegt1EjnGh47itDMIFgu5SY5K3zjaNb8j0c5Pi0pS5f2FC19n6AV
         8gJxvSinLNDTXrTb7SX/NFXr3T7zbWjiDBCT3Aa+MfHhqE9Fw9jMY8W9kgYDQ4lTl68y
         KTuA==
X-Forwarded-Encrypted: i=1; AFNElJ+mA8441wTrFC7iv2BZR2vH30SpZwv+OOgv7VGjl3IQheqy59OMxJZ/j0Xeqk6VIesC12kbYIaeijgwbw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzVtS0vXpzMAhOO+4bd9HjCu1EjI31DywStCLmfpu24AMUbpXl7
	91y8OUutJPS4CexZliUpUkOcNOYon8tdr8KTzFBBmpyBLAkMNfVZ9HD2IG3d8Jn/
X-Gm-Gg: Acq92OHQUfcKjHvtxsEKrY8+tXjEfz04Yc4phf5MVmtsDjfY9qA7jZBpvCRw88L3EWX
	DmahWuwJp8aRpwEug9JswwS2Lkf77P4tO1P1PFM4B7irzus2tQ6Lwf29c4064fZAUzQLSDKatJY
	xbDnYZg7zjybAl4cKMJygQ2mrsED34hW6NrGqiTgUlwesvZqn7G6AyzaokyfaH+l22FkO4MWjF4
	eVo+xalEy99bKGP7KBQBymCiM0iqr1Cr97X/R1AeUO99Jr7OEpYdj7IwXYToMjH0FJb6wex6+Or
	WjUCFVVZ9TdOWAyYjtNysvzDA8sBOSLqBkZLYzG9g1mwdB0RcS9kS9ArwrLxFHLGKjQGHXl8K1h
	PF5C+lbHcFDKorXsOBUfxp7i4NkBok2p9e2jhSGHHAnywf/foGiiXTWcJuvXsSfMAdfwGM6cW5/
	TU6wTNGPtIywunK5Nog58zDmnRyXs154EvHRESKDxTR2Oob5t3xVXLAJ9T5LDPxJ1u
X-Received: by 2002:a05:6122:ca1:b0:577:559a:3ef8 with SMTP id 71dfb90a1353d-586616428bcmr8322156e0c.11.1779799576411;
        Tue, 26 May 2026 05:46:16 -0700 (PDT)
Received: from mail-vk1-f175.google.com (mail-vk1-f175.google.com. [209.85.221.175])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-9617383b1a2sm13488290241.4.2026.05.26.05.46.15
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:46:15 -0700 (PDT)
Received: by mail-vk1-f175.google.com with SMTP id 71dfb90a1353d-58d2174a2b4so943209e0c.3
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:46:15 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/XaYjh/ycpcPWrpmNYSSvfw+dX5+I1o4bjnRqPjQkqSttwYTAKsA56ivg3C/vBDqygCUb2DvpTmyENzA==@lists.linux.dev
X-Received: by 2002:a05:6122:f90:b0:56d:b4d1:3c3a with SMTP id
 71dfb90a1353d-58658560e64mr8563847e0c.0.1779799575125; Tue, 26 May 2026
 05:46:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526120306.184283-1-biju.das.jz@bp.renesas.com> <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
In-Reply-To: <0e71f527-db39-4ad2-84d9-897464f74316@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 May 2026 14:46:03 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUzjj3dE3wQ84XGoP7RAfKxRAChPnbzkAW8NnrPhtoeoA@mail.gmail.com>
X-Gm-Features: AVHnY4LagBR0FMrrQ_wpAC0PPnxsotUy7GXpru1yd0ZVu7Y_7KxH7fjZXndyCtg
Message-ID: <CAMuHMdUzjj3dE3wQ84XGoP7RAfKxRAChPnbzkAW8NnrPhtoeoA@mail.gmail.com>
Subject: Re: [PATCH] Revert "driver core: Use mod_delayed_work to prevent lost
 deferred probe work"
To: Danilo Krummrich <dakr@kernel.org>
Cc: Biju <biju.das.au@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Biju Das <biju.das.jz@bp.renesas.com>, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Geert Uytterhoeven <geert+renesas@glider.be>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Tue, 26 May 2026 at 14:09, Danilo Krummrich <dakr@kernel.org> wrote:
> On 5/26/26 2:03 PM, Biju wrote:
> > From: Biju Das <biju.das.jz@bp.renesas.com>
> >
> > Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
> > deferred probe work") introduced below regression on Renesas SMARC RZ/G2L
> > EVK:
> >  class_for_each_device called for class 'devlink' before it was registered
> >  WARNING: drivers/base/class.c:415 at class_for_each_device+0x12c/0x13c, CPU#1: kworker/1:1/26
> >  class_for_each_device+0x12c/0x13c (P)
> >  fw_devlink_probing_done+0x58/0xa0
> >  deferred_probe_timeout_work_func+0x5c/0xb8
> >  process_one_work+0x150/0x290
> >  worker_thread+0x18c/0x300
> >  kthread+0x114/0x120
> >
> > Reverting the commit fixes the issue.
> There's already [1], which should also fix the issue.

Thanks!

FTR, that patch is not sufficient to fix the WARNING (on RZ/Five)
for me: I need both patches from the series to get rid of the both
the warning thousands of "sync_state() pending due to" and
hundreds of "deferred probe pending" messages on other Renesas systems.

> [1]
> https://lore.kernel.org/driver-core/20260525012340.3860581-1-dakr@kernel.org/t/#u

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
