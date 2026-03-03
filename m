Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9D5E282F38
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 13:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772543022; cv=pass; b=CiHVH+UMtpPPoVA+xE9XyiNCR30XsBqDiRg69N30Rt/pFzFcAiPddeLoXrG+1mtuncUofW9VZjjqoqlebwPMXar27R1DGSVTq25FKLU7srPFUksxVpGwExtCAHMIht9/Aulod9cingTSwaY+ysw+ic048w2Oi4GCEYxLjP1bMo8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772543022; c=relaxed/simple;
	bh=bdXuAHR+W7DcDsgTssbNNylZwjKna61a4d2JwD1CRZQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FySihXVLRy7et5AV0+lHG6R1BRjzdfgfmW/hmsuv2aZ6CF8scGOjqVs3Py6cD3J0ZGPs7sPTVKUudrvfgOnClmj19s1lXG19hwpSqdH7oOP2R4o9iKgrJV8T+OaemogacYVsLZOgJSxbTnV6bq2f76Vh/PSzrDhuAkh503E7f0g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UA2w1T63; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UA2w1T63"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40423dbe98bso471542fac.2
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 05:03:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772543020; cv=none;
        d=google.com; s=arc-20240605;
        b=KSRC63Xsa7mVxS/bU9eOONKLjUbZipez3zOhziuupBcDzhryIPHdpAVCFRCSskQlKe
         q4wGjCnIG4EP3PH5510A1JclGGGoX32kyN2V1YJM5V4urKwo24KKu7pIvGS5408uGCjX
         zBT5nhVuJYifdye4hAFSkFGbdmKCrCfUil+PGrKQjbnzZEom35Xlduq9FfVAs2J6b+eH
         /I6HrMgZt1yref+4tPRIy0nVdKp4wFE5E/h+M7I6Y8CF+/6tKk8IdbZrcChgSYlN32OJ
         NERPy32NQcnugDBd6F2LsLZoOTB1lknv/P4W6tC80XDV3VwOUuRJywKftS24repNw8ao
         xXNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        fh=Qf32lmN0lPfYsVavTsBzq29gLjbuBH4Af9oVAN/7G7o=;
        b=Fw8EqqTuvAsiqbWunzPYI+zMoWpUSKYbtF4xS7vJJnZ7fxY4j4on2eRQS8ydXDUu3Y
         58Fd5loe+ELrMByv+SztLmlwT4rKnB9vjpwZvJ82tNvJbHu/7mGAL/s+utw6BaYhwfgD
         LUdV/Keqmc/cxIXky1b45c60fLXDpevgofhD/cVEQNhUhxNY+LbW71svatoOBN6hWihy
         7s4AU4FtX750tHea7T7r8TWXTsmTkNWos9i3GA3hvcMZOkLh7T0EVgQxFhAIqGiyaoKZ
         KvBeJTGr+ygkUhojB5oICmxwD9aKJ1Jyoe26aVrX+qu4iLxR1qXznTNEkXgivPYbCnF4
         XSrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772543020; x=1773147820; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=UA2w1T63xwSD9UnMQXWyB1dSF33loNrcnpqIS/AOirkl6abRqHjGVarsenD5SucfCd
         L0cxi6GcPQ+IhqHV14K3oMIRxexEEBjwyIwU8YPimWKOdsnnhaV0r9EZmCRv4cekbVN6
         qIm6G89rT9ogN+9dgCKIAEl0lkqgIM2bRYvIpR9gvpgMVouTFUShbj/pT+S9RXZecsbv
         EyAZZl/JD/tljBKVPi4fE5hMycKtmdrwERpF9k2ubBNTC8sV+wLmHTk+uuo0y2y6vHqC
         XsTg+gLBJ/VqJ8TExh2CUET8yS/VBjM3Ctf5Pomp6pRFxYbTgC41QBHATNa1dqkeJn93
         j+oA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772543020; x=1773147820;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fXJCi76LsoMAmD6ooe8NZCj0HaxUTDKfSurt+CM2Xuw=;
        b=hgFx0goOA30E+zj1jHDPu/x28Dxk0bWFYhZ/7FYdIJJ+o68jtyyCqRlXCZORop3gRh
         bDxmsxUJBmBdJ478OrA3mPd6ktVxcwsvdX4aDDeMNPi1uB2K/LHJi7UjQX7AIRMMtlRo
         347TLRItQPJ19o26omW4q75rSjAdDsAAt8U8ZlfYWe/kYsSgXauoJw30EZ/ZfUaCPG5w
         JJRcREOSKxw508HOJbRHjmBb+RDlg+f9dTI90MVVfFLZn9xphiCFFJR0V2d5BMnAnkXZ
         Xk1PhrI9xQvswBNZCDug0hudkhK40ZYAryURtw+FrLE8IYdgEtzZqm9wYpo15oZsHx8a
         ch7w==
X-Forwarded-Encrypted: i=1; AJvYcCVIDnIkXVtkALa2JPDRMQsgqo4y4dWdlZwD+HzOPzAmLeUOIybM3qJJNh2vjQ0m40Wgz5SYrBLqd6Epkw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyr5O91a/ZgO5oBQZ+9QfIf5V3sQRgL8K+oHamJ4e7c61UNdd9T
	FfAAFc5F53OavqWKC5kEibi8JgggJuPuZmVmlkBc9OS2b9jZF931PaUYlmAiWggdp0JhL6YXN+E
	j8ysGp5udUNVOBAIik6699PnUZBGkywM=
