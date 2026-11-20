Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795208653;
	b=xnXOe3Zjousjt1w5s1PntUfF5y/cj0KU6LqVva6S1EQOt1hXnznlKDC3dtqmfOn8BTBX
	 R90HNWRPiQwy35sVmhVQ4wIc/p3uR5SXDnZOQnQ5MVIVV+Uy41uV7r0VpSI+FAPN3EwXg
	 hI9GUu1TbF65vhdG4iBbYtszPszbnqzbIvDkGpTirEH6lDSJTFlsNognhBY7sbtY8Fm3k
	 grVxF1VyM6dsLDC1nKvj+dHMPbCjbgZZIKpm8Osc67ZIhE0ldZsKTa1uoAuW2CMwE3Y9W
	 LNC8kzru1jy4lk8e/9bfBAEVebi2jBsr9NB0GbFriwyqLEuE2cu1BoOSiAHCFcs7yJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795208653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=/ru90xVBZjCMBPo2fB3f1IAfOuYApIQHIQMbSW86U10=;
	b=cD/KoOZocr+wrgYJ1h7ckqrIk1bBHryaXYOVKP21GbAmqFgzgJcszz4NBfI7KLxAQxVS
	 vZJx9Pne8lnonl5d3iLwsnHn6PPH5clsR6/+HFaVC2glDU42KMKkWZAEIw2+U2LeK/IO/
	 Ol7h5Uur41U/e6DZQ8U/YVVcUnd+ITBhV6Wabim3H+qAvOL4KrpJm2w8sL+H2wgutqepW
	 ZRHmBFEbheIRumnHrP7XLpuZ1FxEaRxMJPIhoF7UBmWgf/XRQrOQgiZeavn8RN1VL5gyK
	 MUaM25LF9zCwnEUtAtrqHR0jyfs+DNMeAfvbwNCvOLol1tAEg6yohW4+TyCIlMj7kxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iF9HBCZN;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D27D0606A687
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 21:04:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D27D0606A687
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=iF9HBCZN
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-385c497bf94so2365382eec.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 13:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795208650; x=1795813450; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=/ru90xVBZjCMBPo2fB3f1IAfOuYApIQHIQMbSW86U10=;
        b=iF9HBCZN0b+9y+dIgtvnjIyj174apSjg+E6wLNrIbro1UoK6Am6HwG558PY9wfxkl6
         tFh23ze7N4bNWoPw66lrI4qI1gxz4wL6gmw60FYWcozWh0gVcwhY/mlUwfBIQH2NYoew
         erdfZR563aS5ms9nTvki3tK6elE5c9n7QjtZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795208650; x=1795813450;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/ru90xVBZjCMBPo2fB3f1IAfOuYApIQHIQMbSW86U10=;
        b=T9RoTtErEmodN09PhbqmZEWG5ZSSoxhcuAgjFgROVIzy0cqmfj1LazaSE+CREfw1GJ
         onS+HUopfNC4E8eAY5vdoOJicFjFpy0dPVsdTxDI3MmAGgf7oKQwWV2IqE3K2SI4iqar
         8D+D5uFc9I+bsIW20n3WK8sCHArLEuRUWN8+2gVE2gepWUhyfGBP5ifWT8c7O86kodQu
         Lv1++nw/TgE56dVq08ogOSsmRtnk3J0TKQus5PUDBf9z20T7qT0bnuhjTOZcRjWINKnD
         UI+uA1QMnQOVtZQ07G82ZVK7fufz8F+x5df2W5cVs2qw3z8z+I15tPU7/fakYBWP3Pxq
         DL+g==
X-Forwarded-Encrypted: i=1; AL+hErHcV5mqvKIDFyH3OHHdp9n468mESBLpxVS3COuWAaY2MorsAsplhuQIMzVFj5l2fnh+tlmHuGug+a3avQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8SnJovEXDlKGLQozGCmYvS3kegQatulJy6/HZ7iBaK83tHNszF
	ZXeEr6SI8GE/rUIR5yijCYo1j9EohmzQmaw2+oxpjaBAxRjhEAoyKw5p/p1n32eRBQ==
X-Gm-Gg: AZFdTZdINv+7tOIWgPHJs6cVOsgNNVA0yNBSxWWHgK6gYSQeU0w+frtYrlAGEQA+qdE
	/dEd8BdleHHDgMblwLXZHfXVPciH4RRNMvYZYdfkYnHWif90MELQklQzVk+ctvRD3FM/koSCSt9
	VrbjrG7VRpJ1idZBa+6hQGDrK4ywU2K7Klewfyvr3rolQH3Zqd8+eHh2XSsIn29gAZSbpTCTY/x
	yzmRqsIGc8RIkEq1o7KUlSidJqEZou5yXpaf6gPpfqNTmOCp2CXUQrfW+UmgoL+5bkQIntCnCoH
	TSOryo8ktJDTeGund3PbDcrPATMhyPO3yViKLAjPfm0+UNDIASMmoLY1F3/+7nhJ+MTjUQV4Inf
	Mm8XdCeAnSea1gWQZpuvYSAUoEHNGFdVBhSCBKOWtI6HrpH27C3K3VzhjtlK6L/4UXpd0NAMRY/
	OdZpqeQwKjO2x6+rimcd0Ozw3WBfIbnEFHGgzenBHabw9jWwsYsE6vvoxgbXfY5NJgvAab4csXc
	KBk9HDmAU+eGyZqQvyI4Ssy72RbvvN0z81yv+Yll2k4hQUxT+Mf5/Z4djJK9GAIirnjKd3Gn2sq
	YCEySevaeg0pPEg3PxL0npHxyBINv53WRshY030ZxgoPfiUHMh1S39yi/aa49k8PL1Wq
