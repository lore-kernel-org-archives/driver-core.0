Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE092386426
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 21:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788383765; cv=none; b=QtnA4pK/zkWm+X1cYpNKluegWCLyY6Of8DW1kd+mgR7wgYvfDi42mCS42ARYVJfCyZi7SktdAntW9gTz1VEnOdS8nTXvLgJkI1GcGvqR1A4Frkkz4MpDHLyUkKpTO6bAc3JYhglTNDCLGWTNiKf1cw99XnMTwtCLS2qTEsmgHzo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788383765; c=relaxed/simple;
	bh=5y/ZJifa2iYhp1fa/YbHbuyJkaVFG1V1JiH/IvCgnms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TYbserStopD2OwwHTotuSCEZ2f3gDXIHBUoU8ks6b255r4kBkb8Scsx19TRpfhe9+ePCPlErUoL0WMf2rZtu13iW6PvlRg62PF7YG4toVbUspOJjYAWJ5TwChyISB2fVj8ZIjJAmCz9kPn1O+0EXDq2/VRhCquIQm9dccFBCC74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Z0T8ce58; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Z0T8ce58"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6a668ce86abso2922019a12.2
        for <driver-core@lists.linux.dev>; Wed, 02 Sep 2026 14:15:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1788383755; x=1788988555; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VULb9kS6gikSL4PV+t0LAPIQva7ggs1lcENE0RmVzBM=;
        b=Z0T8ce58RTfEdLZPLYz7r/j5IgQpAilI9w9Hxl9Xqh2kYnqI9n6M2C5cuCOkJxPNBD
         jVEoPL5q/7GIgKIsAUNnN1xN0DbfNdcn6ojPLLnZ70yv51021tYc8n8mjwrVy5162VgU
         eu+4Xqnj4CwNSCVkydvlWkOWy0P+43fAAZU3o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788383755; x=1788988555;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VULb9kS6gikSL4PV+t0LAPIQva7ggs1lcENE0RmVzBM=;
        b=SXE4mzgN5gC+7rtMt32AwDaxQWquFI4CPwQPVXLCGTWC6eRndz6ODfdteZ+eRtwDSk
         M+pe2lQA3qYuha6fwGsSijtqeys/gd1PIdPotOjjU063OFiZup/82bIoiTLrEhVHnrsz
         jejbTTA734IIpDmHU0VbBB540UISwT6OjLnW8eoQt3tI6vSLoglImUnQ+AyyU7iTH15R
         pD8E8yRMxP3gJ1eU0hp8cb3r1PhTSI94NUK39K8IVCVTTOjyu0djPL9xFR8dF998QGEi
         iAr9zfqlDK2QOq8hygHt0aMPh1VyYEGWKgu0QgPMc4WGtIAvw//knJa8Y2e7WHVymLzM
         4sww==
X-Forwarded-Encrypted: i=1; AKwUvBzIQy35Q/CYvd4dejzqhGuaX7BVblLvfymjbJeWzOXUQbCk7NBZjpXOsAZZS5V7I1M4/c+eqOqqQJhmzg==@lists.linux.dev
X-Gm-Message-State: AFuF++npNgCNobpjkKFn81FI1SKw7OMLPmUiOjXNNxZ7qGo7nDzjLaCf
	FTy8nIeQxz6qtpoRxUTFSAcFjSPn2vAcN9hLa0B1XIbx/y2pgUe9vU+/CW+pBW0C3kxfHSSi3W8
	i7sECAw==
X-Gm-Gg: AYBFou043BTdtGz2Gxn90oULOud6TLuc6T2BpchGQiMFit8q1jaMkZcorfJlJlupiCd
	JJqDYMcIEw/6figJfjhZSi1cTacLlniO5yPEm2F1JHyTk8XBTvoCkpdou7DAhQTfUWL/VaVeFtN
	AvA9Los6UdtyEg7w9PyawutBLpW8s1YIg4Y9M37+QS8h6iuFyz7QuRCHrVdd+RJ4o9n8kH7/ckl
	3RNvyTFhABeqG94aGS7Rrmmz3G7NP+jIhPTDQdYWE9Yye09y40EVkS79hc4I4sKn5BKQSWGuv+Q
	M38xT7QnCBHDS+FPRPhzpYUOodV/M+kNYQzZ6xugV9xJZ4S4z2TVZsX+feWkM9Pw6sLFsQRZ0kB
	xSqvaIsMOcfjtirliyM5UepjztqbkZ7J2HRXqgC6R8mpXKyayQysSW4aGxIgF6zSXgD8jT1k7+D
	hOR9MZcEGLzhsW/KV4paHUkvhherOVb+sJGzBD3rIiMlH8sz9N8G6fMWRdhRI2jsDS7M3C9TyA+
	Grq9rnWSU2xT3EzPr5Iyl/7YIs=
