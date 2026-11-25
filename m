Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795647267;
	b=f5unV5HWkdhWbpkE5pQMk6SbAP2PpOPE8PTUYX52ltiJcJw7JikolFWbNwkRTbP4GGxn
	 /jBQZVK9sNiHagic0IWiYeE1i85XG4sn0QRyNU/7MUUW1ump9BppVNhCSgyuRoTXaG6Sg
	 3bU3p6FIf3qzoxWOkpFtBqHNfxhekx3TWxcbQymeYJNzrb0OeaPm0RBzf1OeOgc7xRJoL
	 IFn1lMx6PKCeAeqJefXX3jrVIUDz68T/IUmWoTml5xikZ8RbQdGR1DuKiBD3nrNLLZwMf
	 n9mWPWaxGs/+48bMgXPj/e46MTgyuUVak4RkjciV9xIeu7pze6LO+9apMp5Ss27Judw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795647267;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=qHMxOYG8BmdhFn1Kc7+4McowXnPiDZM8IuFmw/AsFAU=;
	b=X3vIirVvnt9Vt9gBIaBp9ltKGWN5P+R2+0poZ1HCyVT2tQPhFDUXNrONQJSQYRwuozjn
	 tqQDulUwxTazU8OmHfhcwJUmikBASXoaSKwNrbNTzSHTELmE5INa0XNPyrKx3dz/25LMc
	 VCFO+7bbtbn+2IcxpLjIYce2OmrchxzU8XO7K0IBF8a4NfooG0lEpOrK8ipgT10QTwAw+
	 1M7tOMbJDv8zXcfpacsYg2/WgJbngM9ac6sr/3rbi/bfaIpiAZ1mQp8UezaQ20eLOp0X5
	 gZAGdIMgJGysFrCi5Cug1FQBLzTswqRE2Lu+1DwkagrDEJUpbJNzo/OR8z1oLKDHflQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=pKAcSK6X;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98A60606A691
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 22:54:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 98A60606A691
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=pKAcSK6X
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261125225422euoutp02352e28c58361687ecc23b15eeac1d18b~ra6vxKBpn1470514705euoutp02D
	for <driver-core@lists.linux.dev>; Wed, 25 Nov 2026 22:54:22 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261125225422euoutp02352e28c58361687ecc23b15eeac1d18b~ra6vxKBpn1470514705euoutp02D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1795647262;
	bh=qHMxOYG8BmdhFn1Kc7+4McowXnPiDZM8IuFmw/AsFAU=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=pKAcSK6X8rTpE54nfC7BUeHA4s/RCnjbJYsBgNASng7ej/LwqRLWp87+ZqVl6Soh1
	 4D3dWKUyMMnHz1xoeXfyhYvKECVYylI9BGTa0xj8s5pCNlZZDEMBOsgHMviUU28wKE
	 Rnau9rykDlO5+XSwd5QZRVzWbImL0qHx3Tuwy8zM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20261125225421eucas1p186d9a6f0e441eaf4204fe18c5a702e87~ra6uuG4D40454204542eucas1p1T;
	Wed, 25 Nov 2026 22:54:21 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261125225420eusmtip17fe6bd4ec6220fe634303b219bb10f97~ra6tjtwQd1106411064eusmtip1A;
	Wed, 25 Nov 2026 22:54:20 +0000 (GMT)
Message-ID: <20d17d3f-eeab-4541-9aa9-877e45fe6fa5@samsung.com>
Date: Wed, 25 Nov 2026 23:54:19 +0100
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 3/7] dma-mapping: Keep DMA memory private for capable
 devices
To: Nicolin Chen <nicolinc@nvidia.com>, Jason Gunthorpe <jgg@nvidia.com>,
	joro@8bytes.org, Will Deacon <will@kernel.org>, Robin Murphy
	<robin.murphy@arm.com>, Catalin Marinas <catalin.marinas@arm.com>,
	rafael@kernel.org, Danilo Krummrich <dakr@kernel.org>, Johan Hovold
	<johan@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, Pranjal Shrivastava <praan@google.com>,
	Mostafa Saleh <smostafa@google.com>, linux-kernel@vger.kernel.org,
	iommu@lists.linux.dev, driver-core@lists.linux.dev, Sonang Patel
	<sonangp@nvidia.com>, Ankit Agrawal <ankita@nvidia.com>,
	shameerali.kolothum.thodi@huawei.com
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <6618391e4f7809e25400b414be63a8a35ffc9758.1794343501.git.nicolinc@nvidia.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261125225421eucas1p186d9a6f0e441eaf4204fe18c5a702e87
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20261110205101eucas1p2b3a12b6f1f56e2ae7dea688908dd0231
X-EPHeader: CA
X-CMS-RootMailID: 20261110205101eucas1p2b3a12b6f1f56e2ae7dea688908dd0231
References: <cover.1794343501.git.nicolinc@nvidia.com>
	<CGME20261110205101eucas1p2b3a12b6f1f56e2ae7dea688908dd0231@eucas1p2.samsung.com>
	<6618391e4f7809e25400b414be63a8a35ffc9758.1794343501.git.nicolinc@nvidia.com>

