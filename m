Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 264DC39B4A3
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 10:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791886441; cv=none; b=nQrUokHiPGSzXzIDgb1PE2WoaX47IakSDjG1mRrnYZSmnrCDAVt8HSq0sSszcwco+hmmq20EuPcbefwgU+AhiFg0a5t/+dcwTGgkhFj4AKtJglfaNNZ/MnArJt7vfxvWRUUgXGjK1OHRFTD0fwo5DQCDA/GiWRPHD6rcdzDRlxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791886441; c=relaxed/simple;
	bh=PbLnTdlpMC70FbudpPYD16et/o+1PhDF6d/QdufD0dg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CEqy3I8kMrdCilMEEyYdsoip2+7z9ejxcc4luWq/8oWMRzPK5mNF9QkAdy12+Vxwb2el7D2UhhR5rmjtYVF2bpN5h19l6Mm1s3a/83kkCidUzaqs0CxDMqRHI4zg1TnHdImxbirf5gO4DY3Or2BsUmCRVj7I/iDS6AJggsAJ8RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=MDAUieoO; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=gO2v2IpG; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="MDAUieoO";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gO2v2IpG"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8J6wW922862
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 10:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=; b=MDAUieoO9HXtf2ah
	tUFwuccCec+P1IeZsPNTsJ9IHe91jBOK9EhWG3DnQpCxTJXC4eUIYjzFoUL2eD4A
	uy+R/yNGFdWiVXVarIvhq4fbDfr9qGmEoCEVGIS0fMGoiWFTCzKfMzAec4cJHnHS
	n4Pp6wYhzILFvzDAYDiBBRS1nf0gP9227W27c8VwsZo1u46ya3m7jGWi7SCjwKv8
	SPRztyE49rXkGXgsMp19uqnN1ZPz+2w0fEDJLqn0mt77VPOYg04D588YRiegmuL0
	No2J9y9h94y455P7jCY8nNGzcoRrnslCetCT2X3SjIphAQjKJ+Mbdor6m3DIvcdt
	wdahCA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h98h1tcv8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 10:13:59 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ac50dc68adso66184a91.2
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 03:13:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791886439; x=1792491239; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=;
        b=gO2v2IpGV4Gjy5IQTU5S4hkd7KzU5J7C5JqMG1rq/tJ7kMw1HBsZet48javJp5bBV0
         A2y3+kodyIa514v6qZV2Ufv8IzqOfv3UwfBK2RMjE3MACFD7qrBWXCSGLU+np5PtivPl
         TvB8Rhw9i2N8KYFIcdIBfmapcUR6hJb3MCJWeZdrR2g7dmuAkJzMVhkqpTaeTd8s3pNR
         /iDvHrvKFpOkksrIw3o3upE+e/FCn6mCMLNuTqt9S3VXhADLRa7GIBG1KyjoBCNJFX6u
         YonYHZVAnnUhhZ2bJRWemetCNt3q05Z5AebIGVts082xIXNZ/sNSdkYDXQ3V8HzaV/7x
         f6SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791886439; x=1792491239;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Gdf//5Z6QECZ3vGiclYWMCzf16BftVzD6ObKd/Z0fjw=;
        b=24irJsOT5fVzfkYNSNeEUjF5qbz20SiGmr6GgSdBIIWFeM2f3OE9hKPJwXeFbUUUm1
         qcz1Cr2/92N1F34YwjvR3SE5mPjbSvntKzrrEaKzVKK3lartNeuPo7ZD5SqI2f0bHSBi
         REQptFq6O3lpryEa/Z8W3ju9w2WG70pg2AxeOsOQxFYIy4zxEYbExC2RhCyJyP50OB53
         oE76rwX4m8i5WCAhNMuOgsGbAkEBqURPKBn2uG+Rosu2R5h4AeN374cA3eO5O89uXEdB
         shqMh/wcMTwKQEcXxcO2pJpPbBGcg7J235LC0PmD6spda+824RhN8IFqLbS68jdwUfkr
         Kt/w==
X-Forwarded-Encrypted: i=1; AKwUvByl7XAeCaoOx/GF47UwsFXd66UkJkgxlS6AsMbwx2gpR1L638VUb41PnR/tckfpcKPv/iy0BjMv5D46Xg==@lists.linux.dev
X-Gm-Message-State: AFq9FYISx/lrv7ySlawPlpi6u0vNdJnwRRR84XOZ7UXtgke9qNuFl/oY
	NyvzDrAEdaZYv1zdh8RjQDgeWux/R6Xo2K4ElO+W/Fp09o3/0qGx5DLDI8COawQgnwS4VDdUWdb
	saroL8iKM52TCdNEeRke3Jm6MlvDX3QBV/jMpSsf0Mxes9hu9JS3uJhkWfhmHYObK1g==
X-Gm-Gg: AYBFou0CELb238CJDL2UvYc1U43H5hqqu5rchHGB+F/reS6qg2byaaAzsPKGlQY2lmD
	sy5w6M1JRAwMsVThYI+xlTvOPyuN5Pw20SVrJZeKd3lWeKYFCuPHQ/SOzMzR6rN3p6G0tQgMXWB
	40bgccnRCFMXE6MkavdkxRCObYY7XMGbk6ErQnEbjHEIKZxUYV9cxD0/Fg8/a1sKuUG6AP70iDQ
	mMnx9PgP9tKfsDlWKtFZwXGBeZle9k774G40xyGTeMiQcjysKhBdNyuKrXUHEvqkC3dAu5N9t2W
	wU43LD+RYE82DP+HSQ24lg+18H+cIAeadeFdVQdipTbBuroFwEm2JSOseqHYDrAWlCXnOu07KxF
	WabxZe0WT01Co1ald7qYVPEtsMiWMzzOSHb5pV8xE10dDVv+ft97spvCWHBmyndk=
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4583226a91.6.1791886438474;
        Tue, 13 Oct 2026 03:13:58 -0700 (PDT)
