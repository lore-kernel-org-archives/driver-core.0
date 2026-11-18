Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795014796;
	b=yjy1rbwyBI8tG3E1Bp6f+5YW7b+/oJAcNQfBzj6T9ru8UU2PyucfHVNyiqxmEy/sVnFd
	 KAX+ro4mrgFFJqmQgp+KtdrMk40nNfaDB6xsCuU+AInQozRRfM5r3XHmHJUajv0HPenYm
	 BmFU33WeiE3Xgppi9h+foTzzEmKnbLVYGCvvmS9ftpFMS5Y3sTDjrAipyvSTXUz2vTZQW
	 S1QOxmkqUZa26w1kZH8yHd4yXhsowqJetRL1lTas2HNr/7D2m4S8dGl09qxD7oc9o+GO4
	 FoPrefglBDnOrgTTsExs+nFv2JG9GqB0Qmwon4a2TZnyYEXJ43BBsd5VPxlMYnOP7ug==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795014796;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer;
	bh=RMVcoG7RRC5e+6Od8G0B0oNhz3JqDhu+jU7/dRmM0d0=;
	b=mJ0DmE6m0GLevRS383sYMiSRHskGaf/FnKE0gnnJ8YJqXSNcs6Dh4akSI38DH70Qc82B
	 9TwCXiELGMwS7vu6ADYTVJ09YM5K9wL6WI4QhfzjxgkZmSlfhoQXBbkS1g9/YxXWvuJ0Z
	 l3kKfyOfIMQc2BqQXOUX0nFYvWTV6RAsk9gTEsy/hNCDH+5cewgaBHj4QFdh0UgHRLurT
	 3hvOLXLSAXyUhRDOrSOkDvN4pxSrToxkM30EDFeGuIj1+puJ/ak3FwtTaUYLoQJyWA6tW
	 D0IE/tNvU2LWmoWI+4a3hCqIk72qUHCd5jAUbMsYXMuWhnMTXq4x/HNfycP/htgxb4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=gourry.net;
	spf=pass smtp.mailfrom=gourry.net;
	dkim=pass header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TpfpoMul;
	arc=none smtp.remote-ip=209.85.222.170
