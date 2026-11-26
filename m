Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795657440;
	b=t4t5BMP9CZRVmoxH3EiDEKkJ1L1FBNLZX9+fQVPI59Tbfk+GlN7tE0x+lswsIhSOuzk+
	 1bSD48LS0zmo37AsWqabd3BwVLLBe3RplQg8qpOxyOO7+WpLtxEJ3At9/0P+KKCYp9uES
	 3++hPm+THnmu8G5NHBsrNw5irum4EVrIZqXEgO5GsrUbq6E0D67YlpZMcCK9hWlqqnIx/
	 GXiwbh6a7dRAQyJ4Z5I4RAyX25Z94sns1LVGKSHuqN6OTjLWVwlgKk/gGY0mVOJrX2FyB
	 YEn6cRm0l1NFeMShdfXA2h4W5/EOwMHEV86XGLKXbNPLz8kgLHRXcy3kh35g1hMwltA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795657440;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=AFisO35luVz7D0pUNKhFDLCSWhonN1igyPUQPBbXnsM=;
	b=VE8KJkfLiGkHzIcX4wlUK8F+6OO9dUwk71Ty8+er6HY9+9Hac31uOWddt4VfGhbjuG3h
	 NcwrFloDKtWZvNs8FCFUo7Nk+fNmASneZn1fqTBL7xaT4YAZa3x4u8AfN7yY1vCZH6Zvk
	 eBssYj+Vu5ka477E0uB0XbR6fuILAn4CcogB+4iGsqCQmI6urcQ2wraJzpIaXn6nkGy9F
	 E7llZYsRpsSQY/v26lxMnsIWoFUmBWHk9hR9OKFjdkDKXSl/S/bY8H4ty+m3qFgtqnGjV
	 sOxf6J9zsJtdfrAcCSRxakxz9CgxfUgWIwVkX75BsXSLhUp4FuIhgF09EogNUM1CGCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mQiLYiMd;
	arc=none smtp.remote-ip=209.85.215.175
Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39C8D606A321
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:43:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39C8D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=mQiLYiMd
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-cdb1199bfd8so3046610a12.1
        for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 17:43:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795657439; x=1796262239; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=AFisO35luVz7D0pUNKhFDLCSWhonN1igyPUQPBbXnsM=;
        b=mQiLYiMdoA80gKImzwgHgBgb/DMckl+6gIzbGpDFcTwAOR5Gm3EVxAjQxyt8G/BSyv
         shZNQ5wPhJeK6/mnAS+aP90KdkSX1B16LXFrLW8E8M6M5qdi+AtKONOP6RnPAsOW3n90
         D05/18TnCnhrgaVJHTfA2AivOuHkAW/RMIyNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795657439; x=1796262239;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AFisO35luVz7D0pUNKhFDLCSWhonN1igyPUQPBbXnsM=;
        b=ejAzGBa/1NDL6c2Dy9yhV6uUHjADilHEFI+v5fDeK8QtA7EO+maIWT+DjCqjZslZP2
         /Io0y8AThJ8+t6keffYJE92SZ2CRXVZSnk1c6nuCOC0VWtsKOdJev7ZSxasShDY/4SEa
         axFB+WL6+hkIM+8hkdEOP2jjqe0LZ9xtIz+irdmNqSMOBcFpDxMPknYk7K9nXH3POl1Q
         6SvWr/v/tjPJmURmZCIWo6xtyaC10Ujsr4mLjdWNeN4agPJS7dIZ+2ru4u9Df1KxR5fm
         yaZ69lvCie4lADnQxpPjtcqeHo0F1i254amYHNWL13IL1Gw7GYAqOV/VtrQ837sa4dt+
         Osaw==
X-Forwarded-Encrypted: i=1; AL+hErGyoCqv+FJdtioEM+F6pmrDLh/1nDAleGLj7iNNGDep7ya2y/F3umpSzdaOAPGCJ7BnU0Bh1bowpoo1lQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/1KWUWiTAxVEvsBs3V9rY1IqIv5J+ENPalAsu+f8et4mwrelGS
	8O2fMmXd1g2HgGbck/JAn5S2a8uX8XSJ/jWYy4IJAU8A1AZ2RUJwqkZlNvxAvt0oFQ==
X-Gm-Gg: AZFdTZe/Bfeyr/k8Aq0fVZZGNsrAaY65W5hSmEO9286y4Q1ws2aXBvT4RTXcxkDGMS0
	JQZuezgyaeQV3U+/PLgXD6OjcddhoH7fQ+er4looZZRVyv8Ux39NWUC22mFHavHD+cYdiCUm1Iv
	9qV3dZqKj4+/qwHRDnOotG4EN2oN4SNWApE4CNzhaMfU+Gn5vvuT64KjjWuoO/YX3uOjR/wwcr5
	tXYy4wigvK7EnioMzyYX4hB4ZgnbM+PiuNq0P3c1edGx/+XNE47igpQP7VA5l56zxPwXeSbKyig
	BT2zfXVtYfdeGg6njxTgr9DVewFdHGnWleqIzgzozCyGXHQDgXFCRdtE7Yf3eplMOY7SzExkTxl
	4ItlUhSthx5hQwlPOaq7DPJ6JHsrRADG8cddMnU/jFRAN2LovpGXBDSjjsyoKP6Mev8e0SBxy5j
	brgeN1Nwm+R1QKbq7I2gx4AnKPRXCD+8L8Rsqg+rgipNS7igq7r8OHIdyLxbhpjD2L9HdaWy628
	m42xqxe5JaTuRpk5hT2SgzWDwPER3LzQ8M3xbG/TB+JowBG5ePgjSlRGujfU2MsLM2kKqRVrQ5Z
	AhWYxgNr/RfUB+MwubfU+CLkiutIeFrLouA5kw2PRQoBq/+gDjOFaqZxQ1ABhxz5OJC/
