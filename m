Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E493EAC9B
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 14:04:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781186646; cv=none; b=LF5nbVhrjyA8ufek7b3IBTCgzrv5Bg0Cb5D1gmqlCjVYrY1Xf192tl1Ir5cNsSUGpBCYOyLLStW5Z3dNwwUGyzVVSLA6BvEYNHZYtFJsqImt/xP7tycoSdgSwIS6rIiq+dhaLZlW4e4tf/XXpvMWtX/aA0XHp7mHdtWZ05TWb2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781186646; c=relaxed/simple;
	bh=t6vDzwAQf6m71cw7ZAaMH7giGD8b6mi1NLg41KRjFFs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tnq9ej2HazVszYeojYmQ2U32TTPc+qIRPXQfhmJcU9/WN62MudH7KXypT87AIuNgJNqndzxooExYL7nwBIbnMWfOv+CYolSHasOii/fSfSa9DwlpRAEJLKLa2Cf6WdeG07qbwuB883TqDG9rvObRSWdOSG+cxkzMq3gHdCckCM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=J2VKGEKx; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="J2VKGEKx"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8cce22e029cso13572076d6.0
        for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 07:04:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1781186644; x=1781791444; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ENvnRZyJjnEps3yiVgsX7HBb3e0UX6vr9hqD2coNcvo=;
        b=J2VKGEKxsHenQ2Yo0JltTFJiH8bznUT8RyxBGR1o3l7fifUhtQMrZOU8PRi5waip21
         sPqy1lyFCnp3cFO5RDxGfioC6T6acs4kDPX4QATI6Upuic8I7N1hKPm6Z+4Pvng3vLXs
         /hrW1LSy61Zf6sQKgeT4vJFLUzVRwKm4Dr9HVgEUxYDYsWbCSvQfIa1YtYsHLO+WDH7f
         1jHhgNu7Q+R/HwDroihXKHcAE+AxUExhvux/ClLbh/bP5fOqdn0icbIbEQB/jhGzYh5x
         FHlq7W3TV9ZESOE+taU5mFogBuquRo5kscYUf6hfNamoXgNzrd7BGFOH4rQiPBTirGwi
         wQAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781186644; x=1781791444;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ENvnRZyJjnEps3yiVgsX7HBb3e0UX6vr9hqD2coNcvo=;
        b=S7VseOyxFX6U6cCyB0W9dm5I92RfDqxVcUCvpQLqQQelJ6ins8UREZnyN1x76vDBrV
         vcxsBESQ77LCleIb4t4NhrAWfQvUmpy4faK9PBHSpHwhA9qKsALCv0ygiK2Ab4NnPO7x
         aQbHH4jI/+rV8dQRL4p1/0u0fT5WFCpoBLua+TW5sMQ60QlK2wAHZBivrAhmow1ICAkC
         GvJ2nb4vp3pb3Qjy/Qc4Yh4ye6Ff3+Eaaf0H0M0TEvRH09ohrMaQir0p8FbyKzogVvt5
         coIA/NAmXYz7rOlBoHrw47yHzWgNV/lWb9W3dBNehlb0WfAhaAe2Ou+kbGoWC85Ux2K4
         lcGQ==
X-Forwarded-Encrypted: i=1; AFNElJ83SW2GdEvd+09sAKJpTti8Abzd+VGGc3jeI5VO/l4MJc+5dcEPov/SpXicAjWii5Qi/Eg3FmpxYV32UA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2Y+SI3T9LBqDU02wNpAACO8da6LbmmFr64iDDXYi8g4S8y909
	shb/H6ppxbb3t1rFoqpn5AYInqAbfYxJ+j6QzYKFeCjTejD/vZyC2o0GcgpSroF5nBg=
