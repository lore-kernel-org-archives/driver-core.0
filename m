Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A77042D6E66;
	Thu, 20 Aug 2026 06:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787208103; cv=none; b=lWnFCDfNEFNIyBansft8vZDtSqE/fCtM/tspxUr+7V5X1R7lfKV760vZWN9a85UCfYYT8S4SPlUDbqO3KWxymWkdN2ZzRkKaXBD2e69Hd1SYRSj/aZAa/NxA01Wk6hs/mh0MG3DyyU5hzDLdzN1ymmoFafFR8tsLT9o9nyezfRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787208103; c=relaxed/simple;
	bh=HK8OHhCdie3U5AlLwpuJTgkOi5q9uKYKu/UqlmZcOPA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LytZV34yvQHlC7U1OOnyV8kesR8ZE7PaiaEv3M97yRkc4cnkqz16LVe4K0sX6ITb341OchOz+iHvKbiXhcztZ5fppebLXFVdJfCiY1tx0Rknk9LrqEPNCIPYxg/2YBA6MjA/BGj88JAnPLSUTBTHY7yN/kFa3a+utaoURDaqFso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ayMrNDda; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ayMrNDda"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1B8E1F000E9;
	Thu, 20 Aug 2026 06:41:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787208101;
	bh=A6z0vphuW81DjBqaPEoBpamHJRxMbGMHk/J68SSKJFY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ayMrNDdapapuGTNEpg0lcsbzFuscoIaU2LOqwmTS7v8CQZsnjqvYaGno30rlsedXB
	 NAAVHrvJavd3fYKpnNYUHLXuBtFiaBQWL1sWZg1iM+WTRsM52hj7RcvV1Nv7NRjp5m
	 +t1Ur+HdAxN/UwEfX2w7RKtgb0vyfOvToWeLGlR0=
Date: Thu, 20 Aug 2026 08:40:04 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>, eadavis@qq.com
Cc: rafael@kernel.org, dakr@kernel.org, driver-core@lists.linux.dev,
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
	syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
Subject: Re: [PATCH v2] driver core: avoid klist_remove() on unattached
 knode_driver
Message-ID: <2026082048-malformed-finite-4e61@gregkh>
References: <20260820055502.49963-1-khiemtranzo532001@gmail.com>
 <20260820060523.55087-1-khiemtranzo532001@gmail.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260820060523.55087-1-khiemtranzo532001@gmail.com>

On Thu, Aug 20, 2026 at 02:05:23PM +0800, Nguyen Quang Le Kien wrote:
> usb_driver_claim_interface() sets dev->driver directly and skips
> device_bind_driver() when the interface is not yet registered, so the
> device can reach teardown with dev->driver set but knode_driver never
> added to the driver's klist_devices. __device_release_driver() then
> unconditionally calls klist_remove() on the unattached node, which
> dereferences a NULL klist pointer in klist_put() and crashes.
> 
> Only remove the node if the device is actually bound, mirroring the
> check device_is_bound() already provides for the driver core. This
> matches the existing guard on knode_bus in bus_remove_device().
> 
> Reported-by: syzbot+87188222c77c0dbbdb4d@syzkaller.appspotmail.com
> Closes: https://syzkaller.appspot.com/bug?extid=87188222c77c0dbbdb4d
> Signed-off-by: Nguyen Quang Le Kien <khiemtranzo532001@gmail.com>
> ---
>  drivers/base/dd.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

What changed from v1?

And why did you send the same patch as Edward Adam Davis <eadavis@qq.com>
just did:
	https://lore.kernel.org/r/tencent_0B76C5676E3DA13640962637444B28743709@qq.com

What is suddenly causing people to care about syzbot bugs for USB?

thanks,

greg k-h
