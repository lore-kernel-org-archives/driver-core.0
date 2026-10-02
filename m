Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00F44F5E03
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 18:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790965726; cv=none; b=lyVmnPHkp8TvS9a54NIE/MayVqT/ccInyBBsYp6Y7Wuv5PWoysMWs0PSmloJ3ISgcX2Swch9M3hxDQc3UROUE72/kjIw/u03djXKxLeiZlx72+TQ3Spvl97FLj7RFop+uX8Pw7zIA3W4JQsOYJk/6ezJKDuTImCVnqxIMn0Oaxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790965726; c=relaxed/simple;
	bh=37xW3bXnNDjppoFLWCR/oa4xzrjQIHEZAETiL9CojqU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=evFh/0Bh847bF63Z+TobSzC+6NDfEbt6R/TMaZ+/OzIwP/GUfStE2O5BYFZWOBV8QIJlIEW3QOJTlga3D7NwHsh2PvB661PSHXH4gIGYOrUcoKoNCJJ76alOvBtB0Kx037lZ9E08xCJ8S+YmNhSZAv6zcecWJGlZKKvRxTn9zGU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu; spf=fail smtp.mailfrom=g.harvard.edu; dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b=scTZiPai; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rowland.harvard.edu
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=g.harvard.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rowland.harvard.edu header.i=@rowland.harvard.edu header.b="scTZiPai"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-5332bc442ebso1757011cf.1
        for <driver-core@lists.linux.dev>; Fri, 02 Oct 2026 11:28:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rowland.harvard.edu; s=google; t=1790965716; x=1791570516; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=h3hPlfvLElJBAlrqMs6yd7kZHuzl23umtFhgk5gi4Bk=;
        b=scTZiPai4Ar2NWV5W3WcVEOPnJPFPTP5mfpO0W4z/Gt+TGGhh9QENeXpUrMVEtxmWN
         dYvYIvMgQgsroWBcsmgAD13aZLywyGMtkIHCG3i72b9nh6Vun0OMLCQEIpkIIsA3o3Cc
         skJ2Bf/aWwc8EvtmjQiecLJfMxWyZ6QlCPx8bm02evyTAMfEQK+H+Nxbhmhup8g1bJZe
         RO05SrjPvHV+XjJBJS7P8Fp8b0iuc8OXFHgIxTMJP+JP63rz85GvBUlZgiVtpr6MBGYE
         9U55yfrOvwwC2MmJgV5WQbu9yYgKFkG/wZ4C+OEJd9hd4lzqQTNbkYGB/wSz6Qb4I421
         Ge9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790965716; x=1791570516;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h3hPlfvLElJBAlrqMs6yd7kZHuzl23umtFhgk5gi4Bk=;
        b=XIIbnqjgTt4VMRMaq6nWpx7JOztvq53/De3Gu6/puryUh2k84b+liZFYRlMk7YIap5
         d+M2NQjt0wHz8nnm8kgCF6H6Hz80GstTbvyL864XI5rJ6Adc+hFe+FMxATyiptLCut0Q
         Kl+HNoPFM5znSUjkMnbHFDUmBZoOGmDY+HO25XgWF1lsSN8XfpamhNkxCYQt97MeCcnc
         VntxPLgQBnAZK/pR6ze60gKeQkl59G8dpDx1ZgMrFjeRjrRGCy3mtQB+4CxDkMnKQG/8
         CSAKJeTk0XEbtxVV7L3UL/tZO0q0PtUCHThzSKEt3xVN+SWMQfY6fewamJW4nmb8cX+y
         EoXg==
X-Forwarded-Encrypted: i=1; AKwUvBwdLmc9MO6qKUq6sj6n5XkIK5Q/TNtwvg8xeMYeJaGDAXr4Q7buFRasRCDh/YY1ij9DKtmgtD6yOsndxw==@lists.linux.dev
X-Gm-Message-State: AFuF++ketuYOraZHJi8rS5hVjYAPC+SdmAkvcOhr+BXj6BPdZsWmEjTd
	uEWOzq0Ddij2Scw+jdvehjEgDMDu8dIqiSK1UbPetCPVXv3YOKkv2qOzTO6Rkqjzpw==
X-Gm-Gg: AYBFou04uJJO/PO9TBkgVCMEwLued/foDB9I/EcCsNrnKi2OkDyFnRZdU5Y5Dbk75lA
	w7po6X3nLtZHoWm9h5fpkDJgt4j0Df5MzCFg1JtjEEvBLt80yJfpr6n36jv789k1IL1Hu3IMRW+
	Wmqo3xUv/myBbv6/8eVLt0PoNApn/7wBOqwmiP8jB9BrxrvbTdDu3Owx+5Y2TWr/ibYq84gQRrY
	Jz5njqCTBim4+yIssK/jNs0ZNg4RChTwhqoeKtx1dNPBER4hRooDlTiX7VnhaH1Cq7GBF/O0dhX
	m4hG+PdXBps0LKSfSz7LpndPlxn/9v/OS6n6ofSHf7BtIOabghSCvaVFmbTq8A5wK77aFItPaeV
	9UfEjyDcs8XDsbX0Zb7sYAlaa+AO8Yk1nuV+bgdlCXJJlPvG+n/SN7wOIZaqwjwVzAnFrzfbAu7
	4q/8MbI43Eo5+uG6beQxvwpwlcnhYmRKZlGgHD4gUvqmqkk21QTX62PcLX3Zu/550oUmJeyN4A6
	eTczhru+w==
