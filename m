Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E1332E4257
	for <driver-core@lists.linux.dev>; Thu, 28 May 2026 19:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779997470; cv=pass; b=Cc/a4nOstWLOI9nGSgrONfk4YtLpsHcW5MMLnPktHfvJl4j6GxzDc5olN0YhiPwKR0t6GEtpf5LQBfhkuE2XRTpORS/eIxuraOpGk0JddV+HqykPVx6wYzpt50h0QsguuR866lYktXmOakYo5hSdpX5WWNcZ/8fWHaonu+9vAiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779997470; c=relaxed/simple;
	bh=PggOqUDZGTqaCUwLJ5yG3wgs9SWaOxkXoLqlLnJNbms=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B3LcGGMcT5a9bLp9aUrK06uqxguPxviBMBRP15pCxD+hF1KDkS8mVuz5GAwng1VNKBm24Dvo3ET87LqO80XTIxB6Ewfuhx2OpemWYNRPpNoqePWLDV+H9Y2IqBUpNFvAdMEEKNX0TaFUqOEazruEY1A/k4jgi97X0u//lrHJCqw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nkDW9wwY; arc=pass smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nkDW9wwY"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2b46da8c48eso2495ad.1
        for <driver-core@lists.linux.dev>; Thu, 28 May 2026 12:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779997468; cv=none;
        d=google.com; s=arc-20240605;
        b=JBgq2Pr5tA2xRlr+hd1nOjGzaxkUoveYu3P9UQac/+ss3z7wnXv3wrJH6nookcstex
         MYnC0IB0qCbRcNpyskASvG+o/dWtAo4rUEsVB76gBsKtLkFytEdqmL/aTtUc27va7XjW
         YrprqQinZxCp27wrVFCBpvA1P2N7t7+5xN/70Gzb+VQn2ZBBZ20qtOFviG02oatHg9jj
         HrI3wTWAELu+exhhed4F3v0qYYkOIhUM7s+MvooB88X16CShi9FonxcVeaArj3Wng7A8
         OsugkIurD6/kERxOOrQ/2oTs/9dG4QzX84HQABdlmlqlfk7EGN4ABs8DIY4n2Hb6qOr3
         w/Aw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8IynHu/DX5NF0G96SeXwK1qnUut5hZzt9g6fKpDU65E=;
        fh=8tUM+JE+siac2EgVQjaUSAqx6VS+88WUTtE8HMA8dQI=;
        b=HH9hSFeE75lktsZRbB8UQclb9w0J313SDvv3qvMZgKnQHF1DVu6cRMZkhQAtYW0i7J
         XbAmshQ6HGtBFETqo9n9pBldEPQgyNczJS/moHUqBFQpG2cy9C11YwRZbN8tVPXvGUN8
         brtfje4F33Rv38PkZX0E0l6R7tJtIhWk4FvJIupRkgdbgcO3fn3zP4J4hQvrJnh49HFQ
         5hKGlilS0f6dfUs2vTHu9JC+FIj/+v1wnB6c/9BQvgzX+u/YWQ4opSWDCCGd6mk39YTZ
         DMCGnEbioGonRw93GsxBLVIH0Uadf7B5j8okLSZsJftuDVOjZlxp60y6MyQr3y5WeY/V
         Da6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779997468; x=1780602268; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8IynHu/DX5NF0G96SeXwK1qnUut5hZzt9g6fKpDU65E=;
        b=nkDW9wwYj55lL7hMzW5T5lMr679Bx6AyU6aGHx5ZxsJg85YBzYSUUSkRWaFKPDhqdl
         8C3s5HDzDMDtOVOJFBh1sPNVVHhLj84RbsS3kCCJLz1GuuNCSkhil1FDoY99NYJ0UoLy
         Iyqqk9fnq6Bwx1euzUhv0DC2OcpDCmdNjBKmnSLI2TDe1hyiq8K6pxSIDTxqmeA7poHi
         jG8MC69J/qZERvCs8Y2o8EdzfNM16aST6Z2xeg92eG1WefKNrhY+ewWDqNjOeXQJ8f0P
         cIExQYFtb+VBtM31nrDjK2goKIDEKpprsjA3OMk80GauZXpjV8UKm1oxF91busEygM6Z
         DINw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779997468; x=1780602268;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8IynHu/DX5NF0G96SeXwK1qnUut5hZzt9g6fKpDU65E=;
        b=qS6WdkqWyX01H1RVvY1IlyjauLuIHTpWh5m6E5CDZdjHDEfFy/X4JaNnHqs5Eoba/B
         n2IdFu+R49WYj3pvwchYbozipYSP6v/EPPl0ia1bIFl/hHakEjbcUWWJDnLoYnVOKEBE
         PybqCg+8+b+yhoxkwrlfs+YBqNBjSEoRE+7079O/NW9fudIDe4hGdKJp0pbeZyq+b18n
         cwKivTCpf/Yy2PVIL/slEJPRV5HCFOXIfoDyv5YMMXvBwstBD+8AjWBHmMfrcc5lbgIG
         9dV7lFJS7NcM0o6lw0zfoAIpSDWbOwLQ7reHpG3l3n/+GDB61DQJI8wrKagfmTcXd8so
         +gXA==
