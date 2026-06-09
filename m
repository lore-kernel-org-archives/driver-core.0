Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074353FE66B
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 11:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781003847; cv=none; b=gO08JJFfu4TU1KgDtxxMUNMCdB7qUfElUq1XWV+J6hT3fL2ZgGZjwMD1bokrl/XJu2b5vfTanUJHFmNBqQtr8RiH+HIIYrCuaZ7WRKImzfi814GYm4vIzV1NfLqqn0xxerYqVG8Rp/BBesY5Ixpb3/FvpP8/7d6lC51gaVB7Mq0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781003847; c=relaxed/simple;
	bh=7tp2OWYrm+Ia70rR/TEdzpzDPNkEbn8XJlTwHfsYhiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gtWG08XCnMpMn5oEYpZpyhB47gG8wRF1Clar8WdPu5N99kxhlWtu8o9WpqprZ3cUIjRZ/oFV6vcr7oHoqWaSBU7ove+WyiApf0n1Vrs1oPitk3laOp/Kz8p4RXaTgTwYtSSzBwI5IjSEpbsiTTGOjJAFIozHi6CviPs3RzvomU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=GEtQJmQ+; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="GEtQJmQ+"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9156b74006aso390344185a.0
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 04:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781003845; x=1781608645; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zDbvCu4VoxfZEmkz8hj4Arxjmojgi1kh7vhYD4neuKE=;
        b=GEtQJmQ+kLA6pVI95Eur1dZ2xgEne/92jfU8D6kNZk0VSstX5NF/a4fZ3joCv3Zbot
         wP0m2Cmcol74sikybPcLXjk6MLp9HGxXmz6svEnmge3Khf5mYa6EXru3C/Qzrnt6M3v/
         q7a3KiGlfoQW29sI0OqZInBuNIOstwkycIYqI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781003845; x=1781608645;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zDbvCu4VoxfZEmkz8hj4Arxjmojgi1kh7vhYD4neuKE=;
        b=WMJs9GarGUHOtb6wyZzPhoKATX07nvBJYYOOkxPo6ZaG8q4ElLZ6TRuisL3hNV3f1O
         PE1KYXZKUUqWIOs8bqWfBb1ZoUx3yS9SdIQWiIlPNvQaOCGuU7qsQKsX3v7jBOyyz2on
         DuVRlTsbCohc0PC+xIe1ARCXCyampA4ueoVHFSxK6ITX9I6i5KkHxtIo0ruzCNccRLtL
         rTxFZqbDQyVcyYvpYlGuKSABKkWXDFWCQv4ZpceC6ZADoRs11En1s6IPLrkH82pLOzjS
         xhgFJwT2ZAPZ2+6OQBenCbDIvKfTtZxL5p5w2yb3EVNpZm96Z2MpY9A58nXb36MEkCbB
         UWMA==
X-Forwarded-Encrypted: i=1; AFNElJ++0DPzQnWBQGe3bqEqy5UkYCOBVENsCOlek8G5tlr0E3sAv5IxnMjYgb/v8xctCJrHxbxEwwmjiDuIow==@lists.linux.dev
X-Gm-Message-State: AOJu0YyEeDB/CyRfWuwiWtcdWn0P4x2qGLD0SA0NSx9zxPbbs+xnXvkn
	WkBTicd6Jgg5vvr+t7Tu+QZLPGoB9gEML1G2URunWICn8UMejbbXjV5VTqqZhXP3kUbFqmcbF2/
	r40OjyQ==
X-Gm-Gg: Acq92OGsl94YfghD74wfHw7HX0dBNCKE3byXiQQZy5Tjz1MNguNGNok59+mNFo0EfU/
	56udVPc8vYE8RkPQux6FGMn1qB0Obb5zdIao8a6ETydNpxe6NsQ3n4JJKtPuW/NUn5+1vVqwIfD
	q3sB6Mi0a57wK6amYP5o6ETgVXjQTCGBwjUtQ/QJBHPN8m+JgPGtse+XUZJ4blD07WNtbMza1GX
	cyLIAM3hr6rApj1teQAm+ZutgsrFBD7BiUqVCubp16HShF8Y4Gbalpnmkd43fFiyBcyt7RUNoVe
	ZyyGZGqBY8BdLubdAnEDwDblov9U7PupKl/h+dVdF7YocOUGD5WauDfkWCTlTmIHQI6JagbguVK
	gJyvk99lKSri52tXM5qP6EHu6DKb7B+CYpH7phzehDJKq5CFCS2NTKKvN8GvT/ytv24shURwydU
	kDHVqu3O/WE1IrhMXucX9zAtnX/oJDthviuJ1ZWeukaDNKou9ho6zQxcdJWnjOTNKHUfrd1mk8
