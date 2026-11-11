Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794400049;
	b=u8P6UmYzEnnz3jHssdT/a2iZWjrDTpkNNtVGR/x5aNaEZWF/nsS3tt+hZeJmGtVYgo+M
	 QpPTHSype0sKUaXz7Xwy6TtFxdIMbwWbnuuMT+IZpPHNSa6m1OIp7Ty7Fu+SJMRmdoAEV
	 +j3xce2+45gITb9VHUsPcg62EC8aJduWVIleMQAuAGx/ezwntHJ7TEFMGWl3yJyVU816w
	 c9GN4XoCL7nfyjw08kRpzOnecn4JdNSRYffctzsq6ppyxreyE8EF6OF5IqoHeMTEfwYod
	 zATUujH+y7BMqPPqTEozRO/EohNymhAlygqM0m5sImcxVZ4qGgeNJe1IORqvDb4aTWQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794400049;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=svc0vgDYFwBl6hVKJjHTfBuPN1VEmv+TcUmZfTB8SLw=;
	b=Sco4NH155XGSL1q36CH7g6C/HH2Vd/aXx0gqCF/HMvth+z8VTEsijsTQcN1hcJxzliN0
	 YRhO3YuAhBJhsZyVv02IoJ//WqsLJpjWQjm7kJ7cYALf5g7jr9IkSocMEZw0H4z2DY0gR
	 7eHJW2Kh8d+nwrpqn5aalG71gXOF/g7DFECIIajgK60SDTa9xy8viB8goGBuTyXRkCX+g
	 SFQtjGmqQAaV9EhVP5T8qp5PoP/KRoRZlJwMD6ITo+Wc3pi8qQoX6BJOJ2yUXA2M44xxS
	 RY1+7Lh8x4tNA/RsrT6Ha5UaEcHNG1umiCMImByvCAs6iBUfptq1N/MAd2yqaWwHdvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oLJJPizK;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCRChb7u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AC53606A321
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:27:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6AC53606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=oLJJPizK;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=MCRChb7u
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ABCPbIM3270912
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:27:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=svc0vgDYFwBl6hVKJjHTfBuP
	N1VEmv+TcUmZfTB8SLw=; b=oLJJPizKWuoveTH+O48KXBTXUn6nPwdC+PcZb6af
	2MIm/MSSCiV2Z7cQVVFtunwvcEdr6K/hzA20MNrH2YIWYrIWOpLfNOW1faslZqtY
	sPg1xVZG+xjHPpoyJfG3/XkoPaKP2vhMXLY1VJyYB2aOlpKqCN/oC3c9+6J24r7K
	c4QTWMLg9jEHmRw14dAxUj0iawoTcFsrkHcd5FBApgLe8BeKs/mHzKfDpuWNJ299
	+cfCvBgXLMArH0BywroWC00xK7ybV4NkZZZ8ZrFOX0OSF+w5tSJv9wJ+p1ZZUs+l
	D4mYtrUIbLH8O593Nv+wEjGGvb+4bHuawmH6RRFZCJo3UQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvdnp2fcf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 12:27:27 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-37628596fc9so1479227eec.0
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 04:27:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794400047; x=1795004847; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=svc0vgDYFwBl6hVKJjHTfBuPN1VEmv+TcUmZfTB8SLw=;
        b=MCRChb7u4J3XBkySScH2rtbeBfM7dAa7dX8YIHwsIxDQ+J7mXJv2ok8dJii96NuvmN
         S1PjFYTHgfI8gPKT6uO0VfLm2z+r7mZZnoCcml6SvLNBw8SpJyLFMIRimdrnZ7ppsYrl
         I2uF9VDWZKOadjKEwCgRobtemi2D5rm8sbJrf/VTVd2JsZLQydEPq8Z2j+rSp/qB1xXg
         WTOCB3Egq209zl5GTR2XoflahyRvi20EbJG+aZ/jMa7SqvUf36CAbkFnsY8vbF13YWtX
         5wqCSfLSthENHq8ceUphCuxV6FjhmkKgqR41Mdy/S1UPGTrjnsinfP5ZREUqU/VvPaj9
         rnTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794400047; x=1795004847;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=svc0vgDYFwBl6hVKJjHTfBuPN1VEmv+TcUmZfTB8SLw=;
        b=eaBEBI0A8CILPIaGZlDAj5z+k7u6bZJIL+CZd0OEZgxWY61Zwu0RS3efWFvXrC9cYy
         qQsgo78NnOhwx8XCkWgAWRk44ct9gFnyZ0ZdG2HVvUkBcixlodj9NLpgtwg/N4jrgI+j
         m9xGVTX+HE22pCqgSdG8rPcnr5/JomvL5FkFZPwjIpPLLbcYoc+wnFeehYEizX73Pumc
         rfpHIFy8xTIe9dc6qdYjO5InX9M3rRQkU3r/95lA2BblGhDDqk4mlPIVHa/cYSzgBHZI
         EdQgac5xT0jdOvnU5GUjU3QA1lrfE8QNtcAhbS6k03riQG4pw2+X+HCuXF5+uylUj9uT
         +s/g==
