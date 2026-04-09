Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06187350A1B
	for <driver-core@lists.linux.dev>; Thu,  9 Apr 2026 08:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775724473; cv=none; b=m28c54nkDB0RAGaPAWBPurv12v6jsCK5TDw4NrUwsY77kFhdPbi3lNvf1Ars98J2TDYE64pcGpdPTOAZYc3g49Clj69LLJT5nklo5CA4oOGLx75KGVnMXoJBRBb9MJiEx4TbWI/ThBqa+JkmIE2GjwSvX/tj42yM2NOC3sxTcyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775724473; c=relaxed/simple;
	bh=XROpkdn4hrZsyPMA0wpaS9u98ZpLsYXHq+JsQfpKAes=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c/1ydQinypeZsGB0FcfEvE9lTa5CbXnUlIEtC5EnoNnLsxqzz8abfEFUhrEEu4J4FKX2jfKxH121O6bnxV2riEHm03kAso9VZwN3NKIQfi632R0jI8Fxl+RPa89tw2kRuEEyV6At2jwtCx3i4wwyo5qtPDLnQ+8Q2vq93MMju+Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=NhTDJ93M; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="NhTDJ93M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775724469;
	bh=XROpkdn4hrZsyPMA0wpaS9u98ZpLsYXHq+JsQfpKAes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NhTDJ93Mtin39GE0ViCdZVG5spEJ4fhKRjf5JjsQaZMJnwAPCxy7PIPmpSDTv1vKr
	 m4nb9QZ2rY/YlV08Fw+hrp1uT658lUFhPfbFh9kk2dR1ZlMhfKoeclRoC0YV2lOnRg
	 O0t8YpfnTX0d2IjJ+sr082q7EkyskSGxgI6CnMec=
Date: Thu, 9 Apr 2026 10:47:46 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/5] driver core: Allow the constification of device
 attributes
Message-ID: <8954dd7f-c867-4f46-9dbb-2775187d93db@t-8ch.de>
References: <20260408-sysfs-const-attr-device_attr-prep-v1-0-232934f77b3c@weissschuh.net>
 <2026040916-rascal-oink-8875@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026040916-rascal-oink-8875@gregkh>

On 2026-04-09 07:36:09+0200, Greg Kroah-Hartman wrote:
> On Wed, Apr 08, 2026 at 09:30:46PM +0200, Thomas Weißschuh wrote:
> > Allow device attribute to reside in read-only memory.
> > Both const and non-const attributes are handled by the utility macros
> > and attributes can be migrated one-by-one.
> > 
> > Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> > ---
> > Thomas Weißschuh (5):
> >       driver core: Delete DEVICE_ATTR_PREALLOC()
> >       driver core: Add low-level macros for device attributes
> >       driver core: stop using generic sysfs macros for device attributes
> >       driver core: Allow the constification of device attributes
> >       driver core: Constify core device attributes
> > 
> >  drivers/base/core.c    |  50 ++++++++++----------
> >  include/linux/device.h | 122 +++++++++++++++++++++++++++++++++++++------------
> >  2 files changed, 121 insertions(+), 51 deletions(-)
> > ---
> > base-commit: 6c8dfb0362732bf1e4829867a2a5239fedc592d0
> > change-id: 20260408-sysfs-const-attr-device_attr-prep-9971fb4439da
> > 
> > Best regards,
> > --  
> > Thomas Weißschuh <linux@weissschuh.net>
> > 
> > 
> 
> We still have the is_visible_const() stuff not finished yet, why not fix
> that up first?

Because I want to touch each file or subsystem as few times as
possible. So before a subsystem is migrated, the prerequisites for
all of their used features need to be there.

Currently only the prerequisites for 'struct device_attribute' and
'struct kobj_attribute' are missing. So with this series in we can start
migrating everything that is *not* using 'struct kobj_attribute'.

> And this makes me worry, how many changes are going to be needed to move
> everything over?  thousands?

Depends on the granularity of the patches. I want to do as few as
possible, but still expect a few hundred patches.


Thomas
