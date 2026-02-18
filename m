Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 772B8303C88
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403468; cv=pass; b=AozSNP3kjSmnLq4qvDQuWz+FTTLtJnb9kcbRw0CSOUOY8B0KhBvRi3lIZ3jeKMpsYuOA4AfmhtkeuxgZcFDF8euvu9amvUnUBg6K6CK748+QujtU7O24augzGVmu7BCzg8RIYlxAOOnmtnjd3Ja1WFQXOY2o6oaFczGY11AsgPQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403468; c=relaxed/simple;
	bh=pOcrR9g/30b877GWLIQEiogDavQ6piFbc5NysJoGEjE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=i1aNYDbHmGv7X+nsKC8P7LI4JBxcPoXhUVGDcHoedXYQxEZIlQBHWt3bbfcNx+oXenfT91TRFbgucFB+ExpVdDkx9nz4N0au9G2Ee0S699mltVjAJy3iikSJD0i280+p1FNACZpVuXt2JMdorLwF21tcZWvzhfaCvMNB9vDYg3g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WWJbT8ys; arc=pass smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WWJbT8ys"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-65b9608a9adso8691614a12.3
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 00:31:06 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771403465; cv=none;
        d=google.com; s=arc-20240605;
        b=XsSuAa+C7fx1gzXCbMP7HfEaZnST2SjW809lkAqduOVrVy/RsLCSgYyKS6fTjCrydF
         5rhslzDP2hEjXcHu3pc727T8T6zBfnmzG/Jcko59iGX9lBX+29X6vLWClzbK4OoytaIL
         TVPl4MWyoO0N+FcLuebx/l0H+RYD+D8/FtES2jYzctx9guzb3pQd5HCPAM7NHANOzGBW
         TkrIGK70moqYltPqLEU7ROybdMhxRjrpUoLxsC9mp+95M4lvrstpn9MppNlLTA5uCI6Z
         fWZXSXKWDBGsq4F2Qmn7TrPeN80u5HXFZzfE+zizAifV4O39vVmMxGoGAcFnMHw3GmAD
         I3jA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Cd+FmpSKeZY657ydPhpXWP28mI30FM0F7sFttu1MBmg=;
        fh=HH1hwKhNljueG8w1wIXZhJinGS9ciQ3wUCb5WrmxTAQ=;
        b=CwwrNZtoR1X914Wxf4C7fWo3+6p+ATrvWXemvQzH56SuFeN6tqFNXLDhokGhJt/wo0
         TvAtIOmtSPX55O8BX4ybnbwxFdUOIUj0cLojUUBLyZjxmdJ6dUV3hR9v96f0P0FVRcgO
         Kd0FkLDoCCxR8kjwDxrxX13XjBzeiRxjt1YgwRk8XmuM530X1tHbWfgGqRePLwxByIEC
         IJMGX698m4Nog0Lt2zUNyhuC5JJUOd4SXluIMukwWLAoyf1QS6oySvUgrCYT6WYc/gNV
         XgFf2P4wuzkBlci7MLfiKFG/59WHfd+c1Roxj/7oI1tYh/pA1X4FpstnSAX616rGRcXh
         /KTQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771403465; x=1772008265; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Cd+FmpSKeZY657ydPhpXWP28mI30FM0F7sFttu1MBmg=;
        b=WWJbT8ysOPeQ/Eydyy4t/sAjvV1uz7EPMFuy0BjJzKiqdG++zWwh4P66vt5kDrbngp
         LetOWF0UpU1QGQa7rUZDgqrj1V89k/YBzedqFJhasmLmu6aENB6E2dxgrysOQ+g98e/L
         kJEOB01WHmtozcws976sZqQh2cJ8Qnckv2w2H1NUTle7M7pEti1IusiuNGVcgYvqc01l
         2amnkvhhsKjfbxzIWnSDzUj1vzCw8sjqm4pW5Z2I53t3cA/lzi/x7mmwX6ApjzCGQQ0L
         Vr6cGw9Cxso9MTpA9WSeoUvmyHd4Xt0kfKK/1s2k7l4WgRSJmNzot5b1QaoaxH6njeum
         CWxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771403465; x=1772008265;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Cd+FmpSKeZY657ydPhpXWP28mI30FM0F7sFttu1MBmg=;
        b=FZHgpo2ruCk50qBjKaivuSCV4RCoIFHY7PY0d4VhPRGidVcBawJO0865SDx48wBSQ7
         2ABdkNxeanfVbgx15tBEczEyV5O4pr6XriDXM9jZ4wyh6BEpZ1YD1eN42kqSWsD8c8Dx
         rSwj82xWUQn87/6/9R98XosQcYg6oaQG9c54gQbwjl9IlgOXqN5NRdMpfasxI6hdIUaI
         BGl4r2aEZti926b0epaEW+QytFTOD8pvjtxEiyHHC/POH0gjy7bvpv3LZWW3UFY+Im7c
         corE4Lzu40ws4IuMm0AMFTdN4D4a8Z+zJQy5yGSDraVNC4ck5J3O4wwpHd5DHaefsnrb
         usBw==
