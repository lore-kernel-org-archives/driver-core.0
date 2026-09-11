Received: from mail-ej2-f12.google.com (mail-ej2-f12.google.com [74.125.228.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283B5357D0D
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 18:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.228.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789151597; cv=pass; b=Gy5kSUqT/URrv8ZA0CI2xOjqdqu8VjwWl/QA2bRDxttE+r1swzAEOyQLiI4mOdNM9iouUGIlk98SGAIt4T1dBgMXEMq+9tHJkNAr22OlaykZYxkvbHe1n51/I9XiDIAd1O0TpvFayXPqlF5u74bFPEsB/o4096K3BNuD0j03eHg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789151597; c=relaxed/simple;
	bh=BSqo+Pm7bAdch3Iq4rVn9TzBeUZ0xQ4rk5GEyIAS2rQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lKQFcuwFH9xr+Us8suaazj3ylQJ0XgzrFwz1bxQobHp3lAST160TYwQUDFgg4JwKVMt4Nk8iWtFb/NLeqNXz7iqC20FSF5pkeI7u+YuUTTcQCwj74atylRaTp0+LnJt/G0/IWHfHgOTDwAu7qNITLqjcAUGpTqlYwPPIzny/19M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wguwiegR; arc=pass smtp.client-ip=74.125.228.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wguwiegR"
Received: by mail-ej2-f12.google.com with SMTP id a640c23a62f3a-c2940ef15d3so33994966b.2
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 11:33:15 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789151594; cv=none;
        d=google.com; s=arc-20260327;
        b=axiAn35i7NqP1AjngxLqppsNp4UnkMhAKa+4I6YSRi/RetsAINUbOzNWM3AhEH94Ok
         mE6fBau0D+7/36cGlglskMCQF/i/j3cDgy7gl50d1K/1gbjDjy0L3I2WinpOYpcIfV48
         Gd0Z8/zbnVMNTvYyB06JCW96+ioMdl9ZPn1b+vQTtHJhHoUBrv8WYoUIN9f6/KoRL3U7
         bCqxMtUjrZTlyGiHqDpuarY6hl7ZUHYkcS8ZlO5K4+3/71Y47V1YPnZolCn8IVhB1/LK
         DMY/nsY37z7Y+miFRUxLbz0dg+1PJG/IK4BtbUbJsK0Xc7B/euTTWfypYrIInTo8LGEl
         U3vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qs3HgQRmWYZBaxjbc+wsq8KdyLLiiWdlbvxt2Yh0zD8=;
        fh=GVn7VwLB8ALbpS7droCMUEbXKGSYwuYQWgkgmo2NEL0=;
        b=MItM9g3W29Md4hJIFibHeceBdkv1QIivPxFmXxRaXfLOJrhBCvXw/lASdtkuXHjnTF
         yN4G4WsSYTKE9kXpfsvZmtGcKdkTxIRCgw5N8X54Mq8kGEFLB90PN/2YFmLoptbWiy4g
         ABgZXH4Q0R01BsKSeShR1WZig9mnJqg6Yluoer4qjVgv3+HnI1bD+J6K9DH6Vk1DgEP3
         L0DnvZSzASLVfGXPEVwBxqqmU6ELpUUUMpPxq313B1NPXaqQMGv/QckVN/vEzgyKu3De
         I2tpIMxIS4S026UXOQeSVkbRI9Ox7ThFKKKUl3AWvjfnKwHlKJnao7PvyAc+UPPg0/On
         JP6w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789151594; x=1789756394; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qs3HgQRmWYZBaxjbc+wsq8KdyLLiiWdlbvxt2Yh0zD8=;
        b=wguwiegRCEaJmr9XPhyDNTZ2LvGIoH7gGpPG0WV8feIf66Dp8z84/mS3mEeEwAl1gs
         IGnm89IIdOsgkEyTdKoqVNDxhRXoh6UeZb0xmquwNc2vCA5ivr8jsESWFU0HWW4zlHSo
         +Yss9ozns7b/m158nsw3CS8Jp+zk6+slVqCsx+SgAKJsGkV1aWqau7ScdXn35zbv2tZG
         eG/HnAPDCs+96RSXGx6AfWBEn1bmyCMJ6BRSe7k7ccqy7E/VaYVGaajdnFLfmq0YbqE8
         K47MdRp7W4EpQMNF7urpp3aBqAWHxvEx7bdnzhElmXqwi0TUgNCpwoRkixEDMFkFcdom
         D5RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789151594; x=1789756394;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qs3HgQRmWYZBaxjbc+wsq8KdyLLiiWdlbvxt2Yh0zD8=;
        b=spGWTWBfY5XpXI/BI1+5GVzbayST0vVPWhmgYR/8UR+HfBHRMWK0eprTcaWIMGn0xV
         boPwyrjNv6ahlijN2ZmnCLkKlxuWxFCcoMdVd/eJKZ556eLgBb+aRN1F0RlS/WONeKcV
         6rz1p0RcTTIKduBGcYSoS5peRd9pS8WPfEQwknE+9CN8zCRXvU02Wi9j1/ItSgr9OXaS
         dAk6y4bybzZMmUuoNeFbkKlvzAYJ19Bwic/tzNyE9tjNOZqLNivwkzy1UDQ6eGq+pM1P
         9u8I3wdSltrQesEek322V4KxNLDC1+nJWQo7kabQtrWs5kHoxc+zvEs8ZhLiGVDCVmTx
         Q/tA==
X-Forwarded-Encrypted: i=1; AKwUvBwXyWnjkUcV750sJ/JZUkzxaldkNslc3bcq2SgAHVdg0iCHwn5hDFyn2kfr4uiPjZz0dw40uf55xebOiw==@lists.linux.dev
X-Gm-Message-State: AFuF++k2hVz5At7O39oLlHhD+t1I96UsKMqNGiyB3p6ewOaoiMbHq3LN
	+20CQ70KK5d8myG3V+rSf54xVo6xgtm/pLy+QbOM3paf+7YjClHrYxxCbHBVBP3yKOMl9bMANCz
	6mg0PGB6h9HUuM+2AODVRFSXnUSPyuzEjhUFwF4m5
X-Gm-Gg: AYBFou0TzIkuPG7GMqYMAcOJ4Lpv0nWVFoGrXS+EuGWo1bVqNsU3z724ow8nI0g29Ig
	6e62wBV9EoY7wIE76ltxMq/EyTFMwZUjMh9rjCFNOolXhYrxFw5Btg6Lfk2hzx9ZhZfZ352yzGR
	gzBJdRb+aEVJuSWH1lQB2rtI1ydB4Zoj7DOYMf2OseGyaiGC17La9HdXQMTt1jaxQglwQaLWnoo
	q0kwCwfCCZLVNPTpA1b2fodjVUa+PevttaSJ0Ud/pIjH4cSG+zcRiyVahVUpOHGVNEg65iOcaeY
	OvGDmqcO1fgG+ibO3I5mN6oZ13gFqskZX9cs6wEBEpOGJm9gKkXH0BT94UBc1hMQ3Es6upiHVv9
	iSLFrTAy8hXI=
X-Received: by 2002:a17:907:971a:b0:c29:5215:b2d8 with SMTP id
 a640c23a62f3a-c2966694db6mr463210766b.14.1789151593253; Fri, 11 Sep 2026
 11:33:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260821050507.2161607-1-shakeel.butt@linux.dev> <20260821050507.2161607-5-shakeel.butt@linux.dev>
In-Reply-To: <20260821050507.2161607-5-shakeel.butt@linux.dev>
From: Sandeep Dhavale <dhavale@google.com>
Date: Fri, 11 Sep 2026 11:33:01 -0700
X-Gm-Features: AcwNN1WDzPUOCqS2ppOsu4mgfPCVT-uVPGILIV5eYTskg-Q1j9_MFgnEnGQqwnI
Message-ID: <CAB=BE-QMyzKT-o=gbhdp3g8JSqQgRiTFzxTX9vEBmCttABrmdw@mail.gmail.com>
Subject: Re: [PATCH 4/4] kernfs: Remove kernfs_rwsem from dentry revalidation
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo <tj@kernel.org>, 
	Christian Brauner <christian@brauner.io>, Meta kernel team <kernel-team@meta.com>, driver-core@lists.linux.dev, 
	cgroups@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Shakeel and Christian,

On Thu, Aug 20, 2026 at 10:05=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.d=
ev> wrote:
>
> kernfs_dop_revalidate() takes kernfs_rwsem for read once per path compone=
nt
> of every walk into a kernfs mount. Linux rwsems do not permit reader lock
> stealing once a writer is queued, so a single writer parks the whole
> incoming reader stream in uninterruptible sleep, stalling cgroup-polling
> daemons for minutes.
>
> Nothing the callback reads requires the semaphore. kn->active is an
> atomic_t that kernfs_find_and_get_node_by_id() already tests through
> __kernfs_active(); kn->__parent and kn->name are RCU pointers whose old
> values are freed only after a grace period; kn->ns is now compared rather
> than dereferenced; parent->dir.rev was annotated earlier in this series.
>
> What the semaphore does provide is a coherent snapshot, and that is not
> needed. ->d_revalidate() answers a question about a single instant, and t=
he
> answer is already stale when it returns: a rename landing just after
> up_read() gives the same outcome as one observed mid-read. A lockless
> reader can only return "valid" for the (parent, name, namespace) triple
> identifying the dentry it was handed, and that triple was true when the
> dentry was instantiated, so it reports a genuine past state exactly as th=
e
> locked version did. Removal is backstopped by kernfs_get_active() failing
> in the subsequent open().
>
> Take an RCU read lock instead. kernfs_parent() and kernfs_rcu_name() work
> unchanged: the condition in their rcu_dereference_check() is an alternati=
ve
> to holding the RCU read lock, not an extra requirement. The negative dent=
ry
> path needs nothing, as @dir pins the parent. The namespace check can use
> @parent directly once the preceding check establishes it equals
> kernfs_parent(kn), so the kn_parent local and its NULL test go away.
>
> kernfs_ns_enabled() reads @parent->flags, which KERNFS_ACTIVATED and
> KERNFS_REMOVING update as a plain read-modify-write under kernfs_rwsem.
> Those bits are not read here and KERNFS_NS cannot change once the directo=
ry
> has children, so mark the read data_race() rather than READ_ONCE(), which
> would not silence KCSAN against the unmarked writers anyway.
>
> kernfs_iop_permission() still forces every walk out of RCU-walk before
> children are revalidated, so lifting the LOOKUP_RCU bail here would have =
no
> observable effect; it is left to the series fixing that path.
>
> Readers walking cgroupfs and sysfs against concurrent cgroup and netdev
> churn: kernfs_rwsem read acquisitions drop from 48,593,360 to 1,280,280,
> and kernfs_dop_revalidate() no longer appears among its contention sites.
>
> Signed-off-by: Shakeel Butt <shakeel.butt@linux.dev>
> ---
>  fs/kernfs/dir.c | 49 ++++++++++++++++++++-----------------------------
>  1 file changed, 20 insertions(+), 29 deletions(-)
>
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index 27949b0e027c..cd7a8ff8b6b2 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -1171,9 +1171,8 @@ struct kernfs_node *kernfs_create_empty_dir(struct =
kernfs_node *parent,
>  static int kernfs_dop_revalidate(struct inode *dir, const struct qstr *n=
ame,
>                                  struct dentry *dentry, unsigned int flag=
s)
>  {
> -       struct kernfs_node *kn, *kn_parent;
>         struct kernfs_node *parent =3D dir->i_private;
> -       struct kernfs_root *root;
> +       struct kernfs_node *kn;
>         const char *kn_name;
>
>         if (flags & LOOKUP_RCU)
> @@ -1191,49 +1190,41 @@ static int kernfs_dop_revalidate(struct inode *di=
r, const struct qstr *name,
>                  * changes and the lookup re-done so that a new positive
>                  * dentry can be properly created.
>                  */
> -               root =3D kernfs_root(parent);
> -               down_read(&root->kernfs_rwsem);
> -               if (kernfs_dir_changed(parent, dentry)) {
> -                       up_read(&root->kernfs_rwsem);
> -                       return 0;
> -               }
> -               up_read(&root->kernfs_rwsem);
> -
> -               /* The kernfs parent node hasn't changed, leave the
> -                * dentry negative and return success.
> -                */
> -               return 1;
> +               return !kernfs_dir_changed(parent, dentry);
>         }
>
>         kn =3D kernfs_dentry_node(dentry);
> -       root =3D kernfs_root(kn);
> -       down_read(&root->kernfs_rwsem);
> +
> +       guard(rcu)();
>
>         /* The kernfs node has been deactivated */
> -       if (!kernfs_active(kn))
> -               goto out_bad;
> +       if (!__kernfs_active(kn))
> +               return 0;
>

I have couple of reports on android kernel based on 6.12 with callstack

[   41.137176][ T5373] pc : kernfs_dop_revalidate+0x28/0x108
[   41.137180][ T5373] lr : path_openat+0x7ec/0x1b04
[   41.137183][ T5373] sp : ffffffc0b02fbba0
[   41.137184][ T5373] x29: ffffffc0b02fbba0 x28: ffffffc0b02fbda4
x27: ffffff8917f90000
[   41.137187][ T5373] x26: 0000000000000030 x25: ffffff8918985860
x24: 0000000000028000
[   41.137189][ T5373] x23: ffffff8918985040 x22: 0000000000000040
x21: 0000000000000000
[   41.137192][ T5373] x20: ffffff8918985040 x19: ffffff894321d000
x18: ffffffdc3adec8c0
[   41.137194][ T5373] x17: 000000004495e485 x16: 000000004495e485
x15: ffffffffff000000
[   41.137197][ T5373] x14: 7d6770f3f4cee991 x13: 0000000000737365
x12: 0000000000737365
[   41.137199][ T5373] x11: ffffff8918985088 x10: 0000000000000018 x9
: 0000000100000000
[   41.137202][ T5373] x8 : ffffff89dc6c3d30 x7 : 705f636f6c6c6100 x6
: 0080808080808080
[   41.137204][ T5373] x5 : ffffffc0b02fbad0 x4 : 0000000000000000 x3
: 0000000000000000
[   41.137207][ T5373] x2 : 0000000000000000 x1 : 0000000000000100 x0
: ffffff8918985040
[   41.137210][ T5373] Call trace:
[   41.137211][ T5373]  kernfs_dop_revalidate+0x28/0x108
[   41.137213][ T5373]  path_openat+0x7ec/0x1b04
[   41.137215][ T5373]  do_filp_open+0xac/0x130
[   41.137216][ T5373]  do_sys_openat2+0x140/0x21c
[   41.137219][ T5373]  __arm64_sys_openat+0x70/0x9c
[   41.137222][ T5373]  invoke_syscall+0x58/0xf0
[   41.137224][ T5373]  do_el0_svc+0x64/0xe0
[   41.137226][ T5373]  el0_svc+0x4c/0xdc
[   41.137228][ T5373]  el0t_64_sync_handler+0x20/0xf4
[   41.137230][ T5373]  el0t_64_sync+0x1bc/0x1c0

After investigation it seems there is race where
kernfs_dop_revalidate() crashed dereferencing kn->__parent in
kernfs_root(kn) at offset 0x8).
Although your patch eliminates kernfs_root(kn), the underlying race
where kn =3D=3D NULL still exists in this patch and will now crash in
__kernfs_active(kn) at offset 0x4.

Scenario seems to be during lockless VFS path lookup (lookup_fast()),
cached dentries are revalidated without holding dentry locks:

  1. lookup_fast() finds a cached positive dentry where dentry->d_inode !=
=3D NULL.
  2. In kernfs_dop_revalidate(), d_really_is_negative(dentry)
evaluates to false, so it skips the negative dentry branch.
  3. Concurrently, slab memory reclaim under memory pressure evicts
unused dentries:
    shrink_node() -> shrink_slab() -> super_cache_scan()
      -> prune_dcache_sb() -> shrink_dentry_list()
        -> dentry_unlink_inode()
             -> __d_clear_type_and_inode(dentry)
                  -> dentry->d_inode =3D NULL;

  4. kernfs_dop_revalidate() now runs:
    kn =3D kernfs_dentry_node(dentry);
  kernfs_dentry_node() tests if (d_really_is_negative(dentry)) return NULL;=
.
  Because dentry->d_inode was cleared to NULL by
dentry_unlink_inode(), kernfs_dentry_node(dentry) returns NULL

While crafting fix for 6.12, I found this series reworking
kernfs_dop_revalidate().
Just to be clear, your series is not introducing the problem.

But perhaps we can improve this with a check like below?

  -    /* The kernfs node has been deactivated */
  -    if (!__kernfs_active(kn))
  +    /* The kernfs node is unlinked or deactivated */
  +    if (!kn || !__kernfs_active(kn))
             return 0;

Let me know your thoughts or if you want a separate patch

Thanks,
Sandeep.
