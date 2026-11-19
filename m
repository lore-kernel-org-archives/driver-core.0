Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795063762;
	b=tspYtJkaIRz0P+TV8QkiTUev9xVxXS32XqA5C1FFMvuDExzjFCCG9RGhGoQDiPkmyZeL
	 ULD+HvoY6SzM1CFagV4gaoRMAUWFYc+jSmUZB3gK7PmTtwLrornssj1m8nuSEaFFyYXqz
	 SoKxoSpTN8jKnHpTYxk/gEQnef2tkI1/wOOKG79GrRHc00UYmom0s8tlHZy1kCUApxg4P
	 snDdj9g/NvqY4IVRjzA55xwyBIVSddsHm2slYxLdxyM6ChLYICjI4liKkv8OVaz9I+q/z
	 uNZu3ojNkzhfBJAtxM2SKdQWFqL20SHIRVFaYA8L9MMxu7TxdKYgH+bEhKUhB81ypUA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795063762;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Wm21ueq0I/1G2UOkIkQFO3tHFpTVrQyEUMIC6/qAqE0=;
	b=JtuHjMv/TpWoi4ggg982frV4sl4vndXoRZSuLQYzp5cTj3GNZIi/DpYCA5DDftwyk1Zt
	 bQy6S1SZhV8o8Hr3/lzuk7xG6ncVHDv3h8CP9mnS9QN88Y1Juen3dO5k/wQJW6MYIKKnz
	 HwLBJUNZTWe75b7qkpkfDO/PeL7FKScCTTW5AF+CRm7GCloYf58uz3IdeJ6XEwT/OUpER
	 3RAaK1dH633ITlNaqfLhTZcBPybxIcE0oV/8JdU0iewTSw+pl1tPfu2Y9IWPcZdzB5jYt
	 Wx81Fw2RZ8T8i656Z2vhYSP7juQSLxOfpfMONBnO/b6D2V0Dgk5NElY/OiCUs0MfCaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aFnlvrk3;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2BC5606A32A
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 04:49:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F2BC5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=aFnlvrk3
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-38431138772so539497eec.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 20:49:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1795063761; x=1795668561; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Wm21ueq0I/1G2UOkIkQFO3tHFpTVrQyEUMIC6/qAqE0=;
        b=aFnlvrk3M3coQmDExZaGDUm8+dvA7vgGNZKeXm16sP6QAQ0jSeukvpur8fjWu0KzOf
         sad0okLfoQmTlmg8Mgb/hBKfbLXg62YHol4akV0pvOlkw8/anm6exI2VrkYG0dcBrzjo
         82YrpfxzW/zvpnfGvfTOdB9Fo/9EEhRCQCbfRq0jDjZwpg6WNRVKz+/cShGinl+CzQt4
         RGXoTr5yNlP+dKvFRkOLNEQ4t0aMIt2HOXT5Wp1Zs0qts4Z7De223bD0AegMBn/masMt
         pEnj1lkX8/i2Oe6QalZRwDVOYQmjAe/jg6+syNK0IH2LiK0is09GKBfnx9PndMOySB7U
         yCbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795063761; x=1795668561;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Wm21ueq0I/1G2UOkIkQFO3tHFpTVrQyEUMIC6/qAqE0=;
        b=oMGP5DqeIreQXZBAS3DU/3wclAwCeuSXCOlWAiUuY9oqV8v7CBprzN42DCYnxVq1iG
         IUIaC0FV8XKsFPOCjhKEgfWERzvercbxQukSUo32d0JVRd6DyxkrzqLefWVf49LLMPTQ
         9lZBPjKvfac4YK6PH1QOwhRoMsQe9M3ljwUKL98JNrWpEMciuTR2lz1ZcJSQLdXtSvN1
         v0vmkzS7Fw/XTUko827GQdKRLnFSlPcl8HWb31Vi3bi/esI2ti31qJZmlfJjIQA0vZc7
         8zE8+W40VEDiz3Q5uH0rEi6XSd9Ig8g+6Xs625S0CzVHKfIP8tS85EMnjLalVWICITVn
         Buaw==
X-Forwarded-Encrypted: i=1; AL+hErGS68aKikJCb110o4kypJoey+ieQAtsyJAqu5a/Qr/Dyrzhrb+NhwtOJ6xisRPQquHygv9Cu8oVX+Lu4Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8OovPVHiN6TwEF3iD+jFyTe98xVlWNxfqtpkNQdyUrOnNXAax+
	Znv34WXCBAYDimNq6rege4JbDH6/uUMF6RoUkvADMN9Af7m+RNrp3s+VOLjLuau9pq8=
X-Gm-Gg: AZFdTZc0RdChFz5pErPfdTszT8rLed9ZCTVNHjPWYwirG5LFr9LBHvaiAxROqsIjbI2
	6foV0rNw2Z+/EjenW7/4VoKMs+9zg06/ZO3SCkZhm9EIl2bhmtmtDiuhcoM3wajundRiXNBmEfR
	Oikyble1OJizvPZfGxzQ99V+i1ZdiPRnjrxWQCSt2oivKUuWzUsaXnR+c/nG5PRYHHbVJHO+gfz
	Z0hjllr9SwOyxnBNHFMSoQwU/GM1olWFFbQux9zgMHbMsanbILPy9kDaAEx+Mn5t0B5Un5xDpgH
	xj5UJPB+5VCLSORKJxg4BrLCdR/JYA+vOZ10dO8y0wCdRJ1s7RnzfLPmcUFlQnYqTNOAU7uOng0
	H17+tCdNS/j2D8CDih7eG9qntRAiCq+JoheXXjwEa/ixKHJ2nFkEDbmfCZEgzs7ytvwMpwRogvv
	G79D/oe4fUSTRXTBUMrf4KbcMz4ecr4pi7ixYDFB75zg3uVBAFYYs7z+rAfR5IzQs6MfNhPHK2k
	sUdO7oUcQDH1nVPcG2aZsNEq9Ap4ojqx9i/2WDgdfeKwnprWIFJrOn92eX3K8psq8rAmiyUXVFL
	g0Tq6091sfc/9W5k0M89ihbUROA3Zw==
