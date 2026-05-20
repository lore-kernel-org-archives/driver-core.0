Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2114C2D5C91
	for <driver-core@lists.linux.dev>; Wed, 20 May 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284110; cv=none; b=lN+oQXGMW9flT+gGhDPRTH5Lqmwik2Bx+HsTdwAOEPHbLNuFd4L+goGY24t9RnLyNMOoqGtxlrCXuElqCqYY/oqsbVAGTqd5i1fsXL7STmjw7ev/1+Mcx6cWK8/zroYFb/Z1sTvWsvRGKXtFHpIKd9w/t6I+V+nx9IIqqrelPnA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284110; c=relaxed/simple;
	bh=2qPOaCjJoip/EhJHaA1o55+8gvLsASSCfU0mDdAdqE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nhUlBvUzXpSks4r9+5vozHozUl/htldo5fQX5vazuKZeua0iZyufP+GjslGeCMIkJjHHL8Atz1MK8e/aUlYXsFBTk4+BM/0wQ+JC4eWi3K8lbPu1eRIZQ227J0cRa4e2DBLmmILGj5X/pHP2oQsKzJgP6uquUIHmFWZkxl6yuyw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KYxnxNri; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KYxnxNri"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C96E21F00896
	for <driver-core@lists.linux.dev>; Wed, 20 May 2026 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779284108;
	bh=YT6Cxg0OPsGdzBpjNXF+FWupFxWA1FIAgWH3VJwFU8Y=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KYxnxNriqS1MkJri3arR4q/PtctigG2NBW2Bx7ElIlr9hfTHgWtuR1XDF3vGx4PPb
	 kp20ZJt7o8V1yCtfxP3ELlH4fp8JL2xBRjcBvON+EPzoAyH85Hr+MSRlz9s+jD1iBj
	 vDHppz9F82YMqKshMdKlCs9vV+PyDJgUsBTvJ1nTqsl37wnF6pAWCch5ZFJWK5B/ic
	 2hibD9IZcdTawsRjNHLqTUpl+XI0PfwjukhqWGkbHpCKn/EU9dL/8v7dgDpZS569ax
	 gXbNoFD+IhXlLFONdPXXAX09pJmZKubSEUYnmXrrsK5xvCqiK/5t0dCBjuWfkdb25Z
	 Z1z6vKr5BG19w==
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5a40502e63bso5413859e87.0
        for <driver-core@lists.linux.dev>; Wed, 20 May 2026 06:35:08 -0700 (PDT)
X-Gm-Message-State: AOJu0YztmfsdEc4SW0xB7nbDOiQU+PhH2HZmeqB4TkWHCI9MARABQe5z
	YRI9qH5OTrk4VyO4FFftFU2uGok3GLfjXaZalXO3eiYzy5AlemiAx+6VQ6B++EgOlUoonoU3zvV
	jVNBAa2GmrgMKwERpnJrIzZp93RHNKLk=
X-Received: by 2002:a05:6512:3c9d:b0:5a8:72e2:db83 with SMTP id
 2adb3069b0e04-5aa0e61c905mr8465354e87.19.1779284107277; Wed, 20 May 2026
 06:35:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <2026052003-uniquely-hastily-c093@gregkh>
In-Reply-To: <2026052003-uniquely-hastily-c093@gregkh>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Wed, 20 May 2026 15:34:55 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0ggrSycDsN0=GG6qdSuz19n8bODX_qsEB-9YDgneoF1jg@mail.gmail.com>
X-Gm-Features: AVHnY4IfHR2o_mc_UzWiCQa3pANZNc2j4IIE2Y-EeKLOkf_q-JRQyGf3xGlnECc
Message-ID: <CAJZ5v0ggrSycDsN0=GG6qdSuz19n8bODX_qsEB-9YDgneoF1jg@mail.gmail.com>
Subject: Re: [PATCH] sysfs: don't remove existing directory on update failure
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Rajat Jain <rajatja@google.com>, 
	stable <stable@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 20, 2026 at 3:05=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> When sysfs_update_group() is called for a named group and create_files()
> fails (e.g. -ENOMEM), internal_create_group() calls kernfs_remove(kn) on
> the group directory.  In the update path, kn was obtained via
> kernfs_find_and_get() and refers to a directory that already existed
> before this call.  Removing it silently destroys a sysfs group that the
> caller did not create.
>
> Only remove the directory if we created it ourselves.  On update failure
> the directory remains as it is left empty by remove_files() inside
> create_files(), but can be repopulated by a retry.
>
> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
> Cc: Danilo Krummrich <dakr@kernel.org>
> Cc: Rajat Jain <rajatja@google.com>
> Fixes: c855cf2759d2 ("sysfs: Fix internal_create_group() for named group =
updates")
> Cc: stable <stable@kernel.org>
> Assisted-by: gkh_clanker_t1000
> Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

No issues found, so

Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>

> ---
>  fs/sysfs/group.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
> index 182e54e575ee..4e1e4f18a166 100644
> --- a/fs/sysfs/group.c
> +++ b/fs/sysfs/group.c
> @@ -188,7 +188,7 @@ static int internal_create_group(struct kobject *kobj=
, int update,
>         kernfs_get(kn);
>         error =3D create_files(kn, kobj, uid, gid, grp, update);
>         if (error) {
> -               if (grp->name)
> +               if (grp->name && !update)
>                         kernfs_remove(kn);
>         }
>         kernfs_put(kn);
> --
> 2.54.0
>
