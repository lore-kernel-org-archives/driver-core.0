Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793608725;
	b=rKkvgyx7vqvGrmjHCUAJk144dMR0FCz2VRqcAvIf89CWk1gcx6Baeg5ftnuFaeKLM1lm
	 bje8EJtVPowpp9b/Me0eH97/BeRd1vScUOMVuaI2wUBeDOfHd3hEQg7r/XU43NWWrxTmw
	 hrCtgmBxryYy2c11whqEl70qMM/Wcfd/eIPPBLHIjVdJhdNxuZEPb9gARRb9xBDPuPjcm
	 sGPD7XqVsiDv68xA3LfzZXJ5BCTrtZKE/WdPtSHBobkxLLMzvtPtukvcYUwGcPxrbRFqB
	 zjtlkkrif9Wby1HS6urYijGfJh2cvQExzYi9Lqe9DAdZvR5RsEtkX8LbMjBpkwnIibw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793608725;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=ALAVVcLX8MYIjdcNV1urspiVK2AVDCX+KdL/tArgC58=;
	b=EH3aqww/tYl8CTpFUTArnqOKAXr/9vIu3kHVE2JNRWPrsSzmFrKYm/kiz7pz6IFQf2YK
	 GdY6G+sH+IW6wLHeMCdUgfZ1DVphLPbIbri/iCcx3DNoasjXpYkdB3RMEtdvSOdZv6AXX
	 u8WFzEJ6lORa8aUcSQZ1rYSoKOyXGefhTHBjj/aRbKXPigj3nKh/R74rUYGtkQxRK4eRM
	 Uv0NWu6Pf7qd9Pf9djTUqRDg3qLCWMQtKaG/V9b6cizQONSEhUrEFuQSuhacLt9L9oqCo
	 FLn36om3GyxovFTi4TFQFQaGjad+ugAZs6EFMiHZIo/4UHuYDEdi1d+hMNjlhv4oVmQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NykM6X5r;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC24606A331
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 08:38:44 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3BC24606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=NykM6X5r
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-3550c917fd3so3776765eec.0
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 00:38:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793608723; x=1794213523; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ALAVVcLX8MYIjdcNV1urspiVK2AVDCX+KdL/tArgC58=;
        b=NykM6X5rsU2ULqrMfVx0miPUm8OuLMlSrQ9jHNWXPn9WvUgCpKYSm8fF/q16vPwkwA
         kwrqd1SjPIWp5oX6CL1YAKbctzhRTcYKKdXwx4u6yhIUzYDRuGnbWH9TSXcyeVEQNUlZ
         Yqi1rqnAEv6eG4+S/p+nNIlKitOBDiTOeZ6+CyczQtNH/RZGzh1p84u2LEnRtN19bsdE
         +P9WA0rl4tetpMbmRJ2VhCQOpRq7RFF8RGqExJ6hCsVFpTGphjIMdNCChUKCkXIdplbH
         t0NSZc+yVN0M2dIQyKjI0sWqByVPuL5xPLUbYlVuiBEkrQEmgtp/SP1J+q48VREuEZkH
         5ORA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793608723; x=1794213523;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ALAVVcLX8MYIjdcNV1urspiVK2AVDCX+KdL/tArgC58=;
        b=hQ4PS5yHIqrDtLlRXPIeiDOTqVCafkzhMwKmK0aAEzO0JiPGALjMZyMSkSjWW86Htu
         l/rVMa1dFQFCAutrNpQBAhvBeBLsd9m2WRFTMCokn3pI93Lvx3bISX72DXQHN0PBGPQY
         ooArn76ct3DZxSfFQp5fzlr1Ybd0tD5t7GvmHPRU8Zpo70o0dGMPLwKHJ/1kbU1USJev
         eVudP3JhyyTLDN5QmO3njZlYWK/Kq1v0kgeyStPCbyGEKOEN7SCk9DzuBosKacEYTzXx
         yqpoj4Ee0aUjpHseuM1QaH7Ne2Wqs9xXvRNlyn8j+FBird+ZBz4P0zVZBQBB/KMn2DIF
         27Jw==
