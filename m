Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75206402BB6
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 12:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782737021; cv=none; b=EiexvXiHhOgtrnLV/OBP9h23T4PeDi5NE/RrejFNNDFXZbqxArhJrx0cbzZkyk3JE4ClumDKmL6I6oiaFYWw5eH7RhnOqkt2ZlAb7ZF2b30CqUCWSJfC0VmBz61jgGLoaRhm4tiTJvVLgWCa1Qawm7z+wNmcWoS/e30C4cxh/E4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782737021; c=relaxed/simple;
	bh=iL8eQCnQSbG2ojygIK5P3cXtGszj1MWC/yVH3lFhswM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lE5/PGMpKRILQSXfvifN7kNis339EV9GY+NBqBMbLj+Lki0z13l4bwkRzrr9hEFOazIsHb1Jy8ZXM2xz9iC8+3Ud/YXs9Z8KfOLLjL/NvaZPMIYPzxKSPRbNFqDlpYZzG2k2oD1JlFBLaYEqkMCMkV/iY/AxjA8DotG/AEx1SP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=NMdpH6YD; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=XldQkOET; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="NMdpH6YD";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="XldQkOET"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65TASumn2601194
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 12:43:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=; b=NMdpH6YDeqCM6Ng2
	6l+u1JT4xPqzvjoTIliP40I8uS1vyj+L87A0s/qye2JFugwtFubIXUyRV7TGDunu
	R6AT7ytIJgsoT9qLUDl4wVFliJkW4IuqsH8CbCK3KeaS2RCkVYPYUJb3E2XmVf/n
	n3hDCcBxNJlzKeVUAMJaWhtjvocMm4xmBllzsNmFZBHpLfh9MoNKpAQANg8pAcNm
	TXF0zOy0GX+9LwYTaSDruBciQSlEcjcnL39ePRYOwyzIFsHATrj9EfyXaS+7TQfj
	LXtLZZhSE0HawuL0/q6HT7LO9lTXKMaK7kYXAJnJbjWc2xRjybwKZ0RF9NkF8Rk6
	8fCEwA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com [209.85.216.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f3nnw8ue8-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 12:43:39 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id 98e67ed59e1d1-37fec599568so1562889a91.2
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 05:43:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782737019; x=1783341819; darn=lists.linux.dev;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=;
        b=XldQkOETfZlr4LLQ1JwC99q7VfA8GywAlZRXQ4wKsbvDOpi+TgYNfRuiKi3YM6PQl5
         011NF2yckC70goz+ir0DkU+MhDR+ktFrSOfP1vni+CyFTbSAroRllxdEilK9WRpujXUj
         Vcmf5zn7AcXbscnJVBUk1H0qXKyoEUDna+ZvxrbXhOOsY+E8D/rdVMdADyFSZvCoua0H
         rk3ad5Xlz8shv+Tx6tPStLFAP7mLqhfoL3A/cSZjZaVHV3y/fK1SPkfi7m+kXFMPRPuK
         kB9X1SfNXrVsa9LOgTJ2CXNUtW4EiiX7s6QEjMOr7H7ltchKmhFjEXgFt/m+Fmg3o1Pv
         Pg4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782737019; x=1783341819;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CpHcwEms8mZxbI2w+Md5BrpKxIEKLFyT45Gg2vM0YiY=;
        b=I2vPXCZg4SffNfMXNjS8j+ERps+pHTCHuLdvKCF5PmkVXy/au74ydEampRbbzRYLIQ
         q5/9YFRmwoVHcGUF+luMVB3X2Z6qGr5S6mAHnMkabv7t/fJdcf60QvcLlV2yOTUJde/k
         i7MsISsRys3VogT0e/ot0nwBWoygz7xhvHevrJHrsSK41oO0Bi95D5xHpitk/3ljXnRo
         TmGWU8yCNFX9wZczO6+j5yTrwp/3usfsIXT+2DM7R5RqWutYMxvS3IYtrZQCa5QeRm/r
         MYKQnxZcuVeoI2YMX9Wyw6il2CBVvq9aI6LXkNlnRVFRFMlQ3S/zB5/yyhjCHtCBjpYw
         tm6w==
X-Forwarded-Encrypted: i=1; AHgh+RqycCvPAO1c3GKsLBWjGnPVZCepT81XxWx3EGjaF2OA3o5ACJgoVD+Br5AYw4h2ngdG2Wlp3pQ8btztdA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx7vvR8/XEfl2nr9XvqoRPg7s/GRmPRKgpAxm29ulthQrjw3ANw
	62SBExd0SHQz/s9jvMH97gYi3zJxyDAokOvSsVdypsA6U72bGBAzJdr0VVfMnXX6mobFcYKoCAC
	r//M1h08SC6hgI21pLmgONbfpX828FV4UAiUcqAQ8vlbyqBWkxwCdhQ2/aneCE5rS2A==
X-Gm-Gg: AfdE7ckxXaw4UMJhNY7a/r3itTQLX6g3MqZMdY8gASySN9OlN/m2uSNSygByLZqE4Wp
	cgRUvK7loubmi0ylJH9NhCDTdafK2hlmlbMy4PrVBEnprA7g3jmDZVdn1n4LGgqXkhxXTo6D2Gj
	oHYSej4MzJW2t6PYM5/8NC6aCnaVm6ElenLsSIreGxEFIeufgcDM/+1T8XSrUdGobRZN3JJ/wTK
	e/JwOnA/33HXO05l8HlDKtqix0ObFmuIfPdwxyob28co0bri/mG5a6qdMWD9jKs0YcahY4rC9u8
	dFFEiwv+IvkbfsHQqQqOyScJ2EPhvky+z2iRq8Fd3n7EgcSI9l1XhMUwPNbiuoeFK2b5ujAd83D
	3AKhmUtV8KzmJLSE6lucBNzBoK/xZbUtwM+5WmCcZHdVRs4LlFbbjbQk7K61j11lfnzt1Z3C3tA
	203HRD3w==
X-Received: by 2002:a17:90b:4ecd:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-37f9ce2229dmr7491052a91.30.1782737019090;
        Mon, 29 Jun 2026 05:43:39 -0700 (PDT)
X-Received: by 2002:a17:90b:4ecd:b0:37f:9ce1:cdb0 with SMTP id 98e67ed59e1d1-37f9ce2229dmr7491002a91.30.1782737018606;
        Mon, 29 Jun 2026 05:43:38 -0700 (PDT)
Received: from [10.133.33.246] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37eaff87f61sm5602580a91.17.2026.06.29.05.43.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 05:43:38 -0700 (PDT)
Message-ID: <f0ed588a-6cfb-4079-a2fe-7c14f1b42727@oss.qualcomm.com>
Date: Mon, 29 Jun 2026 20:43:25 +0800
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] cpufreq: rcpufreq_dt: use vertical import style
To: Guru Das Srinagesh <linux@gurudas.dev>, Miguel Ojeda <ojeda@kernel.org>,
        rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Danilo Krummrich <dakr@kernel.org>,
        Abdiel Janulgue <abdiel.janulgue@gmail.com>,
        Daniel Almeida <daniel.almeida@collabora.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Andreas Hindborg
 <a.hindborg@kernel.org>,
        Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
        =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>,
        Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
        Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>,
        Alexandre Courbot
 <acourbot@nvidia.com>,
        =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
        Drew Fustini <fustini@kernel.org>, Guo Ren <guoren@kernel.org>,
        Fu Wei <wefu@redhat.com>, Michal Wilczynski <m.wilczynski@samsung.com>,
        =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>, Jens Axboe <axboe@kernel.dk>,
        FUJITA Tomonori <fujita.tomonori@gmail.com>,
        Andrew Lunn <andrew@lunn.ch>, Heiner Kallweit <hkallweit1@gmail.com>,
        Russell King
 <linux@armlinux.org.uk>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, David Airlie <airlied@gmail.com>,
        Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev,
        linux-riscv@lists.infradead.org, linux-pwm@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-block@vger.kernel.org,
        netdev@vger.kernel.org, nova-gpu@lists.linux.dev,
        dri-devel@lists.freedesktop.org, zhongqiu.han@oss.qualcomm.com
