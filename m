Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794694925;
	b=uSK4asxOmVOTv6Bk/6XaFM1xo+bc1RpzT1zcyztbLTacUysz5iSCVOGHgj6kWDUsXraW
	 mtBoR2j0MdnGJbt0Qvjd2Qw9qHXyZFl8qYrfKQn/HowCUovxMSNzPEbnodvY5EH2hXWo2
	 b60oqds6HH2YPZ7tANaseThiF+EnNH6WbAObKwLrpUvYzsQACL9Wl5zHtrmyeV3dijID1
	 oLB0w09zcxEc3X4ILZeVMKDgTs/AV1OYwLT0cBxUZOasBetwwK4q3Y8YZGKqJrpK8hGc5
	 9ijdHKp9G943rCwg3GXr78shsK/2Rnl3ghpoAZxHMeXt0ax87B6rzXRiHaFqfQTCiBg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794694925;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=iWHBYSDDRbBFmboyivmyPuuxpV2Imqwe1ws4K2s/aOg=;
	b=5AP4SZKhD7Quw3YZJn4wlZLhjq8Zlg5PquPvrw/YwB/xcyJN2V57hS5CBoVKHLTZL0yj
	 IOq/NwLmUNhycVFwgKqs2IqMsFQIhBiovAEc9Wv4p3TE9IZlCdS4ze9PmeD91GsP3fgMw
	 WuCkIZrOhtBhMkx0SLihQiH7uFomWRi/IQ5okcGRRTh4WyulJ50JxFVVIigyEPeMtqOnO
	 svLNfxhZ873M+e183EKJNxSs07fpa6/pj7AEPoIOgADJnOtvo/c6B46V3jZJV48BEfD4M
	 I/qBObx+prbC5MEm6I59AafLDpaPGyyAan1mwzNxeRDf4NikXCOK0ClgEokcT0P22LQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ENxpmRKD;
	arc=none smtp.remote-ip=74.125.82.178
Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E86D1606A331
	for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 22:22:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E86D1606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=ENxpmRKD
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-36f8cdd30beso2603662eec.1
        for <driver-core@lists.linux.dev>; Sat, 14 Nov 2026 14:22:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794694924; x=1795299724; darn=lists.linux.dev;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iWHBYSDDRbBFmboyivmyPuuxpV2Imqwe1ws4K2s/aOg=;
        b=ENxpmRKDHSVqJ8SXTV6TD/W9SYEJkARM4Pw5yfTX+o2bJO6MiwDFM6YVWOM8tZQh/A
         esDXVeOcdkLfppV3nsj6Tqa2xwHz6ZDVO4xmFar5xgbRYcDA33PKvn1PoR+1l+ayStgf
         wy3tl5Ty8d0JsjJ42q6FRXT1QuqH5NGyPWpZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794694924; x=1795299724;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iWHBYSDDRbBFmboyivmyPuuxpV2Imqwe1ws4K2s/aOg=;
        b=Mt6PhNKHn6lwMG1gvQgxJI2IHq2mKDz5pO7gMRCdokOn7JKDXjLUzdEQih01ubKvZ8
         DAZFHNmZ91bUcznRZ4ewqZ2Ha2D/5S3CVGcevjyKyOc6K5A/TYITmT9puE6tWqsyoWyt
         GEBcfnVKmhJ3rIaPNWqj58X0Le6JU8dO6EsnOK/IGy+V4bmwi6UxmbF9ErhdD8iqIJQC
         StRpj/cufRN08hR2izdjX804+pJmFVVlThuh1GN7wTPfILUXCH3SzbcZ5kofOQd2z4Ai
         sVsvBPap0L5JOo45sDVDK4HZ9E72+tjanheQ/UJXWocrrc2rP6FLFCIHUTpfQ2wrglYb
         F2RA==
X-Forwarded-Encrypted: i=1; AL+hErHQ/V9SdO8/VLcsSVLHyaF/vursspZgPGAGE3BGEwnjbSEDCe6sozJGsuh3xQOZHVeCrZ5XLKPu5jFCxg==@lists.linux.dev
X-Gm-Message-State: APuU4Z9R5bCsPQuxGSVuxBuLZqdPCjVIO1zqdAONamk5H8MnmSeGyS5G
	IwkimORuZbIPKIj5XjyciVydAlPPKorBwGTUFJGdmF97uJiYfMx0XyNfKsSxkNslD/o=
