Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 90B1D28314E
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 18:01:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771610502; cv=pass; b=FdwmgOkZsBCXA2ng2/M0Rf10nKMXn1aiC4xdkYLzK8FIC36T6wJ60LCUMSt+YwjVh0En4jHdB/gTVwKL3Wjm9rWluCBfwN5RI19tUEwi0ooDOBr3827emFemdz2f3ED4saZ5sBpG8+3Ozi5AHzXZmO1870iyPI3VsYyp47D4jWI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771610502; c=relaxed/simple;
	bh=/ExTJNGlpE5IqT17n1+JjF2Vry3iY2HGRkuHp4SOpO0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A/TsiOXHbmYzI8yF4JeAyl7RjfvHOLNqiR0J3J4lLsfXNccoVnkZH73uGjY1ZQ3ozqLHXy5y+8TTYXAUkJ8UYaw0KmB65paiZE/xCgZcRWoJWL30voLpjUwuXahp6e7TLP6EUN0FNLo2jpX65zm2p2xaJ1lrdYjkRPcUGQETI8k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RhH+RnhK; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RhH+RnhK"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-65a380b554bso4489336a12.2
        for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 10:01:41 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771610500; cv=none;
        d=google.com; s=arc-20240605;
        b=XOlyyh+POZNdWZKgBrvh/zGSY/nZlkO6X9Jv/UffCVjMlOUSQv88/02fBe7v6VYvZJ
         dNONOeXGaqWzaq/L6NsVL82zYGPR5yVZdiaDoGd5TJB4DcHtn4AaTqSaKS81pkpxUWut
         W42cBn5GNgDJfiPnT8U9qH7QBlIhmmrU8Ib5xTsw4yfbvDykDhxoqUBYdTCOvnC+OcpF
         SGwyjUXNbbYCULbvGXn0h82yBVFZUkWQPVmx4QfpTpTfUJW/WQBsBO9pNG2Q380l+MRm
         zs/jQwzvblTZPGjB+1D3Gud9AbL+HTHkCca3ZWyoBIejXAztDER4sl4CH+p9TouYT9hJ
         BPmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mXWsRVT7W81X5HarW7ujq+K0yQZiRQ3sefS+9HVuiEs=;
        fh=rJJqRe+zZRIfHBDqMYAjuJyVUkkKGg2boGL+a+7EvDs=;
        b=Yfv/nayEmrWjzoYNCFiAZqAr/DcP8n06i4mtO2QhZ9/beAO3HNJ3d+MjZm5VIZVMKr
         vATHWtW4A6K29GBA8edqyGv6oD7OjahauvkX+AmSyev/R4Rpg8tmn515KfdBI0duCg/y
         g8PTiilrwXaRZ19FNFEhqZyRLM4Q/Rd7WlQR0OBV8A1G4H6kSZc0vHB8kB7rgezMztgQ
         Ov87zpOdOEXL0uyIy31vrAv4tNgy4OLOZkDreBhLBuq5sZePekrUVvH3ujbhHJGjV4z9
         K5cXq84MJxkAqhSZ69XvgAchHdWYC5djKMP0kQlGYvbnUjSE0t98zT9XaxLjJSTDUqLR
         p3FQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771610500; x=1772215300; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mXWsRVT7W81X5HarW7ujq+K0yQZiRQ3sefS+9HVuiEs=;
        b=RhH+RnhKw+CasvLmerVGd8dCBkT+rer4iqUAk2vQTSxIe/gixb62YBCVpkyluQCjkU
         7T3qxBvjFigspIK07V05uCkLkQZo8p6Gb5pcnTj2j+6hZwsw8ltKR2X/I19LZ/+1jFFL
         NdXvISMvLBXmLcwRx5K8DF0xgKnF5ahogn4p6fjDIuW5AM6zPxlilHkrZyDkOFkvk2FV
         cOPpg+SCzDrS8i+SvW3AzTp7bYXguRCHg/YD9B3DF4bybgLRfRTot1w/41y9uIII1sOU
         endXYlr9CPXddkQ3U4spGpOLUbCz7YHqZMb2FwfFbNfSzvg65zywEWCJgXk8E+5I2l3k
         zgjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771610500; x=1772215300;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mXWsRVT7W81X5HarW7ujq+K0yQZiRQ3sefS+9HVuiEs=;
        b=ji3Spl5nWDT/T274bK2fr5xggYUMgMhMRth4BNvO9wQ+x1q3xHeCGs2R+y4xX0SkHx
         VwV0X0PobIL+i8vsClVhBg7cliwksglVMH8lu0r/4T8yrXwQj6KJ6HF2aA7T28P8UQJ/
         FK4sIw2Mv9No7boqpz+MiVtqRfpCYpgVJMotbFZXhq8F3ck4dhvJoL7QyG5ym5GVk0Qf
         qT6oGs/NW+jHcOckpYYl6lM9oF3KCa0hOAv25QGq0z+zJE1J+GV49DBQVCQWqRMsxmWL
         cccVTmC6d8cwmx5qUomJYDU8cyebfKD1U3kR57ki21Q/5xEqrI1yyqzI9jrm7YLrUi/K
         Q2GA==
