Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380745;
	b=xVK80sVkEFVeTJywUzrpYksMU9cvjGsYzz33Q7ES6aNcY78a8B/AabZW541KUrf8jJQ/
	 42Li/noW1FrV2ZATNTkUVVZnX/og4TA8D2+JMof9501bpokEfwh/RShcFi3uG+dQ5iyaj
	 LKp5+CcsDDCfN7KdqGpLxAdpcv2ZgWo6YA9p0HmeI8xzJaa/bIwQ4FjzHge4TB667xm2+
	 03OcZCumptMJhJjglwuXrLDMQ/NBAUhjncuD28Np2SVaVjMoxaM6QsZaWOIcTuw3sc+Dn
	 X25R0nYV27jMNoos6Gut+GVqouUzXlFBYr9C/niduTqoMrpOrEPHkloM8UTs0c54WvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380745;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
	b=had3fPUgzEPjhv/QcRaQRsiPtRGr/PHnE7rsxvEkXTyFhwYSTk6CIsJdnLw1JjT3A03M
	 NxL7F0XtjwIIYjFb+0WAli6DnQpon+UasDnPZfw4E/VZRrJwAZoAIICM5gcajP8RLF6To
	 4fnjY7GtaKFAaKljNR2MN+EYgCmmagpAOniu74D4Dy2zUIu58bTY4AlQcUr9ckFQwwxeq
	 ONGpSlQT0nej/OcQmrIXX5aJvCGT/AzT+Ww7Eos8TZeLShkf4fB163sTQRlJKFfM4ehyd
	 mz0tXglW3ydJfwO3HbZ4LmP2yKrDmTSjqJXBIByhIDNPMRalTjIFnW1h3DNulbGVIrA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6s7Wzt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gWMNh4gJ;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB0F1606A322
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 17:19:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BB0F1606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=bI6s7Wzt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gWMNh4gJ
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERoWS1953767
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 17:19:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=; b=bI6s7Wzt5RY1O8qb
	Y69aVd5U3HUS7vWVvI6035fPSKCxFs4pl12z2tNrlwnTS0DzHG9oh3pYA9QU5n25
	HMZLYfzm1wv8I9qA6/SaFgs67DiB9TwTpsARVffqccqUyIkOiq16GikcqKy/3ptI
	/kxY+kekfRSso2oTMGsyVcFlkPxmzTp1DqpVNHqlo2grOnza6ZAib5olImyjtUxz
	hxZr1OlExF2aO3+qCsq0+fW+eYm3Bd7FrT06/lOS72KMk75nLSGCpPtxmKMhYyP6
	Z9BNKHJ9k2xPIMzpJAdBZnoPmHE6KrLIkUyMrQ1D2EAxm3nd4AziX3uchjhXWlEN
	zJn8Ew==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com [209.85.210.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6pm6fv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 17:19:03 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id 46e09a7af769-844bc76180bso1216420a34.2
        for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 10:19:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380743; x=1793985543; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
        b=gWMNh4gJgWX3viX0V9OYt23do6dqyx8DR7Ou6Ob8jTpLLhLf3x3cC2Z2SpniPk5HeM
         DRvqcP0DpslRme3XDfLu1OJQeaKxpC/6LAAjhEwx5PLvff6aDJw8pRaicVS0mChMah+F
         j+6yGF/n3kfmqQ7RpL6cLL1P3YiSifvyxbNUF1zppzal4F4KYAQY7kpbxX/4WJfyhfhn
         kNz23IWJiSJKUWhBMSZ0RwYUlazt5neMKNYiYTgrek2izkYuK7KO08DlTAv3NWZYlPEe
         cSjq7f4TXler7XkZjQ0HSFPEMMhd/VMaafoe/l08abGZKLuSmJZilVQOBi6OqDYNZE1x
         u+Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380743; x=1793985543;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LztxLNl/cxBUH5XhoVCY5HWh+124EuWqYRgWVaTkemI=;
        b=e4PpeaG2ymRsc2OzAdIuRgjVkuzGQuTbNbmaMkGiJxOdllIoSFvCYobK2wCkbbu2bc
         dLrx/foF0z4pqKs8UVe2ikH4em1NNeIkQBopCW5m6G1jOSm9fYVXu/B3RDo0JT2tF7MZ
         I88GUz423AolbDrv2HwoNvmTDEMHJkj2rzxJdSGFEdnVEvaStgQc34vd0NmAzqGuQGsR
         mzk8y1Ge9dMuJUApu4DhAxiuaBohvl884Gwgp1qzH7akJhkIpDORLj52ace2OA18wfKo
         NPqbDJyML69YY4tDI1zylv8nvpEiaLpyOUvKjrLTK5AkdoXD3J3zz/ievgt4mHtyqou8
         cKWw==
X-Forwarded-Encrypted: i=1; AKwUvBw2Xpm12reJ6720g86iDxUIzwyRgWUGcEI7LWjL9OOJUoZoantPHb27IWvlpmTqy5xopW2K89GUzUn+5g==@lists.linux.dev
X-Gm-Message-State: AFq9FYIURJcvobY/gzKXFo7OroCYue0cEIpGd98sAtm3tW7OTsbEZyvc
	zrwUatjbznWk9Sh5DriwHEwD01xTjGVjODnSSROkO7kGv0jdPqsR5qWQVz5xDN9qAeE9AztlYP5
	L+SX765DrjlAt0wl1ffIYmp9KnyhDWiGmKLAPw9ctV0sBGTOi3Dl2GXObbi9hRMN4pg==
X-Gm-Gg: AYBFou28qaSLThrwC3yAeBCFNzrYxdQ2WT9H6zN9QEWRmJPwhbiwNH1B6yqQSVC6aux
	a1yVRgoRzPM7ltwC3YQjqqUN5myRQiF3FtzkE6wRuUsYdnw0fZsIZbf3xFDQ51OJVrHsOaWW2PA
	ihdDZ5mnPUS/dI0yi1QmYkYdb/FO2pcMZrI5//+BtHn/KBWZfWczlgbX2LxL+BnBeK1PbJ+nZMw
	W55xwHXwfvbVC4ieUPYUgGfu6zj/WZGxzogmjiA2QiBP1HoHoN8R/S+8qHVBBMShWJOAVFWg32/
	lKiDMb+yJ6gNO3OSRqJO7xONtgKuxYu3eniUby0bPEVq4U/5b2pQE5Jlf4wvqvq/PMIt1Zj1sUq
	YEC/9U+G3xNjrio+K1CfiZlLvD5QgPi9OTTlyOTDL0wZ5AXL4lcUKevR4qIUTCAeHqM3J+KYwvq
	WiM1T0CM6fZvdVrWrJgU6fDarJH5ZlCKQcjwwFdeaDJf1Ahx3QftH5TyJd64nGMXWA
X-Received: by 2002:a05:6830:43a8:b0:81b:c62c:b63 with SMTP id 46e09a7af769-85d3654bc97mr2516113a34.18.1793380742771;
        Fri, 30 Oct 2026 10:19:02 -0700 (PDT)
X-Received: by 2002:a05:6830:43a8:b0:81b:c62c:b63 with SMTP id 46e09a7af769-85d3654bc97mr2516083a34.18.1793380742316;
        Fri, 30 Oct 2026 10:19:02 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-85d355295fbsm2491106a34.25.2026.10.30.10.18.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:19:01 -0700 (PDT)
Message-ID: <11d12057-11ce-46dc-8310-be660838515e@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:48:48 +0530
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
To: Yin Li <yin.li@oss.qualcomm.com>, James Morse <james.morse@arm.com>,
        Rob Herring <robh@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Ben Horgan <ben.horgan@arm.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas
 <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>
Cc: Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini
 <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?=
 <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org, kernel test robot <lkp@intel.com>
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-2-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX1VIFVIQOr5lu
 U8PsnITc/JX7QEhLmKt8J5LLGJ2UN0VvHrZYNDk/lKCB7L6xgtb5C1Nn1dYQ8XumfPjqETfM1kG
 1jh0ge1Ha5x1XhdGUoJLD2L1keejp2hEnlbuJ4yI1igi0uLOUhkcPgjsZJX/WfJTZ2FGF8OguA0
 aT4CztWZ+HgIP2PwTziSvkSzCyzlRKscAsLr3FkPX+FjMTEj3SEugnOGm4mkJmFYJyAlis1ujDy
 KE9qaOUBXAE+Jc6FKVuwnyaVXu7eZRky/o+bQ2+sqY/u8wAj+eizZGw5MeCS27DLYb//I1OKbku
 Z5bXegwEQGWa59Fgiw+jMQ/0uc9Kh7RomO3ykHXq20H3De2qCwecKf3x8yiwyocYVr9W8uC3+dO
 j/8vfx28DzClmJPxuLwZ62xAh98oGYOO2mfS+qC+EGYHCp/VAz5/m0N74mjaHGvpchRCLFplVhA
 fAaZsm26hCw0c2EmnJg==
X-Proofpoint-ORIG-GUID: k2-RBseJ8SUOM4GAhnj9SQvFZBsRQ742
X-Proofpoint-GUID: k2-RBseJ8SUOM4GAhnj9SQvFZBsRQ742
X-Authority-Analysis: v=2.4 cv=AJ83otAg c=1 sm=1 tr=0 ts=6ae4d187 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8
 a=lcbwfqp2WOkoDi6s_FAA:9 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22
 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfXwZxxeHcswrY+
 4ib3WeQKp/coJCUG8lyE403nvfTOYxxyo7CY4Ps7jRnfp+F2Rrk2mx+Cge13QKVLrv9HkHo9rFE
 lFdkiNGgNxYC/maGAJmQ1CyYEXlWjMM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 bulkscore=0 phishscore=0 malwarescore=0
 lowpriorityscore=0 clxscore=1011 priorityscore=1501 suspectscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300068

Reviewed-by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>

On 10/28/2026 5:15 PM, Yin Li wrote:
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
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 347a5a6d6a1d..0f984fcbcae9 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -2508,7 +2508,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
>   			dev_err_once(dev, "Failed to map MSC base address\n");
>   			return ERR_CAST(io);
>   		}
> -		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
> +		msc->mapped_hwpage_sz = resource_size(msc_res);
>   		msc->mapped_hwpage = io;
>   	} else if (msc->iface == MPAM_IFACE_PCC) {
>   		u32 mpam_fb_msc_id;
> 
Best Regards,
Srivathsa

