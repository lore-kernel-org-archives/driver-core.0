Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794911673;
	b=yesZqVQ67SCvZzJvGD69Ax7Do+G0lOPmGzxyRGS0xJEiL6Kcc3j1pUa9qUChcbFcNW4b
	 5a4QY5nmYHlqXwCdn74y1O2n6Rs0YH0uG/NlNyKtDUIg0taTWrPBIr5f8TU29/dal/inz
	 GCHNALwiFRAQBZBSwj38nXgStOb2xAPuJao44L9e6oaxH3YOqxQYtgHgn+AdTkNI3ralb
	 SNQP/21yzyL192eNZLch2GXvXRa3ByREXto7Y6BLnUPc3DS42yvAmXl5IZ1w09HyNFu+b
	 pEXQKzDeF2DFdceVGebdW+KMjmjZjazkShYxdQF5MRYNFvqq4NBeiXc6vaOBTeGEbAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794911673;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=BmiLk7Woyt+5HnggThSiC1LBGvT5JbyN4EymqDd4Y40=;
	b=5DCn3CmoMirXBK9uOLBfSWBDY7jHwXqufLVgTjppV1sOeimDJqmnPOcjTN+P/JVobfgb
	 C/+1VrP3QS0bPgPCTnL2KAHrZSTEGKju8zfV+3Eto5coRlNd/bAjLxf9Xe5niC96gG61L
	 ZQDxw+vrHm2cp2EyL4q5jUj7HnEeaHnzF2CWSHrMmvUFKLnPu0Wn29cltoxMMK+2LCi/0
	 Bbuc7/gjStvWC8qFL6TnXZRqSISgxyzNqD5UEeMfcddVlQ97tNfHMUuJO+hJp27/KYslo
	 zHmOdXrAyQWFtVT9AGFf5tblsPnHH7RznK+s2xQrsHOdWumT9ESD34WB32/WIfhE7Ug==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z6wY9VQb;
	arc=none smtp.remote-ip=74.125.82.41
Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D90BA606A329
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 10:34:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D90BA606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=z6wY9VQb
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-1b24f4b15c4so209041c88.1
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 02:34:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1794911670; x=1795516470; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BmiLk7Woyt+5HnggThSiC1LBGvT5JbyN4EymqDd4Y40=;
        b=z6wY9VQb9tStXEiH1QFbesFMr3wGuML/0/URcnE+UX+oLQvDgGGtmrhtXp5h7funMx
         emnmsUlmcXpT4zldRo1DeW9bR61YafPdPMwgsejbFIwtApkQqfeOY/+lpNFllXdEns3y
         igdOSpJkSWXX5gwQlMVK7v7YZfnGkm8tfE+IA1f+mCWwfdx9SdI8c0/cVl5/KFRMQRIG
         bVLMZwCnnw0MRZ3wUJF51n272nzt/X8rvLI0NQznqWVNSnq6vKDG6xuGRDLRliEqpCyf
         ey6Qu4Fxska/IFzl6cSFMWoYOVa9coJE8Ov8OpSOQmDCf/7BchAgtTShouidH6Gpwc0U
         Ec8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794911670; x=1795516470;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BmiLk7Woyt+5HnggThSiC1LBGvT5JbyN4EymqDd4Y40=;
        b=tuualdrdwQTVRLJJKgUTjKF1N8QBYvCxUaxVu9lPK0qfhZmUVTcoOc+iBc+bz/Bf78
         ohcEL4yg4d3cZRFD44Ak9WsExFqAG5FphVEAlPmfCa3zzk6068xqZ5c3/pvPulW0BFyH
         qfKCPA6BVU3g6FAEDz/qThYmIYNeSn+vcLrXIXVITOlYjdjWXl0RTws463MwKcXUPcff
         I9viDxh9DlKq6jkj9Y/3UpHki6u099maxY6JR/e2KTREcyQ8yBIFM64zc7sthFbu8CDp
         i8DbQAGIbr+M6kcptLdXOkXb4looGOEBnkfZurE5mz7bAkYQbtPrj/iy1wWIEGml0Trt
         t/iQ==
X-Forwarded-Encrypted: i=1; AL+hErFXcjQ5sx/WZcKkzH4dmm1EmkXk8QUsgpx5j+OL3+9DSFBK2FQoVI40GT2PpwiCoCyPo6Q1PmRuhl8rLg==@lists.linux.dev
X-Gm-Message-State: APuU4Z8MRwvUEZ893iQcoBy5SmJ7eY+0ydOfqhD+1lwldUOdbRZnbWGC
	zHaGcQ0Ag4ZLOOgWsSi+HKA0JovenfyCv3b5bjMKUTvCMlUlGNfRQhOqxoZeH0H9YHg=
