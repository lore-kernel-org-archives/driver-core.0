Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82E0378F2E
	for <driver-core@lists.linux.dev>; Tue, 14 Apr 2026 03:00:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776135628; cv=none; b=ENuuMnKjfBl7AIkLb60f+VHqnoma+2NT7zdr8VSQ4s8GrBXVN8G66v8lT9ZYZtoCy/ky5V/SJAyLbcACGYTLIWCQVucgVi9Lx6cpO34ZfAWJXStoF7RVfaeR2uOk88x8l9R8Wdbc/8/N7hVl8uzBXSbQM10nG6HpJyIK+dNGFiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776135628; c=relaxed/simple;
	bh=qXSPLJp3y0cI4w40AM0U1rhCylz1/nEBRmZxLE7VAMI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DcFfRDwTUqn1/z0OVO3VfNMerNijRGYxLdvpx6E0FoA29sDSQbndiIdQZQFrWINrUhyF/nMV3Rzi1Lo1FvBPYpoZ0H4obpPdsNYi9gD2AzdXbq6NIfETn3l4H674FeByIIPLiCiBkzwEjx+8+8Mje0ElXoG07nWnhn73YYBbAIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=iIe2BbqZ; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="iIe2BbqZ"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b932fe2e1a7so701492466b.1
        for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 20:00:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1776135625; x=1776740425; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iqq6V0aXBulJSsEzfaNQdOcL2ZbSvoH/w7ZAJ/kpC5A=;
        b=iIe2BbqZ0Rin7FS80Dn5BvGf/Qn9c8uPvtX/uF90KeywDKa/i+WrAHJ5Y2dCBsmk8B
         MksTa7IA5y5+7zIlLU7l3xUxk7wTXnZ3TPkp+loK/HYPCy3DV85GLK8ItUAzKOHnVXzs
         WtGVVZ8+0BAdIAvOt0DAFaPOCTHbdAwSTClB0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776135625; x=1776740425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iqq6V0aXBulJSsEzfaNQdOcL2ZbSvoH/w7ZAJ/kpC5A=;
        b=c001Ut63OeMZ+8Jx9mNaV1fh7yYcch6G56hzRECEsMnoXWa07bNLj4i+R86UK7FFDQ
         G/JNfcJLKLxfS9RSevRvJStejF/oiFrWDBuRkx+2ILantbpoeQgTxQ9uaXyrFvTEwMa5
         OThUOEScj1MvKez/VIpt6JeJ2NCZCNZvImw/Zsalvm3OMCF71sUDfRlz5HXIGd06qOHF
         VYHqT/SRiiDEenEt8hz6SAGsswy4fqHuTXjFGp/YXDQ70xESY3AsrpDxWkgieR4q9UYK
         URf79EhoEZmU2Klk4yo5CgfMyUDz1WvV2ClxbWhA/5MAeAaHy8pZKQZ/ylnDSkHVeOWo
         cPkw==
X-Forwarded-Encrypted: i=1; AFNElJ8axY3HmUlwawfeDBR74CK04++dF9zfWt5Y1xK9Blb611PmHUNHiO6GZOU2QfnUTgGBchcpLsVDEmysYA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+9LIZiBSvlCypQixyWwZFrLiwOn7tAbSD3rw+emAfSJgVAUIo
	a7hZwECSP+compR3p4TK60xyZOIwpsfzSJSGS0nYoha+qZdtkklMUvnn9NqhwcQQlPSDnSEAnO9
	QllPy6g==
X-Gm-Gg: AeBDietvO43+ygQvMbVZXIoZObr0G6F1NfX51lywL0nZcumdBuzXuPL20b3n25vBI6P
	GEO3JZs3jWuv7I9+rJiIitzG/V8e+NNSkXJcC7+gwCw1pnOeeEmCTrlggRSF1vgeH+iHB4QSyRp
	MTiehS6mTTJbQ1D/xs03uxSdlblRySb44OdHFstdieO46c7VokKD4e7gl2RCXnycW11OXrVd4jv
	b4z0gf0/JRWeNh3nARk16OBpidhO4VkbUdwi3T1V2wFcQL45LxHo8ddbk1vBSNrX4B29KFB87ot
	c1j9nMsMnBO7qu17+SjPzckUFvy4w9uNz3stlVcksYVXykWFfppOyY35yOZATsSFdMezoyIuJhm
	jTi7TfZqpA6udDr1azIkC3FnwXMHbUaKj8x73qug94T1IMKEUscH5I6Cq89dZjxMlHOe7lcrr9w
	Cqu+iUcpN5+99bib+5KUWWYT9vri3OLc49yk+X0VOHJY68ZqkvEMcr9jbT1CehkbdLKTKAcqesU
	LCbCm2hUiE=
X-Received: by 2002:a17:907:930c:b0:b9b:1b9e:1e99 with SMTP id a640c23a62f3a-b9d7265c99emr823884666b.34.1776135624553;
        Mon, 13 Apr 2026 20:00:24 -0700 (PDT)
Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com. [209.85.221.46])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b9d6e7f18dasm359458466b.57.2026.04.13.20.00.23
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 20:00:23 -0700 (PDT)
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-43d70b3e159so862742f8f.0
        for <driver-core@lists.linux.dev>; Mon, 13 Apr 2026 20:00:23 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/rlXQHt1ua7IihDecbIGjW1Azamr+lY7e/51OGCCXaCskMML5ZmJTHauVcHrCBMrgs3VWhFfMpcm0oww==@lists.linux.dev
X-Received: by 2002:a05:6000:40ca:b0:43b:3bed:f3b with SMTP id
 ffacd0b85a97d-43d642be135mr22750973f8f.34.1776135622646; Mon, 13 Apr 2026
 20:00:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ad0SNjugVvkAwhok@sirena.org.uk> <f318cd43-81fd-48b9-abf7-92af85f12f91@infradead.org>
In-Reply-To: <f318cd43-81fd-48b9-abf7-92af85f12f91@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 13 Apr 2026 20:00:11 -0700
X-Gmail-Original-Message-ID: <CAD=FV=XBy4NyQwE9vmLt9pggkC5P8fZ=OXoX8ZxJCoRo7ekZkQ@mail.gmail.com>
X-Gm-Features: AQROBzBuADOQ6WA9255mMu_BarbBrcndl3pWz00tQJk7YMJhBGnTWP7C3N7gdxo
Message-ID: <CAD=FV=XBy4NyQwE9vmLt9pggkC5P8fZ=OXoX8ZxJCoRo7ekZkQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Apr 13 (new htmldocs warning)
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Mark Brown <broonie@kernel.org>, 
	Linux Next Mailing List <linux-next@vger.kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Apr 13, 2026 at 12:25=E2=80=AFPM Randy Dunlap <rdunlap@infradead.or=
g> wrote:
>
>
>
> On 4/13/26 8:56 AM, Mark Brown wrote:
> > Hi all,
> >
> > The merge window is open, so please to not addd any v7.1) material
> > to your linux-next included branches until after the merge window close=
s.
> >
> > Changes since 20260410:
>
> New 'make htmldocs' warning due to:
> commit a2225b6e834a
> Author: Douglas Anderson <dianders@chromium.org>
> Date:   Mon Apr 6 16:22:54 2026 -0700
>     driver core: Don't let a device probe until it's ready
>
>
> WARNING: ../include/linux/device.h:519 Enum value 'DEV_FLAG_COUNT' not de=
scribed in enum 'struct_device_flags'

Sorry about that. Fixed:

https://lore.kernel.org/r/20260413195910.1.I23aca74fe2d3636a47df196a80920fe=
cb2643220@changeid

-Doug
