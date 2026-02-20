Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99921365A13
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 17:53:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771610014; cv=pass; b=b18kp8pcXHStzTTTgA9nRIx6YsIvDUasmDQwFjpEbwbfkfLWNCcsXu34kpqQnmH1jGJ8mncsceMun+ZteYiDPp7EuYEf+rscfbCz3aDL3Yfe7TVNjOfli3DzKLUcN85t3O8e86xg5+C5Rjpw7zGP2Pq+4cfvmmdgdQBzdKHvWmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771610014; c=relaxed/simple;
	bh=6mvexzEJMyqKObc2kptqIRTofWhm/82iwmnJl33CcXM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uzJshDmxj4bl+45x/FmtoZuXmMrJzRrTewYJ2Og0uF/K9si0WKKRMdQbQbQSqfCDLpvaJgHYzklMhcsEZMykme/0MrO92DVbFa7pRWAqE2OWlfT38+AqH4W5apZvp4bOMlMzwjNsqtMVvBun8EGKCIjoirs8go4qpbOBKp4vwGc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jQxsErCT; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jQxsErCT"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4806b0963a9so2505e9.0
        for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 09:53:32 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771610011; cv=none;
        d=google.com; s=arc-20240605;
        b=K15mcMubhaStllB7/ScXP7/CpiXSrC/xTLGVqOfRTwPWSEcX2CNYOl1X0h5A09uoXe
         Ncod/wiFB7asfTfjR7aIeCLAtU0AJXzWAy3XEcGMr/QXzYjCgak/LFqFkf3FbMm20cnW
         8gCOsayDwviv1ECjOCB/zNOEpO56lf9QDQXOaqTvktYrAwAxjuLEBLtNJs/wfTD5j2w9
         icwiHn6Q0eNEhSHBzCoA3Ezy+xhZ54p3/G99heH+9E+YBQet9F+KwvQd1IekiEWgOTaY
         m1jE16E+NhzjwhJlZ7pc4WN/c4pvcRazLaBCmkmiZI6QlbQjCcuteb3yNG2dvvtpTON7
         5qog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zJXYxrDbswnHka6Gtr3ub6RBkdkqHTgw9iEO6yYMyQA=;
        fh=KYqlEH9GeBNBBhprPFtNka1PLxusA5GC6Yf6I7tAozs=;
        b=JqZk7oHviOqJHEfLNxmuS3k2NEeUrrLcmqkJlJ9ttRRUUC80vNXgskm8ChpEF5tHgp
         FoEkA6islEESF9PZf3X0DW5nq7YFJJ3yGguVpIH2QnlC97qIIKqRbQgWhK/sZBTQrNl1
         iZkBDO0zLcKza9dOMXb8jrsL3phRVI8r88usqKyWWNeNneJeXpRQ/b2kYoGUgLtvxI8t
         JLXw8ewVwio7FaEntYFEn9pDtg+UIi5cd5KcFqu/j8cTsywZ7t+D4XYx19yff3ZWa2Px
         x0i/LOxIrby1EbNhMEln/Zq7AMaYQWzW30/WVTFyomB+Dmh5eGvPWPkvJXh7rOm3Z2Qy
         YGHQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771610011; x=1772214811; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zJXYxrDbswnHka6Gtr3ub6RBkdkqHTgw9iEO6yYMyQA=;
        b=jQxsErCTkHD+QSTd3nXWQR4FqSkz9PruLa8Di7egqJ8gCbr0NQf/TuG9zEYaOPjinh
         dJvf/7wlY6BOlUXDZeW9KajIFFj8rtLoW2yAiPME4hyfrWyymAkDItHJvBPSFzPY8ovm
         utzFmODFj8pKNPwqVHwCWCPMH/bl3mb5PIOOVgOv3tKo9QACfR8C7XiJcbmMcK5/5j5u
         cBGMhd50idiZP0WD1Rj4wUsSLPIxG8utAWcytSTkQUrgJ9kduJpRg2h2YbY5gfvBi4Aw
         Y5hHT8jxIEtunOPV1yRZ5zpUcV/vInSxjO4o/KUe+cdXSglRjaHWuuAtLG/t+Td6aG7N
         AHpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771610011; x=1772214811;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zJXYxrDbswnHka6Gtr3ub6RBkdkqHTgw9iEO6yYMyQA=;
        b=n1dna2Po0JnhjnXkol9YSsfPln5LIobx/3axAAwaXbxcvzzemqHCZ2M7xf9DqOrZeg
         S2AGDrbzgzhMythFViZTF7+XGKYfXW+7VEQqfektLvGWKUi3JeQpOI9AbbNvZ/EU0Ukx
         xU6RrsDrquv8OiOpR645kGuFGWTC8QPVDj6XWA/TEwXYr5k5c6O7mcFLsoegt5oglZhj
         FNNhI0PkvVyQ/fz2pc8lROBNB5x8oy+pbMkbOr6Dr3n4CBX0nKq0GWKedQ59AKWoVhm2
         byfPap7BnwzPWRnF9RhQjMdNHzh3Dcv7JUNYmt5Oh5kK7gEiPXTfQYmjoyiewAJdE25K
         61wQ==
