Received: from mail-ua1-f48.google.com (mail-ua1-f48.google.com [209.85.222.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B0133624CF
	for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 22:37:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787351850; cv=none; b=kIksL2wnMlx+WEdB3+oiQY7F+xMIbmmHBIVJh4fodrhNHGitRkj92nUyRXfd2CxMQxPokiiergu6jndn21GUHaZl1KGz5OdJk7yrsMHfA/5X6VlnhNuEcUEq4GXODpt4ba8aCTg1ToJ7RGdH134325b1zxxCG7un/A+yQqQJSjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787351850; c=relaxed/simple;
	bh=s0mbgR1B/3e3hk97RKicR6EngEFS8QxUOV6OgZeuQt8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgpUw+skBOSrIlZBXLQ4Y2ngobwJUGeopEZCYgA1yaVLsgLaT4by//3AN3YpoF4HVc21GC7xcxyUvvhRnn0SewYK/ueuOShuKNvfGOcH1OM+gSfSdNtxJV8q2r6VOnZ8RIWWwUV/3W0KSxH9Q5jUpK8qVD89sbfbad8Va0Nt5Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Vv17E+Dv; arc=none smtp.client-ip=209.85.222.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Vv17E+Dv"
Received: by mail-ua1-f48.google.com with SMTP id a1e0cc1a2514c-96723c7151eso566169241.2
        for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 15:37:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1787351848; x=1787956648; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ibjvuzdx+Tl1DxNX7IbQEnv5VU652wCRXclJCpK/iM4=;
        b=Vv17E+DvXxlU3/aY3C22oSEdEXM+NxL2NURzYS1n05GodPs+qrUH3Kf62kJL5u9jD8
         Tv8uMmsKkgGqxjbVNR4+BjgyQjkT6FBc+HPWzg+5Lp2XiHsI3/VoyDWpptEJ6GOFETDv
         g5tlSbAqMucjn7Cew2zw0ENRWwxN0ej+AO+OQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787351848; x=1787956648;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ibjvuzdx+Tl1DxNX7IbQEnv5VU652wCRXclJCpK/iM4=;
        b=MhwDZ9nU4ZJYokqUAy9BBV7kxyp233edgl5SImpvQKXzOlZgJNlrnBfd3PYnQp/pvo
         S7KbRTbYowSvFHGYV04NA3O9ZL0REYhJ8mo5+rcUM3eCtHeulb70ryJoM5fDxLcI4uMW
         txL7QfIkwjE7wc17H9eeqLkyP5yF3dGZyl2myc6UXl34fyBL9LSriQKsbhwefHuK2PWu
         usDicOGtgRWG/EDyJzuMtnoHTYk5/3EiCq6p8rfDgpoDkUG1+T3BBDIHhhXuuhRZ8+0J
         EUuC2BejfxiNH+cvFBHlkGFkVOviWDFPy41HrODwJ9/r9ykYgO0uyijVn95UZFl3DLr/
         xa1A==
X-Forwarded-Encrypted: i=1; AHgh+Roxuzg0bKIxlZOKXxj19/CbpWu1k39tALxS4f40mjjfV4QhDESQkvLuEOPOuB5LUQcq3bIDI7tCyHGhSQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nIH41zqHvG+3D10u4HTLircdx+t0l1YFkbMOZTxLKTzsDhQilx
	zGduhC/32AfsC0wLHKPAbIl3ovdlzI/Qf7QuCdmQPaWIP7nbGXYEvck51l9qA08tiBa+/7pMX/K
	mtiU=
X-Gm-Gg: AR+sD10aez0PDce65QNa7rke+zUdxWweeX1hHFxKGvvz/C2OmIwI6p18Kz6vMDCvEPi
	7X6l/lg9pkONXFPSfqudM3CDWqJ8Hb9C/NM21lSXj9/Wv9zBXDYr+PLB/52gUrlAVVEQKmIZv2R
	pLuGZV4JJkVTT8RE/cno9iJ3l8n28rFc5zCHx/+G54YFPjyTkMz3HZIEXTOqWsU9ZpiC8+snXaK
	m2QjbLh8RoyYKdjHSs0m/7msOjQVX/bqX2ScBcVRIXON2AOcRmlioGADKy+XxwHvQgPcEcJ3Z2t
	w/teD1gmBRrGMd6IJUWhB+EWd7yjrEBnnl5FGKLiUM7RMziHt2yRJIemgRNQI+ohTfCGhl0hNmd
	4ojT+qFVAeMgTvnVMmBOySPFdf116eb26/+4jlUFEWc/QeRCDzGdkWJESXS/I1q2hFuvBMI/0Z8
	nr6A8BZmxnWf3BOqmdF0a+1dhUh4lCjv+CerMz5/IfQe8/LbO3buMI98Pcu24YvlxeOxQoFzvNA
	LfdyiKO4HPaHzvp49J1WuC79l0=
X-Received: by 2002:a05:6102:6890:b0:76f:1eb7:9944 with SMTP id ada2fe7eead31-77bd04b5b7bmr708974137.3.1787351847961;
        Fri, 21 Aug 2026 15:37:27 -0700 (PDT)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-97c834bc1e0sm198832241.4.2026.08.21.15.37.25
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 15:37:26 -0700 (PDT)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-745497ac8fcso466184137.0
        for <driver-core@lists.linux.dev>; Fri, 21 Aug 2026 15:37:25 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RreoltDmFjAkfWSNcUK1629MUeMhjSwKp3FM78HA7ssHAmj6KE9ja5/6TepjQ9ta4NzU0K05qHMegUoWQ==@lists.linux.dev
X-Received: by 2002:a05:6102:5124:b0:77a:d089:3de7 with SMTP id
 ada2fe7eead31-77bd0ac29aemr671472137.4.1787351844660; Fri, 21 Aug 2026
 15:37:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821170648.3097673-1-mrungta@google.com>
In-Reply-To: <20260821170648.3097673-1-mrungta@google.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 21 Aug 2026 15:37:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
X-Gm-Features: AcwNN1WGrJG5_bxCdBWoSfRR0lNfg_tXwcq51fkh5y5rtpDnrxN0Z4zNEa69sjQ
Message-ID: <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Add DPM watchdog to late/early/noirq phases
To: Mayank Rungta <mrungta@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 21, 2026 at 10:06=E2=80=AFAM Mayank Rungta <mrungta@google.com>=
 wrote:
>
> Extend the DPM watchdog to wrap device_suspend_late, device_suspend_noirq=
,
> device_resume_early, and device_resume_noirq callbacks. If a driver hangs
> during these transitions, the watchdog will fire and dump a stack trace
> to help identify the offending driver.
>
> To prevent false-positive timeouts, the watchdog is set only after
> waiting for subordinate (during suspend) and superior (during resume)
> devices.
>
> Signed-off-by: Mayank Rungta <mrungta@google.com>
> ---
> Testing:
> - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel with
>   DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
>   backported).
>
>  drivers/base/power/main.c | 25 ++++++++++++++++++++++---
>  1 file changed, 22 insertions(+), 3 deletions(-)

I reviewed this patch for Mayank before he sent it. It seems correct /
useful to me, so I'm happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>