X-Gm-Gg: ATEYQzxTafkE9mMoMuvDwziBrTvneQ8Emra5tvbQqm84Mgh0TN1Cd+5yk1YSdbLZ/8y
	B03iQtxfhNB4jyxoZLBRvx4dvVVRzURLuv5wInTboD4PT//NPx0BFhcyyoT40BtkIj9epdmCVT4
	X/wAuJEOLWVBeS0eCny5njfGzN2YN/Y2QBOaX7QZlVu5Bm0+baXRSyjeaf/X+F5W7IhS7iSJReu
	/ng0KhQZGZASekcb16T3PpyK6+L6SDhG6mJr68wErFC1AClamq7cihh3p9gauvHty/eZL6f1HdG
	Su3xXFyuBxvDuqFp0edwx0VnrX/01ICJrNPG9mH40Uavwe2gAGIhRSfZRWMsdd7gs1w7RCohqg=
	=
X-Received: by 2002:a05:6871:7383:b0:3e8:9e7b:4ea4 with SMTP id
 586e51a60fabf-41626e21440mr7566575fac.6.1772543019367; Tue, 03 Mar 2026
 05:03:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260303115720.48783-1-dakr@kernel.org>
In-Reply-To: <20260303115720.48783-1-dakr@kernel.org>
From: Gui-Dong Han <hanguidong02@gmail.com>
Date: Tue, 3 Mar 2026 21:03:28 +0800
X-Gm-Features: AaiRm51hHETXLy5xgoyPjMD6CQcJQj3Ex8YjBm7PX7a5CmSkvNYD_5jZKUYKtjs
Message-ID: <CALbr=LaQoV0L2dxiHKvoP2weZNWEXXG434ir8k-Ej=ouBiEWHg@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] driver core: generalize driver_override infrastructure
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org, 
	linux-sh@vger.kernel.org, Wang Jiayue <akaieurus@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 3, 2026 at 7:57=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> w=
rote:
>
> Currently, there are 12 busses (including platform and PCI) that duplicat=
e the
> driver_override logic for their individual devices.
>
> All of them seem to be prone to the bug described in [1].
>
> While this could be solved for every bus individually using a separate lo=
ck,
> solving this in the driver-core generically results in less (and cleaner)
> changes overall.
>
> Thus, move driver_override to struct device, provide corresponding access=
ors for
> busses and handle locking with a separate lock internally.
>
> In particular, add device_set_driver_override(), device_has_driver_overri=
de(),
> device_match_driver_override() and a helper, DEVICE_ATTR_DRIVER_OVERRIDE(=
), to
> declare the corresponding sysfs store() and show() callbacks.

Hi Danilo,

Thanks for the v2. The code looks good and the bus_type approach is
much cleaner.

Just a minor note on the commit messages for the cover letter and
patch 1: they still mention adding the DEVICE_ATTR_DRIVER_OVERRIDE()
helper, even though it was correctly dropped in this version.

Thanks.

>
> Until all busses have migrated, keep driver_set_override() in place.
>
> Note that we can't use the device lock for the reasons described in [2].
>
> This patch series includes the migration of the platform bus; patches for=
 all
> other affected busses still need to be extracted as a follow-up of the WI=
P
> treewide patch in [3].
>
> [1] https://bugzilla.kernel.org/show_bug.cgi?id=3D220789
> [2] https://lore.kernel.org/driver-core/DGRGTIRHA62X.3RY09D9SOK77P@kernel=
.org/
> [3] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/log/?h=
=3Ddriver_override
>
> Changes in v2:
>   - Drop DEVICE_ATTR_DRIVER_OVERRIDE() and make driver_override a
>     struct bus_type feature instead.
>   - Add driver_override documentation in .../driver-model/binding.rst.
>   - Move kfree(dev->driver_override.name) before release().
>   - hwmon: axi-fan: Use NULL instead of dev_name() in
>     devm_request_threaded_irq().
>
> Danilo Krummrich (4):
>   driver core: generalize driver_override in struct device
>   docs: driver-model: document driver_override
>   hwmon: axi-fan: don't use driver_override as IRQ name
>   driver core: platform: use generic driver_override infrastructure
>
>  .../driver-api/driver-model/binding.rst       | 48 +++++++++++++++
>  arch/sh/drivers/platform_early.c              |  6 +-
>  drivers/base/bus.c                            | 43 ++++++++++++-
>  drivers/base/core.c                           |  2 +
>  drivers/base/dd.c                             | 60 +++++++++++++++++++
>  drivers/base/platform.c                       | 37 ++----------
>  drivers/bus/simple-pm-bus.c                   |  4 +-
>  drivers/clk/imx/clk-scu.c                     |  3 +-
>  drivers/hwmon/axi-fan-control.c               |  2 +-
>  drivers/slimbus/qcom-ngd-ctrl.c               |  6 +-
>  include/linux/device.h                        | 54 +++++++++++++++++
>  include/linux/device/bus.h                    |  4 ++
>  include/linux/platform_device.h               |  5 --
>  sound/soc/samsung/i2s.c                       |  6 +-
>  14 files changed, 228 insertions(+), 52 deletions(-)
>
>
> base-commit: 11439c4635edd669ae435eec308f4ab8a0804808
> --
> 2.53.0
>
