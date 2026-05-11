Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D22113E9F9D
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778506492; cv=none; b=cFe8DyH62gW75aCByibl76f4YPZQk+wZ5OhlgM0jCFEJGMG47LNeaEkl2xTHfNm6s+3ta55/YFGgQZKXlMIwTp+NUw2FMIMEjRS+tiSwbuT+p8HInxv3LV93SC49ck7UIVMtbIib+usjyCaS6p559gj/9pRnGhEo0EtC7lQWEvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778506492; c=relaxed/simple;
	bh=r1NwL7C4TUXiy0IqMMrn3WpIg+m5YuGpDASE8HR118U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MRYVVHM9BrjvEw6rARKwTXWVxKAvG+gKjj/fzLCAm7JSN478g7VYS/h8p2622BX1LPRVbOaWdzYO9cIyagzMNsa5M54PDa/zSOO/Cb/zve4VCI9zvT+7pJ9t28L/2tnZVwfNPjizXJ8gqQTdj3qw3FfJt1o2LX/Ya8ZR8G4l7uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CY1zmRAv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CY1zmRAv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9E6FAC32782
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 13:34:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778506492;
	bh=r1NwL7C4TUXiy0IqMMrn3WpIg+m5YuGpDASE8HR118U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=CY1zmRAv/Ku8mbJt4v6JYur71VvXUxbPvCoe1xXRVF9B3F6gu+fmOley5laUHiwCG
	 extjOR7/YS2xIQD8BEzYdA9lyWONIr6U0M0ZbPVoKwDFQd1T7bHwkrYorKd4qG+i0d
	 0NyDNQ1y55OaK0E1yIBilPr71rkX7HVuDO1vRRlLqbWWavLej0icZOI+0xODaf6B01
	 uEqdaqo4t0yPUT96/tEylp0NISrg6t0XIJli4QK6f0z7LYVqCxziIU89lJriPvoFo2
	 ev1Rt9JCtlWduoD5wsvx8DH2xebwPrTbIZZSRaFXRz5HRCvRHYnzmF6nib5sSGRS8b
	 EEAeIkqXYcEuQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3942e9977a5so4840521fa.1
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 06:34:52 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/BuoVg/xzTwCqYBL825cMhly8pK+JTCvRaQhyX1qFiarOsbnhoU8vxbEHpnhw7gh2PIQyLlxVnWFgA2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyDvjVF8Ul0LPzdKTwDjH6nGUsHtqrnoo6AmvRrPmgO6GiUiyo2
	Yy6AIzeVOUti4JepRTKQsWPKT0Uy82IGh2p9kVE0ULeLWv2ntJDLmwS2vEP7S6V42mfH/v77mG0
	Cv88tD6XYZJhiN38zlGuHR0EwttmpSBrq4z4Y7ZhNLg==
X-Received: by 2002:a05:651c:2229:b0:38e:15d9:d60d with SMTP id
 38308e7fff4ca-393dad5f88bmr64043021fa.3.1778506491219; Mon, 11 May 2026
 06:34:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
In-Reply-To: <20260430-nokia770-gpio-swnodes-v7-0-c88f74c90dd6@oss.qualcomm.com>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 11 May 2026 15:34:39 +0200
X-Gmail-Original-Message-ID: <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
X-Gm-Features: AVHnY4LqUFEpLtkv3mOskgVKC1lucSnvu3DKdQtMuet6VRvxpZSBsuokLGXn78E
Message-ID: <CAMRc=MdN9EpQVW=1Sb-9hRdt56Y5NNbskujjq2RiXhu90t0QyA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] ARM: omap1: use real firmware node lookup for
 GPIOs on Nokia 770
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, Aaro Koskinen <aaro.koskinen@iki.fi>, 
	Janusz Krzysztofik <jmkrzyszt@gmail.com>, Tony Lindgren <tony@atomide.com>, 
	Russell King <linux@armlinux.org.uk>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-omap@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 30, 2026 at 9:31=E2=80=AFAM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> This converts Nokia 770 to using real firmware node lookup for GPIOs by
> attaching the software nodes describing GPIO controllers to their target
> devices.
>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> ---

Hi!

Gentle ping, can this be queued now for v7.2?

Thanks,
Bart
