Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4196443312
	for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 08:55:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786611327; cv=pass; b=a3fROfo3T0uuOzXKpUDRsUUGRRiSrfKOqBAb1UDCsjg2aLDSUIMJYRlAvjU1jsIwrV9NKRIBNUii9H/W9DNvChNb31oIYhkr8Ze40kMUQQ2L2CSdgBryc0JvF4him0YYV2eDJs2ggjaz40mnho2vwbAu6qzr35sMXip6gXSIZh4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786611327; c=relaxed/simple;
	bh=Jzc8k1yrWfBTMmPd/uTV9o0ew6ZOvHlbY2BVlHKCDmQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BgFGSQQepINFJld7384NJQ76jMHPBgu/97Az13bme7w5wTReIPc80ofwrv26Hxt1+zYuA3DJSszJpIClUZfkNmK5jlSBvaqrQNrHlK0p9kwZCxNRuH2pojd2aeGoDkJMMT5Ulc23aD9R3RhXogQbbcwAoX3M7vnD2rMv4uhesps=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F+5UcjpV; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F+5UcjpV"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2caf228a910so4163605ad.2
        for <driver-core@lists.linux.dev>; Thu, 13 Aug 2026 01:55:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786611325; cv=none;
        d=google.com; s=arc-20260327;
        b=m9VfHfJISP/dJIb6Rt7bgl81z1Q3BWutK+xjRpUV/t2q/17GfTccOYaP8UvRmGNjKf
         70oyxwejFGTaMQjoYTcKnPHHXej/lKlTNBfEFa92seQRzOImWkJoUH8QkYmeaoFtyEns
         ee7aLbkOW+sM76lTplqnoseKZzlozHuWA7pDgvPlgZm12wHXLkSs4nIbBFyg4t6Z9j2o
         INd21JvMT0DWKeyglqlALRnbWzNSw8EAjr9DtrF8EuLcfDFtOlBpRyKgnYOYoq0lR40W
         L+0rXBALEtljxbEdZiTowY7TPr7iBjDiGcae00GaTQ+zc+v5kqU9dIGeHuf/bRfpb3f8
         PeKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=iQkBGHUJCah+5IraL6W1VGnCKmw1qeB0IxjLs3arhcU=;
        fh=IwyNRcCY83d1o6aMtaPYgCA8+MkKUKTJxIjrPwGGD6Y=;
        b=SRB8uh6g80q7fYWSCLGh53QMW86V9t9W9OPpXkWs1TbSMmf5/B8bQxOhOiRkBu6A1e
         p3iVqvnGBvIOy2Y/x7QpyLuj4FizocQLN4v0iz8wJlW+A6EHcnDZSWHY/vOEwTuXumKI
         g2NhyGe3RC8yHAylOtBfcycly9Tc+UqelVU32UnHuTda9ZzcyqLFGfJsXrK8kIDHPQkG
         xtEMvMwmwUaBjpVt9IatV9I6cZgHVqz8qb90zl/A7tfOCFjlgWjRBAL9B54zFcN5xjZ/
         /x0M8jY7tjIXogCEqXRuQb7kvLg6YldXX04LZQcxBLN8vn7lKvuxNecOYAx/a1y7IZpK
         gh0g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786611325; x=1787216125; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iQkBGHUJCah+5IraL6W1VGnCKmw1qeB0IxjLs3arhcU=;
        b=F+5UcjpVBRplijmxQSvRBTO82+o5SwKCfhOA3TjPyujTw2xWiWZnZ8zLpKMJuA4NZ5
         EkmffUQYA+Wc8in6nba6ZRH4CTpBkWJq/HUrDR/BNQKsLQQzqmlle4csYzfvjP9dax1K
         48l9z52J2KplaIJ+lYs7mu9YxAkQG44Ic7KAbSv4SaaPHX2hHGJlG47XSdk1tKg1nTzm
         AbDcJ6ZABdCm1bxsyQOK/w7c8ceO3xSHCe/SgmkjFEQuSveLV5mPT5I41bxbL9sSru6c
         enDqYvmfrLegpM5eTAhIuPBHP/ZwLQP2a4S0Nbb3HwAfsz56+Y2HSg0/dl/WO2lzOh/x
         9e3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786611325; x=1787216125;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iQkBGHUJCah+5IraL6W1VGnCKmw1qeB0IxjLs3arhcU=;
        b=cLnKRtvTXXksyt2aV6SH9hKJecQhQKu8z/nE2556L/0aGxGhAuR90LDnn2sW5hfYTs
         TQwJaDBNbt+4vn19Ig68DvChvBajAu8j3Qx4b2gp/g9vkSP3Hs240tbs/L3wBeQbkxRK
         2CSRb4wWnfAypc4+TDrdSeLIbUbeJQal3KKHEWwvbU2z4l39uVOcfiSRZcJeDa31t2Hu
         +JX4VUFilwjr99sjCMkpY+nXaUM7GTUWqVwQrriJZ8T+2A3d9d8WGJy508T0lhssenyf
         1EPPCZfcK5uYrfaXZ3UV1F6kkdel+9Ywc9Bsf55HJwkLrGU8Fq4PZ/QLhKIBRkRAjHy1
         MrVw==
