Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B29A54A9D70
	for <driver-core@lists.linux.dev>; Wed,  2 Sep 2026 16:03:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788364999; cv=none; b=HBUt3sI8aKVI5YiqVzXbVxWgfPoujCttdKsZ8eGNYWWvKCPFQJJafe2a+sNlEN1TnrwII/1mncAwhWl4fmhOKGY1qOiJdtHpvg4HbEOH/nqI0AHP3bI2hX9GGnmBDe+uwM9cXAjyzIZ5t7yO7wcYiwgCKyYPnRCVjHu/jebYhWM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788364999; c=relaxed/simple;
	bh=0lTk1OO+FAZyEjFRc6z7dc1s5Dj5L9dAr2btCTzBPfo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JL3pc6WNdRHjRfBGIAaYVN3IXSW9NO3O0O0MQGEWT8I9WsibKyJmQxpx5NEq0+HIu1EZpwJCqjrZjvjKiTbx/WnxDNJk5N4vYEMKpgUvIKSPzj+/FuyxlVGIf17yEC6qiwg2y0FL3uR5N6vcWcTOxOjX9Jvq+kApf6KKi7G3q38=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=ImgA2jIb; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="ImgA2jIb"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 36C88165C;
	Wed,  2 Sep 2026 09:03:11 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E5FD13F882;
	Wed,  2 Sep 2026 09:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1788364994; bh=0lTk1OO+FAZyEjFRc6z7dc1s5Dj5L9dAr2btCTzBPfo=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ImgA2jIbtINMGd2+R/Rl46rp4G3B3E0TQYDSLKq3SfCHzQDlnZsS9zD0ReXQhStWe
	 VGtQADzhMLwZ6PBDLu4J4Jc0qkXEblxHMr/clTbkx1Wvd3sgrzGNWYxrkMPF0vXu49
	 rIZKlTP7dOcUiYCtDn7eZu4w7z/CTEIbjZUsn46w=
Message-ID: <2ffd1231-2f59-446b-94c6-000fb987980d@arm.com>
Date: Wed, 2 Sep 2026 18:03:09 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 12/15] arm_mpam: Fix get_cpumask_from_cache() to clear
 mask on error
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
 <20260811-mpam-resctrl-dt-knp-support-v1-12-ea6397bead59@oss.qualcomm.com>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-12-ea6397bead59@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 8/11/26 15:30, Yin Li wrote:
> If mpam_get_cpumask_from_cache_id() fails, the affinity mask may have
> been partially filled before the error occurred. The caller has no way
> to distinguish a partial mask from a valid one, so it may misuse the
> incomplete result.

But it returns an error, in which case any caller should ignore what's 
in the affinity pointer?
I am not sure that clearing the mask in necessarily the right solution.
Either we leave it untouched (which might be tricky), or we check that 
the callers restore or discard the affinity mask when the function 
returns an error.

Did this trigger any real problem, or was it some bored^Woverzealous AI 
review tool pointing that out?

Cheers,
Andre

> Clear the affinity mask before returning the error so the caller always
> receives either a fully valid mask or an empty one.
> 
> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 7 ++++++-
>   1 file changed, 6 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index eac3bc695fd1..d8856864e89a 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -243,7 +243,12 @@ static int get_cpumask_from_cache(struct device_node *cache,
>   		return -ENOENT;
>   	}
>   
> -	return mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
> +	err = mpam_get_cpumask_from_cache_id(cache_id, cache_level, affinity);
> +	if (err)
> +		/* Don't leave a partially-filled mask for the caller to misuse */
> +		cpumask_clear(affinity);
> +
> +	return err;
>   }
>   
>   static int mpam_dt_count_msc(void)
> 