X-Forwarded-Encrypted: i=1; AKwUvBx3CcQKB6f+W3iCZIdwktYY2oo6cA0Kr1TkyLv6SuP3TADTW+LCF2wzznGdxB+/HJFCVkbjup3qhn+Vew==@lists.linux.dev
X-Gm-Message-State: APuU4Z/eQl0wwT8u7sdM+mm6iLNqsx75E1lbplfFZzjYpIl8IqKdIOw1
	K1lhBjnQ9e0+jdvxkuxz9E6qmBlKIUS83LGYykyff+KgQYPCwp4vOpZtXtBKMK9ry2A=
X-Gm-Gg: AYBFou3efaVpddsRzqWcuzTgIUKq+KzMJPn4tTZg+xHbXWyobQF1xP5IJ1mipG9RFQL
	nW5o/lsEBj2x84UGYlk6yrBLl9aneccp9R1WhgrnSKt5Ft/VTkThbFvRylvJ5pqlfvFE6HRxmcg
	5p/OW8KaF84Vyb3QLMyRP/n9LVMlEkuc/jK4Rrcnvh2/B/0u9HIkeWTTXkVyxP/qnt3A98PCswu
	GhonZjMZyeU8/7Z0pbt2/6zJqtE7i+XoH0tfidXoBbC6+LaQBCHEKn+zwfFJSOwwbKbqmzbtWEZ
	8qCSBgUQvqIFnci4tGduOngJbtqMSMIyW7xRMuV0iHBtuhjHR0SOJAkIKQ8myxh13s9cfrL0WqR
	YazpRaXu7hOGA5g2N9bCCh4Khdn8G6bMZXVOsGvyZoVfVh7QzsIAjHAv3yErNeok+uVYJ8Q2AVU
	JfTbEQgRRKcBI0Dff2BvOms3lDliUJX6FJbZcD6F0NJfEww8Y9nsD0OFuL5pqjAg9d2kd7+0CcO
	KeVvlIcvT7qPqhv4RhBAyPi77oAVy4gtsmJvZ6KcQrpZrRGeyGNnu7PFR9s7YcqtXOcH6Q1BWxq
	Na3kQw8wmx/CfrCxikQl7GEba+G08Mk=
X-Received: by 2002:a05:7300:e9c5:10b0:367:3d68:8480 with SMTP id 5a478bee46e88-36a4206d82emr15498311eec.0.1793608722988;
        Mon, 02 Nov 2026 00:38:42 -0800 (PST)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a42669128sm37714488eec.3.2026.11.02.00.38.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 00:38:42 -0800 (PST)
Date: Mon, 2 Nov 2026 14:08:39 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jie Zhan <zhanjie9@hisilicon.com>,
	Pierre Gondois <pierre.gondois@arm.com>,
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev,
	linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
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
In-Reply-To: <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>

Hi,

On 29-09-26, 17:08, Ananthu C V wrote:
> Commit 538b0188da46 ("cpufreq: ACPI: Set cpuinfo.max_freq directly if
> max boost is known") introduced a guard for cpuinfo max updates to only
> increase, to preserve driver-set values above the freq table maximum.
> Later commit db80ad776cd2 ("cpufreq: Remove driver default policy->min/max
> init") dropped the 'policy->max = max_freq' assignment from
> cpufreq_frequency_table_cpuinfo, leaving that one-way-guard to be the only
> path for cpuinfo max and consequently policy max to be updated, causing
> both values to be stuck at boost frequency even when boost is disabled.
> 
> Unconditionally track the highest non-boost frequency (max_base_freq)
> in the freq table. If boost frequencies are available, use the highest
> frequency from the table/max_base_freq instead of cpuinfo->max_freq to
> control boost values, so the value can decrease again when boost is
> disabled.

If this is a fix, it should be submitted separately so we can get this merged
independently.

> Fixes: db80ad776cd2 ("cpufreq: Remove driver default policy->min/max init")

I am not able to understand the current problem though. I see from the sequence
of events mentioned in your cover-letter that scaling_max_freq doesn't return
back, but why ?

And does a simple revert of the above commit (just freq_table.c) fixes it ?

> Signed-off-by: Ananthu C V <ananthu.cv@oss.qualcomm.com>
> ---
>  drivers/cpufreq/cpufreq.c    | 16 +++++++++++++++-
>  drivers/cpufreq/freq_table.c |  9 ++++++++-
>  include/linux/cpufreq.h      |  3 +++
>  3 files changed, 26 insertions(+), 2 deletions(-)

-- 
viresh
