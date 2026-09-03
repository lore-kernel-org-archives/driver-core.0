Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55DC943F081
	for <driver-core@lists.linux.dev>; Thu,  3 Sep 2026 08:18:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788423540; cv=none; b=RDCn9lbgypjBUT2ZVhY5jh/f5Od5uMy1czfkIVTPL+L2XZKVgDivtKW6QCTm7f3Fg5LnRgso98WuENXix17vVS7PfmLo8pE3bn7o39hiuJ6el7M2AhC29NWc7I7afb/VCB5MZ+zG3ovdaDBsBUyI5pFPQwZnOQMrT8k7ecejJZc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788423540; c=relaxed/simple;
	bh=xnFgWawnXFx8zIyhj/RPtiiwIwTFMQlexPNBv6a8wJk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cBDJDnmhsVgv0Zin7JBlG3sZ+AdKtDpBKzdp62zQIymH66dfdiizN65P2IcIuwlBie8fkRFCmk4XoB1p0NSGn6k9OtJusLyCctp79swVfo1bxTzBO9/G64DlDswmaqON0aCO3xP+ZXaJfG8wYBM93v5u/bv+stCxegg9DXEoXgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UxvNqD8s; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=PSBc5LKF; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UxvNqD8s";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="PSBc5LKF"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6835mZ8K081164
	for <driver-core@lists.linux.dev>; Thu, 3 Sep 2026 08:18:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=; b=UxvNqD8s2D3kbW3/
	IDzmY64Fxue25fu1Ufk40pOa/vHiAa/hE4PEU1LukolUFgxrWWqUzG+7cBADYgHg
	+TPez7HOeAZ0JHrq9O8gsBxIPoPEbvTf03Zc6w/ItawEcAsY+pizjUWzMF2RcqGL
	6DtOL/Oxp1/znNlGalJb7xOMFydo/si3aexepMeutbZpdPulQDdVotx6j7DvJ9lV
	2fZead8FoYQy8MdAr6vgvIYwnvSxTXMM1eLjvyGDl9pNMLIzJOslfm1e6ysk+K49
	3eXtYWL8k1MXEma8kLzP6m6kIY0XuwXXTgGY5BzXKt5fiIgLOry5ugwkmO/rSSY4
	Psdd2Q==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gf1j4gvyq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 08:18:57 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-398e1f7d1a5so3339662a91.0
        for <driver-core@lists.linux.dev>; Thu, 03 Sep 2026 01:18:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1788423531; x=1789028331; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=;
        b=PSBc5LKFZKwDRe6nEaYZ2mhOp4zGMbRN8+ZBt2h3vSH6Jj8oKED9ZlJ4LTr3ihfi0O
         E3VvVAS3+KZktKdHHaT5hsjrTRzQSmY5ZcFjO84q41pKi+JBI7czM8aLiZf4wSN289u4
         AnP6eZ6Yn8AeC5ZDXpSJb/lt6HYg3LZLNrm07QlsGEIhLOX+GYlPW2H2yeteDgPoMYW8
         eNBEtDC7DwSO2Nu2ucAvEmcw2JlkKb6q6uBoyW8JgL0+hcNXjA8S0zjuLYB3SEw7QnfT
         vdHlXlVnfy4EArwzUI2W6LYBB1YtwBmewxyB3M0joG/StGveVW4lYzsrOISRJsyduECB
         +YfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788423531; x=1789028331;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=WmLsN1tIniapFyOpteL0/516X2RHNebqt3JtsolJx1Y=;
        b=jLm8/WKalyDmDw1B9SS9pNtJ+RPZU8S3KMjQPiYb7lf94mWKOLw/rGfwwbkhGX2/zD
         2TWLvndrHPfSizRf2nqF2604Oy3mm9n6p8KopEWRf7q2speI5JJ9crQVSr6T9et4zT52
         sd/n50WGL/XHQTBKtQp+kcAi5meDvhKQTXTffqxZc3+fFqOB/lc47RenNrV6rKdzHdR5
         OIjtcke2aglu5PcKxGLvv4AUGCjuplB4q4kvyp8c2CsO5aqr/fk3rwfpd7CVruIQZFl1
         mUnW5nIjXpLSt3imrXAWNxmCjQQkF3xVZs7D8UKVp2n1OLxCpXw+VIiPlCLo2aawOXE9
         SF9w==
X-Forwarded-Encrypted: i=1; AKwUvByduWFmmAMrcSiCAHA/039u2gtKThjLzA+Xw38UCrm4vsjSUDDB+9WeH5k/CgHfRk4CunxFs+9VPmHQ2g==@lists.linux.dev
X-Gm-Message-State: AFuF++nAdbWKBvmXqoARj7/pYUkuaqS9QbgrRrN17HqmBZAmbciOHft/
	5s0s1lFogfKmppI/Mg5tc/N9bvUeWCRWiifCcCQXxB6FOwvYF46LccmE0fPNLsnz0Yz46AAHFcN
	s3550nMeVq42wlWLjGApCbm6lnCLfJFPBTbtH+turWqgHbU74+CUqH9PpK0WSGJQCSg==