X-Gm-Gg: AYBFou2lMbPAZjONZ0TjeQUDCL35aUC6P3yPsIOFK8c/WrAQfyuEcCiYV+QE0D1S1qP
	Q6njkM8IRH8N6apUAkfnF357SI076I47XIbuHH6OggDOoKz7kvU8r6f0QpiGG//Yty+bzQT7WLi
	VzIsfIx3zXXrUfUbUZTrzZJJfzIi21DmQ53OGnjQcH1ep3/OIDXoVVQfNWdqdkDUa/1WbGM4BC1
	QcKNkwgpBhMgdCvmEuLEOcl56iegsWCB/V2s8RZyd+/ItqzHRBnMfcOTaYvj3ywYkibygI+eXDa
	v8cUZBFw4r1SHCI9dJOVEvJKqVWSo8AJOkxV/3QazJE3fiLt+4qpBiW4o7J7vKeLddmsL52TJiM
	M9J9zBg6Zmpp7AG5noxI1ZbCb7FA9z66VG9ntqbcuHsg8ZMsWXjBMOo3WsUDUNJPdiNrqn2qJLJ
	NSrTYULHHk3sFxfRsGCAtkJGkHC4dP1HhszcolN9vTPKc+xYDCFE8Gju5zzzzq955NGO8xL5riu
	8DTFw+cszBXa5jq2SWPAuxx2PHE6XoQ8Q1Y7yiWdqurrljM/aYeMq0HFKYW9HS+mUgyhHo30ueb
	lTfbBjnamUa6hJ/sgdzGsbDxIjBmeQ==
X-Received: by 2002:a05:7022:b052:10b0:1b1:f02b:2317 with SMTP id a92af1059eb24-1b53a4758b9mr1979699c88.22.1794911669662;
        Tue, 17 Nov 2026 02:34:29 -0800 (PST)
Received: from localhost ([122.172.83.36])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5031b2519sm36212362c88.13.2026.11.17.02.34.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:34:28 -0800 (PST)
Date: Tue, 17 Nov 2026 16:04:26 +0530
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
Message-ID: <avwtsmp7Mqacbbtl@vireshk-B250M-D3H>
References: <20260929-schedutil-boost-frequency-handling-v3-0-68de169498c7@oss.qualcomm.com>
 <20260929-schedutil-boost-frequency-handling-v3-2-68de169498c7@oss.qualcomm.com>
 <auhMD2-5FD4BqImG@vireshk-B250M-D3H>
 <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>
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
In-Reply-To: <avRiWsxCEAuBouBZ@hu-anancv-blr.qualcomm.com>

On 11-11-26, 18:10, Ananthu C V wrote:
> diff --git a/drivers/cpufreq/freq_table.c b/drivers/cpufreq/freq_table.c
> index ea994647abc8..5b364d8da4f9 100644
> --- a/drivers/cpufreq/freq_table.c
> +++ b/drivers/cpufreq/freq_table.c
> @@ -49,15 +49,16 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
>                         max_freq = freq;
>         }
> 
> -       policy->cpuinfo.min_freq = min_freq;
> +       policy->min = policy->cpuinfo.min_freq = min_freq;
> +       policy->max = max_freq;
>         /*
>          * If the driver has set its own cpuinfo.max_freq above max_freq, leave
>          * it as is.
>          */
>         if (policy->cpuinfo.max_freq < max_freq)
> -               policy->cpuinfo.max_freq = max_freq;
> +               policy->max = policy->cpuinfo.max_freq = max_freq;
> 
> -       if (min_freq == ~0)
> +       if (policy->min == ~0)
>                 return -EINVAL;
>         else
>                 return 0;
> 
> I am pretty sure we can maintain the policy->min status quo and only touch the
> policy->max updation; which from a passing glance simply seems inconsequential.
> Potential side effects, if any, aside, this would at least fix the issue at
> hand, which is the frequency getting stuck on a higher value without being able
> to come down. What do you think about this?

So a change like this also fixes the issue ?

@@ -49,15 +49,16 @@ int cpufreq_frequency_table_cpuinfo(struct cpufreq_policy *policy)
                        max_freq = freq;
        }

        policy->cpuinfo.min_freq = min_freq;
+       policy->max = max_freq;
        /*
         * If the driver has set its own cpuinfo.max_freq above max_freq, leave
         * it as is.
         */
        if (policy->cpuinfo.max_freq < max_freq)
-               policy->cpuinfo.max_freq = max_freq;
+               policy->max = policy->cpuinfo.max_freq = max_freq;

Also, can you please explain the issue again in detail. I am not very
sure how you are reaching to this issue over current mainline (without
the first patch).

-- 
viresh
