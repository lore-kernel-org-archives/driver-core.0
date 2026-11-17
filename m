Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794904088;
	b=nt/n0M5z8PObCVndXZ9ytSSOZ967v4NA0WevBwO78aZIWevIjPIFMAWRhh3uZSoACMCn
	 44N76ACbhPVYVMZeBHrYJTVei9tHRPY4VTdVASgzz0eL+sQ3eug+ZsKxw2b20832EuFVd
	 ugiiqMbD1a4t1Hh6vyhuGkpI9fzVIgFrWym409hfmZw1HtQYypQh24Mv2QWMne7bJ2p1d
	 FjXNpflMyuwOgHIpkYLaMwSnaPcO386QIZ+hZNTf+iox0Lhe+e4aamvY4Fc00FrW4Qq8i
	 SzpZQD6bSH5qUTPwIzvNd3QsEn7kVWeuD1ow6221KB02G9i1SkQ3QIq+slx+JZEXMjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794904088;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
	b=4rMu7XtITd3aqVpdatRG/yzFbDC2tnO4d1OPUE9yWQ9JoWFLxA0XWU1cVwlKsNmV0KOk
	 fkjgCsNvNcaELBZmX1dqdagB78+qJ0m+B5TbYKaAjINcHt+CMqTAFhOms3/JNFVnJ7KUS
	 Ww8sQVOeDbgvAHbmjnmAUwqj9Cua8TrGaT6kL6PuE4bsxeaSRtkZA+H73feeHBV+qghHG
	 ROiu1HrGPHOZbmsjzr1j+G+KVckSbSWx+Q73GhiJ1LoHipXuWieOlA55jrxyJ9dBTVxDK
	 g8MfH9inpW0TzCYEILPsYwJ+ELJomvvwixLcrDaYlCjT6/NUbQZ15OV5QEeBpQVwsxA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DyCDe7SN;
	arc=none smtp.remote-ip=209.85.128.42
Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15F22606A89E
	for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 08:28:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 15F22606A89E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=DyCDe7SN
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4a3517554f7so47025595e9.2
        for <driver-core@lists.linux.dev>; Tue, 17 Nov 2026 00:28:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794904086; x=1795508886; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=DyCDe7SNSyTjN7ARNq2r6DBLnJR3AnbwAMjqkw6oWWqi0VP+lt4bzcc+Biv2jt4pmK
         9FnByKXHpsWexx2uVZCNJSfWJppGJHWm+hjzckrUlZOVGMIKxJJ9gDZ1h2egBiGpIwWA
         ZKz/XD6orkSwQ1yi/OCHpiB8FIxs/Gq/lyWgk98W0rCPZa0b/WWNbRVUo0c7Zgr9FfuC
         pOJAT5nV2PusxKIwhzPn4VieWnlUK6zwsUKaRmUeGLqpe46CRxf3QCTkT7OxbuxDx47n
         kkqI6H0P7jtozyWX8pM5NeZFbJfKgZGvKaGc79eKEDTLu3HLvv3jOrIzbzAOQZxNHQb3
         +70Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794904086; x=1795508886;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AET1JHslkSzLNTOs00e5qdhXA33kuZnL+yhN5Q6hFHY=;
        b=hhI77YwZ0ehH0ob3WqGK+VKXpVzfHUsd0LEUHq86DtZPrbcYbY1R2MScQjRpTqSk4a
         4HrE04vcjs5A3HawLTXyyddYWxzQALq1x4AcmzqMCUwPO6jKRZDfunZTwV5M/Ii5/bE0
         pQgKmM5OPyfrFvwGxn18Fbgs/2RyjLNogX9G/re4NiufFGZj3B8Soi+JV4MJMeuDjMm/
         8u0A9Xjdr+Map0Z1r0nvYG7Zpng0usLEX8anP509i4RdnHVEhHZObBznP6xPISr4RXJP
         pABsgbebgX3+NnkwewWOb+xZ9q4JoXJObqS7XpbdrMb6sqaQWPeSXH7s44lr6mBy16yN
         9m7A==
X-Forwarded-Encrypted: i=1; AL+hErEA2xO31g9fsWYGaYIZ7cfFJ380HnAvM6IXAU/s6fC1dfiOF0qCPSn68AV246q4228iv8SutDX2MR+UuQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8J+qlKbtYHAyy93m+TYKd+XCzJhawOLjgVnTReWHDyXfpbDfyD
	arhwjRz1MV2HcBLq82wDH7i/ywNEUJU9qGwqxv+/akloS88mjLn1GaaX1UZOorDWTIZM
