Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15D113C1F43
	for <driver-core@lists.linux.dev>; Tue, 28 Jul 2026 08:05:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785225938; cv=none; b=Ne8+VUyiY/pXAVWeNOAyC17wP0OX/W4motEZdVXmitijilC/64gIJcFtRnWU46ScYOUffjTWUakprJPotuGlWT6q7JeAlZsU1/Z+1R2jVdJNpOhsHo6s10g8HdLb31PPMinyTS9gYIuw5fkFvkEMe1juuWrM0zDt0/oS92jmbDM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785225938; c=relaxed/simple;
	bh=45p8UjR4CSXo8o62FMexPmKyOxUOTfFueUW+nTCPrU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LWDwFojrgZ6JnaQUNPCZ0cPU8t2J4IIDYsDF82/FPxm0gfqH1oW7QQXTPJhu+dmHy6tGqZHjGD9plrzZ/6goNM/cpqQe5wEIJVkBR7mGCSyDJDDmaoqtNkATj+FLP0BntXP9BxsC9//K4U4D9PDKVZ5Ndnu2lg5AHvUMJuEOHJg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G4A+BY4f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G4A+BY4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785225937; x=1816761937;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=45p8UjR4CSXo8o62FMexPmKyOxUOTfFueUW+nTCPrU0=;
  b=G4A+BY4f1025CswsGPmlp+DDQSu3CzmG7uWfRGTA7WdJEHYbmjere/xa
   IwJmQpBEfG+9nP/w+Z2r7zBupv2FIuLo32sQ0lI7xOD+6e6gjIz/4sU+a
   SAn4hYhhpGabFXBBz23ZHMTa/BwUfwPza/QST3kTWadIWO0vNFDCgo7M3
   WN2jO7aZoF3xU4/PUSdZ2g/DsFwHeIbByEr2n2uV1oYy3/8Ioh4G1wAZO
   GLdKwUhSdCXrjNmIddGVdgcoGlPU+c+GrLi9ILSN3H1GvUVqExuJ9NB8h
   tBN78gvg8FNTjCctiZYafdFF8Szvv57OyhPzMLiOCqSt4BYRqrU8BCoK2
   Q==;
X-CSE-ConnectionGUID: ajfxMV9FRI+5A/gHE9/pzg==
X-CSE-MsgGUID: CrqAagZiTjGRPelr+5Rl3Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11858"; a="84930126"
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="84930126"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 01:05:29 -0700
X-CSE-ConnectionGUID: Vkg/3LcwTIyyhth3mD7OvQ==
X-CSE-MsgGUID: wnTUIv7lQS2Slqg5bW1WNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,190,1779174000"; 
   d="scan'208";a="263952630"
Received: from kniemiec-mobl1.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.244.69])
  by orviesa005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jul 2026 01:05:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 354E3121BFD;
	Tue, 28 Jul 2026 11:05:25 +0300 (EEST)
Date: Tue, 28 Jul 2026 11:05:25 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org,
	andriy.shevchenko@linux.intel.com, djrscally@gmail.com,
	heikki.krogerus@linux.intel.com, brgl@kernel.org,
	rdunlap@infradead.org, lenb@kernel.org, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev
Subject: Re: [PATCH] fwnode: add missing kernel-doc for struct
 fwnode_operations members
Message-ID: <amhixcSEvWmHabzT@kekkonen.localdomain>
References: <20260727202748.2232253-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727202748.2232253-1-dakr@kernel.org>

On Mon, Jul 27, 2026 at 10:27:40PM +0200, Danilo Krummrich wrote:
> Document the four undocumented struct members in
> struct fwnode_operations: device_dma_supported, device_get_dma_attr,
> iomap, and irq_get.
> 
> This avoids kernel-doc warnings once include/linux/fwnode.h is included
> in the driver-api infrastructure documentation.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Thanks!

Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>

-- 
Sakari Ailus