X-Forwarded-Encrypted: i=1; AJvYcCV4lYElNybBJ4CELKue0UHAEWQYaYRHeCZzfTUc3OJdRLvS57PpVScqTEcLZH6a+YSRuZXtlDH3ajhurg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8Xl7pQQB4DPa6lqm2+AYwBIkQ1ZIiiX7jrVZmA0DLi7Ym+lZ2
	VLcrqnBxcmejqoH4PV7RjPMNZgv/tvlTl+0H10rzeV37RS7leMZwjhxBUfOEzUusnQexyD/UTlk
	PkmL77gJdXDY/u4ZanX8jnq+W5xsZpho=
X-Gm-Gg: AZuq6aLHi6TMj032ilnvAJ/MfGXu0+DYZGlbZBtZLqSQxLI1Vzmym9e8KV8UIWQ/Dgh
	g8PE2e2Ag5ZwhgJGFT8XbVRjfoOC8MoZxkUztVKUbFidKowDCRwxqKC+Ho3a9IuMAB8y0gDuZYT
	yjlTfvAL+yqIMod2DY9tMx53k34qQVbREzvAk11xbysUIQ9a3rIkc9kZpXNxxbHEcWRo78ExJ+i
	UN0UpMzlCl03NKEeK+5bVoXX2kKlZ08Nntf1LGSaU/ppMZA7rurhnCtztiwA5liN3uSHISmErKS
	JegHMgaW
X-Received: by 2002:a17:907:c23:b0:b87:3beb:194a with SMTP id
 a640c23a62f3a-b8fc3cb90cfmr783252566b.44.1771403464353; Wed, 18 Feb 2026
 00:31:04 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com> <20260218032232.4049467-3-tjmercier@google.com>
In-Reply-To: <20260218032232.4049467-3-tjmercier@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Feb 2026 09:30:52 +0100
X-Gm-Features: AaiRm52rcAO1uVM86zLcvkOqxQIDflGCfwWsZ-SPyqDCOtD9nqwyY5fQY1S-rmY
Message-ID: <CAOQ4uxjwO6JVy5GKJ6k+Rm4Ey1=TD9=gXMiuB=JvwQSA13iXjA@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 5:22=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Currently some kernfs files (e.g. cgroup.events, memory.events) support
> inotify watches for IN_MODIFY, but unlike with regular filesystems, they
> do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> removed.
>
> This creates a problem for processes monitoring cgroups. For example, a
> service monitoring memory.events for memory.high breaches needs to know
> when a cgroup is removed to clean up its state. Where it's known that a
> cgroup is removed when all processes die, without IN_DELETE_SELF the
> service must resort to inefficient workarounds such as:
> 1.  Periodically scanning procfs to detect process death (wastes CPU and
>     is susceptible to PID reuse).
> 2.  Placing an additional IN_DELETE watch on the parent directory
>     (wastes resources managing double the watches).

This sentence is a red flag for me.
"wastes resources"? What resources are you talking about?
A single inotify watch? That's nothing.
This is not a valid argument IMO.
I fail to see how managing N watches is different than managing 2N watches.
I have no objection to your patch, but we need to keep our arguments honest=
.

> 3.  Holding a pidfd for every monitored cgroup (can exhaust file
>     descriptors).
>
> This patch enables kernfs to send IN_DELETE_SELF and IN_IGNORED events.
> This allows applications to rely on a single existing watch on the file
> of interest (e.g. memory.events) to receive notifications for both
> modifications and the eventual removal of the file, as well as automatic
> watch descriptor cleanup, simplifying userspace logic and improving
> resource efficiency.
>
> Implementation details:
> The kernfs notification worker is updated to handle file deletion.
> The optimized single call for MODIFY events to both the parent and the
> file is retained, however because CREATE (parent) events remain
> unsupported for kernfs files, support for DELETE (parent) events is not

Either drop this story about DELETE or expand it.
inotify does not generate a DELETE event when watching a file,
because DELETE is an event notifying a change of a directory.
If you would have kept your DELETE implementation that would have
broken this rule.

