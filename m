Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158587;
	b=eqn9MIVaH6c8+iZFGOyXFGFtviSS3ICwtDCWZewR+wVox92+OSf0lIobxb4BNt3cmqrs
	 91lCfHo0gevbNCbgdB71BuXo8Ree2wWvD6WbhMZEAXM8kcGu25tz6LQJDB3tjZUNRvA6M
	 vshuQu4C4OZA5nR3Lz++4ty5Mqk3uXuoDcXYmCWMIfeuOTpUzGHLwKpgcHkACu7QBET0y
	 oZIIbQNg+1GiSJz8xPlmFk+jwXXclM2H3/z1QBt02AIdCLKsDj9zwc53uGrX3L8DYrM4r
	 ER9u6YouxmCIY5FpXUqsyc5tGDCL4TvPaA5QbHwgWenHRw5kQTrnPIn+bghGqkpQLvw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158587;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-Authority-Analysis:X-Proofpoint-Spam-Info:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
	b=JkJ5JMbhHvKxBZUsZoSi6fJZn7u5iDdZZjVd418uHqFx32THMLEO+AvQQYrkZBge3BXX
	 uqQh0SEymRvetdwAI2XQaMjCCXfDgUlpeZCJ3WCASc8Wnc5yahl8zXlIa2pi21QzT35GF
	 UF6ArY3WF5qvfi5xRamrRsjN7vuIhhRqMCxvhSQcoBekiaJfOmT2mtOPTCN5oPLtzV64h
	 kFi5rTRzDw3iLaaofVFjcqAjPVXMXhukBslgRWt3cEq3qJ1Yr4vR/6SYU6kf+j71Novi5
	 QmEdSk6GangXa6tV+cn8Y429BzWgAPrlRWGOMQTHQtZpyiwOc7RJY34hFR8rUxNUvxg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jve2qMQH;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHQf9fGP;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E189606A325
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 03:36:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E189606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Jve2qMQH;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FHQf9fGP
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69S0ipDx2904891
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 03:36:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=; b=Jve2qMQHUqrEssgK
	LflW6/l7KZ234zJVmm5v4avWWbV1TcUiioz11IU7xNAS3yhP+6JpgpsoOMhZWZvJ
	IPei/BNfJ7ExWg/tShStITm6QZsRQXDRsGswXFZFnq+o9ga6nmbSa33m3OhRLXWT
	jNycF1Ub6eUUeiAVgYu5ZaX6svI7KSL3EU6+K53Rnc/d554YMUVQJALzktVCxxiV
	q+Kz86xf3mp9SK5/sBZk8qiecR2lpX8aT+GhaHVmok95F2t7X+5DAAukw34dJtRr
	PnVGLMYR/XaeQ9zEg45sqiPgK2kxAakvx9jugL9konNgiu/4GNvqT3B3MXccU96s
	aGnIQQ==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hk6f90jmm-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 28 Oct 2026 03:36:25 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3ab2395f104so466194a91.2
        for <driver-core@lists.linux.dev>; Tue, 27 Oct 2026 20:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793158585; x=1793763385; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=FHQf9fGPhZVmw97B/oXjmcAD5p3t8VJzTHKoZWrLbV6wJn3x8R4bu2ob5JmLPiUtAS
         05ROPmdpe+vO2qdW1n7TrZ90jKcQGU/IP4+h7xAY5l0yd/6OvL6De+ziBFyGec8qJxoF
         nXWXbovV0AUKNJy9dqjbrWplAQm2ask5c9d8YSSBhIV+x6vQC0EojyoXLR1SofgfyL5c
         whNlCEnG3pvGS0DCweenwXlH0zX2VjM67mdm0ij+nbYc/4UeNZjjXM4ZWLVmHgYLm/Fz
         RZlpQSEFuF4Oy/X138YKkfupME5KFW2jb7BZNnCjI+uPeNPQbNDm3WtdswGDVJKYOrR+
         yi4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158585; x=1793763385;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/wKdshZSDdNYlVlGGww1CWjddpjIdb7CUnZ1PObkTB4=;
        b=TefFmdrxOhCUh+lEzGXos4ukxWKQ2xlefxyKTF4EWCZ/JvcfUqpwcz1Z1V+Cnh7Ubw
         rO50XJfg2/9DaG0iexdeDccv21S6ysFBNCd6npjCMJN/PxJ+zhoG1VSrTPc/T9xvgTuR
         46hZKXMOfR2BwRpmmoQM7sMQaWxMZgEBrbCITylI6yVIP4FPSelXspeEDCv8/jee/ifV
         K77f4BAPNxnPY9xNOwCfvCgva1uIH52EvMVzPTfL4IqKajy573FIaZ1zbRkhvyP8Wj0g
         C0+sLXZdrgaECYt8eWrW2b+OK502teQu6XyEGb3Ats/zcOtOlwIeXDlBdzRGMGsjyzDC
         0goQ==
