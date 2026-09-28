Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1EDD48D890
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 10:00:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790589647; cv=none; b=F2JDIsze8evtl16K9fXJnZiezbggkMNxEIUQ93ry0tuaWOAU3IXxf5EKMtlgIHWF0dJUsbkFYZqMWrRGxWuHQdQQD8OWmr4hVnE1nqTqz2+KzDMt4Ix2/PQDARJlWsXBwEDrtkYHNz2J6aFHg/rmgWuSYgACIdXPXShH3X4E22Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790589647; c=relaxed/simple;
	bh=jlWOIlCkIqLzMmYFrdtwH+WjSBtI3Ecdu4ZVJh9P79U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=msZszzRd/J3ghyWnk4avT8zTrDGUGVNMyfkINDWwXuHLvG75PRn0ZosBPJSLgWsvLiq2oC4GwKwxEy69ve/plRxbUEcgtXwLsOYONMHSM9DrFSe3KAlAzDdXSbxwywXN+Gkgbq1XnFRwjIQW0LeB30cQrV04nZWm2wVWjvtlwt4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jz0ZqvTM; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jz0ZqvTM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 845221F00899
	for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 10:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790589646;
	bh=2eSTN8EsiyBW/45DC1J5UHI+mfuj00H8nR2ssWjPAUw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=jz0ZqvTM4VWPMGjWay6gx0R43hl2NLHM2VPPBfQwlhSmjA04xstgTCxfvFNkKTzgQ
	 01bVmHXwRQZgKY6ZMAoTiRdNYH89mhACXJFh5/QpD7v5uV9AUCxLXbkHNpOUhJrf81
	 mjyikxkRWq4k7TFyobJt1fRiULOC2IuJrGoAg+9vcE8q4ZqQcBOhzoImlOPUrgiesC
	 eozwmApCe6WT+p3OZfn7Owdur+K62l9lHEZNXm1ZK6rWGdFvm9oi8GU34Lc/UKKyLz
	 lzjHGzzv9OIJCS2kTw3FvTQmQmdTkuXEnbcJBhiq0Lkh/A8DJH0x8R4DhQwDtvr8Tg
	 /xQAaoJ5Xk9KA==
Received: by mail-lf2-f12.google.com with SMTP id 2adb3069b0e04-5b8f80e3f72so1028004e87.0
        for <driver-core@lists.linux.dev>; Mon, 28 Sep 2026 03:00:46 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBwflX6UYxpdNxo0qfsrjTmpPJpTHECMrREj9yQvWKOQQCe+EiVg1dswU7m577ck400PFY4FhxKdll+zzQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYKOlHe+eEZmy1CvN1aw0XGXobXtTy7ycGdcozr1PmZn/khMBj63
	xqQBX4/6UjfvMi12KpI77ar4tTbIhx1kkLEC98JC544lUV05Uwb7F37Imd72IhlnVfbsSZygdnM
	yyBpsrXiJLAEcJWMhfQlcVdJTE32Icbg=
X-Received: by 2002:a05:6512:10c3:b0:5b8:cc2e:300d with SMTP id
 2adb3069b0e04-5b8df2129d3mr4313943e87.61.1790589644896; Mon, 28 Sep 2026
 03:00:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260928074329.853637-1-johan@kernel.org>
In-Reply-To: <20260928074329.853637-1-johan@kernel.org>
From: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Date: Mon, 28 Sep 2026 11:59:02 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jar1t0kNF+oHkC7xC5BL_0dC7erh663W5414AV1R1pQA@mail.gmail.com>
X-Gm-Features: AclHuK-NQbc49kZTCSnPRw57dsHBQPg0xqtJFFdPVwGAQoMSasa5-njcbltRhs8
Message-ID: <CAJZ5v0jar1t0kNF+oHkC7xC5BL_0dC7erh663W5414AV1R1pQA@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: add myself as driver core maintainer
To: Johan Hovold <johan@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 28, 2026 at 9:45=E2=80=AFAM Johan Hovold <johan@kernel.org> wro=
te:
>
> I will be helping out with maintaining driver core.
>
> Signed-off-by: Johan Hovold <johan@kernel.org>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 72294ddfa5b7..2a39b302f77a 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7957,6 +7957,7 @@ DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS
>  M:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>
>  M:     "Rafael J. Wysocki" <rafael@kernel.org>
>  M:     Danilo Krummrich <dakr@kernel.org>
> +M:     Johan Hovold <johan@kernel.org>
>  L:     driver-core@lists.linux.dev
>  S:     Supported
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/dri=
ver-core.git
> --
> 2.55.0
>
