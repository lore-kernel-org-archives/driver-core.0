Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CFE0283FCF
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 07:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772090337; cv=none; b=QUUNntgwx0oApNCBllMVLW+IriJWki66IlA9habrMRS4Jw5VALuwsU2JS4t/U0l9vUKF0ZVzGGVvQAd+A4hDJnFgdR50XtZtkDI2JRystL8uhl7/IsyQ9vpAyOOJbw27qiyWONilVoByHm/KjmNLTC5Db8VgK6zDpD3IYOf970o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772090337; c=relaxed/simple;
	bh=rVWWGoLzfnEr4YZDjcPykaqYCDvmIZeFsihBUzb3/3w=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jkulEcZsrCpYA7xleu3XeCrZdVsZag0EWpd5rxfHzaBgOAlUveA8L8aKU7MW/XtvN1lHl0ysUzAFbrIZMTjmIJngohi4eoJoG0SZ+XJ20EoI/B2hAwt7YImrFqPdMUNlYzHBOOJjNS967Bmcr2tPWaKLqiiJsxYR2zB7lJBRIOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iaT6n/0f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iaT6n/0f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772090336; x=1803626336;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=rVWWGoLzfnEr4YZDjcPykaqYCDvmIZeFsihBUzb3/3w=;
  b=iaT6n/0fVlopl97mA648y131clFvguPXVEnFnVy+JDuG04NNkYIsYD9C
   4n/oIG4pGU1kqc7uGk0VVwx92MetDchbCt0L5Me3Zlq/n//HaSXGMCCqA
   7yuwgryS4ugBH2qCspNuWdjI00oBMNuwvmiv953rb4WlEPQvh4aD/oiRW
   KJLS8pVvb0dRk+FY5zXBeYKcQzqBySEFx6oBS3IqzAE05ywuC1kizCO0m
   D6ET+5lYBO9qSeZUKnUlcr9SpdOBR1zbQrJEfr2kVfK6yavYqTQ0dz/AC
   2pFqk4Sdh/t2egxxmPyiDyUgarblvOxmLXAslLSMRH9wpDJjh4roRgHeH
   Q==;
X-CSE-ConnectionGUID: sCvxGIywQji80ncjtGfkVA==
X-CSE-MsgGUID: OdTFMVJrSp2JQO+fye64Yw==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="72354098"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="72354098"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 23:18:55 -0800
X-CSE-ConnectionGUID: tzLjy4iLShKJpLYq/aCM9w==
X-CSE-MsgGUID: ZC3eU4WWRpiXnwMax+3VUg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="220617388"
Received: from yilunxu-optiplex-7050.sh.intel.com (HELO localhost) ([10.239.159.165])
  by orviesa003.jf.intel.com with ESMTP; 25 Feb 2026 23:18:46 -0800
Date: Thu, 26 Feb 2026 14:59:12 +0800
From: Xu Yilun <yilun.xu@linux.intel.com>
To: Peter Colberg <pcolberg@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Dave Ertman <david.m.ertman@intel.com>,
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Jonathan Corbet <corbet@lwn.net>, Xu Yilun <yilun.xu@intel.com>,
	Tom Rix <trix@redhat.com>, Moritz Fischer <mdf@kernel.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>, linux-pci@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>,
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org, linux-fpga@vger.kernel.org,
	driver-core@lists.linux.dev, Jason Gunthorpe <jgg@ziepe.ca>
Subject: Re: [PATCH v2 02/10] fpga: dfl-pci: set driver flag to disable
 SR-IOV on remove()
Message-ID: <aZ/vQHV3zr49r7E+@yilunxu-OptiPlex-7050>
References: <20260205-rust-pci-sriov-v2-0-ef9400c7767b@redhat.com>
 <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260205-rust-pci-sriov-v2-2-ef9400c7767b@redhat.com>

On Thu, Feb 05, 2026 at 03:59:49PM -0500, Peter Colberg wrote:
> Set the flag managed_sriov in the pci_driver structure to show how a
> PCI driver may opt into disabling the Single Root I/O Virtualization
> (SR-IOV) capability of the device when the driver is removed.
> 
> Merge the function cci_remove_feature_devs() into cci_pci_remove().

I think it makes much clearer demonstration if you split the unrelated
changes out.

> 
> Signed-off-by: Peter Colberg <pcolberg@redhat.com>
> ---
> Changes in v2:
> - Demonstrate flag managed_sriov for dfl-pci driver.
> ---
>  drivers/fpga/dfl-pci.c | 17 +++++------------
>  1 file changed, 5 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/fpga/dfl-pci.c b/drivers/fpga/dfl-pci.c
> index 602807d6afcc09af9e1d53368b41460ef86545d8..7965c307f9b79bdd2c2c3277d519ab2c4e701797 100644
> --- a/drivers/fpga/dfl-pci.c
> +++ b/drivers/fpga/dfl-pci.c
> @@ -125,15 +125,6 @@ static int cci_init_drvdata(struct pci_dev *pcidev)
>  	return 0;
>  }
>  
> -static void cci_remove_feature_devs(struct pci_dev *pcidev)
> -{
> -	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
> -
> -	/* remove all children feature devices */
> -	dfl_fpga_feature_devs_remove(drvdata->cdev);
> -	cci_pci_free_irq(pcidev);
> -}
> -
>  static int *cci_pci_create_irq_table(struct pci_dev *pcidev, unsigned int nvec)
>  {
>  	unsigned int i;
> @@ -425,10 +416,11 @@ static int cci_pci_sriov_configure(struct pci_dev *pcidev, int num_vfs)
>  
>  static void cci_pci_remove(struct pci_dev *pcidev)
>  {
> -	if (dev_is_pf(&pcidev->dev))
> -		cci_pci_sriov_configure(pcidev, 0);
> +	struct cci_drvdata *drvdata = pci_get_drvdata(pcidev);
>  
> -	cci_remove_feature_devs(pcidev);
> +	/* remove all children feature devices */
> +	dfl_fpga_feature_devs_remove(drvdata->cdev);
> +	cci_pci_free_irq(pcidev);
>  }
>  
>  static struct pci_driver cci_pci_driver = {
> @@ -437,6 +429,7 @@ static struct pci_driver cci_pci_driver = {
>  	.probe = cci_pci_probe,
>  	.remove = cci_pci_remove,
>  	.sriov_configure = cci_pci_sriov_configure,
> +	.managed_sriov = true,
>  };
>  
>  module_pci_driver(cci_pci_driver);
> 
> -- 
> 2.52.0
> 
> 
