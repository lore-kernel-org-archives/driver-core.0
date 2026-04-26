Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD2081FCFFC
	for <driver-core@lists.linux.dev>; Sun, 26 Apr 2026 04:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777177479; cv=none; b=f4S59mYQ8ppFLVQJlkiW1Y/vso5ruMfgC4/eJPk136dQ8Nj1NFZwHGGCM7r1usq3FNBI4ASM01se+NsTJQyP79emqUBGSPvICyQC0Tbs7chVZq9gG11IfxY+eBAOBDywQSntIFyz67+3zUTaBaXHrv6KjPzIpUpXjAp6uyUYQ9M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777177479; c=relaxed/simple;
	bh=jqKbTvrhLLv6M2A6PKYdhZjjnEdCSJ+gACEo1eh7pTY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c2CQXyZ+AaWfZlYjPhTt/f8zErjTwpZfkY7M8g7DX17bfo2fVaIP0nCi1a7FTHwNKmfB2ne6hsPhlYHFfLAuFls+Rf/icwUtIpwo+90y5UaqcnP5LBF3maTrgWSucNFYdD7ROJaL9A/xcOnmR27Le9DYDDyHG7IosSLjRuZ+Sqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=C5l1TcVw; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="C5l1TcVw"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2d8ffdc31d0so1186539eec.0
        for <driver-core@lists.linux.dev>; Sat, 25 Apr 2026 21:24:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777177477; x=1777782277; darn=lists.linux.dev;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+YpXivrfSMMmLk2Cw2soTR91gmDOVGg4r9ajSzwj7Ls=;
        b=C5l1TcVwBroMRx1C41y2+FThlm4kLVyPCtaXi5P+CzK2/Rwx6nvNFvaaXFWHT2sSUX
         38EBfwGX1d3hDOv276hifKZq8ARjJc9dHq1Rd4i03aC3V/1R1v910++SomWGwWAgIw0Z
         bZryHdqiQw7S5kt8po0fzjePpwj8fD7N0R56AvVSZUsZuaz9PA1xAjgExglJrplS85co
         0tjfLvUhk4hn0+8qdI9ZODNFkpOHhUAZZ+ap6cvnc1BfkV655ilBoy3TJFb4RSYSmfo8
         FDBhG4xPXT8iB2DxM9ISBrelkzwoRye1hsj1HaPNZ9XUQJzUg8BozCeYV7tDikrJmpeT
         d4Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777177477; x=1777782277;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+YpXivrfSMMmLk2Cw2soTR91gmDOVGg4r9ajSzwj7Ls=;
        b=j+b+g1LcbiM1i6v4KeyjycT5/O3ANrIfNHRW7GNIstjdCiNWzBbpl8cPO38/fnc/pA
         wMl+1k3ijHsZPJ4vOUY4b8zhaMPUPSThTaXJb+H+rAgt193tzWSGeEMgZGNdX8tiowPz
         W9n9LYxO4JSBOa7h6yHMwR4dNTwI49A7BVe+MNqzn6x4aKCgHyWukF4PwLEwWaJE2lD3
         WeWYARsq0lLQI5beg9+h+yZj039bBJWXbevdN02aQP4Y+yMgNg82Pi7ZOb0L04XFf5yt
         CIf2Uxiaq6xLDCrdgDZIlia99sw/mtQaQxlYl1PaD8/Zo3gZj2QupxFxQOp/gZxWBcD2
         VoZw==
X-Forwarded-Encrypted: i=1; AFNElJ8l5yrRWx0W6J0hCf1dT4WucDpYKhpMsCwu6hXsvKOxTbQYhQ2/uObMlfunEKs4H+Xm+5d6eeGEIOQ4NQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzNK5Ij7ZJWr8Akt5gUyUKgvqCVVj96uhEdR2BgGe9nzlrzpXge
	MGh5HrLpdn13QGjcCwq22r6+xVVJmWmOWwDZrctULyzT0IMS2VsiJgoj
