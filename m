Received: from mail-yx1-f49.google.com (mail-yx1-f49.google.com [74.125.224.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3A627260D
	for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 07:31:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782372688; cv=pass; b=Y1yVGPyWRG4tsmXONroD/1rB8RDX8BnU30UgwJ6Uv/oy93907+O1KuaSWYyIwVTNf5C4TQaCmliORgCl5DlQFGS9PqFbrR4LCd7sEUHQ/22JfZfb7Cq9XAbY7muDsCngpEjrqX7ICM4J+ue6h9mGrtluuU2vgVzKeAnaa632qrQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782372688; c=relaxed/simple;
	bh=lAo5Xu+2T+t5IPji9Z6IeZ4Glyvq1opJPxfoiDQcO2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HI8Mz93fB/c8S8rI8uOeKTP2Ybv8s51u4ffzJdS7Ppotd1I8xZgIRdltaklZ0swEQLUOj/7RfABpz6EURWDCsiDRAOr/lNVgWwK7TuCDEmTyHrKhA8mYqegCcv80Iyz5GODdf1xoB/ifikh9xAzohWsUBd/iQG0h9lUoydL2QXM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tI6UMieL; arc=pass smtp.client-ip=74.125.224.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tI6UMieL"
Received: by mail-yx1-f49.google.com with SMTP id 956f58d0204a3-663167a3ba2so2073775d50.3
        for <driver-core@lists.linux.dev>; Thu, 25 Jun 2026 00:31:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782372686; cv=none;
        d=google.com; s=arc-20260327;
        b=hLmJGspQsWYx4QKxB47e8BRNukGIKoxKmYrG18FKqOiiUQEu/lnoMmbLCUT0GbdjJm
         FOX4+0vbAMkB5V45OLcxx3b2ZEXVy05Vp6cmtMHZEtwERkd/0vfTdOUP+hgORK5Og77+
         a2ckD7JYPg3JsCVa0cp5jIvZRxNNO22k0/3v3ju0wCADhxLOJs4X0VoDZuvlot64dJHQ
         afke2L+aNzaa5E4ceqUcHX7CC4uHrX64P9WbnjDa7eMmNtqaFWWxtUKUr0jVCKpTV8Jh
         aB3FapjsoHk5Ms/NAmqAGx1cJE9T7frvSAXYoVf4gH/66mlJHHslsRCg8jflQZE8fCAG
         M+Mg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kmk5iye4ZLJubb/NNFsRnqtpnOsNy5rDxz85TFxoSQg=;
        fh=2azvKJlVJ/QaUcjpNTqbj9NUxaU1sbxI8ky/KBqfoiE=;
        b=CLdy/WPtj2+YTMRQx67GlVxEUULEXPPZjvOOTFLOuUDohAuPFKrMULJFdAxBGwM0Lr
         BY+8T+Z/Xj2gllwB4OOHzXowWzTI1RF2ymdJSIKpDMMh9SwrW2XAnusYrkCNxVYw7wXN
         iJYumicoTB9qlE5jQ4bw34KkvtyaIJrs8I7D6+DRItyA3ReuJfWsfayOJrzBxnGYuluy
         n/LPl6vihVYd1n/YzGo/VACm/MlZ+8FnT7f+iQjT3F4Px9L5mV6FRYdqAV+ZEvFAT8Pe
         ZXvEgNGQidPOJmN/BUGIS/Pb+qxyMU80ERZa2CDo4y/17AQeZsyjfte0i60fJSZbfy6B
         a0Aw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782372686; x=1782977486; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kmk5iye4ZLJubb/NNFsRnqtpnOsNy5rDxz85TFxoSQg=;
        b=tI6UMieLbQ/wm+2+8ComFNQz4ozqW49gt4S1hlG2jYe0Bg6Ubm5RuRo9mD1NqdZZ85
         BFsgWBXdWkFYwTmLYk5ATur7sIJ6BDexUkkvbERb0qLU7Hy3hkzJOOozI7NNxOfsI03z
         ilhrzCSaE2GJEwlUovbzm42N3v71OrWstwwIskTRVO+e+d3TNBVh15csKnWMydfNmM0y
         9lpXhML+BLeMujit6Aw8Qcq0mWgy3ckrSmqfAbzULg2prBBG/yKE+3ZYUg0jUhv/f4Jw
         3vn6AqjyO72c1e2HymiR0Uz1VrXdbDbIlbxbuR8IVE0XGB1sGAugwr8/oKokR0IvMfSy
         PK4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782372686; x=1782977486;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kmk5iye4ZLJubb/NNFsRnqtpnOsNy5rDxz85TFxoSQg=;
        b=eiwJhuXc4gFObnjmTy0Bnvxxj5p+PBpFgsyC7IDSLcgYP6ZAItgS2Nft2IMPDl0wPk
         /CkOfYssywvUOzB8bAy6DzYvKYUlJXCD+Luz+84sbxMHfNAE5GVEssafvyFTOC8FpsIQ
         2uRg0Hv4BG93NTJnsPIlmgF7m3mK/JiZhukVlF6QdhVUC9IGYtbULpoIPNTvuypYoPhX
         g6JreE7JlV92CSU581Ya7fI1jUpwypChHb6C/9nQHzhmPHPi0twcCVPwcsIAoZLAN94x
         IKM5XccSqEHBIbmN61D8071u2JJwz0Miv8M485nzZkTxiZowaidhDQiW3MfJIzRlLx7z
         3BhQ==
X-Forwarded-Encrypted: i=1; AHgh+RotXgunZxW3q+mIvK28tk4zXje5yqJsh/MlBvGDgDIzgSUfBel5jR6PSF8T/pQ+5r9n3Lgi+IxFrH8JBg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy1YrfbKc6W7uAP93KREwDSPN1N4DmgHWETeT8TnYewoU3AVEvk
	sMLAOWaGmB/smbqzYOsu9Jc/IcF59/NIvLS5/i9Q2ou5K698lFVPf/nispds0bl9GsRTcPy1KCT
	rarZ1MuSgVldJCfCTvR15ZqB52SL/msU=
X-Gm-Gg: AfdE7cmYkm6ozwaEPtZudmEW3ZQfCNxym8tf3kPuJS+J/G7mozv18cExzmMws+mpUaK
	jfbNSa/atxKAvTgnaDPk4rZ6eB6+y2N55Vcf2XjegUFW0/JZfYa3qvWa+aZnM0rRC2/aqGkGkcQ
	xiqe7sb08zFvyb2VpFFcT5wANTyJrWYH9k17niJugQ29SsNxyrb97OQXNxChPPcHDbLFeCgC+W9
	PnIasNyTnwt8rrnybYrsxkhT4MX/zQaAUo2Q2adeLLWl9tkmuwqCivioOmf+HBjKeLfeg==
X-Received: by 2002:a05:690e:b4a:b0:660:3f57:9fc4 with SMTP id
 956f58d0204a3-66487c6ff3dmr1015598d50.28.1782372685809; Thu, 25 Jun 2026
 00:31:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260617163919.2544899-1-ekffu200098@gmail.com> <20260624204030.3c8baa67713b6ca1d537baba@linux-foundation.org>
In-Reply-To: <20260624204030.3c8baa67713b6ca1d537baba@linux-foundation.org>
From: Sang-Heon Jeon <ekffu200098@gmail.com>
Date: Thu, 25 Jun 2026 16:31:14 +0900
X-Gm-Features: AVVi8Cf16h4yiA49dDNq8I7QKdcvkwxM5V6_GYgQOYh9RMn1uG-9O3yjxShLOm4
Message-ID: <CABFDxMFi9e-GgC8scDmhOt7AgEUsqxgJfsg8V=A=yGxFj69DMg@mail.gmail.com>
Subject: Re: [PATCH] arch_numa: remove redundant nodemask clears in numa_init()
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rppt@kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, linux-mm@kvack.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 25, 2026 at 12:40=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Thu, 18 Jun 2026 01:39:19 +0900 Sang-Heon Jeon <ekffu200098@gmail.com>=
 wrote:
>
> > numa_init() clears numa_nodes_parsed, node_possible_map and
> > node_online_map, then calls numa_memblks_init(), which clears the same
> > nodemasks. Nothing uses them in between.
> >
> > These clears have been redundant since commit 767507654c22 ("arch_numa:
> > switch over to numa_memblks") made numa_init() use numa_memblks_init().
> >
> > No functional change.
> >
> > ...
> >
> > --- a/drivers/base/arch_numa.c
> > +++ b/drivers/base/arch_numa.c
> > @@ -231,10 +231,6 @@ static int __init numa_init(int (*init_func)(void)=
)
> >  {
> >       int ret;
> >
> > -     nodes_clear(numa_nodes_parsed);
> > -     nodes_clear(node_possible_map);
> > -     nodes_clear(node_online_map);
> > -
> >       ret =3D numa_memblks_init(init_func, /* memblock_force_top_down *=
/ false);
> >       if (ret < 0)
> >               goto out_free_distance;
>
> hm, OK, thanks.
>
>
> A couple of driveby questions:
>
> Are the other nodes_clear() calls are needed - aren't these things
> zeroed when the kernel is loaded?
>

You're talking about nodes_clear() in numa_memblks_init(), right? If
so, I think they're needed.
Because numa_memblks_init() can run more than once during boot, and a
previous call can leave the maps dirty.

More detailed example, If we first try to set up NUMA from DT,
numa_memblks_init(of_numa_init) is called.
of_numa_init() parses the CPU and memory nodes in order, so if parsing
the CPU nodes succeed but the memory nodes fail, the CPU-node bits are
still set in numa_nodes_parsed.
We then fall back to calling numa_memblks_init(dummy_numa_init). Since
dummy_numa_init() only sets node 0, those stale bits could survive
unexpectedly without nodes_clear().

> Also,
>
> #define node_possible_map       node_states[N_POSSIBLE]
>
> ...
>
> nodemask_t node_states[NR_NODE_STATES] __read_mostly =3D {
>         [N_POSSIBLE] =3D NODE_MASK_ALL,
>
> why do we carefully initialize node_possible_map at compile-time then
> zero it within __init code?
>

I also can't find why we initialize node_possible_map carefully, at
least for NUMA.
I'm not sure it's safe to remove initialization with UMA. I'll take a
closer look when I have time, and send a patch to remove them if it's
safe to remove.


Best Regards,
Sang-Heon Jeon
