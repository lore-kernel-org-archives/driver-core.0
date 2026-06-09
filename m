Received: from mail-oo1-f52.google.com (mail-oo1-f52.google.com [209.85.161.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0DBD371D05
	for <driver-core@lists.linux.dev>; Tue,  9 Jun 2026 16:07:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781021266; cv=none; b=jktD825uBBU3akfM1CI4PV4jl9GCVCyfG8fRu846PL71Nzop66LMRYTX2DbMxKELBGixegQcMsQ63wPvPDrr3tSMnItdpV+W/NdiVqaTRKMh52PKiyb7zUM/dDq3n1glTVFmevntxqj6wdez49tPXh3w9/HKvr/gZvVzVi1Lm8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781021266; c=relaxed/simple;
	bh=ihIHkKo2Tdh5twtS4qa5HuM6fZuolA0g4wy+dHdIt6o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DYN5oG/YsMtztf0PkVJQy/La59ikwMXuZLyvRYyVK8/mVwKkzaJMXzZR/pY6iLiALeoCWsFRvvJe9cbQ8O1zSm9REFqiIRQsj6fY3g/LgJeLsqCAzici4JwINJlR16xmMw00QjPSPRe6KazDfhpy9bGNV52TRPdX1LcyWZkr0Cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=W7mKsrPg; arc=none smtp.client-ip=209.85.161.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="W7mKsrPg"
Received: by mail-oo1-f52.google.com with SMTP id 006d021491bc7-69e2c792289so3935250eaf.3
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 09:07:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1781021264; x=1781626064; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKC62oLIKUcXquAwJ4zvmOEV+Z1zozxkoFmAy9OT9lE=;
        b=W7mKsrPg1mblTgmRDMCgWNqoSspsmK8gZo36fhhOHZufR/xDxmV1yY01RiPYYX/cUm
         1BdErp0oas00iDwD/NV9alrtTtPhkxDiDKDlF91CKAETuDTElZddFofbvWdPvaBFSBMN
         Vwuk6+sp67CrohXepQ+G9MVDsC3Mztth8FSpk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781021264; x=1781626064;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKC62oLIKUcXquAwJ4zvmOEV+Z1zozxkoFmAy9OT9lE=;
        b=BqzXgFrQBY61xeJcHQZ9PpZwNCn9JyGpZdrJXItJkWrt6848Ac09U6WI6scCP98dyN
         hQArNt6euTxZxnp8ADuAPD8yPZLs/XlAFR6Z6n1bD6pGucq4j9YvLoaf704JwNmtt5+d
         H7nCaAkaQpPzsO58rpcG7uQGzBBLIKBneBirhBVDuLyX/h4Qndz8l9G/eXdMMi0+m0q7
         4H3c8VvPEv41gLTHoHp8SJi1XwnYpDHysMghtHHrvyfpqwCr77S+ikVp7bChtdpEaSKp
         sJfjFUXlRnt1GQg3pyy1a6FhjBBPOvSEiOlyrMLAikKHhdXsGDNXpQcsMbn+eE4Lqryu
         vxfA==
X-Forwarded-Encrypted: i=1; AFNElJ+3BJqaSwZkebzVUemb80d4Cj+HAYos7icwXRIxLM+iOF1gq4onAWD8mddTSKjhROR63i4NsiMK+xshuA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx42eHKJwHtNFf8Cr4rDWSRw4PlkIGJNwO5+P3fzfzxW+kY2jbR
	b3izdD3vfUl35WP8gbXwCR5lgURclciIdEMRwmIF8r6YEvZojjr48YA1Y/KfN2/pMEqgxLTaAeu
	weWZipg==
X-Gm-Gg: Acq92OEbLl122c8MysFuq8M7amNeLdj8B/Li8ASp57jdH5K9V/KC+SfvHLDYLfME7sQ
	0AhoDZc9czTD4vcrCkGemAsq5NQoZAUiceV5jKBtLse3kWHmrD8tVZclZLSZDrUTnGDY4JY80Ua
	UicKbYSUqq5CC0/UbhYWIQIYzZxgMTF067KV41WLleHx6dS8qZvthsBow7HVUN15F7qX3Qpq5zX
	odGxlDad1Q0gUEpFwi3fKEl//M99OKPtuSyN5slU/W4ddJZ/FP37cD7sApCizoTuCR/O1z/s/05
	NPtL9c/s2/zoBre62DA+l+8gykbn5OJ/spAOjC4tnXhRwlQ9zuWuhu1VfK8LXoi7lBx2REHIYlp
	6pry2XfURByWe5Bi9cz2u+NFLKE+0IWKuIzXUbYHT03Jo/S+6YHeElCC+AtRRYJ53IH3bGfCrwY
	Po6SRO6OC+de4cfTir9rUjDL5ehN/hRey9kdsA/SxmSARuKwmhYucw38eRgwl4B5L7AOqg9Nv1
X-Received: by 2002:a05:6820:1523:b0:69e:b6df:681f with SMTP id 006d021491bc7-69eb6df714cmr675948eaf.0.1781021263641;
        Tue, 09 Jun 2026 09:07:43 -0700 (PDT)
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com. [209.85.160.171])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cecd277070sm204465336d6.48.2026.06.09.09.07.41
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 09:07:42 -0700 (PDT)
Received: by mail-qt1-f171.google.com with SMTP id d75a77b69052e-5175d339e8bso2521871cf.0
        for <driver-core@lists.linux.dev>; Tue, 09 Jun 2026 09:07:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+XsrT7NuqwOR0MKrjKwYhhaPuyT8HRirULypKTYTZzJ/hiZE+mXojG6RdAJbxKSvd9uUGuj+jjiDb1YQ==@lists.linux.dev
X-Received: by 2002:a05:622a:a70d:b0:516:4f62:85ee with SMTP id
 d75a77b69052e-51798cb56eemr34163921cf.19.1781021260072; Tue, 09 Jun 2026
 09:07:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260608021526.1023248-1-tzungbi@kernel.org> <20260608021526.1023248-2-tzungbi@kernel.org>
 <CAJZ5v0jy75R24NztKJ0w4NMyRB7G+DcsC+gaQ0xZOQMfTfA5Ww@mail.gmail.com>
 <aifWwEyHuFejW4ac@google.com> <CAJZ5v0ja1ocM+W4hbVsHoZ=fFdmQ-=z4xzviNwo0eEyWT8ssBA@mail.gmail.com>
 <CAAFQd5Bmm4VeJ2ygOJeQYmdTq1DLBsQdvDkhstA-tUPZr0rB1A@mail.gmail.com>
 <aigPNvkxRIz36dWm@google.com> <CAJZ5v0gQTx_k9j2pGha7NKxAjdPS1J_ySZNYiL1=_+_M9znQ_g@mail.gmail.com>
In-Reply-To: <CAJZ5v0gQTx_k9j2pGha7NKxAjdPS1J_ySZNYiL1=_+_M9znQ_g@mail.gmail.com>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 10 Jun 2026 01:07:22 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AiL0PH5nrrdniR2SH9f-S-NF=8e3azwZuKM=ibRFVjJw@mail.gmail.com>
X-Gm-Features: AVVi8Ccb4yfQPTmrJfrr3ZlXROt83QZzcRrNRN_0Bxm62ELu8P-kx7fwOSMEXPM
Message-ID: <CAAFQd5AiL0PH5nrrdniR2SH9f-S-NF=8e3azwZuKM=ibRFVjJw@mail.gmail.com>
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

On Tue, Jun 9, 2026 at 10:40=E2=80=AFPM Rafael J. Wysocki <rafael@kernel.or=
g> wrote:
>
> On Tue, Jun 9, 2026 at 3:03=E2=80=AFPM Tzung-Bi Shih <tzungbi@kernel.org>=
 wrote:
> >
> > On Tue, Jun 09, 2026 at 08:17:03PM +0900, Tomasz Figa wrote:
> > > On Tue, Jun 9, 2026 at 8:10=E2=80=AFPM Rafael J. Wysocki <rafael@kern=
el.org> wrote:
> > > >
> > > > On Tue, Jun 9, 2026 at 11:03=E2=80=AFAM Tzung-Bi Shih <tzungbi@kern=
el.org> wrote:
> > > > >
> > > > > On Mon, Jun 08, 2026 at 04:11:30PM +0200, Rafael J. Wysocki wrote=
:
> > > > > > On Mon, Jun 8, 2026 at 4:16=E2=80=AFAM Tzung-Bi Shih <tzungbi@k=
ernel.org> wrote:
> > > > > > >
> > > > > > > Currently, the module parameters defined in drivers/base/powe=
r/main.c
> > > > > > > use the default prefix "main" (derived from the filename).  T=
he prefix
> > > > > > > "main" is too generic and non-descriptive for power managemen=
t
> > > > > > > parameters.
> > > > > > >
> > > > > > > Redefine MODULE_PARAM_PREFIX to "power." at the beginning of =
the file
> > > > > > > to group the module parameters under the "power" namespace in=
stead.
> > > > > > > This makes the parameters more descriptive.
> > > > > > >
> > > > > > > Signed-off-by: Tzung-Bi Shih <tzungbi@kernel.org>
> > > > > > > ---
> > > > > > > v3:
> > > > > > > - No changes.
> > > > > > >
> > > > > > > v2: https://lore.kernel.org/all/20260604090756.2884671-2-tzun=
gbi@kernel.org
> > > > > > > - New to the series.
> > > > > > >
> > > > > > > v1: Doesn't exist.
> > > > > > >
> > > > > > >  drivers/base/power/main.c | 3 +++
> > > > > > >  1 file changed, 3 insertions(+)
> > > > > > >
> > > > > > > diff --git a/drivers/base/power/main.c b/drivers/base/power/m=
ain.c
> > > > > > > index ed48c292f575..cd864f3a2799 100644
> > > > > > > --- a/drivers/base/power/main.c
> > > > > > > +++ b/drivers/base/power/main.c
> > > > > > > @@ -40,6 +40,9 @@
> > > > > > >  #include "../base.h"
> > > > > > >  #include "power.h"
> > > > > > >
> > > > > > > +#undef MODULE_PARAM_PREFIX
> > > > > > > +#define MODULE_PARAM_PREFIX "power."
> > > > > >
> > > > > > "power" may be confused with the power supply support, so I'd r=
ather
> > > > > > use "pm" or even "pm_sleep" (in which case the "dpm_" prefix co=
uld be
> > > > > > dropped from the new module param name in the next patch).
> > > > >
> > > > > Ack, will use "pm_sleep" in the next version.
> > > > >
> > > > > Regarding dropping the "dpm_" prefix, should this also apply to t=
he existing
> > > > > dpm_watchdog_all_cpu_backtrace parameter?  Or should we leave it =
as-is to
> > > > > avoid breaking existing configurations?
> > > >
> > > > Breaking things for someone would be unfortunate.
> > > >
> > > > For consistency, let's retain the "dpm_watchdog" part in this name =
and
> > > > use it in the new one.
> > >
> > > Hmm, doesn't the prefix change already break things?
> >
> > Theoretically yes, though it's worth noting that this parameter is
> > relatively new.  It was introduced in v6.19 (Oct 2025) via commit
> > a67818f74512 ("PM: dpm_watchdog: add module param to backtrace all CPUs=
").
> >
> > To my knowledge, the flag was originally introduced for ChromeOS [1], w=
hich
> > doesn't actually rely on this module parameter in its production
> > configuration yet [2].
> >
> > That said, I can't know the status of all other Linux distributions.  I=
f we
> > want to be 100% safe against breaking existing setups, retaining the "m=
ain"
> > prefix is definitely the safest.
> >
> > Given its recent introduction and limited known usage, this might be th=
e
> > best window to rename the prefix before it gains wider adoption.
> >
> > What are your thoughts?
>
> If somebody complains about it, we can reconsider, but using "main" as
> a prefix for power management module parameters is definitely
> confusing.

Agreed.

Best,
Tomasz

>
> > [1] https://chromium-review.git.corp.google.com/c/chromiumos/third_part=
y/kernel/+/7414781
> > [2] https://chromium-review.git.corp.google.com/c/chromiumos/third_part=
y/kernel/+/7414721
