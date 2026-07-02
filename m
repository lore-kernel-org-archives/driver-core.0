Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA6754ADD87
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 14:43:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783003422; cv=none; b=mxozAKBMJSliU1c1Rs25XvMO8sjslZQm7ZdHOxyiv+b7nBVvVdXrPu4Y7SwrfB9kpkPQwl6dMVG+Qds06ZBE69Ga6baYsIYX/xGCcZUMjBtZ92eV7kxmLWyfpzKWlXYExSSNc15XNyeyRB4lqKFAUaugazqxL76J/A31EXHUd/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783003422; c=relaxed/simple;
	bh=UOPiJT8T7uTyFa7QTYmnZ8k0B56Jo1xH8oEC173P8GA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iixS6GbbDiZXBpaKswAeKuQcc0irYWeAuldcWt4hU1AEIVK0Obm9GcCym9/Qqorw5c+QCHuNPwkN7r3UuDV66/aQRZ4vYCqkfD/f8vjuYdOpUdfIJ6kN0zayXcaU7qcqqiyjebYOXoCmx3jbuMj9Q/5Viq/FLpsTQ6IpHuDNl8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=JHeihkxY; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="JHeihkxY"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e6c4a867cso108604885a.0
        for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 07:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783003420; x=1783608220; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=zMKSwJv9NceXHRupMFvzinKFBnJD1eW/sagn2nvHuck=;
        b=JHeihkxYEWpdYAQaIP54ZzjCuOo0lge/GJO2t331H3HZujN51rStMEQckIXv9O0K0E
         fi84oNA6KoHtYqznBQtHlcz1OzqTPM5DN9iwl3IxKtZ8jDs7zQ6BBMVCsavY2R4y5o0o
         N4cq7iiK7bFLMssLMCEoXfNcXFN1qtLxnAn1npqOiItR4pofA3NbAVGKUGDScg3qXbV4
         IYPp8+EdjlunCwbCuj6bwW0RRSbgALPbAgfEpnzIP136pyz99r814eIM+Rver65O9igJ
         Jyi/WNRj5GM3LjSixLp8vqO+7esAzAFaBGzuZ0b6h5sEC2H6g4+ZwDVV3WKX1a0QSjGG
         YWfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783003420; x=1783608220;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zMKSwJv9NceXHRupMFvzinKFBnJD1eW/sagn2nvHuck=;
        b=CwKOy8EWE8MLNdF/rc+96No37VFlEOsWFFnXjuz4u7lOPGrc3hBshty2dfw28pH1dx
         EYNVpo3Wwj1BcyMdKVQPjU05sLFAcFQkgcvh9ZWnHtIjlC1Xrg0ahgpv04E+E7kl63Tf
         Uo9OQrUfk+cpOvujv7sgO4/9kOi3+koLNfmO6HwSFeUtFLq50XzahqmFYt8cafj56Cnf
         3YCr9WXSF77BrnlUGfj/4kgJi8TsECcijEjyqLmSyjYeBkNDJvI7tMPUjjrcGcwpp1ba
         8dy7G5sAdbotvmA8Gqvm0i80EryP7m/8bhoP9kQkQBgtBziAGkAPeNJCkqJJROb5veAk
         1R8g==
X-Forwarded-Encrypted: i=1; AFNElJ/i1rAjyV6gJyEcLuR+KbVKeCdhr27di6nSB1ZyQ97/dW7vm8AAyERaxEa5day7Fw6XA1Aom+tyM9beeg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyOC7cjlu0AP3bCMfj+kSUOKJs0XAVGC6qbnWXFUPP3QVrdLsZJ
	Gnwfv+K2rt0+N+3FEqk53YQQqJ6ScyQk/Y522uKcEjLSTAX+j0zAW2HvYDaeWoGHxrM=