X-Forwarded-Encrypted: i=1; AJvYcCWy8g0nW9P/7tpWoWALGF8BvZDK0Fs1jM4z71IQjCh0K7qIqF/rc3gBmkHBlVq3MUOrE8qI0bS3dZA3OQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwyIzCCX4bYQ+WBF2aJ4nqKSszijbN9xkrCCN5lfOvWw0aymgVs
	zFWkWR9G/iOum83dt/kKuSqpgjqLpaYoDYNgr11bWkh12q/dg9nkKa6FJJKiUP+mbLjVvOYYNIf
	z9/hfFlrHcrFr/ey+2yuPaH7rq5a/8+IIThmBV4+A
X-Gm-Gg: AZuq6aL+6J2DG9wkGNGmjF+h45X32NjwXR4VbtSqI0v5IEmIjY7v88MnJS8fA1TI1kO
	xBPWBQGi1cfvg5P7X5ymgoI4kPq6mD5Ugeex3tCoT4r/c1KgCcJaLdVaUi/U9np8oTOXIpB6Xac
	bBH0SEhRRqZjd9RpLi39VrtOt81evM/7ALZX7MCj5FNKnoRfoiT8tlKJglVy2iFMT5TjMnJm2se
	nQMkYJgUDw3s1MuDj4VydAiUcGuBDUervDXIYKfiZkLBL5ad1HQn4RW68hCl5tqRTZoR9hvLYUn
	4VqigYDos7rgr5aH6DsdsIkK/VdkixaKNHFa5g==
X-Received: by 2002:a05:600c:5916:b0:47d:7428:d00c with SMTP id
 5b1f17b1804b1-483a4426fcfmr611355e9.17.1771610010645; Fri, 20 Feb 2026
 09:53:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
 <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com> <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com>
