Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26213BF680
	for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 06:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782369836; cv=none; b=GKu9wPIxJMHmERCTxS7rxoL33v33JYOJyOqefSCdZsWV/blB2hedeyvAA286wAA6sEiz7PfS2bTd1BBJuX5PiulkFMqr5hO6vTswspsBb6awIkamMQAfhUAZKN+We+CkKRFLAzIKV8zJMHYwGpRril2eHqUO+m2EtMX57ozdhJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782369836; c=relaxed/simple;
	bh=J3ogWlHgltCmMWC539Oq83gosIFEq131LmU2pKtUrtI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QQ2fhk/ZXCl9/DpRmB6H2E/wvG7pgcuVewWxUSVqL5Uv7+HCgPAKFfqljnjat/N+zLiB8xsaGl124swcB2AzNkyEMcmoNIepFO4sQsI0WIJlwUdXfNTVmJJhm1w/wPrQT4D7Yhf40gaxhk7Fn/dL0ZE1sAZjdOyzkeS5J16wHjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=kjlqYfw2; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="kjlqYfw2"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51778077b28so18642481cf.1
        for <driver-core@lists.linux.dev>; Wed, 24 Jun 2026 23:43:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782369834; x=1782974634; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ZAbcZ3NxbmsxcgeRZOVz8olu265ZXR9ZINnNyOlf82k=;
        b=kjlqYfw2jC8SdJCvVR/TY64CPBsLMt2Bafq+UAtMvldG6aFmhmBiLiEbWBSqkhZe7T
         nhkVfNYHz5Q2v0cVSJzqVubyFUops+6U4QaSb7O17hc2Rv1K32t6H3XuzqB40brql03E
         Mm01MgWfwEYuojtG/gYAOtmvzFqQ34JGudHPVqJZHb8rvORQ7JznhBy/GGcv6PcIxeUD
         xW8QJC3h23Tw5K3pnUgpqe0VOZX7HoXQkWxcm33UV/JkxLxWpbtn+p5m4bYpfEq7yV0f
         LUZXCobO7/7/zpVkHzociXNYhJ8Ptqq+i5G4nsT6nbHIMoyrdZ2VJjLO6tw42Iq/W3rU
         stZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782369834; x=1782974634;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZAbcZ3NxbmsxcgeRZOVz8olu265ZXR9ZINnNyOlf82k=;
        b=r7Wj5SIHFa/Sg0x8Pd/hGpbijTh03YhSyStrqG78pfztxtC951xVp5569BkKhmnb8T
         QgW94WUmz3OIYD7c3/hZ3lNSCAZkYmvw+wQW7th6AdqPAEQp0GAS16MkqAjnKUrGrDc7
         WvL541MKDAqPxAN4QBNFAUsVsg3McamdBDoIeYf94t9UfQW7OtL+JgDIDiUAXBrcrcPS
         JdvZNeXuRyYwfcaN4uLkkZqZK7+E3zM+gTEH9UHlvFoSvegt88QZYm2A8xJp1fJ++dnq
         ZESKbesnfLdw5n6LaBgBgd8P4lHLmTZ3YQUpLXEhbT02MxiyGz/ykouzNYRFleHfoBgD
         sAqg==
X-Forwarded-Encrypted: i=1; AFNElJ/mFa+j1Yki7mu6ctKyo7AjquoCWTPrVBF2XUF8XUTGhyIb7sgfP39SnN7hNBHhu5MEx/WJ3BExgqWmlg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyIr0Rsggyr6Qmlx4PiVOyggZZQnE1qREYnDxBZqwIDh1F12Auc
	HPoPjSR5I4HCsIeiuxvsF6V75x8wUquloy52fhq4SEmdq//IQFHJD30NdIhxZVgiUao=
X-Gm-Gg: AfdE7cn6mbZzkbK8pV8QL3U4Bb/k8DU7fR7Es1jDeWibPWnMiEPu/58V6rqbG5XWeHn
	4Q8OUb87hbb6l73vfnw0ObbW8q6FjmmJHtjaE4J5xgIE0OLEj62IpDoJCCcK4zkcZ+8I/X58KuI
	EcVJ2aH9uHyGaik0XraZkPfNITghZDI2DfVJ2RwAf6ixZaAUl46GX4zOG13Z1vXlHjlSPSf2vni
	vw4OGyjtLY+rQ2ZMTcF4zjGiL8MA6LhGy6Kl/VKeqfmmbWPspvKQHR3IXS8516f33IfETqIJYqI
	AesClWt8GwZsz3TrBSCjDxar7Ehvmq8pW2fUKGGfAP4Nuxctx3FMpPzom7U2j+EQsK1MBcPbqlj
	+IKhbGZbokWFQkIMJNWWUjZlvSReRumvM3BkgY7lMjRZH8n177eRrhY2WztXwmfayxGyrUREjGt
	imYK1k7TTNehUaccBhT7YC2I2UjQaqeNlSkGhv0y9ldyuqFAKnJz6NUKnt3P2Op4dMKPH3
X-Received: by 2002:ac8:5f85:0:b0:517:83e5:7859 with SMTP id d75a77b69052e-51a72a8d81fmr15082801cf.53.1782369833788;
        Wed, 24 Jun 2026 23:43:53 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df7f015e50sm171495166d6.6.2026.06.24.23.43.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jun 2026 23:43:53 -0700 (PDT)
Date: Thu, 25 Jun 2026 02:43:48 -0400
From: Gregory Price <gourry@gourry.net>
To: Hannes Reinecke <hare@suse.de>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	akpm@linux-foundation.org, ljs@kernel.org, liam@infradead.org,
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com,
	mhocko@suse.com, shuah@kernel.org, alison.schofield@intel.com,
	Smita.KoralahalliChannabasappa@amd.com, ira.weiny@intel.com,
	apopple@nvidia.com
Subject: Re: [PATCH v5 8/9] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <ajzOJPgV1acrUfr4@gourry-fedora-PF4VCD3F>
References: <20260624145744.3532049-1-gourry@gourry.net>
 <20260624145744.3532049-9-gourry@gourry.net>
 <8e42587a-d614-4259-ae6b-5bca1479b425@suse.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8e42587a-d614-4259-ae6b-5bca1479b425@suse.de>

>
> Why do we need to treat the 'unbind' call as a given thing?
> If we know that we cannot handle online memory during unbind,
> can't we just disallow unbind in that case?

No.  Unbind is a violent operation - unbinds cannot fail, and a
straight, uncoordinated unbind is essentially a `--force` flag:
the admin accepts the risks.

To your point, the admin either does the nice thing are they
muck up the system.

But we should still try to do something sane to defend the kernel,
in this case we should try to prevent that task from becoming
deadlocked.  The only way to do that is to leak the resources.

I'm making a small modification to this code to reinstate the
legacy behavior when "state!=UNPLUGGED".

~Gregory