X-Forwarded-Encrypted: i=1; AKwUvByAjQFe3TAD/9ZasjzKsOIaWUADSDMbwqQJJYKqOiHF12JVaoLoOMmt4C9XKntDdRaTVzFU7Vuv3iaOQQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYJHloqgwbVKY5b5QD8Tt386MM1mJZGSStmfSbk/JOuTMsySP7xr
	Gk4rB8vfck2PtyrtgbI+prnJaNr4/4U+9buZTUKGpl99IFK0+bNrcB1fvuUhvZKrLxWIsl8yuXM
	vYTFnpWmihFPAnmJyo4QH3Ru+l5YY1Eop06Vb6M3AjQIJgT12xkD22xZYrjZg+rLqFg==
X-Gm-Gg: AYBFou07QLbygZJRObdr5A4Au4X/LCxO3AfMuyxvSG0nU4QB9Q5xEdz0Xkkp0vz8EY3
	vGYUOUeNQ9/oApKlE8Ee0bCaZ+a1OTnZc9rmwO8HbXHYb+TUEFsK6cPR1hvq34yupUOf9/kRqEp
	PbaEvjr5alosxFxpzu30hIi6bduGfuA1Lm4XyvpQ3qs0S0eh0h2Azxsd1rjWdXizarbnpqDcL03
	sFYoUoMGU0F5FeJzUGnKzLTWp+it4LMfoHxKWLCqE/b3YTSIibQhBBJ9begnT8KY+ZXbz750J3c
	m9AdOgIkYtbWqz0jUXty9DIfl1lHpYU6eZ/M/+ATTFW3aVRBHsIvqEHhzwFzH542uC4DgYCeUpw
	PVNqBsoz8Oiok5j8R2OVLjmQl7KwB07kz1wrCfs7d72MY6ccxEe57cR1vKAK+5n/B1GigYkBKsi
	hEN5uIqNausJYTXA8f3h4g2ruldBGbG+ATM8pNK9kf3x8=
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818175a91.38.1793158584994;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
X-Received: by 2002:a17:90b:5863:b0:3ac:b3ff:b476 with SMTP id 98e67ed59e1d1-3ae581836a6mr818144a91.38.1793158584441;
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
Received: from [10.133.33.27] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae5a48ec90sm899533a91.6.2026.10.27.20.36.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Oct 2026 20:36:24 -0700 (PDT)
Message-ID: <e5bd0521-36d1-447d-b71a-94a2e07414e2@oss.qualcomm.com>
Date: Wed, 28 Oct 2026 11:36:16 +0800
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
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
To: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        "Rafael J . Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>
Cc: Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
        Zhihao Cheng <chengzhihao1@huawei.com>,
        Sumanth Korikkar <sumanthk@linux.ibm.com>,
        Bill Wendling <morbo@google.com>,
        Justin Stitt <justinstitt@google.com>, driver-core@lists.linux.dev,
        llvm@lists.linux.dev, linux-hardening@vger.kernel.org,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-pm@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org,
        linux-s390@vger.kernel.org, gfs2@lists.linux.dev,
        xen-devel@lists.xenproject.org, linux-mtd@lists.infradead.org,
        amd-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
        linux-kernel@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>,
        zhongqiu.han@oss.qualcomm.com
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20261027223847.652884-5-irogers@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=frhJ914f c=1 sm=1 tr=0 ts=6ae16db9 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=1XWaLZrsAAAA:8 a=MbyaxBA4Lnn_ULkWIDkA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfX6lpGaciGQAdB
 HgefUlLkLc1rS3ru7HXuVSXj4e4nVfsOSqMt46vLbxKvjfeq/aSf2/XEPJG+rK10Ye1CKVCK0hG
 igDuVDnoEQv40msxjIor0S6AEUB7VX4=
