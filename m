Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C9873FBEA5
	for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 17:18:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784654307; cv=none; b=bhAEu3LQVXza8lIugtYkhC+ugrsA92Vtb0UvY9/B4JT3qgjdGxg5mSrj0qgvVk7zqu392KTG0WJHn8qaYn2YDH4fC1cn3MGGfBvMkh3rMRfGvbhpF2Fc4UbA3yjmvikanQgRmbqlC12zaHzvcZDTcqtkzWd1UV+oHld/7qnE2Nw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784654307; c=relaxed/simple;
	bh=SjqvhxrsnJlMovW4pU2RS91mvs9nZ/kSb5bsQ/v8cRk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ART2ZqK4fB2tzODk3/DHt83b+dY5Zp86SqgtEKAReGkBS12gDWJTnSOCeiFXwqy1g+23/6g0UB/Bs0OiE917k1P8LD+U9j/QV0quw6iyQJaprx7iYSZuhGgdnllnF2xzOXdMUa9hdscjSrBchMq/OTsbF8MKzoTPZg3X8XR+bcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=tOpF5oAz; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="tOpF5oAz"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-51c05dcdf49so7894951cf.0
        for <driver-core@lists.linux.dev>; Tue, 21 Jul 2026 10:18:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784654304; x=1785259104; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SiPzgqRnSOFoo7wTJovboHrNHjQGCGe0NFhohlpad+8=;
        b=tOpF5oAzrDxkIpIS3frh1oqHfLuXYIYKjzzw/FubMvTemddzURP6zTyeeCT1IDsGNg
         Ge2F1ada9q4jf1MTSrwYJlXOW5zJ5BaLsFEDQfguhi2RG12TYcdzPlIfC1YboyEp5H9T
         DxPgpnnLznhSOLqPa9w4t5MiwYNrqacYNHfCRbyb8dstRLZymv0MtVWDtXjg0W42wQxH
         AmA0M2rZCFO+TIRrpLMCIy25akz5PSTyKrj8DgK/SjsMF8hhCXyPl/H3MPBBld6PhrH5
         xou/30lyabBImXEOk4dxdc7QilLM8SfE5gAeHqGisBJiMSPDEeMoP4HCJhiP2RpG/I3S
         n41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784654304; x=1785259104;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SiPzgqRnSOFoo7wTJovboHrNHjQGCGe0NFhohlpad+8=;
        b=rc6l0U0jYkVTFgjyqo5rd/PDbivsb0vbA6SmJofkC/+wgYyZ82XMvDZP3SjHBXxVXl
         9J2KQo19r4F6ontKLEXCHE12cua50/H1sBmxwjkbEZMnZgju0VKgyry1JeqQRk108uo0
         hh7O9ZXU6mVNwaqvbpVnKuKnWOMfzXjRMktJsMKJRy/2p/Kx83D1TcjszkXmBXPQXP8A
         awG/aMhnC33boKhId4f1ByXjAU0euV0HH5mRvYV0x4YiQdYUt7GU4GGgQ8O+cRwGmBi4
         q2sIdz8jzvufqd4sjtfugkW1qvxJUXB+ZGL1KZYwqyXESf08HE4t09nerhRSbWxx122X
         FT3A==
X-Forwarded-Encrypted: i=1; AHgh+RrDgmh2NQhWfKf+pT8/8eCqEBdMVpzIMJmrHBvM6X4C8uFt8CE3OwrAaabZEqQ/X3hN7j1n+OObZ2YeQg==@lists.linux.dev
X-Gm-Message-State: AOJu0YxNy3bPXu7hJPCZY36tGPXhb4jTMhZQAqQWPQhDEwF9IREKtMk4
	X1ZTXkg/zaeWpnSdIwKOGp9M4SGURcQkalG9pcxOZjZnn6Ykx1yErViZ1wH1s9VijxA=
X-Gm-Gg: AfdE7ckSae0bQ/ONdl21tPXWTGyk0kkZTUCjUk4yaLSwg5ywWQIkI2gQ+48iXcQzks+
	8f00XXj71JPpVKj+jG+Zr3LALFZCakmBn7XJ7zTXpqucpBSpgeGO3baT2P2+mPzCAGtwmRpUJCu
	N5woQXlXA4lkr+KwRWkfb3GK5O3zk5O8XeXf4/Ue61eMdxu4ZXqW8KcPGxkThw0iK9yhwaSK7mL
	FUpC4bcZIhtGJQpoyTI3NetT7gsicY7VqlaQkP3+i5g1NXjxy0w87dsA/swVj9PucCvZabEPKUe
	hu0MzY8I7Md3b+JMZ6zbaMQvcugSZyrIGu662HSzxvwZgjIHUY06ELVnUXJhJAYPBrSlhC0qnIz
	MM6YInGCSaG0RFDc1jZCuGsteDrFtZK9YS4X8XpSktZmxe/yyBR+IhKxNrGcR6IX6sFBs2wZtS6
	LNsfNy1iY0zoYylWI6wDQ2c5NkYjPt6JhzQtWX1pausQaVVxut1dZWoc497Q==
X-Received: by 2002:a05:622a:5789:b0:527:7521:3f8 with SMTP id d75a77b69052e-52775210a4dmr13363251cf.44.1784654304162;
        Tue, 21 Jul 2026 10:18:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5214f504892sm98076131cf.20.2026.07.21.10.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 10:18:23 -0700 (PDT)
Date: Tue, 21 Jul 2026 13:18:17 -0400
From: Gregory Price <gourry@gourry.net>
To: Zenghui Yu <yuzenghui@huawei.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com, 
	balbirs@nvidia.com, brendan.jackman@linux.dev, apopple@nvidia.com, alucerop@amd.com, 
	matthew.brost@intel.com, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, djbw@kernel.org, 
	vishal.l.verma@intel.com, dave.jiang@intel.com, alison.schofield@intel.com, 
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, 
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com, 
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, usama.arif@linux.dev, 
	xu.xin16@zte.com.cn, chengming.zhou@linux.dev, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <al-pkvmgIxGu3LzM@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <a9c52bb6-5e04-1d41-913a-685a7be3fad4@huawei.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a9c52bb6-5e04-1d41-913a-685a7be3fad4@huawei.com>

On Tue, Jul 21, 2026 at 09:26:09PM +0800, Zenghui Yu wrote:
> On 2026/7/21 3:33, Gregory Price wrote:
> >   KVM: guest_memfd: bind backing memory to a NUMA node at creation
> >   KVM: selftests: add a guest_memfd FLAG_BIND_NODE test
> 
> I can't find the last patch in my inbox or on the lore. Not sure what went
> wrong.
> 
> Thanks,
> Zenghui

Apologies, my email account got rate-limited to the number of recipients.

It should be in everyone's box shortly.

~Gregory
