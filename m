Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C293AF653
	for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 20:25:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776716740; cv=none; b=huCgQexRjNO7JJddh+TlZPQDBvXDe+0JUFe2qKk2CUnp+zjEItxUaFscJe/MUncTOEcv1M5AtB6zkG3Iq+D6ycjPUwCdbdBuYGnA9M+Gro0eusK7G2pSOW1/+YtCJyK0XtMkYIQv20f2tv9vc/l8Rq4Y13MfeRVffNt9ixFJ36s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776716740; c=relaxed/simple;
	bh=Dx76hdPmzkcK4nbwEphDzpwF8eLBrP39wXmhzcE1i9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eLGhOl83rW6U2Xj0nriwx76xLNxCHTAy68VK+RASLtbR3TgJ0G8Wm183AEb9btmnkJ7xSD56sGBeNO6vKdGALeTMoliPYxIPR2w5s6EhV1X47Pjo5nebo7B/VeGDzKWs+R83gsqNkWZFosdYLlCKvLN6uuB4ZafUKhTBLKpFc74=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com; spf=pass smtp.mailfrom=soleen.com; dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b=V1356S4U; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=soleen.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=soleen.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=soleen.com header.i=@soleen.com header.b="V1356S4U"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-899a9f445cbso43158876d6.0
        for <driver-core@lists.linux.dev>; Mon, 20 Apr 2026 13:25:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google; t=1776716738; x=1777321538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=86B2EppM//v3TWmEymAoj6QAs94Bt1WYW2cmbvlwvO8=;
        b=V1356S4U/8tr0lzRAqwg8m/u9F2VyMeiWLLsFtTjimjfvv5z2hs9GfNCaYN7jdICiw
         zoOBIyR9GuzhwdCBG5CmBQ8W14xpyYMyk546aXiBxvvrnX6gnV666bLG1SCP0dQuIVvp
         dFBDDD02D958w8oditWvYsiCV/IEm30lpSryES3kUirevPI31fPqsZ2dwsRfFFXKH1lv
         QYnAdweMw/toyNp7asT3vWK1t/xa7pYVuVkUF2X5gfK2m13Qwc0Yyw6v8KH2a9UWWZb1
         5PtoSafV6pJUq7VjDaDJp5xhxb+q4ote/vrm2DVocCaHc44jc8fIK6UhWQNWG7W2z4kQ
         qQzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776716738; x=1777321538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=86B2EppM//v3TWmEymAoj6QAs94Bt1WYW2cmbvlwvO8=;
        b=VSEK5dbY82+MhPftu3Tf0Pfbqd+bLpBkQYGZw1Kpyu5LSc2h465SitJ19UATJGQIUU
         i6OUECAU05RwRWHKhbDsQx5dmhf1snl1biYQ5giYtqSBczI6AegeTvYAZZBCDf1CN36v
         O14zuMrUrVG8/yPOp3W5UiFgwOKkGsTW0jTekuWmUsAJylUXjUOzAfDWh7KWHbzZmv4N
         jAQ/uribkv6tM9kG9U0Gp26iokIanC4gUt56R9hR3XhGogcTP4BVTnPJXYKV8eYN6tqE
         LighZo9sEoOrNJgQ4LibWyiKkFWO4RxB0ivfCJkwN0hup1tid/eSrwh+5Ux3uYtqfw3M
         XTkw==
X-Forwarded-Encrypted: i=1; AFNElJ/8dkX3quhvB8WEjw3a5JkYerm53fkv5nkjisErO5kH/fInRNcG9USSgceknJUjhKWQIiyMxw7bTRyIVA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwHF5eC3Hl5r4aTLSm7r32rg5g0uVbHaLhI4iEKAdaMJdGjjLeA
	OCSbd9HneMNQMqACFADz1rgR2uTSRy9nrrknsk6DgwXZLZ5bkN/2OsMXyLW7uyx7n9o=
X-Gm-Gg: AeBDievwvMOW3Ry7u4tBXNnngBaIWoo9R5KfZOdhbz9I14uw9uVa9f/Mw5/OD0hNn8X
	B+jhBRqacWuAbLQMfeGYqXSTObzeeHhfrVldgIhqfNiGZCBzC2hMSjgJBSIqOxhbyHIyI/Va6O9
	N8LM9VgGWOZn15BOJKSHPNkHqBo6p8U2xuilhTGYG9naY3OKJt6phOKYjmRLNVY9LjJiubkjBup
	qmiqG4O/JeYqwWX5cK8wauAE9OJoRE6c1VkLorpixYGbGNSzjLaVOikUapma5c5ZEJsbNkIWCDV
	PNn9IwFy3NR5WDdwN5GZ0nB74OcmWT2FqRDfDchyE2BVcFW3PORmvbmaa7vNLeSTaTQ1nZoMGb+
	riCqvDQgqlz9aeOXFqmmfUo6NMTBuTYAF8mlSikIJJc3m9fSkMUbFIvI7zjqpdtPscwVOra53tM
	SUv3VEiinoEBcEJ1/wJ65NeabkldJkNIxpazTVAu4umZC8C2jyaIWX2umGC7fq
