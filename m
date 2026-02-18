Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89D5261B8D
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 08:31:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771403514; cv=pass; b=HIpWm6AW6kvz+u2OCj5UuB6WK6H0O9ZUSCiYQIM+uhjBxddGeggJMXPhpgpRMh9M93ezyhnZykGByfJffMofq7xk9QRFO7uD5Rlo18KaZlhaRdbnWjCIH2JWiKNP+NuUOBeE17aTtbpMylZhH/0c63HHJ2VcfzWyCaHSTxeR+fc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771403514; c=relaxed/simple;
	bh=g34/cXMgvqM8CAz3Jm7hMSLsp37KovcyCljYWpgZMh8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MEVP6P6cHlkJESW75vEYmmQpJcyXpH7tCeCFrAfIAkjXeWl0mX5Mwf3TK45buOE4cSzjt6FfnQYOnIYeRPtVStbpFkrXFki2N+TjoapQrcEqd6aH9NLaWY6TTC2f+rTp6FoRZ9a+/yVhwPF/m0p+LB2p10Hy6yS9QKA/NxILLjM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dqnYYLUm; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dqnYYLUm"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-65a2fea1a1eso1005348a12.0
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 00:31:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771403511; cv=none;
        d=google.com; s=arc-20240605;
        b=elzKdeDAnvXiTDF0ucUYhfbItyEwyA+G0WnxC9UY2lGeHSVdg2oFMwyTFZ+JlJbMou
         qwl7ch1+Izx6Ak+agOv/YpjakDmTiG6Fly5yz85uGFQgHPyqdjgZcv4+/65vfPNliZq0
         hSFKOkb4DlkOW34YonZlZoySXQrjXcRa79uOF/QOrg8NCKK+g0Tvn15FzkJ5zXD2ovDw
         wDBA9OR08fHo+RVsfB3a0bAsJGkxAGDHlxgyR3ZVy/YeUHYTyGiEd5mWVeh+OpALSJQx
         yDPMJMYF4x0ONaMHC2/YiKRDIn8dzxddNiMDEd637EvImaGuJvHPmoUCALWVV8KL4dN3
         72QQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=T3U76qnvucsTLQ+BdD/Esd8/yZzq4QLRxWdPKbrqOpc=;
        fh=MG3JofGNN9wk7p4pNCq3weA9rxPIFAj6/OSOjI2DyLk=;
        b=h074EIiM3csMhq6jAtkzMO/5FC6SPUswR0ABm4jnRVq+jbwQhAGv7H0TV9VITh3D8H
         wD+q+4RxKAKNqcTSpb7U852Ni1tFv3hcQ1OoEM0Zd/hGZYYdJQ5H7fBYfUw53hgWFI4G
         isZ1+XKA1b2pXmKym4gOlrZWaUAlHg0W5aCxNIvFSTQCinQaLEfAKWlvxpcjy+nywvab
         DZzcaeYGY5cGD9I+H7LGCIPfOd0fSzBZq1NOD+OAcADGIW8etfKlQoEDRiQZPnDPwyVS
         W9c//4RF09oz3S7P+sB22lmAgfeH8gDNV3HUwaNo5UqMz8fGcwSqIVqZFh2mDpd6c+el
         dX2A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771403511; x=1772008311; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T3U76qnvucsTLQ+BdD/Esd8/yZzq4QLRxWdPKbrqOpc=;
        b=dqnYYLUmqthaclOGivKttpSdGpXDCR63/5uZpw+N17USGROZKtRt6x+qwXs9apa/S0
         gwYYbhgADSwrpGbZyOOO1JVWEHjuANlTENazYhdwTZSY/Kil8d9i98NJsDciXTn/boGg
         QnT6fr4yvoXpIXRkOdolDsjtatjj/tX4tNbonWUL054+6trATZ0jLDAP34cINGW6Fi2R
         pl7QtKHvtCFbunJh/Ht+xcdyqJr3tCZ2/Y0z+pFcf4d3VJFkoqJB0NpL+XzQfU9dtoM/
         8w6nruOcDUfuKPAd3t1Gz+auTuX0L7yC7ZKFc1hiwN2lXwvZmf/V+9/ZOUuw7U5dt0pn
         SdmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771403511; x=1772008311;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=T3U76qnvucsTLQ+BdD/Esd8/yZzq4QLRxWdPKbrqOpc=;
        b=I7MBlqLPE+RmzXQlvZVoQU/vMKe67QG0VJmxeVPmVLIHGJTT1pPnR0kb9cfPhdWCyB
         902uNN1lQIuVgAGcAdskFCP7ZLmApJo0T9ACtKX9aW9SCW5ZAnATJ+5kIsbQL/GTuDEY
         r6ArgEdC84mDKc8v8rmVrPkFUjJQcCJyd3pAVGVobATAytjEEW7lpHfEJ8lNc6z2qFLu
         8tEEp4ZBdEN+jeg9mTQ937z7tMumN5e4/jh0/vzkGtoEyHEL+xbR6VUkrrSlzEr4xtK4
         ZSh7kXJijRozlyMsYfC9mFmsnlrByHipimpBQI6nmrlnKSsSdpo8n1945pfz+NxPECPa
         ZfaA==
