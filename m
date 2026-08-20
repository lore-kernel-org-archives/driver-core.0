Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0C803B7B7F;
	Thu, 20 Aug 2026 08:25:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787214308; cv=none; b=ZmsgbR0nCQKljCWynvvicD138qc5rrQ43afvOyc3nksGFDtaNUuEOd+HcKayq/QyaCs8Ury6Hu86BFrXLDi8m55zWLiJ0Mw5zpHB3TDRMtzPrV2zA2nt+3hPB+PXC5I2gDZ2gmTHOpG1ahq+C1XV6vCaNLhm9b37u84p41cxSYM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787214308; c=relaxed/simple;
	bh=14A6Awcu7EYdnF/QkkbMvZnaEhx6b4kxPK2UHDiPADE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EBWJHwn1+Ao31/8DVhpKEPsw5d5bfeQrxqY6lqTYBVxXs7ITy6WmkXx5t51lhJduJ5JhEX3hthrHmXyw0HOf8z+y/mXC0nk9vlRnqoUA0/ZueQVC5B60+wdzubwQYVySiG0xOkeg2B+3k0IOaFbJv91c3TjauvJeDAby5Y5mq18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lr56spYZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lr56spYZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AEA71F000E9;
	Thu, 20 Aug 2026 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787214306;
	bh=K5Dcv5fkd6AlO9CIeGHFpiHuhLQOMTmTB4QTRlL77WM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=lr56spYZ2uk1RaNFBhXl1dHVM6+57q6hhlZldmaCOu7iA5hc4qtv/3gUtD6z6c3EM
	 NK8pqyRPyMjjmpayaC5CgjsUjKoKu+jjVNQGMQXAqmreLv8M/9OlC2Rf7mOVqBwr7V
	 SgKARSAu9v2Ee+Ox4OSQcEfru8Muoe5dK6puch1c=
Date: Thu, 20 Aug 2026 10:23:28 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Subject: Re: [PATCH v3] driver core: avoid klist_remove() on unattached
 knode_driver
Message-ID: <2026082042-coma-moody-5b4e@gregkh>
References: <2026082048-malformed-finite-4e61@gregkh>
 <20260820074538.102158-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820074538.102158-1-khiemtranzo532001@gmail.com>

On Thu, Aug 20, 2026 at 03:45:38PM +0800, Nguyen Quang Le Kien wrote:
> usb_driver_claim_interface() sets dev->driver directly and skips
> device_bind_driver() when the interface is not yet registered, so the
> device can reach teardown with dev->driver set but knode_driver never
> added to the driver's klist_devices. __device_release_driver() then
> unconditionally calls klist_remove() on the unattached node, which
> dereferences a NULL klist pointer in klist_put() and crashes.
> 
> Only remove the node if the device is actually bound. Use
> device_is_bound() rather than klist_node_attached() directly: the
> latter is a raw klist API and does not NULL-check dev->p, while
> device_is_bound() is the standard bound-state check used throughout
> driver core (driver_bound(), __device_attach()).
> 
> Fixes: 94e7b1c5ff20 ("[PATCH] Add a klist to struct device_driver for the devices bound to it.")
> Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
> ---
>  drivers/base/dd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/base/dd.c b/drivers/base/dd.c
> index 60c005223..4154b4499 100644
> --- a/drivers/base/dd.c
> +++ b/drivers/base/dd.c
> @@ -1354,7 +1354,8 @@ static void __device_release_driver(struct device *dev, struct device *parent)
>  		device_unbind_cleanup(dev);
>  		device_links_driver_cleanup(dev);
>  
> -		klist_remove(&dev->p->knode_driver);
> +		if (device_is_bound(dev))
> +			klist_remove(&dev->p->knode_driver);
>  		device_pm_check_callbacks(dev);
>  
>  		bus_notify(dev, BUS_NOTIFY_UNBOUND_DRIVER);
> -- 
> 2.34.1
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- This looks like a new version of a previously submitted patch, but you
  did not list below the --- line any changes from the previous version.
  Please read the section entitled "The canonical patch format" in the
  kernel file, Documentation/process/submitting-patches.rst for what
  needs to be done here to properly describe this.

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

- You have sent patches very very quickly, with no time to have others
  review them.  Slow down, there is no rush here, and no deadlines.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
