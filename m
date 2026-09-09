Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41C1938AC83
	for <driver-core@lists.linux.dev>; Wed,  9 Sep 2026 23:00:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788994845; cv=pass; b=Sx4oqaSwxY81LJmT/3/n/voj4TBdmQt4knPAcmbZyj4dTSbbAnahvs/0Lk3un3KNA3yyzspoT/jxeWlsEo9frapxPEosrA9tFr/X2bXLY6miNXaNFPj/kGw5l/5x+xgcc6HJ26PkPc0aKC8xZPG7E5gTR4Z5T4EKpzupDCeu6sg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788994845; c=relaxed/simple;
	bh=NXBFaKbrMXgpNZSE0VvaGOO+KxvWK2WriYgkvV9RiI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=G2roPIZknAXDav+Zyn7P03i2YGcW70pFMH+ED9tkLSUblZbB50wjxrknUMqxl/FwMHGu0B4Ia6RoBG9fQpgfHx6UZXouy4dcO0/3Nr9UU1SZbEpqoY0WHR/nCsaxUoYG/wqw+9tMX5Y+3n7AULOEIF9dtUy2fAmStfTtrOKcofc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=C/hrRsp2; arc=pass smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="C/hrRsp2"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-7f48c750afcso5683243a34.0
        for <driver-core@lists.linux.dev>; Wed, 09 Sep 2026 16:00:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788994839; cv=none;
        d=google.com; s=arc-20260327;
        b=Qgtnx2w/hiILcEBX+IuBwsGfokG7jAM12mrpyd2mMQQjy+TBf0YmBPDW1Afghetnw+
         rbIiWQdvfEQGvaSG8Mh3Wyi0oQflsStQ6P3DGTPVyQGUsi5IotDk2PToDC5sHAV8ivzA
         znoTaezzrIdUAggrFXVqOoHJN/6R0SW3eNX7kptwJV0fhcURqPsdyCysOuPSRPY9GNto
         O9z3PSOcGUsTR1XaTu6wziKUmfzTwjIQlTQHGSgk0707yR4+6UD2suVZ92I0PvJJi38B
         PWF5r6nqfzHiAIPFR9Sz2+vKmCpnVux7521RL5hk2fnGg2tfAyTbw/zJfaqmc5tYaByJ
         rXOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lAmP6gCex2m0d1z+kgD25ttLxjG8ayMhj2asunqw1YY=;
        fh=4wtPXPpQBXT+yKv4JWjNXXeApZK2NMztJH+I5PotSl4=;
        b=aATmel9CblX5Lophq+asFVKB4BBcnwQ2O6BPRiUTjKaFalZ9Fz+KET7z7/rim46o+U
         +b7a0RKN0qAmwk0JApz55+89FkDr3RSgpD1ExbpUgWBNvdtaOulwq6Iiaq3fBBGKA8rh
         suJi52sz5Qnx8YO6kTK36/1atoQNboNf+KOcrVyi6MJDK8Vc4v9pMoEPH7l6zLDQd6P9
         soZI77LKdXOuq65qCqSBsy31JeHYiWpLPWK6IGgQ4GfmDVfoUFoDdjOf03kLTbPcj93p
         dyBPoM8ViEZ0L3SlZUpSk+/Owwf+AOOAscJt0RXx27xbZhL1ELLQGeaRoQ3soQEbGtAX
         I3zg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788994839; x=1789599639; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lAmP6gCex2m0d1z+kgD25ttLxjG8ayMhj2asunqw1YY=;
        b=C/hrRsp2JRel0SOc1olwvIqvnw00gz3W3O9xJUZ37bhtdePy3DanvUaxSChq66Cz9d
         IZzWVbcgL8v4VGRQKAQ15ko6ik83i80PxYMNep1mQ/HNGVgNhDCSy50gSUH1YHw6NL/F
         IeUoXFv64D4ojnGM0mT7RqHdj8tDTNWhkMS2FPLAbZ3nm90tUsLJckJe4U4asLuQ4yQX
         7OC3ptKKuJ3AnNDUXBYwM5C6hDa/XWMwUtL6+OAVAF4BA6s5gKvK64ZpUhF1dX9UlLwL
         IJK6EZYwG50uE5K9WhQ5bsxiV/gbRC72FuzoAJwl+7WjDp9MTINX99DPTmpANW9zr2Sp
         P0aw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788994839; x=1789599639;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lAmP6gCex2m0d1z+kgD25ttLxjG8ayMhj2asunqw1YY=;
        b=GrTR2/K1t7zZd6kg46mje4c3BlZQ7O+BWpsS/2lJKaAYb6zABkUh3T4UIpkTiZzCxe
         U/rb7AEORx7SzGyfkRFPbUMCFWKsKfNO+56TYnY19fkNJaHTtO8SeKzSRGHv/qKLmFF3
         rFXPRsqVaQeExeNxK6rrmyMSewNmbb9l/wa/7TcZ2shUtpUh4YfICbkkiT4ER3EKRCdz
         1iO+6pqF354kg7CuIfZyBsHFDnRD2z4jLeOJPu1qJ9XtuXxpRU3ogp4HqLpdChSD/s77
         +smdQXK66u3W15yEql+0qz8F3vW2pcuTKmzv1FIxeufeGH6EcCebZfbXMKKWaz5umsHb
         aPdA==
