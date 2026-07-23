Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF5194779A5
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 13:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784814514; cv=none; b=cez0/ZDGWbR4vE9kE/lA5zXOuBq4uXrbjNGP7KwQnDolHEnGPxx2EpK7yiUTIxU3UOlBudsu+neXVhvKAekCTHBwvGtUTKi8JmPKVcXKCsNY7Ic99RCJc/TNL8f6L8gSeaMb5R7yBzn/0Qv97QmPXiLk0gfWgrR4+mRO4dtJ54Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784814514; c=relaxed/simple;
	bh=VwQdFLfRqdGM5nUxBzCF1AGxYUnnTWEYeBtyXHCcubA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EV87yYFceX2taDGiZtmZ9MEw7b+zyvaTHUrQYjumTwkMOJqjXeprBJt2CryATtrD0g28lksUb1iL3X8aiBWl8emx25YmLGyZr7TGEz2+Z2B7ZYCWyMmXvZrMemH2ycB2suiaG21d3wkaZuN1CZ06kdfra03QTCZyuhcOfObvvr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FK951Cqf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FK951Cqf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B4641F000E9
	for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 13:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784814510;
	bh=HKCYSxiClTRKhfhj2SX8Yu6DWTZP/ksvsEWHjf7nzN0=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=FK951CqfYEm5ffS+7ELZFxGQNzyRl/OiVpKqs15Z18QQXna04UTk7lyWsUrirwsza
	 WIjByEanUGGbi0RpHMt1veFDVpJLscomLE2cAbTSepOnol76Iqell7A+lJcLMb1K5z
	 eOntTHSLvOgAbfveyDM2+zmCYDCzwegifA7zjAHncEcQBpHnqKc7q/84xu04ltMBlD
	 fq1ybxpdt8Q6LNGm6qNG1/MfdEZZHW5yk/jPAucnarTy7oP85bBN50blAd2MaxmMMB
	 XOl1cYQfjI4daExz3vYPzij0e43Yn6inQNBP7lem+ZqYQQtGI5vZC02BfYO6BOWKWu
	 ui3tPnZLZZmcQ==
Received: by mail-lf1-f47.google.com with SMTP id 2adb3069b0e04-5b2a4359d16so808615e87.3
        for <driver-core@lists.linux.dev>; Thu, 23 Jul 2026 06:48:30 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+RoB16Pu5QN+LVjaOzeKcOMjlQoyNZ3eoOQpMzMuJQzv1qz+yv9soOgIJT8i5DtPimqlPMffPRPrGpa+nw==@lists.linux.dev
X-Gm-Message-State: AOJu0YycewwqolSLy9da62cppNgEYhaJ93eC/0L7lf9azZk0Ql5V7HgX
	iWn27WhtmeGch8k8oNQlMGRYnS83q32D263oYH2Wyo6+yQTZx74w5FKxdYMwggUy+ZMW4HOOBa9
	leR6NCtYSLwSm+Rnoopomr5NYdKVN2/I=
X-Received: by 2002:a05:6512:1591:b0:5b2:8c97:b50d with SMTP id
 2adb3069b0e04-5b2b2e52d40mr630470e87.4.1784814501178; Thu, 23 Jul 2026
 06:48:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720030821.2780257-1-tzungbi@kernel.org>
In-Reply-To: <20260720030821.2780257-1-tzungbi@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Thu, 23 Jul 2026 15:48:09 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0gtdDt+bMm8As_FRHXhQn2fDzhc8jhpKm1=1iGTaVAHww@mail.gmail.com>
X-Gm-Features: AUfX_mz7JjnAkI5LuEmMgkAJQMkER1jPgy31srddET01j7xHZTzj3KWIy3A2kZc
Message-ID: <CAJZ5v0gtdDt+bMm8As_FRHXhQn2fDzhc8jhpKm1=1iGTaVAHww@mail.gmail.com>
Subject: Re: [PATCH RESEND v6 0/2] PM: dpm_watchdog: Improve DPM watchdog configurability
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Pavel Machek <pavel@kernel.org>, 
	Len Brown <lenb@kernel.org>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, driver-core@lists.linux.dev, tfiga@chromium.org, 
	senozhatsky@chromium.org, Randy Dunlap <rdunlap@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 20, 2026 at 5:08=E2=80=AFAM Tzung-Bi Shih <tzungbi@kernel.org> =
wrote:
>
> This series improves the configurability of the DPM watchdog.
>
> Currently, the DPM watchdog is always enabled if compiled in.  Also, the
> module parameters defined in drivers/base/power/main.c use the generic
> and non-descriptive "main" prefix.
>
> This series addresses these limitations.
>
> Patch 1 renames the module parameter prefix for
> drivers/base/power/main.c from "main" to "pm".
>
> Patch 2 introduces the "dpm_watchdog_enabled" module parameter to allow
> enabling/disabling the watchdog at boot time and runtime.  It also adds
> CONFIG_DPM_WATCHDOG_ENABLED to set the default value of the module
> parameter at compile time.
>
> The primary motivation for this configurability revolves around Android
> GKI (Generic Kernel Image).  We want to enable CONFIG_DPM_WATCHDOG in
> the GKI so the feature is available.  However, because the GKI is shared
> across many different devices, we don't want to inadvertently affect
> devices that are unaware of this feature.  This provides a way to
> compile it in, but keep it disabled by default for those devices via the
> kernel command line or module parameters.
>
> To maintain backward compatibility, CONFIG_DPM_WATCHDOG_ENABLED relies
> on `default y`.  Previously, the DPM watchdog was always active if
> CONFIG_DPM_WATCHDOG was set.  Defaulting this new option to 'y' ensures
> that the behavior remains unchanged for existing users and defconfigs
> when they upgrade.
> ---
> Since there was no further feedback on v5, I'm sending out v6.
> Any feedback would be appreciated.
> ---
> v6:
> - Change the prefix "pm_sleep" -> "pm".
>
> v5: https://lore.kernel.org/all/20260701045640.3130090-1-tzungbi@kernel.o=
rg
> - Rebase to v7.2-rc1.
> - Fix Signed-off-by lines.
>
> v4: https://lore.kernel.org/all/20260611021219.2093476-1-tzungbi@kernel.o=
rg
> - Address review comments.
> - Patch 3 in v3 has applied separately.
>
> v3: https://lore.kernel.org/all/20260608021526.1023248-1-tzungbi@kernel.o=
rg
> - Address review comments on patch 2.
>
> v2: https://lore.kernel.org/all/20260604090756.2884671-1-tzungbi@kernel.o=
rg
> - Form a new series.
>
> v1: Doesn't exist.
>
> Tzung-Bi Shih (2):
>   PM: sleep: Rename module parameters prefix to "pm"
>   PM: dpm_watchdog: Allow disabling DPM watchdog by default
>
>  Documentation/admin-guide/kernel-parameters.txt |  7 +++++++
>  drivers/base/power/main.c                       | 14 ++++++++++++++
>  kernel/power/Kconfig                            | 10 ++++++++++
>  3 files changed, 31 insertions(+)
>
> --

Applied as 7.3 material, thanks!
