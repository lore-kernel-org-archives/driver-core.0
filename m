Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A146429B78F
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 17:44:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771609445; cv=pass; b=ttPRk3NjpWSQcJ1ldveEHbRaFyL14NKoUkLD2VqwfpBBtrbFLcvZSSLFOw5w7LhCO5CtfzfJFoQ0+3lf3Eq0Bys9t2y8J9ExnHVQrjmn3Mfdicai3ok8ahYSkLoFEoIgmIBN4VC4MBHbDIEG/+5zG2WXOoNYJO4wuIL3ERujOls=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771609445; c=relaxed/simple;
	bh=B4Z1qVLBCGWcijfUcZ0E5ZLSN2ZLUxfaTWpanT2cb1I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nU8SPsGFvEtUgXF6kMEuurhOBbct2TqeRcNw2cIVNp3qBf0SmrqPfEqSAUeCDPVjxzCYp+o4XrcAHitQxIMekWkARVZMKesJ7JOSgqOQYJpRXo7gmpqpGcjbYdorVdohkvtQ/j1Isz7thP0oGMDYt4wH8vAbDqvS1RBlTISi+o4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VPZiEb9v; arc=pass smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VPZiEb9v"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b904e1cd038so334631566b.1
        for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 09:44:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771609442; cv=none;
        d=google.com; s=arc-20240605;
        b=SF/FEYknjPwwtc0pZbRI/vuf4n0jqukGhgisyNFCEBa94Vfkiyg4FP5VsS0qbU/Lah
         G4dL9FTJILdd6C4VNLK50XBFjX8oZtJtd8MKdZJuYzV6trfBTZjw2CUW3YQrMXywg2kL
         1caJr6rqfobNNdA89BPgI72q4vs4Kcx4vZngRbJWyykMVhBILXAA3WgzqfEAJZIbGsDq
         Ko/U2a0aGHfcCGxJu+x3ACLMLzNGpZLxrCc1iKwBeJwEySFvqMw3FCXcYGtaJyXq6kej
         fVRaD4bnMrXu2X7r3NzBX+DVgkzrd0sCbL5K+w3WCBlJ+ibGykltzIu1q9GyG9/0lpez
         5ooQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CKefpqt8YPMOlnxoTebgDHlgo2RmH3VSClTRGTDZyAk=;
        fh=nDUFHOp6RJNGfOGv3mgfpjDMGnHKDgrNda7ip6PJnb8=;
        b=LUVIfSmVrqWiI8POCJfFE9jMYf7iPxDkxTWnkqw6/ZVu3F5I8xTivLvS0Gx9d+Rv8q
         zzK979OKlTii2tJ+fFuXbfnFNY8XakETBjutmUiMonV6xgukegoLRNeSxcODlzsW875j
         PO5QpTPd30GZsXAspb1X2ghrhqklig/C3LWzGQgbwsuq00t4zZVuNw+vCfNpcp2EEn6a
         H91L/QwkAX30srKa5cGdzIQfJHfprj6XWC0lA0WOnIXjuTJUG52RL1wNfEcNTiDLuTDe
         Jz7kgfAKL70/+JCWBKpPTY6aioy/OqX9TGxk0E8ZG0pQwAsthDLb4s57et8lpn9FhkfF
         jrkA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771609442; x=1772214242; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CKefpqt8YPMOlnxoTebgDHlgo2RmH3VSClTRGTDZyAk=;
        b=VPZiEb9vPazQt0fKDXuvV6wcYvtWeF6VX7gktoSv8P8d8/DPE3dTwEXxl5cLsYkPoQ
         Uf4+i8m0RK9CUA/4N6+20pHK2DRgLORVF16QmUcV5aY+AqAucxJWbuCaMizvfW/i1yOc
         dLdV4xvtPaQ8RCAWgNxiGGiPbSqQOnymJOMmoy+mGubKJrf7/gD9RxgBA42hTxurV73K
         X8gP9N74iHLV4lLqITvqfhQNzFN9UGWmcdAM5TTkaOqw4EfjqZ3Z8o0FsMKKoDgh06DR
         y71jKBhDrCVCUP6qgtgv8eOyn7PZv7GBv1rWSm7WOIVGsC/+blT/Yq+aioFkIhXaeox7
         1GZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771609442; x=1772214242;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CKefpqt8YPMOlnxoTebgDHlgo2RmH3VSClTRGTDZyAk=;
        b=SsP1j/VTOmwqbGCR6Cmq7xTaWFrvnlHoXy3hwW0dFQLKxD7DAd+5u00/nvr+Wr0nMA
         wM2JfBsgbPZddSM2AGulRLCiRXSsBBB/tcwd39iWhI5ImHbbS5fvAhg5x0lN8C2I8ALv
         AgodXIimyfy3t7H6tS6LeMfO5sMM0WTZQ3Uht75tPipY5J6uRORigSj54QxLpq2q8raJ
         vIEyUU/EscFbvIeBfHH5ICSycycGMYApAc+vQ0SN9jD+6OSHVpQjz+yaOYbfPvGZeo+F
         Z6+T+JpjoNzFIwJyNW9tKWDGV4wsPFe+6m6vstjvl7uCr4rcx41n9wvOhFwwewPBBOup
         2uWA==