X-Received: by 2002:a05:693c:409a:b0:36a:1bac:6bf4 with SMTP id 5a478bee46e88-38280c2fdd6mr4896083eec.18.1795063760196;
        Wed, 18 Nov 2026 20:49:20 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-382a45260a8sm22522996eec.3.2026.11.18.20.49.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 20:49:19 -0800 (PST)
Date: Thu, 19 Nov 2026 10:19:16 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Pierre Gondois <pierre.gondois@arm.com>,
	Ananthu C V <ananthu.cv@oss.qualcomm.com>
Cc: Vincent Guittot <vincent.guittot@linaro.org>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Jie Zhan <zhanjie9@hisilicon.com>, linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev, linux-pm@vger.kernel.org,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Oleg Keri <okerixx@gmail.com>
Subject: Re: [PATCH v3 2/2] cpufreq: fix policy max not returning to
 non-boost freq on boost disable
Message-ID: <av5_zDI4bg28H_6e@vireshk-B250M-D3H>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
 <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
 <avwtsmp7Mqacbbtl@vireshk-B250M-D3H>
 <av2aFWw3kh11U68A@hu-anancv-blr.qualcomm.com>
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
In-Reply-To: <av2aFWw3kh11U68A@hu-anancv-blr.qualcomm.com>

On 18-11-26, 17:59, Ananthu C V wrote:
> This does fix the issue of policy->max not being able to drop down back
> to non-boost values after boost disable, but I found another caveat.
> 
> The commit 8c83947c5dbb added the following change a few months ago;
> 
>  static int cpufreq_policy_init_qos(struct cpufreq_policy *policy)
>  {
> +       unsigned int min_freq, max_freq;
>         int ret;
> 
> +       /* Use policy->min/max set by the driver as QoS requests. */
> +       min_freq = max(FREQ_QOS_MIN_DEFAULT_VALUE, policy->min);
> +       if (policy->max)
> +               max_freq = min(FREQ_QOS_MAX_DEFAULT_VALUE, policy->max);
> +       else
> +               max_freq = FREQ_QOS_MAX_DEFAULT_VALUE;
> 
> this max_freq is then subsequently used to update max_freq_req constraint
> for the policy. This means, assigning a value to policy max in freq table
> directly will cause the same to be kept as the max_freq_req, which if
> boost is not enabled will be stuck at a non-boost value. The boost will
> still work, as policy max is set directly, but the value will be above
> the allowed qos max;
> 
> # echo 1 > ../boost 
> cpufreq: cpufreq: policy12 boost=1 policy->max=4723200 qos_max=4454400
> cpufreq: cpufreq: policy6 boost=1 policy->max=4723200 qos_max=4454400
> 
> This also means if at any later point any limit refresh happens, the
> value will be brought back to that qos max, which is a non-boost value,
> even when boost is enabled;
> 
> (e.g. here with a refresh_frequency_limits(policy); call after the boost)
> 
> # echo 1 > ../boost 
> cpufreq: cpufreq: policy12 boost=1 policy->max=4454400 qos_max=4454400
> cpufreq: cpufreq: policy6 boost=1 policy->max=4454400 qos_max=4454400
> 
> tldr; is that it will fix the issue of the freq not dropping down from
> boost, but it will introduce a new potential problem of boost state
> potentially dropping back to non-boost freq while still in boost.
> 
> So this alone can't be a fix at the very least. At the bare minimum it
> will need update to how max_freq_req is calculated/updated, etc. If
> nobody assigns values to policy->max before cpufreq_policy_init_qos
> is called, max_freq_req can simply use FREQ_QOS_MAX_DEFAULT_VALUE,
> which is S32_MAX, as its value, and not cause this problem, so the
> solution proposed in the current series will not run into this.
> 
> > Also, can you please explain the issue again in detail. I am not very
> > sure how you are reaching to this issue over current mainline (without
> > the first patch).
> 
> There are two issues the series is trying to address;
> 1. freq can go upto boost values, but they cannot be actually used
> 2. once a policy is using a boost value, that value cannot go back to a
>    non boost value.
> 
> So with or without patch 1, which addresses the first issue, the freq
> can still go to boost values, which can trigger the second issue. The
> logs relevant to the second issue, reusing from the cover letter, is;
> 
> \# cd /sys/devices/system/cpu/cpufreq/
> \# ls
> boost  policy0  policy12  policy6
> \# cat boost
> 0
> \# cat policy6/scaling_max_freq
> 4454400
> \# echo 1 > boost
> \# cat policy6/scaling_max_freq
> 4723200
> \# echo 0 > boost
> \# cat policy6/scaling_max_freq
> 472320
> 
> The reason why this is happening is;
> 
> from freq_table.c:
> 
> if (policy->cpuinfo.max_freq < max_freq)
>     policy->cpuinfo.max_freq = max_freq;
> 
> and from cpufreq.c:
> 
> freq_qos_update_request(&policy->boost_freq_req, policy->cpuinfo.max_freq);
> 
> so cpuinfo.max_freq is only updated upwards, and that value is used to update
> boost_freq_req, which is a FREQ_QOS_MAX request. On boost enable and disable
> the cpuinfo.max_freq value stuck at the top will be used to update the qos
> max, and the value never comes down.

Pierre, any inputs ?

-- 
viresh
