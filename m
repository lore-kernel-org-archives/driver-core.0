Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A8FC3BE636
	for <driver-core@lists.linux.dev>; Tue,  5 May 2026 08:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777970919; cv=pass; b=JP7qtNgPOu+5OXzQKYGEGmCDwWz2LHyzoYrJAMPmAh3WnQX12OJzej6Zt54R46Zh2UOkWvLehpfKwXpEoejXGpprtTrSo1XilI4PAkLw8sDKtyPWEq36eSZCP4VbJ92svQICZ9fmgr7soR9SkOR8o79XFfotO0ux0mw3HGzHWUs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777970919; c=relaxed/simple;
	bh=oXP7Q9PEWRCYGqRxo/nb7s27Xpd4sVylWQvYZRpHUjk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lRXiGEOn5QqN3dy8Owy2OJxXYdqKBfZRjP2p8bAMIGUOYR2GG60bjYaaTjYh6vonEOyj/4O8bg/X9h54HFqHXEXMCHuPnamjS34wBbfeJFugHG9Q/goqL9j1fzhi4LNS20+RdldXWlX+TIIEQP51bUp+TonuvEbXr5JNhJGx3/A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FCAm6Olf; arc=pass smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FCAm6Olf"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-651bf695701so4914218d50.2
        for <driver-core@lists.linux.dev>; Tue, 05 May 2026 01:48:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777970916; cv=none;
        d=google.com; s=arc-20240605;
        b=AkoySdUeaPxuiL2rFCHSb9wJUlzdCtvvxrJI6B6sO4toQW1HGD2bx1LZxQqcMZjWtg
         F2JzaAsGg81jdpIq71FnpOdNVh+KOWNvMDok3AYPHZKYdnypAjirvX1yflU0UdbTwoN9
         aqzcdhFyhuF5q0xArtwwQAZNGFepTDxkHQrDZx8G82xMrYPLNO3dwXkLq18gARQKaFQa
         z1Y/YhVpSAiPGHd5AO1tb+MqWP5uWPcAbIi/BV/+0C0vcnK99uj09Otc2BfODgl/gOlS
         iitVP87WCp/mZC/HmDKxzJkwC0/YYm0QAL+AffiYcXoy9lXxEy5STy0HnRDL8V1DqFyH
         WPiQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=lHInEywuR/eLrZtnZ1V4BvhNMaJvbKOVJaYJJABdPSo=;
        fh=mxmy2VqrEqnItAiVgr8mZthRnieNdb+Ck8oy6FCwFyY=;
        b=FpPdxQ6EOCR3B7iw8PBFEDqnlScw6NtlZARy2QYbCiHFyV8L6aShFphztVUF/l6VV/
         WvIiUwlcVoymeREVafvzXj1exBIerxBag4hwcZ+8uwyW6wPWJOO7EmcDaBN3S5Q1kil4
         Zg02TKzVHK1BpbuHRenUoK1iQfp7H9VF77Is4q/EIIMNPNpisEXKDCo+cVytBXYLNLwg
         fCL61qGs1Y+SKZCJAj+Taz2bBOfaAE7adcDMSqW4TO0g17I+P/2qlDF6s1pA9UTcneaC
         oXfM0RyCciWcxKygMFd2rRyQuzv6RtKbPL+9FBFv/u9RERFA2meLCcncRklq+daFfbub
         YNvg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777970916; x=1778575716; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=lHInEywuR/eLrZtnZ1V4BvhNMaJvbKOVJaYJJABdPSo=;
        b=FCAm6OlfQbuJyMMnMJKMJr9hIPra0TRO0k/ItkN4MIJ43ASlM1mCLh/JNuMjyhwTqD
         EJrFFTpMCg1zzYBQclO/KA3TIW6To03QqLxiAcDFZgpq7PEhlbvME0j8vmxn9bMTIFRB
         JFQDghLe7PCKdAmaU3UrD/8mmvFUzyzuF+jDOIFxGR2VSsZXGA4MlAtEOpRrhe+LLOz4
         IbCPSg+mkCJ3PI9IyZ07qa8caaq32nHh76HMCym7n0hlsCQbwAiCLCpIL2vz9zIUtthW
         H5L7DYKgB8HCjXN2SVylTdvVb0awIOCyjoAyCAUUaSQsPu+TA5PgUmkhBVeR8sbxx2Jf
         VUPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777970916; x=1778575716;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHInEywuR/eLrZtnZ1V4BvhNMaJvbKOVJaYJJABdPSo=;
        b=dj5Xls5ozNIk+VhY6pHloXbprt4g5WW40IfDE30X20py+KK3n0t5SN9YawpUV/2Un4
         ZFLm8VXr+damWJ23a/zfReworcX6DSL/9Pt6zd+Txc5HrfVdHLjTjZlmklK0sEfH4rwa
         1CZUaG8hV1LD/f1Lo17D6RVHQXoB9teRIGz7Hh+tn9PVbm/FffJ5TxT5oefLr715HG/F
         919Viut6ueRRz/d+oPqDNQbL4oIscHCizOgUZ3vwVuIIO73xy2poqiSx3V7qAHq1r3Uh
         1XBoq/HUodpC1xak0N3TPmc+13F+w/5PnbXg80PWtBeEGFTMRtn5CGdpCaltZCXvFsUT
         OTAw==