X-Forwarded-Encrypted: i=1; AL+hErFPNauTNjQrpjNLlz6AthXbwESk6ObWxUtB+nJzTUBJvS5wVZAzy1ZsqOTadP6eDLETLg93HEsql9MYYA==@lists.linux.dev
X-Gm-Message-State: APuU4Z9kZkpj0V0zctImp/2G7Ul3RNAh/7Ed8739B14ANN9G8d+Z/dnc
	JX9jqtGBZ+qkqFpaFbmhHi68idDwQRNtOosL4QeFKl+66NOx97W+Td5XHPbTchQkGUcpFebx7q4
	s5xt2Ljkt/1vORyE/lqXTT1NvgGRflhh+pQ/xR44VrTvueQWdWYCCkc6lsdEDof054g==
X-Gm-Gg: AYBFou2vqoQSTqEcV05hOw5qsaL1TSLt2Qnx0oojusYOYJ5RpYo1ASl33EIpOiB9lMM
	klIkMyOpFYkQhmB8KGfkRgfqdY6bl2FryamVcfqxEsnOGG1/prr0kJ24QHahpjDbTT8f5D8uwHJ
	HN+jORAN+FeT+74a0m9XD2d0BMdrhkXYNxPzAUur8R+uv8KceCa2FlkobU7MsBAL1Ehpm/sBcHr
	XLOHC9BHBfmFO+xU+iae0PmQyX0pJuvuPsAebMbKF5DP12gr7ALp7Y6nuRQNrHopWnmKPIMeD7l
	Ze8VIiJSogwVgJbgR7PekxAVdIcScuu/rMJvw5NxqzMktyFBG/+V8YVKvD/KiFgJtI2DEIU9vUh
	yvGrTQa8LAY0ULeIL93nx2sz7hgjS98QfXhQ9V55wbPl8lEVMQYuT4cECb0eDhdUK4b4oM57Bmj
	IWPKhPkE/Sgrevnj3/tjYsjQp+hxV80fA+RQ/Sr8LTn/3zV61YuJ9gqeBRrIysl/ow
X-Received: by 2002:a05:693c:41da:20b0:36a:79e7:2fd with SMTP id 5a478bee46e88-3768721410bmr2952376eec.40.1794400046634;
        Wed, 11 Nov 2026 04:27:26 -0800 (PST)
X-Received: by 2002:a05:693c:41da:20b0:36a:79e7:2fd with SMTP id 5a478bee46e88-3768721410bmr2952343eec.40.1794400045893;
        Wed, 11 Nov 2026 04:27:25 -0800 (PST)
Received: from hu-anancv-blr.qualcomm.com (blr-bdr-fw-01_GlobalNAT_AllZones-Outside.qualcomm.com. [103.229.18.19])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3766146551asm7902709eec.1.2026.11.11.04.27.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 04:27:25 -0800 (PST)
Date: Wed, 11 Nov 2026 17:57:19 +0530
From: Ananthu C V <ananthu.cv@oss.qualcomm.com>
To: Dietmar Eggemann <dietmar.eggemann@arm.com>
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
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <avRfJ8ikcDJsfrqO@hu-anancv-blr.qualcomm.com>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <33d9cbb5-d4fb-4f16-b63e-5ae89051952a@arm.com>
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
In-Reply-To: <33d9cbb5-d4fb-4f16-b63e-5ae89051952a@arm.com>
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfX/7xvzloS46Ti
 m47ZRYzdajvaTwfop4j0lEYmGGEGLQ5qFJeTu2J9jvL3UB7V13ydEoXNE+mF6HYG9sQMV8Mbncx
 SIC6GAMNrfH5OUXD1Umo7+8dnQb2J4dm3dbtnJpSUor69INVNzvL0dSQZDOELlx/k+06TmITugK
 gJpEWqxOPwYfjV02PtqRT/ft90wEACuVvWLt0THmznHdSzha7GTzxQsrhW2xQYlbjfajOrDAXK0
 a+BFExBGlU8O+CkAaseQbayc2mDKAdG5Ge1cxJKsXEh9npXykvQ8fzvDkMKjIg0bdgwvHA2KN7r
 HK/sdYqR3/LtDiUnq1L7wuh/5kbRj8QGzYyFZm57J8Un+CVbYi63bBzP8JXK6PTgBWIM44e0srI
 mjNjCNPlo6Vs++0TwRE59E+0LZ9BX0inYVWBlKqPeWoXk1t51KTV5nlv/yexVk5n7GB2HScGPmm
 uQPWImvC8Ny2LU3+t3Q==
