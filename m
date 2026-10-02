Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 9F0C338D686
	for <driver-core@lists.linux.dev>; Fri,  2 Oct 2026 15:50:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790956227; cv=none; b=TllkEyRfPlz2+EQCmVrz1Gg+vjLF3FinfEV80uVw4DSAO/WkEW9Tae5WSM0B7cnAOibJh7VYcqxZubm3i3X4scWYT2YFMreFsdngl3La2cnBXc5l7ItFVyxyTltvnk28UV+x/oRhFBRKlCH+Ra+6IvK6bwp3Rr/xMi8KDpG6uVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790956227; c=relaxed/simple;
	bh=addLhb0y53M6moXzrK6ciKSDwv0bF0n4zaTd5bS4+ec=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IAVwKmx5QUg7Xl2C5Ecdmp18/+Z5Tgh90zNvQ/KxuR3aCBSIu4zk1RY24bgQ1ZX+jqcBFoh8yyOGllUfaz1s1sucL4N9jffT0boogwUEnfrOVCBnUqLl2ROOcwp2e3NDviweTa6wvuXPPk+5lbQwangU5lJfmIyl+zzgEnS6yQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=dIc0SqhS; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="dIc0SqhS"
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E5FDD2F;
	Fri,  2 Oct 2026 08:50:17 -0700 (PDT)
Received: from [10.211.55.3] (unknown [10.57.85.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EFF853F882;
	Fri,  2 Oct 2026 08:50:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790956221; bh=addLhb0y53M6moXzrK6ciKSDwv0bF0n4zaTd5bS4+ec=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dIc0SqhSeSEZ/CM/AXGJdNLXtW0qvBRe6LGaQceAFTxDl2JXb5l1nqfpXkBBCwt0o
	 ppPo9dofMYeflUMRn+pJr9K+j9HrGjjkXXaIrtTO30cB8XZO/flVYhZKFU5Ih092NU
	 xY/dPfvJiyPGAr3QokJAAotPvX3tbzS7/jGzn7eg=
Message-ID: <02c82cdd-6fc5-4b54-99cd-32d88cca956d@arm.com>
Date: Fri, 2 Oct 2026 16:50:15 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: [PATCH RFC v2 01/10] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
 Rob Herring <robh@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>, Drew Fustini
 <fustini@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
 trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 ganapatrao.kulkarni@oss.qualcomm.com,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
 devicetree@vger.kernel.org
References: <20260914-mpam-resctrl-dt-knp-support-v2-0-bf6645bb2f65@oss.qualcomm.com>
 <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20260914-mpam-resctrl-dt-knp-support-v2-1-bf6645bb2f65@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Yin,

On 14/09/2026 10:37, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks,

Ben

> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index dd422c56fbb1..6da217abf689 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -552,7 +552,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>  
>  	lockdep_assert_held(&mpam_list_lock);
>  
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>  		return -EINVAL;
>  
>  	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 

