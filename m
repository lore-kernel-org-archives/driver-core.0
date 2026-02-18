Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7021314A76
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 22:10:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771452659; cv=pass; b=VLLVedDUVvD/UCnxeOaVNYhLdFCIwogyVCbybj/7KX+FN1sfExVC3mrIO3VAlBGYT9OvZj6PLfDitT/8AMrxOrmUYJIouxyT+t0Pu33dlIJDaTC7cSklhaaGfI+ZOUbAy1PbcQERjoovR5eA4zSolIcVd6cmuh8DH6FOkwIsIAI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771452659; c=relaxed/simple;
	bh=lPYt0pFhbd6M7kXSQtBzYZaVvT2A54L7thEUJD072Aw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VGBRs3Aa3Nz+1PAAOfryIvYzKYzxMfhacDuu+TWha4h6klKiUuXA+HJ2s5V5rW2sQuf+ScjNSvK7l7esLJZmNcuasuICLv1HVSi/W5vlRTt3xxUI88mIIkunfNz8l77O7j2dlzOO+AFxbbwxj0Aa5XzrXWaE8MGuX8uyyPp2IfA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=m+I8mKAq; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="m+I8mKAq"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-48318d08ec2so8205e9.1
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 14:10:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771452656; cv=none;
        d=google.com; s=arc-20240605;
        b=Zn1J7g6uhEvLcPVCkaltVTZpmP7CfnPubQgWmYAe+g7hw3xIFO/XI6a6mgP3+OzkPw
         53Rwub2tff5fK9ryqOqXWUGK1P85ahc/MfAgd+/Vxt64hgKpcckEMYwrnstgc05XQ5ee
         qOzFf/70F0fBJeURplQC9wHblgRJpAdYF+A47swnHcLeUJOEjEM5TWGA89FYIqR1E1+D
         ysgEFmrZEE9vvJ0UYmS6gO5bzxbasFjUSfBreI4/xMpVdMKTp1q6REsV4N2jAvz8SinR
         1MAKVux8/zxOfVaD2H/VgQSjJMRpJpc8a+p7FE1Jb6Nb2MJ0LIOoJMrSZci+q9rtmGTF
         btAA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GFceulQD+cH2ZvMG6LJDvnAg6v30pKU0WTiw2QCY5N0=;
        fh=ZkCBQpPizv6I1mABdW5Y1u91L6s3b51QQAjXli1z+bc=;
        b=JAzQsxm1bbHRgpshcoEpWPame+i2b91pv4Jdqqcr//sKKvGoCWTjCTkzqkrrp9T88c
         qoBtHwF5AN8HSkcQTnfPy2emO4Xxzd0M0wm1nYoSFM+0RcpbK47IffH8gF91LBU4TaSE
         PIjkuivfa/PcvRPeZ3tQRPBYqIeOR7KsXiuUX+fHV0itfu83m5EAFKnY3kjEgWrJXAHA
         LDbc1AdeQAYOXaKD2xMsM1BLR5kiKnvokOQVlDUZcEL2IBeS08WeeJYuwhFq7pclatKj
         L6g3VyDy0sulFlXGdG0xYxreA8UMqdGA31qoYRC0wnpOOy4FxgbHvopQobH3W6v5N3qq
         AeQw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771452656; x=1772057456; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GFceulQD+cH2ZvMG6LJDvnAg6v30pKU0WTiw2QCY5N0=;
        b=m+I8mKAqmqMwm5fSxZmvmCtJZc0T2I1LG1l6DtWpzbgW65yyxjHfF0GLeeCn30Au5S
         NwtWZCvIqM9/ortmCAKEz4TtYPgSDM5deqI65EcXSt2cAkLmUmzPkx4D7KD5DJbO3cT7
         JfOQKBVlqDXdni4U4KGDPK1sQEQDWWJIsvlocHT4zQkX6k7iHB3W8grbLNVDMjrB3RXt
         7jddipad38qzvhmMAnG9GBxAG27sR/8q1a0S8x+qMNyLdfnBYe/TtrKJO6V7IUqes3YJ
         YTMWLYCZTGG5nn2QgS7PXfmI9/f+URsz0kZzdaAuAnxIGMNHe1Gt1WQ8SEWDRKlDdFjF
         vrsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771452656; x=1772057456;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GFceulQD+cH2ZvMG6LJDvnAg6v30pKU0WTiw2QCY5N0=;
        b=kHChU297qsZC72clLLFfMdV70tRfAY9Mdaxz7MKzYmcPcFBlTBizQUB9Q/+5/0ot9t
         hqtRT/Jyi6BVMBEp0q/SsxiaV4zAXOckIZdyfnegtYsvg17g7wtm/EQ6duWNqmGQBjvc
         xHtln+c+jB0wvAYlT4U9GCMpl6zbK8N+WgFtI/MOiNibP11rlGKqNcalNcpRn6FixgM6
         IqKQdXhmMKO4cLIOXTeR6tDTe/q6eQ1WFsVY8xhi7vFF5TDwc1YLFPKMaRGPVKP3KlAZ
         IwXl6bTKjo730zpvOfrMiU2P8Par01IcCPM82KAe3TbkvjerHt6XUoiqXsX0JmEXzbyI
         QFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCVOlhDSTASqUigBFr4tUyaO/Hc037V15bUAu2JesmA1NBU8cDSdJTDVDM7R8FiaVZqviW+dzLrjFNjNUA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy9cDIS3UBoaVvuEORG6a7MOxm18yNAFz2vcsFXaUieimnwpJZ1
	10gG11IMlkzkiX5Vy4XKWUv1EuLIwFrr8EIjOA5gmzVLV76FDhx1t2GRzjfjj3atDsUFnAhM/h3
	/kwtXmLywpPWBDyKJU38HPr7guzEQWMxwb1xPXHTQ
