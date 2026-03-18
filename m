Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 028BB23EA83
	for <driver-core@lists.linux.dev>; Wed, 18 Mar 2026 01:53:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773798829; cv=pass; b=tJZcl3sWQ6LCIosqpySnGZLO7NjfT3Pec0r7WWf+0JD7ORsu6TH/dpMw+yrl4DmG7uzRFu5CvBzR2F3o1a4uvxXpjOi/GdxAECFErwtnQe1P9uRFlB1sELuK6ejySlUMQomefnfcQbancLFFHaG+N9kGr+SN6CN2k7ORcxCdF9I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773798829; c=relaxed/simple;
	bh=j/fbdLvsIeGkHXFDu5LJ9gF8XN9qrxlIYMkb21y2Ut4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QULoj0x//YrtnzvbnQFra+OkrLjewaH2E/82IuEtIbdWzu2I1BMCtX1ijkceHiek3nayuSJ9rVo+DtRiIVwRGk8AfYogXWb2WNTSEBcoINvKDG3OSJGjJbETLnEVnK81U2ZsaNqm/yFrHraE4zIoZDyHA4E7sBFy94o/11sS5ow=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T42ad9zc; arc=pass smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T42ad9zc"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-40427db1300so3834623fac.0
        for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 18:53:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773798827; cv=none;
        d=google.com; s=arc-20240605;
        b=f0iuo8ZanaRksi09m9nT+u7i9+FtVjpX6MjFKYisyeiGBYEl0r8NcwJkCpojfw8UjR
         WFvCjemUsgK6m2RLPC1gNgEn5elARUY3+skPeS5E9+dAniLtz+xgoQlyMA8pWOzI/dzg
         /Fl/1gKZUvdVVC16F+edS6etlScLwJ46CZCstbbi3bPDQS9roRq069h+B9JmSxNiNINc
         JGvymqoJ1Yxa5UmcSo5BuNprP0xvH+2dlFhe6/qx3myw0Xa2e0yIZyb4BA1BkHfsMkvT
         SJE5E6XJNmoasWyqoWfA3Rdnf2fLnzH4NXjUURIu7BRkUkIC09cPjHwSYG7zMkFfGDBT
         PI9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
        fh=JElnMYITPtJwv3gQcpnyQrqvewfCXS7KYbeGBuaTMqA=;
        b=TnDuNG062L8uStZXapsz0N4KHinxgemfLKIT8mqAF+ntZx0kI+zdVGddVDLM61/Ip4
         noZxs9qL1QrJ9Fm+Ak1WJz5UMVu4QNCzis02WyIZfpuYqwQmuOxCPpqnC5k6+UXSfafQ
         fnHYWwfmMo2NLhYizeBRDsu6c9oNrhza09M9yy5bvcxBjaFKiuv5XWG9uJ79Efeo2KbF
         CMonU6BDBpMLpqey4D9LEuZQOT/ZrrZu7XsTTa71ap6ho4Ey3eTkKG8EFVOOaCY8eJr5
         UeVmBGUapU7InBGsa64t9qE/Zeuu3AqJgrPgyJjZU+C9oEiBEdqw0F1VEGw7pqcGIJSO
         ze8A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773798827; x=1774403627; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
        b=T42ad9zc/rZ9PMpU3VWE8/BRKwgQ2I+MJxI7s43DyC+hwneG0ypP+Nk2K3dRRvAUJh
         i732E5J4f3qDTuu0gVTSaegEMm51l8kladrfa2rvyu4nzJVLkX9gMKSQxd2h3jtye2hY
         EvEItLN9P19DM+pYxrnV/U/f9HzUGXCb83oMs02Piuiq7ZZt9e5QGJ5wsj5B6u6lGG5i
         AVWPosc3igjUxOQoZNv5q+7zncNSZf0ZQnaI0/M9spRRNm3EVWI3Sdy6eCw6IqlZuoFn
         YWwbdY1/PukJccIeiA8T4LAPpMjU5f5xGicQB17V/STqLE3N0bmm6q8k4Lxj8CANuVep
         r/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773798827; x=1774403627;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cp9Ep/hNNUKT/Q107TyB692cBkvdQAk6sieLmz8xQmg=;
        b=XLGm5zretuwanc8bADQt21qG0+CWZatJR4gCU1Fg6gXCf03C1BqK58VAFAb43FY0nb
         te/Jl6TcD1+D9XVQUUCwJt4kbNuE76VJFpN6rHLVdZz7Yoh3nomaMRI44q3LYsURsvVq
         BVVmWzuup6/TGJAZB8ETNvnv0BFX3JVBxDtHDaikYBUKLl5/wwHNXxnyVBYA38RbEplv
         tk76ogWQlOOZpvrabqhvyh2f0UP23nz7dX/jPNjm+1fXmyKpco/kGa2kTfuRm7tKsYe1
         qo3ZnJlgQ1lB7VS3uZzZbu+6rXsE7vPQ0VF/eovuQ4ff5PJXYtw67qGYSFqpd5ntwVN/
         lYsA==
X-Forwarded-Encrypted: i=1; AJvYcCUjmGnaBrIvbTRvERtO/GUask9eXS3sMo1PL5Diax6coZ7pqlw92/dkKm9XoSc3ccrFbM2GjLsIBzSvXw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyxFVccWkb7YwgahzYF/D0qv8hjh1HJklJkxuoSvJMCLtgw3B++
	RpD3WdK42z048aeyZsOupk7JfNA+cKasYMDOsG860yLFuv2JL7kiq3yX+UdxsF9fFjuzvDQA3dx
	IjF/hVeG26L3mcr/IMHWxpWQY/DJ6sSU=
