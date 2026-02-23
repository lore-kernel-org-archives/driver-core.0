Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8791B37A49F
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 22:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771884444; cv=none; b=tJq6OHnbyGpiv7ZaXUePRqdDwdiCJZBq42ZO/BscoYaJKcVC1vQXV6o172seIpdl5a//JtAHMt0I0BHRjmd+gCCazLOthjZfkB0YJ1MZXzsFSjjHF1MQ1NGErtuvPKpsapB04GHf6yZmsgREY6zPFYcSgxHmV/wvm5/h++gyj0E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771884444; c=relaxed/simple;
	bh=QLRt1ihCEGutlnY3VQn0B0BPbTeJrNzIfTdx0Vhb06U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ki5LCMg7Jqs/+/vXH7fTV+OPdpsPE02XZe8Ivi3iP7Tjw3e4SuKtL4UYAJiOzmLj2eMA0yTm1Li3gAstPE8A4RIMUqCt3aRHc5s04AWFTq1q4TzGa1SibaJBUVC7gVa43Qsc94CYLd84mYXNZNnCt5X6pUhURNnD3FBX/PX45RQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R+kLtfyv; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R+kLtfyv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771884441; x=1803420441;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:content-transfer-encoding:in-reply-to;
  bh=QLRt1ihCEGutlnY3VQn0B0BPbTeJrNzIfTdx0Vhb06U=;
  b=R+kLtfyvEtXsdCY/M0eHFqVz3wRwb9ujjWL9BkjZoDVhAfJJn8z0WEV/
   zgW1HuiNpb1WV0stFQsyi2740J5FpdUzhEh0qlUc3YhjeMQJD+vKkTfOd
   OQm8Dzl5JEoabwNQ5yJfGExzW4x9uOOeLOUQ7lS7ETI8MthSrW6u5x6yG
   RPT2986V6khCmaMqUrScK/AAQS2R/usfYWeV7oD+IHu1YjmbhDnfn+REw
   XZKveas9QOxlIdAFLhF15tbI/4rUuWbnQh27x1mWsykCyQtG+tMTTzojr
   hwPjza8B4ViH69S2dfgrSwRQzn/kthmfsnWFBtMc1wvSviPqJG+v6gxV7
   w==;
X-CSE-ConnectionGUID: 7Nmj4aHmRuSLWfoQiT3D+A==
X-CSE-MsgGUID: FJFUdxYzTai8YWoBPj3OYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="75498112"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="75498112"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 14:07:16 -0800
X-CSE-ConnectionGUID: bZBxDYz7QnO7HwaONAAgpw==
X-CSE-MsgGUID: 2d7dg5weRAWji89mBhuZzw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; 
   d="scan'208";a="215849310"
Received: from pgcooper-mobl3.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.61])
  by orviesa007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2026 14:07:12 -0800
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with ESMTP id C8D9C11FC4C;
	Tue, 24 Feb 2026 00:07:37 +0200 (EET)
Date: Tue, 24 Feb 2026 00:07:37 +0200
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Linus Walleij <linusw@kernel.org>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Len Brown <lenb@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org
Subject: Re: [PATCH v2 2/2] gpiolib: match secondary fwnode too in
 gpio_device_find_by_fwnode()
Message-ID: <aZzPqbXH79Q6GvEn@kekkonen.localdomain>
References: <20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com>
 <20260223-device-match-secondary-fwnode-v2-2-966c00c9eeeb@oss.qualcomm.com>
 <aZyNErXB_acR3yYq@kekkonen.localdomain>
 <CAJZ5v0ibXKiUNf5Fvj=q=f9JbHT=w3j3h=33ri_awzEHm_dBng@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJZ5v0ibXKiUNf5Fvj=q=f9JbHT=w3j3h=33ri_awzEHm_dBng@mail.gmail.com>

Hi Rafael,

On Mon, Feb 23, 2026 at 06:46:38PM +0100, Rafael J. Wysocki wrote:
> On Mon, Feb 23, 2026 at 6:23 PM Sakari Ailus
> <sakari.ailus@linux.intel.com> wrote:
> >
> > Hi Bartosz,
> >
> > Thanks for the patch.
> >
> > On Mon, Feb 23, 2026 at 04:40:53PM +0100, Bartosz Golaszewski wrote:
> > > In GPIOLIB, during fwnode lookup, after having resolved the consumer's
> > > reference to a specific fwnode, we only match it against the primary
> > > node of the controllers. Let's extend that to also the secondary node by
> > > reworking gpio_chip_match_by_fwnode()
> > >
> > > Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
> > > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
> > > ---
> > >  drivers/gpio/gpiolib.c | 12 +++++++++++-
> > >  1 file changed, 11 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> > > index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..7fe1d9ab1281d6c5022b9bdd8909fef2cb74122e 100644
> > > --- a/drivers/gpio/gpiolib.c
> > > +++ b/drivers/gpio/gpiolib.c
> > > @@ -11,6 +11,7 @@
> > >  #include <linux/errno.h>
> > >  #include <linux/file.h>
> > >  #include <linux/fs.h>
> > > +#include <linux/fwnode.h>
> > >  #include <linux/idr.h>
> > >  #include <linux/interrupt.h>
> > >  #include <linux/irq.h>
> > > @@ -1395,7 +1396,16 @@ EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
> > >
> > >  static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void *fwnode)
> > >  {
> > > -     return device_match_fwnode(&gc->gpiodev->dev, fwnode);
> > > +     struct device *dev = &gc->gpiodev->dev;
> > > +     struct fwnode_handle *node = dev_fwnode(dev);
> > > +
> > > +     if (IS_ERR(fwnode))
> > > +             return 0;
> > > +
> > > +     if (device_match_fwnode(dev, fwnode))
> >
> > Could device_match_fwnode() match secondary fwnode as well?
> 
> In the previous discussion on this, Andy was against doing that due to
> the concern that it might introduce subtle bugs, which I agree with.

Could you elaborate or provide an example?

The function has some 27 users although few are individual drivers.

My understanding is that we only have the secondary fwnode for being able
to attach objects from different backend to the same node. The fwnode API
in the meantime generally tries to hide the existence of the secondary
fwnode; a rewrite (which ideally would have happened perhaps a few years
ago?) would probably make the fwnode a linked list instead so we'd lose
that secondary pointer in the process.

-- 
Kind regards,

Sakari Ailus
