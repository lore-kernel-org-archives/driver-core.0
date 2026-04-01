Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8093337BB5
	for <driver-core@lists.linux.dev>; Wed,  1 Apr 2026 21:10:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775077817; cv=none; b=KbQHZx2jjOs1XZh6wPhk9g3ddOGnvjSqvW7RRNawygUChJh1pDeVMDxSgEAZLnZiJ8rWFtMLQ5V/a4J1U2Lfuff/utFhKS6ov7HGKJa2OVAyDvDbWD4LkkETaSViEuAuBY939G0xuIPvmm3XZMqkSAHSwBWjQUoCQK3Vcezh2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775077817; c=relaxed/simple;
	bh=zyFttTXNuZJK/32CT2m4h7GpWqj2ROee7GaYCXKbwTk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIMWqsis9I2Qi3fdEmP4tSNmHoyjAFbY7ZjM+kmc8GsPdn8yP3rp4I4tijtAJ246+tJaMaB/QSUZA5WcXJrIiywExkIzzRX2M8GACsDNWPjRCJHVfGe76BQMFslxikYiM98wIveuhlgIOsOR61SbxqD3bzrfJwVrBryYFMlujP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=OCzSpfhM; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="OCzSpfhM"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-66bd4e0560fso1991525a12.0
        for <driver-core@lists.linux.dev>; Wed, 01 Apr 2026 14:10:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775077813; x=1775682613; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fHX3adFhp3VQ3EddlCuHOOnOuSJT+t+CMh0HAuvok2w=;
        b=OCzSpfhMlh8NMsvM00ebl1A1vZxGV8sTIfaQ0NsmzSQLz28q3pJdAhTf8hNAsoxUpz
         uS0QOBa6PcsEnJ98ZCgzNXE/GTj2YQj+kaOHC9uZMzffSl5KbUGpLEwJmRQz50UJWSdx
         HvlxFYhb0ki/+Q/yxxZ9XZTYJylDkcnUYknls=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775077813; x=1775682613;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fHX3adFhp3VQ3EddlCuHOOnOuSJT+t+CMh0HAuvok2w=;
        b=AKJmTU5QlijYb+J6YLeIVVf46AbOmDUHy615iFVpi2zox301F7JSOuxOFZk91EJjFv
         3YQYDpDA3eOavAdU2EIONptxIQ27IqFBUzwFKn0bNjnUm1J2D5d/bePK/0uAHJpxxCO6
         qUOOyXG7FqOV2YFofxBoeIbhoNLbPqDIqxSnzbxpyPDWGqZZxJwdYtlbpZE1MDFhUf+d
         FWxanRa91PBmt2rxnCFCQvxZShrAAS6q6OUEXT4hzu0z8Le9N160b7cwD/3wvgnIZG16
         eRi1XCfpdJqEmQ8/I2CbDQFAB3b1yDH+KQxFuB02gIwl51nelXf9C4XYztI+wKl/zX3b
         RowQ==
X-Forwarded-Encrypted: i=1; AJvYcCXy+pVx5abafFTK+GenM/kaXmgjS/FWqTNNUjYjN6YuttruwqbZpSCk21Ua5qK/fauOvfvko2ykEyMVww==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz7DoUzFvxABi1b+Kcvu5IjJbXQMss1ZbiSVg2UdVKwb2oMqWdd
	Cpy+BOKtx874KW9NVunwDqvAXi0cOjmX88aH2fAS7SyEaZ45nxZ708ANCDSNopNPEqhCm7jLrSr
	W1qPzUA==
X-Gm-Gg: ATEYQzwqzi4iPJC76QMTG19amm6UQzstB9selwZaoIdgB1n3tKIcOw2E/QU/xH7MqQE
	ef/CpBvgaaWZ5HB71nWTjnrdYBMkGOvOg98U5TS5aWqLyXoKbcCK9SHqGWcabvz9s7c5wF2P5Vl
	bosOAA7HjLy7CRp66TB5w4ZpM7zdXojN+dzmUxBXMPhfiwqZWTLBLGRQy+agXxovYFFvnqB1/v+
	hzwvpP8ghDavQcG5Yn/TURNqyUOW3Z/bR9LNX4M4b7WhwDg2XFRESBEXYeII3wgoIw4gycbP9gt
	YE9nwSkqClEmPYp3QLK6MeuhROIAReP3gpEoKxRqxUnFBqoCtrU5lMWx/Vk2up+mmjRAw4eYDUN
	JA6lLKQqT7JL16foFZVJQQNtZwdsXIkurrsVlI5uMDHJnNJz/C0Q8AZGTS4KtZ7mzDUfSvb0ZWG
	/venFmE7APqSTcwIc2fzBniHGzu91nN4WT6YEuO0QafiFjNjMJ0i5XUm6l/THZog==
X-Received: by 2002:a17:907:c14:b0:b9b:171e:bae9 with SMTP id a640c23a62f3a-b9c1597da90mr279853066b.24.1775077813245;
        Wed, 01 Apr 2026 14:10:13 -0700 (PDT)
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com. [209.85.128.45])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9c3cec6f38sm23239466b.31.2026.04.01.14.10.12
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 14:10:12 -0700 (PDT)
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-486fc4725f0so1527165e9.1
        for <driver-core@lists.linux.dev>; Wed, 01 Apr 2026 14:10:12 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWkmj4QG0/v5VHpbpI/QfWV/WIlNCeYn3zona472TK6NmmBjYGCRVJajexBR5vvfVg5fwCOVna075q6GQ==@lists.linux.dev
