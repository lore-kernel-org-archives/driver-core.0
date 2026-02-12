Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6E92882D3
	for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 19:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770925403; cv=pass; b=UeYj16Z92dOfhhtj48Cx0H0Zr5j718rqn7cnVsHqQKP1v5+hsOjoNvxldSPQjze+7PMssgzePcY9cM0C6eAle862izDyDfFOi1g1P5LGxaPqsDrnQ8+z1gvmD9vbRzUZkYMAG+jO5i0o15u8kBM8cohFx3L4TNp7J2TQYxw+j8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770925403; c=relaxed/simple;
	bh=Kpi8VTuPv12la3hlRcESDDvvbf16Gb36ZcVnMndVsyo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mHI4MiszKqUJNJelmOls71E6zfiXgbyZbF5eFkgUHuiJWNkzAB17egyrpuCxbzlYl7ROGbYY9XmiuUkV61k1YHUXWLi+CLaba/JPNTCgau5nBJWLuf+IY5Nr80pDTEa1yv/PozNp6Y+qwGx3xwT4V02agGYmgPX68I86jhrGWmk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjbQK9/F; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjbQK9/F"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-124a635476fso324864c88.0
        for <driver-core@lists.linux.dev>; Thu, 12 Feb 2026 11:43:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770925402; cv=none;
        d=google.com; s=arc-20240605;
        b=DEg/5kF4HQbExhmLxWAk6uQHRj6BZM4ir7LxaxI+n6KebE8SO+1WxxXxo+iIzvnX1F
         FRxAhwlI2c4mhzFz1UGbHp47vmm3OsvurifpEkaEOpsIOCJ7SHw9f8utgomX7MZWAvyA
         f1Z7OGmX0K6VpRpgQOwlevMt/ojFtGxsWdnuc1cLRNfMCJPIXkSRF/1Mo7imVnU1BF7+
         Nysr59sTxf0uW7XgPGMN6Ml7ocK8Z2snmy9XHBCnVliFBO3fqQiAimYn30FA4wJ2TUmf
         XlqpAKYetNgURww0G/ch9tbG5NYPovPMIfJ4ELjypHvTHlpDnz6okkXNgks0G/He5hn5
         ahKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        fh=jgL59M3BuIXnDO1K/Fi5Hk+MWPRR/Jv/9DksxAxCHbE=;
        b=KVgn/JOBK3sde+YVxyAIIm8WVGNQ8fX17ENksT/oT3rtffiN7yitLWf0CR/prQg8SA
         ooctk4FL46yqHg5B5L/kUWDW9n74vJbAwfPl1h+SNCrdzQXf1chsR3YhrllBj588EZpv
         wFpEn8Q4Q0z0mbkWNzPDFoNLMRPtP3BrfjrTNkxJ/GmmrEoTYbcGZxMzqHsBKesxYqZD
         d3Zlg1aXyIjdO7ZcehaaGEXlAbuPsuzVpJD9NhLIUNFp0mg7IZEmfOrrzYkSfypup/kL
         jYoZD+xKlejF8R4O8tEoz2YQpJ5faEdczzbkCCrpyJVTzdu/ioOnUqh9KNqsaA4OuCGd
         bRcw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770925402; x=1771530202; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=BjbQK9/FzLPvSLvMIcrX/vPh3Vm/fH84fL0jE6tFZ/rgZpFQU/afEE2nA+kxXg86Cu
         oq7x9dnp/ixFPusXgxwEM9lExdFIgk45NuGLWBQmEtcuVIrc1EwyivfwJEBAI87nzHwK
         NKWIKax5s6++sLAS47oIDFWzeR4wArtYj4VpdbstvtYps7bDlcBZvf7t7CLR5xZybUVx
         S+SkwsBS0RESJ1dLi6eWx1L+Ff7LNFzfZagn/9vW+clvnva0fgnqUuF6rD195/14C0vo
         vdNB4idfFwuQPDsuZJK711t3QAae1RUvH0GpSWoCjYPSFw80s8W+8+s1GGP7DtgLcxPi
         jKRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770925402; x=1771530202;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mpHRDkZlOYvBK1jMHMrk4jQz7fW7xddCyiPaMJKT8ts=;
        b=Nhpzlauq64mNE/6Sb569Pa9Y+n1oQ6gqCdQfM++uLxAq3oeua2zbojQocsmnj30On9
         36VmayT3nrdLDXgCSiHFBtHXRiWHMl4mx3ZQB1YOHYqyeyRwZuFKSJfafSNP4Qb+fkJs
         S2oGXe9BJ2Nlw3TXskO+Lx7bpM99wAu4pquCl/M/w9H9wnS1gUZA6lYT8NXkYJNFDGTi
         zZ5MdTMaI0eQ/7OMaXs/6EQnnkmk3zUysfJ7UgQqSrM17/ZKTabBzn5LHi3GzMhPJr84
         yNubku52mWp3aXcZmHec4VFezkUq01N4RIH41anIBjkVSRmdvNoGy3yXwh8rYANU4qB7
         W3VQ==