References: <20260628-b4-rust-vertical-imports-v1-0-98bc71d4810b@gurudas.dev>
 <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
Content-Language: en-US
From: Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>
In-Reply-To: <20260628-b4-rust-vertical-imports-v1-3-98bc71d4810b@gurudas.dev>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfX1BfmZlI+Z2HO
 u7n+ETKOeP7wjdhtLbbCrRE+A70q1tg7+/PI09/+0jVmBZ2e23+zO6KC5m6zlKrgPPrg8DL2ApW
 7Qxqj9lIj0haFf/NFQsQR8JxXnlm24U=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI5MDEwNSBTYWx0ZWRfX8MZJLmvLMK/D
 HzXbgjiSVZOuX0q8DJumrpRbS2C471s7lmonkZFSNGXmPgwmaLvsLbSslZE05upExG8xmdVirWi
 VMc/1n/HzoblAwE7xOfOpu/rNwaglmUnqW2Fu5N8PE58secVtJCzCiLVkJLtleWXsPN0i0hHBzO
 wFPAtFA7KOAUmC2xPas4RyjW1eOHvGhTX8FdSZ+gr+5OeD3d89Z/QF21UcLXuGrM6PrHUyhDsxx
 sUIaeh0wnaP8plH7hDpAxPTIDYL8UMPy8Xd7MSbSm5dXIzTIvg2bmRR/hJK2BToLgpn/gfTcs8v
 DI/0hUJL78eNyKqXgchKe4b+PvxtMl/+qLzn1bloC4NObWNOjQdtMAzU8r11+qKb9MQb+5bS9I6
 SDQBMEoSjAVVOx26BCkwvp23n8G3WazBK5b6fIs3qwz1FBA1wzJcYb15ZrocPyLtZTBx9R+BbBw
 mqfGpfuppOqwxcJdwWg==
