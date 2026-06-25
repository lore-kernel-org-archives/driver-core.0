Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A9929463
	for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 13:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782394520; cv=none; b=IIc0phEaJEMM6ktj0dmP5sk1xDINCETKEU5G/aXekFzliNYkFKsIudiwchZggKAS21MZzcLOIEiO9fzO5MxRXzg82RCdtBaAe6nGaveN7sCyz/XxxXnoRCIqIrQeDsJf61EZzkaaEr1lYQQC9VCAfTDC5GlzaxhBMKK2y9tLYFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782394520; c=relaxed/simple;
	bh=VTl59t5FGNxl9vwIccoBE1FSh1ipsJkGVWNaK8PoD04=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cspgHHWYcRurdQJ1g6UI3yGBpwFFWTLtShc8EFcfq5FapUd8PQcvU6rgeXJJH6RpawOInaRdEU13Qv6vOWXEIq5dJTZDjGxljJ33btttnCA/hGYLOVIiYyNqzt4ApZHyBkn6Gzk+UKZORw9CDW1a7YQz8MuO0ucH4452UbW2onY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QGQpbzPn; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QGQpbzPn"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-8dfdfe27ba0so29044486d6.2
        for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 06:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782394517; x=1782999317; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Q8pz5eRLl5osDfg8s+rI8Lgc8KwmBuE9WN+Pu83DenE=;
        b=QGQpbzPnl5MyHZLUnj9THzPangH1zWjxsP1pkD827M1XlLlW78v2NhQ7sPcghDaSJo
         sOgHdGO/foc2k1Ax7vAx7NxpAXC89vLdEjhz5C5Jel17f3O4Of1kyF9JLahwHGdvXciF
         PMen8VBmMPzLhbhXa9Sc9JQ4+IHT5B/P9M9k2FxaMATsCnQh27KE1j3ekLJImp0X1+A2
         2s/hsAW6XgOSACO6Lvh6oepSMb4aC//AEZRdYKCeAdIYss0oXnCKmfKURqMVnIgx9F3u
         fkZGVaKG2YrVGnQC9zAWqFcHpTUjc0GnP8aZx/LE6aAxJDyKEZheBeGyFdjFGdWw20hC
         zpPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782394517; x=1782999317;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q8pz5eRLl5osDfg8s+rI8Lgc8KwmBuE9WN+Pu83DenE=;
        b=O2qnNj3DSmfiVbFAstBrDhURqQ5t+qx6ajghtKH5CQOkEKf0QMlvE1SGK0nbqsz1kf
         FT60PgeKQR9QL4rV5dgAaJtPLwAMbydARj7/Of4gW4T2cpRbukYybI37qe1ihHLd26y7
         8Ge2AS7dkBAnGFYry5GC0UtmEka2CqfTUFTdj9UJCZdxX6KrjW2iwB6ybus8i5hfmGH6
         Qxj7KH8946E3GOFyyeRybXG30h+2Mbr+r0A2Gh38yNM1yJnrmm/zH2AGSX1kQuZk0mGV
         ud5I0BVPR92MRlkjlpOI9KyFTnwwroz35ukBNVxueueDoCP9pfEgIM/n8zxgrRhr5VvS
         DH8Q==
X-Forwarded-Encrypted: i=1; AHgh+Rq1eolVRECO3uIccrRNrpHt53tv7gW39w49mPzorAoj9MymgQQsiPH+oiHQ57s9H1n3CRUfI9hmecKI7g==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYZ30A8ewTfXhY7d74tUZHQRFw3yXhUeh1ce9UaayBK1o6f7pt
	hg+1mrhCVJH52ps6/1yHbgQZvsTuR+S5hxHmcck/dfpxGIxr0MH7/hb7KRC23I+/+i8=
X-Gm-Gg: AfdE7cn9GdQhF7oIgGyzyDKKMWfhnv3P4fZEwKbHA10c1PmhWBy1UQOjCZBpg3ZM9ND
	eptyT2zTJ8NZooU5ne999lyJxhBFXRsTaqKJTpr1qycuuZDPaGOS3iU5tibuhLQL4TWgcIqmsLO
	I8Uy5gqhpgNjZUco07dorD1saxBB0JJO/Ik5zKnDTElXNlJy43snlTqAYKJZMyfBGQDO3UmegNl
	txA9vHowlQ0nXSUSBnouc2mAOxIf3A3fcSQ4YjCv6qd2u29AGXpSVWNjjRFUE+zGCqtSVx8yu1z
	gG90BN4dBA+UQLVZFwO73a5cn47GbBkRszcgxHndxOpO8RH/qDhkbd249BDpC+rPVb7MT9dn/Bx
	P2Zf4ri5bx5XYpFP43nPKSse1WFj12bGGVDVt+Nfl6y3WE2drb92Qypwo5LA+K64HA7922DoT2Q
	JfSUBzAGtZsN1C07mX8MZbppaYiuJBJWxSVbPJy/fhDkuPGSvpNbYm4kvSg3+qDNiagol1
X-Received: by 2002:a05:6214:2686:b0:8cf:9bd:744 with SMTP id 6a1803df08f44-8e6d2ec8509mr48772246d6.12.1782394516856;
        Thu, 25 Jun 2026 06:35:16 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cde319sm183477356d6.31.2026.06.25.06.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 25 Jun 2026 06:35:16 -0700 (PDT)
Date: Thu, 25 Jun 2026 09:35:12 -0400
From: Gregory Price <gourry@gourry.net>
To: "David Hildenbrand (Arm)" <david@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, osalvador@suse.de, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com, ira.weiny@intel.com,
	apopple@nvidia.com, Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v5 8/9] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <aj0ukAdiKRDEtYeN@gourry-fedora-PF4VCD3F>
References: <20260624145744.3532049-1-gourry@gourry.net>
 <20260624145744.3532049-9-gourry@gourry.net>
 <1d8f74a7-502b-43cb-a0f0-1923049aa213@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d8f74a7-502b-43cb-a0f0-1923049aa213@kernel.org>

On Thu, Jun 25, 2026 at 09:40:02AM +0200, David Hildenbrand (Arm) wrote:
> >  Documentation/ABI/testing/sysfs-bus-dax |  26 +++
> >  drivers/base/memory.c                   |   9 +
> 
> Can we have this ...
> 
> >  drivers/dax/kmem.c                      | 224 ++++++++++++++++++++----
> >  include/linux/memory_hotplug.h          |   1 +
> > 
> 
> ... and this as a separate patch, please?
> 
> Nothing else jumped at me.
> 

ack

~Gregory