X-Received: by 2002:a05:600c:1d0e:b0:486:faa8:9e4 with SMTP id
 5b1f17b1804b1-488835bc1acmr82347435e9.12.1775077811306; Wed, 01 Apr 2026
 14:10:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260330072839.v2.1.Id750b0fbcc94f23ed04b7aecabcead688d0d8c17@changeid>
 <DHH1PD0ASG8H.1K3KG9L658DYN@kernel.org> <CAD=FV=XJ2qOZ7ftDg70AhD0GRX6TfQb6OVyNaUfFg42+hmwxGQ@mail.gmail.com>
 <DHI4H61YSZGE.BBM3H9B3H8F7@kernel.org>
In-Reply-To: <DHI4H61YSZGE.BBM3H9B3H8F7@kernel.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 1 Apr 2026 14:09:59 -0700
X-Gmail-Original-Message-ID: <CAD=FV=X38yR7=KOPfayQCchY7xr=bpPz562bHMJTawXBL_2rsA@mail.gmail.com>
X-Gm-Features: AQROBzBupfLpPHVGbgE5Pj1a7iA_ATwmIVBVN-KRft9BiV43nt4TGPxsenumMp4
Message-ID: <CAD=FV=X38yR7=KOPfayQCchY7xr=bpPz562bHMJTawXBL_2rsA@mail.gmail.com>
Subject: Re: [PATCH v2] driver core: Don't let a device probe until it's ready
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Alan Stern <stern@rowland.harvard.edu>, Kay Sievers <kay.sievers@vrfy.org>, 
	Saravana Kannan <saravanak@kernel.org>, stable@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Apr 1, 2026 at 2:06=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> On Tue Mar 31, 2026 at 5:26 PM CEST, Doug Anderson wrote:
> > Hi,
> >
> > On Tue, Mar 31, 2026 at 7:42=E2=80=AFAM Danilo Krummrich <dakr@kernel.o=
rg> wrote:
> >>
> >> > @@ -848,6 +848,18 @@ static int __driver_probe_device(const struct d=
evice_driver *drv, struct device
> >> >       if (dev->driver)
> >> >               return -EBUSY;
> >> >
> >> > +     /*
> >> > +      * In device_add(), the "struct device" gets linked into the s=
ubsystem's
> >> > +      * list of devices and broadcast to userspace (via uevent) bef=
ore we're
> >> > +      * quite ready to probe. Those open pathways to driver probe b=
efore
> >> > +      * we've finished enough of device_add() to reliably support p=
robe.
> >> > +      * Detect this and tell other pathways to try again later. dev=
ice_add()
> >> > +      * itself will also try to probe immediately after setting
> >> > +      * "ready_to_probe".
> >> > +      */
> >> > +     if (!dev->ready_to_probe)
> >> > +             return dev_err_probe(dev, -EPROBE_DEFER, "Device not r=
eady_to_probe");
> >>
> >> Are we sure this dev->ready_to_probe dance does not introduce a new su=
btle bug
> >> considering that ready_to_probe is within a bitfield of struct device?
> >>
> >> I.e. are we sure there are no potential concurrent modifications of ot=
her fields
> >> in this bitfield that are not protected with the device lock?
> >>
> >> For instance, in __driver_attach() we set dev->can_match if
> >> driver_match_device() returns -EPROBE_DEFER without the device lock he=
ld.
> >
> > Bleh. Thank you for catching this. I naively assumed the device lock
> > protected the bitfield, but I didn't verify that.
> >
> >
> >> This is exactly the case you want to protect against, i.e. device_add(=
) racing
> >> with __driver_attach().
> >>
> >> So, there is a chance that the dev->ready_to_probe change gets interle=
aved with
> >> a dev->can_match change.
> >>
> >> I think all this goes away if we stop using bitfields for synchronizat=
ion; we
> >> should convert some of those to flags that we can modify with set_bit(=
) and
> >> friends instead.
> >
> > That sounds reasonable to me. Do you want me to send a v3 where I
> > create a new "unsigned long flags" in struct device and introduce this
> > as the first flag? If there are additional bitfields you want me to
> > convert, I can send them as additional patches in the series as long
> > as it's not too big of a change...
>
> I think the one with the biggest potential to cause real issues is can_ma=
tch, as
> it is modified without the device lock held from __driver_attach(), which=
 can be
> called at any time concurrently.
>
> (I think there are others as well, but they are more on the theoretical s=
ide of
> things. For instance, dma_skip_sync is modified by dma_set_mask(), which
> strictly speaking does not require the device lock to be held. In practic=
e,
> that's probably never an issue since dma_set_mask() is typically called f=
rom bus
> callbacks usually, but it's not strictly a requirement.)
>
> More in general, from a robustness point of view, everything that is set =
once at
> device creation time is fine to be a bitfield; bits that are used for
> synchronization or are modified concurrently, I'd rather use bitops.

OK, thanks! I've almost finished with patches to fully move all of
them to bitops. This means we simply don't need to think about them.
Also: even if they're not truly needed as bitops, it's nice (and saves
space) not to have some of some flags using bitfields and some bitops
unless there's a good reason.

I'll make sure that "can_match" is second in the list of patches. If
you hate the idea of converting the other ones we can just apply the
earlier patches in the series and drop the rest. ;-)

-Doug