X-Received: by 2002:a05:6402:13cb:b0:6a6:1a05:8b30 with SMTP id 4fb4d7f45d1cf-6a68257b0bemr4570439a12.6.1788383755368;
        Wed, 02 Sep 2026 14:15:55 -0700 (PDT)
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com. [209.85.221.53])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c25f417250bsm11481566b.11.2026.09.02.14.15.53
        for <driver-core@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Sep 2026 14:15:54 -0700 (PDT)
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-484415c8cb1so1229211f8f.2
        for <driver-core@lists.linux.dev>; Wed, 02 Sep 2026 14:15:53 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBxhCYZfWZPAxgooN4E5Vq9tA3Xb5Ly6NCeF7EWEWOdFzvTT4B6BXp/rlvzJdi+VpIXr6Eo1ad4LYvP3uw==@lists.linux.dev
X-Received: by 2002:a05:6000:2481:b0:484:3310:710b with SMTP id
 ffacd0b85a97d-484913bf064mr12406216f8f.23.1788383752177; Wed, 02 Sep 2026
 14:15:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821170648.3097673-1-mrungta@google.com> <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
In-Reply-To: <CAD=FV=UDw4WEGAjr4eY2qoPVbs9h9J1SJU88OjHgTnqXUSwotw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 2 Sep 2026 14:15:40 -0700
X-Gmail-Original-Message-ID: <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
X-Gm-Features: AcwNN1VtZgFm4leH2DwT1nxdxS0xJOsopCt5xMdhkxv_e6dk6esNzniFp1LfiZU
Message-ID: <CAD=FV=WqPTXKB2NgPS2hS5_9tdQbUyfXHFOARrX3rjzFra1Z1w@mail.gmail.com>
Subject: Re: [PATCH] PM: sleep: Add DPM watchdog to late/early/noirq phases
To: Mayank Rungta <mrungta@google.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Len Brown <lenb@kernel.org>, Pavel Machek <pavel@kernel.org>, 
	Tzung-Bi Shih <tzungbi@kernel.org>, linux-pm@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri, Aug 21, 2026 at 3:37=E2=80=AFPM Doug Anderson <dianders@chromium.or=
g> wrote:
>
> Hi,
>
> On Fri, Aug 21, 2026 at 10:06=E2=80=AFAM Mayank Rungta <mrungta@google.co=
m> wrote:
> >
> > Extend the DPM watchdog to wrap device_suspend_late, device_suspend_noi=
rq,
> > device_resume_early, and device_resume_noirq callbacks. If a driver han=
gs
> > during these transitions, the watchdog will fire and dump a stack trace
> > to help identify the offending driver.
> >
> > To prevent false-positive timeouts, the watchdog is set only after
> > waiting for subordinate (during suspend) and superior (during resume)
> > devices.
> >
> > Signed-off-by: Mayank Rungta <mrungta@google.com>
> > ---
> > Testing:
> > - Tested on an ARM64 SoC (Pixel platform running a 6.18-based kernel wi=
th
> >   DPM watchdog enabled; Android 6.18 kernel has latest DPM changes
> >   backported).
> >
> >  drivers/base/power/main.c | 25 ++++++++++++++++++++++---
> >  1 file changed, 22 insertions(+), 3 deletions(-)
>
> I reviewed this patch for Mayank before he sent it. It seems correct /
> useful to me, so I'm happy with:
>
> Reviewed-by: Douglas Anderson <dianders@chromium.org>

Since I reviewed this patch, someone pointed out to me that we should
probably also add the DPM watchdog to the "prepare" / "complete"
stages too. I know those stages are used less-often, but it still
seems like the DPM watchdog would be relevant there. Unless Rafael
chimes in and says he disagrees or that he dislikes this patch in
general, maybe you could post a v2 patch that adds that?

Thanks!

-Doug
