Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A67633893D
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 22:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771455373; cv=pass; b=shEDSlJZ4AB1BZKiB050Wfh+a8IMPgT2udebDoiFu7tUXRwxhRjLlUT+b6rove5IxRsAvFnLGjDhe6lJ0fwyWT6nWdVS0A+2Ra8CIZHCTfMgwXZyDQrgjYQv9W4MOakWCgd9i9+bjJ8/TDWklKYuPErpZsp7JXBUWbi5SComS6g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771455373; c=relaxed/simple;
	bh=JCFoaESIl/QxCrjmGNPhcuSnGB4Slki2xY4HPtQx/4s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=f6KLqMLOAfyRpg0sIzmsYP0ZzfaZMqyxaduds3u2QuFjM2nLetF8lB4OrICqSlieBRM3Low8qRmsfM59rQu0ZAuGza0TNCRvxGS2UpdYkLoa92BsLcTGfAVpli0eQJHuRsEgM+GbBHMf+sSbIfpj+Fv1fYsD52wOxd0immlspvU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FsA72jLO; arc=pass smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FsA72jLO"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so27065e9.0
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 14:56:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771455370; cv=none;
        d=google.com; s=arc-20240605;
        b=dn4nsqxGP3M0fkWkLqxVmZYgR2c3mW5KaLFS93efY/vbaurQ42GjdZr3gWVuvZ3g63
         tryx5RtXrA9o736CJPE7NPZVSEX1RQQ0B/IPLWXvDTXyR5bOG+PEw4wkvsm9Gsxl5YJ3
         noj9fFjDgcMi4TgeNwtGeNS7PcXJXWWi0kp6BhflMlS6eAlTHMIvD66y+9zNmfZgsyd3
         iRDzePQziEyBcDcZYZyH8ac5B2gOUEYBvMzPTc8F4XUTpYWZxWne12H8JQs0Bb25o6IX
         KDJA4xDDIQr0GP6GNmh8SC4NwRNoynYm2iVv7UAO48aeBB+BUvP+Gw8xt5nYRLaA3n4K
         nk+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ObMI2eFUctqy8D6J4/YNbtZUvjU4iP4F1TUzixbIpBQ=;
        fh=ZMY1QmmnaSTxywj2ErvkUbTjRpb5FfRvdrG5xNvoHpA=;
        b=CR7k1vrdR3sDPDY//4avLoYWdubccXS7pCUETUcOFjtSwSpf6kfLO07xgCserGHk9y
         8BPTgZc38nw5ouqrS2N8Rh1JfW8dW17PlpAl3UPntvgAozNV4xh48SftW4dfL0ejZawP
         dZpPg4gKGUKFr9GS47H1UuD2oAnTlAXOFT5n8bm5fMffUTC1P6JIVaG3uqcQNBO7D/Cw
         iHl50ozZorkYAuL3hCu6+iLElA8VK43WCrSid9CUxZMYN5pMo+GUeu/1rfGDHqUINsHa
         cwaL0qIvSpBmnlQxKS0Kr78Pe6dm8r+G8p1ndAUDjG5FxXhwYGkbMICnerRlYOGZl/DR
         Mlkg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771455370; x=1772060170; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ObMI2eFUctqy8D6J4/YNbtZUvjU4iP4F1TUzixbIpBQ=;
        b=FsA72jLOM8LdLMyOnrcb/112RWnUZlYKYe69iGLwcaRmRXvfpOtt1nsGoSUUV8GoAv
         Y2dElZTaKHEGsCJxbvCfehWY6/DV8SQg5oHLGbubBBJtuMNea2M9hHD/qWrLsfZG2xck
         ZClAxdrCk46BscweAEa3VmdP3wEC0ybkU6UTycJBaf4jrcjtCvqo3AHBFDBKeqnKPw68
         7h2CC96Jyi/jpMhe43h8li3sPpQlFm0nq/PQYUuULHHu10mPeRm+qe70gNGMetl9PPwV
         WbwQ5bPprIm6UGpmlogPmP9iyAOG/IQ+WDi3OqWcWjz+qIz7QUzkrlcmEffoDqrj7ik9
         H8SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771455370; x=1772060170;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ObMI2eFUctqy8D6J4/YNbtZUvjU4iP4F1TUzixbIpBQ=;
        b=ELFV1V7qQZvivZIXjo6EPuczHV1pqxE4lbo02NVzaeRQX91SP5q9pfVMW76XpjGcna
         Sy0JnOrpFTAWGMm1wnjstppDBbwkYD6O3sJytpkfAahfMsRigT4QNGslqRofvbINiv41
         A80+T/66kkch+qtKL0FL5o3lHhp7Gz7DIQz7M4vOI6FmUf6gRXvT6pTWrMbpn+vruLvY
         QZwP3wW16cO9ZoM7K+fElkReoV4wvkDcZGvuCp8l+DZnTx2ShZSyfZZBUnoTV7/7GoFG
         ZafCKvJPCJxhGoOcbyVAEySSKIFedtpHiOdjnRbYtEm2/VdsT3eIq8wjXTGRl1qOI7R4
         HXxw==
