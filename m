Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D31D5493632
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 13:29:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788355786; cv=none; b=ehhdDAcLu431d1luzidcFje/2mti7KF5CUUh07twIe16jjxSNodZRq5aEpsLcXDYkRihEhIg5DXYmIkvHMDLAF4lz93NzpDm2jf5dJ9St+OBHqLcquMJA7ly2Kr6SJl0GIS0BXQp9mw/9Oh1Epk4SscB8WQ1mOZwqwoPBtAwLs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788355786; c=relaxed/simple;
	bh=3kzF7itCNI3649Jd2yl6+o37lkdhtqpt1JNljsXi5vg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ZHiZYf4JwcD72IppbNwufmYsaEEzrOAiYiYdnkxTuaJtLGQML6LwgsobAwDbq1PhnvCfFUoHqvc61wWFwKxRLLcbGu8kxLfHSjiREuJck7bwhvpsF8TDwmovrudynX4e1IV9BabzRrQMJ+mHvG/Ge+jJFkeRJpJtiO+CXxgqtBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=jAI84FJg; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="jAI84FJg"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 610CE165C;
	Wed,  2 Sep 2026 06:29:40 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B00DA3F673;
	Wed,  2 Sep 2026 06:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788355784; bh=3kzF7itCNI3649Jd2yl6+o37lkdhtqpt1JNljsXi5vg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jAI84FJgJAvnyhbJiH1Pxn7thUuzLd5dcmWWV+5W22olMfH0LkXLMmpwmz0Dk3KR3
	 5m2gPwMIFrSaptQU5elbNsEPXBlpZKbWjuJZQZYwq7FwXhEQvDN/S+hzOedqTuhDM8
	 0HIoyrUUju4wL7kqZCcmtszvpBFN2e2KxZjUWK0c=
Message-ID: <e6d4bb93-66fa-4149-985d-87d895081ea0@arm.com>
Date: Wed, 2 Sep 2026 15:29:39 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 05/15] arm_mpam: Fix device_node refcount in DT
 resource parsing
To: Yin Li <yin.li@oss.qualcomm.com>, "Rafael J. Wysocki"
 <rafael@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>,
 Konrad Dybcio <konradybcio@kernel.org>, James Morse <james.morse@arm.com>,
 Ben Horgan <ben.horgan@arm.com>, Bjorn Andersson <andersson@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
 trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
 driver-core@lists.linux.dev, Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>, Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
 linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-5-ea6397bead59@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-5-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/11/26 15:30, Yin Li wrote:
> When a cache-parented or memory-controller-parented MSC is probed via
> device tree, the parent node was assigned directly to a
> __free(device_node) variable without incrementing its reference count.
> Both the parent and the cache/memory variable are declared with
> __free(device_node), which causes the compiler to automatically insert
> an of_node_put() call for each variable when they go out of scope.
> Since both variables point to the same node but the reference count was
> only incremented once by of_get_parent(), the node ends up being
> released twice, causing a refcount underflow.

Yes, looks about right: there is another assignment to both memory and 
cache, they call of_parse_phandle(), which increments the refcount, so 
we need to do the same for the direct assignments, to get the free'ing 
done consistently.

> Use of_node_get() to take an explicit reference so each __free variable
> holds its own reference.
> 
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

... though this should definitely be squashed into the respective DT 
patches. Feel free to do so.

Cheers,
Andre

> ---
>   drivers/resctrl/mpam_devices.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 975ddab771b4..559fa09128b4 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -280,7 +280,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>   		type = MPAM_CLASS_CACHE;
>   
>   	} else if (of_device_is_compatible(parent, "cache")) {
> -		cache = parent;
> +		cache = of_node_get(parent);
>   		type = MPAM_CLASS_CACHE;
>   	} else if (of_device_is_compatible(np, "arm,mpam-memory")) {
>   		memory = of_parse_phandle(np, "arm,mpam-device", 0);
> @@ -290,7 +290,7 @@ static int mpam_dt_parse_resource(struct mpam_msc *msc, struct device_node *np,
>   		}
>   		type = MPAM_CLASS_MEMORY;
>   	} else if (of_device_is_compatible(np, "arm,mpam-memory-controller-msc")) {
> -		memory = parent;
> +		memory = of_node_get(parent);
>   		type = MPAM_CLASS_MEMORY;
>   	} else {
>   		/*
> 