X-Forwarded-Encrypted: i=1; AJvYcCVAVfi/rsa6AvsA2NIeKQ1iIyUIe+B1cLAlUMVvSzLKwR7a1cR8QvwP4loKxq5qLJJGQbhfhH0p8okpYA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzIrfGoQdar2bYP0w4DmzW8RUdloSFh4OUIn0cAnm93YlKVjlVa
	VU2YfaNTizjzPDKryAz1s6P1gO4rm3H0v7qftaxfogNrW98UBn0IHGUFAEqT4/ZdR6hYf+I66sR
	weTlKLcllrTCiH1/DtJ+4lUdXL9/xgw0=
X-Gm-Gg: AZuq6aLGkd86OQ8JqNWYp7Lv2mFjhLxsl4GZ9mZrUi3kINtvtJAXrd28xb51/XX90s0
	c6AbmHeoFMAyMBj+ZjRr3hIo9XaFhWyB8en0JF2VDieqL92VSBXe0CAv9VoGeV/vvCDLEe7o5uq
	gGxh9s3l31pUSet3G0ZB/S+iTkNVM6iNWEdgxr97nxR5rNF+iPgz0AnBiQhTEKru4w/xzTzDAys
	9or95zXydP33mdbGEN3zn2PgYk1YnddzFOk5vFnJuET3f5z+6hVbEjzg/NIGsD9k2qlMzCcG2tq
	ZE3MX1E0WpTlCnQ8xaTzBtMKd0pk0Co4hkj+Z45L2rLRCpoFhJUKxRU29VYu2DDodHLV3nm56oQ
	szhpFl/Furi+vhsfyQ9y9VQ==
X-Received: by 2002:a05:7022:2218:b0:11b:9e5e:1a66 with SMTP id
 a92af1059eb24-127397b47a3mr48022c88.14.1770925401574; Thu, 12 Feb 2026
 11:43:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260211142321.55404-1-dakr@kernel.org> <10809444.nUPlyArG6x@steina-w>
 <9e33e5e5-76cd-4395-acb4-e2e03e436bf5@oss.nxp.com> <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
In-Reply-To: <DGD5O31G6G9X.R8G6EBXXFKAH@kernel.org>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 12 Feb 2026 21:43:07 +0200
X-Gm-Features: AZwV_Qi9zFnWs7AOJZOKq34_yl9qM1YaahPkhWTWEjwtIMb5KBMQENxC_CBtZ3Y
Message-ID: <CAEnQRZDMXhh-V6p6ovtmSTx2Gc2R8p=pHg8jOFgJ8i3TNNJT-g@mail.gmail.com>
Subject: Re: [PATCH] clk: scu/imx8qxp: do not register driver in probe()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Alexander Stein <alexander.stein@ew.tq-group.com>, abelvesa@kernel.org, peng.fan@nxp.com, 
	mturquette@baylibre.com, sboyd@kernel.org, Frank.Li@nxp.com, 
	s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, 
	gregkh@linuxfoundation.org, rafael@kernel.org, hanguidong02@gmail.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 12, 2026 at 7:22=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> On Wed Feb 11, 2026 at 3:59 PM CET, Daniel Baluta wrote:
> > On 2/11/26 16:43, Alexander Stein wrote:
> >> Am Mittwoch, 11. Februar 2026, 15:23:16 CET schrieb Danilo Krummrich:
> >>> +{
> >>> +   int ret;
> >>> +
> >>> +   ret =3D platform_driver_register(&imx8qxp_clk_driver);
> >>> +   if (ret)
> >>> +           return ret;
> >>> +
> >>> +   ret =3D imx_clk_scu_module_init();
> >>> +   if (ret)
> >>> +           platform_driver_unregister(&imx8qxp_clk_driver);
> >>> +
> >>> +   return ret;
> >>>
> > Also, because the logical flow is that CLK driver is uing SCU for calls=
 I would first call
> > imx_clk_scu_module_init and then register the imx8qxp_clk driver.
> >
> > But there is no functionality issues your your approach too, just a bet=
ter logical flow.
>
> I now remember why I kept it this way around. If we swap it we have to ca=
ll
> imx_clk_scu_module_exit() in the unwind path of imx8qxp_clk_init().
> Consequently, we'd have to drop __exit from imx_clk_scu_module_exit().
>
> Please let me know what you prefer.

I see. I prefer your initial implementation then maybe with an
explanation in the commit message.
