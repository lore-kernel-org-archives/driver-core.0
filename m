Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C93732D45B
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 17:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771609617; cv=pass; b=oCexmewXVwdCaUHAT4e7XjOykCL2wqq4m/sO/trHls0h38gFQlF9m+nX2anSFSQD06rPLUw8MXsCyYH3RfIOWMpu82TmxtHQKL+R6ZaF1XUzKKiAznK2mJC3OoiY8xXUzPNZAm6Q75pai3OXuO9zgudIBa9eZehdha3M5aYB4Tc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771609617; c=relaxed/simple;
	bh=L4LUtbq/AYJ1ibIci7EI6CXd6uhMJdMr550QxtjyFO8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HUR2UMqy5xTSgK0cuLIgQyxzwWJHUznA8DfiG8G3RpbAItdEBan6/sIA4RyWeoCmvitm+iGbq9sCHfAOQxSJqVJ0jefAA5PFaE6JB48G5gbaumbARVQurkFnWxwICxk3Z8cjvvSymblexy8gnwskiWadOB7OyM4Bps+QyrIhnpw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VigtEPOF; arc=pass smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VigtEPOF"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so1505e9.0
        for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 09:46:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771609614; cv=none;
        d=google.com; s=arc-20240605;
        b=krOzoYGKOAC4ZhCuOCMn8M11Zdz6RTpk/1quFRBAH9Ck88Kz1SiYvoMA1MphqHE/yL
         qWfgi4z/bgUoWvoVRnxbzzEd2g+Gj5M3+zuy4BOtodXsSMmQGAm8eJK/70nU+0tvZ1eE
         C6EXNp1bs/KLzXHhdcuK7IL8854RQQPw5rN5PnzVqem28eXyGAE5DWODmB8wlFmOKqY+
         RwLGuHv+D+dHkffr0GdV6aniO7XFUXDQtDMSmd072GrCdS7cetddag3YDinpR1eCWZmD
         GlyiLbQDcFoFnnieMoC2Ga3HOikX8AvAy+QeWTwXyElPg97t5bOBLOYcywAsOY7W6qkt
         wBRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=TtrPaYzDg2FZ0DurUoi+gNF5T1+mzkiQf2zCfT8eyAI=;
        fh=Xefg7QRwmrHcX/bT29OFqeZORwGmsK5eiY4OaBQEBGE=;
        b=aajo9YZtuHZTIjjP9MvSb1JGYOsp5Z88zAXhZdd0fdqoG4aVdixbX6XrxmECRW2DTy
         ZqNba8Uz4Pchf3uJ+WHr3U6EO1ImXsLaLI62IcQCCU5zvRmUkIdZnH6cwgIR/4HB+SrK
         4iPfBy3/eU2TG0nWqgdVKo9D0kM9S3D1MKi645HepMacNVo0dbO4MD+mJ9Wez2fgCzdd
         uvbHdLPrTYsdiKEn4VHwCtyLP8ETMXQH5i3mBlwy1EjZJFa6F5k91PrSqRjFCQJvuAxh
         ADKKYho2R5YUTcW6Z+yFLHKlpjGjTbfjhciCUY/+N11FnJG0KUu8dkJWRcwhmK2u+Z9h
         MmRQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771609614; x=1772214414; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TtrPaYzDg2FZ0DurUoi+gNF5T1+mzkiQf2zCfT8eyAI=;
        b=VigtEPOFmDXiU2b4NeJpey7+u/NpK35GUdimQribNlS2J1jEVRzFHFMayhtaK4/J2D
         lx7O9HsArBEoYuFjKB0wYLR04Oip6jwLdjdkLsGJAyIFmPhY85q7Zrqd/wir1va1Au/R
         y3Ot3F+ydZrRG97dyC+B54NWlk0JKu4WNxg+FzeSCmf6qEfHICYnB/lRa3rOWl83dCJp
         K+8o99pnquEytTEnJCX0yaGjttSPCPvl/7i6vHSXPJ1W+Jci3baWzmpq05R3cRK1lK6i
         dqvKANma+P84tDJ4p7DZQ29H2qLxk1k82DrALlD+lC+X0/t+wMInUI7k8b4do3Ex6Cvu
         pA9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771609614; x=1772214414;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=TtrPaYzDg2FZ0DurUoi+gNF5T1+mzkiQf2zCfT8eyAI=;
        b=PdxCzI8eJ4Dk6tqMu3IsgbJvYhJ9j7bOrqoXDWVZrqSkodwOuqdyq5svoaGHxTci6l
         iMm5k1T8CEAQUhkTfBo2t9jX1eI2rOeAqFY0wNWRTgQA4YXnO3TM9rgSGoZo+DKygBGH
         NjhJk7ALnnbHpaW6MlrZbYUnJMmwFbN3tPZCM9wrAD/g/Yvb1KbLC1zmEZgvgyZ6Dsh2
         HxqDksvV4i/kmoXmy6wQh3yecYXl+0IYFCsul8BW7v3ydBHghMw3s/CPhgGPER/WHH+p
         ReXFoY7VBcobZzQODgQNhR7zgwq3sI7ANrtuBVieJwg9dJJ0dJHOamxklp16HbxbWG7d
         AnOg==
