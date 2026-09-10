Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com [209.85.208.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F52A53CA82
	for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 17:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789059747; cv=none; b=FgG1KK5XlfHMUkmCEibiXzPmUtNrQ08Y2FfvMif0QV02sI/Ky08LZJJM8KWvx2Z9LAGtYDPd3O6FkQHwiybykK3tSSXeLtVAgIckSVhnUtkbYD0aMDT2+n7oXXpXhI29fYVxgF055NfpnRqLCgnRRQrFYWXUjdZsgbUkicwoaZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789059747; c=relaxed/simple;
	bh=Sq+3ZPDvtDiwDZEiPtzE5bg4NQcIOhzYCUKUumcK7+g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E3+u6PiOG74TSQFkuDvX5Vu0VhRYbqpO+LK+TycHHysnQ5dHk9W3ygTU+/G01dSyz7QceoTyWchJD4kHqVrO218t2wVEkmLER9oasKMEEhm++CMhydLXNUv9D21JkEZ/HdoZ/hMnoN95tX1LXc6gaCIxklqqJQgdeS+oUdlp1qo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Xnm7bTnB; arc=none smtp.client-ip=209.85.208.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Xnm7bTnB"
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6a9a20a5e72so50895a12.0
        for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 10:02:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1789059733; x=1789664533; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=u+7YvFjPPo9k/FqxxQZH7F6PYUlcKWqkhxEgYotuD+A=;
        b=Xnm7bTnBWappZmSTF9mVSiYF9SIIYhr2QJK5dhOTNLCxsroKJ9tx3MG3VPRUE3sfo6
         RwRpZewG+7mN2uBhy9HIhANjz1DD72r6QrsjTLcImaLP70iczE6hoBJkA1kE7gTVEc1R
         s8zNZSf16Ho1kIj2LuiZrb0cB4JSrBXjpwapg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789059733; x=1789664533;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u+7YvFjPPo9k/FqxxQZH7F6PYUlcKWqkhxEgYotuD+A=;
        b=EuLp0jbo9XHxBqYMOJNnf2DAceLKzUN3epYOgtDTta0kPtPuDDOWMJejj1L5IfXo7n
         yrsA/YdMD46vCgLNG+eeLJ2NroocyZoZzRJRcBtGG2cauEon3QNl5FRk0b0v5DwfFJy5
         /KScrjIF5f2JIjHi2WXB6aWQnkmjSGqE2gVJbu5FbhOFGwxiSmbq0pxvM3ad99LabCTy
         DikHD0UnOdAs3+a9Jfj2JcPTaB9wpbukugRqO7MoJzL3vuXuF8LhVnFKhEGi+TrtpK/V
         eB5nF7PQKoq6SdtDbGr784+eku3J4ui2Mrqrv8MzEWqNhj1Cwws/Jxzkg0kBiBj2ck3s
         Jqhw==
X-Forwarded-Encrypted: i=1; AKwUvBzNswPqI5FeBI13dTKrv3Yx78XfghfKaqZdw53VaPFs3IcfdS7tDGrxteRSb1Bxak+Da1cExWBBaSLs8Q==@lists.linux.dev
X-Gm-Message-State: AFuF++kvrdeZS4zQuJhMV8d0QZKkMJy4sVaFnXWWtbMX3BuKuXo+Ur4Z
	Kn55LCkeJEFhbSfF43DFEtLlcLAVY59Tz/jjEtbIXlvXWIyCyuCQ1j4x7HoqPOOjYjtckUmfvgO
	8EFUffw==
X-Gm-Gg: AYBFou1zil98xkuDh3YkUW5zbpY7y0UJpZ3RVwV3yPtcqgkPBXgJ1/XUUMRBLXp27Aj
	KwdWVgaZQUBEQLQb4OeThZEyf0SdnHd7yFB69KnEHvfQgLVUR+Na5e5S1jJ+yxPL8pi1UGA9Mnc
	Wld5gKnHIv6zEkBz6Xv6niXSMWF9fwyZndozVCbBLDjcxjohItjQdQfPylkS6/vD8nCAPllO7dX
	uSYwkDokUNsW8YJNr/SPd/IrHIfAxrjAjN1s85KWfzP5mWS+5VIBvmYkwgwOXCaVrRr1oy/XODF
	17Ke7gLNMpwyqj4G28bNuqqaHvpSJ8ckaiAkyAh5HS5K4F4jUV2nf2y2RU1sQYHXMHMj5kFEwNz
	RUbxinOBAhIHeWD+XlCx6P+0/wWbnmi4qWTRduWWToTG2cnrgFL5cAe8OvqwT+iDiL8AmwmzEw9
	qJnZFZBoWyYh7wcvsXf2w/yNtk5YWllNN1lTW8m8xfCoe1xXUOitQstwzFPyjk1EpyrAgXLaDlA
	PZvLiniZaLeicKMlAS8lUmlqxKGlDriuI+vISDriNEJJewG
X-Received: by 2002:a17:906:f591:b0:c20:f529:2d6a with SMTP id a640c23a62f3a-c260ca339fdmr1702272866b.22.1789059732624;
        Thu, 10 Sep 2026 10:02:12 -0700 (PDT)
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com. [209.85.128.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c260d03644bsm954387466b.6.2026.09.10.10.01.54
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 10:01:59 -0700 (PDT)
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-49b392ccaacso820455e9.2
        for <driver-core@lists.linux.dev>; Thu, 10 Sep 2026 10:01:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwf61GlKvxZIdFRjx5GuY7ji/mERxrVm71tZ5cBi9+dC8m+LdGcRnxAOetK3Pvh2RLLqg85HUDexHNCdQ==@lists.linux.dev
X-Received: by 2002:a05:6000:658:b0:484:4817:85db with SMTP id
 ffacd0b85a97d-485872b5c09mr38411439f8f.14.1789059713626; Thu, 10 Sep 2026
 10:01:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260909224818.2177311-1-mrungta@google.com>
In-Reply-To: <20260909224818.2177311-1-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 10 Sep 2026 10:01:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WFBmq3kniULxcXNsKgY-Zrb82JfaX5uRWVewQi_tJyJw@mail.gmail.com>
X-Gm-Features: AcwNN1Xl_nzhNtJWsI6953UZiPelgeSEkWzryufpn6N_ETw7Yj-N-KcRVJNqhak
Message-ID: <CAD=FV=WFBmq3kniULxcXNsKgY-Zrb82JfaX5uRWVewQi_tJyJw@mail.gmail.com>
Subject: Re: [PATCH v2] PM: sleep: Add DPM watchdog to prepare/late/early/noirq/complete
 phases
To: Mayank Rungta <mrungta@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 9, 2026 at 3:48=E2=80=AFPM Mayank Rungta <mrungta@google.com> w=
rote:
>
> Extend the DPM watchdog to wrap device_prepare, device_suspend_late,
> device_suspend_noirq, device_resume_noirq, device_resume_early, and
> device_complete callbacks. If a driver hangs during these transitions,
> the watchdog will fire and dump a stack trace to help identify the
> offending driver.
>
> To prevent false-positive timeouts, the watchdog is set only after
> waiting for subordinate (during suspend) and superior (during resume)
> devices. With this change, DPM watchdog coverage is extended across all
> phases of system sleep transitions.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
> v2:
>  - Extend DPM watchdog to device_prepare and device_complete callbacks.
>  - Update commit subject and description to reflect coverage across all
>    system sleep phases.
> v1:
>  - Initial version adding DPM watchdog to late/early/noirq phases.
>
> Testing:
>  - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel wit=
h
>    DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
>    backported).
>  - Verified hang simulation in device_prepare and device_complete
>    triggers DPM watchdog panic and stack trace as expected.
>
>  drivers/base/power/main.c | 31 ++++++++++++++++++++++++++++---
>  1 file changed, 28 insertions(+), 3 deletions(-)

Thanks! I guess you dropped my (and Tzung-Bi's) Reviewed-by tags
because of the minor changes between v1 and v2? They look right to me,
so:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
