Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FDF12D29CF
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 13:44:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782740648; cv=none; b=mSGnJ8st6irn0D0w8vSlsYc8hCVN1MO481yqwfwR7cNjBqff7gq9ZoEweFKFczmPF2YT6cF71QsE2NmrfmKWcpYvWSdV2AJVqsnmtCEBLy56BwF/1J6ARkhLg0US+Fn8H9+dxHbYs2IlzbyLdrg9Nje03W8tmuZkK7ZDDtrmd2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782740648; c=relaxed/simple;
	bh=lTRQqR0tGbEfg1BPrKui7+qUm0mZcpape8mfz4q+bHw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IGzPR9CYpd4yv3BLvd0RjdsgeprstfAbTylO5yLTA0h0CMJiQxhfc5hgaii/AVwnHxUGDwY/9VNJF5Em7RJssOTg6vMhwD3CwGNUJRQVty+3FUHQOR3QGvGqijV1967/iqZfSILkEcPGfmoqWpNrAItQSWphYR8W49NJSvTSdeQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HQjJj0ln; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HQjJj0ln"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EBEF1F00A3A
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 13:44:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782740647;
	bh=6cIC4d+PiSHZ3SbRFj4q9JGuNSFiDAnWXSl+oM+UdhQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=HQjJj0lnFBQH3Ig5eWLDE02Rd7WXqyjHpULSzYI4gZkVMzLux8qW0BUTZWeSxm20t
	 EVmc8hyEl6Vq9t+NSOayShd34UUVxkRQxbithQ1oouCdiWsBiJusgJJtYHBXslnab3
	 kIU/+KYkThsXLqPE2MOYkLuRe02R9YJp3CQ8C7ItSlCnX+30Be9jDRuEKmoOmyHGrd
	 NT+1lAgpGNsT9NT5oCLBrtCaMYm7XkZwmfsAek91JnPRwouiUKfdhPS2AXqAAxXHI6
	 DtnglTCoSAjLR+8RfKevnEIYQeImOm19ZpADL1k95ZKq5Xfdb2gjIFc/HaHHxdio3+
	 Q7VYC0oo54fQw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5aeb3c48da5so1631281e87.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 06:44:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Roy2SNoJJiQtkDMIxbFCKdKchhBckIWXIog8oDGzMAoLvd+WMW8Jlnqm3NWXeb3fm42IPTEowdzIsMqYQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw64a3I8l0jjpXTTgcFOivTDy+MaFe+dFZLKvefIne2Jq4UEzgi
	xlJeNde3hu+k9tFOu/xIypyXineBrPGgOf3/5G023o9XDLZ7RfEgeIJVPmWpHprjOBXPJocTHGG
	ABP1FsjY2k1xgifpgkeQwuh/yN7yHYu0=
X-Received: by 2002:a05:6512:252b:b0:5ae:a9eb:c5c6 with SMTP id
 2adb3069b0e04-5aea9ebc69emr2060838e87.64.1782740645552; Mon, 29 Jun 2026
 06:44:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1782682124.git.ukleinek@kernel.org> <eefb7f30ca1e60b4be38e5a6968dac7641684d34.1782682124.git.ukleinek@kernel.org>
In-Reply-To: <eefb7f30ca1e60b4be38e5a6968dac7641684d34.1782682124.git.ukleinek@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 29 Jun 2026 15:43:47 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g+cMc9KS5UGQ5Mi8yNC9XRkc3QT8tYhu=gV1g86LPBQA@mail.gmail.com>
X-Gm-Features: AVVi8Ccs34F4MePwD38LrJV6NL0uvmkFV5d7o8vSirc-srCPogrS5mue6FS6jLI
Message-ID: <CAJZ5v0g+cMc9KS5UGQ5Mi8yNC9XRkc3QT8tYhu=gV1g86LPBQA@mail.gmail.com>
Subject: Re: [PATCH v3 03/16] driver: core: Include headers for acpi_device_id
 and of_device_id for struct device_driver
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig_=28The_Capable_Hub=29?= <u.kleine-koenig@baylibre.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 28, 2026 at 11:59=E2=80=AFPM Uwe Kleine-K=C3=B6nig (The Capable=
 Hub)
<u.kleine-koenig@baylibre.com> wrote:
>
> struct device_driver contains pointers of type struct of_device_id* and
> struct acpi_device_id* but doesn't ensure these are defined. To make the
> header self-contained add the (very lightweight) includes that contain
> the respective definitions.
>
> Acked-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Acked-by: Danilo Krummrich <dakr@kernel.org>
> Signed-off-by: Uwe Kleine-K=C3=B6nig (The Capable Hub) <u.kleine-koenig@b=
aylibre.com>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  include/linux/device/driver.h | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/include/linux/device/driver.h b/include/linux/device/driver.=
h
> index 38048e74d10a..768a1334c0a1 100644
> --- a/include/linux/device/driver.h
> +++ b/include/linux/device/driver.h
> @@ -19,6 +19,8 @@
>  #include <linux/pm.h>
>  #include <linux/device/bus.h>
>  #include <linux/module.h>
> +#include <linux/device-id/acpi.h>
> +#include <linux/device-id/of.h>
>
>  /**
>   * enum probe_type - device driver probe type to try
> --
> 2.47.3
>
>