> added here to retain symmetry. Only support for DELETE_SELF events is
> added.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Tejun Heo <tj@kernel.org>
> ---
>  fs/kernfs/dir.c             | 21 +++++++++++++++++
>  fs/kernfs/file.c            | 45 ++++++++++++++++++++-----------------
>  fs/kernfs/kernfs-internal.h |  3 +++
>  3 files changed, 48 insertions(+), 21 deletions(-)
>
> diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> index 29baeeb97871..e5bda829fcb8 100644
> --- a/fs/kernfs/dir.c
> +++ b/fs/kernfs/dir.c
> @@ -9,6 +9,7 @@
>
>  #include <linux/sched.h>
>  #include <linux/fs.h>
> +#include <linux/fsnotify_backend.h>
>  #include <linux/namei.h>
>  #include <linux/idr.h>
>  #include <linux/slab.h>
> @@ -1471,6 +1472,23 @@ void kernfs_show(struct kernfs_node *kn, bool show=
)
>         up_write(&root->kernfs_rwsem);
>  }
>
> +static void kernfs_notify_file_deleted(struct kernfs_node *kn)
> +{
> +       static DECLARE_WORK(kernfs_notify_deleted_work,
> +                           kernfs_notify_workfn);
> +
> +       guard(spinlock_irqsave)(&kernfs_notify_lock);
> +       /* may overwite already pending FS_MODIFY events */

Typo: overwite

> +       kn->attr.notify_event =3D FS_DELETE;

FS_DELETE_SELF

> +
> +       if (!kn->attr.notify_next) {
> +               kernfs_get(kn);
> +               kn->attr.notify_next =3D kernfs_notify_list;
> +               kernfs_notify_list =3D kn;
> +               schedule_work(&kernfs_notify_deleted_work);
> +       }
> +}
> +
>  static void __kernfs_remove(struct kernfs_node *kn)
>  {
>         struct kernfs_node *pos, *parent;
> @@ -1520,6 +1538,9 @@ static void __kernfs_remove(struct kernfs_node *kn)
>                         struct kernfs_iattrs *ps_iattr =3D
>                                 parent ? parent->iattr : NULL;
>
> +                       if (kernfs_type(pos) =3D=3D KERNFS_FILE)
> +                               kernfs_notify_file_deleted(pos);
> +

Why are we not notifying a deleted directory?
If users expect DELETE_SELF on a watched cgroup file
they would definitely expect DELETE_SELF on a watched cgroup dir
when the cgroup is destroyed.

I claim that *this* should be the standard way to monitor
destroyed cgroups.

>                         /* update timestamps on the parent */
>                         down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
>
> diff --git a/fs/kernfs/file.c b/fs/kernfs/file.c
> index e978284ff983..4be9bbe29378 100644
> --- a/fs/kernfs/file.c
> +++ b/fs/kernfs/file.c
> @@ -37,8 +37,8 @@ struct kernfs_open_node {
>   */
>  #define KERNFS_NOTIFY_EOL                      ((void *)&kernfs_notify_l=
ist)
>
> -static DEFINE_SPINLOCK(kernfs_notify_lock);
> -static struct kernfs_node *kernfs_notify_list =3D KERNFS_NOTIFY_EOL;
> +DEFINE_SPINLOCK(kernfs_notify_lock);
> +struct kernfs_node *kernfs_notify_list =3D KERNFS_NOTIFY_EOL;
>
>  static inline struct mutex *kernfs_open_file_mutex_ptr(struct kernfs_nod=
e *kn)
>  {
> @@ -909,7 +909,7 @@ static loff_t kernfs_fop_llseek(struct file *file, lo=
ff_t offset, int whence)
>         return ret;
>  }
>
> -static void kernfs_notify_workfn(struct work_struct *work)
> +void kernfs_notify_workfn(struct work_struct *work)
>  {
>         struct kernfs_node *kn;
>         struct kernfs_super_info *info;
> @@ -935,11 +935,7 @@ static void kernfs_notify_workfn(struct work_struct =
*work)
>         down_read(&root->kernfs_supers_rwsem);
>         down_read(&root->kernfs_rwsem);
>         list_for_each_entry(info, &kernfs_root(kn)->supers, node) {
> -               struct kernfs_node *parent;
> -               struct inode *p_inode =3D NULL;
> -               const char *kn_name;
>                 struct inode *inode;
> -               struct qstr name;
>
>                 /*
>                  * We want fsnotify_modify() on @kn but as the
> @@ -951,24 +947,31 @@ static void kernfs_notify_workfn(struct work_struct=
 *work)
>                 if (!inode)
>                         continue;
>
> -               kn_name =3D kernfs_rcu_name(kn);
> -               name =3D QSTR(kn_name);
> -               parent =3D kernfs_get_parent(kn);
> -               if (parent) {
> -                       p_inode =3D ilookup(info->sb, kernfs_ino(parent))=
;
> -                       if (p_inode) {
> -                               fsnotify(notify_event | FS_EVENT_ON_CHILD=
,
> -                                        inode, FSNOTIFY_EVENT_INODE,
> -                                        p_inode, &name, inode, 0);
> -                               iput(p_inode);
> +               if (notify_event =3D=3D FS_DELETE) {
FS_DELETE_SELF

> +                       fsnotify_inoderemove(inode);
                            iput(inode);
                            continue;
                    }

Avoids all the churn and unneeded extra indentation that follows.

Thanks,
Amir.
