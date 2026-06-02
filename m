Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9440E3BE65C
	for <driver-core@lists.linux.dev>; Tue,  2 Jun 2026 08:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780387640; cv=none; b=q5OGN5D4Q0qdeYZYrTqV81aImB57elKm350ojnERfWO9wllkaelhl2CiUaSSYrYhcGMAUUhjRfUKOVv5kIu/kCq2ngqgsG84NnnckpBwKCpAMDfekpKwbID/97PjjbAZZD2aPfO3wuoEl4OFYEyieV4islsMlPcn8a8ZYCpWUFQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780387640; c=relaxed/simple;
	bh=/4EYdveCvWG0GRBvLH7m/WtmRk/qK9PgCLYaNyKquwI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EVkq9hxtqMxLSYmUpEWQovAkmMT/+ocZNxoIwNk8QS0DuJNCUqrXV28+SVpztA8uUBwRWesH3dJ3RMU+s5ZmfEUTlG8hDSYvaMYGy7s3T/pu9b6By1PdCjjwztYfLQpXqf4Nk54FYxr6BIOtBqxqx8XjZRPxV1xpoKPxqDyGPQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Jp61ML0a; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Jp61ML0a"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AEFA1F0089F
	for <driver-core@lists.linux.dev>; Tue,  2 Jun 2026 08:07:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780387639;
	bh=oXlYnTudrQcQ9hF3YsSs+gCEBjjj+8mbdf9VKmcGyzc=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=Jp61ML0aBmCQbv2pJ7mUZQhmWSaZA71L3+vhBFyAJeLXpun2JylNy8zBrU8aB2q8x
	 SB0uSPrFPBeEZ9X/gJ7TcJ8qpXb2YBUcXDJw48DdEqbP5WkQ2PLedFM6nFWVoUTNEV
	 sb+NCY2gKjt+I/tMZvCvVg86cTLW974L4EDSAS7FwElHOeawcE2pzPWMVygzz64hzQ
	 2d+di6s4iYtixPkv6THNCt/6RP74qCAQfJX2tGSW2IGu3YU5xxrHPf4ta0QxFbafL4
	 WwJXSav2yfFuRktcpUZcEWM07foM99/WK/z4vyF21lGZFTEXx9MZYLaZlm9Zt4Jap8
	 xGcHukgXruSEA==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5aa21fa024cso15275084e87.2
        for <driver-core@lists.linux.dev>; Tue, 02 Jun 2026 01:07:19 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+vnWtiy7CfIuJWySTYAUr/bke6SzNiel31AnpYZMUQyvlnwEEoY+pTdvExBDLhxnwiJVRxE+bQX9VsMg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyvnsaWRJQeQAOnmHlc7iXrKnNIYq07RtyGhIi8iuUnAmwcEarC
	lIkaC22OBGuZkUjuDUGNPL651EPTiSr8tbXTY7PEXJ4ZdrGmClYmgKsp0Gajd7C2zg1jI9unq0/
	T5c/RvNT8bXv6E9eeCajJKnIGMJ8GMQc=
X-Received: by 2002:a05:6512:3c9d:b0:5aa:656f:d4f0 with SMTP id
 2adb3069b0e04-5aa656fd648mr3643050e87.41.1780387637637; Tue, 02 Jun 2026
 01:07:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260601-driver-core-fix-system_wq-warning-v1-1-f9001a70ee25@kernel.org>
In-Reply-To: <20260601-driver-core-fix-system_wq-warning-v1-1-f9001a70ee25@kernel.org>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 2 Jun 2026 10:07:05 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iRE2Fd1uWSWAcDPrXCsDT8Xvt9knTczN1DfANK=R2TkA@mail.gmail.com>
X-Gm-Features: AVHnY4Jsv1_61Dpr8ejs2TkboC4EeDdkmwHpYAJ55sB_TfStHdqYwklowK-MdGw
Message-ID: <CAJZ5v0iRE2Fd1uWSWAcDPrXCsDT8Xvt9knTczN1DfANK=R2TkA@mail.gmail.com>
Subject: Re: [PATCH] driver core: Use system_percpu_wq instead of system_wq
To: Nathan Chancellor <nathan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Zhang Yuwei <zhangyuwei20@huawei.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, Tejun Heo <tj@kernel.org>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 2, 2026 at 5:56=E2=80=AFAM Nathan Chancellor <nathan@kernel.org=
> wrote:
>
> Commit 1137838865bf ("driver core: Use mod_delayed_work to prevent lost
> deferred probe work") added a use of system_wq, which is deprecated in
> favor of system_percpu_wq added by commit 128ea9f6ccfb ("workqueue: Add
> system_percpu_wq and system_dfl_wq"). An upcoming warning in the
> workqueue tree flags this with:
>
>   workqueue: work func deferred_probe_timeout_work_func enqueued on depre=
cated workqueue. Use system_{percpu|dfl}_wq instead.
>
> Switch to system_percpu_wq to clear up the warning.
>
> Fixes: 1137838865bf ("driver core: Use mod_delayed_work to prevent lost d=
eferred probe work")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
> This should go via the driver-core tree since the Fixes commit is only
> in that tree currently. The warning is only visible in -next when the
> driver-core tree and workqueue tree are merged together.
> ---
>  drivers/base/dd.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index a8ca2092905e..60c005223844 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -324,7 +324,7 @@ void deferred_probe_extend_timeout(void)
>          * start a new one.
>          */
>         if (delayed_work_pending(&deferred_probe_timeout_work) &&
> -           mod_delayed_work(system_wq, &deferred_probe_timeout_work,
> +           mod_delayed_work(system_percpu_wq, &deferred_probe_timeout_wo=
rk,
>                              secs_to_jiffies(driver_deferred_probe_timeou=
t)))
>                 pr_debug("Extended deferred probe timeout by %d secs\n",
>                                         driver_deferred_probe_timeout);
>
> ---
> base-commit: 46def663dd34da36464ba059f7cfeacf29d98e5e
> change-id: 20260601-driver-core-fix-system_wq-warning-0c5db4f49c62
>
> Best regards,
> --
> Cheers,
> Nathan
>
