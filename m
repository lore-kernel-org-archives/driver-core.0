Received: from mail-ot1-f52.google.com (mail-ot1-f52.google.com [209.85.210.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942B03F20E7
	for <driver-core@lists.linux.dev>; Fri, 15 May 2026 07:54:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778831672; cv=pass; b=jNkxoXB9GD2bJSN4w1AKeH+EwSzfPS8rPb7P9ys3GT4MGU46M9GjOR5CT84m2QICU24JJK70g/HYiPkplc8jR71hG3MPM+p7xpzEXD/llBuKmmWxSfq+95AQno8ss1Yior4Y6O8l5nrO82MOp9PBFGwm2Y5Mlnh3uW5C/BIn/Fw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778831672; c=relaxed/simple;
	bh=NnAm2n/JLIRCk/X4BzmpX+diOi/39kzF1jC/6tqwOBs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SiKKN6pvS0+Y+79jWU/vTrZ3H7lkr6UA2EBaPngBsyq0pQ8mD62qK7WQBlbM7J06Gghbpd3/MKdlhtOAu4KfNNaQ/6+M2kKaefX141J8HmEeb6VxpB9m/n2YmLhSmStgLQvtxXDDvl3/0aoklW3KNDRKFRfumrKIWESaIg8fNjw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dgM41yNp; arc=pass smtp.client-ip=209.85.210.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dgM41yNp"
Received: by mail-ot1-f52.google.com with SMTP id 46e09a7af769-7dbcb45153cso1036155a34.3
        for <driver-core@lists.linux.dev>; Fri, 15 May 2026 00:54:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778831669; cv=none;
        d=google.com; s=arc-20240605;
        b=S1pwq1e6spBhad4b4wAhDVj74j1Jiv1+cx5UwiQzLyYztf3g0QHGrmtUOuHwjkqIWw
         FiA57uUGnf8W0p9O2X1NPiWFK7KUpqshP8o6gYBXRmaeBEMl4Lq2eYwJIH0JIExrreWC
         asH+eXi5WOktNa4c9nNVhzLxXbeOzFFD4jOLWSMbjXIJkBZy2nD0aNnu+vlzFSlqKk65
         X8gHqL1oUAwD3AygZaM8gnZSUQAuxK6hXaBmfEvsSd9MJhaDtkRAHH6r0BQCiQsxbe8X
         n8Q0PuSYVirn9ttuvxXlxsIrczENAmQXiDXYFulpBt1FpMhckRex8F3KjgAWkVKGMXBS
         jp2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=9uW9TqyzWwlmL9J++FVDFaWM/pD85rKSTbODz5Q0CCg=;
        fh=/oqC0WHY0h05MzxqShNViL6AGG0TROzd7lqsRVtHkDE=;
        b=j1Li20j2urYF66p0yUOCp4lWuyDPPzqxzUOcVAnIwufSokARqMnGTHDslQS5nCIS1H
         mIghRMFqgFS6w6BpoeNtX2lYy/dLAXuSSvZUt+WGVcPcXwYxO7AXuiFP9iz5jt9UTdFz
         jIwjziyaFwsLBXjKbMWqeNd4OEa3uYBBP5LfnjTEXKy2jDhrdjLJW9loeXcAupafQtnY
         F1cZ765uiLSz+jOiJ3ZoDLOckGjO/if+j3ja2/eEAtmzD4c83K73QOxDXit+7iu8aB/j
         O6R0SFuVQxIF8FgAyoNmOuhED6KroO7bXXHZ3l6o+PUYR7A+5WXddjb4MvGfGnWdS5bt
         YmTA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778831669; x=1779436469; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9uW9TqyzWwlmL9J++FVDFaWM/pD85rKSTbODz5Q0CCg=;
        b=dgM41yNp3FSNpW5qJmrs+qd2NkvD23hqhkJ0YpDnzpZF6lc+CEBqBQAHpXmV9JB4Fo
         c/i0yaaGJTDutj8sHUDTYdkxbvywFe46K8/DRM/7I1/wX5aJvIUP0qzRhhTAZu/lwKPq
         uCYNnVpveESKZVaJGxFVdrv0eqr3D51j4/hs+zoilMt0NelDUChLkkME1C2tzthoC56T
         28aNLSveV88Uc7v81A2g3JZKWTiZ1TA64DtXXKfPswFkw5EEvXJt6PWAgbiZXHxh7Fkt
         7M9rE4wW6p4ShARXv/5wnNprLdYWfGWopZ+0eSgPPGHRNtEbL+tHSmcAT4JO20uc9gRP
         KHrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778831669; x=1779436469;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9uW9TqyzWwlmL9J++FVDFaWM/pD85rKSTbODz5Q0CCg=;
        b=Q8Zrd5sq1+RoY8na9wlbflRBMnQ8Xh0Zg011iMDgEYh3HP5Z5jP+3JcZTY6QQaN4Zs
         JHaBDcYrqdm1SI67sAr/0TZAvlbH0k+v4Z/zIvv7QxrIF0EKldHwA/KkTvN1PWJjsFsh
         yFfvTw82WGxHVHJfLLKE3D028UR0WTBkgMnrrLr0hwqGlm9ZBrkUIBGnqOF7aYi6pwPN
         /Sz/6HUjzKYzvZOnyhz6wWMZ/eZMswhhxQwIZGmmmTxkhJbRTVW16tTHjrRTeG9OKxYS
         K6YGxmleRox3spESV6/8nsX5MH6CZBnJAq/4MYbC9kFt/qpW60Mj7dE87csdPf6eRZCJ
         YDiQ==
X-Forwarded-Encrypted: i=1; AFNElJ/lnTX85dkNcUDQr14pKFwviJGifxB1DOLWJVCYyuWPCN9Uv2jY9l84QBuEja9nQcwbKySeGW2Ud2o1pQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5rGgnH57jNfthBTBTcBtIx6ELvANNb6T7g6dpYTo71nAsJ9CL
	ldSFLnVn35RF1BSOJpV+ClVmbDMDC7CyiTi9aWmk+AYx5BW/OuYOZO5k92QUjRAR6eZyZdONoxe
	VsCurJzLMqI/yYpP2JtXPhot/HyXibXA=
X-Gm-Gg: Acq92OGzlYrM6iiELLybGb8sBVIr24K0j10g/2Sw9MAFwqBF0wGxp174ysv/whtUF3v
	ceLWdzTDnmr5LqxX3C4Y20+LWNvC6FNYHcN764yfeCBQ8PbR3gARiamVc8VhEuvL+SQ5KnpyE/1
	RpR6WgjBUrdgDpFjYZaBc6IBq+UGyNEx2abuypHT47QtGVt6WF+sUSYIHhqv8izT5E+zC35As23
	bHuoLcmDPVPKP0QqnCmcrHmwdH6fj8qrpaVX1rivn55aK+TQ9fa6Eevywfm1uCVzB8NdWCYU+rv
	0nh/MxoK
X-Received: by 2002:a05:6871:2b1b:b0:417:2454:278d with SMTP id
 586e51a60fabf-43a2dd1cf16mr1181750fac.4.1778831669438; Fri, 15 May 2026
 00:54:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514094955.76305-1-jianlv@ebay.com> <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com>
 <2026051406-corridor-equation-c50e@gregkh> <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
 <2026051532-pettiness-gave-1127@gregkh>
In-Reply-To: <2026051532-pettiness-gave-1127@gregkh>
From: Jianlin Lv <iecedge@gmail.com>
Date: Fri, 15 May 2026 15:54:17 +0800
X-Gm-Features: AVHnY4Kopsm-UaM55dghPQ8QvaJfAEgnSvk2X6VP6ZRZrUgv1ir9UpJfD-Z2WB0
Message-ID: <CAFA-uR8Jj+MJaauAeEUoS+OfuudrV8C4mG2we-nd7-Cvofokhw@mail.gmail.com>
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, May 15, 2026 at 2:13=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, May 14, 2026 at 11:09:03PM +0800, Jianlin Lv wrote:
> > On Thu, May 14, 2026 at 9:49=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> > > > On Thu, May 14, 2026 at 6:16=E2=80=AFPM Greg KH <gregkh@linuxfounda=
tion.org> wrote:
> > > > >
> > > > > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > > > > From: Jianlin Lv <iecedge@gmail.com>
> > > > > >
> > > > > > Device drivers that use asynchronous probing can cause non-dete=
rministic
> > > > > > device ordering and naming across reboots. A typical example is=
 storage
> > > > > > drivers (like sd/nvme): asynchronous probing can lead to incons=
istent disk
> > > > > > logical names after reboot. In scenarios where disk naming cons=
istency is
> > > > > > critical, the probe type should be set to synchronous.
> > > > > >
> > > > > > This patch introduces a driver_probe kernel parameter that over=
rides any
> > > > > > driver's hard-coded probe type settings and allows runtime cont=
rol without
> > > > > > requiring kernel recompilation:
> > > > > >
> > > > > >   driver_probe=3DPROBE_TYPE_SYNC,nvme,sd      # Force specific =
drivers sync
> > > > > >   driver_probe=3DPROBE_TYPE_ASYNC,*,usb       # Force all async=
 except usb
> > > > > >   driver_probe=3DPROBE_TYPE_SYNC,*            # Force all drive=
rs synchronous
> > > > > >
> > > > > > The implementation replaces the limited driver_async_probe para=
meter with
> > > > > > a more flexible interface that can force either synchronous or =
asynchronous
> > > > > > probing as needed.
> > > > > >
> > > > > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > > > > ---
> > > > > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > > > > >  drivers/base/dd.c                             | 71 +++++++++++=
+++-----
> > > > > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > > > > >
> > > > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/=
Documentation/admin-guide/kernel-parameters.txt
> > > > > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > > > > >                       it becomes active and is searched during =
signature
> > > > > >                       verification.
> > > > > >
> > > > > > -     driver_async_probe=3D  [KNL]
> > > > > > -                     List of driver names to be probed asynchr=
onously. *
> > > > > > -                     matches with all driver names. If * is sp=
ecified, the
> > > > > > -                     rest of the listed driver names are those=
 that will NOT
> > > > > > -                     match the *.
> > > > > > -                     Format: <driver_name1>,<driver_name2>...
> > > > >
> > > > > You can not remove an existing user/kernel api, sorry, that is no=
t
> > > > > allowed as you just broke all systems that were relying on this :=
(
> > > > >
> > > > Could you provide more suggestions on how to improve this patch?
> > >
> > > Not really, sorry, I don't think this is a change that should be done=
 at
> > > all.  disk naming is a long-solved issue, to think that you can fix t=
hat
> > > by doing sync/async device probing is not understanding both the issu=
es
> > > involved, and how we solved it already :)
> >
> > Do you mean referencing disks via by-path/by-id?
>
> No, use something that does not change, like filesystem labels or
> serial numbers, or something else that is guaranteed unique.
>
> > In our production env
> > they can also be unstable; this is an example I encountered before:
> > https://lore.kernel.org/all/CAFA-uR_jk6jCmf9DTebSVBRwtoLuXuyvf1Biq+OObq=
RVAOZbBw@mail.gmail.com/
>
> Yes, paths can, and will, change.  Don't use them.
>
> Why not use a UUID, that is explicitly what those are designed for.

For cloud deployment, the local volume provisioner detects
and creates PVs for each local disk on the host, and it cleans up
the disks when they are released.
The local volume provisioner is deployed in the cluster as
DaemonSet.  For the same SKU, it uses a single, unified configuration
file to initialize local disks. In this scenario, UUIDs are not applicable.
In our case, logical names are used to identify the disk.

>
> > I understand that device naming in the kernel can change at any time. H=
owever,
> > Is it necessary to provide an interface that allows users to choose
> > the probe mode themselves?
>
> It's not going to solve your problem, so I wouldn't worry about it.  And
> you can't remove it, although I really would like to :)

OK=EF=BC=8CIs the reason we can=E2=80=99t change the priority of driver_asy=
nc_probe setting that
the original logic has changed, i.e. it would alter the original behavior?

Regards,
Jianlin
>
> thanks,
>
> greg k-h
