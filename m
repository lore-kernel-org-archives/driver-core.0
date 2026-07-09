Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E076C2FD1B3
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 17:15:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783617325; cv=none; b=sxOfMEUbdIX7eTt2E+m1tH9xvRVOSDYEHtsE2WebF5L+A6pBuLK92qNx+JbGLa1Mo/JPD0gbhNcN/zsOzedRMHDwJraxGmd5hwZU/WzafGVTK/mcKqW2sHJG2q8YDXOCXtZrIopTdyEOHzZ3CaTfYbjbVAQidi4zaMgNXrP3yRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783617325; c=relaxed/simple;
	bh=SzROYG8BwD/EB/+MUjQ4u1vhoaHs3/zZwllWfULF+qU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GU6UXce7BIR8O+P2lnuH1ru6I9Hpf/98mhtFPtXBIWOH+8njDKOCMzhmRMIJEgDF7lTRgTgaCnkQH7b2DmQDoVtCE7h8h+cUmwNr2JXGHYlEVCAiWaKLMyltkWWXNscr4zhR0066hr2jYyDVRx0RiIFmuRdggccK9wL0WZ4LtKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Hrn35nOI; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Hrn35nOI"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8ea70ca4fc8so706056d6.1
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 10:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783617323; x=1784222123; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=46UkRwT/i/djJx+KopbYZyKUrVPhRVpwIJdu7TzJpII=;
        b=Hrn35nOIfeGnrCiFaOEVOhKWW88rGGJrF+pOlvdk2Jn8bLawYbt0V4oA11mAhzm0Fd
         A1FRnrQZzMv4pZ5hzkqA4DV6BfUp3fAS8FFFGhamhAJ80tcGi3ZwjMxonFeFc7mPH23L
         sfusu7v/en3yIdzpgS4MhGEPYrmjpSbkv4LR58iMVyozBtEGcD/HXQAnEB4HcAzTz7HZ
         ivlCZNTEo00lkV/yb92E+XWzkHRTdDYVRBFw4+H40X04LQrhM9j9FCiiW2BEEPZSmXTE
         nqCeN4kJScY7Wu9Bqy4GGCDT+h04P+YafXEk2Iz3V4xnlUiWHkH6u+mgtQ9qNe3q+g1c
         K8vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783617323; x=1784222123;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=46UkRwT/i/djJx+KopbYZyKUrVPhRVpwIJdu7TzJpII=;
        b=VM7Ql0m6x4T0/+/UlPr68djOqEd0A6vcWA9aAFPCyvIWVSY3tW7GaCDtUHGIFZeQ8k
         I1VvN58L+7Y9ureny9x5KqFcTwq766KFXVU+1sYCQmK4rOpKKaq/B9Zyiyiynsdy3uBo
         qSSdXvNo0yt4A7oUvOq3xIdBBFzAuif0Ojugb9bBY22jmN3ccbHlOPPnklMFG+EOJXNh
         Krwo/VMGEmBC9NoFR6/yyE9LJ7I1F5UOpkeKGrG9WauIyGOC/4hGOt7+Vra3S3jXuQmW
         OzhgoeDygNgm/N0DD6ao8hDj6l5vZ5hGln9BNnjb5tnsk0cOEt/NWEJYjW2dV27F90ej
         qyKg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9ScdyExfp90diHRO4s+Z55d/G45zalDO2ztG9CVBEfvxHgVyhcb4j5mwgWYZqlkJb0BPytH5vzY+XCA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy+wmfkfGLR4k8JzCa04scnpg04FiY+NhB29vHLVc0NYYpPIWwU
	Sm5HURoF56GMEHVno8Ek2jCRTnFBW/J3UAuOmuOPwEVstoAZa9XKUQ6/Duf6H4tLz2o=
X-Gm-Gg: AfdE7cnuEWLyc+BV+yR1J9YX59/yZYqEXIneAWtz3jnMSXzTUxaDbYtGlFg5CE7ttdW
	O3Yum6wY72r7zKUnYP4rqPmL4aE4JixeBBl+1ukxXhsxypy68nbRfC6/7zlu8h16cTtwWMge7Nd
	H6jF5ykXdtw8QiH60zFGfazpWaJoEoqaLH9nb+L/9Luq/2Hhs7sNfejWVG0zuUO4GpQ0PqCsX+w
	N2SyHNCJf+50QWdarEmPXRQ9OOopMq3PZU9dfkhe0yDUZ1Uv4MIyRJbFOWUI2Z5OOroONbNKndn
	Nj3I7IQiC186UJpsVO+QhJ7CdAkCVe0EmJ3Gd73Y+8u5Wu947oWEkANHTWX6aK1LZLHoWt8iJG2
	g+8uDEVVBF/eWEXbeYUc5RW05YXzMARpo0951tKZ4R6hNBngHu17j6giiuqc+XI+LK8zZCt3Z02
	QXgZyXdjaS6jiAyrv1OD1nj8EHGk9I0i/aLA77mAnHQdIRoKa5w46TpbEHBBPjwPRwaaS+
X-Received: by 2002:a05:6214:6014:b0:8e9:f45f:107b with SMTP id 6a1803df08f44-90242143c3amr1641696d6.34.1783617322803;
        Thu, 09 Jul 2026 10:15:22 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd7c1d8fcsm22085656d6.25.2026.07.09.10.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 10:15:22 -0700 (PDT)
Date: Thu, 9 Jul 2026 13:15:17 -0400
From: Gregory Price <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 06/10] mm/memory_hotplug: add
 offline_and_remove_memory_ranges()
Message-ID: <ak_XJWglABmKfSiU@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-7-gourry@gourry.net>
 <ak9ee95F7pJpCKMo@MWDK4CY14F>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ak9ee95F7pJpCKMo@MWDK4CY14F>

On Thu, Jul 09, 2026 at 04:45:51PM +0800, Richard Cheng wrote:
> On Tue, Jun 30, 2026 at 05:18:38PM +0800, Gregory Price wrote:
> > +/**
> > + * offline_and_remove_memory_ranges - offline and remove multiple memory ranges
> > + * @ranges: array of physical address ranges to offline and remove
> > + * @nr_ranges: number of entries in @ranges
> > + *
> > + * Offline and remove several memory ranges as one operation, serialized
> > + * against other hotplug operations by a single lock_device_hotplug().
> > + *
> > + * This offlines all ranges before removing any of them.  If offlining any
> > + * range fails, the entire process is reverted and nothing is removed.
> > + * This provides a fully atomic semantic for unplugging an entire device.
> > + *
> > + * Each range must be memory-block aligned in start and size.
> > + *
> > + * Return: 0 on success, negative errno otherwise.  On failure no range has
> > + * been removed.
> > + */
> 
> I think this can return 1, and it shouldn't.
> device_offline() returns 1 when a block is already offline, and phase 1 passes that value through as-is.
> 

I just realized try_offline_memory_block() already clamps the value to 0

static int try_offline_memory_block(struct memory_block *mem, void *arg)
{
...
    rc = device_offline(&mem->dev);
...
    /* Ignore if already offline. */
    return rc < 0 ? rc : 0;
}

But this is a bit non-obvious, let me see about making this a little
bit clearer.

~Gregory
