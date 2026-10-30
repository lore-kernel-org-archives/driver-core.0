Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793380546;
	b=3V8xOC3yuGaYV0en7QIMmNxJIPdQ+NfdLgTFzG6XkE96QiL3xHEyaw0MT8anMOMiC+4L
	 MwLjynmuyfxGBH3Qot/layG7aJp/qljtU/VDZKTGAbtvNxRU0iJtZByk1mfztb1Leh1Rn
	 86ihFmPdYINxIwWhpGF7R5AatONSXgGnSjhirnhst2LgPZVEpa+zGu3DaH50uXTY/y1We
	 YeGKHhOVcUpuTfWHUpGYvladElCtYl07SmS1Y0id++7KTYTHlEjNzIZzMCPQCXFdso9BB
	 fRYQijTMRy9ZR9iOPP2HYj7wrr9Ctcw+R1Ki7ZsSFfRyhQihyMJAkjbQSeNGIcb17LQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793380546;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
	b=a3S+KhNmKh34U1wVySCgWy0fHywfP/sHlDZpqkAyjD9n+u/af7Na4lq8+HEGJqSGiRgl
	 nR9mszMprnBBjAKwve1eiU/84OmBuqezto/JSc8TWAFhW+MT1o+3f1GRJuLeju957w3TW
	 W2lu4HXW38T+jijSpaxYTnnDtrU3f1YiMcc218p9iOUe39mYtI7OTk56ceFXMoSe+PD3S
	 PbRRe+TT4GcfJh3ydSEaKEhUQKlOzDtq7MfIJGz3ujI/dTnUAcY9D9WUwBfyjYTiRmSxB
	 2zz90ogZ0kRfpJjTwrY966HhuUp/AA1xkopyE6xWqEhJDmxrYExvQMZD45XABdEYT7A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pzqb9Rii;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E2BA606A324
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 17:15:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E2BA606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=gOg5RBwV;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Pzqb9Rii
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERit33207534
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 17:15:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=; b=gOg5RBwV3PekfPEO
	+oPNR0MVxk61KNp0EZqXCjntTL7j4cVnSVzh7z3b9qxaJWwQ/YhTjpy4PWVFXxsk
	8ofXm9Ev2QDaCKCRJ25ySsUt6Ld7Y0MZnUaM/dpFcTXfVq/ktbtB2SNXbFtEgZVL
	G0phIgX+21A2uq2glFvBM/JAXw6P7FZLJtzmdHRCtGVpORuCcknmE4OgOw5JtLcr
	FHYGSxMHu2ENa9koFK3nCZACjRCEwathVg+HlRelK3XOjRG5GqEGdT3+dya6XfnS
	hWRi+3hpz9x/oRkNoA2lis9X0ApSlHymkCPdxOPcquezvNHjijLBzKBg/lRtPUGM
	fygoGQ==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qm5r4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 17:15:44 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-30c0d568830so1780297eec.1
        for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 10:15:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793380543; x=1793985343; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=Pzqb9RiiEAxhI1m30LfM3Op0Ix/vYsXWv7kPcscsXYwIQewlEuw8qVF3F1+u2jBTA/
         KTfkyR9M0oPv6nWE+gMXJ1ah03aRtyc0HBJExJw8HqhRXjndDOu20gylcaLUOArXu4EV
         M/shxH4UwCghjwjvcz2X4HghUARmSctCuesXE6cXRTIcfmc9vqvUviIOHKyxklK23tGP
         PjrEhmjHnreTT/4I5VXkRqrR00gOkC3w+cMzWIez3redPy+wuVjRG3c/k9rPWYA5pgPr
         frKUSWML8bQcv8/DZECwjGkcnr0THpb6vKY5X8T8QNB+T15meMlaKG1RcfCyYlVSGSmQ
         kYFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793380543; x=1793985343;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r8DLQMv6bl/QdZfypAZ5tHl7iw2qL1i8GWHVP4CuKC0=;
        b=D+c/nBQ5QyT2+2xrg5l73Ith/FfjSda1q8+LTGDSExyBeiASmRH61ZeheUUBi6Fgjz
         azzvWmbdx6Tp0dF35+Wo66nK4NR3Z4mefoxBkZgEn8e+khXZFfaxtYvPqI4Y2SgY7X8T
         t0Hsf4Q+VcrTmqOgGBrFvwfQm6mb8Z186Ohj/vlhNZj2YbBJaoFr19c19Tdwe3g8UXpO
         krlUD3HbZnzcbAFfAmsPjwqdRJo+N6tTpHv1664ZcWUZZ8vBQpEw/QCDxolccHNrlVjB
         UkIayzw7R2MZkU4Gm67cQcrq1AYTGPSX+XdBbLXP0HIyQAxAo938CP/9exbj7Yio2+1c
         nSDg==
X-Forwarded-Encrypted: i=1; AKwUvBzloYalaFayKPF4zcWK8v9kG+eQb99QgX3V4gwiEHvc5iBJwl67QRRXUoPPGI7DHV59odDquhVn851ndw==@lists.linux.dev
X-Gm-Message-State: AFq9FYJutW5oaX/uaYyWIKgBb1PCJaugDZbm1FcLD2Y0rjAtS7/W6sDF
	sh3XDDe4OFzhhLMz6MCMXXamy8EWdi/U1cbgKc/aqPkjiCUt1BkSmxMcWc5HX/vH4eGVbluuQzy
	YN3SnAt/UXlLv9b5TyLAcTOa7ouxq0SpVjIHsqKnTdrzY7MeZZ9q1ZmgijB0etKkjuA==