X-Forwarded-Encrypted: i=1; AKwUvBw3IU1Nn2Is2/QbU3mTGBc54Rdap4EONVQKDi4M+mViBHkM88WgIqTbSRSbnDlxN3YA7BAmYH9dyTdEuA==@lists.linux.dev
X-Gm-Message-State: AFuF++nx7m4YrSMxThTV3goYfCBH2mBT/N+xGudcxZXbZZWuLarhVKTs
	XeSJ5AP0C6nYoQzFrKSJq5nXQjtra1erl8wR2rQrFxagP/+rJnRnmrnSiZrz0fvCXUb33URKQG4
	pGeiE0kxUVJHuM2o6NiWBKG+7dHYRdNsRIVYwShOe
X-Gm-Gg: AYBFou0ZzW5xip9czP3deakgYjJ0C8KUmrIv7yVR/Ue5B91YKyCG7IzPpvjJb2wIWXp
	Oz81cNiGb/BpY3Ikdg61pYW84FeT7fBkFIkvZDMYLfQkxLngGmO33SMhN1JWvl3/8+RMqdBUJU2
	LQRTSgN86/wT0NjtI1r8LE0k/RojbaY+6UweeASUoG5pkZzVXF0Ci1LNu66PoIdJuVNsiS7OviA
	yr6WQgUR1OUbAHxSncxg/fFWw4cBJ/0OtlYsVzSZ8SBgfN1aMtbzD3qIMn6BfSWXhiBBVFPAQ2/
	LRe7eLbldce/XQnc6cvF1Lpv/sfwMmP1BhX1zlZ66ISpBFPS6GxzBfIvE79X2G14GhdM0W78rbS
	uLHg2XUSMGg==
X-Received: by 2002:a05:6830:2702:b0:7f4:effa:a5c4 with SMTP id
 46e09a7af769-7fa1dd9705fmr26393425a34.1.1788994838309; Wed, 09 Sep 2026
 16:00:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821170648.3097673-1-mrungta@google.com> <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
 <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
In-Reply-To: <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
From: Mayank Rungta <mrungta@google.com>
Date: Wed, 9 Sep 2026 16:00:26 -0700
X-Gm-Features: AcwNN1WuSbYGIO1o0g3lgIz8ZkkgMbP6sKFaSFThY6hnOo5VMDykb4EDJC3AP-w
Message-ID: <CABz7rdAzp3g=auu=2Fj96B_q2tq3A1vEps3CJv6EsnXgbrJLcQ@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Add DPM watchdog to late/early/noirq phases
To: Doug Anderson <dianders@chromium.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 2, 2026 at 2:15=E2=80=AFPM Doug Anderson <dianders@chromium.org=
> wrote:
>
> Hi,
>
> On Fri, Aug 21, 2026 at 3:37=E2=80=AFPM Doug Anderson <dianders@chromium.=
org> wrote:
> >
> > Hi,
> >
> > On Fri, Aug 21, 2026 at 10:06=E2=80=AFAM Mayank Rungta <mrungta@google.=
com> wrote:
> > >
> > > Extend the DPM watchdog to wrap device_suspend_late, device_suspend_n=
oirq,
> > > device_resume_early, and device_resume_noirq callbacks. If a driver h=
angs
> > > during these transitions, the watchdog will fire and dump a stack tra=
ce
> > > to help identify the offending driver.
> > >
> > > To prevent false-positive timeouts, the watchdog is set only after
> > > waiting for subordinate (during suspend) and superior (during resume)
> > > devices.
> > >
> > > Signed-off-by: Mayank Rungta <mrungta@google.com>
> > > ---
> > > Testing:
> > > - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel =
with
> > >   DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
> > >   backported).
> > >
> > >  drivers/base/power/main.c | 25 ++++++++++++++++++++++---
> > >  1 file changed, 22 insertions(+), 3 deletions(-)
> >
> > I reviewed this patch for Mayank before he sent it. It seems correct /
> > useful to me, so I'm happy with:
> >
> > Reviewed-by: Douglas Anderson <dianders@chromium.org>
>
> Since I reviewed this patch, someone pointed out to me that we should
> probably also add the DPM watchdog to the "prepare" / "complete"
> stages too. I know those stages are used less-often, but it still
> seems like the DPM watchdog would be relevant there. Unless Rafael
> chimes in and says he disagrees or that he dislikes this patch in
> general, maybe you could post a v2 patch that adds that?
>
> Thanks!
>
> -Doug

Thanks Doug. I have posted v2 with prepare and complete support here:
https://lore.kernel.org/r/20260909224818.2177311-1-mrungta@google.com
