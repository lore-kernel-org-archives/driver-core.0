Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFA43ACA50
	for <driver-core@lists.linux.dev>; Mon, 27 Jul 2026 21:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785186439; cv=none; b=X74ZLfbdKMzQPHhERj76tOLkPS1xJqFxKF9DeIfFODSyybiIADPHJgSTbJj5osmhdFRitsn4T5+2jz5QiZVZ5vtyWj3s+Uqq4IT+RA8bHGInKAxoOy4WyYhh2K/fj8k5QMpQth1lwkJcCRWz8LDKsPjiqYEFF1XuoCVc+4pnB3s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785186439; c=relaxed/simple;
	bh=9CHU3OMmaekqpc2La2di7+A5vdF9SHS0b5zWnNsT480=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bpMVec4vKVarQs9PpW3I5Fuku9g6QGlGyrTfw2AZat+AZEAe1GMvBer5C1S/2ilCAHJ6jscblmDMpdOU9Lck/nYmtm3p0FemRv6XjahBLLMXk5QDNdNrZf0MxpY4DfCL66LzVzSw3RdCcy5RQlRZ2zQ6gRTIv0oFS2p7wDdF45Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=1LgFQeH3; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="1LgFQeH3"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=cLGlpwzkRAhbt18namd0dquj14f4NzKCJyWIg/8giA0=; b=1LgFQeH3rSiAsEUl+9CuKtoBJ6
	3XBOUd68axQ7EUlAZ6ToYqc68s4/OGpt0DBUyLCqavqgqkZt2E0uhIaBUumSqQzJa7tQrmKSK1wYu
	xgb5BCZQN8giStA442MSo3yzK1QRJCkVAnyRg5bBUU1dTVhEA0yG0YRDbaqgUnB4I/fMTwePd6UCI
	xzYktaWoRKPrekR8fCfXNjLu8yyCI1M+WQS5xwkDzCG8I0dbe80VX+U37gnoXUCuPovIYrrPd0GjQ
	+GJvSrOVRa7EcsPilc4EsgErAHOf8EWQFoV9VhtWFF0YYVF9fhN6hFuvfl5Xa5XRNVdQceBP3f0Uv
	luEbOriQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woSXc-00000003vRV-03P8;
	Mon, 27 Jul 2026 21:07:16 +0000
Message-ID: <2fc08119-9613-4fc7-9434-a0ca7d6e814f@infradead.org>
Date: Mon, 27 Jul 2026 14:07:15 -0700
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: add sys_soc.h to DRIVER CORE
To: Danilo Krummrich <dakr@kernel.org>, gregkh@linuxfoundation.org,
 rafael@kernel.org, lee@kernel.org
Cc: driver-core@lists.linux.dev
References: <20260727204543.2286472-1-dakr@kernel.org>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260727204543.2286472-1-dakr@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 7/27/26 1:45 PM, Danilo Krummrich wrote:
> The sys_soc.h header was never added to the DRIVER CORE MAINTAINERS
> entry when the SoC bus was introduced. Add it now.
> 
> Fixes: 74d1d82cdaae ("drivers/base: add bus for System-on-Chip devices")
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Acked-by: Randy Dunlap <rdunlap@infradead.org>

Thanks.

> ---
>  MAINTAINERS | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8034273de98b..1b5369f177ae 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -7902,6 +7902,7 @@ F:	include/linux/fwnode.h
>  F:	include/linux/kobj*
>  F:	include/linux/ksysfs.h
>  F:	include/linux/property.h
> +F:	include/linux/sys_soc.h
>  F:	include/linux/sysfs.h
>  F:	kernel/ksysfs.c
>  F:	lib/kobj*

-- 
~Randy
