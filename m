Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.158.5
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080355;
	b=QqNdgWKyYV/SiZXTZdUuV3BOjiWSz8E8GJxcIk2OPBoEn/Cy+PBtyLDmpOqOwOBsDhNf
	 yLauCb3rp5ml9yNvNzGG87uY+Y9f1UjG2Uf6ctNF5lb2peYF6n5pxx1zdRR5Zam1gsP9G
	 IXcDRZbUjbASfyGDdBt+F4e3uMkzcytDT+O9X7oDSO4lJTrW6uWv5H9Ffjhi7w+4sBuY6
	 e5r5SupMqbrWMTLKnEmsgpDZOCoyDubdKOv/silcZJivo/uFrpB0WKco0vMLnNbYOjW7a
	 yhS5wMt2cc4kFFwKBa1PJZDxebTuIkAoiDex2uRBfD6vb6YaQM6SmT/iUxaeRo1syxA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080355;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 Received:Received:Received:Received:Message-ID:Date:MIME-Version:
	 User-Agent:Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding:X-TM-AS-GCONF:
	 X-Proofpoint-Reinject:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=eLM72vYqyD1kaGrGOgIxvrHBh9itnaRU6l4uYJBh0A8=;
	b=BkMkeRVyyppjmwBVQciApxCZcJy9YpmF7331UtqZCODf53caHI3/nrPVE6bri4Zkwczl
	 weJc/1e+egYsnA0sW9gjfFlxUYAHVTc/0gVVexFliZMRWfsXNTZWyusdParBuV4S0z6d2
	 TN5ECeT6lJrbib3uaarYt32TFbohEPt3MCbe49c1zIC+RgOWMCeHhYYBt4BF0M58Ijsj9
	 7gYcMaw4RMOE4M3mWiw5vrc0pTi3+biu7sI5A/g4aH2a85svg+ym4LL8RVZ2nOECN+x4Z
	 yVjpdotLRO48qA5W2cvTXsW+e3A4oRlbDKTYOItp8QFL3rr1h7l/BT57/Xc4WCOt8qQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.ibm.com;
	spf=pass smtp.mailfrom=linux.ibm.com;
	dkim=pass header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FjtrFbbl;
	arc=none smtp.remote-ip=148.163.158.5
Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A581606A320
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 09:25:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A581606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.a=rsa-sha256 header.s=pp1 header.b=FjtrFbbl
Received: from pps.filterd (m0356516.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ6v8aF3424182;
	Thu, 19 Nov 2026 09:25:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=pp1; bh=eLM72v
	YqyD1kaGrGOgIxvrHBh9itnaRU6l4uYJBh0A8=; b=FjtrFbblf/rEgMNc3gQvKc
	aK4FTLqkP4bdTMtJpkxecrNA986ImwBjvz0xvzgWi0KE+6hth97c3BGvmPNyYJBu
	ZJQS0IGlK/gd8wooF/UiRP1DDbp9oCtxFDKLWxzf1k3G08NDlo49bNIkdrkjC40X
	nynAlK7dtyCHbJ5eN0sdcLPjCqysDfhbl/BmvUHSvOtLsx7Zr+vErSb9gUqszUW9
	XetM8/AGtdb/XeQ5jSZ3ldSdvtpI2q/3FJgIyslPXql4hfeW74fdLGUdgGDFE12i
	9NQtcLvr/NWDwac5Go+ATtn0Lb5bzreS7KyUv5D850JsTusKDaXuaBD/PdCDgIpA
	==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4j105wyqdj-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:25:43 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.11/8.18.1.11) with ESMTP id 6AJ74uvD472251;
	Thu, 19 Nov 2026 09:25:42 GMT
Received: from smtprelay01.fra02v.mail.ibm.com ([9.218.2.227])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4j1hd6ue3k-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Nov 2026 09:25:42 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (smtpav02.fra02v.mail.ibm.com [10.20.54.101])
	by smtprelay01.fra02v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 6AJ9PcOc44499228
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 19 Nov 2026 09:25:38 GMT
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 75F242004F;
	Thu, 19 Nov 2026 09:25:38 +0000 (GMT)
Received: from smtpav02.fra02v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 49D3420040;
	Thu, 19 Nov 2026 09:25:35 +0000 (GMT)
Received: from [9.124.217.219] (unknown [9.124.217.219])
	by smtpav02.fra02v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 19 Nov 2026 09:25:34 +0000 (GMT)
Message-ID: <e4d2749c-5536-4fae-8835-7a9fd668d716@linux.ibm.com>
Date: Thu, 19 Nov 2026 14:55:34 +0530
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
Subject: Re: [PATCH 4/5] powerpc/cacheinfo: Move to generic cacheinfo
To: Srikar Dronamraju <srikar@linux.ibm.com>
Cc: linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, christophe.leroy@csgroup.eu,
        maddy@linux.ibm.com, gregkh@linuxfoundation.org, rafael@kernel.org,
        dakr@kernel.org, johan@kernel.org, sudeep.holla@kernel.org,
        ritesh.list@gmail.com, tim.c.chen@linux.intel.com, yu.c.chen@intel.com
References: <20261118163639.890546-1-sshegde@linux.ibm.com>
 <20261118163639.890546-5-sshegde@linux.ibm.com>
 <av6yL-zYc6-EZN9S@linux.ibm.com>
