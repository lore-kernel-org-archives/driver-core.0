Received: from mail-yx1-f44.google.com (mail-yx1-f44.google.com [74.125.224.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5499C46EF62
	for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714040; cv=none; b=ZdMX/bqsBDIG/Ol9vhhaDJ9f3gaR+M0j7DtAGwn40W9VGhaCBOVZjog45RtLhuddS81LESsHD3hdh3wXtIrbPXnNZJ2ZvFUQogp5zi5tv73mc6WUxo2griLtfLZuFDRxQyqJHTkANDpFlENLvOtVf4KaA5JQIebh/JWLzY3NtoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714040; c=relaxed/simple;
	bh=CChEzwWKHqvAbDe82pqB+EpRVBOCxUp7FVLoHlKhGNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSrO4lXU5pDOJt2946uaFyBE6h5FjYLaO6BHDZbQXoQTlq4x1jQzmnN7mI8a7RpmJ2Iw79c5Zdomz1rWTQBhai+Dk6PUqXq5rQqj6FAv7ocFM8/CoCusR1+MS7k1pyc6WZmlMW0agR4xlk3j4sTP6euNR4qZ4zQEkxTXA9qxaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TMgwMIHF; arc=none smtp.client-ip=74.125.224.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TMgwMIHF"
Received: by mail-yx1-f44.google.com with SMTP id 956f58d0204a3-6689f36ae56so1690557d50.3
        for <driver-core@lists.linux.dev>; Fri, 14 Aug 2026 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786714037; x=1787318837; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=TMgwMIHFZXCEdaJqXJK4jWPfOjZunc2y8gBLbLZBaloKWm3e8EKmgPPd5g/N34z7P8
         njn2fp89mmxYIcPnoIt+H7hNBCIFzO8B03QEwbP+FZH7F6qBm/hTBkNJGqDFfH6TxiFe
         n7ZJgHbFQGLITr0lNKyp1t/uddDQPJTN3X5zDexoWBjD3CzKsI6lO9KyRPyyKUyG+OHA
         DRxdkNti8kws6iandVxfbj0xN2Efug1q8QO8hbySj4kuMLSo6XDJGFmp/PGNuhzbkct5
         leOoGlovEoLBjhWfXG//rGjeQfNtKOLo7Y0a8GyY8krE01/KD48zMxp5zikOTln9Vbc0
         Aqtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714037; x=1787318837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=tDw4tUvBOt4HndXZ36w1dZ7P4no/WvRv1Zf6OaWHzeGmpxeG3gEWPf4ah/C1e6N+m1
         XZEBaVEXJoD+ZQErWJ2a38eBcl+pVnoQY6Y6Iw36a3iV7X06CEPUCMIJI6XOkpHH+m1M
         0lJkkfsEN9bPP6yUwq2V8PHc7HJnF4V6vpcuSf97dgXNpXez55zCcnrZetFp4vcGVnZv
         azdR0xpkX8ISCCwJnBjoN+Ap2bw3ycAtpEFH2CPL5tJNrfWH7KkhYkB+4bqxxpYWW2XU
         hnCkfn9Nv6jnLJe9YxfjFx82/KiXF1KxL/TYCsEZ9+tKEFQxKz/yEZ2e/r1cO8aslmTb
         WCcA==
X-Forwarded-Encrypted: i=1; AHgh+RrFcnZPCeHqBwkFGqeXU+YKzICkt+SkldDj0SGhWDVib3X8EzgOC2pFAuf2v/sAL6QPSRkLk2lqZKUXSg==@lists.linux.dev
X-Gm-Message-State: AOJu0YwV6sgfl4S3TVMOQnOfz7ExpGwwiPPL2S/k9dLnlXykGEfjyrBu
	Gs9OZvWJeCadFRVsfSmWqM59mk/nAkEsosiTw0CEpI6HlYHxr3wKVsJqWyVQwBYK9l4=
X-Gm-Gg: AR+sD11F3CARGyjYuC5hgAPhYfIJWsLqmICf1kX9++fvhkk8Mq+fZ/i0Em5RoLwFvmU
	/dk4kM1wZ8TDw4yWjfNcje8j7LIh46lpc8slmwFKIbO8wHhIYs9hiNd8cnd04WPXLIi922iXEtl
	nkFNGqGjJVb/A5KviMF2g5GVdob9yb3J3/dB6mNkapQEo4H1L/gfOmUmPuTSwWQ/cS0LwReJVO2
	7wm2I+RLq7KGOz050lWJt4Y67Eec8sp+PiHoRYn3Av1+LoCmiOSS0pLYGGxI9x9k0OoRI6//IzE
	qJXLSZjaGYj4XNw7teaXzdFgxvxTF0hEzz741Os0f9DtxnqARxCmUNY5Als10x0ZO2e1fLyfSTl
	F+2rBYIvF/s0dyE8yBpQeAaMDTFM/Ul88BJt21fUeFarOKSZGVk8lUuYc0QqQl88dbBPVxBJ1ez
	0jlZ6M9a5pR/6sxaV0T1cIPJpVXyvJSVvr80M=
X-Received: by 2002:a53:c584:0:b0:66a:3662:409f with SMTP id 956f58d0204a3-66c72ba0d10mr1917799d50.10.1786714036424;
        Fri, 14 Aug 2026 06:27:16 -0700 (PDT)
Received: from fedora ([2601:19e:8500:d3c0::28fe])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c75c9d90bsm1010793d50.8.2026.08.14.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:27:15 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:27:09 -0400
From: Gregory Price <gourry@gourry.net>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com,
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com,
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	"Gupta, Pankaj" <pankaj.gupta@amd.com>, vishal.l.verma@intel.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	pbonzini@redhat.com, osalvador@suse.de, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, yury.norov@gmail.com, linux@rasmusvillemoes.dk,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com,
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev,
	usama.arif@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	cgroups@vger.kernel.org, damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <an8Xrb5Phmvs0xE4@fedora>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
 <an0cAMh_m8ZhGIm2@fedora>
 <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>

On Thu, Aug 13, 2026 at 10:55:13AM +0200, Pankaj Gupta wrote:
> >
> > A device driver could very well just call memory-hotplug directly,
> > or its memory could be brought up as a private node via a boot
> > paremeter (which I have sculpted for v7).  The former is preferred,
> > but there's a bit of a chicken/egg scenario for bootstrapping.
> 
> I find this interesting as this appears to be evolving towards a vendor
> agnostic framework for hotplugging memory directly to private nodes.
> 

Agnostic would depend on a common standard for such devices.  Otherwise,
there is still a need for per-device drivers - but hopefully the
interaction itself can be generalized.

> How you see this working? In particular, How would the kernel know which
> memory ranges correspond to HBM or other device memory?
> 

Device marks the region reserved at boot, driver hotplugs.

or

Device marks the region normal, but boot param sets the node private.

> Please also CC me when you post v7: pankaj.gupta@amd.com
>

Sure

~Gregory