X-Gm-Gg: AYBFou2oRsxSVpz8DJpceNpgaA/SuqR95XF7k1nPfZOd3JmlUnn3LEy8RDAzARbHiS4
	CAxq1a/jhwTtT60No5s4MwQuGP42eiAW4lQKL/4xNnhNSu6+b4STGc4AQ4c9p5K1ajao/73BAZE
	WE9fgVUV2MNzLqq+YhQuorA71A35bmeNnM7pDw+12g6G6uUaDAvilVZi/ecuXsHlPF0xEMQi0HG
	5b0Q9MPfE1edL5Rj3zhD8xzyS/wDoXGzESloarwZVb5NHotg39JUV1lM26QEUlZ/ksKRxiMDNeS
	5h+5InauAJWHHX87+bO55oDlWetWoqB7ezU36jeAmRDBQD6GXoDwrCV+XHn49KMvIWSMChh2UO6
	53EF38hNLpXePMUqno7Oyb2QdOl4Tcg1Z92Er1rcK8jz7Au6QckbEosiiFDZFE/RCq8qLDYyioJ
	2aPkxZbLoTMWASCWDuPiV+MR5RxflAFhsbhO2y6iXzmph84I7N60tC4xG3Kf3i0Hch
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833713eec.16.1793380543289;
        Fri, 30 Oct 2026 10:15:43 -0700 (PDT)
X-Received: by 2002:a05:7300:a188:b0:35f:4780:518e with SMTP id 5a478bee46e88-36a4238996bmr6833632eec.16.1793380542666;
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Received: from [10.50.42.16] (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4294419dsm8607711eec.18.2026.10.30.10.15.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 30 Oct 2026 10:15:42 -0700 (PDT)
Message-ID: <ba4afee7-5c3b-43fe-9703-9cd42e0fadca@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 22:45:31 +0530
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
Subject: Re: [PATCH v4 1/6] arm_mpam: Fix the RIS index range check in
 mpam_ris_create_locked
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
        devicetree@vger.kernel.org
References: <20261028-mpam-resctrl-dt-knp-support-v4-0-bdda1e445cba@oss.qualcomm.com>
 <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Language: en-US
From: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>
In-Reply-To: <20261028-mpam-resctrl-dt-knp-support-v4-1-bdda1e445cba@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KsrYSmWN c=1 sm=1 tr=0 ts=6ae4d0c0 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=7CQSdrXTAAAA:8 a=-Elna7LzL5zmvItKdG0A:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22 a=a-qgeE7W1pNrGK8U0ZQC:22
X-Proofpoint-ORIG-GUID: Xb7STIRPiyD-THeVc22toK3OSKXnU4_q
X-Proofpoint-GUID: Xb7STIRPiyD-THeVc22toK3OSKXnU4_q
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX6uk1ImL45ozr
 QEHvHayImYX36x3Rdt2+qszI8PHClV4nBBwpZ4DIXqCuKjk2iT59MOaoBW66RvOkn/B6mJNZ4Nf
 bCiFkWbkHo+F+J21B8PxivV0XJX6kda93+I3WtotxM3eK1QYi8gPSgYQfmEw7O2DqYmd0wtwCDc
 mk8mmovD91rbG11p5w+Q4HMckeIS90znlEpmRmZ8PVH6v7p64Oj0Mu1gOdytaB33mdLNzZZQj0e
 /KLJXjXWAzbarTas3qvRJsNSOhI9QPkrjZJZdYfRk+xcHc/uJWRBac1ugQ4Jui7TsJwUadVUV4z
 BcRd7wYg8EGUfNuPBBT5hH/zwoMTpbcPwjwk5O5FVBEyT1cibcERiZdg+G1/rS1CXgMwguwgcUE
 iHWixuuZPX4r28vgMhNYXLhGqvYxoLI96k30A+aYB29SwHgZ6EQNeobJVWDwbSB2hNFuKJNEs6D
 rajxKNfVjrApgalWJyA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2OCBTYWx0ZWRfX/D7XUKMPgKuF
 o4JdPBqjzkwmSBmBMJf9ZpWAjMDadyZ6A2u3QEGV9esz75beT/tL/r5fkwTcJ3d4JGoGKHeifNa
 AA1xRKDFCEFnNUoUmn4emOcXjjIxb4M=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 lowpriorityscore=0 impostorscore=0 bulkscore=0 clxscore=1011 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610300068

Hi Yin,


Reviewed by: Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>


On 10/28/2026 5:15 PM, Yin Li wrote:
> The RIS selector field is defined as MPAMCFG_PART_SEL_RIS (bits 27:24),
> which is 4 bits wide and gives valid indices 0..15. MPAM_MSC_MAX_NUM_RIS
> is defined as 16, so the check should use >= to reject index 16 and
> above. The previous > check incorrectly accepted index 16 as valid.
> 
> Fixes: 01fb4b822472 ("arm_mpam: Add the class and component structures for firmware described ris")
> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
> Reviewed-by: Andre Przywara <andre.przywara@arm.com>
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>
> ---
>   drivers/resctrl/mpam_devices.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
> index 48adc49b833c..347a5a6d6a1d 100644
> --- a/drivers/resctrl/mpam_devices.c
> +++ b/drivers/resctrl/mpam_devices.c
> @@ -700,7 +700,7 @@ static int mpam_ris_create_locked(struct mpam_msc *msc, u8 ris_idx,
>   
>   	lockdep_assert_held(&mpam_list_lock);
>   
> -	if (ris_idx > MPAM_MSC_MAX_NUM_RIS)
> +	if (ris_idx >= MPAM_MSC_MAX_NUM_RIS)
>   		return -EINVAL;
>   
>   	if (test_and_set_bit(ris_idx, &msc->ris_idxs))
> 
Best Regards,
Srivathsa