Received: from mail-qk1-f170.google.com (mail-qk1-f170.google.com [209.85.222.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A95606A325
	for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 15:13:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05A95606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.a=rsa-sha256 header.s=google header.b=TpfpoMul
Received: by mail-qk1-f170.google.com with SMTP id af79cd13be357-94961ed97bcso133557685a.1
        for <driver-core@lists.linux.dev>; Wed, 18 Nov 2026 07:13:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1795014795; x=1795619595; darn=lists.linux.dev;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RMVcoG7RRC5e+6Od8G0B0oNhz3JqDhu+jU7/dRmM0d0=;
        b=TpfpoMulRrnRIK1YCAb/W/aLXf+Gv4gZSW1XLMad1ji2f4dB8Ma+aaN7GLS4q98O2F
         cV8osBb91LUzXZpsJJItfx1Q2fEqi30Bif39fxpBvA7Ll80CeVT90ywwVyNwzGwO1+h+
         /IjFVRtw03pyemKVIG1nB1WDXEzQOcMTB0tI2zFOj9q878FDWWzh0lQ0A46jdLXCVSSm
         1XY2Ri7ilU67zotZ39tQM2Q3N4DKiZ1X4VwpujIsYqe1lLs5wLhpuHfYc4WzFpUY9nRo
         KsA/NMyWVoskrKjYEyxC6zSgSc1oDLB4MR02o/p9Q+1pT49PSzyf4s+LxmGfLasXroH1
         tuOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795014795; x=1795619595;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RMVcoG7RRC5e+6Od8G0B0oNhz3JqDhu+jU7/dRmM0d0=;
        b=HvvDkR9Nb2nWuw0mAhiWpCd+t6iFWTttpFQucColtd49Y+J/x/vsB2umhecJWBKBk2
         REMow29ZQkwM04Utye4tvgIM8K+UXiCxfz5K/EowEh/fVZ5YWvel5PKjLiUt0QdG06PZ
         HMrfGe102PaWvQMi7ys/3Tw05xqJor+decFNFPPWFhnU6hXkHNf+mtNll4UXHAKiZkQ9
         bV7wFKzSiVHuiK9zdpt/fAq60qIyAdzF26syKF/ByqgOEpIlfLOmMeI9qom8/TRlAjnO
         XBiIocFge2nZXNBjDdHVs2sFlPBKqZBIU71eRccpjSWUw2BJ+1lzUkoPLlBG9km9Z46s
         84Pg==
X-Forwarded-Encrypted: i=1; AL+hErGVptDuplxrZBCTyWUTMr9ocl7Y1E/BknpP8LZ9/FEgXdxC9GXFFoln0qcicn4cLnhDXn0shwwtmYpLCQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z/5UrJQcXIm/cCTKb9dqdC6eLTILMVdnTNw/4EraR96E0f65tQX
	5b8UDtZv5N6VhgK/05xzqmUgfnO+FAczdZ8bok7Tpaa86j5istz+be6b/53oot7oQXg=
X-Gm-Gg: AYBFou1yG0zFcet5Rkxew7f5Zv0aakQ5AXVUXSeee6PTaT9T3QspgKRDvf3UC4NsLV0
	79izU99JBEJqsxoU4C7kfptXJCTDiTnvOnOwHCzumShb6W4Fc6fToEfad+BCn9qE72eN4JWfu8o
	fctEoNK2WjEUYAB2LJ/Zw/pRZk0puagL66CfvlEuRDF1yOL/uEZTteSqUgj+qnVQ1ooPOcGN7I/
	yFXdT8fE3ujYJ1kNOhfmYPbzzzho4Is0MyuUZjntJmLQ2Jw0PL20tqDPrJah1HX+S+2TM3e7kXO
	f1ox52+UI06SE8mo4bcESOfpHDD4MgXEir0N2bTSDMifWl+o3oCHlUClOkSoMGfrjkBJUyT4hZD
	UFO9sb/HEL4mqnTSlQ5WLTKTUoB30fUHPsyIp7hzw4oqUmsm/7mvW1toKFqVOEoh/TBsP7buDeg
	zZmW0c3mdikeKTa5+kDuqdEXMUsHAxl2riZbyiHhV4FAepq5WZs6heHdhzVjNHypigpKMuItcb0
	Qb2rK/dILKj5RDI+1rPfmMEfM2/qZhHR7+bBfYaFDHEOT0kJEzqJEDdXIaEuQN06JODnFbYJFSH
	Ooa/5aEWsypozCJkdUt6KTb43ZqW79XEpEsqeDMhU+ImfdWUMrKOu2iuAkdq3RL28uevFNlhxR3
	ZVNpxMNQ=
X-Received: by 2002:a05:620a:444b:b0:949:6d95:f63a with SMTP id af79cd13be357-94999810096mr508584985a.78.1795014794676;
        Wed, 18 Nov 2026 07:13:14 -0800 (PST)
Received: from [192.168.50.231] (pool-71-191-145-202.washdc.fios.verizon.net. [71.191.145.202])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-92114d70a8fsm23976506d6.30.2026.11.18.07.13.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Nov 2026 07:13:14 -0800 (PST)
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
Subject: Re: [PATCH 00/22] mm: introduce N_MEMORY_COMMON
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
In-Reply-To: <av1DvCQd_OvkGgLU@MWDK4CY14F>
References: <20261114070959.3490008-1-gourry@gourry.net>
 <av1DvCQd_OvkGgLU@MWDK4CY14F>
Date: Wed, 18 Nov 2026 10:13:12 -0500
Message-Id: <179501479267.1206716.268867271510310543.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-18 15:01 +0800, Richard Cheng wrote:
> Hi Gregory,
> 
> I've browsed through the serie, I'll go into detail in each patch
> in the following days, for now I have one general question.
>

Thank you for the read and the feedback!

> I wonder how the "common memory only" rule is enforced ?
> 
> As far as I read it, there're 2 ways:
> 1. The zonelist, you build them from N_MEMORY_COMMON, so non-common
>    node isn't in any zonelist.
> 2. A check at the call site, e.g. node_state(nid, N_MEMORY_COMMON) or
>    folio_is_common_memory()
> 

Those are essentially the two cases, which are already present in the
code in one shape or another in the existing shape:

   node_state(nid, N_MEMORY);
        or
   folio_is_zone_device(folio)

With the exception of one or two places, the series largely modifies
these locations to use N_MEMORY_COMMON instead (or in addition, in the
case of zone device).  There are a few places we add common checks where
zone device checks were not already present (because they were missing
or did not apply, usually PMD scenarios).

> 
> Code reaches a node's memory in 3 ways: zonelist, node id, or by folio.
> I couldn't find a statement of which mechanism is responsible for which
> kind of path.
>

Being a bit more precise: How do we reach a node's folios/pages?

 1) through some kernel structure, obvious examples:
    - page tables
    - VMAs / pagemaps / xarrays
    - LRUs

 2) pfn walks
    - memory hot-unplug
    - contiguous allocation
    - DAMON

 3) page allocator
    - freelists (page allocator)
    Sort of its own category since you ask it for folios from a node