X-Gm-Gg: AYBFou0e4re5rFmYKkAjrped3twJX3y/lDFwMUNMbKogxFW9bNoI2WiyFBYLGyDsMQ5
	sOzynKfB7qm3H3vbI0JlhBsbe/DMPOBjiL3pNQAUUc5CkCajiQPRgKay/L925vjlJL5WdvMdOey
	9hdgHqRP9SfJuUZhmgdNUVYhCYiyNrMHebVadIuNo3+60QoH02PJCOS92ih1+VAd8kPJnF8pNHh
	n2ydtChnHEJ3/GsxE3V3r24NIWxyjBbRpk4snZnGFFfpy5KYxTpsQ0xEfNzqT7Ils6ZVEtbDkC/
	gx+wtu4hfzjoaXnfAtYvbyFvACc9Lpz5q7Ic2PB/1zKHD0BvsKqnEkVjkPL7N7my1fRHDmZNyBA
	H1tpi3C09npU+NkJtR/dC+j3RoIW6JOruHOrJ1YO8ctelmOGcW4Ip4k18K7yShDXcNjDiUPewaS
	kukzI/iqTEyvZtbm0Jn4lkGP6wsow1UrQOupycOq/64Sn1upjVj9GbFT9qRM7C88FqVriATv7B+
	450va7quWT6tk8hAopgPb2+wSkC+tzk4ceBy+hyN4tLy6dXEYe2f64KZSx7aWoOVLrdG+dq9ng3
	s4rn2k6XH+Dfapv2GKdFhwL5sQh0fXIdEKaLB0IGWmOSaIFHlXuQUi0epymvq4tD4PYuMiFrOig
	plroW1eqUjwrXGiwGzbvwMlBRWb1kiLK8Mmh2/U28/s3sxxGkD9Lv20qeTtBHoeFW03gDIKwH9R
	xCsIAnF5v4OTGfNWOJkrV+4wofJOWK2dslOmyfkj9zEDEi8i75EY/XIWnX1BHlp323Gut65Elma
	/c/nLfXh4M=
X-Received: by 2002:a05:7301:4604:b0:376:703c:8819 with SMTP id 5a478bee46e88-379681c6998mr7125048eec.38.1794694923819;
        Sat, 14 Nov 2026 14:22:03 -0800 (PST)
Received: from [172.18.0.3] ([164.86.38.205])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379569b8389sm33509247eec.25.2026.11.14.14.21.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 14:22:02 -0800 (PST)
Date: Sat, 14 Nov 2026 14:21:37 -0800
From: Chris Down <chris@chrisdown.name>
To: Tejun Heo <tj@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Johannes Weiner <hannes@cmpxchg.org>,
	=?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>,
	Serge Hallyn <serge.hallyn@ubuntu.com>, driver-core@lists.linux.dev,
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH] kernfs: Build paths in linear time with respect to depth
In-Reply-To: <91fa9a5de005245ed3c1bde305fc6778@kernel.org>
References: <au_pnu4s141ylqHD@chrisdown.name>
	<91fa9a5de005245ed3c1bde305fc6778@kernel.org>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261114142137.ecf5e6af6608b218@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Tejun,

Thanks for taking a look!

Tejun Heo writes:
>I don't think a 15,000 deep cgroup chain makes much sense as a use case.
>A lot of other stuff in the controllers will break down at five-digit
>depths, and quadratic isn't that expensive when the base number is
>small. Did you see this overhead in more realistic scenarios?

Agreed that nobody should be building anything like that on purpose, and
at the depths people actually use there isn't much in it. Here's the
median read of /proc/self/cgroup in a 4 CPU VM, with single character
names:

     depth    before    after
     4        304ns     258ns
     16       549ns     396ns
     64       2.8us     1.0us
     256      69us      4.2us
     1024     2.5ms     20us
     2046     12.0ms    43us

What bothers me more is that whoever picks the depth isn't the one who is
affected by it. cgroup.max.depth defaults to max, so anyone with a
delegated subtree can make a deep chain. Every read of /proc/<pid>/cgroup
for a task at the bottom of it then takes that long with css_set_lock held
and IRQs off. It doesn't take five digits for that to become problematic,
either. Here's the median fork() + exit on another CPU of the same VM
while one task does that in a loop:

     depth of reader    before    after
     (no reader)        51us      52us
     64                 56us      53us
     256                363us     60us
     1024               5.0ms     93us
     2046               21.9ms    117us

(In case you're wondering why 2046, that's about as deep as you can go
without brushing up against PATH_MAX.)

You're right that other things break down at depths like 15,000. Just
creating that chain takes minutes. But that only slows down whoever
creates it. This slows down fork and exit for everyone else.

>Even if it is worth doing, the implementation looks too convoluted. Most
>of the complication seems to come from supporting wrapping to keep the
>head of an overlong path. The only callers that care about what the
>buffer holds on overflow are debug outputs. How about changing the
>contract so that on overflow the buffer keeps the tail end of the path
>instead of the head, which is more useful anyway, and the function
>returns -E2BIG rather than the length?

Yeah, that's a lot nicer, thanks.

The one caller I found which relies on the start of the path being kept is
SEQ_printf_task_group_path() in sched/debug. Its fallback buffer appends
"..." when the path fills it, which will now be on the wrong side. That
code is moving to sched.h in tip at the moment, so I'll send the fix for
it there separately, rather than have the two conflict in -next.

Based on what you said, in v2 I'll also drop Fixes: and Cc: stable, since
this is now a change in behaviour rather than only a speedup.

Thanks!

Chris
