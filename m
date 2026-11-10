Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=202.12.124.147
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794336531;
	b=G/mLDW/1jaMpT1zpplc0kgAotOlSNQMmmp1wPosV+iELxhz2NJL2XBeD9TqwWYgwtKI4
	 wU719Q+LG/fAhAZlJV//dDPEIack2F/2yObE/MQKpBE8l2SewlZgE/r8yPw/giaJGTeHz
	 EMTxrT4NfI1iPoORnY41KnaGWMHQ8Gi+MArttVh8X8dCZO5P52+vEQqu2S4VG3A+VeEgw
	 cBujixIOmooBKnrVpXDm+jVNq8D9bKCvetILEdR1UHHDLqqzE6oGJRyl7lBs8QMtA2FEb
	 z3o97w5e+9uM1wxX4wYgQgfwFzSfORH38+lBPoRelK0vutMVXykfXJd28tf0jz9ZcyA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794336531;
	h=DMARC-Filter:Received:Received:DKIM-Signature:DKIM-Signature:
	 X-DKIM2-Info:DKIM2-Signature:X-DKIM2-Info:Message-Instance:
	 X-ME-Sender:X-ME-Received:X-ME-Proxy-Cause:X-ME-Proxy:Feedback-ID:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:Content-Transfer-Encoding:
	 In-Reply-To;
	bh=cXGEiEvQgHtbglvSwjnOOe/hBtcGt8NZzDDRg8QglCw=;
	b=x4FCmTxSYeQYVl9IBHWREqDiCAVbvIRRfTvzxHpitLj2GxgBCMovds0uClhRyUK69SDy
	 SxuMCAGC/MCbqFQYoGkaepn78WzYjZSBkoJCyF2F790fqf5gIYgU6WkRzncnIMwDymJKc
	 9Mo3rmgUfcBd7XRdVeXX6VBr6xeM27QqC3MynWuHyt69GlsIbQCafw0RZlUVeoAqYxDBa
	 rlkIvBZ7VGRAtGq6bdkBYWry6SdbNJAg21WsVG35NJdx0r3m2GA9ku3EAXlr6bi6CLrnz
	 pcDTMFrtZRCiWDyiFGjRRZrMdeU0vas/YIj+C+JtQhPAjPjaKXm1e4KZN3BO7BUlrpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kroah.com;
	spf=pass smtp.mailfrom=kroah.com;
	dkim=pass header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=tYeIgVHr;
	dkim=pass header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ff85C8+w;
	arc=none smtp.remote-ip=202.12.124.147
