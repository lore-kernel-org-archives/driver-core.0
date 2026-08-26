Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33351332604;
	Wed, 26 Aug 2026 07:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787727805; cv=none; b=Q0G9hrNDxRMH+7fLG97gIVBpYFYs1qdRjhyoG/jkcteUkExUCXAWfmserfoi3KwyCQfrs6uUQKXK39FVPGGN/rFbrHNcmMtM1eIllo5ls0pUXw25WJ8eg9HUsyAg44ZaMPHOd4siPG3/LqjJCZl3loUvF+cy4zQcbwyC+op+RQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787727805; c=relaxed/simple;
	bh=eyrh5Zk46z7h/o6OWWvIWXhU3ZtwrrVkYgqqYH/FRdQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q7Z1O0+bFcSdPEAKxiZDh+pgG93NaNHX9YO9zK5zjwwDxkxsgW6PDQ4Yi+JeCLU3DLXq/g3TA4V+SKGoQEi1lnNk+jxKKkQ6qB2x6CrWyvKGt31HJjI5tojdByPI4lmpdkUxWUGjNky5jTFKJ7jZN3FlNVaOiSVYJsc+eh0rjsE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=aZIFD1r4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="aZIFD1r4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 414161F000E9;
	Wed, 26 Aug 2026 07:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787727803;
	bh=XxducLyt6wdGSM2UI5Nio2djOP6n3ZS0EsbJub2EbKs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aZIFD1r4c+o3AF0JOia0WPW6V0v+22Hi6LOVUNt6HM02Y5dJW4woq0QvfSRO2FNcF
	 LR3HKQApKsJeDUTQI9oBxMxx1LUoMKMrRJikjFfwgFlvZQSK60FnHwS6ZGbXdLlJuW
	 SgSy5FqE19EkWSbEPAiZ+O4QqND5N1bCJvPJxV18=
Date: Wed, 26 Aug 2026 09:01:42 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Tao Yu <tao1.yu@intel.com>
Cc: rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
	syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com
Subject: Re: [PATCH] kobject: avoid blocking allocation while holding
 uevent_sock_mutex
Message-ID: <2026082632-sports-cattail-a5b0@gregkh>
References: <20260826064633.589258-1-tao1.yu@intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260826064633.589258-1-tao1.yu@intel.com>

On Wed, Aug 26, 2026 at 02:46:33PM +0800, Tao Yu wrote:
> uevent_net_broadcast_untagged() still holds uevent_sock_mutex across
> netlink_broadcast().  That serializes all untagged uevent senders behind
> one global mutex, and it also keeps the mutex held while the netlink
> broadcast path may perform blocking memory allocation.
> 
> This becomes visible during USB enumeration, where device_add() sends a
> KOBJ_ADD uevent from the usb_hub_wq context.  If a listener is slow or
> the netlink broadcast path runs into memory pressure, the sender can sit
> behind uevent_sock_mutex long enough to trigger hung task reports.

What has changed to cause this to happen?  USB enumeration is quite
common :)

> Keep the existing send-side ordering, but move the uevent skb allocation
> out of the critical section and use GFP_NOWAIT for the broadcast clones
> performed while uevent_sock_mutex is held.  This removes the sleeping
> allocation point from the locked region without changing uevent delivery
> semantics.
> 
> Reported-by: syzbot+c22bb42560ec86726aba@syzkaller.appspotmail.com

No link?  Was this tested?

No cc: stable?

No Fixes: tag?

> Signed-off-by: Tao Yu <tao1.yu@intel.com>
> ---
>  lib/kobject_uevent.c | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index ddbc4d7482d24..b8832a5ca583d 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -311,9 +311,26 @@ static int uevent_net_broadcast_untagged(struct kobj_uevent_env *env,
>  {
>  	struct sk_buff *skb = NULL;
>  	struct uevent_sock *ue_sk;
> +	bool has_listeners = false;
>  	int retval = 0;
>  
> -	/* send netlink message */
> +	mutex_lock(&uevent_sock_mutex);
> +	list_for_each_entry(ue_sk, &uevent_sock_list, list) {
> +		if (!netlink_has_listeners(ue_sk->sk, 1))
> +			continue;
> +
> +		has_listeners = true;
> +		break;
> +	}
> +	mutex_unlock(&uevent_sock_mutex);

guard()?

> +
> +	if (has_listeners) {

What happens if you get a listner right after the lock is released?

> +		skb = alloc_uevent_skb(env, action_string, devpath);
> +		if (!skb)
> +			return -ENOMEM;
> +	}
> +
> +	/* Keep send-side ordering, but avoid sleeping while holding the mutex. */
>  	mutex_lock(&uevent_sock_mutex);
>  	list_for_each_entry(ue_sk, &uevent_sock_list, list) {
>  		struct sock *uevent_sock = ue_sk->sk;
> @@ -321,15 +338,8 @@ static int uevent_net_broadcast_untagged(struct kobj_uevent_env *env,
>  		if (!netlink_has_listeners(uevent_sock, 1))
>  			continue;
>  
> -		if (!skb) {
> -			retval = -ENOMEM;
> -			skb = alloc_uevent_skb(env, action_string, devpath);
> -			if (!skb)
> -				continue;
> -		}
> -
>  		retval = netlink_broadcast(uevent_sock, skb_get(skb), 0, 1,
> -					   GFP_KERNEL);
> +					   GFP_NOWAIT);

This all feels very odd.  Again, what has changed to suddenly need this?

thanks,

greg k-h
