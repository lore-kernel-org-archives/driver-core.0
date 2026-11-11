Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400868;
	b=TOovuUU0IgzzydTOjwtKJTtr+GDluB7Nq8jLYaSTB2Os12VSBijR43Ro5IBsv4UaIbXg
	 +Vbv8qsHMiDuDtGyH9HeffwflrflLJuyhw18Z8fBeJ5MSnKOhNqXr+SjNVHJ4E4D+lOh2
	 KA2Z18IK8smgNZPZvVrnWsImWgzLNs/X3+DkemMhjgXL+f5QiboWPQAlZu9nSA5ORw8GF
	 5ZPBfYcHNlIHjkSuskf0LmaE9MtlLGOfM6aBgKJDc7+jCrpyRnwvroq3k22z+xy95x1WF
	 ngdFcfx8RG7Cad0+b8HZOlIhv7Nk5vz7naWrt7scxDC+WqmH+uwU46S0cRGbO5o4x8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400868;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=oH38Jafz0ZaNJOgaWYZ1k8w8ZBYMYy4KFfN8ngQnhnQ=;
	b=HVtDRUeW6My33Xxb77MhRY0DI2l+mIU2smeFyeiyvb1KVUmyWbgGHzQKdZzePobZcp9o
	 FyyCdRpXs7o7EODLdo/X6VaQ+r3VSBgqM4FmaXZC6j/sJoXIAmLkBZvBt76to0u1nGeBL
	 gZUOUyUB42xCU4UMoSxFF4h/oE3ElZDmq1G2YWCeVTLqruv7xXwICfSQNgUvQQvoeNV7t
	 /n1AWdSX38OeeyXPmU3HJrxr7JCxLHurQs/9Zu0mZ6xFRY4qSWvbLqO2Zp/PT+2VwFYbq
	 Bkpi2wNuuU8oM6fcSCb1JbEUUpdylPXX79YPhRhMlelRtkf+KoNPTjP7oTcxazO6bVQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="J/eBWQFz";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmM9na+f;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9F0606A321
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:41:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A9F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=J/eBWQFz;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=TmM9na+f
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCZ27A1806843
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:41:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=oH38Jafz0ZaNJOgaWYZ1k8w8
	ZBYMYy4KFfN8ngQnhnQ=; b=J/eBWQFzvFkzMIXvLOyiH+n5pKlRYQFLvIr3gmXw
	6BoYv7eiT9pOnEQIWPLp9WUkHUzMI4+MDjSpL74YNhzWS91ICDyF0VAj8AYFtXWs
	KXbXbIhjlilam5m7aEjXiWyvND5I7Tq6OebfGSN+rR65GO8sMv7F0YqMSAm6+SVk
	FED2pl9fMU83eO3/GLB4seQjhNqMLXwIp5wuwa9PaF3tNxfFPJIkmLq+Vbt8Skdi
	sBT7Y0b/Aj9Tgp3Py8XJErGa/LHLHTwYztJAWeWE39/UbP5xp8vt5DdOOW8EISDQ
	0cxOAu8204JiPWGScUgrqFa7wxiScykBrgRxS4TR9zszew==