X-Gm-Gg: AZuq6aJ3gH/Xn2HsoffYcc/+CaJBIZsM6EUW2EjQgA3YslWmsJciDdcbK6jJlstcVat
	DPlR19WrkrriRxkH/k74tqFKSFZNYaQRfs7ZYcyE5wf0Cpmp+IGGj8g19ZYnDiDkA/S7GLrdiq1
	XI+uY/lnRjPX153wHlKmkf13KA0n6Usue3dOY00xUD0sfKnOEiU/jfcXb+aUAQAXW/YUeqMm0Gq
	wjOBnqsYCMgK+Pbhaf0tjL33YIGv13IRkcnC2HCX3C6XD/RmqRIBA66Sbwe/k0nf4szKDdwd8km
	AnOH8vX8u9FPYYnYMBJoikYcsoScQ7MhAkuwEQ4v4Ey4B+aix6vTHdgH4+NR7LWiS7vJQw==
X-Received: by 2002:a05:600c:3e06:b0:45f:2940:d194 with SMTP id
 5b1f17b1804b1-4839f8fbec9mr92205e9.2.1771452655867; Wed, 18 Feb 2026 14:10:55
 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-3-tjmercier@google.com> <e7b4xiqvh76jvqukvcocblq5lrc5hldoiiexjlo5fmagbv3mgn@zhpzm4jwx3kg>
 <CABdmKX1S4wWFdsUOFOQ=_uVbmQVcQk0+VUVQjgAx_yqUcEd60A@mail.gmail.com>
 <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f>
 <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com> <CABdmKX0BJcsv0TaPSsGN2a4nkQaKF=cX8rnnoL5kPTHNfuKL7Q@mail.gmail.com>
In-Reply-To: <CABdmKX0BJcsv0TaPSsGN2a4nkQaKF=cX8rnnoL5kPTHNfuKL7Q@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 14:10:42 -0800
X-Gm-Features: AaiRm50oJmkhv3JVc8QRZs9eNQOIt0sVOkSFuyILAnwFvxKBu7Elyj-9uDHYoK8
Message-ID: <CABdmKX0DGP9=OOPwU8WjqHnmRDfPnxoAjm8Rvy-D2GYQX0GE0A@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Jan Kara <jack@suse.cz>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, amir73il@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 11:58=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Wed, Feb 18, 2026 at 11:15=E2=80=AFAM T.J. Mercier <tjmercier@google.c=
om> wrote:
> >
> > On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Wed 18-02-26 10:06:35, T.J. Mercier wrote:
> > > > On Wed, Feb 18, 2026 at 10:01=E2=80=AFAM Jan Kara <jack@suse.cz> wr=
ote:
> > > > >
> > > > > On Tue 17-02-26 19:22:31, T.J. Mercier wrote:
> > > > > > Currently some kernfs files (e.g. cgroup.events, memory.events)=
 support
> > > > > > inotify watches for IN_MODIFY, but unlike with regular filesyst=
ems, they
> > > > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they ar=
e
> > > > > > removed.
> > > > >
> > > > > Please see my email:
> > > > > https://lore.kernel.org/all/lc2jgt3yrvuvtdj2kk7q3rloie2c5mzyhfdy4=
zvxylx732voet@ol3kl4ackrpb
> > > > >
> > > > > I think this is actually a bug in kernfs...
> > > > >
> > > > >                                                                 H=
onza
> > > >
> > > > Thanks, I'm looking at this now. I've tried calling clear_nlink in
> > > > kernfs_iop_rmdir, but I've found that when we get back to vfs_rmdir
> > > > and shrink_dcache_parent is called, d_walk doesn't find any entries=
,
> > > > so shrink_kill->__dentry_kill is not called. I'm investigating why
> > > > that is...
> > >
> > > Strange because when I was experimenting with this in my VM I have se=
en
> > > __dentry_kill being called (if the dentries were created by someone l=
ooking
> > > up the names).
> >
> > Ahh yes, that's the difference. I was just doing mkdir
> > /sys/fs/cgroup/foo immediately followed by rmdir /sys/fs/cgroup/foo.
> > kernfs creates the dentries in kernfs_iop_lookup, so there were none
> > when I did the rmdir because I didn't cause any lookups.
> >
> > If I actually have a program watching
> > /sys/fs/cgroup/foo/memory.events, then I do see the __dentry_kill kill
> > calls, but despite the prior clear_nlink call i_nlink is 1 so
> > fsnotify_inoderemove is skipped. Something must be incrementing it.
>
> The issue was that kernfs_remove unlinks the kernfs nodes, but doesn't
> clear_nlink when it does so. Adding that seems to work to generate
> IN_DELETE_SELF and IN_IGNORED. I'll do some more testing and get a
> patch ready.

This works for the rmdir case, because
vfs_rmdir->shrink_dcache_parent->shrink_kill->__dentry_kill is invoked
when the user runs rmdir.

However the case where a kernfs file is removed because a cgroup
subsys is deactivated does not work, because it occurs when the user
writes to cgroup.subtree_control. That is a vfs_write which calls
fsnotify_modify for cgroup.subtree_control, but (very reasonably)
there is no attempt made to clean up the dcache in VFS on writes.

So I think kernfs still needs to generate fsnotify events manually for
the cgroup_subtree_control_write->cgroup_apply_control_disable case.
Those removals happen via kernfs_remove_by_name->__kernfs_remove, so
that would look a lot like what I sent in this v3 patch, even if we
also add clear_nlink calls for the rmdir case.