X-Forwarded-Encrypted: i=1; AJvYcCU2MlCAX5olF4vQrqy20G9LgQvhhn4dAHepeBWlbxleS/iaBc4jqVCqPn8iapXRWBTjHnsadUthkod4MQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy4uN5AEflAF0pWgpUg719u6GcPr/knZxdrBGjQ4KNTsvDVHJdC
	Q2a4bqSNdMqgd13L1jD/HGpX4+a6rr51BKoA4eIYp9AyKjvZgUWK9fyVGhlhPW7MAFQwOw3RhDl
	BqwnJQvZfTaUz0j7aJ0+3Z6tFVus6vVNNnMCe92cJiRudAlHrtlgDuXIHn8XExA==
X-Gm-Gg: AZuq6aJW98sbF3dxUO9rLgbFTBM9kTuyeFEa/ey2BUzTnPCCqLLXLzfuAWUxNp3QsqD
	Bs5ApBOY7dgqNwtczT6r6mZWpXeAsQhi1kHopbaWW7cmnUt+7WEFtgvFC1Nw+xYG4XNs9tRXeGy
	3CtSF2N9yjpv/cUKmt75UWda4WNmqC0rme9LyUGliB5lUu0oj3TUyEcaB2TuHLMs+bPgI3BZgAT
	SIzpomaLbMhghhut8OyGb5ra5UxGkvEtDeF8gvdr76dv9AsFtCz1VBcoNS8rYXel+CPyTQAKzrw
	ZEpsZJUh3jizBhMOBGW0hsDnzbeLmmEfiQ/53w==
X-Received: by 2002:a05:600c:3b24:b0:477:2f6f:44db with SMTP id
 5b1f17b1804b1-483a441ed85mr992395e9.5.1771609613577; Fri, 20 Feb 2026
 09:46:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
 <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
In-Reply-To: <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Feb 2026 09:46:41 -0800
X-Gm-Features: AaiRm51nxtCKSVmNbDDauz1vLZUs5KV1q654jLHNKJz17gEkMqiQHsF23IMGBCk
Message-ID: <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 9:44=E2=80=AFAM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > Add two new tests that verify inotify events are sent when memcg files
> > or directories are removed with rmdir.
> >
> > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > Acked-by: Tejun Heo <tj@kernel.org>
> > Acked-by: Amir Goldstein <amir73il@gmail.com>
> > ---
> >  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
> >  1 file changed, 112 insertions(+)
> >
> > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/t=
esting/selftests/cgroup/test_memcontrol.c
> > index 4e1647568c5b..57726bc82757 100644
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
> > @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_events(co=
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
> > +static int test_memcg_inotify_delete_dir(const char *root)
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
> > +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
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
>
>
> Does this test pass? I expect that listener would get event mask
> IN_DELETE_SELF | IN_ISDIR?

Yes, I tested on 4 different machines across different filesystems and
none of them set IN_ISDIR with IN_DELETE_SELF. The inotify docs say,
"may be set"... I wonder if that is wishful thinking?
