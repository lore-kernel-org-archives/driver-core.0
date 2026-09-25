Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8F73483BC6
	for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 12:38:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790339904; cv=none; b=hTOgFAUyBEXQb1ZM6OkZUwHgCdS2SYOqus8P8jgDgEpguOiUBzji/wmXCOc3BMVWsMTiLTOqtdCn9lhxU9K63mp0mP2Fki7y0GX4b455JFtwZZp6axhxQEa2TsfWEsXsA8U7pDifiajhdo2NuHjT4iDsnfwqhwbcO0frQOs1jrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790339904; c=relaxed/simple;
	bh=wuv4MGi1xIl4BRctbiwTEkiFRlGM1Ni+myKEmyicFV4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kMit6S4HBKHR1lqHiCSXz8VCT9eeU4y201s6Lg2nB2hn1iPtxOPYHOsEg3bZnEy8AgUFfKGh8cI3Za3HqwRA/aJYymXgOas1wRgWe8iHbumCDC9UK1CbCN6UZhrjXNyj/z9E1IFknU1iqk6gUE+hA66oK2WGTZGwys5zaFn3yHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iEnO8dlu; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iEnO8dlu"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912d3931so7053395e9.3
        for <driver-core@lists.linux.dev>; Fri, 25 Sep 2026 05:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790339901; x=1790944701; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vvqE09oZoS8YEZXQOd3uXFRtBT1f8xMiA/EGjlJRRjI=;
        b=iEnO8dluQtoxe4p7UNKzamTomU14J/QzQMvkRp1AyqQheHPzcR9TVR6NmjhzBC/kSo
         GW9h1ZGuyo4sNGNP/CrbFgUBegi65aFku6KZNnnAHCc7JWwm9ZjKvTdvMJ1lpKAoTKDM
         uvYbhgFuLFDbyVdDbnrWGjE1T0gwwJCIbYi0AOtkV9QtHYWoL1Wmzp0BpLZXvhCYtvqj
         P7H/8kHk8//F+RjkgeKmL66F4nGv4pXN2SvCg2LXlIyHpWE2gKf5UnxuEHbKNOazozuf
         1Z2c/MS3hJ02okweQ5N0Jz9VGX8oFrqicT/j69ob1jc1VOQb+hQk/yHj2AgbKwsTJ6+B
         g53A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790339901; x=1790944701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vvqE09oZoS8YEZXQOd3uXFRtBT1f8xMiA/EGjlJRRjI=;
        b=vmSY7q7jUxAm9Uyx7hmfwXu1L8PAC52efWhedF0Eq9a3UXBASVmMA9rfBo+yC+IdHH
         BWsabVpLWl5aqSPMl1r+IlsQE+x9dDsTTuRhkP0tIQtSrzel5unGYlln7btoQ8h0rkrI
         DycuRP6DtYF7YEHeD6HjksgoK7y0DGntPuOBDetPZpX6zPVsLQVsozUTjKQMpeE8v+8B
         IEkHD55D+vcYxGK7nt0OxPHGN6GeUSa8Pz8G/1669DTpSHTs5iyqWaC0z7041eCcst41
         A9uWUByGBJEIm8gMU6X4duEOQ4Rj5kX+L0w3PKaejLUbl7ai8zCixY8igE85YtRGZA2Q
         RWkw==
X-Gm-Message-State: AFuF++mg6oQ13uRd9XSTgryAXnWbipPYOxsx3PSmMBuBZ5LK9c7uXviJ
	5tVqZGf+j6PKqzI6WN7Mt6wV+ObaystQBugQ211yiBkNR5ejg+DoI4is
X-Gm-Gg: AYBFou3LAnFezjQypqSHtVH4n6lxUPtKL9e2sACr+LQGXphMzOdS9oNSn0cIAvLZO9+
	PcIRStJVKDTuP1yTu6t85VnHM/5Bq8DsJa/hJD40IvZx1FuwCuMm+MhCsGVIStBjFAaPYgM+w5k
	tINSYz7LskIWUPOosw982+6+A4Ga64yHLO0/MxVotOiQIOZgutuSvHpX+BniNxVWcdarlMXDhC5
	7yMUY5TI1+876Hi9fz6dTbBiG88XDAFLm5Qjq04CPAYGfcYb+QjamMCZMb3MeaPiGn0KODIWaN3
	UPLSCjL0LNSvqUNiw3T99peYTpJQcrZZcSY/wk2K6y1t2QlQ7dDjPKyLNd9IrZgfWna5DTCEpPE
	BxKUju2FQfZ05FC3v7fpa6tcg+vcahrSI4c9Uao4GYUtU/sH6bNTvU2K2PK4wddRV1P8ZWRfJUE
	EaNNQAXcNj5JosOoBMpXkhlZL8CrzUYUxRfhSDXLIGS08iF8Z4AgspEqWU6fzzfvNsAtxyJuQ26
	V5ZKymL0/yha5rqemp4WPTUJZQenoCSAPyY
X-Received: by 2002:a05:600c:6290:b0:49e:799a:8969 with SMTP id 5b1f17b1804b1-49fe6707bb7mr107006315e9.30.1790339900833;
        Fri, 25 Sep 2026 05:38:20 -0700 (PDT)
Received: from fedora ([130.43.154.98])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49fe5debbf4sm176680405e9.9.2026.09.25.05.38.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 25 Sep 2026 05:38:20 -0700 (PDT)
Date: Fri, 25 Sep 2026 13:38:18 +0100
From: "Vishal Moola (Fractile)" <vishal.moola@gmail.com>
To: Cezary Rojewski <cezary.rojewski@intel.com>
Cc: driver-core@lists.linux.dev, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, linux-kernel@vger.kernel.org,
	dawid.osuchowski@linux.intel.com
Subject: Re: [PATCH] driver core: platform: Simplify platform_device_alloc()
Message-ID: <arZrOu36s26e-mPq@fedora>
References: <20260925093928.3765486-1-cezary.rojewski@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260925093928.3765486-1-cezary.rojewski@intel.com>

On Fri, Sep 25, 2026 at 11:39:28AM +0200, Cezary Rojewski wrote:
> There is no need to double check the 'pa' object.
> 
> Reviewed-by: Dawid Osuchowski <dawid.osuchowski@linux.intel.com>
> Signed-off-by: Cezary Rojewski <cezary.rojewski@intel.com>

Minor nit: The commit message could be more descriptive (i.e. something
like "Check whether platform_object allocation failed once instead of
checking for success twice"). Although I imagine compilers are smart
enough to avoid double checking anyway (I haven't looked at the
generated code myself).

Either way the new code is more readable, so LGTM.

Reviewed-by: Vishal Moola (Fractile) <vishal.moola@gmail.com>