X-Received: by 2002:a05:7300:f283:b0:386:9854:9123 with SMTP id 5a478bee46e88-3869854950emr974034eec.14.1795208649910;
        Fri, 20 Nov 2026 13:04:09 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:ec05:65c0:ffe0:d597])
        by smtp.gmail.com with UTF8SMTPSA id 5a478bee46e88-3856456e6c6sm9889709eec.2.2026.11.20.13.04.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Nov 2026 13:04:09 -0800 (PST)
Date: Fri, 20 Nov 2026 13:04:07 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Linux Driver Core Development <driver-core@lists.linux.dev>
Subject: Re: [PATCH v1 3/4] PM: runtime: Let devices suspend after an
 attempted resume
Message-ID: <awC1xx1Wi2BYo5rb@google.com>
References: <1978814.tdWV9SEqCh@rafael.j.wysocki>
 <10954171.nUPlyArG6x@rafael.j.wysocki>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10954171.nUPlyArG6x@rafael.j.wysocki>

On Thu, Nov 19, 2026 at 09:17:51PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> On a successful runtime resume of a device, rpm_idle() is called by
> rpm_resume(), but only if the runtime PM status of the device was not
> RPM_ACTIVE when rpm_resume() was called, which is inconsistent.  For
> instance, if the given device uses autosuspend, an autosuspend timer
> will most likely be started for it after it has been actually resumed
> by rpm_resume(), which will not happen if it is already active when it
> is passed to that function.  This may lead to observable differences in
> behavior going forward.
> 
> Address it by rearranging rpm_resume() to call rpm_idle() also if the
> device has been active to start with.
> 
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
> ---
>  drivers/base/power/runtime.c | 12 ++++++++----
>  1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 5a0b4600c244..1a3b32e299d8 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -794,7 +794,8 @@ static int rpm_suspend(struct device *dev, int rpmflags)
>   * suspending (deferred_resume) or wait for it to finish.  If the RPM_ASYNC
>   * flag is set then queue a resume request; otherwise run the
>   * ->runtime_resume() callback directly.  Queue an idle notification for the
> - * device if the resume succeeded.
> + * device if the resume succeeded or the device's runtime PM status was
> + * RPM_ACTIVE to start with.
>   *
>   * This function must be called under dev->power.lock with interrupts disabled.
>   */
> @@ -840,7 +841,7 @@ static int rpm_resume(struct device *dev, int rpmflags)
>  		 */
>  		pm_runtime_mark_last_busy(dev);
>  		retval = 1;
> -		goto out;
> +		goto success;
>  	}
>  
>  	if (dev->power.runtime_status == RPM_RESUMING ||
> @@ -971,8 +972,11 @@ static int rpm_resume(struct device *dev, int rpmflags)
>  	}
>  	wake_up_all(&dev->power.wait_queue);
>  
> -	if (retval >= 0)
> -		rpm_idle(dev, RPM_ASYNC);
> +	if (retval < 0)
> +		goto out;
> +
> +success:
> +	rpm_idle(dev, RPM_ASYNC);

It's super common for rpm_resume() to be called with a non-zero
usage_count (e.g., all pm_runtime_get*(), pm_runtime_forbid()). Do we
really want them all to turn into rpm_idle() (and predictably fail)? For
one, it adds a lot more trace_event noise.

Maybe we could check RPM_GET_PUT before doing this? Or check
usage_count? I wouldn't want to go too far on re-implementing all the
rpm_idle() pre-conditions though...

Also: I'm not quite sure what's *really* expected here, but drivers like
drivers/net/ethernet/intel/e1000e/netdev.c (no autosuspend; they use
.runtime_idle() to re-implement autosuspend, more or less) might see a
change in behavior. For example, see its watchdog, which does:

	/* Cancel scheduled suspend requests. */
	pm_runtime_resume(netdev->dev.parent);

For cases where the device stayed RPM_ACTIVE but usage_count == 0 (very
common, I think), this does indeed cancel any pending suspend timers,
but then it immediately queues another idle request. (That idle request
will end up failing anyway, so no functional issue. It just means the
comments are a little confusing.)

Do we really want that? Or maybe these drivers are just outliers, and
should be rewritten anyway.

Brian

>  
>  out:
>  	if (parent && !dev->power.irq_safe) {
> -- 
> 2.51.0
> 
> 
> 
> 