X-Received: by 2002:a05:620a:6310:20b0:915:b852:435a with SMTP id af79cd13be357-915b8524853mr1649995385a.21.1781003844504;
        Tue, 09 Jun 2026 04:17:24 -0700 (PDT)
Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com. [209.85.160.174])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9159cd628f8sm1754849785a.4.2026.06.09.04.17.22
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 04:17:22 -0700 (PDT)
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-5175d339e8bso2390691cf.0
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 04:17:22 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8t6/OVNnPg43DshHJ4Nx6zX6IAHzYxwCgD0yjzhH0z11VqNMRL9dwGOiJaQXEjUMX0mMkg6iU9c489CA==@lists.linux.dev
X-Received: by 2002:ac8:51d3:0:b0:517:99ea:ab82 with SMTP id
 d75a77b69052e-517abc8cea8mr19118391cf.28.1781003841615; Tue, 09 Jun 2026
 04:17:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608021526.1023248-1-tzungbi@kernel.org> <20260608021526.1023248-2-tzungbi@kernel.org>
 <CAJZ5v0jy75R24NztKJ0w4NMyRB7G+DcsC+gaQ0xZOQMfTfA5Ww@mail.gmail.com>
 <aifWwEyHuFejW4ac@google.com> <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
In-Reply-To: <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Tue, 9 Jun 2026 20:17:03 +0900
X-Gmail-Original-Message-ID: <CAAFQd5Bmm4VeJ2ygOJeQYmdTq1DLBsQdvDkhstA-tUPZr0rB1A@mail.gmail.com>
X-Gm-Features: AVVi8CfwcVOwQBh6bKtrJBXA0oWlGWFm1bcG07aWA20mHmTZKYZMKn7BpYcKJWo
Message-ID: <CAAFQd5Bmm4VeJ2ygOJeQYmdTq1DLBsQdvDkhstA-tUPZr0rB1A@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] PM: core: Rename module parameters prefix to "power"
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Tzung-Bi Shih <tzungbi@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	senozhatsky@chromium.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 9, 2026 at 8:10=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.org=
> wrote:
>
> On Tue, Jun 9, 2026 at 11:03=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org=
> wrote:
> >
> > On Mon, Jun 08, 2026 at 04:11:30PM +0200, Rafael J. Wysocki wrote:
> > > On Mon, Jun 8, 2026 at 4:16=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.=
org> wrote:
> > > >
> > > > Currently, the module parameters defined in drivers/base/power/main=
.c
> > > > use the default prefix "main" (derived from the filename).  The pre=
fix
> > > > "main" is too generic and non-descriptive for power management
> > > > parameters.
> > > >
> > > > Redefine MODULE_PARAM_PREFIX to "power." at the beginning of the fi=
le
> > > > to group the module parameters under the "power" namespace instead.
> > > > This makes the parameters more descriptive.
> > > >
> > > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > > ---
> > > > v3:
> > > > - No changes.
> > > >
> > > > v2: https://lore.kernel.org/all/20260604090756.2884671-2-tzungbi@ke=
rnel.org
> > > > - New to the series.
> > > >
> > > > v1: Doesn't exist.
> > > >
> > > >  drivers/base/power/main.c | 3 +++
> > > >  1 file changed, 3 insertions(+)
> > > >
> > > > diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
> > > > index ed48c292f575..cd864f3a2799 100644
> > > > --- a/drivers/base/power/main.c
> > > > +++ b/drivers/base/power/main.c
> > > > @@ -40,6 +40,9 @@
> > > >  #include "../base.h"
> > > >  #include "power.h"
> > > >
> > > > +#undef MODULE_PARAM_PREFIX
> > > > +#define MODULE_PARAM_PREFIX "power."
> > >
> > > "power" may be confused with the power supply support, so I'd rather
> > > use "pm" or even "pm_sleep" (in which case the "dpm_" prefix could be
> > > dropped from the new module param name in the next patch).
> >
> > Ack, will use "pm_sleep" in the next version.
> >
> > Regarding dropping the "dpm_" prefix, should this also apply to the exi=
sting
> > dpm_watchdog_all_cpu_backtrace parameter?  Or should we leave it as-is =
to
> > avoid breaking existing configurations?
>
> Breaking things for someone would be unfortunate.
>
> For consistency, let's retain the "dpm_watchdog" part in this name and
> use it in the new one.

Hmm, doesn't the prefix change already break things?

Best,
Tomasz