X-Received: by 2002:a05:6214:3209:b0:8ac:ab90:d764 with SMTP id 6a1803df08f44-8b0281653a5mr266452836d6.48.1776716737948;
        Mon, 20 Apr 2026 13:25:37 -0700 (PDT)
Received: from plex ([71.181.43.54])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8b02ac6c3e7sm85895836d6.13.2026.04.20.13.25.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 13:25:36 -0700 (PDT)
Date: Mon, 20 Apr 2026 20:25:34 +0000
From: Pasha Tatashin <pasha.tatashin@soleen.com>
To: David Jeffery <djeffery@redhat.com>
Cc: linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-pci@vger.kernel.org, linux-scsi@vger.kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Tarun Sahu <tarunsahu@google.com>, 
	Pasha Tatashin <tatashin@google.com>, =?utf-8?B?TWljaGHFgiBDxYJhcGnFhHNraQ==?= <mclapinski@google.com>, 
	Jordan Richards <jordanrichards@google.com>, Ewan Milne <emilne@redhat.com>, 
	John Meneghini <jmeneghi@redhat.com>, "Lombardi, Maurizio" <mlombard@redhat.com>, 
	Stuart Hayes <stuart.w.hayes@gmail.com>, Laurence Oberman <loberman@redhat.com>, 
	Bart Van Assche <bvanassche@acm.org>, Bjorn Helgaas <helgaas@kernel.org>, 
	"Martin K . Petersen" <martin.petersen@oracle.com>, John Garry <john.g.garry@oracle.com>, kexec@lists.infradead.org
Subject: Re: [PATCH 1/5] driver core: separate function to shutdown one device
Message-ID: <h2r2jv4g2tednrybrmkn4d2dus3oalqsk3r2q4xrbuivucefon@n6vvx5bl5cm5>
References: <20260420152608.6244-1-djeffery@redhat.com>
 <20260420152608.6244-2-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260420152608.6244-2-djeffery@redhat.com>

On 04-20 11:26, David Jeffery wrote:
> Make a separate function for the part of device_shutdown() that does the
> shutown for a single device.  This is in preparation for making device
> shutdown asynchronous.
> 
> Signed-off-by: Stuart Hayes <stuart.w.hayes@gmail.com>
> Signed-off-by: David Jeffery <djeffery@redhat.com>
> Tested-by: Laurence Oberman <loberman@redhat.com>
> ---
>  drivers/base/core.c | 71 +++++++++++++++++++++++++--------------------
>  1 file changed, 39 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index 0613de0fbe44..5353c6c22d49 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4783,12 +4783,48 @@ int device_change_owner(struct device *dev, kuid_t kuid, kgid_t kgid)
>  	return error;
>  }
>  
> +static void shutdown_one_device(struct device *dev)
> +{
> +	struct device *parent = dev->parent;
> +
> +	/* hold lock to avoid race with probe/release */
> +	if (parent)
> +		device_lock(parent);
> +	device_lock(dev);
> +
> +	/* Don't allow any more runtime suspends */
> +	pm_runtime_get_noresume(dev);
> +	pm_runtime_barrier(dev);
> +
> +	if (dev->class && dev->class->shutdown_pre) {
> +		if (initcall_debug)
> +			dev_info(dev, "shutdown_pre\n");
> +		dev->class->shutdown_pre(dev);
> +	}
> +	if (dev->bus && dev->bus->shutdown) {
> +		if (initcall_debug)
> +			dev_info(dev, "shutdown\n");
> +		dev->bus->shutdown(dev);
> +	} else if (dev->driver && dev->driver->shutdown) {
> +		if (initcall_debug)
> +			dev_info(dev, "shutdown\n");
> +		dev->driver->shutdown(dev);
> +	}
> +
> +	device_unlock(dev);
> +	if (parent)
> +		device_unlock(parent);
> +
> +	put_device(parent);
> +	put_device(dev);
> +}

Reviewed-by: Pasha Tatashin <pasha.tatashin@soleen.com> 

Also, please CC: kexec@lists.infradead.org, this series helps the live 
update, and kexec performance.

Pasha
