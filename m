Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794399179;
	b=jQjc+WbO9neNvPSGZNaMkTdAUebugUR1I0l/AOK4h78kQiqSWXujnO+RAmoAYsPwESNy
	 sdr82cwmzZ06gYa9tq2R5wJEi3j+iUB7Y5jj9+geARPu8Cty9zNhe8KJcIVZj9gjlc7mk
	 jeS8KtqEqIvNMEiW1pI6kX81Y2S1WBFaTYuoJsFyNvNZB5iJuUnt2k6Dps2LvaU0c5KkX
	 BzwBDHmPRjPJM5Rytm0lDK+KF3LuxwsiL1ZJaxhmQ8R2vIAycHdV1V9WZwVcicfblZxTr
	 DsewQhHdc3WibSZG0wtT8SyYRRb4fxtIOCmIGX8Xqy3J+wov+E8bqEso/gRnzfJ9p1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794399179;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=dvghIzBw0O5GdRnMjzzOWphS3vZYatvIGIcTOmd8Jr8=;
	b=gYnAWRxNGusVs72R9XgADyh+KbTJyIYpMLjHMf8YP7o0G5wLu6wlrD84at6hJePspEZJ
	 iX6EeHSlIPg20YZLBfyllBVfr0coWT4DKi5yjlzdHh+H7Rj8/fLQLmIpYeK7v8Pufom/Z
	 HHSLSY3EdOsZMgzY8iOzj1ezsFTtjRo3cZLTKsCB+VKWGmJS/+6r96TtgM02+npcXXyPO
	 l9aTfG/td5Y0APdNFBtsQ2+moVmXBlSc+F3lSqO1N3PSWntf0dl5xYUBpDBipY4OvfH+y
	 +FY6Tf6s9hW3jJ9TXxwz0exmJcTdFyx14Ni49p1ZnoquG2xALVJM5ajubCQh8ngsZeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSli6rNd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fSzaEV9C;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 328C2606A334
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:12:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 328C2606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=LSli6rNd;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=fSzaEV9C
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABAp7KK1052697
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:12:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=dvghIzBw0O5GdRnMjzzOWphS
	3vZYatvIGIcTOmd8Jr8=; b=LSli6rNdgYS+dfKIOBHsyxhzbGY+sRAh53KFkuk0
	JVfWLVwQqupLGo0cDdvm2AeZ6eM/ktyhvJn2t5YuwxqKomWVaRskgqGFrN85U9+9
	mkqmejtkPkXQ+3adl4I/wtu5G3/t3qzOiHC3uRmi2GsumY3PJZ3sgYVGh7pk+GJm
	1svk4JL1JEWCJ+V7e0tKPZ3+k9YeQhhZlBrYbXTn6Q2F5XthaNBxgT46ZnYmBxV5
	6mNAdvHb1o2jdmpZmhPr/5SPaWPnYc+G5lmDi9r5lko2Seg6V7Oq+LNbSKMN55dC
	hnGdEcBGSQzbIVeYkTO8qHkVNZaX1qKXLKObZV6kDgMkOA==
