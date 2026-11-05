Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793841671;
	b=YVvt5KNmaW3FEu658Ldu/WOcAmRIK4B86jEQt2TPxIPL00+WntoJuJWOqNmSV6RhKOLs
	 qQIc/hq458rWcHlGexW6Vids04u8Fad1cNd05NW56bda8bu0qkrZ/YaOe8WKRyErBlvHy
	 MLGPXh/56yTJqAHHruCQ7WxhcZ60tXwbqYCCQxrkW2s8600tk642mSH2TLKb+9ecfV0sd
	 l/m98G85Yra5rlSSXuD3OFqe22fBwFvuqQr9s5/lKSVWgT6z30lpsCivnPwLmO109a98K
	 vq+qL/HL/hrCKAhRUUaJWkYpkCN3tIuAijnHhsXZm0t6C/3P/Cq0LTsPbnk7rfDgL0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793841671;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:To:Cc:Subject:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Content-Disposition;
	bh=x5QYTvCtCz3JW9P9W3Sr2AhKR5sD7hyZrYU2fGwOKig=;
	b=yNGicpxb55+HsGkol/pRM/DPAi79czcGEACXkvdjvzFxGVk2cFVy7byW6k6sE8YBkhYe
	 roeZEXPCkn+h4vKuhoRj7bUIsKhh3EZ+RwjQ0wgHwgFMRp4B3LAtcX74Mxh4V9Y/aKFWQ
	 AQXvXs5Po96sgPX3zO3elSzDDWV+dfNqHO7ujiTB7+TKE7jIQQIb6qTbHR45pMDkfLGf6
	 MmI56loiaOMwpbdQmpiDwXMRixHXNXEy/sZDSwFCH3lz2926/gUl9kkihCTZwyz4jdeFz
	 trhiRnQVysb51+f9XjO9YFvyeKeZcSTIv65G5ifK2GNRECGiDDOgzClsw8dGAW6iYQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh9Lp3Ry;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92C48606A31B
	for <driver-core@lists.linux.dev>; Thu,  5 Nov 2026 01:21:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92C48606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Xh9Lp3Ry
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-1b1ce85287aso1201060c88.0
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 17:21:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793841669; x=1794446469; darn=lists.linux.dev;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=x5QYTvCtCz3JW9P9W3Sr2AhKR5sD7hyZrYU2fGwOKig=;
        b=Xh9Lp3RyNwfvAlB9StmnovhVMcRxpet8NavnCsXh6HKwUl3BRGT4KVEEPhbDBthhvM
         LD7fv1jKZ40SsuqRSQEbdh3yRlFFVgJQ9a3rnrunli6TP4IzKIwYs4eCcw3unGKPxE6c
         BSs1QIQo7t6N4AWzklgxrPH6QqtZ0kJnQ3AaI0/QMw3x55bZdKwcrzefABzyh2trcJle
         6J8AA+fTZ30mc+ZLKtPX7Q0q0XcoPiJe6biMv8NqhPvdFUOdgluNFi95XdQjEeWiSEUy
         p6itWUAPCigHD/kGEtbYcCV5G86Y1FTDeYswdOX+aylBmnzvD7dPcREpFQH8ZIuZCkkO
         Qo7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793841669; x=1794446469;
        h=content-disposition:content-transfer-encoding:content-type
         :mime-version:references:in-reply-to:subject:cc:to:from:message-id
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=x5QYTvCtCz3JW9P9W3Sr2AhKR5sD7hyZrYU2fGwOKig=;
        b=e+OxnzsSz5PfLKxLVjAUiuyuBOtO9c3+5Rz/w+0B/320oyP2xLHXQhtaXIDNSHJgrd
         lIwfAEKeY9+DP0eORM5cIB32AdNXfLv9fleE2pUkc+Lrlljaz/Dy/cxzEuzz4kKtZyC6
         CKFatE9x+cHwHe2eivX3WTrnfn+Yn5oPK0yoKUJ8puKrf/iNlTeeux1BGg11HjAZAFL4
         I4ggjFAOj4tgff51mjvQ6K5e/LeRp8eW4dkjiHfGcoqedMR54HY44I3JEXXE8ZzUWNnK
         HzmrG16zCMj4PhVIrdsKOiasqvPZcheQj6PwkD3bOzsCCYSvzRaBQ+EmMZZAzDrdvkds
         KjKQ==
X-Forwarded-Encrypted: i=1; AKwUvBxFwwSq9CpZ26nDFIts2VMSAI4oh6nT2Ox8y+b/PQJYWHGEdASkVSWpyM9fGUDmzRInVlnEg/Ako3GA7Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z8490O/SS+A59bI9cl5LKMwhFBISbsKK5kVnqipjSOQRXHwY/e0
	KwQ5dSShRjGBoaJMR59uYI7WOtyWL2A7ek1q2H/NPeoaoZBQoU+4qrbK
