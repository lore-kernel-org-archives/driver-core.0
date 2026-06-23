Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F46438D6BD
	for <driver-core@lists.linux.dev>; Tue, 23 Jun 2026 06:11:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782195105; cv=none; b=Pt3Jm4OYiDHz7NbMu1Cvy2hdNCUEHO0X7KikYMEoEvYjF3eYZV4ciFcmVqXbGGJRIENEcwROg+CCuO/gUVSW4Vo4eq0vGF/Hb/zqStqGmOV7eXNshVcU6Kmaw5CeVNDsU3pxyyhZHqQUQNSsu4cQ2gvLA9t8j83Y4JI2ybbYp5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782195105; c=relaxed/simple;
	bh=lbPIcbZwWKO9mggxTz7p3Nf3bUnQJxUwEnf9iEg+jNs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KkmlT814S5MT+i0bhKKb1W5X2qTkEeaa+GEIEl/0chcLSYq0PrAuBjPOokus4oHjbX+dka7V0mq8VZGXOYN5AiKhxPF+Py5cxz8B+OloF5dVExUNSH3ybsxVKnWCqbUfSxSVY4kgqqFViOtetMJ44Dizh28n9Nf+MEIExPT4Vos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=en5wApSd; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="en5wApSd"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49249707788so20864895e9.2
        for <driver-core@lists.linux.dev>; Mon, 22 Jun 2026 23:11:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1782195097; x=1782799897; darn=lists.linux.dev;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gEWRyTTg19ufsww9mTBAfvx9IHHIlg0mdl0hqLyxq/0=;
        b=en5wApSdMMmrsFDM+1FbfErRVX6/ma1M3w/kpOFtoypREsohqvlfV5UuXMMBHiYNER
         +7aCrMxMcaN2Xk7HmubfcaoaJIpQOUO5dnwjI5BBfWUU7NrPdjVqppLyDcVhr987/DRu
         1eeCcUuA2/vQ3+Q99gcnxcN6rQDHWu36aL7hYdnj7PxDgoehLrusDtvZCn4aezN1qOci
         BGIxdbaYuILv+y47kaq1WYLRgsY7un+gM2bS72rgalZCD6dke33i9gjZ5QJJ60tjhndn
         JvglZzQDrZmjaaihMKI3l3piwrpZmo3BxSRiSF6lSj/qSESj4ud56vNZY1ckLy1llRh4
         dQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782195097; x=1782799897;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gEWRyTTg19ufsww9mTBAfvx9IHHIlg0mdl0hqLyxq/0=;
        b=eh/79zIM1J6Uf1y8dyxJt4GxEsPj3aqTFwvhDOZqHXaDZzJKhqU7PZsaeAlHLPW9nI
         BJz1y44nZmIwaEClzLsJHpbJLjaJsta+N1sEmM7TwQJSrXfBmuXt25xg2K6AmD9uXzSn
         kOd5xx2LaTgdJn9Q6pah+0Tc6qHgn5ELHeQbupiNNkMjCLCaKT1+Vr8dABotC+Z/rDWG
         jlSZFda9d6CgBA8RipI+0QipMCCXf9ZkHu6GnfKXo9RiKsvQonA1eaHXsMviQFQuC3Tc
         ODBDKkZuFwh+gYUsVisHm1ntVGQdQZPRA+mYMS7iXWRYg5uTV1vyLuu2M/qqM/yMZHaI
         wXKw==
X-Forwarded-Encrypted: i=1; AFNElJ+w3nRMqnyzmueq5vzuFVGHtKG21fLcRPhn01TKNeHptVsKCVTVx8Y3WKt4zD2DkSAVNZ8NcgWs1U2iIQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx0Lh6gtWCTTQ/pVx+OofSUDnd86VivtLWLdnht2nDQrTyUeonY
	Yi9lVykZ1+k79BhF2BFsnAmvZE3fMUvYv6mcWM/evoU7taMQhIFFYlBglcT/Qn+nU2w=