Received: from mail-dl1-f72.google.com (mail-dl1-f72.google.com [74.125.82.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdrh2hcp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:12:58 +0000 (GMT)
Received: by mail-dl1-f72.google.com with SMTP id a92af1059eb24-16bc6f3fdb1so2526633c88.0
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 04:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794399177; x=1795003977; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dvghIzBw0O5GdRnMjzzOWphS3vZYatvIGIcTOmd8Jr8=;
        b=fSzaEV9C20Fmt8gIsWIh0+WuZqdGUUkzci20TVPsIEIp4lbz46erCPav1n3gDHYVyz
         0KakDPzvvMZU6ptAa7HvbqK4v5dWdH6c0b+CNqlqJcM6U5qCrqChOkE7ymiPf3WL49hj
         6Nwpvgty7xhs8J3VipPtkSgGWtCeUvTTD4OkyRzNscWBQcKt6pps0UQwY/JpYWeAULs2
         MhtgGkHVYFTwZW2WyqBjStdGtV8bN2cIfLVQ4F/zwECjII1m3hIodiSPerss3ZDM8r6O
         HsCZULr+eJJqfkj96mcThkMYN55pgpW7WRSWNCCbD8mSCxfuHFlRIfn4aUK1tUMg9mD2
         Dmaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794399177; x=1795003977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dvghIzBw0O5GdRnMjzzOWphS3vZYatvIGIcTOmd8Jr8=;
        b=OhE9fau7Q5hE1VJ+0QrjAF0G3PTNPnXHzgUGdXiSJx5jzPbd39akSg9oCYrSkKUZJf
         JOGF/gM7aWjIp9N9/4rqfBvxIM4fGu4fWX6qbpmJVToSf0q38PvbjVwgUu9Ju0mgM6Wu
         gzJq+MhJGnipvB2gM8rdwwDkLG0FsM4aUK/62CxcFN4ZGIz2D7oxC5lRvQCY8wlPqh0Y
         XUbh5JWPVqcIE/1eJdx62jruUd8wNmZMynjCtyLe9H1TYnoiWlmUhj74S2ziY4h46okT
         TWO45myhlVTk0u7tSkh0GGLUoEXVy5XSZEuTvALAvUzjpPyUzeHjw1HtNDXVokIwl+Kj
         vCew==
X-Forwarded-Encrypted: i=1; AL+hErE07r7BNTOTDK3BQXnY9t0GN1FRgaaH2bRVL2wPTdzoOx53OgUNHjXWEEbKFUMGe21AX3akMHc+EagjqA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8on4pll/rKodsnj2O2hLZODt9CrCd6FyPXIwjGYwFjxCcxuFyR
	TzgJ/PONIhRHlvCcbqTVg1YGF5qBXCzvUZiLNa1LWJpvc0UgzHMke+kvSSG9A+3qIh2aGzg6Opw
	pSptzw3VwiSYzAASOT96lu8m+E/+qf0mLLCtGejs2EM9jwyVkRGBibIy5NpWgJEAZcQ==
X-Gm-Gg: AYBFou2+kupz0nfTJMfhOLo/5xpjGgWRcKAr2L+g8ztSlEsW+hrGmVjV0e4tXI1Q5Cy
	4VNM+gC0QlIpdNplg339dQ5CVhTsncCxZhf/TE23I7jcbzdL5yhE5zocAXBZTtt5jbjjm+GJW62
	BQz9d6mEctoQ1jbiOxIf3pHSVJ5P+x36sZQtdLwADm5RsBtL9+5+81UdldhpvsCCHGL43/7N2Ne
	gJbK+X9vP6jo/v6YtcfvdGoApb1cFwRUsKqN00InHOj3/vvYfOLWyULlVH50MAatCIeai50X+Ku
	u2ELapBDSUlEfs7gg9rn8KUrPK64tuz30i8649nVR158n4yZig4/ReSF4vl/7OYBuS7vf0i3OH+
	3YPH7EZ2lhujvMfSbJkH8uyJ3KmK1JL/BgBwZbaczH0a7DS190N5hwURr4+U7VZfuuYAYaeq6ST
	I2NMxeW7PpBybVUtcC5fKQ/u6aaZFIk+l9dQeTkBmpXqw9o8JnR0B3SXBhV+TZ9q5m
X-Received: by 2002:a05:7022:1706:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b3c03117e3mr1632726c88.24.1794399176895;
        Wed, 11 Nov 2026 04:12:56 -0800 (PST)
X-Received: by 2002:a05:7022:1706:b0:1b2:43ac:d3a3 with SMTP id a92af1059eb24-1b3c03117e3mr1632703c88.24.1794399176111;
        Wed, 11 Nov 2026 04:12:56 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b3b5b2eeffsm15887599c88.9.2026.11.11.04.12.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:12:55 -0800 (PST)
Date: Wed, 11 Nov 2026 17:42:49 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
        Sudeep Holla <sudeep.holla@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Jie Zhan <zhanjie9@hisilicon.com>,
        Pierre Gondois <pierre.gondois@arm.com>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 1/2] arch_topology: seed capacity_freq_ref with
 highest available frequency
Message-ID: <avRbwew20G2fd0Eo@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-1-68de169498c7@oss.qualcomm.com>
 <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
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
In-Reply-To: <fbd7fe35-5e14-4589-a072-909e49a92e76@oss.qualcomm.com>
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfXydcXxTtgDglb
 8eahZ1sNSbXXzfZXrhpKZVT9VjCgZp1nig8ML/ElNJ2IIMQbvMC6WPX9T8sjtNvxmrSwR6WaVSD
 CO2jypiRVmTnS+6MBFAIXYQMOW4Yi9s=
X-Authority-Analysis: v=2.4 cv=PoQG/AM3 c=1 sm=1 tr=0 ts=6af45bca cx=c_pps
 a=bS7HVuBVfinNPG3f6cIo3Q==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=VdZ5ZUKuIB4TndN85GoA:9 a=CjuIK1q_8ugA:10 a=vBUdepa8ALXHeOFLBtFW:22
X-Proofpoint-GUID: PjzM9l8wTmQK3YodX2iJ9kq-aWNT9C09
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OCBTYWx0ZWRfX4dWYd+/BFa5C
 sWsvMG8uXZin0yhdIlY4OR7y3X7Lk216ld6JZojbd5kssZ9fapjSHV1ve05a7Subxw2CLYf0DWw
 J11oi7wcZQuJhbgdc9P2mNYYjohG1kOLJK+d2azubNynyrB+vtl1NdX6rHF3dGR14K5mDmo7tbA
 9XpK/udB5DINuGoV37/ojJfO3h530tCxYhiQXwRefoDRhIHdd+MnKmAZFSOSJzmR2S4W9C4rSwP
 Bq0CtW4qQE1+8d8lYkv0h+QcfsOjjUlJ5XkUDrsWvKHB0ilE+HQjsYr3hCRnnRoj31rKSN2LIVo
 reusbV+Ap7P7KjEWU+hLQ9ry0K3x9/mD+oj6DWauJRgdvqSEytEWzSe6Jmg5arS2+nVn2qjCivk
 pjH0D/wSKugnVvbhn0y7/n6G1iMYYda5NmBZQVsHxYx4JYGf8IKr7Lz6g0nFZGVGC0lTuwq6BLL
 6r8P4RsmcJhUvZl9j9Q==
X-Proofpoint-ORIG-GUID: PjzM9l8wTmQK3YodX2iJ9kq-aWNT9C09
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110048

Hi Zhongqiu,

On Sun, Oct 11, 2026 at 10:16:37PM +0800, Zhongqiu Han wrote:
> The current implementation looks correct and works well. That said, we
> might be able to optimize it with a simpler implementation as shown
> below:
> 
> +/**
> + * cpufreq_frequency_table_max - Get the highest frequency in a policy's
> table
> + * @policy: the &struct cpufreq_policy to inspect
> + *
> + * Boost entries (%CPUFREQ_BOOST_FREQ) are taken into account regardless of
> + * whether or not boost is currently enabled.
> + *
> + * Return: the highest valid frequency in @policy->freq_table, or 0 if
> there
> + * is no frequency table.
> + */
> +static inline unsigned int
> +cpufreq_frequency_table_max(const struct cpufreq_policy *policy)
> +{
> +	struct cpufreq_frequency_table *pos;
> +	unsigned int max_freq = 0;
> +
> +	if (!policy->freq_table)
> +		return 0;
> +
> +	cpufreq_for_each_valid_entry(pos, policy->freq_table)
> +		max_freq = max(max_freq, pos->frequency);
> +
> +	return max_freq;
> +}
> +
> 
> 
> >   static inline int cpufreq_table_count_valid_entries(const struct cpufreq_policy *policy)
> >   {
> >   	struct cpufreq_frequency_table *pos;

ack, I will try to further simply this with taking in your suggestions, thanks.

> Thx and BRs,
> Zhongqiu Han


Best,
Ananthu