X-Gm-Gg: AeBDieuVwwLjCs3uF7EzRRIIhRE4oJQH5X5muVpkscguS6iwE7sHFKLj8ZQ/5usdYep
	TQrcQ2g5NZphOn4mo69onqz2WWypdgkLK9+aM1DSZclV95xjdLP9kFx9SOS7GBdBnPWY48EWGv+
	TRTsbilo63S2GoqwkQL0LrM6ZNXh5aiLqsJyEuAmfbeYgneYvfR9Favyi14SUsX5aGtoJ9UuHTq
	PyTVj2+tSmSZS66fYlGWwgH+YUobAfLOWUQs/CnHERRrj80cTdN+xkcOl3rcI937eT8r6WVU39a
	VQ+8+nH37XZnctHSY6P+txFgTta9Y9Fqtd2u9lF7M4HX8Yusty0FbK5PJyEB7IoBWfWpa2d97SV
	guxY7HQ+EdlMlKhv26SysuuREqQD9MrKXvtbvJXgk/1IFAlsgjvCoq5x10ROpyvnGqJO5E/B/Bs
	KS5Mzcn2HDwgSXHWz/9QPCWBW4IFGxI3iYdle2hE08DerP9SPRVE81FPsSwvQC2DEXScyt5y7mv
	48=
X-Received: by 2002:a05:693c:300c:b0:2dd:c066:bfe with SMTP id 5a478bee46e88-2e478a331bfmr24126557eec.21.1777177476748;
        Sat, 25 Apr 2026 21:24:36 -0700 (PDT)
Received: from google.com ([2a00:79e0:2ebe:8:f359:aa0c:530d:9dfd])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2e53ab8b89csm38712982eec.12.2026.04.25.21.24.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Apr 2026 21:24:35 -0700 (PDT)
Date: Sat, 25 Apr 2026 21:24:32 -0700
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Bartosz Golaszewski <brgl@kernel.org>
Cc: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Andy Shevchenko <andy@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com
Subject: Re: [PATCH v2 1/3] driver core: platform: remove software node on
 release()
Message-ID: <ae2TMiUFAFd0-VuX@google.com>
References: <20260423-swnode-remove-on-dev-unreg-v2-0-0e5213cde2ed@oss.qualcomm.com>
 <20260423-swnode-remove-on-dev-unreg-v2-1-0e5213cde2ed@oss.qualcomm.com>
 <aepWdKzd8GPeayNJ@google.com>
 <CAMRc=Mcq8rP-AerT-A2Az_W-rsMFZe8_rQDB5mKOHALxEn9uUw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAMRc=Mcq8rP-AerT-A2Az_W-rsMFZe8_rQDB5mKOHALxEn9uUw@mail.gmail.com>

On Fri, Apr 24, 2026 at 02:26:38PM +0200, Bartosz Golaszewski wrote:
> On Thu, Apr 23, 2026 at 7:32 PM Dmitry Torokhov
> <dmitry.torokhov@gmail.com> wrote:
> >
> > >
> > > +     /*
> > > +      * If the primary firmware node is a software node and there's no
> > > +      * secondary firmware node, the primary will be affected by the call
> > > +      * to device_remove_software_node() in platform_device_release() and
> > > +      * its reference count will be dropped by one. Take another reference
> > > +      * here to make it have no effect.
> > > +      */
> > > +     if (is_software_node(pdevinfo->fwnode) && !pdevinfo->swnode)
> > > +             fwnode_handle_get(pdevinfo->fwnode);
> >
> > It is possible to pass already registered node in pdevinfo->swnode
> > (because device_add_software_node() can handle this just fine). In this
> > case we also need to take an extra reference (or figure out whether we
> > need to drop the reference when removing the device).
> >
> 
> But device_add_software_node() checks if the software node is
> registered and - if so - just bumps the reference so the effect is the
> same as when it registers the swnode.

Ah, yes, you are right.

Still please check sashiko review - I think some of the concerns about
error unwinding are correct.

Thanks.

-- 
Dmitry
