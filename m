Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5A1434BA33
	for <driver-core@lists.linux.dev>; Tue, 12 May 2026 18:15:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778609739; cv=none; b=NzH/h9F3CPVRfjLPa2T2aDsqTlHcvirC6oiAVI6swcvaJ4cTHSHEm8tGLkb5TrFHrQIJZ9N+vI8asn4z8yDL9pKJj3DLSaH5GlXuzksLZ4V8KQgtXfeHadabT9/YzbNHUQ0UBZRJigDVihk1o/h+XMpLxxMjPKoXeoh/yoRsJ30=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778609739; c=relaxed/simple;
	bh=w3zeFHabc0RCE8CZoof/qrEwoxqFjHFjwomgxIGxoCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c5mU79O1alGF/SbJY7T+0qJmLxRCEsOA65VUhgOm8qolDP6VURc6gxiGLASVBe8OAhfctz5wueeacI2xGwMLZpn2U8s3M/9gGmEJ2lrEoWUI7Gt9ruyx8xe0HcOws93HCSlzqFZ2pCS1bAX6qNiHzqtl6xJ7Ucup9jhw8xxbpTE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mGtTC9H6; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mGtTC9H6"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ef2a1cc06dso10858232eec.0
        for <driver-core@lists.linux.dev>; Tue, 12 May 2026 11:15:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778609738; x=1779214538; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
        b=mGtTC9H6qtym4ET77V0wAqtR0HR+e3xzZOpaZZOO6lFzBaGDALd4IhduKOHDnimWPF
         M+vXOtNxHqsfDcIUabnr4ZGtdLFC23j9Cn7em3UV8yd2F08TSuECL6Sq7BcaGzTU/NtA
         oRHTz0cfH6EW/bZNqIAM8TKZ1DzoWkBkzr+2djVHnu/vzVTyYy7i2DVe/qLxCJpMr/q8
         cAulKhBElpbGpGxiyqBaw8q0Nz4eA/fltYk9bitT5yNg9NRVMhXHeYvfPuRqFdwWuuM9
         co6RqkQQLIeKmGjOVwa4O82sFv2jB8grVk1O4HfdP9c2ibg7R+XrA53V4q7jxQ0MgO+E
         hyHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778609738; x=1779214538;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TqTMATn1TJBwDzhvgfdwIn2iY4blCTuTwL1WgCFtdYE=;
        b=qewOfiEDGQ7siN1cAu/LUYKZBss5NcoYxFR9OEFmq5OWQ2dQcWRP8/TARt0gOm7JLJ
         HZBur/f2i+yQq5MT3VyC0DbnU0zZYOp3U9TY68raY4lpIThddHiB3ux/fjmDYUyfkP5V
         uIEzzgFg+jMUVRV2WRtxPkP9L67lvZ2QXFG8D97FEGzCRhquZWw+kMtnOouYoQFfIAW4
         SBS/wnzZqjTTst7DPVp8SH/4fG2KaW3scYIEOQ3z+3fmgnZBGRrKHNQs+M93A6AYA3px
         x1yZ4Nud4Dn2pT1LfuvQXEVR9tj4EUXuXZBkZj+HuKnGgMix+HEyIdsy5r58sYB9Y36u
         eTsw==
X-Forwarded-Encrypted: i=1; AFNElJ8yugJqV33BV6bNArUxx/kVV53Tznh4bLp1dvfqQ2IdS9J0264BlaAB3WGBJ9M2k17OruEZ0QFKQDJfMw==@lists.linux.dev
X-Gm-Message-State: AOJu0YwGAOhRrS6U/neB8cRE2jNJfBjxkaoOUadXil8PvA6guSSgUH79
	78AH1Ca247CXxoWhilVF6fN1gXa5yZVofLxOUM0KcVzhfmv2y7PUl7o5
X-Gm-Gg: Acq92OF5I8O93EXv7PyZhYmVE8UCMrxgboeh6394AInEVj9Un46xsdqsIbs1NUxa4NN
	Wc475vJqm3uMby+Xm+xkzTxY27iBaX3W06CfEUkpDdY5ZIXMc5wVEwS/qDLOHiPTj23wxj/pGdj
	km6i6bKo292Rq2QQ2Jqm4NMci0YjPfHlEtZoQdkox6YiToFgZWUaWaTfJA5wgFq8AQ2Fth9RHq3
	wYlB6LQbtQMwFa6sBoAf4avtCVzbPEn2Ffg5lQwKG48kghWWlkJp53KIYLsQt44If3TF6TjEx5g
	J8IlQz2NBQdI2dW7woUKo2+ZzKadCpw5cOU7DuVFmWVRaXXCX+8PF8TWEMXy40GOXWtJpkili4J
	ARKUse8tfoTgIHdCtpyVv5aURoBo8bi0Wp3pta/KlZ+dWrVAfrc5nXyG+zfYo3nLmraEQ5HiwXm
	klHKixBy1V914sspY2q9bBOwkHfpAgnwyZn9d1ME6ocVHvErNvt9IMyR4vcqY894kw
X-Received: by 2002:a05:7301:22a9:b0:2f5:6dfc:cb6d with SMTP id 5a478bee46e88-301187bab75mr130655eec.11.1778609737694;
        Tue, 12 May 2026 11:15:37 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:84ac:d22c:b037:1a93])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2f88847502fsm22940594eec.14.2026.05.12.11.15.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 May 2026 11:15:37 -0700 (PDT)
Date: Tue, 12 May 2026 11:15:33 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, Maximilian Luz <luzmaximilian@gmail.com>, 
	Hans de Goede <hansg@kernel.org>, Ilpo =?utf-8?B?SsOkcnZpbmVu?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, brgl@kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v5 3/7] driver core: platform: provide
 platform_device_add_software_node()
Message-ID: <agNrB3BeIgFlZimz@google.com>
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-3-0035eff63812@oss.qualcomm.com>
 <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DIGUBLZXZXPJ.8CX0K5EL6255@kernel.org>

On Tue, May 12, 2026 at 06:31:44PM +0200, Danilo Krummrich wrote:
> On Tue May 12, 2026 at 1:59 PM CEST, Bartosz Golaszewski wrote:
> > +int platform_device_add_software_node(struct platform_device *pdev,
> > +				      const struct software_node *swnode)
> > +{
> > +	return device_add_software_node(&pdev->dev, swnode);
> 
> I think this should be device_create_managed_software_node(), see also [1].

The main issue is that we do not know if the software node is registered
or not when platform device is registered, and are trying to use
heuristic to figure it out and decide if we need to clean it up or not.

You need a new variant of device_add_software_node()
(device_set_software_node ?) that would bump up reference of already
registered software nodes but if node is not registered yet created it
as managed.

Thanks.

-- 
Dmitry
