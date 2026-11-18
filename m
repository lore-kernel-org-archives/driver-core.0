Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795017082;
	b=rBZBjn7Ja7F8Dvdw0HZeEneyS8IpiO1nJuVmNR95kb48fsWUPmQ9uj59sNrkQMNJzHHV
	 1DL5mV988VU2kQj0rsadaXaDvgyXSbtq8/VImYgB+pJe1oBw8oFJRqnQ6W0gaHcHi3Crt
	 KduiGWz+Qhc1hscfH7lud2EtM2wuosab4m8lNMnxU7WqTN8WTXmVjonbTFUylabajAwt9
	 9mboWD6ttewoY/56cODVqQcjtWyaXsDirbJO9IRQc1s1Zqy0+z8ptk8JfRWUiIbtyoGQh
	 uD4UDwM2if5wuYRtTa7GYuJOFn1429X8CJsnD8aZS8uRrkEYYOTl9dh1UxugID0vjhQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795017082;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=rtu+dm+kZUdeiLu+ztbJ6g6Gzpa+7bPUZ/F65mvaYZ4=;
	b=WC43Lcq+88lNK/W1Snp0fXcd8zrI2wzZsgKbyLX4ovEVYrchJPGxoeLxYAngIsqGmu94
	 K5LrHj9THwoy1mrxNa78GfrS/bjXozUXRLphRjO6t4hXz4yGstZ58FkIAWU+NYgs1/vcf
	 KAszBCbyjgqnK2V6BSNnRl/thNS2MKN1sZXGcTysRlgnSc/RueR94gT1qdzwt6Gah+VX5
	 zjYG3d7kpDS6NYL/U4eZwPESx9K2HGN3OJ/zdmht+3/lp9g7RIA7+mx1+kJ+Cbz7uAK84
	 mxjVn//ZVz3dLJZxCUumlYiT8RR3QPoW+DizezzmCDMwsWii8NQtu908nXYSYbwHdRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b="nk1drAx/";
	arc=none smtp.remote-ip=209.85.222.176
Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E0BF60A2603
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 15:51:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0E0BF60A2603
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=nk1drAx/
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-94961ed97bcso138586285a.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 07:51:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795017081; x=1795621881; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=rtu+dm+kZUdeiLu+ztbJ6g6Gzpa+7bPUZ/F65mvaYZ4=;
        b=nk1drAx/FkoeeOOf5cO6WSDy/W52HpDkTui7c7weLjLdXZgwhbuqmocFgaoxHoJFTn
         jTYkPHuMAbVwaWU6WTM2TC0WaC0GRp1rLBMvCMIQryDbcdXJY/h034M5Qddoi376BC8s
         H3kVArOPR0HP2/AQZco0NMae+ZH1ad5w+VPynTOVRRhTIQloayuVPMuQbJufy9CR9Rw8
         KpM7cHnfhi2ifp2+MeeoVuFW5EXsvIlN0xR8hpWHr1FmsBmhNchSWNidqNUYFCzsVIkG
         fhq5wiRZRJSsxlcltX5yptL3EGxpsk9CBgpNGFlo4A5JT7++qZBR3wigvolR9aRyy/6O
         qwHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795017081; x=1795621881;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=rtu+dm+kZUdeiLu+ztbJ6g6Gzpa+7bPUZ/F65mvaYZ4=;
        b=0pePyVJ9WcF6sjGaj3S7WvyZsZYKERLQXn9F7PSwmXeWm0+SKZmzLxyMlDU4+MvEmP
         e4rR4Q4AQP9dGmOb+n5w/c/IB0z0BHCHpm+91GQj8noUZXHZE7Kg3hdXGJq+MS4oGRJy
         5c/XYVrBSND36IqxiQnZExPlTQyn83yIssd6RAX5kH89Gd85PgDQ19em3mttqMcyD6C+
         3amU44LLPGs30LeSC/xeOueODjcqMwimXGbOx7SEwx+KxUkFqMuSCp/gPSmvQUgEFNHE
         nUDvCqKDRIGEOFs7bitT71DS5FwKuPe9EmYrvdB5gfrqt1r+n45mEb3t28a5Wq845RT7
         6mOA==