X-Proofpoint-GUID: NkKZXP2rPw6AmQCzRRCEXuHhqAEfn19A
X-Proofpoint-ORIG-GUID: NkKZXP2rPw6AmQCzRRCEXuHhqAEfn19A
X-Authority-Analysis: v=2.4 cv=NK1AaE6g c=1 sm=1 tr=0 ts=6af45f2f cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=Ou0eQOY4+eZoSc0qltEV5Q==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=z0i6psv0inyxDjA-2G0A:9 a=CjuIK1q_8ugA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDA0OSBTYWx0ZWRfXy4XqDM9skaZ7
 Bil7nZHaIr28aUyD8FE7uqCas4X15J9Ila7gCWcIG3Q2TOFuKiJ0eChpDpxbKWS+gTNaAYGQYXk
 eXv4OIVWOy99+zTjqHY0EAZ7KfaupaY=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-11_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 priorityscore=1501 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611110049

Hi Dietmar,

On Mon, Oct 12, 2026 at 01:42:39AM +0200, Dietmar Eggemann wrote:
> On 29.09.26 13:38, Ananthu C V wrote:
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
> > 
> > Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max init")
> > Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> > ---
> >  drivers/cpufreq/cpufreq.c    | 16 +++++++++++++++-
> >  drivers/cpufreq/freq_table.c |  9 ++++++++-
> >  include/linux/cpufreq.h      |  3 +++
> >  3 files changed, 26 insertions(+), 2 deletions(-)
> > 
> > diff --git a/drivers/cpufreq/cpufreq.c b/drivers/cpufreq/cpufreq.c
> > index 96515880b4ac..5e6afb6f8826 100644
> > --- a/drivers/cpufreq/cpufreq.c
> > +++ b/drivers/cpufreq/cpufreq.c
> > @@ -574,6 +574,8 @@ static ssize_t show_local_boost(struct cpufreq_policy *policy, char *buf)
> >  
> >  static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
> >  {
> > +	unsigned int max_freq;
> > +	unsigned int max_table_freq;
> >  	int ret;
> >  
> >  	if (policy->boost_enabled == enable)
> > @@ -587,7 +589,19 @@ static int policy_set_boost(struct cpufreq_policy *policy, bool enable)
> >  		return ret;
> >  	}
> >  
> > -	ret = freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
> > +	max_table_freq = cpufreq_frequency_table_max(policy);
> > +
> > +	if (policy_has_boost_freq(policy)) {
> > +		max_freq = enable ? max_table_freq : policy->cpuinfo.max_base_freq;
> > +
> > +		if (!max_freq)
> > +			/* when the freq table contains only boost frequencies */
> > +			max_freq = max_table_freq;
> > +	} else {
> > +		max_freq = policy->cpuinfo.max_freq;
> > +	}
> > +
> > +	ret = freq_qos_update_request(&policy->boost_freq_req, max_freq);
> 
> This looks pretty convoluted. You have to find the correct freq argument
> for freq_qos_update_request() for freq_table drivers but work around
> this for e.g. the CPPC driver.

We do need quite a bit of wrangling to account for every case, which is why I
didn't like the idea of having to deal with all of this in core to begin with.
My initial idea (revision 1) was to simply drop the one way guard from core
and have the drivers deal with it in some way, but we wanted to keep it,
I suppose. I am open for suggestions, but my guess is that if we have to keep
implementing these fixes in core itself, it will be convoluted in one way or
other.

Best,
Ananthu