X-Received: by 2002:a17:90a:10cf:b0:3ab:9c73:12e with SMTP id 98e67ed59e1d1-3ab9c7307d0mr4583201a91.6.1791886437842;
        Tue, 13 Oct 2026 03:13:57 -0700 (PDT)
Received: from [10.133.33.200] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ab39238608sm21143079a91.17.2026.10.13.03.13.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:13:57 -0700 (PDT)
Message-ID: <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 18:13:48 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Ben Horgan <ben.horgan@arm.com>, Rob Herring <robh@kernel.org>
Cc: James Morse <james.morse@arm.com>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, Gavin Shan <gshan@redhat.com>,
        Andre Przywara <andre.przywara@arm.com>,
        Drew Fustini <fustini@kernel.org>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>,
        trilok.soni@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
        ganapatrao.kulkarni@oss.qualcomm.com,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
        devicetree@vger.kernel.org
References: <20261008-mpam-resctrl-dt-knp-support-v3-0-35196c2b43bf@oss.qualcomm.com>
 <20261008-mpam-resctrl-dt-knp-support-v3-8-35196c2b43bf@oss.qualcomm.com>
 <20261008210004.GA1318789-robh@kernel.org>
 <1d764a3d-7935-4e26-b1c2-92537e1d3811@oss.qualcomm.com>
 <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
Content-Language: en-US
From: Yin Li <yin.li@oss.qualcomm.com>
In-Reply-To: <893507ca-b956-474c-9124-92fbfc25e9ab@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=VqC2kO2n c=1 sm=1 tr=0 ts=6ace0467 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=i3Ix9vWbyZrPCULteTcA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: wMFdcbAnVMUggN3emzOautajcWPkyTBG
X-Proofpoint-ORIG-GUID: wMFdcbAnVMUggN3emzOautajcWPkyTBG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX0F7R+YZyGwnO
 jRrwk81dOxGrW1nUdc8Nsuzwq4RJ4QSJtV6pW4b6QAklyCE13ixV7iGXXmUrOqhCSfaoj7ihx/o
 ZgEVFW+oItRXOOYRp2wZjrvukqD/Lzs=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MCBTYWx0ZWRfX53pZt9knC8t3
 9zknQSxoAclI1ue9x8+NVSKRvZcoh/EhpCASStpzbJtJup3TabIdDXHRKmtOLo/mgqOVO6aIRze
 a9S98r/Gc4ZX6Jo0oQPtvhx8LL+JGeF41iBqs7ZSzE5Yiz1wEETxQ9UF1ANbfP+ial8RD0LfWGL
 8XAtBzAY6geIrMZwg4SUtRrQbnBLlQuE7/dotDp2CoVkcYuSfN61k97b/wBOGpjXlvd7xoxxjyI
 KZlgRA8UwS95UjBivzf1A3d9SSl1k+8XQ274HtIfAeKj3Fh0KGd1O2WMN+JZuRp/GtWlMiZebyq
 IYfgXpC6eigiBw2jK90k5kbLTpbds1W0d3sH4qV1MP/jRuoabitaeeDUy6aBtNmJ+k7oA6dBzt8
 nyjxKDsrOUQO9QS38OauhVAbnl2BxcFLt0vk5H847D46EcL9JC0gMg1PbYXeUMAfs+DhTaJ4SZ2
 k8gHW7x3o1uSJY8IB+A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 lowpriorityscore=0 spamscore=0
 adultscore=0 phishscore=0 priorityscore=1501 malwarescore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610130040



On 10/12/2026 7:27 PM, Ben Horgan wrote:
> Hi Yin,
> 
> On 12/10/2026 11:48, Yin Li wrote:
>>
>>
>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>> parent device and its CPU affinity is derived from that cache.
>>>>
>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>> the root of the physical address space, so each cache node only needs an
>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>
>>>> The nodes are disabled by default. Production firmware does not expose
>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>> This DTS is therefore only an example for other platform DT authors and
>>>> is not intended to be merged.
>>>>
>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>> ---
>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>    1 file changed, 38 insertions(+), 12 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
> 
> [...]
> 
>>
>>>> +
>>>> +        msc@19870000 {
>>>> +            compatible = "arm,mpam-msc";
>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>
>>> The MPAM register length is 0x321C.
>>>
>>
>> You are right, the MPAM register space is 0x321c per the specification.
>> Will update accordingly.
> 
> That is the full extent but truncation is allowed by the architecture.
> 
> Section B.9 9.2.3 Permitted truncation of an MPAM feature page IQGXFF it mentions
> some conditions but these haven't been updated for the introduction of FEAT_MPAM_MSC_DOMAINS.
> 
> Does your implementation have domains?
> 

Hi Ben,

Our implementation does not have domains. So 0x321c reflects the full 
feature page for MSC.

Thanks,
Yin


> Thanks,
> 
> Ben
> 
> 
>>
>> Thanks,
>> Yin
>>
>>> Rob
>>
> 

-- 
Thx and BRs,
Yin

