Received: from jpms-ob01-os7.noc.sony.co.jp (jpms-ob01-os7.noc.sony.co.jp [211.125.139.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E787733F5B3
	for <driver-core@lists.linux.dev>; Fri, 24 Apr 2026 09:17:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=211.125.139.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022234; cv=none; b=pvSbQ1puAip0FMBlTl2QHpGkpyqrtpOloc7qRsVXThuU3Ky2ZW4DXXhSxdT6GF9q0doGphZl9K7v/z3xXe+vtHJVwnK3HXq6Fy5GTuVOeoXpghj7Cjm/uxddgmXjFrPELvjTSBy4PCI23Cf18gcAh2Mf3hGO5uR44KbsUbe+cuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022234; c=relaxed/simple;
	bh=bkoHMU+PeltrWkn2kqvecUbCA/8Rd74DWc3ZLYVgJnY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=L1Z7KN/HNkMccCgGwxtmzHoSlSC7vNShsDgxZVknQkHo/7JAMGl7gNx3p5Uxzsbbd6hoVTWJkGiUd8+aLzJeajhG9wb/cjqV8MrmsdrFixZNo15DthfA46E/jJmzW4dtz1lt5tg0rXu7CBXND8bK6iPDaAnxWX1UOKWTIXTsVLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com; spf=fail smtp.mailfrom=sony.com; dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b=eIkZ10rl; arc=none smtp.client-ip=211.125.139.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sony.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=sony.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sony.com header.i=@sony.com header.b="eIkZ10rl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=sony.com; s=s1jp; t=1777022232; x=1808558232;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=z3CeKJzlL9L5e/i5qCTLBtx/7vOhA4o/U3gUBdeSPBo=;
  b=eIkZ10rleqGhU3gsCsKfwLwhpgLkHcybQYBf6W3QGVXxoB6EzbD8rP/R
   VvQd1UiRRt3p4u1uQBLmeAZ+UcB6xbfV/Wi0//ZM4KrnPzeW6iV0cu4TX
   1xT9wfREBh7yMK+Ij4NZU0Oe51+j8/5Mp+OLrtdXsPWaWsNEABbSeTD69
   3tPb/ZQFwwraaoXWaykXyttS6XuyV++jr4ccFN7upx/FIehsFvBqW8sDS
   dVBnhPk5PNFdT1KRFcuuK2zCgkZPjKcaRxsDiypYD7TiXBAXNiG7K5kLB
   YfroeKBoWyTqtwGgAKcxz5lk3es+2dBbsIDjfX5feZUsYTI/HEj0+6WLH
   Q==;
X-CSE-ConnectionGUID: Gh+AezyTTXm00m9eAi6Glw==
X-CSE-MsgGUID: fMdKpmv+TQqojlv1RGXn5w==
Received: from unknown (HELO jpmta-ob01-os7.noc.sony.co.jp) ([IPv6:2001:cf8:acf:1104::6])
  by jpms-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 18:17:04 +0900
X-CSE-ConnectionGUID: vg91C+9wTYuqSdSyCqL2wA==
X-CSE-MsgGUID: qQfXLFtnQi2pXFgzuVJRUA==
X-IronPort-AV: E=Sophos;i="6.23,196,1770562800"; 
   d="scan'208";a="62774146"
Received: from unknown (HELO JPC00244420) ([IPv6:2001:cf8:1:573:0:dddd:eb3e:119e])
  by jpmta-ob01-os7.noc.sony.co.jp with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 18:17:04 +0900
Date: Fri, 24 Apr 2026 18:16:59 +0900
From: Shashank Balaji <shashank.mahadasyam@sony.com>
To: Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mike Leach <mike.leach@linaro.org>,
	James Clark <james.clark@linaro.org>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Richard Cochran <richardcochran@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Cc: Rahul Bukte <rahul.bukte@sony.com>, linux-kernel@vger.kernel.org,
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-doc@vger.kernel.org, Daniel Palmer <daniel.palmer@sony.com>,
	Tim Bird <tim.bird@sony.com>
Subject: Re: [PATCH v3 1/4] kernel: param: initialize module_kset on-demand
Message-ID: <aes1C8oJs3Vxnj6y@JPC00244420>
References: <20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com>
 <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260422-acpi_mod_name-v3-1-a184eff9ff6f@sony.com>

On Wed, Apr 22, 2026 at 06:49:03PM +0900, Shashank Balaji wrote:
> module_kset is initialized in param_sysfs_init(), a subsys_initcall. A number
> of platform drivers register themselves prior to subsys_initcalls. With an
> upcoming patch ("driver core: platform: set mod_name in driver registration")
> that sets their mod_name in struct device_driver, lookup_or_create_module()
> will be called for those drivers, which calls kset_find_object(module_kset, mod_name).
> This fails because module_kset isn't alive yet.
> 
> Fix this by initializing module_kset on-demand in lookup_or_create_module().
> Retain the param_sysfs_init() subsys_initcall to ensure that module_kset is
> live after subsys_initcalls (assuming no OOM) for any users who may need it,
> on the off chance that it wasn't init'd on-demand because of no
> pre-subsys_initcall drivers.
> 
> This on-demand path can trigger before subsys_initcall. kset_create_and_add()
> be should safe in those contexts because the allocator is up and running by then,
> no userspace to start uevent helper or listen to a uevent socket.
> 
> Suggested-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Co-developed-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Rahul Bukte <rahul.bukte@sony.com>
> Signed-off-by: Shashank Balaji <shashank.mahadasyam@sony.com>
> 
> ---
> 
> Patch 3 depends on this patch.
> ---
>  kernel/params.c | 41 +++++++++++++++++++++++++----------------
>  1 file changed, 25 insertions(+), 16 deletions(-)
> 
> diff --git a/kernel/params.c b/kernel/params.c
> index 74d620bc2521..f25d6fda159c 100644
> --- a/kernel/params.c
> +++ b/kernel/params.c
> @@ -745,6 +745,26 @@ void module_param_sysfs_remove(struct module *mod)
>  }
>  #endif
>  
> +static int uevent_filter(const struct kobject *kobj)
> +{
> +	const struct kobj_type *ktype = get_ktype(kobj);
> +
> +	if (ktype == &module_ktype)
> +		return 1;
> +	return 0;
> +}
> +
> +static const struct kset_uevent_ops module_uevent_ops = {
> +	.filter = uevent_filter,
> +};
> +
> +static struct kset *__init_or_module ensure_module_kset(void)
> +{
> +	if (!module_kset)
> +		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
> +	return module_kset;
> +}

Sashiko's review [1]:

	Could this cause a race condition if multiple threads try to initialize
	module_kset concurrently?

	If asynchronous driver registration triggers this path concurrently before
	subsys_initcalls, is it possible for both threads to see module_kset as NULL:

	Thread 1
	    if (!module_kset)
		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
		/* Succeeds and assigns a valid kset */

	Thread 2
	    if (!module_kset)
		module_kset = kset_create_and_add("module", &module_uevent_ops, NULL);
		/* Fails due to duplicate name and returns NULL */

	If Thread 2 overwrites module_kset with NULL after Thread 1 succeeds, wouldn't
	this orphan the kset created by Thread 1 and cause all subsequent callers to
	fail? Does this initialization need synchronization to prevent this?

While all pre-subsys_initcall platform driver registration happens
synchronously now, on the boot cpu, asynchronous registration may be
introduced in the future which would silently break this patch. Either
way, it would be better to be safe with a mutex.

I also noticed another problem with this patch: kset_create_and_add() is
called as long as module_kset is not set. So in the case of OOM, init
will be attempted as long as it succeeds, even beyond subsys_initcall.
While the current behaviour is to init only in subsys_initcall.

Both of these can be fixed with a DO_ONCE_SLEEPABLE-based
initialization.

[1] https://sashiko.dev/#/patchset/20260422-acpi_mod_name-v3-0-a184eff9ff6f@sony.com?part=1
