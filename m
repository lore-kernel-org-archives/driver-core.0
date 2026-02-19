Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DFE534D39C
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:54:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771520071; cv=none; b=e5qT0Ih35oB77oSWklPC3CQrRs4aqEGrksY9Ughow2F+W9jx3J8ZHnH1MrALW3vT0/qa/UVW5FzINVtoMTXBxtQc20a+5fDoEkDcCJt4yRy6TJGd4MnzF+Xj92tdipgU7Bvs1s6fRD5MYOXAcK2YdoJkaa8A87ABM4HUgFFVpiY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771520071; c=relaxed/simple;
	bh=2VBPj5WIpRN2SIBxTrDBDX/SrjuB1jiqkZTQeduSAwg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X2dVYM0IXbqyAmJt74yCCLteffFQrSjxZfjWqequXIJgjHogGIgnbp8I6sHBN8YrQWzbsHpKGs1HCzqINduabQjYoZKzzZ/EAFLNVf9Sxe+QRyd79CJdZFSXX9heWynhyPkd9Srg6EPD/JoEiKNtYEznh/MxB/t0/NqPlQcDf18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EAnvucsP; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EAnvucsP"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2b4520f6b32so1487668eec.0
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 08:54:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771520068; x=1772124868; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=tNOMVKayZqs2xkHfdF/fmOBXKVqxQ8+G8UAd/SZpHC0=;
        b=EAnvucsPKKkQ1lIq/n6QveQrjUM8tBpWqhfx6DrihyZv7fLyWOgKovzE20AAUNFMHO
         YIK/18Bdm6QHTkXkB0E4lngiwvTZqDF99xs6RXnrV22RaBZ2kNRi8bSUqzHpY7TyvGTF
         nrlfJ+3XmMWhN5Us1PBMN97Atg8VKFEtKx2yRfeWaHdbbTHILmfi3v9I+MkwHyc/LcHZ
         /AQuo+xNJmJMe7E9rMOPuYoJsDGpZz5Sl9jS+P2Zi6wWb1XncpqlHD/zpe/oPuSaZK9m
         GY3tEWxRpG9Aqd5ccsiUg9FLNjT6P1smAO1xCDTcpFbKcgFfbH6N1JUm5pEjxouYDB44
         soGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771520068; x=1772124868;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tNOMVKayZqs2xkHfdF/fmOBXKVqxQ8+G8UAd/SZpHC0=;
        b=uhkihYYVhkY3xI6EtiIMfZwYL3TyRbhoSZ3Wg9EgM5UIji8iAwjUzAxhSEsAGGF+lr
         Ksh8HnsC88v9+67KcTK2ujfDInLAJ9gHOh08TwPEEKlKOrYVS+zi6XHaWe9pja7tPLOD
         QWRsb2jN2lXvhT+hh2aAxBzg/beYoEDPGerlTj17wrw2qsq7GmYFuuBz6U3WAxMTiAiv
         CSXFJeKWZUh+GBIoydheAZRf/YKEtcNi4Vdiosv675ck87Yy9xkgN6UQ6XmgDbJti2Xp
         MMn+qMe4uyThmyKcm47Xl8XuI/jr8cYVvUgwZ3pYQw+U4DGEwVWAY7pPme+GvIbh1wr4
         T5kQ==
X-Forwarded-Encrypted: i=1; AJvYcCVqbpwZ/p6CTn0ar8tMmupuwge3UmBwdH3etDlQSxE4ktTKppBzb9afKUe6w580Ydkjw8Qy8BuDW5Y2/w==@lists.linux.dev
X-Gm-Message-State: AOJu0YzOpKnIIrOgTyDQvuAvevWcBVSRgnmF6xHQZ7lcg89UaIqJilLL
	TL1O7+ftjJzUs7kbms31s9IvCXC/MonxP/UnXslhZ2UDqm+5+/HXzwsO
X-Gm-Gg: AZuq6aKio6UTeArI6sRAzF7E6nc15kHUYbSxNGHuAMrZC4uYnApvh7DYU61wvY6KX7T
	YeJmFXW4UWDZFX8dFT+r3Zc1WiQmacZ+T7sDv0lkZ3RcBYRVB7wXGy77gCSSktLyZRIZdEVo6IP
	9mNkWdf43unRR4t5LAuCj3p3/TYE0usIE061pCgick0tFQqrATVmVzDBX/VztfOeYSKvFcDDbj7
	E1Lcymv/VkbIGAqJfyT5+X94bMFA9ntzReGZfe0vcwYIugDAKcclhM2ow8WWPIUolNncZXLrtf3
	oOb+RAaICgnXKwjMY+0f2/ikKDcnO0tu2NuoxA/WTA3gFaycjQobmb1yQ3BNk19uKPy10PFYOu+
	h5Bt2kpkCVdTWQDW/xBEMkGgjoAzvatd+XKIFHIFwCpkvWss9ChyN40s7feTgxLWG2KvmWfACSH
	kzWt/Pbnt33x/o/0pZu/E+15PknxwKU6tc23B6Eed1UYSus6IRh9FRouuUfnCQsXAo
X-Received: by 2002:a05:7300:ed0e:b0:2ba:67ef:532 with SMTP id 5a478bee46e88-2bd502a01b3mr2635653eec.43.1771520068169;
        Thu, 19 Feb 2026 08:54:28 -0800 (PST)
Received: from google.com ([2a00:79e0:2ebe:8:9c24:8181:603e:7ad7])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2bacb577bcasm21098242eec.12.2026.02.19.08.54.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:54:27 -0800 (PST)
Date: Thu, 19 Feb 2026 08:54:24 -0800
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Message-ID: <aZc_P9PcXdlJHqrK@google.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
 <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
 <2026021900-trekker-twenty-9daa@gregkh>
 <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=MekX-pXJEs7W9vn8-exAXyfNN3JMwrVNDPXg0b77X1NNw@mail.gmail.com>

Hi Bartosz,

On Thu, Feb 19, 2026 at 05:39:47PM +0100, Bartosz Golaszewski wrote:
> On Thu, Feb 19, 2026 at 5:36 PM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Thu, Feb 19, 2026 at 05:31:22PM +0100, Bartosz Golaszewski wrote:
> > > Provide an extended variant of device_match_fwnode() that also tries to
> > > match the device's secondary fwnode.
> > >
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > >  drivers/base/core.c        | 14 ++++++++++++++
> > >  include/linux/device/bus.h |  1 +
> > >  2 files changed, 15 insertions(+)
> > >
> > > diff --git a/drivers/base/core.c b/drivers/base/core.c
> > > index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
> > > --- a/drivers/base/core.c
> > > +++ b/drivers/base/core.c
> > > @@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
> > >  }
> > >  EXPORT_SYMBOL_GPL(device_match_fwnode);
> > >
> > > +int device_match_fwnode_ext(struct device *dev, const void *fwnode)
> >
> > No kernel doc to explain what this function does?
> >
> > :(
> >
> 
> It's not like any of the other variants from this file were documented
> but ok, I can add it in v2. Still, I'd like to hear if this even makes
> sense.

I think it really needs a good explanation given how it goes through
secondaries on one side but not on the other (but maybe it should? Why
one would not want to match secondary?)

I also not fond of the name and still not quite sure if we need a
special variant or if the normal device_match_fwnode() should be
adjusted and its callers (there are about 20) should be audited (and
maybe if the actually rely on current behavior we can introduce
device_match_primary_fwnode() instead).

And it should be a 'bool' (and we should fix the rest of them as well).

Thanks.

-- 
Dmitry
