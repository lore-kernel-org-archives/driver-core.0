Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 944612C375E
	for <driver-core@lists.linux.dev>; Wed, 20 May 2026 13:36:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284202; cv=none; b=eXlNaJzrpBtyrh4b7Od2XHQ/PfNdDiRLD6OoXIhQvlcJSrhCaazNOUhQAwsQOtbLaMunCNC5VumopOQfqTfPoHpUvjIDSAMEohOto/XuJqc+00YZxCAU4by7lfVIIB/q6DIBRvb3rRNpPjNMGHeBWsjGPvMFssPACTfoc7hn0JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284202; c=relaxed/simple;
	bh=nRcXKIclKIxiAzU+94b2hSsbL206vwcvpe92cFk2Mtc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TUkH9ixuSlsvpN0UbBBjUyNJGmyBJv8jyCIszKW25fx3/P067FXuwU6v6Pc0CH76ILB7FIExhp4j+PCBB+CzgGaoEpxLkwpW7+SEMF6yBL2q+0Oil/mlpBUM7tUYTLeTSwQ4+1j90KCVDXpaklb58AKo7c6R5D9Z3NFucfkO6tI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EajEbrIV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EajEbrIV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7BD661F00893
	for <driver-core@lists.linux.dev>; Wed, 20 May 2026 13:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779284201;
	bh=ud3G9oXRGRwXPP7lt4I8qbD2jt5S+QPt9HolY9yv254=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=EajEbrIVoHR9iRWL4S5/jqj5e4LTEQDnU8C0J23TxNoFN13SEFCmH+m0PfcIOg8WX
	 ANjjLeQsen5BqBfJVjn8aQLyZxC1NPed32+BNCdRNMZzEd5bc/EVK+0W0VrTtR/mNu
	 l/I301Di7U3etA3k2fVvK/2GTeU92KxRUUbe8aNoxQr9lavB7xdN5Z/6zGCtFjciMM
	 6/3DuhB5NolvTde26AnfwzO/hT3j8mLRpgGrHLjgsz5c0R2aIBAGv64BL8gmag1deK
	 zfFC7SqiJiH4bXI+QLwFzPligv1Ue7COCmLaSr/uBsSGDFYdwPe5t3qkk2z+TgT2y8
	 4zUolz1rx+48w==
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5a8721851e2so5926946e87.0
        for <driver-core@lists.linux.dev>; Wed, 20 May 2026 06:36:41 -0700 (PDT)
X-Gm-Message-State: AOJu0YwUPATaSOdL9UZpd/m6z4CC1ctH+0NeeDx9GiMoxVN8edkJkaLb
	t3lqKpSk74Y+CLuTzy+hApwMOyKUEkQ0Io2kcQ+bUxxskhc6M7bgLxIKHfArSM307c1sC5ghKzz
	bO6Erv+50Xnuxnvn9RC5hEWIRwEpOs+0=
X-Received: by 2002:a05:6512:3a85:b0:5a8:f984:142c with SMTP id
 2adb3069b0e04-5aa0e742944mr6823634e87.12.1779284200015; Wed, 20 May 2026
 06:36:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026052000-drove-unicycle-d61b@gregkh>
In-Reply-To: <2026052000-drove-unicycle-d61b@gregkh>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 May 2026 15:36:28 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0jkPrUY9O9rTxGKOSEv5FY0Os7miaBoRNAtEtiTWK2dug@mail.gmail.com>
X-Gm-Features: AVHnY4Kb2iOlQ-o05VlKuwct4Mz-V1af9T2jphzVcNl24Pdyw4i1NWEEHVNjm30
Message-ID: <CAJZ5v0jkPrUY9O9rTxGKOSEv5FY0Os7miaBoRNAtEtiTWK2dug@mail.gmail.com>
Subject: Re: [PATCH] sysfs: clamp show() return value in sysfs_kf_read()
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, NeilBrown <neil@brown.name>, 
	Tejun Heo <tj@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:06=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> sysfs_kf_seq_show() defends against buggy show() callbacks that return
> larger than PAGE_SIZE by clamping the value and printing a warning.
> sysfs_kf_read(), the prealloc variant, has no such defense.
>
> The only current in-tree user of __ATTR_PREALLOC is drivers/md/md.c,
> whose show() callbacks are well-behaved, so this is hardening against
> future drivers doing foolish things and out-of-tree code doing even more
> foolish things.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: NeilBrown <neil@brown.name>
> Cc: Tejun Heo <tj@kernel.org>
> Fixes: 2b75869bba67 ("sysfs/kernfs: allow attributes to request write buf=
fer be pre-allocated.")
> Assisted-by: gregkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

No issues found, so

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  fs/sysfs/file.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/fs/sysfs/file.c b/fs/sysfs/file.c
> index 5709cede1d75..25b44fe171a3 100644
> --- a/fs/sysfs/file.c
> +++ b/fs/sysfs/file.c
> @@ -120,6 +120,10 @@ static ssize_t sysfs_kf_read(struct kernfs_open_file=
 *of, char *buf,
>         len =3D ops->show(kobj, of->kn->priv, buf);
>         if (len < 0)
>                 return len;
> +       if (len >=3D (ssize_t)PAGE_SIZE) {
> +               printk("fill_read_buffer: %pS returned bad count\n", ops-=
>show);
> +               len =3D PAGE_SIZE - 1;
> +       }
>         if (pos) {
>                 if (len <=3D pos)
>                         return 0;
> --
> 2.54.0
>
