Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=113.46.200.217
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793261612;
	b=p+4l3krsdhdWcw6/nZm94mVcFGoAI4B3d68enYZjKqqZO+KBlzi/CWrg4pD1Bmgn7ow9
	 Z4LSdG8BWx7aaw9YQMxApv/kM1IhCoOzvZAFsl+YhhbEkDxuRIVC93dvrt7nZqHoscnnz
	 iR+ddpoYhZrVhkco1H1Tk7mt8NwW6MhcHjKvy3uB6qoKrMlg0kR/ncxqUedlUl/S6QHj4
	 986hjhuvtSeTTpkhVdc3fHo1gI72HG4XPAwsNbReiz+cksqF+qHivX6PP3l5oVo8l0Y0s
	 CfvgzzCwwpmSk2x38S53CuVTvwcduRubkV6V0HqKSaKMd3rhAPZlh3buKxVP/Wj0UQA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793261612;
	h=DMARC-Filter:dkim-signature:Received:Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type:Content-Transfer-Encoding:X-Originating-IP:
	 X-ClientProxiedBy;
	bh=sLX0dAXJtQCVkv3TbihTh8YXNXMoEZpgRUeoWcPA1mU=;
	b=SdU7FV9TLIllAVibYZwrbNoaK8cyrvzeMLnQEWhWHJgbtqdYw+ORLH4c7J5K7oXf4N2V
	 /z+NA3O8si15O5/LgYUmcKqWzgsEOmQCkI6ePvatsyscGKC8+4g/ufkozgBEG3Yu1NuoK
	 VUSEoYh4ehowV0MK6lir4URiVfUWi9XMVSM0+OGA0rr6DbRrmrPtr3G4yHJbCt294FbmU
	 xKOrqsbOBjR1w5IZs0c2Fhj6NIer0+7egW66P6xJZGbkJu5EWtP+bAJGeA+1bRVqcQ/cn
	 BDlclBWfgAAABpn60fHAF7fOAHngqrFShGBArba4pwMdC+LVTiY3XeH5C2StSQI9h1Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=huawei.com;
	spf=pass smtp.mailfrom=huawei.com;
	dkim=pass header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=k6m0K6oh;
	arc=none smtp.remote-ip=113.46.200.217
Received: from canpmsgout02.his.huawei.com (canpmsgout02.his.huawei.com [113.46.200.217])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97823606A324
	for <driver-core@lists.linux.dev>; Thu, 29 Oct 2026 08:13:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 97823606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=k6m0K6oh
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=sLX0dAXJtQCVkv3TbihTh8YXNXMoEZpgRUeoWcPA1mU=;
	b=k6m0K6ohzROjiXTPxRaJoJPL5oH2Hj3XemhqYiI4XA4SQU1NV72L/nAHes80uhboCtMGZgHWQ
	smdX+5iu+6YQFynGMcWDbNcA0opjC8eYlohw0BjI/jzGN1BvdNh/GUqmmvR33VzPeG9DaYzaHWL
	plub0paio/oyi+lflNRVV+8=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout02.his.huawei.com (SkyGuard) with ESMTPS id 4jFcRh2830zcZyd;
	Thu, 29 Oct 2026 16:13:04 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id DA7C24057D;
	Thu, 29 Oct 2026 16:13:19 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 29 Oct
 2026 16:13:18 +0800
Message-ID: <83d3798d-99d3-4f0e-8552-c1d6492d6041@huawei.com>
Date: Thu, 29 Oct 2026 16:13:18 +0800
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/6] arm_mpam: Fix MSC MMIO window size off-by-one with
 resource_size()
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>, Rob
 Herring <robh@kernel.org>, Shanker Donthineni <sdonthineni@nvidia.com>, Ben
 Horgan <ben.horgan@arm.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, Greg
 Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
	<rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Reinette Chatre
	<reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>, Jonathan
 Cameron <jic23@kernel.org>, Bjorn Andersson <andersson@kernel.org>, Konrad
 Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
CC: Andre Przywara <andre.przywara@arm.com>, Drew Fustini
	<fustini@kernel.org>, =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
	<ilpo.jarvinen@linux.intel.com>, Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
	<trilok.soni@oss.qualcomm.com>, <aiqun.yu@oss.qualcomm.com>,
	<ganapatrao.kulkarni@oss.qualcomm.com>, Srivathsa L Rao
	<srivathsa.rao@oss.qualcomm.com>, Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-arm-msm@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
	<devicetree@vger.kernel.org>, kernel test robot <lkp@intel.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500001.china.huawei.com (7.221.188.70) To
 kwepemk200008.china.huawei.com (7.202.194.74)



在 2026/10/28 19:45, Yin Li 写道:
> struct resource uses an inclusive end address, so the window size is
> end - start + 1. do_mpam_msc_drv_probe() computed it as end - start,
> which is one byte too small.
> 
> mapped_hwpage_sz is used by the register access bounds checks, which
> have the form "offset + width > mapped_hwpage_sz". With the size one
> byte too small, an access to the last register in the window is
> incorrectly flagged as out of bounds: for a 0x1000 window, a 4-byte
> access at offset 0xFFC (bytes 0xFFC..0xFFF, legal) computes
> 0xFFC + 4 = 0x1000 > 0xFFF and falsely warns.
> 
> Use resource_size() so the size is correct. The ">" bounds checks are
> correct as-is once the size is accurate and are left unchanged.
> 
> Fixes: f04046f2577a ("arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202609030809.ObirDhR3-lkp@intel.com/
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>  drivers/resctrl/mpam_devices.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 347a5a6d6a1d..0f984fcbcae9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>  			dev_err_once(dev, "Failed to map MSC base address\n");
>  			return ERR_CAST(io);
>  		}
> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +		msc->mapped_hwpage_sz = resource_size(msc_res);

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

>  		msc->mapped_hwpage = io;
>  	} else if (msc->iface == MPAM_IFACE_PCC) {
>  		u32 mpam_fb_msc_id;
> 

-- 
Best regards,
Jinjie

