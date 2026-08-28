Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 674CC3769F4
	for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 15:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.72
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932264; cv=none; b=WH5IOJOBwobspf7xh7dFqnMSD3xbjELKBP7yoySEX2knmrhiyuIycTYY1HShbzktW6AHmWo/2RXks++XcoygsMmy90MVfG2fnRv9eNFzzITk9V2liLgOeOsLES/TqXxTZI8CUlw/xYBxSzgPJw7kHuTJ+G8zsuT7OieOR1o12iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932264; c=relaxed/simple;
	bh=ReIfV+XfN9CJ7gWGHVy+pvxz4t/Bfm9Oz0pHx1zUvmQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p94YEXHCbVv9f4wacBto9wRqWANXGhS8leB8L147zLyzcgM8XTPeq9xWgvq2bWAlPxXL+NBqJR6Bg10Gm1maXb1iYIn4Z0mP/ugqn77oMLKE2Z+cga0dLDf926uoK3BI48A5jUha8WjJR6qavue2gCWtpAeOxsDlnEJQSgMvEVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JRqSk6XZ; arc=none smtp.client-ip=209.85.208.72
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--tarunsahu.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JRqSk6XZ"
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6a60a4f1ae2so1476644a12.2
        for <driver-core@lists.linux.dev>; Fri, 28 Aug 2026 08:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1787932257; x=1788537057; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNXgP9aiWGCY8sBDBkxQ5jGmQfHLh/8XePeePdlfGZw=;
        b=JRqSk6XZHpAd4LOcgnBmDJ+Ie7ILLpsfKWxU6XjnAvSNAaijzbJJd6rpBh0SYhRpF3
         dJbz2fNYcHAEBGKQFjSzTWlJws8HXbi/ZYpNwa7men4CeaZFNZwMfjb+X0M1SRCwsU2f
         Artw9kzDXM7pB3g5N+lmafbMb/g2qJBTOTAl6fG0c8a15AlhqSyQgULJZod9Rgr5Y3pb
         spTc8nVGrFPSug/83E6UfILkPg1go9n1gtKAWyb/AqTkVyH/NEJwGck8iZp3bW/pibBe
         NnE25kX7HauxQQWEdX8kbKKjZHMrslxtjeGDrE8L3JscfTDkpcxWEndwesxvpPOtG51A
         YSVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932257; x=1788537057;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uNXgP9aiWGCY8sBDBkxQ5jGmQfHLh/8XePeePdlfGZw=;
        b=gTPE0Kb5bQNkti7XpA1QbJUr9TASRxn130KaeW1YzAmGnS2qpHzLsuFinIUCURO+j0
         I3wac3ZZo59zQI5R81nV9e/BskTCXcUNMm9Vysyy8pBdLxJZMEmbSSgJUWbmUfkbkysu
         5NvsfYsqJnYHuWfLcC47BX6PI9RfYuvRqoi8OTy0e13W6zdXGppUbw8QkkwFLVyRLS+3
         PoTCv+oPeACyI2rm1T7dDDWrsOfs5s4xScHAzg+8AcCgpUUp/xX9znlAHmm/VZLVVlSr
         HSU4Ko9trdVUkN2EtGzrY/jvCPstk4L4zPYyY39BdVWckvJblr151fZgz7641sK6KtsN
         pMYQ==
X-Forwarded-Encrypted: i=1; AHgh+Rq8OK+n2kbk0rOGP7IjthkI32bU7Zq44289FgbUO1tHanYrYlyrBE4WUbNvxqOnhnWf/UGzlom3IeVUBQ==@lists.linux.dev
X-Gm-Message-State: AFuF++lEWO0/mSzUcsrnbVmATv2rDVbJ7z0Ix3HTFpKVSN5yepEC4oIy
	fTtkbZyVE0y+I7v3jQdTjZn566c7NfWmYFSpS5t7j23nat+FSg8fZWGOyqMmESpQTH2ovgQgUlN
	E+LrOVHiAyUwBAaQ3Mg==
