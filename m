Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198C84DA9A5
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 10:54:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888857; cv=none; b=TMxPtQsAzP+CJWq2wr/Wsdfsc6zJQyxe9UqSYmmG59AEv2wuMYJvMhVqtJC8XM2CtzS2/jGBYxKwFV5a7xYgrQeBfFBjDl7ODOkPl9O1v3bj39HU0ub6Hr6J5bTLuVqtQYZEf4ahEXK/avf8HZ3giJAEY32grcnzki7NYWguf/s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888857; c=relaxed/simple;
	bh=du54ZCSpOjF0PwqwOCFaG0DjzSR9Rf64mnlvaVFtKHo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=s+wRIv8CNAW33aPJy0wGrMS3spBfyCnVyw8V29QDp3rwMviL2FqqP2X+AlJqyWxPDZuXJ0NAA3ykJVTfVwV3hnI3dNGgYB/VFxIwBQFOhZ3crVlWLHIbQzW9cIlrhQnQCRxRncD9ZXPAqtLcLYJG/mMMIwYfAxudY5h/ysOkzLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Y0dQ5vKB; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Gqe9ugCd; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Y0dQ5vKB";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Gqe9ugCd"
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69D8GQpU3054805
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 10:54:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=; b=Y0dQ5vKBnEF1RQJR
	heApgmIEPAVPIo/tTxiW+kdDcPiNl4H1cvd44WvGQrIjWNGykMQGEj0HGk3Wsxov
	b0vCO4+yB3AI0ZG2D836u29qpR4iOHEPHIR8gLfh/d6LsiU9nqVP2ifenfVlKPl+
	K/zXIOsq/GHPgCFezdKyf8k8EY9UAxLCL0u67qf46kAzxs5v1cKkYkV7Q1qmDpmU
	hMFHyau2H1D/HBmMdfULDTZmGmpVy/NS+uWNflxTXoM/k/x2D4lu7qwt90YpkJWi
	x0CduRPdV5x1qYCTLq+j0t4vqGTcBrJpn/KSAXrE4421zN6CkfnF9KQEWsmLWOSz
	fBLlCw==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h93aeuwda-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 10:54:13 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-934a8cd3a8bso36468585a.3
        for <driver-core@lists.linux.dev>; Tue, 13 Oct 2026 03:54:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1791888853; x=1792493653; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=;
        b=Gqe9ugCdlZ8eAmMACs46iho7qQcANz3EmcsZrM64oRs2r/9wBQMH5tppV8Piooicip
         5ORsDghzJpQTklAsNwIROhmhitv1YJXNpcBnWdNP3uNZ/gjjPyCsJRGHnysklMrOsdmN
         HFX2r2oGVGSq2zSUkcSeqM5sKs3TPzX9GCcXgi7g6bOAP1zfmIAaeu1l7Wy/8heQjyYA
         bCooIWM4G3hs434bP1vk1p2CAIACQ3SRcBQzDXWdWbtx1kaH86g6NcmyV8mkpKsesWxq
         BcXY/+4Np1zjhYMupTGcWwPshCuki8ci5tKyzUor+itX+UoATIgmqwOojOzB2efcQOdb
         tiwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791888853; x=1792493653;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RqVI6Shzor4tZDXXHye8jWAK245ckJFpWtODLfywHWA=;
        b=Azh8KVbjqrMoh2it4w+VgdJrCqSg8KoDoMHNRooMY2GefD0FHlrbngDn78oHd+EeMg
         whp1XjbbAKXKNFk7H4EEMp+hS/ILkVYAV2Px/uS8WGpf+uPh5IK4ffZO6a52GNcZd4Fw
         VtTvb2KzvyBLE50iY50oVdaGorqGdJMhWWL2OF+axVVPbQmie/6XxlrdeTxsnQAtH0+b
         nMKowAVQolW8bn+qEXgo6PdkHqOmvbPEZ2LQnpEy8CO4mMpnI1ijfy7coBQv4nxjWCrn
         22pvnRIXpNY/VXQYupvCR7JPltgSS7nXE4S9GRy0nYho8PgGepBwLisNZdkLQZUMUDIM
         /v3g==
X-Forwarded-Encrypted: i=1; AKwUvByg0+zboAP9Zk8IKemp6FOIr8xvOY6VCE5Xblljlo75kUoIIrCBoh7wa2GW9ie5PUn58p/F/oIXmhkRCw==@lists.linux.dev
X-Gm-Message-State: AFq9FYIOeq/CjausM1Sjcfzu9uJ1K9aSc0VQOvYSqbMWVKsfCht+oymy
	dadej0/+DbDXTr0N+39Twcj/+HFfysiGrGBNY2+8hFu8fo65lQPTY3USKJd4TsUNfK20qIKWgAE
	8I+EXC0TVr2vZPJC6yFyL54lUXTEnSbH+GAUwKW4rTW52RNnPlUxmT5Mm/Aj693gY8A==
X-Gm-Gg: AYBFou0nDFOT83k7Vs3ZF/eeUtWtq2ht5XcjBrDDiTrqMzTGWyOyhpWRUqcu44JY4aA
	P95J2lmlEwTbWsptM4TZjlD813Qn5uRjneaxL5xFgf7lfAoC5QrF1e2CtNS3EFyjXNnuIlVoLzm
	LqjGlVjMuaPw3DxLYkTBhniRTA868H4UZWZfsDN9uD4AnStb5iC5rZTqsjEr0tQNnIq7SeH79Nf
	l5o8mPp5jnQPo1/tSaNSswZwXQT1JM3iA2EAmHg0Jpoub00bPbiO/G4KHfXuAPA5oDsDR6wPOYy
	8aBipsLQhXxaPZt7y6jnVScOh9G/i6T1F8G5zpLvLmk9PaXATe3ZzpgNx2/FuZlNjxZWO031pM+
	UalhRJ4oLW9YG7caqRRsjhA==
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2381552285a.2.1791888853278;
        Tue, 13 Oct 2026 03:54:13 -0700 (PDT)