X-Proofpoint-GUID: dI8XYlr97E2Av7vnYW8GQlIlTU38jKwV
X-Proofpoint-ORIG-GUID: dI8XYlr97E2Av7vnYW8GQlIlTU38jKwV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDAxNCBTYWx0ZWRfX9FgvE8kPl+YM
 AdhXjQVXvpnkB6DQt/p8cQKob3oC3NryfbfQUyQ+D7QfOko89VwJIzGgPrpWDm3yYXDz/im8/A3
 UXm+RamMG2FUR9ywr6acL7MRcw1NbWyG0cRI9HElcbM6Z+ArSeYoumBaC1Yu+itJR/CP1/coICo
 PQqkS9xWq7gPSb3qc7YoMCzrXMhvS3tzme69Az0h93G3HgQuxxO/l9dHhydg3bi6NvXhjC2VW4o
 +FqiQaDX6ovCWgJqF28GlqkHCJgGq8/d3jhVlqnOOxXYhtQz59cMCkBgnp1JWUuBg3lBGkFBwJI
 +Dh0XrkheXv9wx9F3vdQ1ubXM4Wx9RS7JTDKGJMqxFsiJB6kJY/FQ6uQN2rDWWqANysrFYnWblZ
 gKHHFDaaG15tbSVR5PTHzsxtieYpA6P0J2+tWvKsCFOft3e314UdQ4y1ICVfU9wAit+4L0xdH/F
 rDEDzlPCorVCXISF/0g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_01,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 suspectscore=0 adultscore=0 phishscore=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280014

Hi Ian,

Thanks for the update.

On 10/28/2026 6:38 AM, Ian Rogers wrote:
> Export cpufreq_dbs_data_release() and set .kobj_type.release statically
> in the ondemand and conservative governors so their gov_attr_set
> kobjects have a valid release callback statically initialized, matching
> cpufreq_governor_dbs. Remove the redundant runtime assignment in

"matching cpufreq_governor_dbs" is a bit confusing to me
(cpufreq_governor_dbs() was removed back in v4.8 by commit e788892ba3cc
("cpufreq: governor: Get rid of governor events")), as it doesn't
seem to refer to anything in the tree. Perhaps we could just drop it,
e.g.:

Export cpufreq_dbs_data_release() and initialize .kobj_type.release
statically in the ondemand and conservative governors instead of
assigning it at runtime in cpufreq_dbs_governor_init().


The code change itself looks good to me. With the changelog updated
(in a respin if the series needs one for other reasons, or when
applying):

Reviewed-by: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>

> cpufreq_dbs_governor_init().
> 
> This prepares for annotating struct kobj_type::release with
> __must_init.
> 
> Signed-off-by: Ian Rogers <irogers@google.com>
> ---
>   drivers/cpufreq/cpufreq_conservative.c | 5 ++++-
>   drivers/cpufreq/cpufreq_governor.c     | 4 ++--
>   drivers/cpufreq/cpufreq_governor.h     | 1 +
>   drivers/cpufreq/cpufreq_ondemand.c     | 5 ++++-
>   4 files changed, 11 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/cpufreq/cpufreq_conservative.c b/drivers/cpufreq/cpufreq_conservative.c
> index 02bfd46543e9..146a2353b1a2 100644
> --- a/drivers/cpufreq/cpufreq_conservative.c
> +++ b/drivers/cpufreq/cpufreq_conservative.c
> @@ -318,7 +318,10 @@ static void cs_limits(struct cpufreq_policy *policy)
>   
>   static struct dbs_governor cs_governor = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("conservative"),
> -	.kobj_type = { .default_groups = cs_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = cs_groups,
> +	},
>   	.gov_dbs_update = cs_dbs_update,
>   	.alloc = cs_alloc,
>   	.free = cs_free,
> diff --git a/drivers/cpufreq/cpufreq_governor.c b/drivers/cpufreq/cpufreq_governor.c
> index f3bd3dbe7c41..f8b5aca09b6b 100644
> --- a/drivers/cpufreq/cpufreq_governor.c
> +++ b/drivers/cpufreq/cpufreq_governor.c
> @@ -419,7 +419,7 @@ static void free_policy_dbs_info(struct policy_dbs_info *policy_dbs,
>   	gov->free(policy_dbs);
>   }
>   
> -static void cpufreq_dbs_data_release(struct kobject *kobj)
> +void cpufreq_dbs_data_release(struct kobject *kobj)
>   {
>   	struct dbs_data *dbs_data = to_dbs_data(to_gov_attr_set(kobj));
>   	struct dbs_governor *gov = dbs_data->gov;
> @@ -427,6 +427,7 @@ static void cpufreq_dbs_data_release(struct kobject *kobj)
>   	gov->exit(dbs_data);
>   	kfree(dbs_data);
>   }
> +EXPORT_SYMBOL_GPL(cpufreq_dbs_data_release);
>   
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   {
> @@ -488,7 +489,6 @@ int cpufreq_dbs_governor_init(struct cpufreq_policy *policy)
>   	policy->governor_data = policy_dbs;
>   
>   	gov->kobj_type.sysfs_ops = &governor_sysfs_ops;
> -	gov->kobj_type.release = cpufreq_dbs_data_release;
>   	ret = kobject_init_and_add(&dbs_data->attr_set.kobj, &gov->kobj_type,
>   				   get_governor_parent_kobj(policy),
>   				   "%s", gov->gov.name);
> diff --git a/drivers/cpufreq/cpufreq_governor.h b/drivers/cpufreq/cpufreq_governor.h
> index 806d8fb4dff1..1026712bb79b 100644
> --- a/drivers/cpufreq/cpufreq_governor.h
> +++ b/drivers/cpufreq/cpufreq_governor.h
> @@ -150,6 +150,7 @@ static inline struct dbs_governor *dbs_governor_of(struct cpufreq_policy *policy
>   }
>   
>   /* Governor callback routines */
> +void cpufreq_dbs_data_release(struct kobject *kobj);
>   int cpufreq_dbs_governor_init(struct cpufreq_policy *policy);
>   void cpufreq_dbs_governor_exit(struct cpufreq_policy *policy);
>   int cpufreq_dbs_governor_start(struct cpufreq_policy *policy);
> diff --git a/drivers/cpufreq/cpufreq_ondemand.c b/drivers/cpufreq/cpufreq_ondemand.c
> index 9942dbb38dae..7386d043c665 100644
> --- a/drivers/cpufreq/cpufreq_ondemand.c
> +++ b/drivers/cpufreq/cpufreq_ondemand.c
> @@ -374,7 +374,10 @@ static struct od_ops od_ops = {
>   
>   static struct dbs_governor od_dbs_gov = {
>   	.gov = CPUFREQ_DBS_GOVERNOR_INITIALIZER("ondemand"),
> -	.kobj_type = { .default_groups = od_groups },
> +	.kobj_type = {
> +		.release = cpufreq_dbs_data_release,
> +		.default_groups = od_groups,
> +	},
>   	.gov_dbs_update = od_dbs_update,
>   	.alloc = od_alloc,
>   	.free = od_free,


-- 
Thx and BRs,
Zhongqiu Han