X-Forwarded-Encrypted: i=1; AJvYcCUL5FIGp+pNRNeWzR1mMX9wyEG5KHAknYujsnTbqjLtf27Hy/rQGB/7zGZd608T07nr5fhQfFJNYbp5fw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyN2E8ZysyMSy2wXhCMmGMyt4PRxAec+3R0yd23cFhPtTbl8rU5
	vlyf5nmiYqSIutyNM3FzeifmPha5U/nXfdo93UlbYZzG0AbYGbBmB1b8/Dir0DshcCkFs+GSgJI
	W66jhoox64rks02N1IEaZD9hdRVfCMCs=
X-Gm-Gg: AZuq6aIGy+M8kgJCxdPCikuXUJh/7qxn4sOpynGCXGPjzggjnzKfICj3aRASY5hR3DF
	M0zZFER153nk79doQIMz9DgJGitoxSw8Cn2bCRcWeLWdpjzQnforSLP5Jyzz6gMBS8v+wHSrji0
	8w2xzVskey9ueMxISLsSDyYkDzyyc0jXrm2iKrm7NaY3KZw9Zl2WKG5pWAsHgk5N43RiN3anaA2
	ot7k3+cbvNuk9L3A8s9uXsBKxJ7a3I7FK7xV38IrwuldgnN4gs/80fUH3slDFpDxNBk2Ml/7zuu
	LNSH3NFcbPYDImrrrInX4bR+T1J2fW8AY700g6VaMw==
X-Received: by 2002:a17:907:1c89:b0:b88:5182:b869 with SMTP id
 a640c23a62f3a-b9081a490f8mr28173866b.23.1771610499642; Fri, 20 Feb 2026
 10:01:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
 <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
 <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com> <CABdmKX0H5Bx7qsk7JmOEnA2NZBHXd+QSYuwXHQGvaN6ppM38NA@mail.gmail.com>