Received: from fout-b4-smtp.messagingengine.com (fout-b4-smtp.messagingengine.com [202.12.124.147])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E365F606A31C
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 18:48:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E365F606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kroah.com header.i=@kroah.com header.a=rsa-sha256 header.s=fm3 header.b=tYeIgVHr;
	dkim=pass (2048-bit key, unprotected) header.d=messagingengine.com header.i=@messagingengine.com header.a=rsa-sha256 header.s=fm3 header.b=ff85C8+w
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.stl.internal (Postfix) with ESMTP id 513401D00294
	for <driver-core@lists.linux.dev>; Tue, 10 Nov 2026 13:48:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 10 Nov 2026 13:48:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1794336529;
	 x=1794422929; bh=cXGEiEvQgHtbglvSwjnOOe/hBtcGt8NZzDDRg8QglCw=; b=
	tYeIgVHry8MIKcaDAF1tNCG0/iMcHRbtDSm6ipp8bD32euZq5AyxalLIi7zIbuq4
	xq5HYnIq8fRiG7PerPpt3E/b2yJo/hW6KT8MyttD5rUS6P5r4dGzuBE6Y+7RdVFT
	rm0bvvzjZziteDaRRVR5oayJ8GDNSTgTuBwlaHt0E+x6AfHCnTz2e7RjLQ38Ncep
	9CIMTJQctViYJs5SWIfQybq+1Cr0jTDAHjhkCKr/CFIrpZnw55O4hSeCAesrcbqa
	RelaR8w6ekdjiMLNAzONgqP2OnqxuitadypF50x3+rc4K0QD6LLEq0jO2Xa8spzT
	/SjW/HtnN4ROdZvXBbExCg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1794336529; x=
	1794422929; bh=cXGEiEvQgHtbglvSwjnOOe/hBtcGt8NZzDDRg8QglCw=; b=f
	f85C8+wDNLyLDrKO+E/8urABbW9qqvrne8umVnyoqYE/XAQx/QDLJwWvVioANypU
	ZbmofXEBaxlfgdaBsBN6JFFGCwgyrFjTmi7Wc8nk5dRU/04ZRrl9SXcDIlMDWYL7
	cEPlSMYR8DuS6mZ1DwTFlu5s0gapTXZ7SDDd6p5kWjSrH5O66cc/3fiPIECveSOh
	sb97bBD6LTY5B0un3Vijw1wOgz8pDqfJJzZg1BKsUbGLjfA6T64GL4zN2Q5z5G/E
	SmR5VQAVXlwSLLGoTYYKuCBZk7e4UHZZIif7P4W9o40kR2MCiYbD+G7aUX76uP/k
	IchXuGAKfIhZSiYBq+HlA==
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=sign d=kroah.com a=rsa-sha256;
DKIM2-Signature: i=1; m=1; t=1794336529; d=kroah.com;
	mf=PGdyZWdAa3JvYWguY29tPg==;
	rt=PGRyaXZlci1jb3JlQGxpc3RzLmxpbnV4LmRldj4=;
	s=fm3:rsa-sha256:RVo/kufmzL3O0mAUum7nNgsX0tFyum5pT64K02vBIqeqEii
	u1bvd3g0Q/YEjdjeT6iFLHVdKR+rsXQNpIAlVlAlaFKRSLIq40Y60sPGNqGKcp9H
	l2UZWDAeYCIS4j/HKi0/VjjW1dUpTMDihytZxswLXPNh65ZZ/5T1jIX0l5eB3/ow
	xCWpPaoON1qH0bnfMqqTyTjmcPsBsFNaHGENZM7D2zxx9Vg9G31XXPd6WORqWul6
	lzhS64eQw5N6s3pDXKOUav8u5vwaYP6OHqjQoEsVpbJ+spVw2WentEUENcWAf7eZ
	bjxvwNonpGeFV332MddeZGIqu9nMdxiko1nU2Kg==;
X-DKIM2-Info: draft=ietf-dkim-dkim2-spec-09;
	repo=github.com/dkim2wg/interop; date=2026-11-03; sw=lmtpprox;
	action=mi-m=1; hc=13;
	hn=cc,content-disposition,content-transfer-encoding,
	content-type,date,feedback-id,from,in-reply-to,message-id,
	mime-version,references,subject,to;
Message-Instance: m=1; h=sha256:SDCGOteaKYVy5FDmAUiKYVwKM6FJDEwGgEvX6izSu1k=:/FlbM9HJ3avFhvej6AdJT3lP7LjujIvIfL641lv9yxI=;
X-ME-Sender: <xms:EWfzatzc6jqUhtr0nd5Lp3v_sS9r53JZcTKR29iJ_KXxLvjCT4Ukww>
    <xme:EWfzapKEInL7Fi-8PGwwwvUkY4jBfqgXaKs_U3pem3LJs4rVvCThHb4Fgkbp5LGm5
    omYuG7tL6N349VJhFvANs-inslz3zHTjQHpKZxxlWXCWrEQPOk>
X-ME-Received: <xmr:EWfzakW5MD7Am-l1a0_g5Gkn-aQizExM406l4dNZnZgjrNe7EegfTrE1ShiKcCM24Ac-bE7UD2gjIurHUP7Qajf9Pg>
X-ME-Proxy-Cause: dmFkZTGRPn6sQipZfSzMgjTs6MkBVxJrL7+0p53cHWsqXko9K6ELdAZUjWmTburkkU8iA3
    nbMpvHKi/jXh/arwhFMpzaTlpXAIr/GgVe/l4y0Olbst8Y8CEBAEgrUJJa+tvBbxDI6X8W
    PN3ie7/O2gf76atCmzW2BO4yxXVcOhrM2tqajnaw1FU3swnz2DkjFA8YufaKYx/vXfzUKA
    DNW9nXlYsVqZU8MWfVULQAv/QlaTRdYiTLjzKdQG9l91IuKqR9MCRPcHYgwrk8XB3/SARs
    e/tkex8yvSbamoKIOI68pSvw+5ghUwrm3B00pM1TQZf95yShMVU9PB1jIgTG1ENY6eCsBm
    7HSZpkU5+X+HuSsOJ/f8ltdev7EvPKkPTS15KSVfcEGJZmbECuUi3ray/Td6/MMcfxg+WG
    pVMwT1+KPn+ZjGLH6mnvvx0Nu/BN4kPVGveRYXXkfiw9GTV5HpWKk98dbvpYm91DKhbswh
    WV/v/XKM9sYveNw1QOmyesM2YzYimFeFjjg58sdOJFXXQ6qzjCIETJIJVMeeDvBG7cHokx
    fzCaum8lzucSd/QAOUwzY7u9tT9qFpnyxjjNl0BfALI+2cmvRZiPfvg1AL/liKjOOn79Ac
    ZQw8Q0UOWyaOBVLT7WTYR6/ThJu0gsYntkaeBHMsV4YlW2OU/KuRIlFI3Y+w
