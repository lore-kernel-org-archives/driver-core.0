Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D97C3E0251
	for <driver-core@lists.linux.dev>; Thu, 14 May 2026 15:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778771360; cv=pass; b=Fl+FXrkHcgPrgkBMsivT9fVE9enIwquz8kDhemGp21ktf/TqV8X+X2e+UhQh16NTo8x2Y1eTVhApXlLTPc1LqmAvItgsrJDbsHFLFRBIXFXZZwVs9RM8upblvI79Qd/pUBoTNADAylhROhLpNJ9D/U6NxJx49mON+rrZktAstfQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778771360; c=relaxed/simple;
	bh=9VWkUyUAPDFo9IHMN2LN9rQ2SLm6OqvalmrrIvc1kBU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=UjDPcmjwYCxib1Yc6z8tp+El42f4fQAHxB68ySvsZ5Ok0F+56OK2zjh56VCQO/sTxWZusvmJKzWXyEi+4vskG/cBdq5bZEWSTmj/FWn/1vz2C/4dV49KW3sdjBdU9J88byXof3eU8FZjBXgA+h/86esVqG9+0RJ48U2iP8KGw3M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S7boWmyJ; arc=pass smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S7boWmyJ"
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-7dbc5ba0661so1198333a34.3
        for <driver-core@lists.linux.dev>; Thu, 14 May 2026 08:09:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778771356; cv=none;
        d=google.com; s=arc-20240605;
        b=Nbfd1RF2C++0l899LDRAUBXFbYiztR+aIhVfzKwNMRZER9Of02f54RJBc4Hv87CeDJ
         SMvntIe8j75iRMfSpaUt6pv+Iw9U4LheN2HyNbVdHGFSlTcvAzCaA46EghqlBXuk+PUw
         G657zQZ83lYBejVylviJz2+8fs7aYSgBaA4asz2MBpzcPrd6NPuTugQEGGHJ5cvZDOsR
         ncg/v6JIcQ7yNz77GGvH8pjv7MaDPdwFMF9NKV8bIyp0zFT1tGlX0/Sp1CziqNRxzZaQ
         1cKbkKfjEc8hSZmaOwF3SUR0VT8mbTq+17ca4W9cJXZTyKTcRsT9WzyPFd7DcqAuSBnZ
         3FMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ESax1I69XZe2pTasflsIowumfd1TUPTULL6KM+u28lk=;
        fh=ztoCpbPMP9recKD2Fr9NrDqtv3SaX/ESEx4kUFIIZzg=;
        b=CdrVKAmVkdJfb6WAh6gZQlkvwkraHmd5l+K/RCTHse1PwXsgB49TIaArppWBr48Hpv
         o9nCxDmedmbChGGlAGCCi17mmNWT3EIrv6ITqt1obYhAkl73WyG5oIAZublndik8Lz/c
         G03kqdHesnxEjt/r1htNFjFj56wSr1Xwhskx22KyXThspfBGqybdrL4tztkJ0OTPjK82
         n9kYxFidXwEFUb9ME8t/2w7dlFJw09Nl/UmqtPIMsMAxlfwEIhPTihuTa6LWTDlrhuex
         wkCozGpeqSxeP33gNDlVxbrG9mCJBa6qSPW2uFCyKBT1opxqRB0T1J/zlEwMb2bhAO+T
         qyvw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778771356; x=1779376156; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ESax1I69XZe2pTasflsIowumfd1TUPTULL6KM+u28lk=;
        b=S7boWmyJspf3wuy3uL6YJ8PJW9TI7UHBYMHFyZCD0NoQA1NNF/h8kJGEkBMRR/Uy0B
         LvrCJtLt2iPQoIov0d2OO5JIiYvnaabOYS7VFyx71EKYiGm/6oVF7XZGXoYUoLI7wzez
         nBbBzDM4yGRrqnBzYtsGLPO5nehX6IN4vgcxSwaRXG/dojTMiJwyYG5EMGzj5BC1xTP+
         6DyaD+HDY7a000dXrA5PYoEdwsH9sheEq4T0bsyaYAW/Nc3eBU1LiPdkRmmAbSGQ0KZC
         jli0V4paGE2AI1ESorj22LhnUkwcbtSzEkrnAixvchVnRy24S/AelnP2/DSjy7saeOMj
         VuOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778771356; x=1779376156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ESax1I69XZe2pTasflsIowumfd1TUPTULL6KM+u28lk=;
        b=dBcEs0PQt72Yb5LKrFw2F5Emd1sN+XEHXaoeIR3+5IAqCxopxTG9ThMK3JDJKqB5su
         bTZH5N9x1xhdN1cVys1LmSk5y5Ys2I2f0NhOu+d5lYRo0G9X29x6l6gvBfSFwpbfZ6AW
         xalYEhV9/x2AoKDJUEPj+8FLZZJPpZ754TDcBxAkMSDes4BPTGbkCvvq5Wpt1tci8riP
         XFnx6l7vrifsHYWMTmHNWf9N6JhgnxzYHiddh3qYmoqL0zkKIk3efBsNZt3PpYeVXxnh
         k7Vag9Ncfgohcievid8P/lB3vflqbVVefUKL0zRZ0usntTMNvLHtJBRHRDil5Lz3ZWi/
         A44g==