X-Forwarded-Encrypted: i=1; AHgh+Ro6UIOIcYlQMyOMUS3Gnx5f8Cnm5QEwXVUHhJw5ggqcVQe0BGR5sPbpWH3QnHOwSifH+RBlYOtbR5JiJg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4/X5VoJD6J5XyKnwy4yPSFX4EywWmUykunHmkOZlp5wu2O53M
	xLVVvWXygnWy+5STP7ilYS4/VGxoXmZsdx2xsl5hyR4+5BTETz8wM1V0K76in4tiL5Mjw9LXHvn
	4Q5Tj4/aXj3xbEGQ9U2W9xh+a9Hk94XU=
X-Gm-Gg: AR+sD12+lJko+urpWQclHd7vpHsdUhAeW6zVaNSYIvNi7vAanH5wangB+J0G48wanmk
	tuCYWK8Da6BJOgkJweFbKxsqUw1UDV0Wg+Xu8vuDrdkDvau7/XjQCl/6y9Y/eGMvySWsRsP3VR9
	BKhq1AdfHpPgJLxt5owCbXvJqy5cn7lgtq/o5bY2XycGM35rCtBSowxWCM1RMUn4agNqRzBF/xG
	R5g94iBm2Or76yOVnrhX9l1njptwdxmEgBAHRDMEjX1CH9fFSMO533S37Rgv+1QPZPanf7D1NM7
	M4k8XXMgJHugC2/XlgYXOpCaZ2CoSNXrlhQ5MNDWyynkOo8=
X-Received: by 2002:a05:6a21:150b:b0:3bf:8604:9a3c with SMTP id
 adf61e73a8af0-3cc553f513emr5787899637.28.1786611324791; Thu, 13 Aug 2026
 01:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260720193431.3841992-1-gourry@gourry.net> <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
 <an0cAMh_m8ZhGIm2@fedora>
In-Reply-To: <an0cAMh_m8ZhGIm2@fedora>
From: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Date: Thu, 13 Aug 2026 10:55:13 +0200
X-Gm-Features: AUfX_mx5aRT_GeBsew982Oll4m1v2zeTSERp4DtDb2YI-VK1slYjLWUFWPkF2ZE
Message-ID: <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
To: Gregory Price <gourry@gourry.net>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com, 
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com, 
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, 
	djbw@kernel.org, "Gupta, Pankaj" <pankaj.gupta@amd.com>, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, alison.schofield@intel.com, osandov@osandov.com, 
	jannh@google.com, pfalcato@suse.de, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, 
	ying.huang@linux.alibaba.com, kasong@tencent.com, qi.zheng@linux.dev, 
	shakeel.butt@linux.dev, baohua@kernel.org, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, 
	tj@kernel.org, mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, 
	jhubbard@nvidia.com, peterx@redhat.com, baolin.wang@linux.alibaba.com, 
	npache@redhat.com, ryan.roberts@arm.com, dev.jain@arm.com, 
	lance.yang@linux.dev, usama.arif@linux.dev, xu.xin16@zte.com.cn, 
	chengming.zhou@linux.dev, roman.gushchin@linux.dev, muchun.song@linux.dev, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev, 
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, cgroups@vger.kernel.org, 
	damon@lists.linux.dev, linux-kselftest@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"

> > > Bonus Configuration: HBM device memory tiering
> > > ==============================================
> > > echo 1 > dax0.0/private       # make the node private
> > > echo 0 > dax0.0/adistance     # highest tier
> > > echo 1 > dax0.0/reclaim       # reclaim active
> > > echo 1 > dax0.0/demotion      # may demote from the node
> > > echo 1 > dax0.0/user_numa     # mbind()
> > > echo online_movable > dax0.0/state
> > > echo 1 > numa/demotion_enabled
> >
> > I am bit confused by the HBM device example being discovered as a DAX
> > device. Is it to
> > only to showcase the use-case? Or we see HBM device is actually
> > expected to be discovered as
> > DAX device with N_MEMORY_PRIVATE?
> >
>
> "actually expected to be" -> no.  there's no requirement HBM be
> discovered and boudn to DAX, DAX is simply a convenient intermediary
> to memory-hotplug.  This is at best a demonstration.
>
> A device driver could very well just call memory-hotplug directly,
> or its memory could be brought up as a private node via a boot
> paremeter (which I have sculpted for v7).  The former is preferred,
> but there's a bit of a chicken/egg scenario for bootstrapping.

I find this interesting as this appears to be evolving towards a vendor
agnostic framework for hotplugging memory directly to private nodes.

How you see this working? In particular, How would the kernel know which
memory ranges correspond to HBM or other device memory?

Please also CC me when you post v7: pankaj.gupta@amd.com

Thanks,
Pankaj
>
> Most of these UAPI extensions are going to be consolidated into a
> debugfs interface for testing purposes only in v7.  I've been working
> on aggressive Linux Test Project test expansion to ensure there is no
> UAPI regressions.
>
> ~Gregory
