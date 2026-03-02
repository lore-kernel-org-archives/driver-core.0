Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9AEF37C108
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 19:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772478204; cv=none; b=W/vkoLtgECfW/aJ3Az/coDM3ftYZ6NsRF2P6QOL2mV7IPwwSP5IYSqq13cOgsuOJIs8vhzy0MK3T89iIYqQApgqUERoh2seOu70qz1nH34NZCaEQPBAsDNw7GgGQn0WOWJeghXGzoyf4rPPJOwyDPm8+KVK1nzeiBDeFonBzoCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772478204; c=relaxed/simple;
	bh=hrkuOZXULW4z94H/PN7wKcXQOIny3RLqrI3PAdIUp1o=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=jIk32/zSVCYYBLOxCQPdQzMLPmnOvcbrZwnuq6h0YksebD65Q30giMKnaSW/tmer32zfLFKC+Iyfn5T9k+vd7DllGGEEyLuvmxbAqosuyi1vjRdsX+RZldA9OuRznVE9K7iYYEFUEsHR9IbfEyacDnZzFCbGrfhYYbr2Oe6mR/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=VIWwJ/Z1; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="VIWwJ/Z1"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260302190313euoutp024ccfa0e3b355ad59dbe53120df49a8d7~ZG4atAcHI2534925349euoutp02F
	for <driver-core@lists.linux.dev>; Mon,  2 Mar 2026 19:03:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260302190313euoutp024ccfa0e3b355ad59dbe53120df49a8d7~ZG4atAcHI2534925349euoutp02F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772478193;
	bh=EQ/+uELHGmo9uLp5DxfWQcD8uInFxMtXRtId+MhTZ1Y=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=VIWwJ/Z1kKjJFmIM90Vr/9QGHTu545/4EHY5uuyn6sKXG94kISQi4xvYdYpSwpEp+
	 Xb8bs8Advtbxx9+i0Mp71ysgZKrvWKNaPC8BKT+xFUhCMn49zp9pWYDd4jINTBoqL8
	 lRtngYwlU5/e2csPlmy7vZnNS0HFNkoip77kimW0=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260302190313eucas1p2a1a79274d59d4a895ec204bc5c703702~ZG4aSpjZZ1966519665eucas1p2W;
	Mon,  2 Mar 2026 19:03:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260302190312eusmtip2401c6a90dfda5665f9be0a3d8b92fc72~ZG4Znboqs1052410524eusmtip2c;
	Mon,  2 Mar 2026 19:03:12 +0000 (GMT)
Message-ID: <a9625fdd-62e8-4dc0-817c-9f8df505069f@samsung.com>
Date: Mon, 2 Mar 2026 20:03:11 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 1/1] regmap: Synchronize cache for the page selector
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Cc: Mark Brown <broonie@kernel.org>, Greg Kroah-Hartman
	<gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260302184753.2693803-1-andriy.shevchenko@linux.intel.com>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260302190313eucas1p2a1a79274d59d4a895ec204bc5c703702
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260302184802eucas1p2704b309b3953b523d816b51e9b49b196
X-EPHeader: CA
X-CMS-RootMailID: 20260302184802eucas1p2704b309b3953b523d816b51e9b49b196
References: <CGME20260302184802eucas1p2704b309b3953b523d816b51e9b49b196@eucas1p2.samsung.com>
	<20260302184753.2693803-1-andriy.shevchenko@linux.intel.com>

