Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCBD3413250;
	Wed, 21 Jan 2026 17:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769015001; cv=none; b=HoXGBhDbVPKZNUgq2TqbYUlBlAaXvF+GjkED4gvJUELt2PeEfxjrUI5wvQLLnTGWTw69+bwX5+uCTHHYPXLHxY/WVBFcCmoa9trhomM7Jl8m5r9+g/8dDNl76M2Lt0r4kRUSs//jZnTM5n54aCpNDxKMmZuyBDHm74Zp99Ulk9I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769015001; c=relaxed/simple;
	bh=QXf8LuXI4AGE85uSzOcl1vcrjOaVXqVwfYZH/+mOEDU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LC+TfN3Pf4zFaCbt0HZMJSlKVE0+ECO1Dj8McJElEbGJSo/aUqBkADUJn4PPY+XDfeG8p970JkJMXbEAJCOBAZyWyjCMRp+NBxA14FoUpYM6FX6cXe7JF/vIcpg3TLKuIdXPKiJ31cNLPPWm5ag8L+1be+TYoSSk0v0Mim2s0F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=kU/z59wv; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="kU/z59wv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35F5CC4CEF1;
	Wed, 21 Jan 2026 17:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1769015001;
	bh=QXf8LuXI4AGE85uSzOcl1vcrjOaVXqVwfYZH/+mOEDU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kU/z59wvlJj5EPzDM1wsF4Hfe7NmchQl8Sq7OpsDdfPV6JEPf79NgNdl7QXcTjlZ9
	 ATH3Jn1cj2uQaRZRuk+PHkUj6t297H2EPUamh5IL3ePgyQH2I51MGXnnqcCEzGxlh9
	 0a3IB4/yA8LR5eeYBuN388B2kLntYc0gDbZmvIec=
Date: Wed, 21 Jan 2026 18:03:19 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: David Laight <david.laight.linux@gmail.com>
Cc: dakr@kernel.org, rafael@kernel.org, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, Gui-Dong Han <hanguidong02@gmail.com>
Subject: Re: [PATCH] driver core: faux: stop using static struct device
Message-ID: <2026012143-married-monoxide-16cf@gregkh>
References: <2026012145-lapping-countless-ef81@gregkh>
 <20260121145524.2ecd29eb@pumpkin>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260121145524.2ecd29eb@pumpkin>

On Wed, Jan 21, 2026 at 02:55:24PM +0000, David Laight wrote:
> On Wed, 21 Jan 2026 11:29:45 +0100
> Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:
> 
> > faux_bus_root should not have been a static struct device, but rather a
> > dynamically created structure so that lockdep and other testing tools do
> > not trip over it (as well as being the right thing overall to do.)  Fix
> > this up by making it properly dynamic.
> > 
> > Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/base/faux.c | 18 +++++++++++-------
> >  1 file changed, 11 insertions(+), 7 deletions(-)
> > 
> > diff --git a/drivers/base/faux.c b/drivers/base/faux.c
> > index 21dd02124231..23d725817232 100644
> > --- a/drivers/base/faux.c
> > +++ b/drivers/base/faux.c
> > @@ -29,9 +29,7 @@ struct faux_object {
> >  };
> >  #define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
> >  
> > -static struct device faux_bus_root = {
> > -	.init_name	= "faux",
> > -};
> > +static struct device *faux_bus_root;
> >  
> >  static int faux_match(struct device *dev, const struct device_driver *drv)
> >  {
> > @@ -152,7 +150,7 @@ struct faux_device *faux_device_create_with_groups(const char *name,
> >  	if (parent)
> >  		dev->parent = parent;
> >  	else
> > -		dev->parent = &faux_bus_root;
> > +		dev->parent = faux_bus_root;
> >  	dev->bus = &faux_bus_type;
> >  	dev_set_name(dev, "%s", name);
> >  	device_set_pm_not_required(dev);
> > @@ -236,9 +234,15 @@ int __init faux_bus_init(void)
> >  {
> >  	int ret;
> 
> Should there be:
> 	if (faux_bus_root)
> 		return -EBUSY;
> here?

How can that happen?

> While I guess there shouldn't be two of these, better be safe.

It can't, no need for that :)

thanks,

greg k-h