X-Forwarded-Encrypted: i=1; AFNElJ93Cr8NgrX3fWRUOfDvnsNwbsmabETzJMox2outujoz1sSXk96uJPJAuW2eW1yW/Xz5Qzu+r8Mn02rHuQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbWBc0AxKwSpfxjGQA3SeQTFm09I1SdCgLnCUfXRg1AIlkngyx
	6+CBKivf1bYGeKYtwWnZIV/Fp4hSYQVwTqNPLRpp4ucj4JSGDeccvfRNfeZ79mmzdoTK1cjNKat
	40CFT35qfhJloyql9CZ00fNsCB7YhNZk=
X-Gm-Gg: Acq92OGCebutsOjR3zVOqHY2WwrR9qZnAFVWarvEnhofyT4NucPn0jcoPSJjSvET10f
	E1GKpkW9Le0ZiUakg0UbWtYYG1NFFThOrf5ts6Or5ago8G65HFCh3iusnP1GCfeVtPsX2q0/h36
	DaHQsGmbwdjW+rL1kx0zSVLi0j5CWQPWWAip4gmLTsyvhP8dEM5wCjUnSJWnVglloLAlPcVvBYQ
	wffOQsTGOVwEzeDimSdC0X+vDDJ6fIe4JlTdYSmBefKZjDcGC6DeOcE7Qzlj/mdwt/ESxj3k5Ka
	raRZ6JseLBXVuGN5LfM=
X-Received: by 2002:a05:6808:1641:b0:467:53b0:b44d with SMTP id
 5614622812f47-482b2d31b1bmr3042378b6e.5.1778771356079; Thu, 14 May 2026
 08:09:16 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260514094955.76305-1-jianlv@ebay.com> <2026051443-exuberant-important-534f@gregkh>
 <CAFA-uR93Wf2ALpYnnU79kruv7XO=uFePqioaEXNNEfrUtRw2xQ@mail.gmail.com> <2026051406-corridor-equation-c50e@gregkh>
In-Reply-To: <2026051406-corridor-equation-c50e@gregkh>
From: Jianlin Lv <iecedge@gmail.com>
Date: Thu, 14 May 2026 23:09:03 +0800
X-Gm-Features: AVHnY4J2dkhFy6eGlghPANY01Lmp0sHVjJRnqMskvc_iSu6OzpshOwPJLL8rs3c
Message-ID: <CAFA-uR9=rHPbiVFYgDBAdRHCoujKjqtTxsMVupEwGhGmXoLw8w@mail.gmail.com>
Subject: Re: [PATCH] driver core: Add cmdline option to force probe type
To: Greg KH <gregkh@linuxfoundation.org>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, rafael@kernel.org, 
	dakr@kernel.org, jianlv@ebay.com, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 14, 2026 at 9:49=E2=80=AFPM Greg KH <gregkh@linuxfoundation.org=