X-Proofpoint-GUID: 8jDKaZWyNc8cFKJVcP31UOiBagFFBUoh
X-Authority-Analysis: v=2.4 cv=cefiaHDM c=1 sm=1 tr=0 ts=6a42687b cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=VwQbUJbxAAAA:8 a=ecjbvcZnrCEMvoAzKiMA:9 a=QEXdDO2ut3YA:10
 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: 8jDKaZWyNc8cFKJVcP31UOiBagFFBUoh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-29_03,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 suspectscore=0 clxscore=1011 priorityscore=1501 adultscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606290105

On 6/29/2026 11:38 AM, Guru Das Srinagesh wrote:
> Convert `use` imports to vertical layout for better readability and
> maintainability.
> 
> Signed-off-by: Guru Das Srinagesh <linux@gurudas.dev>
> ---
>   drivers/cpufreq/rcpufreq_dt.rs | 5 ++++-
>   1 file changed, 4 insertions(+), 1 deletion(-)
> 

Hi Guru Das,

> diff --git a/drivers/cpufreq/rcpufreq_dt.rs b/drivers/cpufreq/rcpufreq_dt.rs
> index 10106fa13095..6f83cf8955a6 100644
> --- a/drivers/cpufreq/rcpufreq_dt.rs
> +++ b/drivers/cpufreq/rcpufreq_dt.rs
> @@ -6,7 +6,10 @@
>       clk::Clk,
>       cpu, cpufreq,

The change seems reasonable according to the Rust coding guidelines:

https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git/tree/Documentation/rust/coding-guidelines.rst#n44

     "each item goes into its own line, and braces are used as soon as
      there is more than one item in a list."

If the preferred style is to place each imported item on its own line,
shouldn't imports such as

     cpu, cpufreq,

be formatted similarly as well? Have you run: "make LLVM=1 rustfmtcheck" 
on this change?

>       cpumask::CpumaskVar,
> -    device::{Core, Device},
> +    device::{
> +        Core,
> +        Device, //
> +    },
>       error::code::*,
>       macros::vtable,
>       module_platform_driver, of, opp, platform,

Likewise?

> 


-- 
Thx and BRs,
Zhongqiu Han
