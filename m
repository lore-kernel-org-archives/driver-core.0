Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B7C313547
	for <driver-core@lists.linux.dev>; Tue, 10 Mar 2026 20:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773175829; cv=none; b=TV2Lz95uYGYBxsHG7ApOMVvC+hBkUTujcaA7+vFVMOp3LYsYoF1e32w0UIJuu4lvYLGTtY7vD2rcKfHMjBPN6FxwzctZvyjNw2k38WSKDD+mQEWGWWFerX/LERkYit8MdQgosBVziQL+c1oZMW2P5XsgoDXYgl35L38+SAYDTkM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773175829; c=relaxed/simple;
	bh=Khpo+74TRUDC6rMmP3LnXqwT5R6uxwsM0KDfNzd46JM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gz0dlc1EKikttfaABYm3Zgt/1xgiOmkfAFG+T4zSJCQcWOt9bqySE9iY9e1YCEETxuUKCDOC3/JSdpCguQwyMU4IDa80JuAjXMBdZU4DH4Rwb7TsVkuvwR4lyrFQJJNvpDnFf2Ez5q5kCvQltrEqAKTvIOFhkyR8g3pUo2PJNMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GXMqjQiX; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GXMqjQiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773175827; x=1804711827;
  h=message-id:date:mime-version:subject:to:cc:references:
   from:in-reply-to:content-transfer-encoding;
  bh=Khpo+74TRUDC6rMmP3LnXqwT5R6uxwsM0KDfNzd46JM=;
  b=GXMqjQiXGfHmen3hOsNszAjBasIIFbX+W/8TDWnZiTIJPVa0HTZrev7A
   COPTMzViis3Y2vpmV9QTJFRpO3tvdgXnJdGZL0yNy7zyZf/vDOhfbHWvw
   mhad0PJJ2JkhWaZnfVE+cw3CGJKYiLbO7MlECWdJT3vQAeecv7O+mUATS
   SUfoIp/XgoafY0N+0M4XOl5nYBu/n7PKT+YZJHr5jaFO7EXKBCJWieB2O
   /3TDt7LT5ps3sa1IP3i39sYyRGnVjVYhsnkGcQTBx9usjnrJe3fSj0BiR
   YFgpu33yF2rj8YkjnCaFA8b6Hdvt89PKI8pInkWyb9jrNLcAjdTa41qNR
   A==;
X-CSE-ConnectionGUID: WZD+8ENrTfuow4mgpVxwuQ==
X-CSE-MsgGUID: ZFxBPYYlSj2IRHXoOB4hDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11725"; a="84564064"
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="84564064"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 13:50:26 -0700
X-CSE-ConnectionGUID: bZA7DdlJTKyAugJ/StQQwQ==
X-CSE-MsgGUID: wkQ8mqq4QEqUX0y4kQTpFQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,112,1770624000"; 
   d="scan'208";a="219355712"
Received: from aduenasd-mobl5.amr.corp.intel.com (HELO [10.125.110.11]) ([10.125.110.11])
  by orviesa006-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Mar 2026 13:50:26 -0700
Message-ID: <684abc44-fed3-489c-838b-e81020ad5a36@intel.com>
Date: Tue, 10 Mar 2026 13:50:24 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/7] cxl/pci: Check memdev driver binding status in
 cxl_reset_done()
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
 <20260310-fix_access_endpoint_without_drv_check-v1-6-94fe919a0b87@zohomail.com>
Content-Language: en-US
From: Dave Jiang <dave.jiang@intel.com>
In-Reply-To: <20260310-fix_access_endpoint_without_drv_check-v1-6-94fe919a0b87@zohomail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 3/10/26 8:57 AM, Li Ming wrote:
> cxl_reset_done() accesses the endpoint of the corresponding CXL memdev
> without endpoint validity checking. By default, cxlmd->endpoint is
> initialized to -ENXIO, if cxl_reset_done() is triggered after the
> corresponding CXL memdev probing failed, this results in access to an
> invalid endpoint.
> 
> CXL subsystem can always check CXL memdev driver binding status to
> confirm its endpoint validity. So adding the CXL memdev driver checking
> inside cxl_reset_done() to avoid accessing an invalid endpoint.
> 
> Fixes: 934edcd436dc ("cxl: Add post-reset warning if reset results in loss of previously committed HDM decoders")
> Signed-off-by: Li Ming <ming.li@zohomail.com>

Reviewed-by: Dave Jiang <dave.jiang@intel.com>

> ---
>  drivers/cxl/pci.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/cxl/pci.c b/drivers/cxl/pci.c
> index fbb300a01830..a5922116db2a 100644
> --- a/drivers/cxl/pci.c
> +++ b/drivers/cxl/pci.c
> @@ -1043,6 +1043,9 @@ static void cxl_reset_done(struct pci_dev *pdev)
>  	 * that no longer exists.
>  	 */
>  	guard(device)(&cxlmd->dev);
> +	if (!cxlmd->dev.driver)
> +		return;
> +
>  	if (cxlmd->endpoint &&
>  	    cxl_endpoint_decoder_reset_detected(cxlmd->endpoint)) {
>  		dev_crit(dev, "SBR happened without memory regions removal.\n");
> 

