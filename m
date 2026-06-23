Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71479313545
	for <driver-core@lists.linux.dev>; Tue, 23 Jun 2026 16:36:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782232586; cv=none; b=uclceh43+sCWXZHuBc87s0k0iZQjs9YmaFtx/eiUeq1NgzET0VNuWHd6XhJRglavLjOXPLxE+FcU1FkBs4ZW93x3zn/j6ymVCvl329lsNt+lTZ3BCQ2Vt8q424cgq5FWPpu1xKKMGogsIRsPqClFEudW5vb+O8h1u3PvjJ9ImXc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782232586; c=relaxed/simple;
	bh=6BUYor2v9oAXOWo+th16C0IQkWGTKnuLB8YOp3bBc2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NzHcLAvVFhYkyUTFVzBCnDP4w2Vz7/L98tGz+L6cRiloszBp4Z/bPjlhQir18jw8wf7tZIO2XqP2nlfc5rP6ztxZPW34D54v7G9jHs7YWaA0oxb0s3NTpMgt5QKUurn79xuRDpF6UWa23AX89cBOPUDXgX9SkMyxO14boEVZef8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=V2wxzgHw; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="V2wxzgHw"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8dc87f7d68bso1266466d6.3
        for <driver-core@lists.linux.dev>; Tue, 23 Jun 2026 09:36:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782232584; x=1782837384; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=dpQ1AwczYKCoguf7Vbwxx1q5Epc4lMpg8aH6LEWm7xE=;
        b=V2wxzgHwXjHtsE+GClThM1TyYPpOWl7Z1Zci6Z4ZzFrn4TpNC3GezxhOz8ChQ00LHl
         o275Pb0Trj5waPEXRR26hJ99vCPzlVL3XNmRuVjhuV6fkroPRB0zihNCG7Gn8j9O1QXW
         s21nEwE93hGNRzrMsh+ldE6ex2lm6CSuJaxPQQGu2e6JT8R0XDwuKhQ5R3yMb02lzb1b
         +ETIh7sucxPvjijuIB9ak9IABAgWJzZg/fehuz1LvTjQ8lPhzJgYO90TTrgwJXNPAbBq
         a8CB3WYgIkA+vn4G4BhhG3DCwusyKAqe1QJzqsIgJNRZYHTvaNC82RHylqwdMGOjPhMa
         7JRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782232584; x=1782837384;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dpQ1AwczYKCoguf7Vbwxx1q5Epc4lMpg8aH6LEWm7xE=;
        b=hp263xMylYZ1cppVUK7tonlnapBDdkJu+wjNbfn4aWmqdW54atJyUvEQNKtwE7N494
         1Z76mnNNNP5bsgQxZNG7eCSZ18Cgo1rEYEGVB4TnkUE6Ewpb6WwsraEOd+KPaHtuh+fP
         JmrDZqnG74hKTUJIiYVSpPHYyIL9qgT9RA64RI6/vcKHDoKEXTELmDY3Z4DiGD7Jlv5H
         T86eXIpOYvdjn2BvgxSzxdBiK82gXzNcL9OEEWg/uwWuXKMBkH4u8iFA4JLcLeaTLUny
         oUm0s5XPvv8Yk+0OGz3KyHlodLrCGTUcxvl6WoIPAAXYOvf2r8IeokhqxqkAQ1G5geFV
         ysVA==
X-Forwarded-Encrypted: i=1; AFNElJ/H9OymIDVlNr1oPtZYeiXAAVU2Mg4GcQ4Hoah0owFK1H095piHb/LMY/MtxUoCHTty0vGiRAS5DomRxA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxzoS4bH/iYSI7Si/DBtijhSDtq3iTi2ic2ruEM90+4MdwsXJZa
	C2h1jS0AyO3Q+40oYhf8ExvIN52XbL3V0zvO+RCiFeF5lua5xTsmT2TIt2cHRGpWzes=
X-Gm-Gg: AfdE7cn4sDTYJ76yjKeTtMPB729EEcrvadNXui2t8QZpxJ+J6AvZrme2kRdq2p0tljo
	A+QHTmRucCQJFg++9LhFhsC3fppkd7+Gas9WhevcenO+EzNsrsCYO8VZj9TSWGR1sE9LXxk8DN8
	eRvhSWpjf9QlYhaNNVYZ04NZ322C4K04rBodyjDewamh3salFqEjfA0PAgrq+VXLIyg/NXwhtEj
	VtAEv4K5WnAPKTTevzXmfwepqZk/jjcV4d5WYqgquxwVjLlFlWyqVuxJmniQTrn3SsRPVUjD7C9
	Kcq+Zryt+/HxU4iSjQ3TFUpbfv7I46E8f2K91yDEhjZY0n/a90nq7zNeHhl4pBTICxtRxjs2Srn
	MWags7vfNl1+W6mGOdAtUHn99uqTyO+qB/m9Tn9dxAh0tcAS0hthIO8BdTDo861derfoxE9bn/B
	w7dm4yj6x8QHZ9fPhyilleQHk8VqZLbjz6LiO/dvpmYeonBVOvxLDKzCFxlMyDSMuCxcv75ya/b
	ieF0Ts=
X-Received: by 2002:a05:620a:6892:b0:926:a969:89d9 with SMTP id af79cd13be357-926a9698aaamr393123185a.7.1782232584382;
        Tue, 23 Jun 2026 09:36:24 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-926000c2a09sm306953585a.31.2026.06.23.09.36.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 09:36:23 -0700 (PDT)
Date: Tue, 23 Jun 2026 12:36:19 -0400
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
Message-ID: <ajq2A9GUOBWjzYM6@gourry-fedora-PF4VCD3F>
References: <20260610014517.253609-1-gourry@gourry.net>
 <20260610014517.253609-2-gourry@gourry.net>
 <aip5IWmxg9CWg8hQ@kernel.org>
 <airAUSrNjbSEwuti@gourry-fedora-PF4VCD3F>
 <ai5vj_RjSxl_FLu-@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai5vj_RjSxl_FLu-@kernel.org>

On Sun, Jun 14, 2026 at 12:08:31PM +0300, Mike Rapoport wrote:
> On Thu, Jun 11, 2026 at 10:04:01AM -0400, Gregory Price wrote:
> > On Thu, Jun 11, 2026 at 12:00:17PM +0300, Mike Rapoport wrote:
>  
> > So really i think you're pointing out that futex_init() here probably
> > shouldn't be using num_possible_nodes?
> 
> I'd rather say that num_possible_nodes() with and without CXL (or other
> differentiated memory) has different semantics.
> Maybe we need to add a new primitive for possible differentiated nodes and
> keep num_possible_nodes() to mean "number of possible nodes with normal
> memory".
>  

We'd have to define "normal" here a little more discretely.

Normal = N_MEMORY at __init?
Normal = N_MEMORY in the future?

We also use the possible_nodes() mask to allocate per-node pgdat, so
the futex example is largely just another "hey look at this thing,
I wonder what other stuff is out there".

~Gregory
