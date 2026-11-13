Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794564784;
	b=GjNaMnw5WHdgK0SPpG/IWHRp09rkGX5S0bevju1WeRpJKwjovVQx6cozYRslyANwZAhV
	 IXtsdx+OlIl37KxsMT3nGyxJRwGffCCCyat2HyPEaVL8JYAf8HYZtZJlIiWoobt/LNAx7
	 vVZoZl38oahO05TaXK4XxyhGt+t+6ALsBVxhOjhIgmmuyJP0CXPKklfP8lJyLmdb9efOG
	 lg7NF8BReTcza+Bk2Z9kmK9chrJRQmqq0f0pTgIGNYLY+blOoXaZjZsPHoi+R7AFAgZ90
	 TnOoyEL50AdJmGtw9DDUUQD/46HHlxXO/IxhC9mmsPZ9i1ri1lp+zYPZCl1RxWxAjyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794564784;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:Content-Transfer-Encoding:User-Agent:MIME-Version;
	bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
	b=sxF1/otPNuRy3Kaw66Totm3ege649vuGapEmiux62VgGvNkxFjY9TA+QdxGXdcBq50EZ
	 bB2vlrHKPZhfgK5GjI+YSqkIyFJPdX+U4D9ZKlbQxuoAwQvJMlNrCsdLSJqyv0uN04x+O
	 V5wkC/xJP47CgagnAJipHKjYfAQnkqsZZGVj54GgCPEAH7TXBq+Ojf5bcxYcyKP7LImEb
	 +S8Q8xFBlOJCuYdWXtCzAy7U0Dy81kiuULIJc26WvAGVdel8mmZNwWXYDavXssXHmChC1
	 7IUDfb2uG9iRNqkzmdkrh/+PD7xbXs5+gKlNfjaK0DDO/c/l7eQ7H5A1GR3NsMbf90A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=amutable.com;
	spf=pass smtp.mailfrom=amutable.com;
	dkim=pass header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e1myWE6m;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F783606A886
	for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 10:13:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8F783606A886
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=amutable.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amutable.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amutable-com.20260707.gappssmtp.com header.i=@amutable-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=e1myWE6m
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a20bdaf39cso13116835e9.1
        for <driver-core@lists.linux.dev>; Fri, 13 Nov 2026 02:13:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amutable-com.20260707.gappssmtp.com; s=20260707; t=1794564783; x=1795169583; darn=lists.linux.dev;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=e1myWE6m24IWw7yO55WYjJEyiNRIFIH9VtBgLn2wa1MeQOGfiulE/mdBZc22DqUEpj
         LBtiiW6O2Ag0NjZTpRJ40TtRMZU8fCff+u90toSJhGqOAoRyDZWFIoS5We1jrN4WgXNO
         JuRjtUCHP1AOX0G7NXkhoxlO02/HgbXQfM0mp2A6TlFXtekUlZKcwwW6BgwJuTMhjgyF
         C9V6dt0ln8hW4H3BWEtb5Ysens3PIyjbvmvUfZEuE6KFb/JvRKTUmZuX9ss31juLIE9P
         Q5BPM9aE7X46wCjJILMdvD8WVwaHKCgBFWUKkxd893AUBxFjUmMLNvefvu/OXp2qFDMU
         mYNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794564783; x=1795169583;
        h=mime-version:user-agent:content-transfer-encoding:content-type
         :references:in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PGZ86VpI4/X6bkLIqgY54HnsW6MSps296zHbeFwxlLU=;
        b=VYc1foBqM+8ehoSelCZEaYtYsENY5/9NyxTNpb5VTVxAcs9FEAuZRMJXSMzjJuO+5L
         gi4B+DOnTTr011L1rly1Yxp5A0InhyKFecihseS06f7MnER1EVpNIZO76jUVaS0Gf0CV
         z1S16UQvpDqHa9YFc01kferPIEvvtbxVvm3VUua4HpqktAMtYn1xwHe5nEycbwCLRCzK
         qf94EGKAXp8HgUBvWWd1nH4ocC4+vVfD577VoIuTUBQ+oLU9Td90hZNoli2jWo4uUzmT
         jrmlQG41qb1RfV+FUKrbsXrpXzQIvGe0VCJtUC8/Zea3iCxE57qnJfFO6RY0ue07ESN/
         tYdw==
