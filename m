Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 503141EEA3C
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 12:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779799878; cv=none; b=CNvYQInSd6KYMlc2qkNk7+BobjqicyPe5iti5IZYcr+wTUh5acpRzam3ksYoN+BVp81ywaG8U3rcvmcP4qJzlNRxRjVZ2JODjQ+txPaVsH3aLtrJEe9x4jFsexe63GOTsUEyI9ld5W21Niln8ksWg557kt3b24AMv2JNLnTrvVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779799878; c=relaxed/simple;
	bh=Yf4g2twsxVR4nDUCpRzem4trF+tHXeKNJhanN6p04ss=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=k9JOyFTzWDlyKwZhLhuBnUSl+wyNwdWJOpXc9Wq8/UIQZaB8fzz+fFI04gkLTlol3RlYoLy/j3nWW5HOAWFPzthSghuqzF3sgIGmAylkQCjxEgFr3YX2PTRbUCrMqteG5NAxNSJfQTNic6tPUioWVfjNwj+KP5BD2E30Z8xDl0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-63a3977145fso3394296137.1
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:51:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779799876; x=1780404676;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ja+/Knig0DxEm/jtY/9qdkEIUkVb+ehqeheHxGkvQio=;
        b=IC3Tw6h6nQV0Qnh/oreK/iUAo2uLbKmB+ytHnfBEl/wjJ29m26NZWgnLW4F+dQYn4I
         xBMfMa+ch73ijmBUTcd4w59fSjbeYUyd032iGUndaGwdbvqafn0NULMPqJvcn6Aez9ZT
         J24qsKzlPzrT36q5I8jGlEE8pe3J0QN/IlTtlCzqXpi2xMYnGUfmfHpzpUvCiz7WyHgI
         JnwH7hvOS1t0VzVGtzvq4Iu8LXUzd4QIlJAe8oVek8RA+WF3vB/bdnsFSQKUq+3f37lt
         vbiI6wWPW7xB9yafb5xlI2rAOc4cLIUxgnKbPLR25fq94UbB3WRg+7t2Pw5V4MPeEr9C
         Pavw==
X-Forwarded-Encrypted: i=1; AFNElJ9o8/dP4bNaYFRE2XDWTzQ+Oqissua/Xv0+T8qQUDX7o3KtlAntXpRMyCsBJONIhhOzkDZKn1z1B9IqxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzHzKEcQlogBO4IsKdpJkxUBBM5qRVBmuaV4bUnIaEFApW9sNmO
	8afL4T9Xm8fwVnypag9RcinFOGhyW14ITPc/+EOR+ddsxWgz5vTYRtJBo5SoMm0l
X-Gm-Gg: Acq92OEhjatLzAOyXXkV0s5RN7ObwDs6467D1kcsuu4CcpK/IMpZuWmcvR2GPyASzZb
	uBZ7VKhpH5SAoeZGrHS6kMtmkykvEtS41rOSrmVcxI2PogfIhGKRGRRAge6HOREZxa0wjrVYm1E
	nioJJOo5zwiCHt/CG9yjaWpRtTMAROdFlEARs3tApb5j8neYEARakuDa0JRE0MscwtZEGS9NLQ3
	vC1sWtg4FJgXox5GUyx/0q0susd71hulqYVoBLvGYUFi1HbKgEQ0cWAJtw99YN9PUhsFVa59smN
	TpI+V57thomaDpIzFUhFjaADw6GvEpGtoKDbfKOXvDJjLuLufUxPhwZUu6W4U29+nq433lh94M3
	tT+5fSLmTy47j3mwGUu6vg9WhNAOyOh9THESKIdtJBFHqiGoMSWTmDDIs9vzU/gNf3rRq0cqqKv
	ziKM2oLnZQCGQrg7t7mre9YbqMJV9642RTBWBwY2issZ1IH4tfDGsgp9tMrBaI
X-Received: by 2002:a05:6102:5e88:b0:631:8665:3511 with SMTP id ada2fe7eead31-67c82ff7ba4mr8961219137.30.1779799876168;
        Tue, 26 May 2026 05:51:16 -0700 (PDT)
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com. [209.85.222.42])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-67fd8850d17sm13339929137.1.2026.05.26.05.51.14
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 05:51:14 -0700 (PDT)
Received: by mail-ua1-f42.google.com with SMTP id a1e0cc1a2514c-95fbe2d4d9aso2826051241.1
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 05:51:14 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ80QH0Gcv7vR5BDpZdDJPgAU+fCOMvt3LfyvedfTRUrwpRwe8VaBsmQc8jnoWW3Mebfp47+M+AxwLIn6A==@lists.linux.dev
X-Received: by 2002:a05:6102:c07:b0:631:8665:350f with SMTP id
 ada2fe7eead31-67c7567f8e3mr8433240137.13.1779799873692; Tue, 26 May 2026
 05:51:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260525012340.3860581-1-dakr@kernel.org> <20260525012340.3860581-2-dakr@kernel.org>
In-Reply-To: <20260525012340.3860581-2-dakr@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 26 May 2026 14:51:02 +0200
X-Gmail-Original-Message-ID: <CAMuHMdXnHeW3vYkFBF2O=8wtYsn5+nTwodufnLM1hPyN+LUCtg@mail.gmail.com>
X-Gm-Features: AVHnY4LIni98s9f8-2WYkaUBBpt3OB2PPf6GrmGfT87QEdocdOtpkgI--ll5a4Y
Message-ID: <CAMuHMdXnHeW3vYkFBF2O=8wtYsn5+nTwodufnLM1hPyN+LUCtg@mail.gmail.com>
Subject: Re: [PATCH 2/2] driver core: Guard deferred probe timeout extension
 with delayed_work_pending()
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo,

On Mon, 25 May 2026 at 03:23, Danilo Krummrich <dakr@kernel.org> wrote:
> mod_delayed_work() unconditionally queues the work even when it wasn't
> previously pending, which can fire the timeout prematurely or restart it
> after it already fired. Add a delayed_work_pending() guard to restore
> the originally intended semantics.
>
> Premature firing calls fw_devlink_drivers_done() before all built-in
> drivers have registered, causing fw_devlink to prematurely relax device
> links for suppliers whose drivers haven't loaded yet.
>
> Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost deferred probe work")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks, with both patches from this series applied, I am no longer
seeing the WARNING Biju reported[1], and thousands of "sync_state()
pending due to" and hundreds of "deferred probe pending" messages.

Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

[1] https://lore.kernel.org/20260526120306.184283-1-biju.das.jz@bp.renesas.com

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