X-Gm-Gg: ATEYQzyB/hKsSN79exwtaM9OVXhmp2NlKN9v1Ni+3yqBD2ra7WyUetRaDi5CHXs8XEc
	vWUis5Q1UoU/hzeVQf/oTjT2pRF8tHmt6P8I7ZiPL7Ukx4cGDPVzqCFl/HnnxjWtLDdp1/ohQhy
	fp5Q+GuhglSdHGoQxql5lEJIP3gPLAJxmrZbtmNmSaeZsyT57YEuyPeEl57CHL2Pnmdoox8IdSR
	gynvaXCpCCCklet99oAGWLLY8SfgdLGET2CUsOhzf2rfASpQqesPaHCHmSjjZuOcFtvptsDqQNW
	fZlqTq80XOdLbEJnQ/+ToQdS05OX3tg8jAku7rUY9psMKd0Vw85HnxJ5WXYhp8hOPbrBNGTt5jO
	HT1gqv1mtPA==
X-Received: by 2002:a05:6870:ebcb:b0:417:1ba0:7320 with SMTP id
 586e51a60fabf-41bd41cda0bmr1126217fac.33.1773798826608; Tue, 17 Mar 2026
 18:53:46 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260317185920.43387-1-hanguidong02@gmail.com>
 <20260317191538.43535-1-hanguidong02@gmail.com> <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
In-Reply-To: <c14b399c9c6bf96f8c7d33615561b0d787ff175b@intel.com>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Wed, 18 Mar 2026 09:53:36 +0800
X-Gm-Features: AaiRm52nR_v9OD3YNBiYZ0KMPL0_wApDenMFnYnmDk762NDAGBxD5i0lDEEX0xA
Message-ID: <CALbr=LadoX8g--rtU==HQfNQ9f1=KP=7AS-PGfooKaSbnYPz+Q@mail.gmail.com>
Subject: Re: [PATCH 4/4] drm/i915/display: initialize string params to empty strings
To: Jani Nikula <jani.nikula@linux.intel.com>
Cc: gregkh@linuxfoundation.org, dakr@kernel.org, rafael@kernel.org, 
	rodrigo.vivi@intel.com, joonas.lahtinen@linux.intel.com, tursulin@ursulin.net, 
	airlied@gmail.com, simona@ffwll.ch, gustavo.sousa@intel.com, 
	demarchi@kernel.org, jouni.hogander@intel.com, luciano.coelho@intel.com, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-sound@vger.kernel.org, 
	akaieurus@gmail.com, me@ziyao.cc
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 18, 2026 at 4:12=E2=80=AFAM Jani Nikula <jani.nikula@linux.inte=
l.com> wrote:
>
> On Wed, 18 Mar 2026, Gui-Dong Han <hanguidong02@gmail.com> wrote:
> > Passing NULL to debugfs_create_str() causes a NULL pointer dereference
> > upon reading, and is no longer permitted. Change the default values of
> > dmc_firmware_path and vbt_firmware to empty strings ("").
> >
> > Existing code that consumes these parameters already verifies both
> > pointer validity and string length, so empty strings are handled
> > correctly. Furthermore, heap allocation is not required here: these
> > debugfs parameters are created with strictly read-only permissions
> > (0400). As a result, the debugfs write operation is never invoked,
> > meaning the static empty string will not be erroneously freed by
> > kfree().
> >
> > Fixes: e9913f0bd2e1 ("drm/i915/display: move dmc_firmware_path to displ=
ay params")
> > Fixes: 29292bc6cc37 ("drm/i915/display: Move vbt_firmware module parame=
ter under display")
> > Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> > ---
> >  drivers/gpu/drm/i915/display/intel_display_params.h | 4 ++--
> >  1 file changed, 2 insertions(+), 2 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/i915/display/intel_display_params.h b/driv=
ers/gpu/drm/i915/display/intel_display_params.h
> > index b95ecf728daa..0a8cad98d480 100644
> > --- a/drivers/gpu/drm/i915/display/intel_display_params.h
> > +++ b/drivers/gpu/drm/i915/display/intel_display_params.h
> > @@ -23,8 +23,8 @@ struct drm_printer;
> >   *       debugfs file
> >   */
> >  #define INTEL_DISPLAY_PARAMS_FOR_EACH(param) \
> > -     param(char *, dmc_firmware_path, NULL, 0400) \
> > -     param(char *, vbt_firmware, NULL, 0400) \
> > +     param(char *, dmc_firmware_path, "", 0400) \
> > +     param(char *, vbt_firmware, "", 0400) \
>
> Admittedly this is all very convoluted, but these NULL pointers (or
> pointers to them) are never passed to debugfs_create_str().

Hi Jani,

Thanks for your review.

Could you elaborate on why they are never passed? Looking at
intel_display_debugfs_params.c, the intel_display_debugfs_params()
function iterates over INTEL_DISPLAY_PARAMS_FOR_EACH using the
REGISTER macro. This eventually calls
_intel_display_param_create_file(), which uses _Generic to dispatch
char ** types to debugfs_create_str().

Thanks.