Received: from mail-dl1-f70.google.com (mail-dl1-f70.google.com [74.125.82.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvfawj56w-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:41:06 +0000 (GMT)
Received: by mail-dl1-f70.google.com with SMTP id a92af1059eb24-1b3ae327c55so564322c88.0
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 04:41:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400866; x=1795005666; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=oH38Jafz0ZaNJOgaWYZ1k8w8ZBYMYy4KFfN8ngQnhnQ=;
        b=TmM9na+f8X6SXlU+gFJUgE8sDzDgVXmQmMdQryTHTxTtBBBpTOZVAQZyUPWP4oT2VF
         N3WvXDBIDcp6NznFxVkLoR/GGGh73XgrbHYEJ3uD0UIRpL+d14F7mzLCbk4QJbb0CNks
         pdZCZXKl4q311J4WRvV/A8D5NPPIyd+f1ojIqGzmsVp07BaWctpf5TRY8FdCfu4l296Y
         yoLPlDLxAkjx2DsAbs9Ap6Q5YNDYA8x2FHwF7HqyfSQNceeqnOq9UkcaBBU/GmoaOOgY
         d7DL4+wwS6ZQ4fUEcSzM4HF5a2MO4j0BMEchp9Ke/ooZ+Tn51GhzJNt32nTuMLSa+k0D
         1o/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400866; x=1795005666;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oH38Jafz0ZaNJOgaWYZ1k8w8ZBYMYy4KFfN8ngQnhnQ=;
        b=G02GPZzImWf6z+wCIK+dOcIwixrgUPt8jr0PsZAgVLb6QiGeWfQiudSJSWJKAhQBgO
         UnGYNyM35n/fkZWWcVIaG41ar04EY33JJtMPHZXACZJ0wuovXmTQD+lMbkXaCq7DAhax
         e5eDABPh/9vrkGC4zl4a6PYvIXPnFf4Yo79lnsL3nFL0R1gynGxoiweKhm4MXUctp5Vz
         h1LSO1TAsPRqZKacKctPEczDh/zxaU0dxQrRIsr+e/j4lgcBJpoWkWpByxAhsyZ5MQu6
         fl0o8RY/43Ir+82ld4zgxLAgsLHaiOzWCFf3KedhpFxiZ+oWxuRnpW90a+R5FpqBKxti
         e5fg==
X-Forwarded-Encrypted: i=1; AL+hErGNFsPHzVbpcOg1jkc9tUycMhkHPxmQtAwolcwn1BJD5FoeoslMWivYv4mbdxnnghwzeX7mJTnx/6kpOw==@lists.linux.dev
X-Gm-Message-State: APuU4Z86/Glqw6RHpjxaQejHLdfYqe10tFlykBNM4YMwwkRXjM1ASS7P
	vEwdohz73a9IHkp8AEZbCWo2ExHIxPp/nzSNcMBDn7vbk1Ivr6BpZD5xQmH9P4QdZ8xcnpRmd0o
	eQ3Y/LolhTn6vk14XBoV9pcbw2iqcB2Tb1Fa2eEXTWi8ma712HesqjkjdCPzoUnjn+A==
X-Gm-Gg: AYBFou0KCQaAO0WZCAManTUA4i+7s/f4jfN+MZKVUV3UewJSBFANSd++027eyhcgIlx
	5+Z5fvu4yMwNvSGvxzQeKdfPlnl67UDnL0XjFsOrFptU7ZX1kXisqRlwnVeelJepM/r80HFqbxM
	957DxE8uPXQKVDHs89V86pf/KN29TkScTIAgSfsw67ywNLruFfymoOvlUXWPnMgOYRfE8/EFjNs
	0gq+SVIxh9TFSsgOwz2DPiGfA0Byz/j9EfWRwIEdCGikz4uvrkQQR3E0Z6/3SrJyVu1mUOX+oFN
	oBXBUo1jmDCJmK6kXjTBghP9zDeONgNHGWhu2jsxLY/1OD2ZNc+kEpW3xS809I6PWHKPpAwMbvs
	qQ27+zXELklmc9cy5DjyqVFwpEcwqsPZ1rmD6ZVsJdM+7bEoRX+bnXKVo7BMkLTUt/Ri/m860wN
	McrDZE/0CCoVBQqNwz1YJD1XAPfty92SQYg0hsuqUE+tr7SPejwyQTq26IRabuXP59
X-Received: by 2002:a05:701b:42cd:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b3bef25cb9mr3045481c88.12.1794400865303;
        Wed, 11 Nov 2026 04:41:05 -0800 (PST)
X-Received: by 2002:a05:701b:42cd:10b0:1b2:de00:9bc2 with SMTP id a92af1059eb24-1b3bef25cb9mr3045449c88.12.1794400864710;
        Wed, 11 Nov 2026 04:41:04 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b56c4e88sm14309487c88.0.2026.11.11.04.41.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:41:04 -0800 (PST)
Date: Wed, 11 Nov 2026 18:10:58 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Viresh Kumar <viresh.kumar@linaro.org>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfXybio0BkX/eVx
 zAq3K6Yh6hmdDNq77ax1MlnrKRNt1pZ8gHpjNiZqzjgtbZ2ca107/LQtDkNnVO/yeCyXbw92BXX
 r4aRz9lyElGBbBuPZiC6Mh9gpRoQ8dM=
X-Proofpoint-ORIG-GUID: q2Qx5UAHfdWB62S-KHL40wzqxanUKCuX
X-Proofpoint-GUID: q2Qx5UAHfdWB62S-KHL40wzqxanUKCuX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA1MCBTYWx0ZWRfX4qvQ6HZxmRvS
 FysfJ1edlXO+qhKXqQB2zv0z0HXxKTX+0wEUQixWZi9qQ3ZUBsY7cLN6JXA0GHkplnsqYZEc3lB
 UdiAwVVQMCdoz/qDC84b5TqffRw7zhum0J2dF7+9FeyI+aV5069HfFfnxqSXySFb0VCsv1SWd9/
 QVHEVzpVL/NJyIp3VWsNlyT/gdo3NlLKArm6ITdj1LxL4nQSz9NIuz3O+gwsp48vXkBCwgKSFX2
 9bZAuf1A4HB7c4D4Wu9HBA+bMsIiuoreN8XCyUW2sOR/z65NCqrHeBjYHJOx2zsBTYYYWz6W8ZD
 +IO7LGSEgnS9zM/CiJpTywlfDCvj75rsxIAdIn+qmxx8wKHbiPIXh9iAPVfppjue7vMGUg9KIcS
 82+R+418MM7aeT3EEq2HApGzKSeF4eX+m+5oWEuotSvt/PcjSvU5d4qREyqGbPOIFBjPDRyvGWB
 6BCXHY+sFjtJhHAIPEg==
X-Authority-Analysis: v=2.4 cv=CZadd7rl c=1 sm=1 tr=0 ts=6af46262 cx=c_pps
 a=SvEPeNj+VMjHSW//kvnxuw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=z0i6psv0inyxDjA-2G0A:9 a=CjuIK1q_8ugA:10 a=Kq8ClHjjuc5pcCNDwlU0:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 suspectscore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 adultscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110050

Hi Viresh,

On Mon, Nov 02, 2026 at 02:08:39PM +0530, Viresh Kumar wrote:
> Hi,
> 
> On 29-09-26, 17:08, Ananthu C V wrote:
> > Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> > max boost is known") introduced a guard for cpuinfo max updates to only
> > increase, to preserve driver-set values above the freq table maximum.
> > Later commit db80ad776cd2 ("cpufreq: Remove driver default policy->min/max
> > init") dropped the 'policy->max = max_freq' assignment from
> > cpufreq_frequency_table_cpuinfo, leaving that one-way-guard to be the only
> > path for cpuinfo max and consequently policy max to be updated, causing
> > both values to be stuck at boost frequency even when boost is disabled.
> > 
> > Unconditionally track the highest non-boost frequency (max_base_freq)
> > in the freq table. If boost frequencies are available, use the highest
> > frequency from the table/max_base_freq instead of cpuinfo->max_freq to
> > control boost values, so the value can decrease again when boost is
> > disabled.
> 
> If this is a fix, it should be submitted separately so we can get this merged
> independently.

After thinking more about this, this should be the way to go about it. This
issue is currently harmless because boost values cannot be actually utilized
and hence the value getting stuck in boost is a no-op. But once the fix to
the initial problem is applied, this will become an actual problem that causes
the active frequency to be stuck at boost. So I guess this will need an
independent fix that comes first in the series.

> > Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max init")
> 
> I am not able to understand the current problem though. I see from the sequence
> of events mentioned in your cover-letter that scaling_max_freq doesn't return
> back, but why ?

cpuinfo.max_freq value is currently updated with a conditional guard, which is:

if (policy->cpuinfo.max_freq < max_freq)

This means the value only goes up, and never comes down.

> And does a simple revert of the above commit (just freq_table.c) fixes it ?

I gave this a try, and the simple answer is yes. The diff would be:

diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
index ea994647abc8..5b364d8da4f9 100644
--- a/drivers/cpufreq/freq_table.c
+++ b/drivers/cpufreq/freq_table.c
@@ -49,15 +49,16 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
                        max_freq = freq;
        }

-       policy->cpuinfo.min_freq = min_freq;
+       policy->min = policy->cpuinfo.min_freq = min_freq;
+       policy->max = max_freq;
        /*
         * If the driver has set its own cpuinfo.max_freq above max_freq, leave
         * it as is.
         */
        if (policy->cpuinfo.max_freq < max_freq)
-               policy->cpuinfo.max_freq = max_freq;
+               policy->max = policy->cpuinfo.max_freq = max_freq;

-       if (min_freq == ~0)
+       if (policy->min == ~0)
                return -EINVAL;
        else
                return 0;

I am pretty sure we can maintain the policy->min status quo and only touch the
policy->max updation; which from a passing glance simply seems inconsequential.
Potential side effects, if any, aside, this would at least fix the issue at
hand, which is the frequency getting stuck on a higher value without being able
to come down. What do you think about this?

Best,
Ananthu
