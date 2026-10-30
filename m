Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.177
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793333155;
	b=bbXJZrN8naT0Xl6Fulpntno3vbH/dqW1P/BNQVcG76jayGyVv5Vks9YNGtgPPqGj8Sog
	 ALsiIA3uEKa9nJ9wY3hDGV+DbV6A/ILU0q2Gipymt+g3Q42rk3QHnVIV/XRD8PMdMxMR4
	 NNYnhWiSQqDWOxrSgY9W2gnTLxSMMCQFnrnZch/6YDIU66zPIJNNGWhNbnjkn+tgOlGIT
	 Z6sFGraCMSM/g001UVx26SCAW5HtXK5JPi2fuT7eZkY8MQcAm5zjwt/3dKMl+KJRhJIm/
	 IrcdkhuilfDtlH8gBXrfuJX4zHVcQbWVnS8dhr/r/XpxAKI/NlJGJbsuZSQGTS/LRAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793333155;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
	b=ISvVulG20RVQNwo5aR5qO58Nu/8mFcCtqvRw6Ngu2BILeyq6cGLDu+wqaW8W9vTNFXVe
	 kRXrs3jjw2HqwdOke5I4Phs/rrEx4euKCxP4dKtpMaZ3rHAf/Fl/00zrSgtDJQHIzmA0Y
	 kgw4xS4ktm2MqB+RtWOaGUHGSnu2LEgl2r2q13kc5OD6b2aG9/aVMFFVW0H+4q3KHzCh6
	 EVGXYF2z6t9u0Ug4CYqaPL1gp1Je/M227y5D8uM3z2C6XCSRSxfMePXIiRAZZgQZzDBOR
	 UUXpmBGL6Ef1JzpvQg6c3/PnQxyFATybdzQ/TGzfzfN28kiINwHKRBV12omCwTRGWjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linaro.org;
	spf=pass smtp.mailfrom=linaro.org;
	dkim=pass header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pNcRgMIZ;
	arc=none smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986C7606A324
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 04:05:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 986C7606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=linaro.org header.i=@linaro.org header.a=rsa-sha256 header.s=google header.b=pNcRgMIZ
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-3514b90bb89so632139eec.1
        for <driver-core@lists.linux.dev>; Thu, 29 Oct 2026 21:05:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1793333154; x=1793937954; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=pNcRgMIZIY2oZG+KBCWHOETi9ENJBfSv74eJI/QEk0Qv49pNOktbBQPM0cNGUV55/3
         ePz7BhW8pNjZ8f4f1LSwcic33EABoFyd47SE7TUqqEmcPmDgzlYbefkW2jeKuHT9YCoX
         EiEloNWcp73OAUo/HN1DbeN3mKUw6BNxygKbGN9KW1u8cfNeGOpnY0+APiLbZl6JIuHe
         42Vpoc/I6bR38uspIwB297pgPGcOf+fOJrpxGnUHkpQsB9afSCO4oOjMTYQ5DOvt2Tk+
         O73Kg0pG7Kj1iQoIowPPMoPHVY/KUvk8TmKThPcHK/hqxS3j+QlHVAereljRk0sZO8Q8
         iIIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793333154; x=1793937954;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9CvywPHpjrCT0zo2JhnH11M0JaZbySgNZTi9n8+NQFc=;
        b=w4/RBtUGIo4q7fZTWnlATOD3BYA1QLOqIP6hgokk7/07J1Je7WTzQnplccpRoleMvO
         dfoLxSOGar/48ja5XK1p/cXS7KnVblyboqKlxqc/zPeZLhAlfjkknV2X6g0fwoI27RDo
         bMQVlclkUJFtdzseTzeBSmdEnRI8ECej1dizC6uzQyFseuJ/5Js8BKW9e2Qfuawu4ItJ
         IhL2yj4QUaFMNLPBS8oTlP1pTdG5EwOJrihvYuiMKY36JDqfT3BEYhhtKsmvD0vjQly+
         Z1MZNkDJ7H1IDRxkmC4kv1DM56sFQZbMyVJBOKAZW2zfyPBZt58jtRuyCLeVqgxvOQWT
         sdWA==