X-Gm-Gg: AYBFou3Okph1Q4PJ6UZH8pM8ktH4+IxFVI7sNtgsTU5hzdZeIGYfsfAwWlXFcCkEMGs
	oFGjk3gAZYQ/xJtktf51pX67shVzAykZ4sJlFjAHdwVmIINv6vyyGV9+/rK3Y+/r9F27+Y0+PuK
	pMQAszDuOyxNZStD/aZ3fawC/m7F24VbQ8GhysSy4k2xZ0wxJ7l9eAnBQ+sz5tWjf/cI5Dqor3m
	nUDiA4KYEdlegDsDSjN6CpkT6rBF7lsQ9a3C2UZwAd0Ask7LaVaionaem1aFifr4j/RX1mh+QJD
	XDHzQw38xJTw8hPtiVi77QPl5MWY8NKALZks5ozyWfe3hG3dqHAsne6ghdpyR91/LZhTpK8YXlC
	Qm2fhlafgO0uelI3uld1F9whS8jPJK/HAZUpnF+3QNL9SKqGzTJC4LdWnpWWNqZcBu33jXkChOs
	eFuEBl9cKgDe0IWccIa9bYCCEPBP2pra/SKc6vsnq0y9Hwz2J8QtzCQ/OalIjaYyQaq5A99XupN
	QyUvBKvPmFMMMD30Vk2BGI95gpA+jajLJl6ILnZfoS8EbAkSe3v6spAKo07hd4N+O7Dn++rlzur
	z+TSiH/7zCggZbZJCKwvmntVrO0SsUG817ehsnQIJfW4DNKceKkMjO7OAUrjPTAWzqgyEIx18IH
	v4hTC5ACtbucSTHvOX/imG/Gr5Cnou5kGPHekMtJE4O67caJQAI5rL0x5
X-Received: by 2002:a05:600c:512:b0:4a2:a9:ed87 with SMTP id 5b1f17b1804b1-4bb55a5aa47mr209766355e9.19.1794904086313;
        Tue, 17 Nov 2026 00:28:06 -0800 (PST)
Received: from ?IPv6:2003:cf:572c:2800:de4c:6789:33ce:97c2? (p200300cf572c2800de4c678933ce97c2.dip0.t-ipconnect.de. [2003:cf:572c:2800:de4c:6789:33ce:97c2])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb78418853sm74782845e9.8.2026.11.17.00.28.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 00:28:05 -0800 (PST)
Message-ID: <fa0ce0f7ecdbe91cc6773bcbe86be137d2129944.camel@amutable.com>
Subject: Re: [PATCH RFC v3 21/44] nfsd: use fc_init_pseudo()
From: Alexander Mikhalitsyn <alex@amutable.com>
To: Christian Brauner <brauner@kernel.org>, linux-fsdevel@vger.kernel.org
Cc: Jann Horn <jannh@google.com>, Chris Mason <mason@kernel.org>, Josef
 Bacik	 <josef@toxicpanda.com>, Christoph Hellwig <hch@lst.de>, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-nvme@lists.infradead.org, Alexander Viro <viro@zeniv.linux.org.uk>,
 Jan Kara <jack@suse.cz>, linux-scsi@vger.kernel.org,
 target-devel@vger.kernel.org, 	driver-core@lists.linux.dev,
 linux-mm@kvack.org, bpf@vger.kernel.org, 
	linux-security-module@vger.kernel.org, selinux@vger.kernel.org, 
	apparmor@lists.ubuntu.com, linux-nfs@vger.kernel.org,
 netdev@vger.kernel.org, 	fuse-devel@lists.linux.dev,
 linux-efi@vger.kernel.org, 	xen-devel@lists.xenproject.org,
 ocfs2-devel@lists.linux.dev, 	linux-s390@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, 	linux-usb@vger.kernel.org, Amir Goldstein
 <amir73il@gmail.com>, 	linux-erofs@lists.ozlabs.org,
 linux-kselftest@vger.kernel.org, Chuck Lever	 <cel@kernel.org>, Chris Down
 <chris@chrisdown.name>
Date: Tue, 17 Nov 2026 09:28:04 +0100
In-Reply-To: <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
References: <20261116-work-loop-pseudo-v3-0-8cbbea1cf34f@kernel.org>
	 <20261116-work-loop-pseudo-v3-21-8cbbea1cf34f@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

On Mon, 2026-11-16 at 12:04 +0100, Christian Brauner wrote:
> Initialize the nfsd filesystem as a pseudo filesystem. This raises
> SB_I_PSEUDO and also SB_I_NOEXEC and SB_I_NODEV. It never holds
> executables or device nodes.
>=20
> Acked-by: Chuck Lever <cel@kernel.org>
> Reviewed-by: Chris Down <chris@chrisdown.name>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>
> ---
> =C2=A0fs/nfsd/nfsctl.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/fs/nfsd/nfsctl.c b/fs/nfsd/nfsctl.c
> index f32311f2d7cf9..ce2666deddbd9 100644
> --- a/fs/nfsd/nfsctl.c
> +++ b/fs/nfsd/nfsctl.c
> @@ -9,6 +9,7 @@
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/ctype.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0
> =C2=A0#include <linux/sunrpc/cache.h>
> =C2=A0#include <linux/sunrpc/svcsock.h>
> @@ -1375,6 +1376,7 @@ static int nfsd_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &nfsd_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