X-Gm-Gg: AYBFou3i1vtoFFjsYH6V3moqXw9T9nMvU4eaY3C9Lb3rb7GAJdj9gENaQRxjjgC63We
	hH6jfKXnrkSLVU6cHQToO7jstPyYfEd6r+A0JMPEHJJ/HUfeP+7dCJ/anGh6jDTXbHAFZD5d+vC
	IO/K6CI43BVKHBz6KUYe+//xk1KIWxDzbWFPNVVjC+so+WMvhLquVMFlb53iRUWXUS7T5w9pFNO
	Z4mzJjI9MP96oLboszU5ysKhpq+oVxydiSO6PQ1MoIHUltQ2sBbdCjuRi1bMNOfwoTqyghKKq7z
	Z3Hr3L4wIe7ra+XdU8w+3tuVFaj4ljckJl3TDIl22mGGy42bXu50pM0Lc7gJLGm3wFFfVE3QDe8
	CqtHGIjV6XoYVGCGR+Y0jCjrPu1BPIVqP5Ciw6SqOtHyb9wd5BWcdRgWDC0JKaeFNb9q77Oof11
	od+eFuf6gg3bl4KfIx5aRPTYafkIC1005tU3nstJLGLeRVg51YVEo27AhaXmpp50NOkX0bVsoQV
	NbF2m+t9ErBzODq87XPYgjp8qUBFzVN5gSRquBm+03xzorW4CJB82xOSQLAlvPDR9daOBcSdVlE
	QgMv3sRynXgEUX6w0CyEl1YByJzOx9R8jUUKI+q6X0oOVFPh5LzfR8xDiOUiGvwnnbTUWA==
X-Received: by 2002:a05:7022:29c:10b0:143:8860:afa1 with SMTP id a92af1059eb24-1ac5f36d693mr25685468c88.46.1793841669393;
        Wed, 04 Nov 2026 17:21:09 -0800 (PST)
Received: from localhost ([2a00:79e0:2ebe:8:c8f4:b7d9:252f:4483])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b245ac2f44sm12371355c88.0.2026.11.04.17.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:21:08 -0800 (PST)
Date: Wed, 04 Nov 2026 17:21:07 -0800
Message-ID: <21f4cbf39c7872893f8f2d3bfde7d829@gmail.com>
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	"Masami Hiramatsu (Google)" <mhiramat@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] driver core: fix race between bus_remove_driver() and dev_driver_uevent()
In-Reply-To: <2026101409-unkind-ablaze-08a3@gregkh>
References: <as71DkwHeLGNDsPv@google.com> <2026101444-unnoticed-caliber-21d5@gregkh> <as8dAu4R99pP1GHD@google.com> <2026101409-unkind-ablaze-08a3@gregkh>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

Hi Greg,

On Wed, Oct 14, 2026 at 02:16:50PM +0200, Greg Kroah-Hartman wrote:
> On Tue, Oct 13, 2026 at 11:11:33PM -0700, Dmitry Torokhov wrote:
> > On Wed, Oct 14, 2026 at 07:31:19AM +0200, Greg Kroah-Hartman wrote:
> > > On Tue, Oct 13, 2026 at 08:24:20PM -0700, Dmitry Torokhov wrote:
> > > > @@ -830,6 +830,15 @@ void bus_remove_driver(struct device_driver *drv)
> > > >  	driver_remove_file(drv, &driver_attr_uevent);
> > > >  	klist_remove(&drv->p->knode_bus);
> > > >  	driver_detach(drv);
> > > > +
> > > > +	/*
> > > > +	 * Ensure that any concurrent dev_driver_uevent() that observed
> > > > +	 * dev->driver before driver_detach() cleared it, finishes
> > > > +	 * accessing drv->name.
> > > > +	 */
> > > > +	scoped_guard(spinlock, &sp->klist_drivers.k_lock) {
> > > > +	}
> > > 
> > > Shouldn't the compiler just no-op this away into nothing?
> > 
> > It better not. Why would it?
>
> Sorry, early morning before my coffee had kicked in, I was thinking a
> simple lock/unlock pair without any data in the middle might be compiled
> away...
>
> Still feels odd though I don't have a better idea.

Just a gentle ping on this patch. Could it be picked up, or would you
prefer a plain spin_lock()/spin_unlock() pair instead of the empty
scoped_guard() block?

Thanks.

-- 
Dmitry