Content-Language: en-US
From: Shrikanth Hegde <sshegde@linux.ibm.com>
In-Reply-To: <av6yL-zYc6-EZN9S@linux.ibm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-TM-AS-GCONF: 00
X-Proofpoint-Reinject: loops=2 maxloops=12
X-Proofpoint-ORIG-GUID: JvoRShoDHYjxq_nNK-VnvEr7YZDE9Naa
X-Proofpoint-GUID: ybLaPLmG3ATBv38iC8FoydfQ316ND2ZD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX8aBUusD3OUhZ
 LubX82LIa99Ms+0oaZ6G1w3UMtUhH08jvchOUGZQOGT4zH/a9WJWu8G1YbqchizYpZjlJ0gOU5n
 hpgSjPyH6nJPmPVNLujuMvvkrOySk90xUTKhn/Fm9sh2fql51P2I3oAL9U4WeIIOkFUnR97PLy9
 I+7LYliTkUHjMtJZf3GWmkYjkdSIz6N1Rz5dxm/iUo3WN6palhl2NDh9kLHWgMu4iifo2Rwh1ik
 rdGBaK6ruSBleItDS9Nk5U+PEqLb5pQ94RkZDigK9tQGUwksOTzKRq16z93V6Aze7tge4LTVkBk
 JROx4IZKOpbvCM/T8LaakbXG2Xt1jvFP3+dIes8fWn68ZIyJ1Qws9uulmbjdcyiv+2BeagUFyyx
 psaMupPE5B8kUM04uJgGe/LQKc3k7UIbYBh3VgQmtk221MBZOu+Mb1kr8IOzRk4yGhd86RrXBbW
 bW/vDmHErrx1lGpBjEg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTE5MDAzNyBTYWx0ZWRfX5HtCRV+NcPCT
 hgJAw+LP5paoavZ5X1dPvNITuD9ObdNgXFiJoAa3dk3gZwasxsnQtyOjC9aU/iwUn1jARQcu8Vp
 4x/Fbd8psInzEXlEZfn69tVAShchX/M=
X-Authority-Analysis: v=2.4 cv=K+m3jCWI c=1 sm=1 tr=0 ts=6afec097 cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=RnoormkPH1_aCDwRdu11:22 a=Y2IxJ9c9Rs8Kov3niI8_:22 a=VnNF1IyMAAAA:8
 a=aEx5hHzjxLuYTKEkMb4A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-19_02,2026-11-16_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 clxscore=1015 adultscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 phishscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611190037



On 11/19/26 1:54 PM, Srikar Dronamraju wrote:
> * Shrikanth Hegde <sshegde@linux.ibm.com> [2026-11-18 22:06:38]:
> 
>> PowerPC maintains an architecture-specific implementation of the CPU
>> cache sysfs interface. Replace it with the generic cacheinfo
>> infrastructure.
>>
>> On a dedicated Power11 LPAR, the generic implementation preserves the
>> existing L1 data, L1 instruction, L2 and L3 sizes, associativity, set
>> counts and shared CPU maps. The two SMT4 groups continue to appear as
>> separate cache instances.
>>
>> [Both draft changelog and code are written by LLM]
>> Assisted-by: LLM
>> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
>> ---
>> -
>> -static void do_subsidiary_caches_debugcheck(struct cache *cache)
>> +int cacheinfo_get_arch_id(unsigned int cpu, unsigned int level,
>> +			  unsigned int *id)
>>   {
>> -	WARN_ONCE(cache->level != 1,
>> -		  "instantiating cache chain from L%d %s cache for "
>> -		  "%pOFP instead of an L1\n", cache->level,
>> -		  cache_type_string(cache), cache->ofnode);
>> -	WARN_ONCE(!of_node_is_type(cache->ofnode, "cpu"),
>> -		  "instantiating cache chain from node %pOFP of type '%s' "
>> -		  "instead of a cpu node\n", cache->ofnode,
>> -		  of_node_get_device_type(cache->ofnode));
>> -}
>> +	const struct cpumask *mask = NULL;
>>   
>> -/*
>> - * If sub-groups of threads in a core containing @cpu_id share the
>> - * L@level-cache (information obtained via "ibm,thread-groups"
>> - * device-tree property), then we identify the group by the first
>> - * thread-sibling in the group. We define this to be the group-id.
>> - *
>> - * In the absence of any thread-group information for L@level-cache,
>> - * this function returns -1.
>> - */
>> -static int get_group_id(unsigned int cpu_id, int level)
>> -{
>>   	if (has_big_cores && level == 1)
>> -		return cpumask_first(per_cpu(thread_group_l1_cache_map,
>> -					     cpu_id));
>> +		mask = per_cpu(thread_group_l1_cache_map, cpu);
>>   	else if (thread_group_shares_l2 && level == 2)
>> -		return cpumask_first(per_cpu(thread_group_l2_cache_map,
>> -					     cpu_id));
>> +		mask = per_cpu(thread_group_l2_cache_map, cpu);
>>   	else if (thread_group_shares_l3 && level == 3)
>> -		return cpumask_first(per_cpu(thread_group_l3_cache_map,
>> -					     cpu_id));
>> -	return -1;
>> -}
>> -
>> -static void do_subsidiary_caches(struct cache *cache, unsigned int cpu_id)
>> -{
>> -	struct device_node *subcache_node;
>> -	int level = cache->level;
>> +		mask = per_cpu(thread_group_l3_cache_map, cpu);
>>   
>> -	do_subsidiary_caches_debugcheck(cache);
>> +	if (!mask || cpumask_empty(mask))
>> +		return -ENOENT;
> 
> So if we are here, then we are saying, the generic way of figuring out the
> cache-id should work. Guess, we should come here for P7/P8 systems.
> Have we tried with a P8 system to see if things work as expected?
> 

No. I will try to do.

As said in the cover-letter, I have verified on Dedicated LPAR/Shared LPAR on P11.