X-Forwarded-Encrypted: i=1; AJvYcCUSovyP42KVdR2AnjEdkqpyRXGquwv3Ia0rm5kUhKGZki1XEuRq4P+ELa2bEjmQdakyJfDedQUrF9D0kA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz9bWJGOX80hGRVJ9D1oT/oZuWR4XfEGxWKUzE8Z/7nt1cU3oC2
	uhmc2Hz+LrbwnwMvbWnb786ag5gPVWhqnUmn/FuY+jMJ5SXKvFXdF8uAwPip8L/53vkqykgmBUn
	MH22aRpjIbAvt1dOm8lyf786eCYgXZ8E=
X-Gm-Gg: AZuq6aK/CaPxSkppjBTgq4kPg182cfc+vvOEJyLKVbIxY6DMm1AZP6xTNbaDBFHtQvT
	pNMBMFaAX2j584xZLUCSrirsml4gFA0ymF9mpBENAuRv8hJlGvApdEhFGF1LGziALFZ4D+bU4MU
	NeOBAQnl6FcoyjJGVm0qSHCvbEqjrd+IRJzHO74Yf8ip5uBGx0xZgm+yCbZYAovZ/98LYjJcBus
	tHRlA9oB2zV4HgmtqnSEvQCAZu9cFlv/yCtxKIPfbbdFIq4RRUUuB3MkYy06p9HJhZuPxKJ8P1+
	lvJ06v384AY7VZ3NmmCTwdnlHqyECZOHqj6t4zUqMw==
X-Received: by 2002:a17:907:7fa4:b0:b88:448c:be08 with SMTP id
 a640c23a62f3a-b908196ba0bmr21965166b.5.1771609441753; Fri, 20 Feb 2026
 09:44:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-4-tjmercier@google.com>
In-Reply-To: <20260220055449.3073-4-tjmercier@google.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 19:43:50 +0200
X-Gm-Features: AaiRm53Yd2hoByeyKZRhB94VwnmInZ2nkUk-ViEeYttOzbObERE3K1f4CUtv2ZM
Message-ID: <CAOQ4uxiPqUzBQAk8Tic7aFMsHtajEWENCTg+CQPMy5XtmS4kBQ@mail.gmail.com>
Subject: Re: [PATCH v4 3/3] selftests: memcg: Add tests for IN_DELETE_SELF and IN_IGNORED
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 6:55=E2=80=AFAM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> Add two new tests that verify inotify events are sent when memcg files
> or directories are removed with rmdir.
>
> Signed-off-by: T.J. Mercier <tjmercier@google.com>
> Acked-by: Tejun Heo <tj@kernel.org>
> Acked-by: Amir Goldstein <amir73il@gmail.com>
> ---
>  .../selftests/cgroup/test_memcontrol.c        | 112 ++++++++++++++++++
>  1 file changed, 112 insertions(+)
>
> diff --git a/tools/testing/selftests/cgroup/test_memcontrol.c b/tools/tes=
ting/selftests/cgroup/test_memcontrol.c
> index 4e1647568c5b..57726bc82757 100644
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
> @@ -1625,6 +1626,115 @@ static int test_memcg_oom_group_score_events(cons=
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
> +static int test_memcg_inotify_delete_dir(const char *root)
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
> +       wd =3D inotify_add_watch(fd, memcg, IN_DELETE_SELF);
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


Does this test pass? I expect that listener would get event mask
IN_DELETE_SELF | IN_ISDIR?

Thanks,
Amir.
