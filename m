Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBD433F8246
	for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 14:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781535257; cv=none; b=qoA67KUoFhfAqN14z7vQ8GQqRh9oUZE/kGyrGzh0N43LlffyFb1VVrnj6a8kN3ryvPY2/3W7GczNZtruf+zYi/Qf7jjfz72QhpezYlO+XjRQjSnpNwt0lQUtZONdDsyBv46c8z4l8mogwRuELfuvCBPgOeb2B4j2rDN/AEKxhLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781535257; c=relaxed/simple;
	bh=KYBcS7h0pNuUxhCatDx8FkyldB1WhenoX3VwO+hlFKw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ewMz7RfxS4g+vHVOigna2Mnt+L2SdpuqPW5uT5Xl7s/binidWv74D9se7bRX+AmAVa0dnLlWQV58vd1u1Xj2WyqvlAPJ1WIz4ujx7fheMQh6kHD7UmtatMmFIQzmrxgREbkCR3gFKYje37uT5RqY5Ky4KX7jtPBk2sd+qKPxvP0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=fni1lnsr; arc=none smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="fni1lnsr"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-490be03d47bso36556835e9.0
        for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 07:54:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1781535254; x=1782140054; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EmZs6H9aAPAvXyfQHo8A/76oZU6GrjxGn5dT6papBg4=;
        b=fni1lnsr3vgAfBImg+e5mUBelRxJGE7zp4UbakpAECRDsjO0uz1g7thsuADpQRSvml
         yqC9EEdTYIV4k7nMZ8I6pEI8KBEoXRKsxORcuQBPK7B1nMRSBpdG+RKEpba89DfK40yE
         SJl1MNwfWwVU3jkjbRkzmkSHXCqVSXyCtu8Y3d/OBY4sFLyjetrwb9sxoKtrz1kYUn1/
         OyY74ASH66AfhlqAE84xpCevyq+7qclgeijNKGqlqxGTvT+KexpSXH+ZhWKPAsm8l8g4
         7gojqR/IhQRh97kRlxXNjofZiNd/h70cFKERGAUanPaMaCWMuJF9oTsAH9g+ApDvha65
         ovhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781535254; x=1782140054;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EmZs6H9aAPAvXyfQHo8A/76oZU6GrjxGn5dT6papBg4=;
        b=DoLbZ1+1891B+Oz+UQA+HIhbZ8SoZnf6wJxkFh0pD96bJnIeKTUjzTR9+fZ4llhNpq
         263cFR6uF9iSZX2q9BNcHsRjTCFrtKASeUyEo6bgbvFpNo4w3qE7kPpKyA4UNz+9/gag
         YAicvbYJN+I54lfAvbzioGJgN1qSXU2OF0wSglECa0LiOeAPckd7hnS50AlDke7i0Cbi
         cdnj/LCZDjj5v5Kb+56b1IGpIC+BigJtl4u1l0n6OgjPwahJif2uR38jaQz12DmU+24O
         Ds4KaskxzV28MVwlsja5rAtXbNoEeqxw9h4XE+pKHqmwDZUuqsdojdmDnl0dx4G4ZIP1
         ws5g==
X-Forwarded-Encrypted: i=1; AFNElJ8t/PhF1xjlWSD5C+aauESpkKue7Ao+W97wsiOhHuAmk9CdHrc5ThMWNIz097yEjnppyFoNtYD49Bmf5w==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy2VHfTrIpgH+PXqC1+h6m+la8r0l1DbXURpVhaKuggBUgSbko4
	JRW275hX7GReCKf/y89njrtG1oEMFHWrXeYNLTLSAT88vZPwu1yx1ejVwjZNqnnAwrg=
X-Gm-Gg: Acq92OG8Aj1Rz7xGM5/IrXGMRtS34+shgTYJ8Obl6zHR5eRDp82QRYtt+qB7knrHi4R
	mee3IW+VijdaS8Cr+oJVBNiNpBY7gVuuogK8ElpWL6pETQKJ9VOjHqtEdCYGrlk67eEPXmBrM3c
	z81BMkY/SbkBGAvZXfaanGy236IaQW3uB42wkHkI6EXS8vJi/SbvwTFjVMSePafxBfnY63SByMX
	Vm7dUblgxc3xyvgsbe7WImc391n4b5z7uG5bUyCA7n2EQwGJ7Vboj2d1qzYD6bLV0sDHDjzuwBo
	wf03s2C82mZTc1qSwkd1+RAwQJZUboEh0yMnY6pSsp20pE0wht+rLctpbU1Z3Hu+SmVK1K88jgz
	SvNFH5UBXNtLj7aeW0aCLZguvopgV04XjCskfhJPfltwMtR5YodoAObMQDNDJIYcs3NFPyj0cN+
	SZKDzMMEBr9Ia65w==
X-Received: by 2002:a05:600c:3512:b0:490:bb45:79da with SMTP id 5b1f17b1804b1-490ec4d650amr196478285e9.13.1781535254039;
        Mon, 15 Jun 2026 07:54:14 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3081e5d0849sm16670216eec.7.2026.06.15.07.54.10
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 15 Jun 2026 07:54:12 -0700 (PDT)
Date: Mon, 15 Jun 2026 22:54:06 +0800
From: joeyli <jlee@suse.com>
To: Lorenzo Stoakes <ljs@kernel.org>
Cc: Chun-Yi Lee <joeyli.kernel@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] debugfs: Fix lockdown check for mmap_prepare
Message-ID: <20260615145406.GQ11413@linux-l9pv.suse>
References: <20260615104750.1000-1-jlee@suse.com>
 <ai_fWlr61AzrNrDz@lucifer>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ai_fWlr61AzrNrDz@lucifer>
User-Agent: Mutt/1.11.4 (2019-03-13)

On Mon, Jun 15, 2026 at 12:18:29PM +0100, Lorenzo Stoakes wrote:
> On Mon, Jun 15, 2026 at 06:47:50PM +0800, Chun-Yi Lee wrote:
> > From: Chun-Yi Lee <jlee@suse.com>
> >
> > Commit 651fdda8406d ("relay: update relay to use mmap_prepare")
> > changed the `mmap` file operation to `mmap_prepare` for relayfs, but
> > the lockdown check in debugfs was not updated accordingly.
> >
> > This prevents debugfs from being locked down when the kernel is in
> > integrity mode if a file uses `mmap_prepare` but not `mmap`.
> >
> > Since the conversion to `mmap_prepare` across the kernel is not yet
> > complete, update the lockdown check to look for both `mmap` and
> > `mmap_prepare` to ensure comprehensive coverage.
> >
> > Fixes: 651fdda8406d ("relay: update relay to use mmap_prepare")
> > Signed-off-by: Chun-Yi Lee <jlee@suse.com>
> 
> LGTM so:
> 
> Reviewed-by: Lorenzo Stoakes <ljs@kernel.org>
>

Thanks for Lorenzo's review!

Joey Lee