X-Forwarded-Encrypted: i=1; AJvYcCWIQd/wM8UkC4zAhsnnJ998Vl3xcZWpDE3aOkGYMpbGGX6b8Qo779bBexr0MNEM5vzK6ppKN9p7OIG21g==@lists.linux.dev
X-Gm-Message-State: AOJu0YzcM5FhkB6vRxZZTlzdZ+geqN4+NmHigbVBULph8nYnEi2qQqdc
	gDJ4gAmOMiRotZanT4JTtQuDlRsTAoMXHHqmLxFz+xnJoZTGzrOjeMe3RgOFSodwMxUEO+kJHzR
	aPCBoKIwqLsnYhHtVMn+qfuKtCSfpV0Q=
X-Gm-Gg: AZuq6aJKJnyDhYJpHs+KitIMh7YgLhWR+6Kb2zdH0CZC4l+1K8oQlETQDaCG2u2lr/g
	cazUNtqjhCQPl+AXu1kSzChopwl2pdMmSd3veDDSdbzKyl6hDMT8WV21xk1ZXqPbQupzuvy0dMV
	ONkSKKUbrQZS9eyV7gCnPT5MH4FU6RFKlbS83yYMBH8UU7EJVlk5mUaqXLvk8wAyO/fAq3K8SeC
	LBJAklc2PxOqsbEKDL05yrD+JQq+3RLHM0gWRzgh4quZiRrfOKWmYRun/kmLGeptFPrBGxNCWrX
	sV+9YBw7
X-Received: by 2002:a05:6402:1141:b0:65a:4207:fbf0 with SMTP id
 4fb4d7f45d1cf-65c7720cc7bmr375715a12.15.1771403510892; Wed, 18 Feb 2026
 00:31:50 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com> <20260218032232.4049467-4-tjmercier@google.com>
In-Reply-To: <20260218032232.4049467-4-tjmercier@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Feb 2026 09:31:39 +0100
X-Gm-Features: AaiRm53vob00Ykj2SozMaQzwl7X3rV4VFQLdOBL-uAsZ0fNoE8t3B9B1XVNGy1c
Message-ID: <CAOQ4uxh4js=3yk_RxjY5AZmC4kCMVJzbq+4Wnn3mky-_i75QMw@mail.gmail.com>
Subject: Re: [PATCH v3 3/3] selftests: memcg: Add tests IN_DELETE_SELF and
 IN_IGNORED on memory.events
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
> Add two new tests that verify inotify events are sent when memcg files
> are removed.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Tejun Heo <tj@kernel.org>

Feel free to add:
Acked-by: Amir Goldstein <amir73il@gmail.com>

Although...