X-Gm-Gg: AfdE7ckngQUPyjBVm+3wULoaFxZzTmNcQT/LYnVfWj5cinohMPcmuqLuyBa9hToQ34/
	ZBV+J7Gov0phXeiescOLfgX0uSIXMs+7jFrrNbiSAOaSzz2csd1lPWimg5tx222BlIhv22rijQM
	aIfF+KqnFefnR6N/Uspz7Won3d6eOVU94u/okkq0m/4VsB0KPPA6XIegZX3h33hLEwCXfVShF21
	qdrJ1L25Ib+sbJbinMpVEPDT3XCoogZ8aC/JOIpY4951XAVkuzcVSrxuIZYARP6t2NN67Ssypk6
	8JPrCWcFmN/AToAxIUwI03zbJIm11+NDE7Efk4S8Gb4C1sbvaTXIHs1lCg0qpJkbxcH7QhmYbew
	cZEWr3T3iJUlbCLt5zCNGdyOZeMktJEU6wt3Vau71EBUbC9wlJwh0syI4vBmSytFgK1zNR/wYpB
	Vwpb0vCeFdaigYEcOBCSe3fkqmHKeAOOP3kI/BdKO9EbThyHoDruUySjHj9/a7+2i/t2NK
X-Received: by 2002:a05:620a:4708:b0:92b:774:da66 with SMTP id af79cd13be357-92e7b42debcmr706158085a.56.1783003419654;
        Thu, 02 Jul 2026 07:43:39 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801bbec0sm236826085a.45.2026.07.02.07.43.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jul 2026 07:43:39 -0700 (PDT)
Date: Thu, 2 Jul 2026 10:43:34 -0400
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
Message-ID: <akZ5Fs5aSO89KqKE@gourry-fedora-PF4VCD3F>
References: <20260610014517.253609-1-gourry@gourry.net>
 <20260610014517.253609-2-gourry@gourry.net>
 <aip5IWmxg9CWg8hQ@kernel.org>
 <airAUSrNjbSEwuti@gourry-fedora-PF4VCD3F>
 <ai5vj_RjSxl_FLu-@kernel.org>
 <ajq2A9GUOBWjzYM6@gourry-fedora-PF4VCD3F>
 <akZG0sb1pXFZQQqA@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akZG0sb1pXFZQQqA@kernel.org>

On Thu, Jul 02, 2026 at 02:09:06PM +0300, Mike Rapoport wrote:
> On Tue, Jun 23, 2026 at 12:36:19PM -0400, Gregory Price wrote:
> > On Sun, Jun 14, 2026 at 12:08:31PM +0300, Mike Rapoport wrote:
> > > On Thu, Jun 11, 2026 at 10:04:01AM -0400, Gregory Price wrote:
> > > > On Thu, Jun 11, 2026 at 12:00:17PM +0300, Mike Rapoport wrote:
> > >  
> > > > So really i think you're pointing out that futex_init() here probably
> > > > shouldn't be using num_possible_nodes?
> > > 
> > > I'd rather say that num_possible_nodes() with and without CXL (or other
> > > differentiated memory) has different semantics.
> > > Maybe we need to add a new primitive for possible differentiated nodes and
> > > keep num_possible_nodes() to mean "number of possible nodes with normal
> > > memory".
> > >  
> > 
> > We'd have to define "normal" here a little more discretely.
> > 
> > Normal = N_MEMORY at __init?
> > Normal = N_MEMORY in the future?
> 
> Normal = not differentiated, no matter at __init or in the future.
> I.e. memory that kernel will use with existing allocation primitives.
> 
> > We also use the possible_nodes() mask to allocate per-node pgdat, so
> > the futex example is largely just another "hey look at this thing,
> > I wonder what other stuff is out there".
> 
> Right, futex is only one example. My point is that with multiplication of
> possible and not populated nodes the possible_nodes() mask may not reflect
> adequately the limits its callers look for.
> 
> And that maybe it's time to audit possible_nodes() callers.
>  

Totally reasonable, I have been thinking the same thing.

~Gregory