X-Forwarded-Encrypted: i=1; AJvYcCUulnH1gTUjZIIb8FFdUdvTEZYsllqpv1UDRCpsLDa98YwzgJMGJLfyFOIltDTTVljP+M9NrdnCRJl0YA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx+VIUxa1xNkkzRx740xrdoE/u1d0yKJzwG7Le4ECXmoGOkWxZs
	YzoIn7kNd55bNEcsojZnJbFukxY1sRCIbVC+Qn+kh1U+ZQ2saFMFk5DIG1Lo+tjp/kpuKnL3wQu
	Z/T5UIIH4LvVIGbzMz7UtM4lJfjB3GTrHh+Jnv9+u
X-Gm-Gg: AZuq6aK1Xws5nW5TWLKg8jGy/Nfw2aVu4FfKTuzRz5Kpgbl4jq5SPLJX2s1KcJKG58w
	6Y48wPB0aCs2qOSGvj7vbYLiErI+71VIddMipkW/vtD1yQJ2mV0HZe2/IWBxPgddqkQHnzZOoSd
	O6W9liJgAFVxh+E0nKLHhd/FvSN5xbbGfKCjMJSgA3FLHRd6UA/Yer5kMMFz41lajCacw/fEabW
	fE9TYYVE5d9YjURVE3bzUXD9VescofD3oxwUIynLvsgJ4snr5EmZwNA0wfVdU3VSRdTtEF7dFZY
	1Tv5MEZ7XpJNbsmNjfizKxFDRGRfv054OsTANMoR2i1MDfk3MzDuLMsBq/r6HDzmF8kXeQvZcze
	mncuO
X-Received: by 2002:a05:600c:b4c:b0:477:2f6f:44db with SMTP id
 5b1f17b1804b1-4839fc2b05cmr17515e9.5.1771455370121; Wed, 18 Feb 2026 14:56:10
 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-4-tjmercier@google.com> <CAOQ4uxh4js=3yk_RxjY5AZmC4kCMVJzbq+4Wnn3mky-_i75QMw@mail.gmail.com>
In-Reply-To: <CAOQ4uxh4js=3yk_RxjY5AZmC4kCMVJzbq+4Wnn3mky-_i75QMw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 14:55:58 -0800
X-Gm-Features: AaiRm50YpaIIErmI92nhYeTavLIal9YPKGY4uR1R97u7wbwoJ0wYYjhpDKRvR7o
Message-ID: <CABdmKX08hFBq3myZqecr1rEYpGMo5xBGJVfB1aNz7t95-8bySQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] selftests: memcg: Add tests IN_DELETE_SELF and
 IN_IGNORED on memory.events
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:31=E2=80=AFAM Amir Goldstein <amir73il@gmail.com=
> wrote:
>
> On Wed, Feb 18, 2026 at 5:22=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > Add two new tests that verify inotify events are sent when memcg files
> > are removed.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Tejun Heo <tj@kernel.org>
>
> Feel free to add:
> Acked-by: Amir Goldstein <amir73il@gmail.com>

Thanks!