> ---
>  .../selftests/cgroup/test_memcontrol.c        | 122 ++++++++++++++++++
>  1 file changed, 122 insertions(+)
>
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/tes=
ting/selftests/cgroup/test_memcontrol.c
> index 4e1647568c5b..2b065d03b730 100644
> --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> @@ -10,6 +10,7 @@
>  #include <sys/stat.h>
>  #include <sys/types.h>
>  #include <unistd.h>
> +#include <sys/inotify.h>
>  #include <sys/socket.h>
>  #include <sys/wait.h>
>  #include <arpa/inet.h>
> @@ -1625,6 +1626,125 @@ static int test_memcg_oom_group_score_events(cons=
t char *root)
>         return ret;
>  }
>
> +static int read_event(int inotify_fd, int expected_event, int expected_w=
d)
> +{
> +       struct inotify_event event;
> +       ssize_t len =3D 0;
> +
> +       len =3D read(inotify_fd, &event, sizeof(event));
> +       if (len < (ssize_t)sizeof(event))
> +               return -1;
> +
> +       if (event.mask !=3D expected_event || event.wd !=3D expected_wd) =
{
> +               fprintf(stderr,
> +                       "event does not match expected values: mask %d (e=
xpected %d) wd %d (expected %d)\n",
> +                       event.mask, expected_event, event.wd, expected_wd=
);
> +               return -1;
> +       }
> +
> +       return 0;
> +}
> +
> +static int test_memcg_inotify_delete_file(const char *root)
> +{
> +       int ret =3D KSFT_FAIL;
> +       char *memcg =3D NULL, *child_memcg =3D NULL;
> +       int fd, wd;
> +
> +       memcg =3D cg_name(root, "memcg_test_0");
> +
> +       if (!memcg)
> +               goto cleanup;
> +
> +       if (cg_create(memcg))
> +               goto cleanup;
> +
> +       if (cg_write(memcg, "cgroup.subtree_control", "+memory"))
> +               goto cleanup;
> +
> +       child_memcg =3D cg_name(memcg, "child");
> +       if (!child_memcg)
> +               goto cleanup;
> +
> +       if (cg_create(child_memcg))
> +               goto cleanup;
> +
> +       fd =3D inotify_init1(0);
> +       if (fd =3D=3D -1)
> +               goto cleanup;
> +
> +       wd =3D inotify_add_watch(fd, cg_control(child_memcg, "memory.even=
ts"), IN_DELETE_SELF);
> +       if (wd =3D=3D -1)
> +               goto cleanup;
> +
> +       cg_write(memcg, "cgroup.subtree_control", "-memory");
> +
> +       if (read_event(fd, IN_DELETE_SELF, wd))
> +               goto cleanup;
> +
> +       if (read_event(fd, IN_IGNORED, wd))
> +               goto cleanup;
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (fd >=3D 0)
> +               close(fd);
> +       if (child_memcg)
> +               cg_destroy(child_memcg);
> +       free(child_memcg);
> +       if (memcg)
> +               cg_destroy(memcg);
> +       free(memcg);
> +
> +       return ret;
> +}
> +
> +static int test_memcg_inotify_delete_rmdir(const char *root)
> +{
> +       int ret =3D KSFT_FAIL;
> +       char *memcg =3D NULL;
> +       int fd, wd;
> +
> +       memcg =3D cg_name(root, "memcg_test_0");
> +
> +       if (!memcg)
> +               goto cleanup;
> +
> +       if (cg_create(memcg))
> +               goto cleanup;
> +
> +       fd =3D inotify_init1(0);
> +       if (fd =3D=3D -1)
> +               goto cleanup;
> +
> +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events"), =
IN_DELETE_SELF);
> +       if (wd =3D=3D -1)
> +               goto cleanup;
> +
> +       if (cg_destroy(memcg))
> +               goto cleanup;
> +       free(memcg);
> +       memcg =3D NULL;
> +
> +       if (read_event(fd, IN_DELETE_SELF, wd))
> +               goto cleanup;
> +
> +       if (read_event(fd, IN_IGNORED, wd))
> +               goto cleanup;
> +
> +       ret =3D KSFT_PASS;
> +
> +cleanup:
> +       if (fd >=3D 0)
> +               close(fd);
> +       if (memcg)
> +               cg_destroy(memcg);
> +       free(memcg);
> +
> +       return ret;
> +}
> +
>  #define T(x) { x, #x }
>  struct memcg_test {
>         int (*fn)(const char *root);
> @@ -1644,6 +1764,8 @@ struct memcg_test {
>         T(test_memcg_oom_group_leaf_events),
>         T(test_memcg_oom_group_parent_events),
>         T(test_memcg_oom_group_score_events),
> +       T(test_memcg_inotify_delete_file),
> +       T(test_memcg_inotify_delete_rmdir),

How about another test case:
- Watch the cgroup directory (not the child file)
- Destroy cgroup
- Expect IN_DELETE_SELF | IN_ISDIR

I realize that this test won't pass with your implementation (right?)
but that is not ok IMO.

If we wish to make IN_DELETE_SELF available for kernfs,
it should not be confined to regular files IMO.

Thanks,
Amir.