X-Forwarded-Encrypted: i=1; AFNElJ8LkPXItxUhy8lm2kJQ9qoojRdia+5ihqEWxyAZjVO9gOIqr6/t6668c6XKEADz0SjaGm1S0CBiP2OYIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrO6AGxpUkoCjqslvalfri5VNQmADeOBV/NxRYtxgeD44ZIl9T
	myw0QuGqpKS/xr/t2oNKPltq6ypODL6wN5w6GDy7TWfbHcgXwil4Q0zRkFop9d7/sTrSAqsJEST
	h9NSGnZ9YOVZkOIaYpMyfNPU6jX6Tk34KnY+U/8XF
X-Gm-Gg: Acq92OFD6n/19VT6d2JvXXeT7s+QazqXDM/VZE+35PV/v1vbn1U9S2ei+iK6+FYzHuj
	+IfIzHh2zCQ1TRrnsmnop8kNsqLsMzTo2AxSbWOe+Evgi4C2JvfIBrySglX/nMSP1k3rpsb445q
	dA/os8orDDFkXT195bUjFvXSgvUzR1A1uCc2HJy0amp2MwC8bMeMkY9FSmvMXfZMRMJfxoxWFrv
	I8VLol5byOoCGc5V/Y5aq9QfG6d5ja8Bls3WSrlR0/GjxEVzh/NRGVfZ8abJkTCxmfu0QOAfyx4
	DcFaftxDYOOcqUIco18=
X-Received: by 2002:a17:902:f64b:b0:2bd:3bfd:74f1 with SMTP id
 d9443c01a7336-2bf1fb9d40amr92235ad.2.1779997467341; Thu, 28 May 2026 12:44:27
 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260528183625.870813-1-ynorov@nvidia.com> <20260528121806.2b54606ba6e42f7f371d95c3@linux-foundation.org>
 <ahiW5LKLiPMC6il_@yury> <20260528122903.cf74cf905418ab2d144607c3@linux-foundation.org>
 <ahiYUr0dO_dhOHTU@yury>
In-Reply-To: <ahiYUr0dO_dhOHTU@yury>
From: Ian Rogers <irogers@google.com>
Date: Thu, 28 May 2026 12:44:15 -0700
X-Gm-Features: AVHnY4KU3_bl6PIogc_loULa1uZ5IugP9iETmiYVnKICvK-frgUxDB4nRARXI20
Message-ID: <CAP-5=fXXg+PqH7EZ8X599CKYFWCwQgyH2H-4-+5M3_b9w_dTNw@mail.gmail.com>
Subject: Re: [PATCH 00/16] lib/cpumask: get rid of cpumap_print_to_pagebuf()
To: Yury Norov <ynorov@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Rasmus Villemoes <linux@rasmusvillemoes.dk>, 
	Russell King <linux@armlinux.org.uk>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, James Clark <james.clark@linaro.org>, 
	Thomas Gleixner <tglx@kernel.org>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, "H. Peter Anvin" <hpa@zytor.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Danilo Krummrich <dakr@kernel.org>, 
	Chanwoo Choi <cw00.choi@samsung.com>, MyungJoo Ham <myungjoo.ham@samsung.com>, 
	Kyungmin Park <kyungmin.park@samsung.com>, Heiko Stuebner <heiko@sntech.de>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Xu Yilun <yilun.xu@intel.com>, Tom Rix <trix@redhat.com>, 
	Moritz Fischer <mdf@kernel.org>, Yicong Yang <yangyicong@hisilicon.com>, 
	Jonathan Cameron <jic23@kernel.org>, 
	Dennis Dalessandro <dennis.dalessandro@cornelisnetworks.com>, Jason Gunthorpe <jgg@ziepe.ca>, 
	Leon Romanovsky <leon@kernel.org>, Dan Williams <djbw@kernel.org>, 
	Vishal Verma <vishal.l.verma@intel.com>, Dave Jiang <dave.jiang@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	Shuai Xue <xueshuai@linux.alibaba.com>, Will Deacon <will@kernel.org>, 
	Jiucheng Xu <jiucheng.xu@amlogic.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Jing Zhang <renyu.zj@linux.alibaba.com>, Xu Yang <xu.yang_2@nxp.com>, 
	Linu Cherian <lcherian@marvell.com>, Gowthami Thiagarajan <gthiagarajan@marvell.com>, 
	Ji Sheng Teoh <jisheng.teoh@starfivetech.com>, Khuong Dinh <khuong@os.amperecomputing.com>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Yury Norov <yury.norov@gmail.com>, Kees Cook <kees@kernel.org>, 
	=?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
	Aboorva Devarajan <aboorvad@linux.ibm.com>, "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>, 
	Ilkka Koskinen <ilkka@os.amperecomputing.com>, Besar Wicaksono <bwicaksono@nvidia.com>, 
	Ma Ke <make24@iscas.ac.cn>, Chengwen Feng <fengchengwen@huawei.com>, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-perf-users@vger.kernel.org, linux-acpi@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org, 
	linux-rockchip@lists.infradead.org, linux-fpga@vger.kernel.org, 
	linux-rdma@vger.kernel.org, nvdimm@lists.linux.dev, linux-pci@vger.kernel.org, 
	linux-amlogic@lists.infradead.org, linux-cxl@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, Roman Gushchin <roman.gushchin@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 28, 2026 at 12:32=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wro=