In-Reply-To: <CABdmKX3Pd8sJpzuQD0tfKCznOy3=cDoAOEnN-COQa59weUFrqw@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Feb 2026 09:53:18 -0800
X-Gm-Features: AaiRm523izsi0NGn8Sj7ziPjsd_zQLpE-spc-8PJpygVLLpqc8KPVf5Y_qsAi4o
Message-ID: <CABdmKX0H5Bx7qsk7JmOEnA2NZBHXd+QSYuwXHQGvaN6ppM38NA@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 9:46=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Fri, Feb 20, 2026 at 9:44=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > Add two new tests that verify inotify events are sent when memcg file=
s
> > > or directories are removed with rmdir.
> > >
> > > Signed-off-by: T.J. Mercier <tjmercier@google.com>
> > > Acked-by: Tejun Heo <tj@kernel.org>
> > > Acked-by: Amir Goldstein <amir73il@gmail.com>
> > > ---
> > >  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++=
++
> > >  1 file changed, 112 insertions(+)
> > >
> > > diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools=
/testing/selftests/cgroup/test_memcontrol.c
> > > index 4e1647568c5b..57726bc82757 100644
> > > --- a/tools/testing/selftests/cgroup/test_memcontrol.c
> > > +++ b/tools/testing/selftests/cgroup/test_memcontrol.c
> > > @@ -10,6 +10,7 @@
> > >  #include <sys/stat.h>
> > >  #include <sys/types.h>
> > >  #include <unistd.h>
> > > +#include <sys/inotify.h>
> > >  #include <sys/socket.h>
> > >  #include <sys/wait.h>
> > >  #include <arpa/inet.h>
> > > @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_events(=
const char *root)
> > >         return ret;
> > >  }
> > >
> > > +static int read_event(int inotify_fd, int expected_event, int expect=
ed_wd)
> > > +{
> > > +       struct inotify_event event;
> > > +       ssize_t len =3D 0;
> > > +
> > > +       len =3D read(inotify_fd, &event, sizeof(event));
> > > +       if (len < (ssize_t)sizeof(event))
> > > +               return -1;
> > > +
> > > +       if (event.mask !=3D expected_event || event.wd !=3D expected_=
wd) {
> > > +               fprintf(stderr,
> > > +                       "event does not match expected values: mask %=
d (expected %d) wd %d (expected %d)\n",
> > > +                       event.mask, expected_event, event.wd, expecte=
d_wd);
> > > +               return -1;
> > > +       }
> > > +
> > > +       return 0;
> > > +}
> > > +
> > > +static int test_memcg_inotify_delete_file(const char *root)
> > > +{
> > > +       int ret =3D KSFT_FAIL;
> > > +       char *memcg =3D NULL;
> > > +       int fd, wd;
> > > +
> > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > +
> > > +       if (!memcg)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_create(memcg))
> > > +               goto cleanup;
> > > +
> > > +       fd =3D inotify_init1(0);
> > > +       if (fd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       wd =3D inotify_add_watch(fd, cg_control(memcg, "memory.events=
"), IN_DELETE_SELF);
> > > +       if (wd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_destroy(memcg))
> > > +               goto cleanup;
> > > +       free(memcg);
> > > +       memcg =3D NULL;
> > > +
> > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > +               goto cleanup;
> > > +
> > > +       if (read_event(fd, IN_IGNORED, wd))
> > > +               goto cleanup;
> > > +
> > > +       ret =3D KSFT_PASS;
> > > +
> > > +cleanup:
> > > +       if (fd >=3D 0)
> > > +               close(fd);
> > > +       if (memcg)
> > > +               cg_destroy(memcg);
> > > +       free(memcg);
> > > +
> > > +       return ret;
> > > +}
> > > +
> > > +static int test_memcg_inotify_delete_dir(const char *root)
> > > +{
> > > +       int ret =3D KSFT_FAIL;
> > > +       char *memcg =3D NULL;
> > > +       int fd, wd;
> > > +
> > > +       memcg =3D cg_name(root, "memcg_test_0");
> > > +
> > > +       if (!memcg)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_create(memcg))
> > > +               goto cleanup;
> > > +
> > > +       fd =3D inotify_init1(0);
> > > +       if (fd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
> > > +       if (wd =3D=3D -1)
> > > +               goto cleanup;
> > > +
> > > +       if (cg_destroy(memcg))
> > > +               goto cleanup;
> > > +       free(memcg);
> > > +       memcg =3D NULL;
> > > +
> > > +       if (read_event(fd, IN_DELETE_SELF, wd))
> > > +               goto cleanup;
> >
> >
> > Does this test pass? I expect that listener would get event mask
> > IN_DELETE_SELF | IN_ISDIR?
>
> Yes, I tested on 4 different machines across different filesystems and
> none of them set IN_ISDIR with IN_DELETE_SELF. The inotify docs say,
> "may be set"... I wonder if that is wishful thinking?

Oh, very intentional:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/=
notify/inotify/inotify_fsnotify.c?h=3Dv6.19#n109
