Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5C8C36AB6B
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 20:52:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175975; cv=none; b=L8U3FdXQELnZtkvRNbZK+Bu5xjcB4fkImdA05cHwQB8lod+eaZyZmJvKmM5b8RHq91YGx+m1VRU5O6OxLc2mncesvniGs437dNiqc+qrBSeUHLdI0f7mIzGZA8/mS5LFuNXqzZaXoWoy+1CZJ9DD1t2yOP5k40E/HK+KSzpBo6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175975; c=relaxed/simple;
	bh=LNTcrL+7j4P7s27CbshnB33QtRfdrEyjVTlhAe3P40g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ti8PO18Xd97veI4UMogox9yCPh7/29Ep7+j2zy1Hfjtsi+1Dps+y2+Jt8hHatyCJFUR7YHAeiqz81hGpXH6AEnH1U866pYopKc8o3J5qu7M9zjPp4/j6T77iZ3fQ/twEJUBqjt6/ETZjbXW9T4Kj7tGT+so7WCrtqkYPzbJgdUA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZmMzqY41; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZmMzqY41"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773175974; x=1804711974;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=LNTcrL+7j4P7s27CbshnB33QtRfdrEyjVTlhAe3P40g=;
  b=ZmMzqY41JPlp2Ws/zpU1SGXYSZXr9G/F9/gjBBGK8maH0/voZ6iYj7Ta
   tqxHzcwLZ6epuarrRjhIhgPd0AO1Rfaz5nEW2fKrJr9yn9EP+1uPjPTu/
   sZBpIjofPMHgKJfZA6+NL+OjopdPcF0JbyVM+F2iARGpTO1+Jmh+Ks40k
   AkNmqRpyzEzKvChdG7lszDJG1y8YKHmeTkFngj9dXFb+p58FVHM1qGNlF
   Cwl74rgZG6gRF4jXSMgubwv+uRnjQIOeeRQsR6FEFwcRHWSK/pb6Cb6dT
   zf/iVZ/348JZyyGlduUR7vPRjMhdhZ4TyP3b8PWUSlIJZZtvie5x/qV8B
   w==;
X-CSE-ConnectionGUID: I8zwuz0HQWOI1jRJdC+03w==
X-CSE-MsgGUID: 1SjGFvz3QgCzuZyLsaX7Qg==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="85711815"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="85711815"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 13:52:53 -0700
X-CSE-ConnectionGUID: +2llLIE0R/ORTIviqVYhzQ==
X-CSE-MsgGUID: SAzQlYRqSpiIRLrgDlrYmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="216975211"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO [10.125.110.11]) ([10.125.110.11])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 13:52:52 -0700
Message-ID: <b348fe73-401a-4352-a6b7-adb42e0e4641@intel.com>
Date: Tue, 10 Mar 2026 13:52:50 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/7] cxl/pci: Hold memdev lock in cxl_event_trace_record()
To: Li Ming <ming.li@zohomail.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Davidlohr Bueso <dave@stgolabs.net>,
 Jonathan Cameron <jonathan.cameron@huawei.com>,
 Alison Schofield <alison.schofield@intel.com>,
 Vishal Verma <vishal.l.verma@intel.com>, Ira Weiny <ira.weiny@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Bjorn Helgaas
 <bhelgaas@google.com>, Ben Cheatham <benjamin.cheatham@amd.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-cxl@vger.kernel.org
References: <20260310-fix_access_endpoint_without_drv_check-v1-0-94fe919a0b87@zohomail.com>
 <20260310-fix_access_endpoint_without_drv_check-v1-4-94fe919a0b87@zohomail.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260310-fix_access_endpoint_without_drv_check-v1-4-94fe919a0b87@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/10/26 8:57 AM, Li Ming wrote:
> This is a preparatory patch for the following changes.
> 
> To enable endpoint validity checks in cxl_dpa_to_region().
> cxl_dpa_to_region() has to require caller to hold CXL memdev lock to
> ensure the CXL memdev probing is completed.
> 
> So holding the given CXL memdev lock before invoking cxl_dpa_to_region()
> in cxl_event_trace_record().
> 
> Suggested-by: Dan Williams <dan.j.williams@intel.com>
> Signed-off-by: Li Ming <ming.li@zohomail.com>

With what Dan said,
Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/cxl/core/mbox.c | 5 +++--
>  drivers/cxl/cxlmem.h    | 2 +-
>  2 files changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/cxl/core/mbox.c b/drivers/cxl/core/mbox.c
> index e7a6452bf544..3f34bbabf4d3 100644
> --- a/drivers/cxl/core/mbox.c
> +++ b/drivers/cxl/core/mbox.c
> @@ -893,7 +893,7 @@ int cxl_enumerate_cmds(struct cxl_memdev_state *mds)
>  }
>  EXPORT_SYMBOL_NS_GPL(cxl_enumerate_cmds, "CXL");
>  
> -void cxl_event_trace_record(const struct cxl_memdev *cxlmd,
> +void cxl_event_trace_record(struct cxl_memdev *cxlmd,
>  			    enum cxl_event_log_type type,
>  			    enum cxl_event_type event_type,
>  			    const uuid_t *uuid, union cxl_event *evt)
> @@ -920,6 +920,7 @@ void cxl_event_trace_record(const struct cxl_memdev *cxlmd,
>  		 * translations. Take topology mutation locks and lookup
>  		 * { HPA, REGION } from { DPA, MEMDEV } in the event record.
>  		 */
> +		guard(device)(&cxlmd->dev);
>  		guard(rwsem_read)(&cxl_rwsem.region);
>  		guard(rwsem_read)(&cxl_rwsem.dpa);
>  
> @@ -968,7 +969,7 @@ void cxl_event_trace_record(const struct cxl_memdev *cxlmd,
>  }
>  EXPORT_SYMBOL_NS_GPL(cxl_event_trace_record, "CXL");
>  
> -static void __cxl_event_trace_record(const struct cxl_memdev *cxlmd,
> +static void __cxl_event_trace_record(struct cxl_memdev *cxlmd,
>  				     enum cxl_event_log_type type,
>  				     struct cxl_event_record_raw *record)
>  {
> diff --git a/drivers/cxl/cxlmem.h b/drivers/cxl/cxlmem.h
> index e21d744d639b..7a34a19c02c8 100644
> --- a/drivers/cxl/cxlmem.h
> +++ b/drivers/cxl/cxlmem.h
> @@ -864,7 +864,7 @@ void set_exclusive_cxl_commands(struct cxl_memdev_state *mds,
>  void clear_exclusive_cxl_commands(struct cxl_memdev_state *mds,
>  				  unsigned long *cmds);
>  void cxl_mem_get_event_records(struct cxl_memdev_state *mds, u32 status);
> -void cxl_event_trace_record(const struct cxl_memdev *cxlmd,
> +void cxl_event_trace_record(struct cxl_memdev *cxlmd,
>  			    enum cxl_event_log_type type,
>  			    enum cxl_event_type event_type,
>  			    const uuid_t *uuid, union cxl_event *evt);
> 