> Although...
>
> > ---
> >  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
> >  1 file changed, 122 insertions(+)
> >
> > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/t=
esting/selftests/cgroup/test_memcontrol.c
> > index 4e1647568c5b..2b065d03b730 100644
> > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > @@ -10,6 +10,7 @@
> >  #include <sys/stat.h>
> >  #include <sys/types.h>
> >  #include <unistd.h>
> > +#include <sys/inotify.h>
> >  #include <sys/socket.h>
> >  #include <sys/wait.h>
> >  #include <arpa/inet.h>
> > @@ -1625,6 +1626,125 @@ static int test_memcg_oom_group_score_events(co=
nst char *root)
> >         return ret;
> >  }
> >
> > +static int read_event(int inotify_fd, int expected_event, int expected=
_wd)
> > +{
> > +       struct inotify_event event;
> > +       ssize_t len =3D 0;
> > +
> > +       len =3D read(inotify_fd, &event, sizeof(event));
> > +       if (len < (ssize_t)sizeof(event))
> > +               return -1;
> > +
> > +       if (event.mask !=3D expected_event || event.wd !=3D expected_wd=
) {
> > +               fprintf(stderr,
> > +                       "event does not match expected values: mask %d =
(expected %d) wd %d (expected %d)\n",
> > +                       event.mask, expected_event, event.wd, expected_=
wd);
> > +               return -1;
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static int test_memcg_inotify_delete_file(const char *root)
> > +{
> > +       int ret =3D KSFT_FAIL;
> > +       char *memcg =3D NULL, *child_memcg =3D NULL;
> > +       int fd, wd;
> > +
> > +       memcg =3D cg_name(root, "memcg_test_0");
> > +
> > +       if (!memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(memcg))
> > +               goto cleanup;
> > +
> > +       if (cg_write(memcg, "cgroup.subtree_control", "+memory"))
> > +               goto cleanup;
> > +
> > +       child_memcg =3D cg_name(memcg, "child");
> > +       if (!child_memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(child_memcg))
> > +               goto cleanup;
> > +
> > +       fd =3D inotify_init1(0);
> > +       if (fd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       wd =3D inotify_add_watch(fd, cg_control(child_memcg, "memory.ev=
ents"), IN_DELETE_SELF);
> > +       if (wd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       cg_write(memcg, "cgroup.subtree_control", "-memory");
> > +
> > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > +               goto cleanup;
> > +
> > +       if (read_event(fd, IN_IGNORED, wd))
> > +               goto cleanup;
> > +
> > +       ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +       if (fd >=3D 0)
> > +               close(fd);
> > +       if (child_memcg)
> > +               cg_destroy(child_memcg);
> > +       free(child_memcg);
> > +       if (memcg)
> > +               cg_destroy(memcg);
> > +       free(memcg);
> > +
> > +       return ret;
> > +}
> > +
> > +static int test_memcg_inotify_delete_rmdir(const char *root)
> > +{
> > +       int ret =3D KSFT_FAIL;
> > +       char *memcg =3D NULL;
> > +       int fd, wd;
> > +
> > +       memcg =3D cg_name(root, "memcg_test_0");
> > +
> > +       if (!memcg)
> > +               goto cleanup;
> > +
> > +       if (cg_create(memcg))
> > +               goto cleanup;
> > +
> > +       fd =3D inotify_init1(0);
> > +       if (fd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events")=
, IN_DELETE_SELF);
> > +       if (wd =3D=3D -1)
> > +               goto cleanup;
> > +
> > +       if (cg_destroy(memcg))
> > +               goto cleanup;
> > +       free(memcg);
> > +       memcg =3D NULL;
> > +
> > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > +               goto cleanup;
> > +
> > +       if (read_event(fd, IN_IGNORED, wd))
> > +               goto cleanup;
> > +
> > +       ret =3D KSFT_PASS;
> > +
> > +cleanup:
> > +       if (fd >=3D 0)
> > +               close(fd);
> > +       if (memcg)
> > +               cg_destroy(memcg);
> > +       free(memcg);
> > +
> > +       return ret;
> > +}
> > +
> >  #define T(x) { x, #x }
> >  struct memcg_test {
> >         int (*fn)(const char *root);
> > @@ -1644,6 +1764,8 @@ struct memcg_test {
> >         T(test_memcg_oom_group_leaf_events),
> >         T(test_memcg_oom_group_parent_events),
> >         T(test_memcg_oom_group_score_events),
> > +       T(test_memcg_inotify_delete_file),
> > +       T(test_memcg_inotify_delete_rmdir),
>
> How about another test case:
> - Watch the cgroup directory (not the child file)
> - Destroy cgroup
> - Expect IN_DELETE_SELF | IN_ISDIR
>
> I realize that this test won't pass with your implementation (right?)
> but that is not ok IMO.

Yes, that is correct, but I don't think any docs mention support for
monitoring kernfs directories, only files.

> If we wish to make IN_DELETE_SELF available for kernfs,
> it should not be confined to regular files IMO.

Based on what Honza discovered about i_nlink, it looks like we could
get VFS to send IN_DELETE_SELF for kernfs dirs with something like
this:

@@ -1540,6 +1558,9 @@ static void __kernfs_remove(struct kernfs_node *kn)
                         if (kernfs_type(pos) =3D=3D KERNFS_FILE)
                                kernfs_notify_file_deleted(pos);
+                        else if (kernfs_type(pos) =3D=3D KERNFS_DIR)
+                               kernfs_clear_inode_nlink(pos); <--
calls clear_nlink(inode); for every super

But I don't have a use for it at the moment.
