Received: from mail-pj2-f42.google.com (mail-pj2-f42.google.com [74.125.227.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE2D472526
	for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 10:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789813709; cv=none; b=lBKJCiJYBPtO66curMp60t4ZAV0B+5aC0Z6YY8kxPTERfHpEwKs/Q+he7L+xXt7NKJQ1uX4wgOfOKu/Hdt21KDejcOcGcKHnYOX8BqAb3eVwfLUfuvqXqKRaFyXg3c49pk1awC2K0Vgf494irbyqL+JiDVr5QowqtlfPmF8Xb1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789813709; c=relaxed/simple;
	bh=5oMA+CY9eg2MPQW/ZzazYNrDQiFaMFZzkKAVWP9/XHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NtXsd/MvFHq+mE0bf79mVoKACg2m1p7VNHlsPD88KyL/gtM+jDtR53KOwv2isnr9SoWsUVcBNLtSfbxwP6RkMauPKzyOfmCyaPdysfzDcuQjPSi70J9Y5cVy1XwA8DcwUmsKNsRif/n+WxbkLGRtB52ZAnDXo9frZxS8Mch+y80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nG9lUZ2B; arc=none smtp.client-ip=74.125.227.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nG9lUZ2B"
Received: by mail-pj2-f42.google.com with SMTP id 98e67ed59e1d1-396ccc09d65so1493943a91.3
        for <driver-core@lists.linux.dev>; Sat, 19 Sep 2026 03:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789813707; x=1790418507; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=+T4o7Z4sldFW89gg456PmAN7vw155d0OxgwruAX/bjg=;
        b=nG9lUZ2BRDVIraaN7tF9NxLAWud104bb0Zv7mxCrugEZZSNWnZzzXV2G+eATgYX55Q
         JsQzmaB4CYEzDh6OxCbL27rSrLrKGqtLctHj9D1Zhzoqqp5LlpkQxZ0Phj+EHbLBNa84
         VsN+4/li/OlRQmh08YdRL9tzN425kt3xJBaghool2egV6FpZFfhl9t9Wktc3Hv9oHmtz
         nWRuc9LuPcGtNSvd1/zz2GX6onU8rujGYcNJerB3BM+xNb3GvfKhIllVYDJn70ql8unh
         Os8e3D+mdFZQkehBvwaJUvCzl1NLJ3d9BRMsQC9Jf8xCraXkJ6TQfin8xIPMRVSZmQs4
         0hmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789813707; x=1790418507;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+T4o7Z4sldFW89gg456PmAN7vw155d0OxgwruAX/bjg=;
        b=pnQE+rfW4S5LyAhw75a3Tp1NO/zFbtqbXT8U/jYgXaanzuyNWz2hPtOUrT/fA3d/lo
         i9af/SDCZd/LId6Vrx5ne0O+o2ilRus7fQs/aLp41IdEKTazlMWJI+ywXO2hZ8IfAj1F
         Rd+xdCAz2kXoxHRWDij+02b1vzfvtd5RyFmKNsSPTsQ4wH/MQAAPE75pAjY7wOOXabG1
         AnF9Ka5MXu4L+vh0w9VDaO+pvs+SIPzvVk3uusKvLnKu1HiArhAu1SY6/GBtA7UaaBAI
         is8JZTyxNH+KUnKpXfCAReGbXFOAVDUrrWvkk1xss12iVt0pwo/r4AaTcpxvRf7L4E+J
         WMpw==
X-Forwarded-Encrypted: i=1; AKwUvByPgRRZ8t/4QDHeOh8Qm2YNmnJbmcZEbzJyP6JmVolA66iStrROnmY+02xF8skLo5EkCm3qGnfZcO+NRQ==@lists.linux.dev
X-Gm-Message-State: AFuF++m3XAEe0SZo5gtlaiLERWYW3mc56t6ZA7gXPLGE3BMRQYY3coHs
	xSeR/ROYkqGrkrOi6dg3bOQg78cuqdhERnxp/ndKrutaSe2kA2q59fF+
X-Gm-Gg: AYBFou0wTFWH7QlQSA9Y7P3PureR1j7MYVjAOEOlemxzMAzXgXvUaMEDlDKvWVmQt+/
	cwmLIpuKLMRlt70A1ohSZHb7VCRm5cCTmelF7szNx9oPoAOtem8IWoJVZSl0SazALJjn2wNMhxj
	uWohKyfz+QcPqtUpx5Hzh5ix/wm83OfWHu5FpFL+XoeQKnGCoHaE6B3sxIYpXhsIh8VNROkCqMT
	CqyDMlCRIGo9Mks00fvEYpLZe4qRc5En6S8PrML9RX618ITRrwBYCK3S7kj7yBqn6JFYKbgJLoZ
	5i8r+JobYVJKT0dTQusd98N/ecKAQHpE2U4kwiNfdhV7FnhC5+r6ksXlrBVoR8GC6nDCInL3fEi
	Wi7oB4ii4D7UWwA/QzzfTmOesOwapTykv5UsvhwlqfmGODDhXeYddyuIGT79bbCF787BeVXVsGW
	gcdRrKqnZ63fMh3vEfYhQ7r7cGn1JZxnWSdRPxsoU+77EKal0Fl2diKD8PT6A9+HQNmph/13KCk
	Z3QK91hKxI=
X-Received: by 2002:a17:90b:184d:b0:39e:6a7f:1dcc with SMTP id 98e67ed59e1d1-39e6a7f222amr3389602a91.40.1789813707258;
        Sat, 19 Sep 2026 03:28:27 -0700 (PDT)
Received: from localhost ([118.34.230.2])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e6c615f05sm4060068a91.15.2026.09.19.03.28.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 19 Sep 2026 03:28:26 -0700 (PDT)
Date: Sat, 19 Sep 2026 15:58:25 +0530
From: Shaikh Kamaluddin <shaikhkamal2012@gmail.com>
To: Breno Leitao <leitao@debian.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <nao.horiguchi@gmail.com>,
	Andrew Morton <akpm@linux-foundation.org>, kas@kernel.org,
	kexec@lists.infradead.org, David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	"Liam R. Howlett" <liam@infradead.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>, Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org,
	"H. Peter Anvin" <hpa@zytor.com>,
	Brendan Jackman <brendan.jackman@linux.dev>,
	Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>,
	Oscar Salvador <osalvador@suse.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, hannes@cmpxchg.or,
	shakeel.butt@linux.dev, linux-efi@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, rmikey@meta.com,
	riel@surriel.com, harry@kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v5 8/9] mm/memory-failure: add hwpoison_boot_page() to
 flag an inherited frame
Message-ID: <aq5jyXzuDAANeCJs@acer-nitro-anv15-41>
References: <20260915-hwpoison-kho-v5-0-3bc7a57bd503@debian.org>
 <20260915-hwpoison-kho-v5-8-3bc7a57bd503@debian.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260915-hwpoison-kho-v5-8-3bc7a57bd503@debian.org>

On Tue, Sep 15, 2026 at 05:53:42AM -0700, Breno Leitao wrote:
> A frame the previous kernel recorded as poisoned has to be flagged before
> it reaches the allocator, which is long before memory_failure() can run.
> Add a helper that leaves it in the state a frame poisoned by this kernel
> would be in, so everything that already understands PG_hwpoison covers it,
> the kexec segment placement check included.
> 
> num_poisoned_pages_inc() does not work at boot: its per memory block half
> looks the block up by pfn, and memory_dev_init() has not run, so it
> divides by zero. Take only the global counter there. A hotplugged block is
> already there, so that path takes both counters as usual.
> 
> The caller comes later in this series.
> 
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
>  include/linux/mm.h  |  7 +++++++
>  mm/memory-failure.c | 26 ++++++++++++++++++++++++++
>  2 files changed, 33 insertions(+)
> 
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index b68824fcfbef19..8039830998dd4b 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -5225,6 +5225,8 @@ extern const struct attribute_group memory_failure_attr_group;
>  extern void memory_failure_queue(unsigned long pfn, int flags);
>  void num_poisoned_pages_inc(unsigned long pfn);
>  void num_poisoned_pages_sub(unsigned long pfn, long i);
> +void __meminit hwpoison_boot_page(struct page *page,
> +				  enum meminit_context context);
>  phys_addr_t range_first_hwpoison(phys_addr_t start, unsigned long size);
>  phys_addr_t range_last_hwpoison(phys_addr_t start, unsigned long size);
>  #else
> @@ -5232,6 +5234,11 @@ static inline void memory_failure_queue(unsigned long pfn, int flags)
>  {
>  }
>  
> +static inline void hwpoison_boot_page(struct page *page,
> +				      enum meminit_context context)
> +{
> +}
> +
>  static inline void num_poisoned_pages_inc(unsigned long pfn)
>  {
>  }
> diff --git a/mm/memory-failure.c b/mm/memory-failure.c
> index d9b8be696aac38..60e9682434700b 100644
> --- a/mm/memory-failure.c
> +++ b/mm/memory-failure.c
> @@ -137,6 +137,32 @@ phys_addr_t range_last_hwpoison(phys_addr_t start, unsigned long size)
>  	return range_hwpoison(start, size, false);
>  }
>  
> +static void update_per_node_mf_stats(unsigned long pfn, enum mf_result result);
> +
> +void __meminit hwpoison_boot_page(struct page *page,
> +				  enum meminit_context context)
> +{
> +	unsigned long pfn = page_to_pfn(page);
> +
> +	if (PageHWPoison(page))
> +		return;
> +
> +	SetPageHWPoison(page);
> +	set_page_count(page, 1);
> +	/* The page has been completely isolated == MF_RECOVERED */
> +	update_per_node_mf_stats(pfn, MF_RECOVERED);


snip

> +
> +	/*
> +	 * The per memory block half of num_poisoned_pages_inc() has no block to
> +	 * find at boot, and divides by zero looking for one. A hotplugged block
> +	 * is already there.
> +	 */
> +	if (context == MEMINIT_HOTPLUG)
> +		num_poisoned_pages_inc(pfn);
> +	else
> +		atomic_long_inc(&num_poisoned_pages);
> +}

Hi Breno,

num_poisoned_pages_inc() currently assumes that the supplied PFN can
be used for per-memory-block accounting and therefore calls
memblk_nr_poison_inc() unconditionally. The early-boot path needs
global-only accounting because the memory-block infrastructure is not
initialized yet.

Could num_poisoned_pages_inc() treat -1UL as global-only accounting,
matching num_poisoned_pages_sub()?

Example as below:

void num_poisoned_pages_inc(unsigned long pfn)
{
	atomic_long_inc(&num_poisoned_pages);

	if (pfn != -1UL)
		memblk_nr_poison_inc(pfn);
}


The caller could then use:

num_poisoned_pages_inc(context == MEMINIT_HOTPLUG ? pfn : -1UL);

This would keep updates to `num_poisoned_pages` encapsulated rather than
manipulating the counter directly here, while also making the increment
and decrement interfaces consistent.

Thanks,
Shaikh Kamaluddin.
> +
>  /**
>   * MF_ATTR_RO - Create sysfs entry for each memory failure statistics.
>   * @_name: name of the file in the per NUMA sysfs directory.
> 
> -- 
> 2.53.0-Meta
> 