X-Gm-Gg: AYBFou0R5XKLJMk9ITDNhcDPE8LkLPG6PfyPSco0lAuOxLa4cbaHr0osl0pz5OEGfYW
	RpNGAFDz5lTSMngBYx4QGh9RvxkmkUbf4yoxT7HEpZEtDMQPrX+WOA7gSSTNjFmOncfkAFBn7eU
	MWM+OqXLnCTE67RU56QmUsDsTIylXQvIPNFuBWsklJG7g83La4fG7fduh6AOJQjtXKh0hPBE3Y6
	G5K+2iuzL7ErYkSUTsOPsrJa7cFS+sDnFRsHhrN+uLeXfC5Qs3j7gqqGeLo9UnBJw0vGz/AUlre
	cjb1LqZZuYnSfvlmL7MdhdAtXZ+ga6vBmj2wGB0ye3zrRzAx9/RkFdLJHujHMciZkcim8+SN8ru
	1vuOC1y29gmqyyDUwrA==
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr17457523a91.23.1788423531410;
        Thu, 03 Sep 2026 01:18:51 -0700 (PDT)
X-Received: by 2002:a17:90a:dfcd:b0:398:ba0e:96f6 with SMTP id 98e67ed59e1d1-39aee1ad8edmr17457457a91.23.1788423530935;
        Thu, 03 Sep 2026 01:18:50 -0700 (PDT)
Received: from [10.64.71.54] ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39b08300ba2sm4456477a91.1.2026.09.03.01.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 03 Sep 2026 01:18:50 -0700 (PDT)
Message-ID: <2bdf5393-e684-4db9-a408-a821c7dcbefa@oss.qualcomm.com>
Date: Thu, 3 Sep 2026 16:18:42 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 07/15] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
To: Andre Przywara <andre.przywara@arm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao
 <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei
 <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
 <20260811-mpam-resctrl-dt-knp-support-v1-7-ea6397bead59@oss.qualcomm.com>
 <99e2cbcb-993e-4f83-b7ec-c333407aabf9@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <99e2cbcb-993e-4f83-b7ec-c333407aabf9@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dufrzVg4 c=1 sm=1 tr=0 ts=6a992d71 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=Zjq2ePIxWaVxvOnSyN8A:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-GUID: _l1IOdvPISxdeyo-WMevMNCAm9aifHOM
X-Proofpoint-ORIG-GUID: _l1IOdvPISxdeyo-WMevMNCAm9aifHOM
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfX6fEyuFWcyq2p
 pE84mSCbXvJLb0F/JDc0ui01rNfJ2q0wr3srYIXgO4x3vdYdZ8AE/ttx3+Z0U07bxstr/K4i8iM
 M3eTRX2WTZADTGCb7azss2x5GvkGHuc=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTAzMDA3MyBTYWx0ZWRfXx6yWraE32EAl
 +DgvcRix5FOH+iCZUuyPHIwPlsdRR/5bIBkFBkIC2xPs+c504Objin9FmveuCyt6ZpLVSyFyU5H
 DVcGtskWM6YvOOgCvElvZJMsozeu/BlHTCCv8fannM31w3NV0bY9owL6CrNjOcFTkbN8vYnFWJJ
 Y5sLkddINryTjykSjAFNjKHZBUdR4ix+3sale7yv2IHNbj0nliD1zaQhOEnQbtnug4ZJRS9kKak
 Y6QwB/mnNC60vEO1Risa/AjV422l/y+Y1Wt6ohYZKqDvSWrMCTdbSeNJ//TYJe6uwHyNMnYVaDp
 aRs+F+aEMdtdX31tz7lb9BJybxoqa4FKJ6XAVqPDskBlEZWqcZfxVT2unObv0X6+18Y/GmVj/0U
 7wQs0kaFVFo9VSRpITtjXFNmF4QKU5Cn1gkM/iVjFkltNWg3VkpDpuHS+fnTyZ1SY+PM9DcRv3F
 dk+t9eK4iiFrq+ko9pw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-03_02,2026-09-02_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 malwarescore=0 bulkscore=0 suspectscore=0
 clxscore=1015 spamscore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2609030073



On 9/2/2026 10:50 PM, Andre Przywara wrote:
> Hi,
> 
> On 8/11/26 15:30, Yin Li wrote:
>> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
>> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
>> is defined as 16, so the check should use >= to reject index 16 and
>> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Indeed. Either the maintainers pick this one independently, or put it up 
> front in any repost.
> 
> And add:
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures 
> for firmware described ris")
> 
>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> 
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> 

Hi Andre,

Thanks for the review and the Reviewed-by tag.

Agreed — this is an independent fix to existing code, so I'll move it to
the front of the series in the next repost and add the Fixes tag.

> Cheers,
> Andre
> 
>> ---
>>   drivers/resctrl/mpam_devices.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/ 
>> mpam_devices.c
>> index ddc15249ec1e..cc9fa1d78925 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -725,7 +725,7 @@ static int mpam_ris_create_locked(struct mpam_msc 
>> *msc, u8 ris_idx,
>>       lockdep_assert_held(&mpam_list_lock);
>> -    if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
>> +    if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>>           return -EINVAL;
>>       if (test_and_set_bit(ris_idx, &msc->ris_idxs))
>>
> 

-- 
Thx and BRs,
Yin