X-Gm-Gg: AfdE7cnSgIG7SPzIO6YWFr5IF9QPyinA0BX1SXcXk9Sr0Ree93dRBYl7NbNiRT+ybte
	0c8qPmV8e/sOUDNME2t+9uDlhbHKFxarmUDZKGcR12DLIQEKWccdRTRfqe5I+n91qcf/XDVyey9
	Rlh3Z7GmEpdQI/DbAw0egVGcDrRbPL8Ou1F0hKbiqInU1Y5UMHm8L3gb9bCZph7GYu9avT//Gbb
	kkhqlK7CfGWTp+HPGwWWIN1UHDcbX8OwUDN3+nM/wzIcIZToBTGQd6xNpii5YcTA+uHyRIsIeYu
	+tJjIuYXv6fVOH0b8jPIDJzNlbdCEAsS8b3SQ/9LugqJw/DxOB6nn7ovY2JArkWXauCLM/6FS7Y
	Sjf2CAGoBzaJsjbm4ow8d3m19FIYTwiLlPK3ygLDKdM09t3Xi/BxJnHDtuV+jCeagDkYVFa2vZy
	69gm4=
X-Received: by 2002:a05:600c:4694:b0:492:4717:59fb with SMTP id 5b1f17b1804b1-492490a77a4mr214171985e9.17.1782195097216;
        Mon, 22 Jun 2026 23:11:37 -0700 (PDT)
Received: from linux-l9pv.suse ([124.11.22.254])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37d1aa48f04sm2986708a91.2.2026.06.22.23.11.33
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 22 Jun 2026 23:11:36 -0700 (PDT)
Date: Tue, 23 Jun 2026 14:11:30 +0800
From: joeyli <jlee@suse.com>
To: Disha Goel <disgoel@linux.ibm.com>
Cc: Chun-Yi Lee <joeyli.kernel@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	David Howells <dhowells@redhat.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andy Shevchenko <andy.shevchenko@gmail.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Matthew Garrett <mjg59@srcf.ucam.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH v2] debugfs: Fix lockdown check for mmap_prepare
Message-ID: <20260623061130.GA11413@linux-l9pv.suse>
References: <20260615104750.1000-1-jlee@suse.com>
 <30561ae5-1e6a-4cc2-99e2-436c88b2f11d@linux.ibm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <30561ae5-1e6a-4cc2-99e2-436c88b2f11d@linux.ibm.com>
User-Agent: Mutt/1.11.4 (2019-03-13)

Hi Disha,

On Fri, Jun 19, 2026 at 04:41:57PM +0530, Disha Goel wrote:
> On 15/06/26 4:17 pm, Chun-Yi Lee wrote:
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
> > Cc: David Howells <dhowells@redhat.com>
> > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > Cc: Andy Shevchenko <andy.shevchenko@gmail.com>
> > Cc: Thomas Gleixner <tglx@linutronix.de>
> > Cc: Rafael J. Wysocki <rafael@kernel.org>
> > Cc: Matthew Garrett <mjg59@srcf.ucam.org>
> > Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > Cc: driver-core@lists.linux.dev
> > Cc: linux-kernel@vger.kernel.org
> > Cc: stable@vger.kernel.org
> > ---
> 
> Hi,
> 
> I tested this patch on ppc64le with lockdown enabled. It correctly fixes the
> security issue where debugfs files using mmap_prepare were not being
> restricted.
> 
> Test: blktrace/001 from blktests (uses relayfs via debugfs)
> - Before patch: blktrace bypassed lockdown and accessed debugfs
> - After patch: blktrace properly blocked from accessing debugfs
> 
> Environment:
> Kernel: 7.1.0-rc7
> Lockdown: integrity mode
> 
> Feel free to add:
> Tested-by: Disha Goel <disgoel@linux.ibm.com>
> 

Thanks for your testing!

Joey Lee
