Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C02473E121F
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 22:22:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783635780; cv=none; b=T78t47HAilJ7/AiaTi/ZWqp+7aqiq2wD9HxvpW5b5DcAphRR/f2QiZ/OL7s0CF7MJYZg3uDXueKSl//Tw0QUSSLqNNPof37bN/2rrzodaxkUf75PVE8dkd5zO4IMRmXavkl5nMQfdoux5egRFkDViMbivhAKkzWhIYiYi/1BowE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783635780; c=relaxed/simple;
	bh=F9KJPRgK4L705MdJhF7jSetuwwe9QE17mcbAei3OvSY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DKnqvU62JD3GgRHUCAQiraz5hiAKi7wBzJrDfpY2D7ugyT5g40/yYSvv/ZbUKUz+7ML9qNfG/tQQq4Txju0l19tVhikbPVWV52mnOIj1oWOxQtC0wZEONejDGgL+F71vVUSMtpGnm5dMMZC7iFdrIqWXGJThlwa4Cr7C11n6MqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=IHW8pqiW; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="IHW8pqiW"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-51c5382806fso2404541cf.2
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 15:22:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783635778; x=1784240578; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=b50SGMSOIyssQj3plHocLLhkQW1pcBLVRqoMkWAD4k0=;
        b=IHW8pqiWqj80KLUvS6OxUkRmdOpVS71f/ISABYk+DS9NiIe06xE5PeXzDgqIOvLFb1
         SAgcbfODs6w/0NpgLST/usL9fPtezIdLay7gnIWccdVl+P5/vlELUDuJYgogMz5ADL2G
         ojSZY/uM32cRrCnfiQbRJsnjYHMjMkNcftQSdprDEdHzj3jbZR1WdItSUd4cZ+LmK4hY
         UoOnxYldL/9XbY1B3bhdKJlWO2TdldM3w7ZlGgmoLmb4v//DWgzIeeibKD5yAphtYUvy
         xMgLMLIktS0dhMqgxok+p719Us84vkSYzXrTg5OT5Mm+9OklA/WLUD6jS8ByPuvppawP
         FxoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783635778; x=1784240578;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=b50SGMSOIyssQj3plHocLLhkQW1pcBLVRqoMkWAD4k0=;
        b=MX7AdTPfHmL3Wj1R5W8L3F1dgLRAox0SDs/PDvK0bDwTAKbdvzHX2Pfk5p/zqDrxks
         YPIHKU9Cs2qTwQrVcn/A2ikpHaE+BHFTxUDGfN8aSj7gwsh5ryr0QaZ3w/HbW70i8iOY
         PrLgbGqdRHeHrGu9umB3VjglXaUEfOsR4/d5X30u9lPwNnFlCGVF02O1pfyEA1pq+4xO
         y/Ga/M5eq8I5aqBsAzGeFZu0jryfi3qHPaxmDpeBjOgs/zQkmw0wsISNhxWSfrbQGN5P
         Qb9osvgUl9oR6pclJK4CCe28fivPdlb9gq0Bdw/33p7UAx1Dx7YB6jBD98oP3p4p2/7B
         I8BA==
X-Forwarded-Encrypted: i=1; AHgh+RoBfcJTUCBbg051z1Z7Tqy0gbdchPK3kfj9WVGfYodCeP/cfF+9IlOjdSRhCaOWsJAQSB1C6FijxdSaPg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyUqKXU7eFUSav62WTdbh7fpCzd3GHO5Atm7VJqwJD2Q7YiIwgy
	jmgy1CAmEU991HWr6O8CLvOkeCFxhNOco6h7VMYos5BuMiwMtxdbg7ofkH+Mc8z+Pag=
X-Gm-Gg: AfdE7cl3MKETQwyKrA8jhdSHKf9QV2gIGxGzn9H9AG5FyI1ux8srPN43piu2x2ySWtv
	PzrVSVc28YrUwBSrn5fi6td1KymqDtUd1C6qmxj4K05kpWcDWk9iqFsv8+IpkKebcxXVW7RLCgs
	a1PEG8PFIHrlQxToQLO2C7qe3sTTbDDLnkC8usW1sQp2mtanR4xMH6OY9Cv0d6bRbEOE3XHmn2u
	/zJE2VLw5dEYaX28aOmlQMYCgvui9i5owTFg6ePYmKmSVgvxsZuEJAAQpQpz607z/2ximLR+pB8
	5p7JW93VNRPM3kZEeOvNuKc/61T29wUKJjy7EQyYWkctyEIMrpOZDjUckgBGZQDFDp6KjufoR66
	Ye5eu+WZorqAzuoBv0v2MDWXvBgbWXgRgjwT17njn+SoJLHftQfrhTIV9IH4jyLpvx1PbGpK+Iv
	McGCy2sUOfVFcIOHKMeIGzS9L7MDsJVhcaziA+5gvjMEBN3CXlF61Qtq1ONB9b7uH6VBt4
X-Received: by 2002:ac8:5a02:0:b0:51a:8c97:fb91 with SMTP id d75a77b69052e-51c8b4bac92mr100050501cf.58.1783635777304;
        Thu, 09 Jul 2026 15:22:57 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51caace31a4sm4283401cf.12.2026.07.09.15.22.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 15:22:56 -0700 (PDT)
Date: Thu, 9 Jul 2026 18:22:51 -0400
From: Gregory Price <gourry@gourry.net>
To: Dave Jiang <dave.jiang@intel.com>
Cc: linux-mm@kvack.org, nvdimm@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org,
	driver-core@lists.linux.dev, linux-kselftest@vger.kernel.org,
	kernel-team@meta.com, david@kernel.org, osalvador@suse.de,
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
	djbw@kernel.org, vishal.l.verma@intel.com,
	alison.schofield@intel.com, akpm@linux-foundation.org,
	ljs@kernel.org, liam@infradead.org, vbabka@kernel.org,
	rppt@kernel.org, surenb@google.com, mhocko@suse.com,
	shuah@kernel.org, iweiny@kernel.org,
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com,
	Hannes Reinecke <hare@suse.de>
Subject: Re: [PATCH v6 09/10] dax/kmem: add sysfs interface for atomic
 whole-device hotplug
Message-ID: <alAfOxnnYQxPW8DO@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-10-gourry@gourry.net>
 <6fd50351-93e0-4d65-960f-53dee655a786@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6fd50351-93e0-4d65-960f-53dee655a786@intel.com>

On Thu, Jul 09, 2026 at 03:14:26PM -0700, Dave Jiang wrote:
> > diff --git a/Documentation/ABI/testing/sysfs-bus-dax b/Documentation/ABI/testing/sysfs-bus-dax
> > index b34266bfae49..2dcad1e9dad0 100644
> > --- a/Documentation/ABI/testing/sysfs-bus-dax
> > +++ b/Documentation/ABI/testing/sysfs-bus-dax
> > @@ -151,3 +151,29 @@ Description:
> >  		memmap_on_memory parameter for memory_hotplug. This is
> >  		typically set on the kernel command line -
> >  		memory_hotplug.memmap_on_memory set to 'true' or 'force'."
> > +
> > +What:		/sys/bus/dax/devices/daxX.Y/state
> > +Date:		June, 2026
> > +KernelVersion:	v6.21
> 
> Kernel version a bit old :)
> 
> DJ
> 

It has been a hot second since i started this n_n;;;;

~Gregory