In-Reply-To: <CABdmKX0H5Bx7qsk7JmOEnA2NZBHXd+QSYuwXHQGvaN6ppM38NA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 20:01:28 +0200
X-Gm-Features: AaiRm5108EmSEAIlvJnftlLPzXZCKopsIxjc3etyrxL3lbPc5X0FWzsfY5M1N74
Message-ID: <CAOQ4uxi8-nc2+b5kjZshaDdfhmt994zUDqJ32B5b+600_Ep48A@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 6:53=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Fri, Feb 20, 2026 at 9:46=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Fri, Feb 20, 2026 at 9:44=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@googl=
e.com> wrote:
> > > >
> > > > Add two new tests that verify inotify events are sent when memcg fi=
les
> > > > or directories are removed with rmdir.
> > > >
> > > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > > Acked-by: Tejun Heo <tj@kernel.org>
> > > > Acked-by: Amir Goldstein <amir73il@gmail.com>
> > > > ---
> > > >  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++=
++++
> > > >  1 file changed, 112 insertions(+)
> > > >
> > > > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/too=
ls/testing/selftests/cgroup/test_memcontrol.c
> > > > index 4e1647568c5b..57726bc82757 100644
> > > > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > > > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > > > @@ -10,6 +10,7 @@
> > > >  #include <sys/stat.h>
> > > >  #include <sys/types.h>
> > > >  #include <unistd.h>
> > > > +#include <sys/inotify.h>
> > > >  #include <sys/socket.h>
> > > >  #include <sys/wait.h>
> > > >  #include <arpa/inet.h>
> > > > @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_event=
s(const char *root)
> > > >         return ret;
> > > >  }
> > > >
> > > > +static int read_event(int inotify_fd, int expected_event, int expe=
cted_wd)
> > > > +{
> > > > +       struct inotify_event event;
> > > > +       ssize_t len =3D 0;
> > > > +
> > > > +       len =3D read(inotify_fd, &event, sizeof(event));
> > > > +       if (len < (ssize_t)sizeof(event))
> > > > +               return -1;
> > > > +
> > > > +       if (event.mask !=3D expected_event || event.wd !=3D expecte=
d_wd) {
> > > > +               fprintf(stderr,
> > > > +                       "event does not match expected values: mask=
 %d (expected %d) wd %d (expected %d)\n",
> > > > +                       event.mask, expected_event, event.wd, expec=
ted_wd);
> > > > +               return -1;
> > > > +       }
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > > +static int test_memcg_inotify_delete_file(const char *root)
> > > > +{
> > > > +       int ret =3D KSFT_FAIL;
> > > > +       char *memcg =3D NULL;
> > > > +       int fd, wd;
> > > > +
> > > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > > +
> > > > +       if (!memcg)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_create(memcg))
> > > > +               goto cleanup;
> > > > +
> > > > +       fd =3D inotify_init1(0);
> > > > +       if (fd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.even=
ts"), IN_DELETE_SELF);
> > > > +       if (wd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_destroy(memcg))
> > > > +               goto cleanup;
> > > > +       free(memcg);
> > > > +       memcg =3D NULL;
> > > > +
> > > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > > +               goto cleanup;
> > > > +
> > > > +       if (read_event(fd, IN_IGNORED, wd))
> > > > +               goto cleanup;
> > > > +
> > > > +       ret =3D KSFT_PASS;
> > > > +
> > > > +cleanup:
> > > > +       if (fd >=3D 0)
> > > > +               close(fd);
> > > > +       if (memcg)
> > > > +               cg_destroy(memcg);
> > > > +       free(memcg);
> > > > +
> > > > +       return ret;
> > > > +}
> > > > +
> > > > +static int test_memcg_inotify_delete_dir(const char *root)
> > > > +{
> > > > +       int ret =3D KSFT_FAIL;
> > > > +       char *memcg =3D NULL;
> > > > +       int fd, wd;
> > > > +
> > > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > > +
> > > > +       if (!memcg)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_create(memcg))
> > > > +               goto cleanup;
> > > > +
> > > > +       fd =3D inotify_init1(0);
> > > > +       if (fd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
> > > > +       if (wd =3D=3D -1)
> > > > +               goto cleanup;
> > > > +
> > > > +       if (cg_destroy(memcg))
> > > > +               goto cleanup;
> > > > +       free(memcg);
> > > > +       memcg =3D NULL;
> > > > +
> > > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > > +               goto cleanup;
> > >
> > >
> > > Does this test pass? I expect that listener would get event mask
> > > IN_DELETE_SELF | IN_ISDIR?
> >
> > Yes, I tested on 4 different machines across different filesystems and
> > none of them set IN_ISDIR with IN_DELETE_SELF. The inotify docs say,
> > "may be set"... I wonder if that is wishful thinking?
>
> Oh, very intentional:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/f=
s/notify/inotify/inotify_fsnotify.c?h=3Dv6.19#n109

LOL yeh ok :)

Thanks for checking

Amir.
