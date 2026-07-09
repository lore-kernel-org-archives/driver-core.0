Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20326449997
	for <driver-core@lists.linux.dev>; Thu,  9 Jul 2026 21:57:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783634228; cv=none; b=cPohh9xj46CTQSnplHLv6jtIYMzrkBtYj0hoI4eoRdIwQYmCw1ubK/cCzWf81VHV+mMdXgthHBMYzjEALqofe0rYExfnfm5+lDCHNSLJ16Ba4rmSMQoJtum6AncEjRAR5oaUOpbM+KTrvbyo4RpIJUVhxDws9HUrcBdlRaCvi2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783634228; c=relaxed/simple;
	bh=8UAIjOhvfbKjsQ/HTeZBSW9rJpTCzyIJqdF78M986Ac=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X6KfKSTftbqXlKXewqwNkweo9AzK4WUB9+Awgf7uvYsdBz6Yi3aGxsZmZALSN0TvRc5uRe7E20g9KVRMvnEzI1I6BrEoFY1aE+7NpzzGtD4VyQQulHAmUU3HW/QAinU3kW/ER2jZpeFjuSeqdlRb0O2QLqSaPNI+BpR2tvITHlY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=NI0Bzrk0; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="NI0Bzrk0"
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-8f1a8e914a9so3083486d6.1
        for <driver-core@lists.linux.dev>; Thu, 09 Jul 2026 14:57:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783634226; x=1784239026; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1AtZcCJL7SSO55KaeQpBRgHzud/kdG6WTG09Vy9G3lc=;
        b=NI0Bzrk0qnpbllLAG5iWFXZWqTxIoiP+LQZ1AHmUnxAfq/LfzjLSybMP/S2OAaiG1e
         5cpce1mTM5MfJvNK7ftCVORAq7g2tXOqnHv3PH8ev9q1jY651SkkrQ6e8+Hhurj9LJYF
         yXCOAoYscT302rowOA96skUvYbGeiM0tS4rc7deOpidIZT1zFrwcIeA0xHdVFJ44h4ce
         52zdoDKYm2XzRmPqe0IctSUMkb6CM68XplK5a7oxJhp1lX9q5cq/c6G51SsFFUkMsohI
         pr27a3tr3DESlNoRg4FFUB7cs9fmDsGHr+h7AoVVJ1xebdzAyO+w1vKbMHrIOT2iefBE
         r9aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783634226; x=1784239026;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1AtZcCJL7SSO55KaeQpBRgHzud/kdG6WTG09Vy9G3lc=;
        b=D8n7B+s/SK4AeUlr/pWkiW1280uzCfE8Z73m3ISzyK8odsrQf4yr1FnRtaXisT2C43
         FUHQSJguWr28bvsYyp8BtuSL8mdSqgYTT+mcUoMDbrjCvOzWhYsMuF2TPrD3odNopoFA
         //962VaoDs9LYOzchZTX5x4fE+gKJTjS1+1+HJD8MH+MFoATwV0INAwWJ7Zo+rQP3viz
         ofEvPIDWasIFAtP28LI9ZZCnZHZ0Wy7OO4Glcleas0lE7JIy5ToqlNQ3tLwwZGU33JyN
         4j9CqOFpwvPFPDlGocmWIKWce77+Ned02Sdtg/SpEFLwtVgq1M8WHrGnRHBUjGbgKx5R
         MJYg==
X-Forwarded-Encrypted: i=1; AHgh+RoODxwyqbp+TCZhwqKvBofIdjdw+SbuHOb7buvWmNZEgaaIdoP6U6LTyWw+O5efs0fGpbXEBTvgEmXjRA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxxpQ2HkP/eJQ+dQoeyAjGyoOUacxC7jKlNbPNobJba5p0JDkNi
	deZCJB8se4nsJfF+xggJfrfgYpcBEtxOlkZ9sNXFTMv0gshjk/muAw6YOf/iToONWbc=
X-Gm-Gg: AfdE7cnIAymeWkC1Fnc3TNYacu/L+b6vffn4usNZIqdzmEktz7M3goF52cIOodQM2RK
	ZdMmcNo065DmTwkHky9vJWyWJmICsLw4voV8fp7P3i2MJ6X6ygzCBJHyRoXPxcR1Gt9iYP0k1D9
	RCnPo/ThuanMYBfClNxkGeoQOKiubIHxYRMsgdQzg3PT2lJ8CxfyN6ox1c30G4Ur88s88CLsVTn
	GltQgQIaNF8IMBpxsotxf0Qk9GM9k6EXo4AII9H2bPUiof5RVbwhhRDWmyiYQuhPZlRbpYM/r48
	+5uXh3w12ncexkv2N6qBxc35Y3JFW87YsH7ro6/gGXwsejJYNgvbpR625EC9/U1LqRtiJCRuSg5
	WMcuGZI1NMg8X7g3BczAXE4WKtEQOAyNK9r8b5cUmjreKaZcZ7X6RjSGPDWTYRBxNYxqjNDWeyn
	Q5JwwROWQ1JSIBiOKmNJtMcJBIZKqRE7uu2I7SkO+EzOm6CPNPu3oiqHvi8zs5bBhUEeWH
X-Received: by 2002:a05:6214:2b83:b0:8e7:8d53:240f with SMTP id 6a1803df08f44-8fec2a4a020mr91687356d6.43.1783634226132;
        Thu, 09 Jul 2026 14:57:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8ffd80fd82csm26977986d6.35.2026.07.09.14.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 09 Jul 2026 14:57:05 -0700 (PDT)
Date: Thu, 9 Jul 2026 17:57:00 -0400
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
	Smita.KoralahalliChannabasappa@amd.com, apopple@nvidia.com
Subject: Re: [PATCH v6 02/10] mm/memory_hotplug: add mhp_online_type_to_str()
 and export string helpers
Message-ID: <alAZLBqgUEZliwk_@gourry-fedora-PF4VCD3F>
References: <20260630211842.2252800-1-gourry@gourry.net>
 <20260630211842.2252800-3-gourry@gourry.net>
 <bdf0ca14-eec4-43b6-93aa-310e77660d95@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdf0ca14-eec4-43b6-93aa-310e77660d95@intel.com>

On Thu, Jul 09, 2026 at 02:08:43PM -0700, Dave Jiang wrote:
> 
> >  extern int mhp_online_type_from_str(const char *str);
> > +const char *mhp_online_type_to_str(int online_type);
> 
> Does this need to also be 'extern'?
> 
> DJ
> 

General policy i've understood is: "No new extern"

We use the EXPORT_SYMBOL_* family instead now

~Gregory