X-Received: from edrb21.prod.google.com ([2002:aa7:d495:0:b0:6a6:a82:8b98])
 (user=tarunsahu job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:5286:b0:6a6:1c30:bc4c with SMTP id 4fb4d7f45d1cf-6a61c30c3cfmr2134011a12.5.1787932256221;
 Fri, 28 Aug 2026 08:50:56 -0700 (PDT)
Date: Fri, 28 Aug 2026 15:50:55 +0000
In-Reply-To: <20260821142414.150892-4-djeffery@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260821142414.150892-1-djeffery@redhat.com> <20260821142414.150892-4-djeffery@redhat.com>
Message-ID: <9huzjypaz1k0.fsf@tarunix.c.googlers.com>
Subject: Re: [PATCH 3/9] driver core: warn should device_move try to move a
 need_parent_lock device
From: tarunsahu@google.com
To: David Jeffery <djeffery@redhat.com>, driver-core@lists.linux.dev, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-scsi@vger.kernel.org, Stuart Hayes <stuart.w.hayes@gmail.com>, 
	Laurence Oberman <loberman@redhat.com>, Bjorn Helgaas <helgaas@kernel.org>, kexec@lists.infradead.org, 
	David Jeffery <djeffery@redhat.com>
Content-Type: text/plain; charset="UTF-8"

David Jeffery <djeffery@redhat.com> writes:

> Currently, no device has need_parent_lock set and is moved by
> device_move. need_parent_lock is only set by the usb bus and very
> few device types ever use device_move.
>
> Add a warning to device_move to catch should it ever be used on a
> device with need_parent_lock set. The combination would break
> the immutable relationship needed between parent and child for
> need_parent_lock when locking and unlocking both.
>
> Signed-off-by: David Jeffery <djeffery@redhat.com>
> Tested-by: Laurence Oberman <loberman@redhat.com>
> ---
>  drivers/base/core.c | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/drivers/base/core.c b/drivers/base/core.c
> index bd9c2921e326..75f5931165a8 100644
> --- a/drivers/base/core.c
> +++ b/drivers/base/core.c
> @@ -4712,6 +4712,14 @@ int device_move(struct device *dev, struct device *new_parent,
>  	if (!dev)
>  		return -EINVAL;
>  
> +	/*
> +	 * device_move() should not be used on devices with need_parent_lock
> +	 * set. Concurrent reparenting will violate the immutable
> +	 * relationship needed while locking and unlocking both parent and
> +	 * child.
> +	 */
> +	WARN_ON(dev->bus && dev->bus->need_parent_lock);
> +
>  	device_pm_lock();
>  	new_parent = get_device(new_parent);
>  	new_parent_kobj = get_device_parent(dev, new_parent);
> -- 

Thankyou for adding this, Please feel free to add
Suggested-by: Tarun Sahu <tarunsahu@google.com>

Also, I have seen sashiko complaining about another problem with
device_move which is impractical/impossible. So I mentioning it below
for discussion/information.

Sashiko Claim: There is potential deadlock if a device is being
registered with DL_FLAG_STATELESS which skips the reordering of
the list so device_kset->list will have device dependent devices out of
order. Also same problem can be create by device_move.

=> This is impractical because a device being registered with
DL_FLAG_STATELESS must have its supplier already registered first
(Documentation/driver-api/device_link.rst) which inherently puts
them in the order.

Similarily for device_move() affecting topological order is very
impractical. Unless someone mis-use the API
device_move(..., DPM_ORDER_NONE). Which, as well, not favourable
on upstream.

Once topological order is messed up, neither async shutdown nor serial
(sync) shutdown can work. As it is precondition for it. except
DL_FLAG_SYNC_STATE_ONLY, which is handled in both implementation.


~Tarun

> 2.55.0