X-Forwarded-Encrypted: i=1; AFNElJ+sksi/DUo5l+RZdrrWiLY324i1k3YuCTgGMD84gnCktPDtcTe/ZsoaYg2IlQio/33LMFGRGOBtT3jiCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxYkNqrLfAoROLIXKPlqOxFnV/USyJrJCEEL7u4DAt7c8HVKwfZ
	f6Os8/TlXJZ/94e5Qrwx3Ewzh5X1eagSWqbXE5TLZ/kEaSm9iiy2VnNacjn6xXOKuRPqCYBI+66
	5kECRuTUoez7iHnCpFNp+rUMapMeb8kI=
X-Gm-Gg: AeBDieu5nDon/OI+I6ZRuMB66K9x+Y/FanGJ5/GeVojreacKleqN6PgKGC1j7WNXV9k
	t/OZMcqrCI1HgQLony0AylNmKUabqTQa/19qp+kCrju8BFFp4eZdfHuBYdq0n6E1WNf7pWi7Y6H
	w3r6LulJqv8tAoiY4OkdN+hAziFQUU2f6ejkUy792iFpTAc+2LS7pZWLbsAi+rG/sI+SGYwFqLz
	r+UEDlL2QJ5eKS8zA9fStAmPiXhkotdwmcExQjHkqLa9MXhL3xxcotLjXK91L7eKsOfi1YRlgBo
	KRthuwg9i4sioOCdZMY=
X-Received: by 2002:a05:690e:4809:b0:652:ddea:11f1 with SMTP id
 956f58d0204a3-65c69eb364dmr1678595d50.30.1777970916424; Tue, 05 May 2026
 01:48:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260418070220.64542-1-lgs201920130244@gmail.com> <DIA4URMZOEAU.1146WQ3M1DO7M@kernel.org>
In-Reply-To: <DIA4URMZOEAU.1146WQ3M1DO7M@kernel.org>
From: Guangshuo Li <lgs201920130244@gmail.com>
Date: Tue, 5 May 2026 16:48:27 +0800
X-Gm-Features: AVHnY4LgTxvDOB1Qfaw_1_n5aA1mALltyh-tHiADgVTMx9kA3PBfqRebAzQUh14
Message-ID: <CANUHTR8XCO=KUvGzpNHD0zCmnZkhNuqAH3XZWz9ka5iUPw3Khg@mail.gmail.com>
Subject: Re: [PATCH v2] firmware_loader: fix device reference leak in firmware_upload_register()
To: Danilo Krummrich <dakr@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Tianfei zhang <tianfei.zhang@intel.com>, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Danilo, Russ,

Thanks for your reviewing.

On Tue, 5 May 2026 at 03:18, Danilo Krummrich <dakr@kernel.org> wrote:
>
> On Sat Apr 18, 2026 at 9:02 AM CEST, Guangshuo Li wrote:
> > diff --git a/drivers/base/firmware_loader/sysfs_upload.c b/drivers/base/firmware_loader/sysfs_upload.c
> > index f59a7856934c..a6dab34b22d8 100644
> > --- a/drivers/base/firmware_loader/sysfs_upload.c
> > +++ b/drivers/base/firmware_loader/sysfs_upload.c
> > @@ -351,7 +351,8 @@ firmware_upload_register(struct module *module, struct device *parent,
> >       if (ret != 0) {
> >               if (ret > 0)
> >                       ret = -EINVAL;
> > -             goto free_fw_sysfs;
> > +             put_device(fw_dev);
> > +             goto exit_module_put;
> >       }
> >       fw_priv->is_paged_buf = true;
> >       fw_sysfs->fw_priv = fw_priv;
>
> I think this assignment comes too late, by calling put_device() we eventually
> end up in fw_upload_free() which expects this to be assigned already.
>
> I didn't think it through entirely, but can we just move the
>
>         fw_sysfs->fw_upload_priv = fw_upload_priv;
>
> assignment to after alloc_lookup_fw_priv(), so fw_dev_release() does not enter
> this path in the first place?

After manual re-review, I confirmed that the issue Danilo pointed out
does exist. In the current v2 patch, fw_sysfs->fw_upload_priv has
already been assigned before alloc_lookup_fw_priv() succeeds, while
fw_sysfs->fw_priv has not been assigned yet. Therefore, calling
put_device() on this failure path may eventually enter
fw_upload_free(), which expects fw_sysfs->fw_priv to be valid.

I will address this in a v3 patch.

Thanks,
Guangshuo
