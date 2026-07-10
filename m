Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297DF31BCAE
	for <driver-core@lists.linux.dev>; Fri, 10 Jul 2026 03:08:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783652938; cv=none; b=f7mXAOF2cBH0hGXDdrCP617yMcmwuQvFLnO/WhL6HCN7Sepg2KbEMXu52GwltW0d0zm+GkXsrm46w4Ztrh6eapAtoW3uUVsgbdztjUVLcL7jD8lnglyNErnm/8FS7rDU3WmAn5mkylXSRocWw89NSfyXumQXYDZxy0zAScSkEH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783652938; c=relaxed/simple;
	bh=le65lxpxw4W65xyZzPtwOptaX/haFn4+aLgX+gVQMQw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jmbn7RoiKAOat8tkIa2mJ6usJoWoqEWYIZDAHnBPuj6hV6M6y1FfTxrbES7j+4MHq3HM/aOioiCAzxCG5nfDnjEHKfyKJ2vd8wSu3PsEzkliJXhy+71oUO+4OUgyxrwfQCJlTy7WAZmBuu/m1XO3Zf52uQXSBrzjuGqTmnmsOJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qTVsr3Sa; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qTVsr3Sa"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e54f8c051so19416185a.3
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 20:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783652935; x=1784257735; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kr6wGBD9MJbLbiRkKQ9M+EqleUNYFT/q4nJmIpqWguM=;
        b=qTVsr3SaQrw/hByMDd2+8yxZD9T8T4K9rNRowfw+sEDC52FzqcL+cvD4x7+eYsgRtw
         fkucFz5qjVQSDEJ5OFvQVUxWHZEO5NEuROix8jBrTMPbD0yHRVdKmuTLS9+YgcmBrvAp
         fomjTqsqZsDVog4pI05N+LxDHI04UMrCbz7Tw1F7KzyH2x3kRod01qK7oaDehBzBlLfg
         8CX6dXF8TZkuILc52ILngtpgpv9bOGewmpRWpsfXHKCOjWmNoJg9zcZo9N5wi2wz0VIZ
         fB8ALv96X9qvALZfW1it1MBYHnedrYZD3Siuyv2lyDkoJPjrvgfo/ox56WcIW6TMblIb
         +LeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783652935; x=1784257735;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kr6wGBD9MJbLbiRkKQ9M+EqleUNYFT/q4nJmIpqWguM=;
        b=bloIq/zOEaNXlWi7oOo5wZD6MgDpZFoF5mwvJ2mp/Mq05W1eMXeUDnBQL5Fuf1Xuwv
         U1pNxdjdsWCNMWPDCb3iuL0ACoyD5a1u5ixyJKjIS2XCeJzNweA+TPBXXpEk4cLkfDdP
         GhFTOA8CbYhlo/VEM2lKs6C4U6ZXw0eD2+SqaR07a/MJRhr99xvenp6Fsm0RT7dhYVB8
         hjD/NCP3Ly4X31xnNw/W80EcJy9xyglzGtRkr6VPeVX9pMCvZ17MaT/8T6jB87WQ6dzC
         ILfOZQlTvzZV1FP5FBRduolv1tbQoop34YscXp2x9eIWWksPmTaOenAYG7DAzBVg7fyG
         ZbNg==
X-Forwarded-Encrypted: i=1; AHgh+Rqj1XUTaFla+bm1ZScqFPWG4DwBkplzM6SQzcjrOciJpYoIbdm+GSDX9R2o8+poREbw+CfENhV+v5wo4Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YyaVv1MAVERhLxS5AQmWXoSOb3dZycgeSV/Q6YpruNRI08AfBTY
	lX2pJvTFYo6Zc9phtXFqW6+yZ4zyCg6XQnTSyLSTp64OBjnFxBCdisI0oSpxIBq1sOY=
X-Gm-Gg: AfdE7cmE7K6bgxQ9A6RasSGAmYJ2qiL6oBPme72rm5kvxTBqpK92VX3v62a6HuNthno
	M2ZgfNIhlk/RfAi2WZp19s5nKkOaAmdM0qlzYE9CCIElEKQkPVqSVVbXHnVlJeHv0x0m6hmvESg
	ZjvH7WE+2aTUlndsnF0T/RgoYdoJYTIGhlVsGzNpNU++rkN3QUdg13da9apiCj+5oTrWvUE3ULY
	Em5T5sTPVsoISBhvBOZDnJayRtUxXMY9sXWV6EtqKHLY07iI3SAOt4bZNflbIuUMfPfvgPhoG7b
	8dF+iPbEfsSVKwvyGPkjw4xfsooKJM+rO5TZKStKM1mLRRfGxmIoUZLeC3fTo/huSwTDtpOTTw1
	xX0VzcbrqEciUVylsZguzMjxaL72EAawot7C9qxThBlu7tX2IgqZTHo9SBM9qdrvuw/XAZWKnam
	SukxtobaICMSxoPs3fhZipprji+1O1OQKqbvkAD1bxSuEF36ZdjflJKGTPXygSsFdC5px98Q4zP
	RUfx/8=
X-Received: by 2002:a05:620a:2701:b0:915:eec4:49ab with SMTP id af79cd13be357-92ecf5dd3bdmr1127366485a.51.1783652934221;
        Thu, 09 Jul 2026 20:08:54 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92ee5cf78a5sm97038385a.31.2026.07.09.20.08.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 20:08:53 -0700 (PDT)
Date: Thu, 9 Jul 2026 23:08:48 -0400
From: Gregory Price <gourry@gourry.net>
To: "Dan Williams (nvidia)" <djbw@kernel.org>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 09/10] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <alBiQArmsWFg975w@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-10-gourry@gourry.net>
 <6a502267b17cc_3b7ee51008f@djbw-dev.notmuch>
 <alApfp2z9Thyan16@gourry-fedora-PF4VCD3F>
 <6a50356aa7a4a_3cabcb1008a@djbw-dev.notmuch>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a50356aa7a4a_3cabcb1008a@djbw-dev.notmuch>

On Thu, Jul 09, 2026 at 04:57:30PM -0700, Dan Williams (nvidia) wrote:
> Gregory Price wrote:
> > > So the "unknown" case does not need to be here.
> > >
> > 
> > mhp_online_type_to_str can technically return NULL, seems better to not
> > just let a NULL dereference sit latent even if we can visually tell it
> > can't happen today?
> 
> Oh, makes sense I was thinking "unknown" was only a result of the
> drvdata missing case.
> 
> > > > +	if (dax_kmem_state_is_online(data->state)) {
> > > > +		dev_warn(dev, "Hotplug regions stuck online until reboot\n");
> > > 
> > > I like that the BUG() is avoided, but I think these should stay
> > > dev_err() given the severity.
> > > 
> > 
> > I had to go back to calling remove_memory() by default given different
> > feedback, but I think if anything I will just modify the BUG() to a
> > WARN() and call it a day.
> 
> ack.

Ah, you know, on second look - DAX could never reach this BUG() in the
first place.  I think this was a hold-over from when i was originally
refactoring and trying to figure out the right path.

If there's a desire to soften these BUG() to WARN(), i can submit that
separately, but i will close this all out with some comment updates.