X-Received: by 2002:ac8:6f0e:0:b0:532:af50:8d7d with SMTP id d75a77b69052e-53511e71255mr2084371cf.33.1790965715552;
        Fri, 02 Oct 2026 11:28:35 -0700 (PDT)
Received: from rowland.harvard.edu ([2601:19b:d01:d210::1b7d])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5350d54de14sm7781361cf.20.2026.10.02.11.28.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Oct 2026 11:28:34 -0700 (PDT)
Date: Fri, 2 Oct 2026 14:28:32 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael.j.wysocki@intel.com,
	johan@kernel.org, linux-usb@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@kernel.org
Subject: Re: [PATCH] usb: core: don't set drvdata to NULL in
 usb_unbind_interface()
Message-ID: <c47f59d7-366a-4588-9742-b6e484c1c996@rowland.harvard.edu>
References: <20261002145455.3392703-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261002145455.3392703-1-dakr@kernel.org>

On Fri, Oct 02, 2026 at 04:52:49PM +0200, Danilo Krummrich wrote:
> usb_unbind_interface() serves as the remove() callback of struct
> usb_driver and calls usb_set_intfdata(intf, NULL) to clear the bus
> device private data pointer.
> 
> However, the driver core code already sets the bus device private data
> pointer to NULL in device_unbind_cleanup() *after* devres_release_all(),
> which makes the call redundant.
> 
> In addition, it can create unexpected NULL pointer dereference scenarios
> when drivers use managed APIs.
> 
> 	int probe(struct usb_interface *intf,
> 		  const struct usb_device_id *id)
> 	{
> 		struct data *data;
> 		int ret;
> 
> 		data = devm_kzalloc(&intf->dev, sizeof(*data), GFP_KERNEL);
> 		if (!data)
> 			return -ENOMEM;
> 
> 		ret = devm_device_add_group(&intf->dev, &foo_attr_group);
> 		if (ret)
> 			return ret;
> 
> 		...
> 	}
> 
> 	ssize_t foo_value_show(struct device *dev, struct device_attribute *attr,
> 			       char *buf)
> 	{
> 		struct usb_interface *intf = to_usb_interface(dev);
> 		struct data *data = usb_get_intfdata(intf);
> 
> 		/* Potential NULL pointer dereference */
> 		return sysfs_emit(buf, "%u\n", data->value);
> 	}
> 
> Nothing prevents usb_unbind_interface() to race with foo_value_show()
> and set usb_set_intfdata(intf, NULL).
> 
> Besides that, the Rust driver core code manages a driver's bus device
> private data and destroys it in device_unbind_cleanup().
> 
> If usb_unbind_interface() sets the pointer to NULL prematurely, the Rust
> driver core code sees NULL, and hence skips the destructor of the bus
> device private data, which leaks all its resources.

Aren't there a few interface drivers that explicitly set the intfdata 
value to NULL in their own ->remove() routines?  If you haven't checked 
for that, you might want to.

> Thus, drop usb_set_intfdata(intf, NULL) from usb_unbind_interface() and
> move it to usb_driver_release_interface(), which manually calls the
> remove() callback of struct usb_driver, and hence can't rely on the
> driver core.
> 
> Cc: stable@kernel.org
> Fixes: a995fe1a3aa7 ("rust: driver: drop device private data post unbind")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>
> ---

Makes sense,  IIRC, that line was added mostly as a convenience for 
drivers, anyway.

Acked-by: Alan Stern <stern@rowland.harvard.edu>

Alan Stern

>  drivers/usb/core/driver.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/usb/core/driver.c b/drivers/usb/core/driver.c
> index 7f33fe5ba03b..412174270fbf 100644
> --- a/drivers/usb/core/driver.c
> +++ b/drivers/usb/core/driver.c
> @@ -497,7 +497,6 @@ static int usb_unbind_interface(struct device *dev)
>  	} else {
>  		intf->needs_altsetting0 = 1;
>  	}
> -	usb_set_intfdata(intf, NULL);
>  
>  	intf->condition = USB_INTERFACE_UNBOUND;
>  	intf->needs_remote_wakeup = 0;
> @@ -644,6 +643,7 @@ void usb_driver_release_interface(struct usb_driver *driver,
>  	} else {
>  		device_lock(dev);
>  		usb_unbind_interface(dev);
> +		dev_set_drvdata(dev, NULL);
>  		dev->driver = NULL;
>  		device_unlock(dev);
>  	}
> 
> base-commit: ce1e0223d8ad4211275c82a17ed6d43ab81e13d9
> -- 
> 2.56.0
