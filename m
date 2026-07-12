Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 205FC3655CA
	for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 16:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783874939; cv=none; b=rTG/PIUX/psw0tdOXjAa2Ju+xxKOSL23DhFMAypcvE43bkOXKwzQ9abxLcXl4xMfxXZMej35F2CazyjBB8HRlKCJC/0cbEvK2oMx6dI96Y+kpu/Ux36OpHM+BxPRH6NEGyj58WcOx0OoLFfaOzB8y/o9JR+p08S9KSO/meNM+XM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783874939; c=relaxed/simple;
	bh=Qt4v/dZ/atl2InBXlF6Qg0mek0k2Z3U8e5b5n5VxTGE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MOZqXWKSdLZSnN52DD4zXJQ3iMaNTBCIsNNgwsT3foVRIG+PuqronAjFohUIGukwbnDLgM9gLpUobJoHhEVSWhMACs3lH+4vBTPD1r6QLjjHXb9r6SzACzBNhXiVtKbx6+fsDuuzu9DWmPDekUlpDFcX1UztE4PrR1I+TO6f0O4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=I8l2Fl1E; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="I8l2Fl1E"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-51c05dcdf49so26560101cf.0
        for <driver-core@lists.linux.dev>; Sun, 12 Jul 2026 09:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783874937; x=1784479737; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=jgHRZ2oQs3owZnO2hrgFCKNrpUU4ppVoDgnNpxTspCQ=;
        b=I8l2Fl1EtxAbgFjmzgpnQQERFyZN865XBIOb/msW3Y8hOyGzQhb7vU6qaW7asZNmBH
         4hsOKvzH96ynekwWSJp6hvke4vpPeoD7ZqJ916SUB0X95HW4ykV1xw8gB8pypUtz/JIP
         C3X+pe0xs83RnAI/2YhJnvXdawOMPKm3lD3qsbltEXYPHHg6f4vBPdHutkPPyxyNdb4T
         wf6cTIJRfFeNQskDHrEcgdpj/Dd5Oj4g7ChU86LCjQ6/Vvqoy99ovuxsqst7G3BufVyZ
         OuPq/fN7B/G+k+QFPJIwp/aCQYSyjtCc9247X6hpAUolII5FLrph9et3r3GHssqgtago
         70AA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783874937; x=1784479737;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=jgHRZ2oQs3owZnO2hrgFCKNrpUU4ppVoDgnNpxTspCQ=;
        b=VkCwb4VVatraKvANXvOfhv8RhbXIA8QD3bmm0GxDY56GL+u2MilFgPDzBQ+Gxj6xVa
         hlwur9Qq0lYY0bS9V5tV+/zTFfUPB1uMW5lLu7mYgLVcyhOJRNZ82o9/CGF6kVOE5ssY
         gXQJ3bQlCTyL2yu4NnivKdzaKmvB3jfqEc2WX/VokAYLrFVAs4GeXy1g8qbXZl0c5sZa
         OiVHd8sIqlySbujtXIen0MXgBtbZ16mDvcZxDWEpDHKU+NK4z8/qMplF4LaIIaD8+YVg
         X8pppQNXclsNNgDt8JxtBH73QTdydaZd14TnkMyxVbMWRvpxzNSM9pXk2X0YY2qmlRim
         zSOg==
X-Forwarded-Encrypted: i=1; AHgh+RpGFGIvN7mjKmFjK0N6m6GRcW4zXkforLMSgDIAG1mtkC0k6R3WWOTgafNKVDBF/z32/zi00iw2D2/B7Q==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxp8fEcbToK6cg6LMVEJTcy3/9Rm/yMzUxlxcVaqLOVSgJWxRW7
	6gefGPfIrvN586yOKckbaWJ7ZRJrzqIYFZEmWRdRpqP5rvEUolKnWFzepEobfXTM5sY=
X-Gm-Gg: AfdE7cmcoihfizAKD8p/97Ook8rulAS+cmpbSAGEUJW+zDb1aoqGN2i1DBrEFCfzusr
	5aDWBPlLIm04noJ3L+F0+dyZVgVVf6fiol94HhIQwVm6u4SqgQ+mj0q2ZDvanl8ZaCxU07sBzlj
	+6o1EvJ1qPB/M3vPO33p0ghA1/Q4Px54R+vwpkj2SlbbYuWSCcq8VDhvRjidFPQihieFDRku8dK
	G7G7bj5/16Mk+dbiyMqWD0DWVdpX4OOgFqFoxt6Ndb22ZxmLiC/1MVH+XWEYYge5gb5eeRm3jZf
	P4ta40FcAPJMZWT4tOpQ4xiBWn4FLdAwTEK5bb8h3X1wyURxAEJUx6fjKf1r6srUeiotbGNxB6l
	9Nyn1qzoIAT16Eq2+CpEpiUrqovUfexXH1AlUa2Gigz2qznYYr34qy6O0MjliBA9+eEmsi0+2L/
	lm/tw0LcWcNk9Nl7HuRncOOM+ONrcP+rbCG8ruiOo0p+/RWEnl7ipRZBMUSTUvkBdQB/qx
X-Received: by 2002:a05:622a:7281:b0:51b:f98f:ea5e with SMTP id d75a77b69052e-51cc9d5d02amr30044441cf.22.1783874935089;
        Sun, 12 Jul 2026 09:48:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caae20a40sm68575071cf.15.2026.07.12.09.48.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Jul 2026 09:48:53 -0700 (PDT)
Date: Sun, 12 Jul 2026 12:48:49 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com,
	david@kernel.org, osalvador@suse.de, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	vishal.l.verma@intel.com, dave.jiang@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org
Subject: Re: [PATCH v7 00/10] dax/kmem: atomic whole-device hotplug via sysfs
Message-ID: <alPFcfjlzSHYk3jA@gourry-fedora-PF4VCD3F>
References: <20260712154505.3564379-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260712154505.3564379-1-gourry@gourry.net>

On Sun, Jul 12, 2026 at 11:44:54AM -0400, Gregory Price wrote:
> The dax kmem driver onlines memory during probe using the system
> default policy, with no atomic control for the state of an entire
> region at runtime - only by toggling individual memory blocks.
> 

Took a look at Sashiko reviews.

All are either false-positive, pre-existing issues on isolated patches
that are actually resolved by later patches, or something we previously
agreed on (WARN/pass in phase 2 of offline_and_remove_memory_ranges).

So series is clean as-is.

~Gregory
