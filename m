Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795015080;
	b=qo9Xa9DYsX7ONhRGwxV/MU4mdVH5G8pi0QNgH4ssxhokhqxSc2CyhWaVQMy37ScXFoNi
	 SQ+pfycMVktaQS4oQv0L1Du4KGCzNJTOEXDbi3s6tWaK+O3frgr2cNjlxp0wLfoaw2pXf
	 en9zvZJ1C/eLpHCpvX1/G06ND1Dff8yv25QJFhouCLpJ/ye4xuKtcYdsTrtYlF75k5AO7
	 rFOHHP8XiSRKb0VeMmmNvt8owuMgQAQJ22309l7g/gMwjl094qVQpyvRQ+dxbS3keUv1H
	 RGQyWBekEtjE+xvXELZH5oaZ2AT/O0IhsIYyGkWn8C7T++xHBU0zry4DS2DlqMyW4EQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015080;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=NayqA+2VU8BL3bQ4QlYOm2bPtjimdoFBif/UfurJ/Ic=;
	b=RqEYajJU/Gw3jECCFWrTWILzBJiMIt131onW0Of3ijERR2ip2tlaNL8R2cBuJjB8ZpI1
	 ekyya6VHWd1ifFNWT8KXdIosO5+yVm91dBkRy+e0yOTsnzT20MstEmHA+bwnKNwY+VUCX
	 IyfQMJ9Aa0aqtgZT3r9RPicDr/cUdBvxqLeCwz33HtA85pHEk7y6oHxvmYJutcU9hO4qn
	 z3Ee+xO/iT9YXfakg8X/N3LazC4XhpzM2rAtfjj8NGe3DB0koQYcWeeAElPRsDmtCL58z
	 6poBTlscdRVrU61zUKZ8dl2DiaFqn2U6p+ZJRbGu3P2R16Nw7JZDU2Z8EA8oZi5jKjQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=uHq3uBCN;
	arc=none smtp.remote-ip=209.85.219.41
Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49392606A32A
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 15:18:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49392606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=uHq3uBCN
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-91e8a05ec5aso12854606d6.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 07:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795015079; x=1795619879; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=NayqA+2VU8BL3bQ4QlYOm2bPtjimdoFBif/UfurJ/Ic=;
        b=uHq3uBCNePWFWEU91RACxzfkNgCNnV/IghHZOHEFVv8Fpd+9qBQ2LzYGFteeTX0eVC
         3mGSB9G1avXXbNI4vCuyKLjyG7ZTqI1ZT2e2s+W4WZFIplgsFruziN+IzU4qRHAzRmdV
         tMsjYSlDpZO5x9uou3VCfKEqiPydrtjURQoTfvKRmlSGEzoGEw96UXTjdrHDQ/G2WiZu
         tmA8XFTum95zRbQ9XDjDSd5rPznE8aBRGmci2ExTIPBq0DNCUeV4prubBvFheCBU6k//
         jUw54yq338uNsppEqys0LfBnjPsL/yv4O3isPC84hF6GbbedjfkQill+REMOimnk9aes
         GPqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795015079; x=1795619879;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NayqA+2VU8BL3bQ4QlYOm2bPtjimdoFBif/UfurJ/Ic=;
        b=OQntqwoOE0OCbaWJ16mWe2wp5y81m1q6YxKLiNMpfINhxYmq7ZJ6tolyCyM16tWWtw
         FWWc1pwVryVNV9lKQJWwfhWBxpZ2tP4tyu1BZOrnwaeT3AK7B+85Ntqc1Nl0BaXlovr0
         xb28ueGf/4+wUT7n1gztCfuooGpxRc6Cky8u5zpC/Kuhccf16e8iGGqrTdGgtv7dwiZB
         ghUb2NZAho5ZGGG2bJpcyZGB5slowFzL1f0SD0y67a+ZTjk0cGPIBWxiCNEbMSAZUOFL
         H0v/PbScKJyxuxJDXa9kWBXHld29hRs4tALN8DWjrb9xeElJ/yoo+R6eHCnN6QJEg2Jw
         T9pQ==
X-Forwarded-Encrypted: i=1; AL+hErEfb/0dZwE9W8v7uMWATAZyjN4xaxX8lmNusIOvfoPU9qwyH62TjmlbK9XNuHsmYc2fLlw3z8yHvknJbg==@lists.linux.dev
X-Gm-Message-State: APuU4Z+z1C2G2A121BBKSrL886z3xPS8KuL4WrDVLi2nEOrIwQmi1LOu
	DoBhtG3xvZ8MfiYpQme+UBQl3Rki+jYlghnc+iVB8ysgg4HfFJN+n3EbKfhT4TEZ6Gk=
