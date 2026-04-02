Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D43430C35F
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 13:35:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775136938; cv=none; b=de+AEKTUDWgZ7J9TuVzyGhGSV+mpswWuLxeGhjK0b6h+DyOIiAnCBJoK2fs4vA4axIXwpqfWuPgVaRD/hPkib7FHe1RKkJmYGGr3TeXWYcunbKtjTCEK+kqGLOy2dGzvGRb5ElC03/CzzO9Q2nodfUrbhf8MDiPYApMVlJTidXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775136938; c=relaxed/simple;
	bh=7uEYQL7HD9/Dkdn1yxfoKID/JvNmDVrxwOtZ1tVhHI4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jtdDWUgW0UvLb1DtSFcDs2+3UBTNk3X9Rr2NztwoVXT4Vl7M8MD40C3z759xQRQSMMs5oiMPa6GKdqXChzoJHRzmqnwdi1SJM4sDH3fVHiGXTB8Mi7ELpRuOGW2nMH8CXFH43WeJVQanqd+/GA2ni4E2WJAMr8H6sakUephH4XI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YCqPLvvQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YCqPLvvQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3A91C2BCB5
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 13:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775136938;
	bh=7uEYQL7HD9/Dkdn1yxfoKID/JvNmDVrxwOtZ1tVhHI4=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=YCqPLvvQEZ5NrUZ176Nww3BQaqXyWpNJzJ6nc2zgkOehtwSTHVRJ1BVNdG4Pa1C0Y
	 CI+ChOQLHWUjnt7BcSHUxM5x+E41iaZKsLGZWi/dm0k7+cl4aqGtzh2IWTbhD7HCPb
	 1rGfNp0p6aMizF544FN7oGMtGbDdsRAgkfPyCYUiEQrPNe9DGxrCFkzGs9pSyLG7ud
	 QbTm/EECa8uviT5w3bbD1TT92J7ftq+XOfi7o/k8t1HlA92sUZnZ60vO5gh70+bVuI
	 YSI5j3HnbnStCx8M929pessnUxsZZvKuiVTc820xmf2aUsjOS08nbFBjA2jcUKWMXR
	 TYaqZov0sQ7UQ==
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-38cbb1ad0b6so7745501fa.2
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 06:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU4+m8FfrImUDP3GgZwZoA+Ma674b0RpfsgUbgu8zQtsnyiVNXtAYAOw8OUYOsh9FSFycmrGRtjjlVX2w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzG2TsQz49f4RL1W8VgFpXq6VMSmR520k5cWHQ7USbpR0WUa5tQ
	h9tiTvaBebT+HWGF1fhy5qNJ05NdIP0B0M+7OPW3fAk8ifI9n65YSxEHYXRF2HZNaiCZGMttPd9
	2nwEI74EW/8zSq3/UBOjfiqvdEDyLewWRXSm6eGCVEw==
X-Received: by 2002:a05:651c:438e:20b0:38a:4de2:8807 with SMTP id
 38308e7fff4ca-38cc305253bmr23362071fa.18.1775136936479; Thu, 02 Apr 2026
 06:35:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com> <ac5t5XozmzN9oq96@ashevche-desk.local>
In-Reply-To: <ac5t5XozmzN9oq96@ashevche-desk.local>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Thu, 2 Apr 2026 15:35:24 +0200
X-Gmail-Original-Message-ID: <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
X-Gm-Features: AQROBzCueRALrTZuDx_r_Y8DgGoZK4uCubDxSqHkQnTQ6s5JA8TFv9V9OgZrdQY
Message-ID: <CAMRc=McR+S9LCHmDjAS6Wn=SrNvq5Ojr-w1qeLsGNJ+L39pbrw@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] platform/x86: x86-android-tablets: use real
 firmware node references with intel drivers
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Daniel Scally <djrscally@gmail.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, 
	Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Len Brown <lenb@kernel.org>, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, platform-driver-x86@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 2, 2026 at 3:23=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> > 3. Export the acpi_bus_type symbol. It's already available in the
> > acpi_bus.h header but it's not available to loadable modules.
>
> Nowadays we don't do that but export the dev_is_acpi() or something simil=
ar if
> it's not yet available and to_acpi_dev(). (Names are derived from the exi=
sting
> pattern, they might be need to be adjusted, dunno.) See how PNP does that=
.
> Note, I haven't read the patches yet, just a quick comment.
>

Maybe I should have said why I do it. It's to register a notifier call
on ACPI bus events. Is there a better way to do this?

Bart
