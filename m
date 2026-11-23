Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795443152;
	b=h69w7DZRlR9X9/itFvvPCPWVpMHCekq7G65eLZYSNdwvNaowhylbZo6gaVe5oS35RP5O
	 ZsrvP67031YdggQkDhY1nEq74WnxlH97vkMjUQevpI73zxn0KkGYUivNq88C68t5Qsd0b
	 eftaKvDJEFhHC1KxMWSv1FAZcwEgCTRpWg4ZHPA5L7+mdtY0rS7ySCIFcD1/+90QBbzwf
	 DTNQS800ePiUmuDdwQPYJzm3kBEPmsOUADSsEQr5c/S9YN4zOBEIjep4WpjuRZc68AFWf
	 a91FDstQNmSetOPX0kHMU4ztJFGqRaaZ35p5ccWVR9NMMUDEvnr6G8SuMSP1WO8sJqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795443152;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=YmajtzA/VPMAycjOs7WerX1NLQIQDrQX0FH28untWyI=;
	b=fGC24TncBdweoDbvpaHM/8lj5wGjqv71qzO+pjdpWEfVGXa0jiJ2fuHyZltFqtG4WSN+
	 WLfCWoGDJPoO2cB0jj7GlpUEiKQRBBvNj25tKmbeeePCE4uD6Fgqnzl2c+u1KyTc4TSRM
	 HyKc3SXjG+oFa364CfK+kpdUdX59aK3tPgwwHjqGLgIYt9W1ARZOxDyArlMUrU3HWuJ3S
	 evWTfzeWaKNZdE2xZsh2OPQlir11HzdwSfETFFIr94QEb6/bBc9E5ymdxLodlikbah2wM
	 HNU2nZhJQG3cwowiKXOZNTqM4whuQrVhuw38hoH+Teecz8ukwnb5VikCSnZv3oHAOOg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=svaO8rbJ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B47B606A31A;
	Mon, 23 Nov 2026 14:12:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=svaO8rbJ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69D491F000C4;
	Mon, 23 Nov 2026 14:12:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795443152;
	bh=YmajtzA/VPMAycjOs7WerX1NLQIQDrQX0FH28untWyI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=svaO8rbJvmwp7Ramp3OoQFA5RT3Hnj09FRmT+Zf23/d7+rJPF1jBaPQ2ldVjaAwE7
	 HAKqTE1gxOH8iN0KD5ApNPVmScYhlmxnJMxfVbw8zpE5YpvD6uKwqgycBrh/28jGzL
	 64T4YoMdpflz9uOkO+uU9h27L8RjHZWHaVhZ0Ong=
Date: Mon, 23 Nov 2026 15:12:53 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	edumazet@google.com, brauner@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kobject: fix use-after-free in tagged uevent broadcast
Message-ID: <2026112346-oboe-alto-7313@gregkh>
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

guard()?

