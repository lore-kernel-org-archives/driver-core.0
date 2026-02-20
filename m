Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 560F4222565
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 00:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771548485; cv=none; b=ayVqVaLzLyFPXpdbg2MBWD3moizPL07++xA3CXHAKTpbFn5QAPI6d2PRKOmgLZLInT5czKhHO/TY0K9jbtFm+Ui+97YhH1d+6ERS6CxM27yUuHr9fyeOW+7uEtfW0G3H6F9SLO8znfRDVhqQcuPJBRWMx1l6M3YgSKOj52QG9Uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771548485; c=relaxed/simple;
	bh=8y+r57ZYPNPnm4O2JdX7FqAZsK4OphEX+0PbJ4Nkie4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L8KTfkhP5grdWgI/ny+Vi1mIQPNpRTgKCmfOxNQvuyWiGxH4RBs0Bbd6a/i4x4yepUDtw/79Gl0Cif1wcfLzrP91/zvTfE0CyPV7XkhLZTQ/qIL3XoTVnjWvAM2ti8sX70MOUa6Yw38gpBwCisqRpjuOtuisRgAmG487az6oOwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VVdiGknl; arc=none smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VVdiGknl"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a635476fso1562194c88.0
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771548483; x=1772153283; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=9VgbZEML7yTCSAlB27Kxxz5xLL3aoTRKE4aYyfo5H6w=;
        b=VVdiGknlBW2QgSM/Tx8TJS7cig4zzvkNRZMl3imCosOHI9CJ9nbE3gaE7Ritrx9AVN
         PMweTfy5jSkabI/Qo3jZKySe98FsreqxerkofMx+tgYeRwwbWz9rvse6+3ceCs+Qf5hv
         DXnkRHNuCjJ+z/crrON6qCvGBvas3en01+lbhtJf3p2bter8JcstnmdM+6zi3+2MCebF
         /31SWkwH5sproflPtvfHrv0J4lGvR0Ln+f5ZHnTFTTKgQpkYZ1JxUyJErW+rGaF3cZxL
         Hqqb4P/bjEOvveaBCYSGkXEUg9Gb2Ng9SLAfqqZ4HseuTVvR4eWOj2RHS4q92cvxeDXK
         eNUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771548483; x=1772153283;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9VgbZEML7yTCSAlB27Kxxz5xLL3aoTRKE4aYyfo5H6w=;
        b=Xffnrl1SW/kn30C3IXuYjzIRUQQ6rSCqRd5jaS4rSRb84sbdDUpdmcTlDTiQCTuSWm
         nS0ph5gLA4kfPlgPxyOPPdDMy26bR6ci6VdOjBpvPck5FZ3EFKYPmTRvLbOEd0gDeMFu
         aJCvBGxKT0kwu7nl/xFULxurvSoLR8ySKg82Oia0TF5D3IgrrQAb3p5mhvwmcN8bhvi3
         nTvLrBCb2DMychBqfB0lZdwqquxnx8g+0j8O7bzaiu+C6n2om9VoOKxKmrkhV8jKY4yn
         AeDDN8+9egb6T2oKyg5OmHOdTJzqVpN8nzVwrnnI79AGtYsoTNseO401VNbgwSlcrOTn
         QzjA==
X-Forwarded-Encrypted: i=1; AJvYcCUOnyH22U9zus2looz0l3tuzQPNOmCB0/4difpEkrFJhRObDYBwCu2LxH/Mp+U7VcDZu131oHVT6usgoA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1J6wQAuxx+5FOPOIMS0UXrbRBakCFURBLrOrX7JluMFVkvxH/
	YwuLg29RQLT60A5ObimsN7DeyEaozg4ssI/s/UEdQobNFUtME/8Ggu07
X-Gm-Gg: AZuq6aKPSdGw8utWeZBUc2jscWD6/VmFQ9i3imm6k0AZxmL6TB2O63QeEhMfpqXoa2K
	CfwnRy6rSqdXSsMkDpmORmpzXRasA697335iTA6dRehkVIfyvvYVhQwE4AioPub7mmuqniApRME
	0jmmWIX5z8Ts7vEmxo2SZMn4XpYBeYs4pjLi9H/OVRsH/zsG+qPI0fY4ovNOL72JKnod4zeumo6
	3v78zuZjhVuwa6X/Kq5CZh5fEbU4kIoN8Qr8fScplAgmtyRcbz5cuPpAiATus6vVZr2TzJGQChc
	d/798FjusChcezhhFwJCyQ8V+bj2EB1CON9SpXZfNk59WhVGMf51a6t/i/9Nq/RswnbDK5F7CxD
	22qu7RW5tMOQXwDEL1NGGTnwEttypsEgiZFWcTBn+Wr25kD5z9LBpQz4Vvpj1EzIytn94hMGfWV
	u2+PeP3jhQevKXIm6h+5WtiTZMSgbMudZyxJtDwGrQ+scnLnGzgHDh2jqFrx34hYkI
X-Received: by 2002:a05:7022:49c:b0:127:35af:143c with SMTP id a92af1059eb24-12759a75a8emr3117889c88.37.1771548483309;
        Thu, 19 Feb 2026 16:48:03 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:9c24:8181:603e:7ad7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb66addcsm22398999eec.24.2026.02.19.16.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 16:48:02 -0800 (PST)
Date: Thu, 19 Feb 2026 16:47:59 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZeu11bBxxgXNMyd@google.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
 <aZc_P9PcXdlJHqrK@google.com>
 <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MewpkVkrr-srOzx0iudwOJyrzeBErbF_-BR-oTo5_KyEg@mail.gmail.com>

On Thu, Feb 19, 2026 at 03:15:53PM -0600, Bartosz Golaszewski wrote:
> On Thu, 19 Feb 2026 17:54:24 +0100, Dmitry Torokhov
> <dmitry.torokhov@gmail.com> said:
> > Hi Bartosz,
> >
> > On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:
> >> On Thu, Feb 19, 2026 at 5:36 PM Greg Kroah-Hartman
> >> <gregkh@linuxfoundation.org> wrote:
> >> >
> >> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> >> > > Provide an extended variant of device_match_fwnode() that also tries to
> >> > > match the device's secondary fwnode.
> >> > >
> >> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> >> > > ---
> >> > >  drivers/base/core.c        | 14 ++++++++++++++
> >> > >  include/linux/device/bus.h |  1 +
> >> > >  2 files changed, 15 insertions(+)
> >> > >
> >> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> >> > > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
> >> > > --- a/drivers/base/core.c
> >> > > +++ b/drivers/base/core.c
> >> > > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
> >> > >  }
> >> > >  EXPORT_SYMBOL_GPL(device_match_fwnode);
> >> > >
> >> > > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> >> >
> >> > No kernel doc to explain what this function does?
> >> >
> >> > :(
> >> >
> >>
> >> It's not like any of the other variants from this file were documented
> >> but ok, I can add it in v2. Still, I'd like to hear if this even makes
> >> sense.
> >
> > I think it really needs a good explanation given how it goes through
> > secondaries on one side but not on the other (but maybe it should? Why
> > one would not want to match secondary?)
> >
> 
> I don't think it should. You have one, concrete fwnode and you want to match
> it against a struct device: in this variant both its primary and secondary
> nodes. I don't think we should do a four-way matching.

I wonder why you consider these 2 distinct fwnodes instead of a single
object that has multiple components? After all in device we have a
pointer to fwnode, and not list of fwnodes....

Thanks.

-- 
Dmitry