X-Received: by 2002:a05:620a:3186:b0:939:8bc:8826 with SMTP id af79cd13be357-93ebd10c0e2mr2381548385a.2.1791888852789;
        Tue, 13 Oct 2026 03:54:12 -0700 (PDT)
Received: from [192.168.226.26] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c31a9a3ab4esm570186466b.29.2026.10.13.03.54.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 13 Oct 2026 03:54:11 -0700 (PDT)
Message-ID: <21f0c2f7-48a5-466b-9dd3-170a04e3af9c@oss.qualcomm.com>
Date: Tue, 13 Oct 2026 12:54:06 +0200
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH DNM v3 8/8] arm64: dts: qcom: kaanapali: Add MPAM MSC
 nodes for the L2 caches
To: Yin Li <yin.li@oss.qualcomm.com>, Ben Horgan <ben.horgan@arm.com>,
        Rob Herring <robh@kernel.org>
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
 <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <f17e31ca-817c-4607-a680-55ceb12169dc@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: v2SPTZRZfJt0Md4zfIuYVkEk-QtuQEta
X-Authority-Analysis: v=2.4 cv=JJuuIMKb c=1 sm=1 tr=0 ts=6ace0dd5 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22
 a=EUspDBNiAAAA:8 a=KDyaIH4IrjeDIlzbfNgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX242PuLCgVdzA
 eGc/EI4cZO1ml+eRxiIO2V1GhXYi6XT3lcZcf7eJS1qaz+P5IBpvAsOtkPepiVtOCt8gPfssO6M
 0FD9fexqMJvx3d9sjVCvzXBWsOGlqtA=
X-Proofpoint-ORIG-GUID: v2SPTZRZfJt0Md4zfIuYVkEk-QtuQEta
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDEzMDA0MyBTYWx0ZWRfX1f/EPFTRWG26
 a3TCAfliddth5s78iTsSuptJvL/LNqZFh4/+L+uyLNrwML6xvOICU9bwNmrxkaBluM9y3epF36H
 2WZoTfkEmorHde5D/x2FGOnG7IUJcdEp43BOUDuVamNNECa+cyEnJB779rTkX4ICJmHj1cwss8i
 hqSRpKz5mZlvOmH/unXblbzFwH4ivxLh5YOXompRhfB5iWEbnL5Jvv40h+tyDX/mU4bWRlaLo/R
 al/8G9Wz9z5lqTJ0LYp6bf96BHTCrtqyq8KTBXcPPVBtiLKqwA8hdJSJRRy4ooRrxPp2XyhuQYE
 FviazEGqCH4YHRp5SPri2GJQGPPTZIGqQ3WWwFMxKYohufcUHlGJdQ3pYo5aIusjjS9BEKXNvh6
 kmzYN0ubmze2pLUAL28uZraJzOZSbPZ+QgXnDlbOlsL+SjMjAbX58zM2eVY5jCmFp666Xr9TtVW
 gd4XA5UatEw1QYfSEow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-13_01,2026-10-09_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 phishscore=0 priorityscore=1501 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610080000
 definitions=main-2610130043

On 10/13/26 12:13 PM, Yin Li wrote:
> 
> 
> On 10/12/2026 7:27 PM, Ben Horgan wrote:
>> Hi Yin,
>>
>> On 12/10/2026 11:48, Yin Li wrote:
>>>
>>>
>>> On 10/9/2026 5:00 AM, Rob Herring wrote:
>>>> On Thu, Oct 08, 2026 at 02:41:17PM +0800, Yin Li wrote:
>>>>> Add an MPAM MSC device node for each L2 cache. Each MSC is nested
>>>>> directly under its L2 cache node so that the cache node is the MSC's
>>>>> parent device and its CPU affinity is derived from that cache.
>>>>>
>>>>> The L2 cache nodes are placed directly under the root node. The root is
>>>>> the root of the physical address space, so each cache node only needs an
>>>>> identity 'ranges' property for its nested MSC's 'reg' to be resolved to
>>>>> a physical address. The two caches use distinct node names (l2-cache-0
>>>>> and l2-cache-1) since a cache node has no MMIO unit-address of its own.
>>>>>
>>>>> The nodes are disabled by default. Production firmware does not expose
>>>>> MSC register access to the OS, so these nodes can only be enabled on a
>>>>> local test setup where firmware permits direct MMIO access to the MSCs.
>>>>> This DTS is therefore only an example for other platform DT authors and
>>>>> is not intended to be merged.
>>>>>
>>>>> Co-developed-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Huang Yiwei <huang.yiwei@oss.qualcomm.com>
>>>>> Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
>>>>> ---
>>>>>    arch/arm64/boot/dts/qcom/kaanapali.dtsi | 50 +++++++++++++++++++++++++--------
>>>>>    1 file changed, 38 insertions(+), 12 deletions(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/kaanapali.dtsi b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> index 131fd2a16c54..b1dcb1e9c570 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/kaanapali.dtsi
>>
>> [...]
>>
>>>
>>>>> +
>>>>> +        msc@19870000 {
>>>>> +            compatible = "arm,mpam-msc";
>>>>> +            reg = <0x0 0x19870000 0x0 0x10000>;
>>>>
>>>> The MPAM register length is 0x321C.
>>>>
>>>
>>> You are right, the MPAM register space is 0x321c per the specification.
>>> Will update accordingly.

In Qualcomm DTs we tend to use the ""how much register space is allocated
for this block"" rather than ""what the last used register ends"" approach
to avoid holes

Konrad
