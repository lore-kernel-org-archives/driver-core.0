Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C370639C632
	for <driver-core@lists.linux.dev>; Wed,  1 Jul 2026 06:23:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782887040; cv=none; b=TC13YvjwPr4HGSmyfflRezzu8MX9F9T9KueNW+9OGwD91HOZ7VEEfQNfvFO1+9SkWouuYrK6dHzmtF8+zosKauNh4NJyTAil28rDLAASrOeWsArOa01mOj/X/HN5m0+KC+FJXCapAYpBX0MADmcEfEhxzs3KsfZsoB21O8nNq4o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782887040; c=relaxed/simple;
	bh=hP4nlPGIrqeNY9wpwr+srgGK8bvJUTL6djQnXyZwy5c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HOwaof1xwNA6IOEoc8JcIfHOTOULdUpd1dzKNSmMzxP5UgrMp57gddu6hhv+ilHT5Fglzn5dtM6iyJ1wnLcDd+QxPbseEEKGN2Yyi4tNIIVEs6jSKCm1N75fuFZE56C3jR1lk2uo27OQQyQZWwJRIyRsXhykXdc45mU83dPArgY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Xy8kEGHj; arc=none smtp.client-ip=209.85.219.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Xy8kEGHj"
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-8ee88fce572so4190346d6.1
        for <driver-core@lists.linux.dev>; Tue, 30 Jun 2026 23:23:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782887038; x=1783491838; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5xWJ7lGSS4cy1ExwRI73Ip42ktEi6AnmleUk+CzcRsY=;
        b=Xy8kEGHjcMQarQz/Ebqn9z5Dcz+OzRRd/bum7H4PK39WBfljLn7O0Jr9aZA+gkVzHO
         BWBkPl8zFAhJzFeJRNKq7w0VkoSDf6BNLW8iyNE6MiolgnLgXxb+2K2ik+9aABqLx98A
         ZSa79sncwYYiBes+VrIzcQL6Svmqf8ZGCuW/yVptfNLTiW/usH1YKnEHrLbMI0v6RbeC
         UB2Z2IauA4mF+/rHAYSsd0jQlDmWZIpygDJ4gDtTMT+pe4gcHsXoSAOvzQxva5TjNkO2
         xf47l0Ji//mpGVfe3PJmFt/1CtEORb0ITe+DUzv3HOG2S/DAsehd2PexTub6pE28XpO0
         Hk6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782887038; x=1783491838;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5xWJ7lGSS4cy1ExwRI73Ip42ktEi6AnmleUk+CzcRsY=;
        b=IqQ+x2GPAvOTLtQJ3YVGBine/TmCRjqWwCwdRcsWM+ocZert4sJo+jTfiSiprrkAlb
         zMzlVnlLlKDqqlLyAMXmjetJk95Kf4dhKvs55Kk9tGU1RV+aXWZl8hWEWILu/dDPnAHM
         cS5tu1v6l8u6lsCEBDFuPaOMfnOLbkwRUe2E//nqE7T4qkOhQlTFpwwvPa2CWHa4adZK
         OAXPW0QUCEGxkzdgsoofUR+z94/EgBYuD3tu4Os88v+uv61GmGpnqnzS7nNjkx/ognPH
         J2ltIZIyiYgkeodqIsUgBciRwnUyesnR4lsrcNO0UZvu5VgnXVNWz2kr1y9Kgg/w60zq
         PSoA==
X-Forwarded-Encrypted: i=1; AHgh+RrK/igc1XQjTnGKM/tDILSoJxmhI3dtyfnc4u7qKltZvfy7FUQYrjnPh36q090zI6CxnxBoLozDKv1ylw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz1Ap5jf0P28TklFrT8m3IQ2fej0EO3SDBlL/MBBYKdx7o8mt2k
	rogMEcth3iNVJEMGYGf04j3By1nQ1F5zpyzgiDGQWvy6ZF/DJTiZpZdKexu/4ZSj2dA=
X-Gm-Gg: AfdE7clZpw3ibtt+zwJmwx/hi2R/8riiyyxSc5Uj9efTNs1gefqEPM9ur8t2cLQ0vsd
	IIXIHeNhtu8Lojg++5cHHZBsDKPprkz7/519wXlk6fUIPrOQDMuvZ0aqEmxGMQI23wF/bLYq5II
	lbb33XW001/RXUsU59Fd1SfhRifLVAiNhQoitqEgwRSPGvY3dz/jY/qBtalSG16otts01qo1YUj
	0YMdl+VpmPQoZLItfx5SAk2S/R7TyDeL+CAaueN0x71z2USE0CUPtBWNTDujGwcEaiwUpBC0DaE
	YBDA0rRiGRgi8HJt1jKaRjrtAdzpyIITQBY5HXKPlRHVgB9Fpds6ijXRoW0DS51n6FNuGvdtTQU
	LuCX3WUflE5xXQhRksFxj2Txc5c7gS1vIaCUYS7aT4oe9d5+n2qdWd3KatHXxysnF9X1ZIuuCU2
	Wv+DUZ0WOsvuATXFiY1W/DXXRL+z6J2IFxLSscEUaQEa5RHZXC6YUZKQYnmcqTTcp0+5qC
X-Received: by 2002:a05:6214:2dca:b0:8e4:d2ba:d677 with SMTP id 6a1803df08f44-8f3c7e708demr3649096d6.29.1782887037749;
        Tue, 30 Jun 2026 23:23:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8f361ba3efdsm12323456d6.39.2026.06.30.23.23.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 23:23:57 -0700 (PDT)
Date: Wed, 1 Jul 2026 02:23:52 -0400
From: Gregory Price <gourry@gourry.net>
To: Hannes Reinecke <hare@suse.de>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 09/10] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <akSyeHnfcDmxnCSz@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-10-gourry@gourry.net>
 <akQ_xlJtXNgnGUdf@gourry-fedora-PF4VCD3F>
 <abde41f0-7d40-42ba-a232-cc0538cd0e4b@suse.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abde41f0-7d40-42ba-a232-cc0538cd0e4b@suse.de>

On Wed, Jul 01, 2026 at 08:13:28AM +0200, Hannes Reinecke wrote:
> On 7/1/26 12:14 AM, Gregory Price wrote:
> > On Tue, Jun 30, 2026 at 05:18:41PM -0400, Gregory Price wrote:
> > > There is no atomic mechanism to offline and remove an entire
> > > multi-block DAX kmem device.  This is presently done in two steps:
> > 
> > ... snip snip snip ...
> > 
> > Sashiko pointed out a false-positive, but adding a fixup patch
> > here that adds additional consistency.
> > 
> > On total failure - release all resources.  This makes the sysfs
> > interface consistent with the probe failure path.
> > 
> 
> Speaking of which ...
> With this patch we now have _two_ interfaces to do the same thing.
> And both will be generating uevents.
> Which is far from ideal (one could easily envision _conflicting_
> udev rules, one set doing an 'online' on the old interface,
> and another set doing an 'offline' on the new interface...)
> Is there a way to not sending uevents for the old interface
> or to make it configurable?

We do not allow "offline" in the new interface.

That fixes the entire issue - the blocks are gone, nothing to poke.

~Gregory