X-Forwarded-Encrypted: i=1; AL+hErEoAB9+twJaYWRTLDxsQVszRMbrMbwJE1bbHMKOQIRRkdD67MoouLW4ixGWibB33TiPaM/3It86YxYyfQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+Bln/nJlQZci+PCoUX5r1muw/kaZ2/A59Oz32Q0AsDJ9imYhcV
	CrcTzytwMoTqbLpf8ulXzePvjMsiZlrqlCoj5rFnSm0dhlnLJxbpm4C6fjSdfjfnSrrV
X-Gm-Gg: AYBFou0wnJUM8WYufJIQ9nb4xopKa3LMlr3yNxMjvQgW/AgOcr+3i+uPwJZClnJVC+O
	aP+FNpYhqECT+Vtg/ey5DTfI1FbRiFpIq33LbNwLVGG/6i70PCyq9rH59pYBYKyY4eZgsBFRWSl
	H3CL5Qf6JhbrFIdD9TtzhRuE1zh9yTwBiyViY29Knng0WXODlM/SkaZxoX2IvI3ozs51t++PDbU
	iL0t0yqD2Ldwesw3xnRZR3PnYlXUVceM1rWtrnYzwbpU7a4TfFECar8xXIXii/9mVNraa+64wys
	w7vFjZ45/cs3l3VRdchCmPf47riJIXV5OH14nlMgkyIH5yel8nLXKFYIFUYQfwU+JuT5bhA0/iM
	2oWq0XASfOnw1HGSQ4Oj1HUf7rVNFZPAey5yyvhHFGzJL8tJ66QwHZ6BByG89RbJf5U56V8bF3z
	HhgEME0GATLIhCwdAiAvEpeDNmJLUsz/1CwbEP/Uy2OD4nb0c8vlH8d29/CF0T2cCmSD4J7jbD6
	Tn3QjvVk9hxeNCoSyH+zdP5UV3E99cVvm/cqPfS20Cm3zWl7aO7jHwMyNB4Nv2jiB2Vq3daCqW1
	roI97/RmrN42Xoluy6SW+17n7aiT8PUhz7W4dip0HbRCdabTXWyNga5+4hKcmG5B
X-Received: by 2002:a05:600c:4f90:b0:4b7:6c16:7b43 with SMTP id 5b1f17b1804b1-4bb55a47602mr36814615e9.10.1794564782834;
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Received: from [10.0.0.233] (tmo-086-54.customers.d1-online.com. [80.187.86.54])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb5d2872edsm4056955e9.12.2026.11.13.02.13.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 02:13:02 -0800 (PST)
Message-ID: <94dfa5ec75f4479663dd79f3ce05c1dc6c080185.camel@amutable.com>
Subject: Re: [PATCH RFC 22/41] sunrpc: use fc_init_pseudo() for rpc_pipefs
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
 linux-kselftest@vger.kernel.org
Date: Fri, 13 Nov 2026 11:13:00 +0100
In-Reply-To: <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
References: <20261110-work-loop-pseudo-v1-0-4c998976c6c7@kernel.org>
	 <20261110-work-loop-pseudo-v1-22-4c998976c6c7@kernel.org>
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

On Tue, 2026-11-10 at 10:14 +0100, Christian Brauner wrote:
> Initialize rpc_pipefs as a pseudo filesystem. This raises SB_I_PSEUDO
> and
> also SB_I_NOEXEC and SB_I_NODEV. rpc_pipefs never holds executables
> or
> device nodes.
>=20
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Alexander Mikhalitsyn <alex@amutable.com>

> ---
> =C2=A0net/sunrpc/rpc_pipe.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/net/sunrpc/rpc_pipe.c b/net/sunrpc/rpc_pipe.c
> index 9d349cfbc483..37277a6d2415 100644
> --- a/net/sunrpc/rpc_pipe.c
> +++ b/net/sunrpc/rpc_pipe.c
> @@ -15,6 +15,7 @@
> =C2=A0#include <linux/pagemap.h>
> =C2=A0#include <linux/mount.h>
> =C2=A0#include <linux/fs_context.h>
> +#include <linux/pseudo_fs.h>
> =C2=A0#include <linux/namei.h>
> =C2=A0#include <linux/fsnotify.h>
> =C2=A0#include <linux/kernel.h>
> @@ -1181,6 +1182,7 @@ static int rpc_init_fs_context(struct
> fs_context *fc)
> =C2=A0{
> =C2=A0	put_user_ns(fc->user_ns);
> =C2=A0	fc->user_ns =3D get_user_ns(fc->net_ns->user_ns);
> +	fc_init_pseudo(fc);
> =C2=A0	fc->ops =3D &rpc_fs_context_ops;
> =C2=A0	return 0;
> =C2=A0}
