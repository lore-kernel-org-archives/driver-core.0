Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B21FA3B6368
	for <driver-core@lists.linux.dev>; Wed, 20 May 2026 22:12:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779315123; cv=none; b=ciJZ9GLOq1fC61XhDN/bTPdleupXCkv8LVSu94bUIp1yiO5KKR0csj6V7z6BQ+Qq6TQTLQSgfd09hUZ7sCw2RFk5C3ro5ftVCg9ia9KmVBXxdU4rfAelBGEITmZHZaWJPrxLlFpRgS03TZ1Nk6dYt0rBGQBuUq3+cdi9zsCcmag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779315123; c=relaxed/simple;
	bh=Cof4Jn9Pb0lNFELLArIlY7ZcHjIiQKqHlG/bd8/G9F0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=sZ+2TJCGPd4VPRgtHCtLcM+Py+QVR2T3f3kQw9XqRR1HkeCggqgmBKjV8hke4XZkUB/upAHy3HMor/BvtwjapG7jVuQbk3PzBqsHJa6y8/H5YwtZNV386iQu4DLsAgbEjH6x6q/Ycab3am/sPzvhEXsOV+GIAcBOLvQhyvd2vlk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G5XFieCS; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G5XFieCS"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45e7c636e74so2853118f8f.0
        for <driver-core@lists.linux.dev>; Wed, 20 May 2026 15:12:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779315120; x=1779919920; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kRpSg0hy3Rjf3yEZPX+t8O4volQZbZItPIjeFWyTS4I=;
        b=G5XFieCSk5dxodG+41+5b97TKsGgOhNjV2J+sKStUvBS/v77RlJqzGwAhJAiIQmzzi
         kiqccWYA5hs7/RxZiDWwbzpLxOE00cVnaGc1ymiQtN5YRW30eLDLF61I+kVWwl1bxYCS
         AqwmXp7+DkoEeC8h7Oh6raYGaY0/WwuvSxwS9ps3jygCmis0zEPI79j+4hx0fZ97BGB3
         1z+Yw/svGlG/SgeBT+1PTaPzTd10X7pZyh1W0o2TTt+DaAfq1SNuL76Mr6bDsZ2jr7K7
         dvAqeF/q2Fivz7WYDk6+zNWG0LK9QVYgjSsZrpWrB8wLFAzuRo6eJJHyRv7JZXBoSp/5
         pvjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779315120; x=1779919920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kRpSg0hy3Rjf3yEZPX+t8O4volQZbZItPIjeFWyTS4I=;
        b=J7Nq1UMKF569wnBt1irNE+1/VuclLh9vA0BRhxzF5iJ3QxMj5HgHifmCVTJLKA/Pj8
         rlUrqx4qI+a1O0XAtiiSBghVFUY2QvS7EyjyX5cQ4i1Lrh9dJzEZH9h3M2Ek2W3JfQYl
         IwToW4GJm5qByWjddhFqWmESp49cMIKWhrShro6tVfOHntFmXXX2CH63lTHur+lZuje2
         /XpCZHFKXzc7ZGYNJXiD49XlAKFTLK8wtuUYfPuFqzpdeJXw3ep1elSkgVtqAmtsV2WS
         rzNomAm3rNCg01YovV0A8+tBKkixigTEMRL0+vJO/Er37UZ5jQV8faqtAiM9zAcxZh12
         PgIg==
X-Gm-Message-State: AOJu0YwHK/ulu48RbSEwXvyfxVmaI8syNzEi/VNA/yHMb/dzvzMTK4/L
	T+Ug5ccR7eEFzOnl3ykqypBf81eOcMoLa9i2saHp4EMFWGenULU4+7h4
