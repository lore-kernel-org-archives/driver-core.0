Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4CB947DD59
	for <driver-core@lists.linux.dev>; Tue,  3 Mar 2026 14:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772549564; cv=none; b=Jq2++fG7Lf8QWvE/pMc2k8HwiFGaXuDBk8P6pk+TM2/ZNrWH7egVAkvY4JJmQjwByltAq1ZBfnWcaXQDOomvYBO32IAz7C8hfl2TO/aDbNCW7yoKX+azE2pFYhmG5wktiUTBQM086dG2d9xgxvw19UbrhTfKvaVcOH9vIM8zp7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772549564; c=relaxed/simple;
	bh=mSRQ1eMomHCwVtqBWfZCdjiyysv7g8iYFUzJOGWZess=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=hyHa94eT6UYdDqqiy0cU7Z79S6kiklr/IXUyDbwwNufsV4X4AfQ0vC7CzEcQzlIeCyyE2Q0ADtM2HywSCVp+yfhg6JGX7VqsNVcMEBb43Yo2aQYeE/GRyo8NyRkyWDo6uxxn+BEeP+kpAejZYwhbR36PN8LvPVAdtv4ZJtxRPsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iJlGbsYi; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iJlGbsYi"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b2965d4bso2398525f8f.2
        for <driver-core@lists.linux.dev>; Tue, 03 Mar 2026 06:52:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772549561; x=1773154361; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=iJlGbsYij98khT/9/gyjmim1V6G0Ewm2IeD2QZCZZaki4fFk+hdWh+ENx2WTQKYKk+
         fZURZV6Ld2Yqn6XfuW2L7O0KvjsCmeZUCeVyD/7CQ5uuB619vJ7drBlwM60WnD32215r
         Qv+JjphDGTlS97bBpwqODiCvhvP/tc6KGY2nBz1oihFypdJaSpKiZA9ByIQEyS/nV0UO
         m7FTPqOr17sNAfmHDolimH8u1neSLLr0jYrM3q/fcyUAtD+XqacatikvdE6ve7F0JOy8
         cKF+PDhqv2CboIGblHxL5pBeejFZvz3ieyhcCBEaDhhd8SR/KnTwwX7c0/80hPCqfAv/
         2K8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772549561; x=1773154361;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=h+8QbcRC2pjzuahdlMd9N/WzqWRbPt5M/XdWso0LY5g=;
        b=bsfk9DC4o/n9oy13g4n24qQadG8PqZ/5M/Rlgy/ErsHetbfaQd+nlTnHFx5SbJ1IGn
         LFa50O/akmwgfLIkeNhrkKs7M0gvmLQpH9/LmI7aHOU7iAJaOb6FjiU+k7vA8qZ5ItSR
         j3Tnh6cLaQp7fRpnoO0Y+De7mI59iHZaZhOVvdgiGcMRFBOf7NVDhsUqdk6VL6TOeJVo
         alBMtR9q1gVMemo9i79RgpzS73mv+BFJ7RhmS9aacnaXC9knTkWgqwys29bV5Q5g22gX
         sO67QM28yrFb3VefMF+3QUqJf2QUlK45cQ2EhWQxaj3lppDRJMNoraRVBCSJXcMcJeWw
         7J8A==
X-Gm-Message-State: AOJu0Yy8hzDrJ+rZ/QFDM5nWbydHglqE1SnuTMpdgmQY/BWqqf7WZBde
	YJAOqO/nEMSTmcBxuwcBZOd0i5WpOeBOND+JSIVFWhEf3j9CFPtP7BmH
X-Gm-Gg: ATEYQzxKy5u3uZcf08vJn/ne/ASpe/VJyTQ18+ijzUYjEla2DLHBvWM3+TFwuogND3U
	z8flTvR7v4MpVCkgIjp9QwiemdDCZdmFucYRJ9AKXCgf985A7RPVfu7Sk/w+GN0v8cmTLKkB6xW
	ty6qRiHSnvypMGIrtDUUWtBUXYIy1VgfdDur12GLkY8pI4HMRY8gIX7xbrDtTADw4mxasRhk3bB
	NtyhwZmRCHVXw8tzPTnZpp45ytNT+d01GSep84fLGh/VKMP+1AVMxx4ktIudYEXagFpxWIBt0P+
	nmst78Ej9LsTFSs8H7PibIrMdKpIZD1947+sXzZtLtDCfvvyy53b0jpOUf457tAVKVme6el7L3f
	6hpvexgXoBS2+zx8ZyCPXvDLELH0upGihBEfhk3hh8/Fd/tKZa6tUcR5nsMHwnzNqCkaIM3ftQM
	1ps/KHbIaUEELPlf9lH50WqlZ9lfghP2w=
X-Received: by 2002:a05:6000:4387:b0:439:c279:32ea with SMTP id ffacd0b85a97d-439c27935b1mr3280566f8f.39.1772549560930;
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439b03db76bsm20531779f8f.18.2026.03.03.06.52.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Mar 2026 06:52:40 -0800 (PST)
Message-ID: <bddd7c86f5d9535ce5fe58e6271396da40750cb0.camel@gmail.com>
Subject: Re: [PATCH v2 3/4] hwmon: axi-fan: don't use driver_override as IRQ
 name
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org, 
	rafael@kernel.org, hanguidong02@gmail.com, ysato@users.sourceforge.jp, 
	dalias@libc.org, glaubitz@physik.fu-berlin.de, abelvesa@kernel.org, 
	srini@kernel.org, s.nawrocki@samsung.com, nuno.sa@analog.com
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	imx@lists.linux.dev, linux-hwmon@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, 	linux-sound@vger.kernel.org,
 linux-sh@vger.kernel.org
Date: Tue, 03 Mar 2026 14:53:24 +0000
In-Reply-To: <20260303115720.48783-4-dakr@kernel.org>
References: <20260303115720.48783-1-dakr@kernel.org>
	 <20260303115720.48783-4-dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Tue, 2026-03-03 at 12:53 +0100, Danilo Krummrich wrote:
> Do not use driver_override as IRQ name, as it is not guaranteed to point
> to a valid string; use NULL instead (which makes the devm IRQ helpers
> use dev_name()).
>=20
> Fixes: 8412b410fa5e ("hwmon: Support ADI Fan Control IP")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Reviewed-by: Nuno S=C3=A1 <nuno.sa@analog.com>

> =C2=A0drivers/hwmon/axi-fan-control.c | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/hwmon/axi-fan-control.c b/drivers/hwmon/axi-fan-cont=
rol.c
> index b7bb325c3ad9..01590dfa55e6 100644
> --- a/drivers/hwmon/axi-fan-control.c
> +++ b/drivers/hwmon/axi-fan-control.c
> @@ -507,7 +507,7 @@ static int axi_fan_control_probe(struct platform_devi=
ce *pdev)
> =C2=A0	ret =3D devm_request_threaded_irq(&pdev->dev, ctl->irq, NULL,
> =C2=A0					axi_fan_control_irq_handler,
> =C2=A0					IRQF_ONESHOT | IRQF_TRIGGER_HIGH,
> -					pdev->driver_override, ctl);
> +					NULL, ctl);
> =C2=A0	if (ret)
> =C2=A0		return dev_err_probe(&pdev->dev, ret,
> =C2=A0				=C2=A0=C2=A0=C2=A0=C2=A0 "failed to request an irq\n");
