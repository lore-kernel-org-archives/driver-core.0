Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443142;
	b=h/apaM/GbP73c/Yvcp/RMcEMY/9SP1lJdOuSgy5CEEF9kccqf3n9tfJ+URmpMoqr4rcZ
	 ApLZn+Guiqxa+SV9jL5KI4tSO0hGH/PQEu1/S2riYel+/fOn9ZbPg26wqzfdgZhQkSe5+
	 HmTvenGG51ksK2h+RJ9eoitVVFq4raa76Zn840HN5iIpraoO+VxsxTRyr+a/dR/tBmnXv
	 4n2asriAT5jTPAWQfeE9jyrWqtmksXcQkT+X258cQ+ZGdAO6SyF1b3V5edzMjH12CCJvQ
	 aUFEjGygB0tDW5dkEcMENIE64YGgTKbX09TrBoCeU4VeDn6hM8M38hkVRpg6PvSMymw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443142;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZInAM0SlEYTJuwxcFLX4q4OHsMox/p3rVIXW0m688OQ=;
	b=a0QWrJ50eby3yImFpCmtGGS/0tFXVeH+XCTfy1Sh5K2/aQox2E7apbvxTIs64qJh1+aP
	 6+hqQUNtBZcCBeNur4ucjxpCHrKfIuN+scX8O+Ilidh+ZTe0GsP3t6M/Tj105EBoJC5Ia
	 mzCIF6kjMTxkSyCQVs15RgYuc208rWJx4O7dNMA+2aG1/k/nImyp9rSS1csIvIuu9+vCH
	 F2PNNLlliQZByQA+3Ao7luSCdi5kmaxK4WuG6Zj2y/773gNiDLKBRaMRSXFJZiy39d/vI
	 n1Gal+XC6YzKKjFFid8aUq1v2ggsZEnHEQy8OUy7lVBRZrdN3XvmAJBk7XjA6U8+tRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ko23smz6;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 400FF606A31A;
	Mon, 23 Nov 2026 14:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=Ko23smz6
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2CE241F000C6;
	Mon, 23 Nov 2026 14:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795443141;
	bh=ZInAM0SlEYTJuwxcFLX4q4OHsMox/p3rVIXW0m688OQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Ko23smz6cVW3aTQ/JIwtlyXXv55vy93yEfBkEB6jCFv2ZFtpYLnea/9v56jo/EAmc
	 dMXii81MkMHaBjxmY1BWXorgJGpsUfFpO4J1ofaao8ldGOJ+RbLwxO5kb4lb35c5NC
	 paJQirAzgUbiw1wg2BMft+Mc5MSzDx7wtJIVHrn4=
Date: Mon, 23 Nov 2026 15:12:42 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	edumazet@google.com, brauner@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kobject: fix use-after-free in tagged uevent broadcast
Message-ID: <2026112325-preseason-silly-cdef@gregkh>
References: <20261123132246.220476-1-omermetekaya0@gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20261123132246.220476-1-omermetekaya0@gmail.com>

On Mon, Nov 23, 2026 at 04:16:50PM +0300, Ömer Mete Kaya wrote:
> kobject_uevent_net_broadcast() accesses net->uevent_sock->sk without
> protection in the tagged (namespace-aware) path. During network namespace
> teardown, uevent_net_exit() frees the uevent_sock while a concurrent
> kobject_uevent_env() call can still reference it, causing a
> use-after-free.
> 
> Extend uevent_sock_mutex to cover the tagged broadcast path and the
> netlink receive path, serializing them with teardown: in
> uevent_net_exit(), set net->uevent_sock to NULL under the mutex before
> releasing the socket. In the tagged broadcast path and in
> uevent_net_rcv_skb(), check for NULL under the same mutex before
> accessing the socket.
> 
> Closes: https://syzkaller.appspot.com/bug?extid=7db35adbc02c5b86d4e0
> Fixes: 5c0941c55e5f ("kobject: reduce uevent_sock_mutex scope")
> Signed-off-by: Ömer Mete Kaya <omermetekaya0@gmail.com>
> ---
> v2: Add Closes: tag.
> 
>  lib/kobject_uevent.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/lib/kobject_uevent.c b/lib/kobject_uevent.c
> index ddbc4d7482d2..fd61307c045e 100644
> --- a/lib/kobject_uevent.c
> +++ b/lib/kobject_uevent.c
> @@ -411,9 +411,15 @@ static int kobject_uevent_net_broadcast(struct kobject *kobj,
>  						    devpath);
>  	else {
>  		const struct net *net = container_of(ns, struct net, ns);
> +		struct uevent_sock *ue_sk;
>  
> -		ret = uevent_net_broadcast_tagged(net->uevent_sock->sk, env,
> -						  action_string, devpath);
> +		mutex_lock(&uevent_sock_mutex);
> +		ue_sk = net->uevent_sock;
> +		if (ue_sk)
> +			ret = uevent_net_broadcast_tagged(ue_sk->sk, env,
> +							     action_string,
> +							     devpath);
> +		mutex_unlock(&uevent_sock_mutex);
>  	}
>  #endif
>  
> @@ -743,6 +749,7 @@ static int uevent_net_broadcast(struct sock *usk, struct sk_buff *skb,
>  static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
>  			      struct netlink_ext_ack *extack)
>  {
> +	struct uevent_sock *ue_sk;
>  	struct net *net;
>  	int ret;
>  
> @@ -760,7 +767,13 @@ static int uevent_net_rcv_skb(struct sk_buff *skb, struct nlmsghdr *nlh,
>  		return -EPERM;
>  	}
>  
> -	ret = uevent_net_broadcast(net->uevent_sock->sk, skb, extack);
> +	mutex_lock(&uevent_sock_mutex);
> +	ue_sk = net->uevent_sock;
> +	if (ue_sk)
> +		ret = uevent_net_broadcast(ue_sk->sk, skb, extack);
> +	else
> +		ret = -ENODEV;
> +	mutex_unlock(&uevent_sock_mutex);
>  
>  	return ret;
>  }
> @@ -804,13 +817,14 @@ static int uevent_net_init(struct net *net)
>  
>  static void uevent_net_exit(struct net *net)
>  {
> -	struct uevent_sock *ue_sk = net->uevent_sock;
> +	struct uevent_sock *ue_sk;
>  
> -	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns) {
> -		mutex_lock(&uevent_sock_mutex);
> +	mutex_lock(&uevent_sock_mutex);
> +	ue_sk = net->uevent_sock;
> +	net->uevent_sock = NULL;
> +	if (sock_net(ue_sk->sk)->user_ns == &init_user_ns)
>  		list_del(&ue_sk->list);
> -		mutex_unlock(&uevent_sock_mutex);
> -	}
> +	mutex_unlock(&uevent_sock_mutex);
>  
>  	netlink_kernel_release(ue_sk->sk);
>  	kfree(ue_sk);
> -- 
> 2.56.0
> 
> 

Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- You have marked a patch with a "Fixes:" tag for a commit that is in an
  older released kernel, yet you do not have a cc: stable line in the
  signed-off-by area at all, which means that the patch will not be
  applied to any older kernel releases.  To properly fix this, please
  follow the documented rules in the
  Documentation/process/stable-kernel-rules.rst file for how to resolve
  this.

If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
