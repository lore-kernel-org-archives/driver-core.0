Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF853FAE1C
	for <driver-core@lists.linux.dev>; Thu,  7 May 2026 13:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778161801; cv=none; b=aousnPg1SeIMnH/emfZSmn/y5/hGm5/t/ELZqCI/pjo5nHV0YojfOnml7mAIOHCXTDOOL4lNMevG2TAXak7wzjLx/J9FoEcxR5xrnr6yCiKBKgvXM+rTMZeKRhiXgsspt2WTkHWG/hg9rNnvIDk94WB9Jg2LKtOD+1wlCOBzlLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778161801; c=relaxed/simple;
	bh=y+uKXvWavECBqe4i8FCfX/X2zoA3kl9zR298cLW4eYE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MmnuMFu4koigiiWiawED3wu0/XaSrqLnG05D4ZnzZLAHq2yM4Wj6ZGgRKk5vqYxb6PYA/sVrg0hFo4STFwJty+12lo1iITDMzZSvvPccc2/uHjFG+I/XvefUob06AJG+pkh1eGsU6fUAMe4wG/4PHZnQ80OBxbzTLriGe5IhqPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fsnamKnf; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fsnamKnf"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-488b150559bso6818465e9.1
        for <driver-core@lists.linux.dev>; Thu, 07 May 2026 06:50:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778161799; x=1778766599; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=63Zk1soB0pWql4fWbhVmbD4zB7eoGfppwocKxntreYI=;
        b=fsnamKnflXOTDVZl36ZkO1cYcppBsMxtXFZXSmp3mAD8Hw38sJYQfrDjX1L075i3jR
         je8czyRD20TDbzMryNKd9p+l91/NhLGwITlaWeIe/kBjFIWiVaVL2ioGE3scMJYJ570i
         15IXOxhOeTdOXS5GcAbU9uCe8GtQ51GTlzaa0tTRfPvFav9weZY/T7B2ux03rIbd3QwP
         FIvei1IZO/+AEN1EAXlS8c2C1CE0FW2lLI/VyY7iFPt3tPrLBKDBP54qm0G/YsX2tB1I
         h2RmyPmRfgdaP9n4kLgC1Y4ccc24Ns4JjTVKHQe/Djw1M8mbGsrSQn5ur2fu2AvrCzcc
         XeRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778161799; x=1778766599;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=63Zk1soB0pWql4fWbhVmbD4zB7eoGfppwocKxntreYI=;
        b=cfwAFzn9J/gLRZbcP6Ehcx1cizIT//4nzFe2G1OY/bag/QR/Y1CP8KiHPOkHkZt2Tp
         lBtbsj7cDzkko68dLd81gRuBnudSAeTYrGZyi9eTOR991Zbozr35yqxrkU3SMsg0zMU8
         98JRpnbcT68B4FZIwPTySyx5p51XpIoZcTszDqzfUWuhPHbcQtXX9bdWqfUuAnRIR2Sm
         yjESD4zyEPk1nuSIBODfsCHPL7Cnk1NwOO022iUXqnUKrzwNSCJsm2dv7sdP8NiKUKHu
         kEOhbH+t/3+j/4OEJ2R9bTKPWi9ppIpz6+yT2kT3G92DoR+4+0YML3PE0SkbdX3Tk15z
         uVZw==
X-Forwarded-Encrypted: i=1; AFNElJ+7JjMBYIV2pSFfl6iBMJ+7Zy0hN2HFIetVRcH6UK+3ozIT/t8Jk8KS4FymJRsvudJJiZSR24/Ljq6Dsw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwQXZxX6jQDK5e3a2wC4MfeYFPKp3f/YdzBidgCwecFkRyzxxWb
	PwvRKlmGTvVE4616AnEPFYurU3HbcF0w5WiDseEDX1rABVgudZ41wARN1ayu
X-Gm-Gg: AeBDievDzuJM0iSQESPHZ38pm42t/bvyp4RobmmGVjika5O3/M6sN7F5pZ/uow7FJAE
	gTiIz5A0zZIi0+Jy+v0EZNMuGv5dU2ZZX7V3mjdpG6p7lTKs6eQxiOluPWzI2zwiehJ0rhNt4gP
	eKjBlK9+MVrEsidsuSomCySkB/+Ht604vYAge8PBLMzLbaLqrau4R0CtJTyo/lzwwCULPf/1TkF
	899Mp+f7avBsfYVzzlYs8Ry+tYN7UjQpD33VIl8SdJvM7DwFcoSPncmEfUs0f2nv2SSchH5o1/l
	uOVTeL8LiHaMKpMIPtL3h2Oy8l7J25JPBw+Ach7Gz9Ov366oPVe7+E4ipp/TdYlF1oNgxEDOhA7
	zjqxkRnZWWBzFOwnCPPR08tnOEGUzg8s8wR1Pbd/dmnszp/Dk6qSVLBhx2sGTn+ZL8TV+5zriZf
	P+UuxXePPb0GQSidY0yBS9W2ftL1xILYd0C1JA0SPQZ/ekadpAaSGK8Hy+vsv+Ls/xS6pY7c1PD
	G7uyQ==
X-Received: by 2002:a05:600c:871b:b0:483:709e:f238 with SMTP id 5b1f17b1804b1-48e51f4652fmr137400015e9.29.1778161798241;
        Thu, 07 May 2026 06:49:58 -0700 (PDT)
Received: from p183 (dynamic-vpdn-brest-46-53-134-148.brest.telecom.by. [46.53.134.148])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e5382a327sm224564925e9.0.2026.05.07.06.49.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 06:49:57 -0700 (PDT)
Date: Thu, 7 May 2026 16:52:19 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	linux-fsdevel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH] sysfs: upgrade OOB write by buggy .show hook into WARNing
Message-ID: <7bc745f1-a8fb-4bfd-8b85-657333a1bbf1@p183>
References: <5f794f46-5afd-405c-9747-76f2c95d4598@p183>
 <3cc3e8c6-c6e8-4625-a88f-f5708b935dab@p183>
 <DICC6TIGNBZA.1ZW4SSME21HRF@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <DICC6TIGNBZA.1ZW4SSME21HRF@kernel.org>

On Thu, May 07, 2026 at 11:28:29AM +0200, Danilo Krummrich wrote:
> (Cc: driver-core)
> 
> On Thu May 7, 2026 at 11:01 AM CEST, Alexey Dobriyan wrote:
> > Buggy .show hook will get just 1 line of dmesg:
> >
> > 	fill_read_buffer: ext4_attr_show+0x0/0x600 returned bad count
> >
> > It may or may not oops later in some unrelated process.
> >
> > But buggy .show hook most likely is corrupting random memory past sysfs
> > buffer therefore deserving more. WARN, make it more visible and let
> > QA machines panic earlier.
> >
> > Also, delete useless cast -- "count" is >=0 at this point.
> >
> > Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> 
> Reviewed-by: Danilo Krummrich <dakr@kernel.org>
> 
> NIT: This patch also cleans up the stale "fill_read_buffer:" prefix, and instead
> points out the actual caller, which could be mentioned in the commit message --
> no need to resend for this though.

Yes. WARN prints enough information to locate the bug, so stale function
name just goes away.