te:
>
> On Thu, May 28, 2026 at 12:29:03PM -0700, Andrew Morton wrote:
> > On Thu, 28 May 2026 15:26:28 -0400 Yury Norov <ynorov@nvidia.com> wrote=
:
> >
> > > On Thu, May 28, 2026 at 12:18:06PM -0700, Andrew Morton wrote:
> > > > On Thu, 28 May 2026 14:36:07 -0400 Yury Norov <ynorov@nvidia.com> w=
rote:
> > > >
> > > > > cpumap_print_to_pagebuf() is the equivalent for the "&*pb[l]" not=
ation
> > > > > in printk-like functions. In some cases, it makes people to creat=
e
> > > > > temporary buffers for the printed cpumasks, where it can be avoid=
ed.
> > > > >
> > > > > Get rid of it in a favor of more standard printing API.
> > > > >
> > > > > Each patch, except for the last one, is independent and may be mo=
ved with
> > > > > the corresponding subsystem. Or I can take it in bitmap-for-next,=
 at
> > > > > maintainers' discretion.
> > > > >
> > > > > On top of bitmap-for-next.
> > > >
> > > > Sashiko doesn't attempt bitmap-for-next, so it couldn't apply this =
series.
> > > >   https://sashiko.dev/#/patchset/20260528183625.870813-1-ynorov@nvi=
dia.com
> > >
> > > OK... What should I do about that?
> >
> > Rebase onto something which Sashiko *does* attempt.  Mainline, a few
> > mm.git branches.  Maybe linux-next.
>
> Is Sashiko a new mandatory requirement now? Documentation doesn't even
> mention the bot.
>
> > Roman, is there a list of trees/branches which Sashiko tries to apply
> > series to?
>
> Hi Roman,
>
> Can you add bitmap-for-next in the list?

Fwiw, you can see the list of branches attempted and the SHA they are
at in the Baseline drop down:

Baseline Status Log
tip/x86/core (0f61b1860cc3f52aef9036d7235ed1f017632193) Failed View Log
powerpc/HEAD (6916d5703ddf9a38f1f6c2cc793381a24ee914c6) Failed View Log
chanwoo/HEAD (7fd2df204f342fc17d1a0bfcd474b24232fb0f32) Failed View Log
linux-arm/HEAD (dd6c438c3e64a5ff0b5d7e78f7f9be547803ef1b) Failed View Log
linux-pm/HEAD (e7ae89a0c97ce2b68b0983cd01eda67cf373517d) Failed View Log
linux-fpga/HEAD Failed View Log
pci/HEAD (254f49634ee16a731174d2ae34bc50bd5f45e731) Failed View Log
linux-pm/thermal (21c315342b81526874acfa311f11b3f72bed4e14) Failed View Log
rdma/HEAD (67464f388d52ec172be62c99fc43697437ffa384) Failed View Log
linux-next/HEAD (f7af91adc230aa99e23330ecf85bc9badd9780ad) Failed View Log
HEAD (917719c412c48687d4a176965d1fa35320ec457c) Failed View Log

Thanks,
Ian