> I see some consistent issues,
> 1. zonelist paths are covered by way number 1. Some of them also carry
>    way number 2, some don't
> 2. node id and folio paths can only be covered by way number 2. Some entry
>    points have the check, and some do not.
> 
> I can't tell when a call site has no check is deliberate or missed.
> This matters once non-common node gets its own zonelist, as patch 4 metioned I think?
>
> Could you clarify the rule ? e.g. which zonelist users must filter on N_MEMORY_COMMON
> themselves? and why the zonelist alone is not enough for them ?

Some of this is obfuscated by the fact that the existing code already
does this filtering for you.

I suppose I have some premature changes to add additional filtering
where it isn't needed yet to reduce the complexity of later patches,
but I can see why this is confusing when introduced by itself.

Consider this:

-       for_each_zone_zonelist_nodemask(zone, z, zonelist,
-                                       gfp_zone(gfp_mask), nodemask) {
+       for_each_zone_node_state(zone, z, zonelist, gfp_zone(gfp_mask),
+                                nodemask, N_MEMORY_COMMON) {

This is a bit of a preparatory change to later convert this to:

+       for_each_zone_node_state(zone, z, zonelist, gfp_zone(gfp_mask),
+                                nodemask, N_MEMORY_RECLAIM) {

It looks like we're filtering by N_MEMORY_COMMON, but we're actually
iterating the fallback zonelist (constructed from N_MEMORY_COMMON)

  struct zonelist *zonelist = node_zonelist(numa_node_id(), sc.gfp_mask);

Later we update this node_zonelist() call to determine whether the
private nodelist should be walked, at which point you do have to filter
for service support.

> Whether every path that takes a node id or a folio must check N_MEMORY_COMMON, and
> which ones are left for the feature bits in phase 3 ?
> 
> Let's get the rule settled down and make it as the foundation as well as phase 2 and
> phase 3 ?

So:
  1) If you're walking the normal zonelists, you're already filtered

  2) If you're walking nodelists, you need to filter on N_MEMORY_COMMON

  3) If you're operating on folios, you need to check common_memory()

  4) If you're walking the private zonelist, filter on N_MEMORY_COMMON


So let me do this:
  1) i'll restructure this phase to omit premature changes like above
     (they'll move into N_MEMORY_PRIVATE and N_MEMORY_<FEATURE> commits).

  2) I'll restructure N_MEMORY_COMMON commits here to handle cases 1-3
     above in that order, and that'll hopefully clear up the confusion.

-- 
~Gregory