X-Received: by 2002:a17:90b:4483:b0:3ac:bc3d:6fe8 with SMTP id 98e67ed59e1d1-3b41c92f8f9mr17541539a91.34.1795657438637;
        Wed, 25 Nov 2026 17:43:58 -0800 (PST)
Received: from localhost ([2a00:79e0:2e7c:8:dda6:7575:bbfe:db80])
        by smtp.gmail.com with UTF8SMTPSA id 98e67ed59e1d1-3b405ec698dsm32577442a91.14.2026.11.25.17.43.56
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 17:43:58 -0800 (PST)
Date: Wed, 25 Nov 2026 17:43:55 -0800
From: Brian Norris <briannorris@chromium.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Linux PM <linux-pm@vger.kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Ulf Hansson <ulf.hansson@oss.qualcomm.com>,
	Linux Driver Core Development <driver-core@lists.linux.dev>
Subject: Re: [PATCH v2 1/4] PM: runtime: Add memory barrier before reading
 last_busy
Message-ID: <aweO20KV0XzcPBeF@google.com>
References: <4779892.LvFx2qVVIh@rafael.j.wysocki>
 <14142601.uLZWGnKmhe@rafael.j.wysocki>
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
In-Reply-To: <14142601.uLZWGnKmhe@rafael.j.wysocki>

On Tue, Nov 24, 2026 at 04:31:51PM +0100, Rafael J. Wysocki wrote:
> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
> 
> The users of pm_runtime_put_sync_autosuspend() and
> pm_runtime_put_autosuspend() can expect that the autosuspend delay of
> the device will be respected after calling one of them because they
> both invoke pm_runtime_mark_last_busy() upfront.  However, that may not
> happen due to a leftover autosuspend timer running when the last_busy
> update takes place, in which case rpm_suspend() triggered by the timer
> may run in parallel with the lockless last_busy update.
> 
> Namely, the last_busy access in pm_runtime_autosuspend_expiration()
> called by rpm_suspend() may be reordered before the initial read of the
> device's runtime PM usage counter in rpm_suspend(), and if last_busy
> gets updated between those two reads, the update will be missed and the
> device may be suspended right away.
> 
> To prevent that from occurring, add a read memory barrier before the
> last_busy read in pm_runtime_autosuspend_expiration() along with a
> comment explaining the reason for adding it.
> 
> Fixes: b3db492e8335 ("PM: runtime: Mark last busy stamp in pm_runtime_put_autosuspend()")
> Fixes: e24e0630b5ba ("PM: runtime: Mark last busy stamp in pm_runtime_put_sync_autosuspend()")
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

If you're into this sort of thing:

Reported-by: Brian Norris <briannorris@chromium.org>
Closes: https://lore.kernel.org/all/awC0tcqgq2KvCyxO@google.com/

and

Reviewed-by: Brian Norris <briannorris@chromium.org>

> ---
> 
> New patch in v2, based on
> 
> https://web.git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/commit/?h=linux-next&id=26236a3e8803f7e1ace104020d7f006edb220116
> 
> ---
>  drivers/base/power/runtime.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/base/power/runtime.c b/drivers/base/power/runtime.c
> index 0b15c718c1bb..c295acf6a718 100644
> --- a/drivers/base/power/runtime.c
> +++ b/drivers/base/power/runtime.c
> @@ -186,6 +186,13 @@ u64 pm_runtime_autosuspend_expiration(struct device *dev)
>  	if (autosuspend_delay < 0)
>  		return 0;
>  
> +	/*
> +	 * Prevent last_busy updates occurring before the rpm_drop_usage_count()
> +	 * invocations in __pm_runtime_idle() and __pm_runtime_suspend() from
> +	 * being missed if the last_busy access below gets reordered before the
> +	 * initial usage counter check in rpm_suspend().

super-nit / feel free to ignore: it's a bit odd to write this comment
covering super-precise details of function calls, and then immediately
rewrite it in patch 2.

I think it might make for a better long-lasting comment if we just write
in terms of "last_busy update" and "lockless usage-count decrement".
Then we don't have to update it every time these things move around and
get patched.

Sample:

	/*
	 * Ensure ordering between the initial usage counter check in
	 * rpm_suspend() and this last_busy access, to avoid missing
	 * any last_busy update performed before the last lockless usage
	 * count decrement.
	 */


But again, that's a bit nitpicky.

I'll try to look at the rest next week.

Thanks,
Brian

> +	 */
> +	smp_rmb();
>  	expires  = READ_ONCE(dev->power.last_busy);
>  	expires += (u64)autosuspend_delay * NSEC_PER_MSEC;
>  	if (expires > ktime_get_mono_fast_ns())
> -- 
> 2.51.0
> 
> 
> 
> 
