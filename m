Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795340522;
	b=hBu//+a5FtN/d4/jsfVzZlJ0ElYYQAKcTwFuvyu9j4p5D0gYDzADLdG7phg3n9jfoFVk
	 gmqBzahfnZh2/tVSApXbeCRZ9JGiKH1SVTtJ1op3/6TzL5HvDv2v07gqHLpbtId5j9QbC
	 kqzKkuKn4tfjTiNaBzDB9vc7xUok2TjEHb0iCAzFedAweFXHQ1T1VV7HJCHRCqAZflKUw
	 1jvrxw9iSHxWSYowtYUeK6Amm9v5AlbzQGeMspDDTmWEWvjXnNOVECnAPhUpLDQFoHc0Q
	 pRYuZ/r36YFvM1fU7sB08nF8L/EoMU5NmjMEyDcBRKfWTbU/fFu3nWQvZZA2/mLtT7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795340522;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=/P+JQaHCo/Br2LpfJL5PdETIpzHgzrdeE7jnOGhuAzE=;
	b=FgsBrJ9E09mMDhkG6nZNa/i387fpp/B+/bcMFtIY4pSBdfrEF9FJyyOMQx5le0RVFtaj
	 iGESn9ztL4fQKgw+k1/ZnT1fqJC8vCYJkl3rNQuKK7BSt4cDjxn3gFVyb2A6rZdpBZXz6
	 Y4RRGqo3DkgaskBLT0H29u0F2KugB1lnpo0fhoVxI7UOE0MUBRTqC3rtLrzQGMBXcWej2
	 ALfKqSxt5fU0nmGPu/SQvx4JafK8hQkAT15xr3F3RcdI+fjzQ2Xy4VI/s6Owgo1RaUuXZ
	 ZHIelMFKTsyukBUsm0++J5IEVK9tzYt7GrDM2bEljUorarAfq9zs6EcHaDSX3ZXE9RQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=V20elDSc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EBD8606A320;
	Sun, 22 Nov 2026 09:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.a=rsa-sha256 header.s=korg header.b=V20elDSc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA391F000C6;
	Sun, 22 Nov 2026 09:42:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1795340521;
	bh=/P+JQaHCo/Br2LpfJL5PdETIpzHgzrdeE7jnOGhuAzE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V20elDSc6jNjzxUGPiB75CJxOCyQBK/5/Y14nZ7ifvfllB7Zh50/EWkLl2S3/VuSM
	 3JnoILLL/v/YEbGMtOnZOWGEQRFt2wV6ZOEwUqJzkrXwdWoga3kkTlQWNxVWpl5eep
	 J5K+T0NP1SDfZNBjFqe7kg21mvTISjbuiVHXefgs=
Date: Sun, 22 Nov 2026 10:41:58 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: =?iso-8859-1?Q?=D6mer?= Mete Kaya <omermetekaya0@gmail.com>
Cc: rafael@kernel.org, dakr@kernel.org, akpm@linux-foundation.org,
	edumazet@google.com, brauner@kernel.org,
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] kobject: fix use-after-free in tagged uevent broadcast
Message-ID: <2026112237-delegate-neon-7b4c@gregkh>
References: <20261122061751.178540-1-omermetekaya0@gmail.com>
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
In-Reply-To: <20261122061751.178540-1-omermetekaya0@gmail.com>

On Sun, Nov 22, 2026 at 09:17:46AM +0300, Ömer Mete Kaya wrote:
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
> Discovered by Sashiko, not triggered, not runtime tested.

Please test and get a reproducer before attempting such a change.

thanks,

greg k-h
