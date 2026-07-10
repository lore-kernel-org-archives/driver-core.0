Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCC1F345CD0;
	Fri, 10 Jul 2026 14:19:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693147; cv=none; b=cssFThiO2gJaR6Tm5BwougVLDwy3FmS2LFIKmV3onn1GQImCAxCiZkR1DHsfRXIL2FwismBxStWqnb26l5kMDkOuvwy0hgtFYPLiNVJtE8ZJtj4imX1HTOER1535BHHsEYdRLI5/iF4xbrFcgniFCW9gRAHmQBwiAL88gOIqMOI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693147; c=relaxed/simple;
	bh=D0XW0yxa3uFAebEZSvCDyYdcq5jFfVjeGmhh6Xta2Ig=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PIo8QvlCEjNRS+QCh1i8xSaXlVw7qasxpAXVLUItEgEvS+cGN2TXJCKxfr7ahWCfz+6C6efi72Gun60VP2QMNIWgtpVOj6TAxBZzo28hrXFFOxrvhOiGpo4qM3y43k2nNL3GPLDXEXLzGUaOeD+TAczoRzG2a0KoNoUwuRVZjLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=qFlaihad; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="qFlaihad"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF0A51F000E9;
	Fri, 10 Jul 2026 14:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1783693146;
	bh=YGhxiQ2wHg/fmfhidZ4pixyfl1k6upbKB+lX0ueY5go=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=qFlaihadj2osXgYoq5pgN81gSLfdraUFeTRyznRcKUEMTtPKCZrr9NmUkUTDtejqN
	 1W+OIAZkXybtMXrNqkqSVGJBlfSBX2JHHnZPWNVTGp4xhYQ/Tx7xjeY4yjRBed1+G7
	 q7az5F8YauhjZC+poa5Z/WLIzhcF1cqXxyNDRTZE=
Date: Fri, 10 Jul 2026 16:19:02 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Pavol Sakac <sakacpav@amazon.de>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	David Woodhouse <dwmw@amazon.co.uk>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>,
	Pratyush Yadav <pratyush@kernel.org>,
	David Matlack <dmatlack@google.com>,
	Samiullah Khawaja <skhawaja@google.com>,
	Alexander Graf <graf@amazon.com>, linux-mm@kvack.org,
	kexec@lists.infradead.org, nh-open-source@amazon.com
Subject: Re: [RFC PATCH 09/14] iommu: lazy-populate iommu_group
 reserved_regions/type attrs
Message-ID: <2026071045-pushcart-duller-c3fa@gregkh>
References: <20260702174033.32116-1-sakacpav@amazon.de>
 <20260702175114.24659-1-sakacpav@amazon.de>
 <20260702175114.24659-5-sakacpav@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260702175114.24659-5-sakacpav@amazon.de>

On Thu, Jul 02, 2026 at 07:51:09PM +0200, Pavol Sakac wrote:
> +	/*
> +	 * Defer reserved_regions and type - both are read only on
> +	 * VFIO/iommufd ioctl paths, so let the populate callbacks
> +	 * materialise them on demand.
> +	 *
> +	 * KERNFS_LAZY MUST be set before kobject_create_and_add("devices"),
> +	 * which calls kernfs_inc_rev() on this kobject's directory and
> +	 * would otherwise leave a stale negative dentry cached for a
> +	 * missing reserved_regions/type child.  WARN_ON because
> +	 * iommu_group_alloc() controls all group kobjects directly.
> +	 */
> +	WARN_ON(kernfs_set_lazy(group->kobj.sd));

You just crashed the kernel, that's not nice :(

>  	group->devices_kobj = kobject_create_and_add("devices", &group->kobj);
>  	if (!group->devices_kobj) {
>  		kobject_put(&group->kobj); /* triggers .release & free */
> @@ -1091,19 +1210,6 @@ struct iommu_group *iommu_group_alloc(void)
>  	 */
>  	kobject_put(&group->kobj);
>  
> -	ret = iommu_group_create_file(group,
> -				      &iommu_group_attr_reserved_regions);
> -	if (ret) {
> -		kobject_put(group->devices_kobj);
> -		return ERR_PTR(ret);
> -	}
> -
> -	ret = iommu_group_create_file(group, &iommu_group_attr_type);
> -	if (ret) {
> -		kobject_put(group->devices_kobj);
> -		return ERR_PTR(ret);
> -	}

Why isn't the driver core creating these properly on its own today?
These calls should not have to be done.  Also, what's up with the "raw"
kobject?  That's not ok, this is circumventing the driver core in a way
that is not going to work out at all (as you are finding here...)

thanks,

greg k-h