X-ME-Proxy: <xmx:EWfzakZLAKCIrKdxrvsOWnoKjQeCBmt2RwnDLu1U-gnro_BYg-Q9Ag>
    <xmx:EWfzajwqmkSMOvHeu35w6UHDVjnQHzOFNQUSgmlHD7innU-TnJpFWQ>
    <xmx:EWfzas0glOEBP_1x8dnfMEWVj0aSdAk1t5hZmmW00YsC5YmcozbaKw>
    <xmx:EWfzasm7EGs0M5w-92ds0ReAmwlKNIVPOhQAxoAe5dJXG5nXXdZISg>
    <xmx:EWfzahGy59lO9zJ63OMyNlno8vGdhBwpKUoYMKsxdxk6Xg_FSIIJi5WE>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 10 Nov 2026 13:48:49 -0500 (EST)
Date: Tue, 10 Nov 2026 13:48:48 -0500
From: Greg KH <greg@kroah.com>
To: =?utf-8?B?5b6Q5pmX57+U?= <xuhx@hust.edu.cn>
Cc: dakr@kernel.org, rafael@kernel.org, driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: driver core: uevent: netns teardown frees uevent_sock while a
 tagged uevent is still being broadcast (UAF)
Message-ID: <2026111041-plasma-dreadlock-df34@gregkh>
References: <4c7f9772.192e1.1a17d5c2ed5.Coremail.xuhx@hust.edu.cn>
 <2026102727-data-sequel-ce41@gregkh>
 <21f226b6.22aca.1a1c58bb374.Coremail.xuhx@hust.edu.cn>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <21f226b6.22aca.1a1c58bb374.Coremail.xuhx@hust.edu.cn>

On Tue, Nov 10, 2026 at 09:00:29PM +0800, 徐晗翔 wrote:
> net->uevent_sock is published as a bare pointer by uevent_net_init()
> and freed by uevent_net_exit(), but the tagged broadcast path
> dereferences net->uevent_sock->sk without holding uevent_sock_mutex or
> taking a socket reference.  uevent_net_exit() drops the mutex before
> releasing the socket and never clears net->uevent_sock, so a kobject
> whose namespace callback returns an unpinned net pointer can emit a
> tagged uevent after the per-net exit has freed the socket; KASAN
> reports a slab-use-after-free read in kobject_uevent_net_broadcast()
> (inlined into kobject_uevent_env in the report below).
> 
> An IB compat device supplies a concrete path.  Its rdma_net is a raw
> possible_net_t, and its asynchronous unregister can still be inside
> device_del() after the net namespace has run uevent_net_exit().  This
> was reported by syzbot (KASAN: slab-use-after-free Read in
> disable_device, extid 4393dfdddf166f2de2b0,
> https://syzkaller.appspot.com/bug?extid=4393dfdddf166f2de2b0) and I
> reproduced it locally on 7.3 with a KASAN kernel; the same reproducer
> is clean with a no-rxe control and with the v4 locking change described
> below.
> 
> The detailed description:
> 
> * Test environment / affected version
> 
>   Linux 7.3.0 (vanilla mainline tarball), x86_64, QEMU/KVM guest,
>   8 vCPU / 4 GB RAM, KASAN generic.  The tested
>   lib/kobject_uevent.c is byte-identical to the audited 7.3 tree
>   (sha256 bbcf120ea86f42c74dec10e255a8cd0b3034c9f34cd5bb911fd94015729dd076).
>   Kernel config included CONFIG_NET_NS=y, CONFIG_INFINIBAND=y,
>   CONFIG_INFINIBAND_USER_ACCESS=y, CONFIG_RDMA_RXE=y, CONFIG_DUMMY=y
>   and CONFIG_KASAN=y.  The kernel source was not modified to inject
>   the race; only the IB/RXE configuration was enabled and a userspace
>   reproducer was added.

No patch?