On 02.03.2026 19:43, Andy Shevchenko wrote:
> If the selector register is represented in each page, its value
> according to the debugfs is stale because it gets synchronized
> only after the real page switch happens. Hence the regmap cache
> initialisation from the HW inherits outdated data in the selector
> register.
>
> Synchronize cache for the page selector just in time.
>
> Before (offset followed by hexdump, the first byte is selector):
>
>      // Real registers
>      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>      ...
>      // Virtual (per port)
>      40: 05 ff 00 00 e0 e0 00 00 00 00 00 1f
>      50: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>      60: 01 ff 00 00 ff ff 00 00 00 00 00 00
>      70: 02 ff 00 00 cf f3 00 00 00 00 00 0c
>      80: 03 ff 00 00 00 00 00 00 00 00 00 ff
>      90: 04 ff 00 00 ff 0f 00 00 f0 00 00 00
>
> After:
>
>      // Real registers
>      18: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>      ...
>      // Virtual (per port)
>      40: 00 ff 00 00 e0 e0 00 00 00 00 00 1f
>      50: 01 ff 00 00 e0 e0 00 00 00 00 00 1f
>      60: 02 ff 00 00 ff ff 00 00 00 00 00 00
>      70: 03 ff 00 00 cf f3 00 00 00 00 00 0c
>      80: 04 ff 00 00 00 00 00 00 00 00 00 ff
>      90: 05 ff 00 00 ff 0f 00 00 f0 00 00 00
>
> Fixes: 6863ca622759 ("regmap: Add support for register indirect addressing.")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
> ---
>
> v5: applied fix to avoid circular dependency (infinite loop)
> v4: reworked the approach completely
>
> Dmitry,
> Please, test on your HW to be sure this will have no side effects
> in your case with LT9611.
>
> Marek, this is the same version I sent you earlier off the list.
> I haven't added any tag (while knowing that you tested it, so please
> confirm it by providing a formal Tested-by, thanks!
>
> FWIW, I have tested it on Intel Galileo board with Cypress CY8C9540 chip.
>
>   drivers/base/regmap/regmap.c | 30 ++++++++++++++++++++++++++----
>   1 file changed, 26 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
> index c299218849a1..13f994429b38 100644
> --- a/drivers/base/regmap/regmap.c
> +++ b/drivers/base/regmap/regmap.c
> @@ -1509,6 +1509,7 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
>   			       unsigned int val_num)
>   {
>   	void *orig_work_buf;
> +	unsigned int selector_reg;
>   	unsigned int win_offset;
>   	unsigned int win_page;
>   	bool page_chg;
> @@ -1527,10 +1528,31 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
>   			return -EINVAL;
>   	}
>   
> -	/* It is possible to have selector register inside data window.
> -	   In that case, selector register is located on every page and
> -	   it needs no page switching, when accessed alone. */
> +	/*
> +	 * Calculate the address of the selector register in the corresponding
> +	 * data window if it is located on every page.
> +	 */
> +	page_chg = in_range(range->selector_reg, range->window_start, range->window_len);
> +	if (page_chg)
> +		selector_reg = range->range_min + win_page * range->window_len +
> +			       range->selector_reg - range->window_start;
> +
> +	/*
> +	 * It is possible to have selector register inside data window.
> +	 * In that case, selector register is located on every page and it
> +	 * needs no page switching, when accessed alone.
> +	 *
> +	 * Nevertheless we should synchronize the cache values for it.
> +	 * This can't be properly achieved if the selector register is
> +	 * the first and the only one to be read inside the data window.
> +	 * That's why we update it in that case as well.
> +	 *
> +	 * However, we specifically avoid updating it for the default page,
> +	 * when it's overlapped with the real data window, to prevent from
> +	 * infinite looping.
> +	 */
>   	if (val_num > 1 ||
> +	    (page_chg && selector_reg != range->selector_reg) ||
>   	    range->window_start + win_offset != range->selector_reg) {
>   		/* Use separate work_buf during page switching */
>   		orig_work_buf = map->work_buf;
> @@ -1539,7 +1561,7 @@ static int _regmap_select_page(struct regmap *map, unsigned int *reg,
>   		ret = _regmap_update_bits(map, range->selector_reg,
>   					  range->selector_mask,
>   					  win_page << range->selector_shift,
> -					  &page_chg, false);
> +					  NULL, false);
>   
>   		map->work_buf = orig_work_buf;
>   

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland

