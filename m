Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794493719;
	b=i6eWN+MuvbWtRD8DCdIs+nB13M9ZABRBUz5wNUkbt+0b826M+1y/W9W4wgTwrp8mg2Ez
	 Dk4Rb8wYUjlYW2Rb3a7FBHq8tKYMyhNTokykqo5vden6hjgG2qx0HFE4Vm9kxqq9iXEzA
	 C+V0WLwvFltuFUkqOihab+uG/xvwDr8YJp8BW9ipeR8w7EvJBpehKCmDgACj0EUFgpSKT
	 ulHZaCSFKfdLPfH3JO+4aPZQ4CqQVu+fdou3d9hD0iKUZDrJ+uUPoU4DpInRUfEQTc0gX
	 dp7Zj5ppK1JGMhpvWgH4GcFMfWfF+UNx1ZYYnQvHzm8YyBcDnzOvuKj9BvB+pZzeadA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794493719;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:
	 Cc:Content-Type:Content-Transfer-Encoding:X-Authority-Analysis:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
	b=VOF4zwtkBb4ztGKKWmkNRsxAvo3BJfd6pzQD+w3pH0sEsAT528xz/+xeABC2qOldDpvs
	 ZI78OKZwfTxXkD1hbmsuSYo7MTOe+Em9K38uaQa42pu6nf0rdn4JAVH/abtOgNERN0/R9
	 K7vRAqJQksa7xV3adg4AUBMOrwOZR25StnyPNzMpJWmOMk4+8l/Y3rEXb68MSg1qgjXCK
	 BakMcCteexC8zsVc+CFiaCLOyXvEEyzoPmjhNMfc0qwXB0QYIIZ2GAB2Tg3zSr3Ukd/6H
	 g66D+/gJIRXxsfLF9WacxMNKUkMga1YcnMdhjvtWZemx7471yxQphPDOhH3iWEwimvg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPH5P4g2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs749ZIG;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF459606A32E
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:28:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF459606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=lPH5P4g2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gs749ZIG
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AC9NZIk2514152
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:28:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=; b=lPH5P4g2Qthn3tVI
	MqDjIkh6YFmtfdMCQB0seAxDLqgq07voAUUzsx0HXCe8mjpt0Q6C1Cd47JXGwfdQ
	BTeoIclVoDzYzMVDDoLGP4YQA+XZedprjoR8W0omZQZ4mLxQLM3Nbm7jUo22ldOw
	Kb7hdw4x8X8XnHq+tQeTuvRXKk6heAUOwqQOHQg/V+7JQFzCGYaQVCQ+oU/NXHld
	aVUKxdAN1BiEUXZTQ25CYhcod3MYy8aF/sQV538mknDkvjB8O9KI93AlZYuwkT7s
	R/UmYGaNEFHyPwkAt9scHerWa3PzlhFQXbdUiuUhjWMKRk/XwGRr0/gGLxLYNl14
	0+n4hw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hvwm1uyb2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 14:28:37 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-3aed37745bcso756503a91.1
        for <driver-core@lists.linux.dev>; Thu, 12 Nov 2026 06:28:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794493717; cv=none;
        d=google.com; s=arc-20260327;
        b=XIxnjWX2Yx9oTxnn1USzkRDurkHfezaxrZnhMU0w47MddOfLUA1yILWIFcmrCFG83R
         qrbCL+4xoehMoXF9yRPSaCx1SSP0X1o3Bq0XJLzqD1fPMbEBtdi/VUDIufkXxjTnwB0m
         yyo8cjDErA5HwFvioQpqDThkT79iIHkigJBbxSRfHMYqyAv1BE3ueIwYJbEJHJs/ZOvR
         r53f2/g7n+/MWZ34advnHC3ZBr45SN5q+xyZMtRtd44HmPN2bOIPFxBeUV4iwVwfRjgd
         wsW5Ezn741TyjkqPNZr9aEKUqb3zK5rtXz9+D3eKi3Na6x1QLvJqRu12jDYfF0EIRqD/
         xBig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
        fh=BWxtn93ZelW7PTSdEDDuS9rfMAOtwAR63C6GdjgM6/M=;
        b=JTILG+F68Ml9PvFTJOVauIVPvf1mq4q4PJrTnGMh2911UUuRwjParycEk4OsGPSctv
         P7l9jgHh4uwJepKwB+niUMnwaU5woyxvsE2YhcJSjP29mpQnaPOVI0mdSvButDQGtMI0
         r2hx9FFXUcF9F4bUiA3gAQjufPPRQvYHROQGuF7VWwbkILHlB6xZAsy1YQDt9owJlHLd
         m2yVR/ERFvIcpWQUr5v/eexdBj9N77Q44RVzcPob/cwa3QExGn2S8rHNSx3SHdF+fbHi
         Jcij2/+GKuZit4rc4QiAbO+lCtYhk214wbp72dl/Wx9LFRGkA0Nj4Y7DQQ8/gXBPfHtp
         CBtA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1794493717; x=1795098517; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
        b=gs749ZIG4VKfi3v7148Rsj6CC+c3xy9BUw3x9lUqWWBmNVv4RjV9KwGZR03hrMoMCh
         meI+qFWckM9sWW13psyeUR8G6ZCBpTMzmZLUxak2tFtD6chTQ0YrZHyL5NCFPZnAAYM5
         az6fdwEgjSKbnQz4S/FY4bM5rTi4Ks07eQHy6YhL0ux1FPXqcD4xxgmzpEhmpsJBMSKl
         /2PbTNa6FU9N0PgQfbh2ScL3Hw6hFtCBTD5Sy3ZzoG+OJh35urQDenB+il7OV3Bkr4uj
         9awPsG+aSDn/B+6+Z6gBVzNg3IfGfOszzYm9r9/unK7+Z/x0KNTFRHXBYXF6QUIrXT1r
         UeJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794493717; x=1795098517;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=v/Rm/pT1wqvu7fRaZ753awKakJHY6Oo/yXxD9F/uJdw=;
        b=sAs2GizBvqdX/HOqcl0ELheOY5NcyTVYMgQNc4dVqmUABUb9saj14wFvX27cucAEIq
         jUEzJfBNn2lqMQ45Fnhz+8YAJG/bJ4u+ikY5edVtybDQXKzHHyJcWnAl/F2GTw+VqErI
         e/hDwSAy+Q6DqRTsmmMqf/TAL6P6VbL5BNPxwMVomyEqGSNKn8j1JIcPV3MgVuyX0DXs
         3/bmMrW1tVS7I0ckykKwUD8087SxOfSEzo263vbojdSGvwTg7G47rdvkCjDicOl15jQW
         5IubKly6G72uno9LE2u/gbJUPkDD4wV8HLcyZac2vE3hv9UYAFATuuGpqI9pO8A5r2nM
         5/EA==
X-Forwarded-Encrypted: i=1; AL+hErEv8uDKaN2Ka6Y83uqKkmoaZ7d9P5vyQc9GgEWmcunaWsZhisYAZUV5O9hfapzPM1XIcCrVJrM2ePV6Fg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+xpFR6MtDTLEYqHG/08FwJMa1kl3yhLcAIwnWcD06+hL/v5p3S
	he7Z6kVkT6d0WOZ8YzhEfetgljTHuwM0DCKH1JiiRHjdC6nG8vi82km3XMTcjWB2dNaBsX1jFnl
	7b1AugyWcz+vcJXdfXZ9RzCVLh9kiPZBixKZ21uwLnC7pyeI+eZwD+F2cjz96sEJFKmi6QLwLIl
	vWnRWG8Lu5QIFxbHDW8jmfjVWdKab3anyjxkHz2XGi
X-Gm-Gg: AYBFou2mhpC5alh380z85q9Sa6Jrmj/x5SdEltPv9mxTKhPRvH1skVN2kYWU0Wo3bcm
	xvIlH8j/EQAFzCS2Aod/bqVTMTOys29nsxjUR5XiCQyqCQ4ek8SUT5+W3DnbKQ+Q0pFMhw9Kdf9
	GN1VXZ3iOOWgCOA6udueRiPf9FntPOPxhajVXycW0gJfdq5VLSZD+WQzvGUA==
X-Received: by 2002:a17:90b:55c3:b0:3a9:79b4:d85 with SMTP id 98e67ed59e1d1-3b197d8268emr2031798a91.32.1794493717108;
        Thu, 12 Nov 2026 06:28:37 -0800 (PST)
X-Received: by 2002:a17:90b:55c3:b0:3a9:79b4:d85 with SMTP id
 98e67ed59e1d1-3b197d8268emr2031772a91.32.1794493716564; Thu, 12 Nov 2026
 06:28:36 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261014-topic-qc_clk_dvfs-v1-0-3041b788e9f7@oss.qualcomm.com> <20261014-topic-qc_clk_dvfs-v1-5-3041b788e9f7@oss.qualcomm.com>
In-Reply-To: <20261014-topic-qc_clk_dvfs-v1-5-3041b788e9f7@oss.qualcomm.com>
From: Ulf Hansson <ulf.hansson@oss.qualcomm.com>
Date: Thu, 12 Nov 2026 15:28:25 +0100
X-Gm-Features: AclHuK-NURketk7FOpHZD6AhO-eykxqhfixKIHKsjFm9bSdW9Bd41KhgBl8UQTY
Message-ID: <CAPx+jO8RgKnZEH=H5vD2PkXU=q6n3iApgQSgDyN8YcG=rvQ1WA@mail.gmail.com>
Subject: Re: [PATCH RFC 05/16] pmdomain: core: Support subdomains without
 pstate propagation
To: Konrad Dybcio <konradybcio@kernel.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>,
        Jerome Brunet <jbrunet+clk@baylibre.com>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Pavel Machek <pavel@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Ulf Hansson <ulfh@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
        Abel Vesa <abelvesa@kernel.org>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Mike Tipton <mike.tipton@oss.qualcomm.com>,
        Taniya Das <taniya.das@oss.qualcomm.com>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Authority-Analysis: v=2.4 cv=KsnYSmWN c=1 sm=1 tr=0 ts=6af5cd15 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=04sI-PGMuLug9NVl2XMA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-GUID: pHFTVRhlYW8mwB1k3fKbWOtq8qNxyTv3
X-Proofpoint-ORIG-GUID: pHFTVRhlYW8mwB1k3fKbWOtq8qNxyTv3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX8/QA5wI9EsFS
 oJIuDsMGvqNezYnXd831sXqQe7CZ784iLZVNdygbW0A/7nutuwnMm58xgOmZCEeFBNEdohFpQwI
 pTDHONqEgndeCk3BQVoDVNk4KywtD1UXuBAYDMxWt90nQjYe9fb3u0jOykwJwIHhjt1tVLB04Yb
 rq2l9l0Wifq9AoYIUYSzC7SZYos8+e0FykGFTphFSnipyrAEExK3Qyn7c4rpp2NG0lbnO5dzPpD
 ktGdQvlI1Dp4ja5q8WbLzk7to3YjP9HD6Hoxgs1mkO9/C3KWMZVnKn3MLnuin9tNIaHFCT3X0qH
 innQGBtPzfBfkIJYkC+gGOvcDKmRHjseTj6eBRapOOGH1x7Chpvtmh0ab0K2TIdX0wYOlWGOC48
 0qPzRHta8JY9OcNOZz0ZsqId/iLHp4f6svlDpILgq7OFlEMXTwXGtPqHstNIeCxivLvMyvlHU1Y
 LldF3jP0B5RPe3NJL0A==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEyMDA1NyBTYWx0ZWRfX2B9IUPkX+fw3
 3pbiM6oB/Nj0OsF0ro2Fy1Q49IvPGL7zOK2wTa3k9Vgp2ggWMnURRSfh1x+B1mngtsjX+2yH9MH
 ZM19JcMLx66HxKji0m34wExRvoz2Rpg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-12_01,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 phishscore=0 impostorscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611120057

On Wed, Oct 14, 2026 at 2:21=E2=80=AFPM Konrad Dybcio <konradybcio@kernel.o=
rg> wrote:
>
> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>
> A subdomain may need its parent to be powered on without requiring its
> performance state to follow the child's. GenPD currently couples these
> requirements, so increasing the child's performance state can also
> raise the parent even when it only needs to remain on.
>
> Allow subdomain links to opt out of performance-state propagation while
> preserving power ordering and active-child accounting.

I assume it's intentional to do this on a per subdomain link? A per
genpd flag/bit is not going to be sufficient - or is it?

That said, I guess we may need a corresponding DT property as well, at
least at some point, right?

Kind regards
Uffe

>
> Assisted-by: LLM
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> ---
>  drivers/pmdomain/core.c   | 32 ++++++++++++++++++++++++++++----
>  include/linux/pm_domain.h | 14 ++++++++++++++
>  2 files changed, 42 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/pmdomain/core.c b/drivers/pmdomain/core.c
> index 76ff0d9a229c..80ea70930cc6 100644
> --- a/drivers/pmdomain/core.c
> +++ b/drivers/pmdomain/core.c
> @@ -463,6 +463,9 @@ static void _genpd_rollback_parent_state(struct gpd_l=
ink *link, int depth)
>         struct generic_pm_domain *parent =3D link->parent;
>         int parent_state;
>
> +       if (link->flags & GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION)
> +               return;
> +
>         genpd_lock_nested(parent, depth + 1);
>
>         parent_state =3D link->prev_performance_state;
> @@ -484,6 +487,9 @@ static int _genpd_set_parent_state(struct generic_pm_=
domain *genpd,
>         struct generic_pm_domain *parent =3D link->parent;
>         int parent_state, ret;
>
> +       if (link->flags & GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION)
> +               return 0;
> +
>         /* Find parent's performance state */
>         ret =3D genpd_xlate_performance_state(genpd, parent, state);
>         if (unlikely(ret < 0))
> @@ -2257,7 +2263,8 @@ int dev_pm_genpd_remove_notifier(struct device *dev=
)
>  EXPORT_SYMBOL_GPL(dev_pm_genpd_remove_notifier);
>
>  static int genpd_add_subdomain(struct generic_pm_domain *genpd,
> -                              struct generic_pm_domain *subdomain)
> +                              struct generic_pm_domain *subdomain,
> +                              unsigned int flags)
>  {
>         struct gpd_link *link, *itr;
>         int ret =3D 0;
> @@ -2265,6 +2272,8 @@ static int genpd_add_subdomain(struct generic_pm_do=
main *genpd,
>         if (IS_ERR_OR_NULL(genpd) || IS_ERR_OR_NULL(subdomain)
>             || genpd =3D=3D subdomain)
>                 return -EINVAL;
> +       if (flags & ~GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION)
> +               return -EINVAL;
>
>         /*
>          * If the domain can be powered on/off in an IRQ safe
> @@ -2298,6 +2307,7 @@ static int genpd_add_subdomain(struct generic_pm_do=
main *genpd,
>         }
>
>         link->parent =3D genpd;
> +       link->flags =3D flags;
>         list_add_tail(&link->parent_node, &genpd->parent_links);
>         link->child =3D subdomain;
>         list_add_tail(&link->child_node, &subdomain->child_links);
> @@ -2319,16 +2329,30 @@ static int genpd_add_subdomain(struct generic_pm_=
domain *genpd,
>   */
>  int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
>                            struct generic_pm_domain *subdomain)
> +{
> +       return pm_genpd_add_subdomain_with_flags(genpd, subdomain, 0);
> +}
> +EXPORT_SYMBOL_GPL(pm_genpd_add_subdomain);
> +
> +/**
> + * pm_genpd_add_subdomain_with_flags - Add a configured subdomain relati=
onship.
> + * @genpd: Leader PM domain to add the subdomain to.
> + * @subdomain: Subdomain to be added.
> + * @flags: Subdomain-link configuration flags.
> + */
> +int pm_genpd_add_subdomain_with_flags(struct generic_pm_domain *genpd,
> +                                     struct generic_pm_domain *subdomain=
,
> +                                     unsigned int flags)
>  {
>         int ret;
>
>         mutex_lock(&gpd_list_lock);
> -       ret =3D genpd_add_subdomain(genpd, subdomain);
> +       ret =3D genpd_add_subdomain(genpd, subdomain, flags);
>         mutex_unlock(&gpd_list_lock);
>
>         return ret;
>  }
> -EXPORT_SYMBOL_GPL(pm_genpd_add_subdomain);
> +EXPORT_SYMBOL_GPL(pm_genpd_add_subdomain_with_flags);
>
>  /**
>   * pm_genpd_remove_subdomain - Remove a subdomain from an I/O PM domain.
> @@ -3271,7 +3295,7 @@ int of_genpd_add_subdomain(const struct of_phandle_=
args *parent_spec,
>                 goto out;
>         }
>
> -       ret =3D genpd_add_subdomain(parent, subdomain);
> +       ret =3D genpd_add_subdomain(parent, subdomain, 0);
>
>  out:
>         mutex_unlock(&gpd_list_lock);
> diff --git a/include/linux/pm_domain.h b/include/linux/pm_domain.h
> index 98aca4a4aede..322453da7fae 100644
> --- a/include/linux/pm_domain.h
> +++ b/include/linux/pm_domain.h
> @@ -277,8 +277,12 @@ struct gpd_link {
>         /* Sub-domain's per-master domain performance state */
>         unsigned int performance_state;
>         unsigned int prev_performance_state;
> +       unsigned int flags;
>  };
>
> +/* Preserve power ordering and accounting, but do not forward performanc=
e states. */
> +#define GENPD_SUBDOMAIN_NO_PERF_STATE_PROPAGATION      BIT(0)
> +
>  struct gpd_timing_data {
>         s64 suspend_latency_ns;
>         s64 resume_latency_ns;
> @@ -323,6 +327,9 @@ int pm_genpd_add_device(struct generic_pm_domain *gen=
pd, struct device *dev);
>  int pm_genpd_remove_device(struct device *dev);
>  int pm_genpd_add_subdomain(struct generic_pm_domain *genpd,
>                            struct generic_pm_domain *subdomain);
> +int pm_genpd_add_subdomain_with_flags(struct generic_pm_domain *genpd,
> +                                     struct generic_pm_domain *subdomain=
,
> +                                     unsigned int flags);
>  int pm_genpd_remove_subdomain(struct generic_pm_domain *genpd,
>                               struct generic_pm_domain *subdomain);
>  int pm_genpd_init(struct generic_pm_domain *genpd,
> @@ -367,6 +374,13 @@ static inline int pm_genpd_add_subdomain(struct gene=
ric_pm_domain *genpd,
>  {
>         return -ENOSYS;
>  }
> +static inline int pm_genpd_add_subdomain_with_flags(
> +                                       struct generic_pm_domain *genpd,
> +                                       struct generic_pm_domain *subdoma=
in,
> +                                       unsigned int flags)
> +{
> +       return -ENOSYS;
> +}
>  static inline int pm_genpd_remove_subdomain(struct generic_pm_domain *ge=
npd,
>                                             struct generic_pm_domain *sub=
domain)
>  {
>
> --
> 2.56.0
>
