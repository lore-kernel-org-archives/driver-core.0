Received: from mail-lj1-f178.google.com (mail-lj1-f178.google.com [209.85.208.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A33FB3876BE
	for <driver-core@lists.linux.dev>; Mon,  4 May 2026 09:50:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777888223; cv=pass; b=Hg/PF30+JyKHGZKeaKSOO960xgz68togM3lNfsatewCyDX8gIR33n++OB1RpvbV/LfVzpQuJNP8CaeeKarOC0q+aUgZg36Yy5kBf9HqSeJL8Hdt3RtNDueiSHupM7dcqvo4MLsTXH/rmuDZPfnskPE6uZqTQabg78ZJ/865HbRs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777888223; c=relaxed/simple;
	bh=5QCqoujvR2yfr3zBse2MohwZpcXQguaVom43FZzirz0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=l9+qCSt7Af2RbnkOCDfL6eGph6klE3W/K90R9YnoXhU/TY9Fk9BV5xvPSV8I4xl6c6VxSaFg6sNKiDdqhXbo10JxpCmACGXTp+m1p2cobKWKW6+3KZNXbRF21LEyLfNwmW5DhJm8WrnWfm+E9EiD7RS9sIpI80oldYduboOcrwA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=guroD/TM; arc=pass smtp.client-ip=209.85.208.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="guroD/TM"
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38be5e86918so48284291fa.3
        for <driver-core@lists.linux.dev>; Mon, 04 May 2026 02:50:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777888220; cv=none;
        d=google.com; s=arc-20240605;
        b=IpLdgduhtVqU3mqbGjdNFoF+1xTygvZ5eEm+phyDa/j6f90qnKr++2v9XDetaX7Sq3
         0cIwABUnOhf0oa3fq1P+ZNW0g+l1k/umsZzjTDtAJcI0Zsb7tNYjx1tZXjOqkkhbBybW
         Y1OralgJUQOpoYsm8AcFJZYgmJJ79DAeCHp9jiOp4TUMKNyOgTHHsNOmn0QYKPdbsquU
         iMiDVq49Orf0LT6y7Wvvi9T9+4cexRTjUH8efImyhqQNzoQPHwCsLmJJdDmAH1FElaH6
         J0nMrh9fZxFTuPgadLWHQ/GBFYPvhe6sWgIFBUzFbfuDvnIiPdeW6tASN3776Yzsxx2c
         T/CQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=rY/W/znocPBjvaokUf++Q0GVclbB3T1OLa6ibatgUYA=;
        fh=CHvuSYcfiARQARPGrUjtjdIUUQKZE00P4ss7Yx09ekI=;
        b=LrSnQvJzswiiV3gA8mPzL6lSOdas/hby7wugwckfJa3xFS5rtnP7EjxFDOizdy5pW8
         Be12hm6hQ7+nGFzvWq67CoB3gD6o6sjQm7gmdH7qnSuSXhzZW5CJm2DeAlHTsKES/aE+
         ISToe8Nil0KjffNAFLoQVFLqQQOIA6XkrEkCcWZog2IeLXASYz8wg3ypnFvvPibDvN3Q
         L9A+XrM5FXHUlqU7/xJG7miN5LyZG3inhvdJyn5LycFjv3jKb1DDja10Y6sErG12tP2R
         FIH+Mk8FcADis7KvnszblKxd23V18nxbqjeM5UWNrORA2wIziWK9gNr0OA3IhgJJLLUV
         +bRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1777888220; x=1778493020; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rY/W/znocPBjvaokUf++Q0GVclbB3T1OLa6ibatgUYA=;
        b=guroD/TM1AQ+ERsLcbBWHUJOCeFL3QXF5gkHJ2k4hRTn9dIBV4o4DIU0xZN4is8Mh3
         LP6v5XTHu8aQcp+MeXqOaH+JbkM4OmE4CxMmvgGRiVxySaTruCz0M4x0bdFFj586leMT
         DFxFqpZGzDHMxqMiPmRcGbNSSWhBrmUeIC3oxd1wPn7iJa2Q0hn1PuGaibm40XHO3sY1
         UikuzxXF711uR3t7blLkBTWbwkQDySyEGJuNX1zqcVLTQjguhf9Otot59vkwTkT593Vr
         PN7dM2EgI21voqObSOTuEpKtTrEyXU3O/J6i8X/2dK4muB0+WUSPupv2zh8Z6Ye5aH3/
         X16A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777888220; x=1778493020;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=rY/W/znocPBjvaokUf++Q0GVclbB3T1OLa6ibatgUYA=;
        b=Dek8UVkXAdFEQwP50NG2ZaNVscPPMzgN8hDYmpWRHEvEgqBuBm8aw7zsRwcotPuvuG
         b0Piu5r0lS2gbrDxshc9obAyWBBOnaEJqVsK5ZEqfqCt1u5PbzW2hm1zrngTQf1z4vPr
         4UJE1zF7ZumPk+lms692d5twEXcBwyjZjFCaeeaqO+zuF3ZLNayt2f4WwL3UYu2jFye8
         +PINyXQ5tFPCeGT+YWUhG57G99K+FoGdhX+rMi3++R7cvuCAsUfMjb/q+GqusJgF1x3H
         Dfc45D5YYatW4WjMaZYbuiP0E4TJ5A9Xx8H3wL055hP/gvfErvHdMds69vZebm9cziQQ
         EnTw==
X-Forwarded-Encrypted: i=1; AFNElJ/yK79olMMTmYmfg2tViLQU+jrrjptn9arYpSIdhVXmgPkjyx11sOrYvXaycdQ1Ms28vpwFu+EN4/f4Pw==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHjJupWDPoPyR3+9X/iYlf3MUGCkosk3nUnAZ7pA4r0gN8LhQk
	kuYMeGRl0UmvmUZvORlghykXUvgQRI8PysomiFc0ASx8exr7mCg1bVWSnzvN8NHUDFZ2e1mFzzC
	KQuUYy+CXyMRFXztmEinuenwk1QzY57T7qidylup5pg==
X-Gm-Gg: AeBDiev48zVq4FK5CwvKwzgBdZ9pCRpncxz6Nbt8A4TjpnTJ79vgAYqvPsJMgMbji3I
	45wBM17KLfvX7ActrBiO2gheY1nwW4/fgai69NnGPxFgknp2YZiKxfntePX0v9mNmp/P1/Z5slw
	CKfx/AFDXTbjvfC0YcyL21HjJt2L6YOzUkDO8Q06MDTR187+ZbpSro8Yvr2lh+VuaW4s83Zzwqf
	b8fc5ZJ1dASCa/VY+pWpzTGkFwdME0MbkoiWLcWJK+V4CeEkfGcBhKeQOJ3gZO2AB2uOkHeEqxR
	dm0fvPjhXL+cLDSqQg/QUnEFCx/5vw==
X-Received: by 2002:a2e:ab18:0:b0:38e:a00e:2bb5 with SMTP id
 38308e7fff4ca-3937856cf7dmr30024901fa.19.1777888219662; Mon, 04 May 2026
 02:50:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418162221.1121873-1-dakr@kernel.org> <CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com>
In-Reply-To: <CAJZ5v0jkm9K9=-U_51FMsyxN2msdouRnz4sEjmxG0Btd6Hmw0w@mail.gmail.com>
From: Ulf Hansson <ulf.hansson@linaro.org>
Date: Mon, 4 May 2026 11:49:42 +0200
X-Gm-Features: AVHnY4JHkXE2tLaNeqarROPzaafKLZIJ1stD7M_GdDLbolwSZbGZJJ1_X4piqvg
Message-ID: <CAPDyKFo9wcxLnCdykwE9J_vevBtjq7UVL4Yq3M=MOZ8M=j6LCA@mail.gmail.com>
Subject: Re: [PATCH] driver core: use READ_ONCE() for dev->driver in dev_has_sync_state()
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, saravanak@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 20 Apr 2026 at 12:40, Rafael J. Wysocki <rafael@kernel.org> wrote:
>
> On Sat, Apr 18, 2026 at 6:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
> >
> > dev_has_sync_state() reads dev->driver twice without holding
> > device_lock() -- once for the NULL check and once to dereference
> > ->sync_state. Some callers only hold device_links_write_lock, which
> > doesn't prevent a concurrent unbind from clearing dev->driver via
> > device_unbind_cleanup().
> >
> > Fix it by reading dev->driver exactly once with READ_ONCE(), pairing
> > with the WRITE_ONCE() in device_set_driver().
> >
> > Link: https://lore.kernel.org/driver-core/DHW8QPU1VU1F.3P6PH69HLFBYC@ke=
rnel.org/
> > Fixes: ac338acf514e ("driver core: Add dev_has_sync_state()")
> > Signed-off-by: Danilo Krummrich <dakr@kernel.org>
>
> Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
>
> > ---
> >  include/linux/device.h | 5 ++++-
> >  1 file changed, 4 insertions(+), 1 deletion(-)
> >
> > diff --git a/include/linux/device.h b/include/linux/device.h
> > index ac972e7bead4..4c1c9cb8570a 100644
> > --- a/include/linux/device.h
> > +++ b/include/linux/device.h
> > @@ -1018,9 +1018,12 @@ static inline void device_lock_assert(struct dev=
ice *dev)
> >
> >  static inline bool dev_has_sync_state(struct device *dev)
> >  {
> > +       struct device_driver *drv;
> > +
> >         if (!dev)
> >                 return false;
> > -       if (dev->driver && dev->driver->sync_state)
> > +       drv =3D READ_ONCE(dev->driver);
> > +       if (drv && drv->sync_state)
> >                 return true;
> >         if (dev->bus && dev->bus->sync_state)
> >                 return true;
> >
>
> On a somewhat related note, I'm wondering if this function can be
> moved to drivers/base/base.h?
>
> It doesn't look like having it defined in device.h is particularly useful=
.

Apologize for the delay. Genpd needs the function [1] when it tries to
assign a common ->sync_state() callback for its providers.

Kind regards
Uffe

[1]
https://lore.kernel.org/all/20260410104058.83748-6-ulf.hansson@linaro.org/