X-Gm-Gg: Acq92OHR64VJfYpm5kEatSF5Va7rc6CWhLzd35iUmSUFw8hFvIN5iJ+eDavzg60PXJw
	kThuopWtU1Ci4TjDJFpcsJ58e7lF8g3YXDbyGvEfwPyyV6EZYdlJmJ/QVXFN+HVDqJCNfc2f/He
	SaxYmrvVhl4H7FThOY8ZL0kwWeAr8hViTNbRgABOqZZMKdWikrOimMgyDSsWyAV6IShVcfvR0hz
	QOvyg/z+lSyi94IDUroHFxXm7B40mVaqZBf9TPpphAhbS7MOlxXrQ6q4EuiT6u5sGxrrQKkkV7/
	hGFEleLZ9SJQ2lSG9Q+fabC+5wtbxw1WhUjD13F00YvnW7HY6QNORAYneCA11ONdgZS84GNYE0v
	wfrdUyjFXXUUNPFbGV2HPCXHOuOe0TsWs1jTEVpNuNKvyOCV85cZHkt8LRW6lcAe4S7VD4OtAx5
	PKXE2RLFqdyHKnAGEZMW0E4hAxlfNgE+x4hOBZJt3uen1BMJ4YQlm0Blzf5TLWBNUfJa4LP7aHZ
	D8ApW38z72qSskwjQ==
X-Received: by 2002:a05:620a:2728:b0:915:9fde:9da3 with SMTP id af79cd13be357-9160ade2a98mr334272485a.27.1781186644129;
        Thu, 11 Jun 2026 07:04:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9160aca4293sm196905585a.14.2026.06.11.07.04.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jun 2026 07:04:03 -0700 (PDT)
Date: Thu, 11 Jun 2026 10:04:01 -0400
From: Gregory Price <gourry@gourry.net>
To: Mike Rapoport <rppt@kernel.org>
Cc: linux-mm@kvack.org, x86@kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev, kernel-team@meta.com, corbet@lwn.net,
	skhan@linuxfoundation.org, dave.hansen@linux.intel.com,
	luto@kernel.org, peterz@infradead.org, tglx@kernel.org,
	mingo@redhat.com, bp@alien8.de, hpa@zytor.com, rafael@kernel.org,
	lenb@kernel.org, gregkh@linuxfoundation.org, dakr@kernel.org,
	akpm@linux-foundation.org, rdunlap@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, kuba@kernel.org, ebiggers@kernel.org,
	lirongqing@baidu.com, paulmck@kernel.org, dave.jiang@intel.com,
	jic23@kernel.org, xueshuai@linux.alibaba.com, kai.huang@intel.com
Subject: Re: [RFC PATCH 1/3] mm/numa: add exclusive node pool and
 numa=standby boot parameter
Message-ID: <airAUSrNjbSEwuti@gourry-fedora-PF4VCD3F>
References: <20260610014517.253609-1-gourry@gourry.net>
 <20260610014517.253609-2-gourry@gourry.net>
 <aip5IWmxg9CWg8hQ@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aip5IWmxg9CWg8hQ@kernel.org>

On Thu, Jun 11, 2026 at 12:00:17PM +0300, Mike Rapoport wrote:
> > 1) Can we do dynamic addition of nodes?
> > 
> >    Not Trivially
> > 
> >    Some services utilize num_possible_nodes() as a static value to
> >    calculate the amount of resources to use at runtime (bpf, md/raid5).
> > 
> >    Example: futex_init uses num_possible_nodes() as part of its
> >             hashsize calculation during __init.
> 
> AFAIU, we don't add the additional nodes for generic hotplug memory but
> rather for exclusive use of by drivers/applications that are aware of these
> nodes.

The intent is to use for "non-generic" hotplug (see the whole private
node series [1]), which would eventually still use the hotplug mechanism
just not for generic memory.

[1] https://lore.kernel.org/linux-mm/20260222084842.1824063-1-gourry@gourry.net/

> Wouldn't adding them to possible nodes actually skew the calculation of the
> resources by the services utilizing num_possible_nodes()?
> 
> With the futex_init() example, won't be hashsize scaled down two much
> because we've added these special nodes to the possible mask?
>

The result is the same as BIOS reserving nodes with PXM entries that
don't get used.  The CXL ACPI Tables do this for CXL Fixed Memory
Windows that may never be hotplugged.

So really i think you're pointing out that futex_init() here probably
shouldn't be using num_possible_nodes?

~Gregory