> wrote:
>
> On Thu, May 14, 2026 at 09:35:08PM +0800, Jianlin Lv wrote:
> > On Thu, May 14, 2026 at 6:16=E2=80=AFPM Greg KH <gregkh@linuxfoundation=
.org> wrote:
> > >
> > > On Thu, May 14, 2026 at 05:49:55PM +0800, Jianlin Lv wrote:
> > > > From: Jianlin Lv <iecedge@gmail.com>
> > > >
> > > > Device drivers that use asynchronous probing can cause non-determin=
istic
> > > > device ordering and naming across reboots. A typical example is sto=
rage
> > > > drivers (like sd/nvme): asynchronous probing can lead to inconsiste=
nt disk
> > > > logical names after reboot. In scenarios where disk naming consiste=
ncy is
> > > > critical, the probe type should be set to synchronous.
> > > >
> > > > This patch introduces a driver_probe kernel parameter that override=
s any
> > > > driver's hard-coded probe type settings and allows runtime control =
without
> > > > requiring kernel recompilation:
> > > >
> > > >   driver_probe=3DPROBE_TYPE_SYNC,nvme,sd      # Force specific driv=
ers sync
> > > >   driver_probe=3DPROBE_TYPE_ASYNC,*,usb       # Force all async exc=
ept usb
> > > >   driver_probe=3DPROBE_TYPE_SYNC,*            # Force all drivers s=
ynchronous
> > > >
> > > > The implementation replaces the limited driver_async_probe paramete=
r with
> > > > a more flexible interface that can force either synchronous or asyn=
chronous
> > > > probing as needed.
> > > >
> > > > Signed-off-by: Jianlin Lv <iecedge@gmail.com>
> > > > ---
> > > >  .../admin-guide/kernel-parameters.txt         | 27 +++++--
> > > >  drivers/base/dd.c                             | 71 ++++++++++++++-=
----
> > > >  2 files changed, 74 insertions(+), 24 deletions(-)
> > > >
> > > > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Docu=
mentation/admin-guide/kernel-parameters.txt
> > > > index 4d0f545fb3ec..b43a8bd20356 100644
> > > > --- a/Documentation/admin-guide/kernel-parameters.txt
> > > > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > > > @@ -1377,12 +1377,27 @@ Kernel parameters
> > > >                       it becomes active and is searched during sign=
ature
> > > >                       verification.
> > > >
> > > > -     driver_async_probe=3D  [KNL]
> > > > -                     List of driver names to be probed asynchronou=
sly. *
> > > > -                     matches with all driver names. If * is specif=
ied, the
> > > > -                     rest of the listed driver names are those tha=
t will NOT
> > > > -                     match the *.
> > > > -                     Format: <driver_name1>,<driver_name2>...
> > >
> > > You can not remove an existing user/kernel api, sorry, that is not
> > > allowed as you just broke all systems that were relying on this :(
> > >
> > Could you provide more suggestions on how to improve this patch?
>
> Not really, sorry, I don't think this is a change that should be done at
> all.  disk naming is a long-solved issue, to think that you can fix that
> by doing sync/async device probing is not understanding both the issues
> involved, and how we solved it already :)

Do you mean referencing disks via by-path/by-id? In our production env
they can also be unstable; this is an example I encountered before:
https://lore.kernel.org/all/CAFA-uR_jk6jCmf9DTebSVBRwtoLuXuyvf1Biq+OObqRVAO=
ZbBw@mail.gmail.com/

I understand that device naming in the kernel can change at any time. Howev=
er,
Is it necessary to provide an interface that allows users to choose
the probe mode themselves?
Currently, driver_async_probe has lower priority than the drivers=E2=80=99
hard-coded probe_type settings.
Could we adjust the code as follows so that driver_async_probe has the
highest priority?

 static bool driver_allows_async_probing(const struct device_driver *drv)
 {
+       if (cmdline_requested_async_probing(drv->name))
+                        return true;
+
        switch (drv->probe_type) {
        case PROBE_PREFER_ASYNCHRONOUS:
                return true;
@@ -876,9 +879,6 @@ static bool driver_allows_async_probing(const
struct device_driver *drv)
                return false;

        default:
-               if (cmdline_requested_async_probing(drv->name))
-                       return true;
-
                if (module_requested_async_probing(drv->owner))

Jianlin

>
> Hint, never count on block device, or any device, names to be the same
> across reboots.  That has NEVER been guaranteed on systems built in the
> past 20+ years.
>
> Please, just use the existing solutions, no new command line option
> should ever be needed here.
>
> thanks,
>
> greg k-h