X-Gm-Gg: AZFdTZd+DW5nZ6Z0bvFEcv8xZpxpOrBcSh4yIbVps61ni0SMN1zXS8JYsRdL4Tg679+
	FkGYdayywKIzxJrfme49vWy5lV9GSeAFRlEgYZILZZsSSR7lTdDk5eNaPGn+KqpCYYVkqZObH/8
	N9gIizSSgwH8tUud3+RLsalvST+0lfEoH+k9vAnVBWcWEEQ0+XavVSXhKsNrxViI+7fEmjXD5Fn
	nxa2soDvTv+cPFavTAh8jfmuW7QEVC2rzLgjcPFtu2RkALEN3fh9oE/ePP2QkWcAdBo7THVru8U
	9PQD6760IFSiOHWGg90zn5Rew4VDOGJI660B4fr1HKc300U/5sP3cxBxqOV+1MIccomlBSYZ6EV
	wwZf3hvX9H0UXqT9Ackgn5WOTrne29jer7PNdiPFVVXxq1l1LWwv6/1VWzbHRmtgoQYG2b5IOtJ
	Y3q8rYogZAzGsycqXunhc6JNuaO1H/VMRzPEnJtwqSMqTAotudh7cHjQ/ft81t3deZQnSi6o7ey
	bXlNYhUgS6Ky2cQ5a9SYj+IUnSY2D3WfElZsbmB/W9ngRtjX9ZD3IvIpfdVJEjsBYxMrCxHpymT
	V2Tr/4+23yvFdde5mmnGMktr1UEeQPn+qQ1aAUlUdxNhQ2hY816JiSX8eSVJznVxBgwldvcUlX/
	Z8lGEDUPWkSp3indjpjFwMgE8ywCO
X-Received: by 2002:a05:6214:5d88:b0:91f:2222:b498 with SMTP id 6a1803df08f44-92114f8f66fmr40206726d6.27.1795015079071;
        Wed, 18 Nov 2026 07:17:59 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d35dabsm23793796d6.17.2026.11.18.07.17.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:17:58 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 01/22] mm: add node-state-filtered zone and node
 iterators
From: "Gregory Price (Meta)" <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: "Gregory Price (Meta)" <gourry@gourry.net>, linux-mm@kvack.org, 
 linux-kernel@vger.kernel.org, kernel-team@meta.com, 
 linux-doc@vger.kernel.org, driver-core@lists.linux.dev, 
 linux-serial@vger.kernel.org, linux-pm@vger.kernel.org, 
 damon@lists.linux.dev, linux-cxl@vger.kernel.org, akpm@linux-foundation.org, 
 david@kernel.org, liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, 
 surenb@google.com, mhocko@suse.com, corbet@lwn.net, 
 skhan@linuxfoundation.org, rdunlap@infradead.org, 
 gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
 johan@kernel.org, jirislaby@kernel.org, kasong@tencent.com, 
 qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
 axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, 
 baoquan.he@linux.dev, baolin.wang@linux.alibaba.com, yury.norov@gmail.com, 
 linux@rasmusvillemoes.dk, pavel@kernel.org, lenb@kernel.org, 
 hannes@cmpxchg.org, brendan.jackman@linux.dev, ziy@nvidia.com, 
 sj@kernel.org, muchun.song@linux.dev, osalvador@suse.de, 
 nico.pache@linux.dev, ryan.roberts@arm.com, dev.jain@arm.com, 
 lance.yang@linux.dev, usama.arif@linux.dev, kas@kernel.org, 
 xu.xin@linux.dev, chengming.zhou@linux.dev, joshua.hahnjy@gmail.com, 
 rakie.kim@sk.com, ying.huang@linux.alibaba.com, matthew.brost@intel.com, 
 byungchul@sk.com, apopple@nvidia.com, rientjes@google.com
In-Reply-To: <av1hKrtcATVjCnCM@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-2-gourry@gourry.net> <av1hKrtcATVjCnCM@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:17:57 -0500
Message-Id: <179501507729.1206716.6880334614636468959.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 16:29 +0800, Richard Cheng wrote:
> On Sat, Nov 14, 2026 at 02:09:38AM +0800, Gregory Price (Meta) wrote:
> > +/**
> > + * for_each_zone_node_state - iterate zones in intersect(nodemask, node_state(state))
> > + * @zone: The current zone in the iterator
> > + * @z: The current pointer within zonelist->_zonerefs being iterated
> > + * @zlist: The zonelist being iterated
> > + * @highidx: The zone index of the highest zone to return
> > + * @nodemask: Nodemask allowed by the allocator
> > + * @state: The node state the zone's node must be in
> > + *
> > + * The state filter is part of the iteration rather than a trailing if, so that
> > + * this expands to a single for statement: a macro ending in an unbraced if
> > + * silently steals a following else from the caller.
> > + */
> > +#define for_each_zone_node_state(zone, z, zlist, highidx, nodemask, state)	\
> > +	for (z = first_zones_zonelist_state(zlist, highidx, nodemask, state),	\
> > +		zone = zonelist_zone(z);					\
> > +		zone;								\
> > +		z = next_zones_zonelist_state(++z, highidx, nodemask, state),	\
> > +		zone = zonelist_zone(z))
> > +
> 
> A question on consistency. This one is a single for statement, with 2 new helper functions.
> for_each_populated_zone_state() in the same patch uses "if (!cond) ; else" form instead.
> 
> Both forms keep a caller's else correct. The only difference I can find is that the if/else
> form give a -Wdangling-else warning when the loop is the unbraced body of an if.
> 
> Is that the reason for the 2 helper function here? If the warning doesn't matter, this could
> use the same short form and drop the 2 functions. If it does matter, should
> for_each_populated_zone_state() be a single statement too ?
> 

Yeah I was getting that warning from various checks. I'd convinced
byself this was a false-positive, but it does look very funky indeed.

Let me look into this again, it's possible I can massage this better to
use the short form still.  It's also possible that I should just use a
different shape entirely than trying to use the existing pattern.

-- 
~Gregory