X-Forwarded-Encrypted: i=1; AKwUvBzVat46+dg+SwQq3Xrl1aw/nV7qcTy3NsPh/BQOd0Tocw2TGYDvwVPZU1Zjhkz4aRl76iDkNf0tsCOW5w==@lists.linux.dev
X-Gm-Message-State: AFq9FYIvc1+cI2HxTi8aXNTfh3EPaZSKQazUrhVPXQJItJviBNN9p9MF
	qbJIPb/rWAVEjuRvXIqfFXei1jw3LU2sTxrV/oqK1P8KmWJ39DfWJvMITjQ9s6n6KCw=
X-Gm-Gg: AYBFou1iD8de7L+uFWzW3BfmzQTi4U30OcZKlM47NAyAnJYtbGgKD+et1QLxQGzxY4y
	Chau3Ej6a4Bb2Mh/lKIEBWMaEsaZt/hjlGGzVQSrLfwjTIg04UOrvJGaGcXPYWP1b+Oybgo00Fc
	gE67bpStvLCl8N5o5dTK+vPR98QApZLV68ByxqlujNwxck10ezih+05S/UhqRuCRu5DzVYkwPQt
	GocmWKw4Tm0PViQwzal254bP0oaeqeWfSL3JoZ1BnGn9L5eM2SSDPzDIcpKqRP+gNj3OChiUVji
	NOlyYcnTke/qwlZW3zYawI0f4ES9JincRyI0+/5dO9oOkQYcL7SDetWZOVJ3jIGRAIDrnLMgeg9
	jPujZ2z3/aSqw4XW9Ykb7CwC7588oA0e9iQPgxvH5PTSwWDexPUUozJr0J8vCdF4U7lAEP5FooD
	j1DU1Wxc+vgO/G/mG96L6b9i+3tD3zzVmO0M4rjK3KaqRUgyZ+gJ276/I+U5MXcz+nc1HQDiwLV
	RHxtq7ZVo8FTS1ESabWxkpoSCTdW8KYrJL2M8C5/61Y2lFg2hksTyEPelGIekkzT7UWvaMMktjW
	MFK93uBCVtP72cfRR07ASTEjbSGyKcc=
X-Received: by 2002:a05:7301:53cb:b0:35c:e696:2d4a with SMTP id 5a478bee46e88-36a423ea99dmr1772736eec.24.1793333153319;
        Thu, 29 Oct 2026 21:05:53 -0700 (PDT)
Received: from localhost ([122.172.82.240])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm3512579eec.15.2026.10.29.21.05.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 21:05:52 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:35:49 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: "Rafael J. Wysocki (Intel)" <rafael@kernel.org>
Cc: Ian Rogers <irogers@google.com>, Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Zhihao Cheng <chengzhihao1@huawei.com>,
	Zhongqiu Han <zhongqiu.han@oss.qualcomm.com>,
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
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/9] cpufreq: governor: Initialize kobj_type release
 callback statically
Message-ID: <auQXnep2xKpuNJOF@vireshk-B250M-D3H>
References: <20261027223847.652884-1-irogers@google.com>
 <20261027223847.652884-5-irogers@google.com>
 <CAJZ5v0juvZ2ZVRBkY6FxBM=NhPt9vMA3+yRugXc5u=U1jO9AXg@mail.gmail.com>
 <CAP-5=fWVZ=7-qDRODiEQzRzhpQqribv9Morj=OoAXW_6uaW2dA@mail.gmail.com>
 <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>
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
In-Reply-To: <CAJZ5v0i0YoOW+ueh_aZJdYVS0etuCqfrf_S0NTKzCE9_6oKxPQ@mail.gmail.com>

On 28-10-26, 16:39, Rafael J. Wysocki (Intel) wrote:
> I'd expect the driver core to pick up the series as a whole then, so
> please feel free to add
> 
> Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # cpufreq

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