X-Gm-Gg: Acq92OGUiT78tPTnFBDASc5caaBKKvAuOzwT7GUUNZMyaz5oEJHYwINJLy0vHDYjXyJ
	6F310c55CUVNK8mdrwPjdyPLc1hchNLYik9BQsfkyzUmn2XlUpPsg1M6589R+fxzLIyG1DISttD
	BQAIc8H1g1U7w0FRxEUx3YsilV5WKAjpRdefw+gzKIgTAxFaetjW3TM/3psWOaVBlNGSwmKkZme
	LsEQ9krcDzFfB23KCJm9rXT2m4bVTdopcRCX547p1lmtibpZyLH7LNR7bHrYe7fbO24MDMh0KED
	ouOH9VJyYNcLJdLQDRZ5FRJR1JqnqY/fnNW+koC2ZShISjfIpzyPb8jXXIPlypONVtDRjJRtpD4
	+Za5RLInoVrq9GCBb047YAUCNLUjJ1HDpdgnLNazASjKckbv6MdeHyt4iQFGJuSf71U3ct0X4OK
	FrBss9TtdDV9fYSjv1MEov3m+GSQWGm0ktoC/26fZQ1tGM6BsERUnw0D3Vkp6WapR7
X-Received: by 2002:a5d:6f0b:0:b0:45a:cea8:e4b2 with SMTP id ffacd0b85a97d-45ea410e9ffmr196007f8f.29.1779315119850;
        Wed, 20 May 2026 15:11:59 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45da15a666fsm58894877f8f.36.2026.05.20.15.11.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 15:11:59 -0700 (PDT)
Date: Wed, 20 May 2026 23:11:58 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, "Rafael J.
 Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, NeilBrown
 <neil@brown.name>, Tejun Heo <tj@kernel.org>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
Message-ID: <20260520231158.407ebf0b@pumpkin>
In-Reply-To: <2026052000-drove-unicycle-d61b@gregkh>
References: <2026052000-drove-unicycle-d61b@gregkh>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Wed, 20 May 2026 15:07:01 +0200
Greg Kroah-Hartman <gregkh@linuxfoundation.org> wrote:

> sysfs_kf_seq_show() defends against buggy show() callbacks that return
> larger than PAGE_SIZE by clamping the value and printing a warning.
> sysfs_kf_read(), the prealloc variant, has no such defense.
>=20
> The only current in-tree user of __ATTR_PREALLOC is drivers/md/md.c,
> whose show() callbacks are well-behaved, so this is hardening against
> future drivers doing foolish things and out-of-tree code doing even more
> foolish things.

What is the rational for it using PREALLOC?
=46rom the code it looks like it could set a buffer size, but it doesn't seem=
 to.
Which means there is a kmalloc(PAGE_SIZE + 1) in there.
If it did set a size, the check below would be wrong.

=46rom the look of the fragment below it is just passed the address of the
pre-allocated buffer.
That also means it can't use sysfs_emit() because that relies on a
page-aligned buffer.

Also I suspect that kmalloc() grabbing a buffer from the per-cpu freelist
is cheaper than the mutex required to lock access to the preallocted buffer.

It would be 'nice' to change the type of the buffer passed to the show()
functions and to sysfs_emit() to something other than 'char *'.
Even if the initial change is just a typdef for 'char *' so that
you can tell which functions can call sysfs_emit().
At the moment it is pretty hard to actually decide whether it is safe
to change the printf() to sysfs_emit().

If all the show() functions are expected to include a terminating '\n'
then the wrapper code could add one if missing.
That would save a lot of strcat(buf, '\n'); return strlen(buf); sequences.

I also think (bad for me at 11pm) that the buffer should be 4k not PAGE_SIZ=
E.

-- David


>=20
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: NeilBrown <neil@brown.name>
> Cc: Tejun Heo <tj@kernel.org>
> Fixes: 2b75869bba67 ("sysfs/kernfs: allow attributes to request write buf=
fer be pre-allocated.")
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> ---
>  fs/sysfs/file.c | 4 ++++
>  1 file changed, 4 insertions(+)
>=20
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 5709cede1d75..25b44fe171a3 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -120,6 +120,10 @@ static ssize_t sysfs_kf_read(struct kernfs_open_file=
 *of, char *buf,
>  	len =3D ops->show(kobj, of->kn->priv, buf);
>  	if (len < 0)
>  		return len;
> +	if (len >=3D (ssize_t)PAGE_SIZE) {
> +		printk("fill_read_buffer: %pS returned bad count\n", ops->show);
> +		len =3D PAGE_SIZE - 1;
> +	}
>  	if (pos) {
>  		if (len <=3D pos)
>  			return 0;