X-Forwarded-Encrypted: i=1; AL+hErHoMBK2ZZ5n7mqQP32Rg+LhJiEDoo9x1l6TvZbLHZ1/vSa0AXXsg4Zyqt3fntbKDPI5Ic35xJBRTXcB4g==@lists.linux.dev
X-Gm-Message-State: APuU4Z9gRiApJcnbCHD0yQKRzp0/nDzhCgg8REjaUezAmkybWe9ahWCa
	JM8JUl0ygXdoaAA8tQrtpS4V0wfOtcqiNJAIWkohfub4NC4zE14eM/tM+B3OaMPdRkc=
X-Gm-Gg: AYBFou0I1V5mJk8VOsmNrRXaSt1NMWt5o2EGLncyDUqKn+A+FcU8TlfZl1xFv7Xx+6z
	ssuZZgIe8R4EfBQcdq39j7c/y7Ir7i/NxYLR3U60uqC/yWMhugXROS/c4vLA/G+P1K4a0leri8b
	8AWcw5/IgpAQ2dLsddjTPuHLq2EoWz9qExv+mP4GENSDMq3schCg1oBrJqLv7wk0XOe1k+BTUoV
	lEqelAFED23czJGYeP1BiT/Z3/eOeozp2s3plwaL4u+joMD5gUi4CWVOiXPNGSq6PAMBjleK9PN
	JxZdjnWKTjso5X3281XxPVXa4NvkSzyGSeZBmv+ebTtTb4qYBkkBGPPoFFKPV+AsKD4u/C0rVmA
	/Q1AtG5H0Injy/slQ7zeA6z/n/2R4L4fXQnunbDWxiaQstiLfkE4ZfoCRwGJ9Z/vJHGGluLzMVd
	k9eNNe1vIXF21W32fegcCd3iAsm8Zpy+B9+uuq1OQeakS0fmYXTW5S8U52iv+ljpm7vQ+KWBB88
	MS1eXqjUNAuA2fSpBZre7+ZS/Kit2B2DKW1b2M4Z1xwVNjlIAhInlMRTH9OrxpEkJ399zBlHFYd
	Bo2pGNBOXvvLVrVDO/nfHdhtHhA1RuGshQqcLNeOaOjBSnCA+UIrHmCqWhP4zVd0lax9ueTX8Aq
	OhfCdX+M=
X-Received: by 2002:a05:620a:8086:b0:93f:2938:48ba with SMTP id af79cd13be357-949997ac21amr514417285a.55.1795017080864;
        Wed, 18 Nov 2026 07:51:20 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-9499b454facsm210842185a.5.2026.11.18.07.51.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:51:20 -0800 (PST)
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
Subject: Re: [PATCH 03/22] mm: introduce the common-memory node state
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
In-Reply-To: <av2_8Z2sdM_9zUEL@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <20261114070959.3490008-4-gourry@gourry.net> <av2_8Z2sdM_9zUEL@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:51:19 -0500
Message-Id: <179501707902.1206716.2408532904937875068.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 23:24 +0800, Richard Cheng wrote:
> On Sat, Nov 14, 2026 at 02:09:40AM +0800, Gregory Price (Meta) wrote:
> > N_MEMORY is overloaded with two meanings:
> >   1) a node has memory.
> >   2) a node's memory is reachable via ordinary allocation or
> >      an arbitrary MM service may use that memory.
> > 
> > Allow N_MEMORY to mean #1, and introduce N_MEMORY_COMMON to mean #2.
> > 
> > N_MEMORY_COMMON nodes contain "common memory" capable of being managed
> > arbitrarily by the kernel MM based solely on zone membership. Following
> > commits convert relevant N_MEMORY users to N_MEMORY_COMMON.
> > 
> > Add folio_is_common_memory() and page_is_common_memory() for MM services
> > that walk folios. Following commits convert folio_is_zone_device() and
> > page_is_zone_device() callers accordingly.
> > 
> > Expose the state via `has_common_memory` so userspace can identify
> > the memory available to ordinary allocations and common MM services.
> > 
> > Add has_memory to the docs while we're here.
> > 
> > Every node with memory is common, so N_MEMORY_COMMON equals N_MEMORY
> > and there is no behavioral change.
> >
> 
> This sentense kind of blurred me, you state that N_MEMORY_COMMON is meant
> to isolate the concept of #2 from N_MEMORY, I expect something
> making clear distinction between common memory and private memory ?
> 

Sorry, basically as of this set:
  node_state[N_MEMORY] == node_state[N_MEMORY_COMMON]

Later, we'll introduce N_MEMORY_PRIVATE and the sets become disjoint.

I realize posting this series in isolation was a mistake now, and I am
going to post the entire v6 of private nodes with the reworks you
suggested instead.

-- 
~Gregory