On 10.11.2026 21:50, Nicolin Chen wrote:
> Architecture code can require devices to use unencrypted memory. This makes
> the DMA API use shared memory for coherent allocations and bounce streaming
> mappings through SWIOTLB.
>
> A device marked with DEV_FLAG_DMA_CC_PRIVATE is able to reach the private
> memory directly. Add dma_require_unencrypted() that combines the new flag
> with force_dma_unencrypted(), and use it in the generic DMA code. Also use
> "unencrypted" in the local variables that hold its result, to avoid mixing
> the "unencrypted" and "decrypted" terms.
>
> Signed-off-by: Nicolin Chen <nicolinc@nvidia.com>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
>  include/linux/dma-direct.h |  7 ++++++-
>  kernel/dma/direct.c        | 21 +++++++++++----------
>  kernel/dma/mapping.c       |  2 +-
>  kernel/dma/swiotlb.c       |  2 +-
>  4 files changed, 19 insertions(+), 13 deletions(-)
>
> diff --git a/include/linux/dma-direct.h b/include/linux/dma-direct.h
> index daa31a1adf7b0..9d548e545f7a6 100644
> --- a/include/linux/dma-direct.h
> +++ b/include/linux/dma-direct.h
> @@ -134,6 +134,11 @@ static inline bool force_dma_unencrypted(struct device *dev)
>  }
>  #endif /* CONFIG_ARCH_HAS_FORCE_DMA_UNENCRYPTED */
>  
> +static inline bool dma_require_unencrypted(struct device *dev)
> +{
> +	return !dev_dma_cc_private(dev) && force_dma_unencrypted(dev);
> +}
> +
>  static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
>  		bool is_ram, unsigned long attrs)
>  {
> @@ -146,7 +151,7 @@ static inline bool dma_capable(struct device *dev, dma_addr_t addr, size_t size,
>  	 * requires unencrypted DMA addresses. Treat it as not DMA-capable
>  	 * so the caller can fall back to a suitable SWIOTLB pool.
>  	 */
> -	if (!(attrs & DMA_ATTR_CC_SHARED) && force_dma_unencrypted(dev))
> +	if (!(attrs & DMA_ATTR_CC_SHARED) && dma_require_unencrypted(dev))
>  		return false;
>  
>  	if (is_ram && !IS_ENABLED(CONFIG_ARCH_DMA_ADDR_T_64BIT) &&
> diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
> index 25e9a86835fd3..29ea832b9f0af 100644
> --- a/kernel/dma/direct.c
> +++ b/kernel/dma/direct.c
> @@ -41,9 +41,9 @@ static inline struct page *dma_direct_to_page(struct device *dev,
>  
>  u64 dma_direct_get_required_mask(struct device *dev)
>  {
> -	bool require_decrypted = force_dma_unencrypted(dev);
> +	bool require_unencrypted = dma_require_unencrypted(dev);
>  	phys_addr_t phys = ((phys_addr_t)max_pfn << PAGE_SHIFT) - 1;
> -	u64 max_dma = phys_to_dma_direct(dev, phys, require_decrypted);
> +	u64 max_dma = phys_to_dma_direct(dev, phys, require_unencrypted);
>  
>  	return (1ULL << (fls64(max_dma) - 1)) * 2 - 1;
>  }
> @@ -72,8 +72,9 @@ static gfp_t dma_direct_optimal_gfp_mask(struct device *dev, u64 *phys_limit)
>  
>  bool dma_coherent_ok(struct device *dev, phys_addr_t phys, size_t size)
>  {
> -	bool require_decrypted = force_dma_unencrypted(dev);
> -	dma_addr_t dma_addr = phys_to_dma_direct(dev, phys, require_decrypted);
> +	bool require_unencrypted = dma_require_unencrypted(dev);
> +	dma_addr_t dma_addr = phys_to_dma_direct(dev, phys,
> +						 require_unencrypted);
>  
>  	if (dma_addr == DMA_MAPPING_ERROR)
>  		return false;
> @@ -226,7 +227,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
>  	struct page *page;
>  	void *cpu_addr;
>  
> -	if (force_dma_unencrypted(dev))
> +	if (dma_require_unencrypted(dev))
>  		attrs |= __DMA_ATTR_ALLOC_CC_SHARED;
>  
>  	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED) {
> @@ -385,7 +386,7 @@ void dma_direct_free(struct device *dev, size_t size,
>  	 * If the allocation used decrypted/shared backing pages, restore
>  	 * the encryption state on free.
>  	 */
> -	if (force_dma_unencrypted(dev))
> +	if (dma_require_unencrypted(dev))
>  		attrs |= __DMA_ATTR_ALLOC_CC_SHARED;
>  
>  	if (attrs & __DMA_ATTR_ALLOC_CC_SHARED)
> @@ -452,7 +453,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
>  	struct page *page;
>  	void *cpu_addr;
>  
> -	if (force_dma_unencrypted(dev))
> +	if (dma_require_unencrypted(dev))
>  		attrs |= __DMA_ATTR_ALLOC_CC_SHARED;
>  
>  	if ((attrs & __DMA_ATTR_ALLOC_CC_SHARED) && dma_direct_use_pool(dev, gfp))
> @@ -496,7 +497,7 @@ void dma_direct_free_pages(struct device *dev, size_t size,
>  	 * if the device had requested for an unencrypted buffer,
>  	 * convert it to encrypted on free
>  	 */
> -	bool mark_mem_encrypted = force_dma_unencrypted(dev);
> +	bool mark_mem_encrypted = dma_require_unencrypted(dev);
>  
>  	/* If page is not from an atomic pool, dma_free_from_pool_page() fails */
>  	if (IS_ENABLED(CONFIG_DMA_COHERENT_POOL) &&
> @@ -665,7 +666,7 @@ int dma_direct_mmap(struct device *dev, struct vm_area_struct *vma,
>  	const pgoff_t pgoff_end = vma_end_pgoff(vma);
>  	int ret = -ENXIO;
>  
> -	if (force_dma_unencrypted(dev))
> +	if (dma_require_unencrypted(dev))
>  		attrs |= DMA_ATTR_CC_SHARED;
>  
>  	vma->vm_page_prot = dma_pgprot(dev, vma->vm_page_prot, attrs);
> @@ -814,7 +815,7 @@ size_t dma_direct_max_mapping_size(struct device *dev)
>  	/* If SWIOTLB is active, use its maximum mapping size */
>  	if (is_swiotlb_active(dev) &&
>  	    (dma_addressing_limited(dev) || is_swiotlb_force_bounce(dev) ||
> -	     force_dma_unencrypted(dev)))
> +	     dma_require_unencrypted(dev)))
>  		return swiotlb_max_mapping_size(dev);
>  
>  	return SIZE_MAX;
> diff --git a/kernel/dma/mapping.c b/kernel/dma/mapping.c
> index ded585b39fb92..cd405309358e7 100644
> --- a/kernel/dma/mapping.c
> +++ b/kernel/dma/mapping.c
> @@ -673,7 +673,7 @@ void *dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
>  		return NULL;
>  	}
>  
> -	if (force_dma_unencrypted(dev))
> +	if (dma_require_unencrypted(dev))
>  		attrs |= __DMA_ATTR_ALLOC_CC_SHARED;
>  
>  	if (dma_alloc_from_dev_coherent(dev, size, dma_handle, &cpu_addr)) {
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 2c57b49ac7c06..29ecfdab22957 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1550,7 +1550,7 @@ phys_addr_t swiotlb_tbl_map_single(struct device *dev, phys_addr_t orig_addr,
>  	if (cc_platform_has(CC_ATTR_GUEST_MEM_ENCRYPT)) {
>  
>  		/* swiotlb pool is incorrect for this device */
> -		if (unlikely(mem->cc_shared != force_dma_unencrypted(dev)))
> +		if (unlikely(mem->cc_shared != dma_require_unencrypted(dev)))
>  			return (phys_addr_t)DMA_MAPPING_ERROR;
>  
>  	} else if (cc_platform_has(CC_ATTR_HOST_MEM_ENCRYPT)) {

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

