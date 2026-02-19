Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FAC2DB79E
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 18:57:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771527474; cv=pass; b=Pp123psf2DHO5hs4/xMzUbhPLBao+v1JrUsBUoaRj5fevO/2i77HJ+gELnNnzZw3tyZEdUMbPTAioMlABh1vgQyok32sEQDS4AhjRVOGmP+LIYI4V0U8wbXtehCSTEVThdiJqaoJai+ZJC6lzqEVo2ZhQB3UHqAX1c6Sh/I6Zbg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771527474; c=relaxed/simple;
	bh=fj+YaSKDsualB1VdmxHvXU4DOPR+wgzu3vnMbjBDHwk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LA/3rk2pvzcTlsn9ald2t/5TDYI+UfZYhDOHpEdFRtvULdnf5KwhgYXdTw4oRUssDAWNFG33J4EAXvsZ+Par0GFttGqIy/tVBIN/fP+uZNStoSz+bwjzOAogxMGa90m5lsSdODRVd3zhs8LmlMgRG9t25SrdAsJoc0G9OcWa20g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L0Afq0MP; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L0Afq0MP"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so9885e9.0
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 10:57:52 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771527471; cv=none;
        d=google.com; s=arc-20240605;
        b=j/5MZBxXemcFmw9ZZuqvzHpHT1wONqyrezp0mXp7Sio2NNW8d+qw25C2mNSX53NQwt
         Jqv2/uAtiGr+dnrG31WXcLQHW7BZ25s9LKpJxrvVE8X76K+mMoG9PP1wwwrjt6qUi2gm
         jsjbm2YkBelbOJF+0AQ8BkOAEyOCjLQ9oQhDXrqci72F8LhmSG+dUuwn2L5/GbNOz38G
         maJ6KfoBaLnQCyRzp7h2INC/LNyN42GecjOmlLVLIh5L4qrAImlXHGGxVHuU94FCh47Z
         MYa2vwm+bMM8I+fBgKXa8rNkg+T5By+J48SFyztHOzBPdHboe4QSudmRIVQbeppnHX5R
         l7vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NFBMInVvk2+20qEW3rAuH6OydbWEXhtEVk/J1ukU7mw=;
        fh=2L9xpl2Jc++ybsjMqN8y61f7fkAz0KGVOEveHzFJ4VU=;
        b=T4RPSfDM3J8uF2WkR7RtJNNPD76PVcoPx6Djeb3fpgYq+X3NBS1ibfxcnlgEw0VwWI
         UG/D3CRra/R8lVrHV4JYZAdIvGQcQILyTov5JczElGoIZeQtZKsL0WnXQsIgbV6lQzJU
         LaGC1eWVnxAdscIO3AxgGjTB4yWlVVKCc52pGIKrNC8Emvgv2DfrmYBYO8PibYYeeIg/
         jo3MJ/0gro2Y5A91MOe1UVTMH+vkN+FVRbDpUAcFXaaG0tEmiJMpXQpVeT/3gGbjVcCV
         XwpgfDek1IuaNKd8/aBtL30TDpN5pClSNGMRQ9S6V5f5vCIgILg14Hyp8aTX7mV0uU/Q
         vOnw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771527471; x=1772132271; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NFBMInVvk2+20qEW3rAuH6OydbWEXhtEVk/J1ukU7mw=;
        b=L0Afq0MPNqLLYh/VQbSS0se0AXjRYJD274xmeSgP0RiXN2Y+mywZY1o95XlaOj8In0
         BeQ+H2kyFIvSN4AkJnAQpGXwzow5jN7WKm9ONga4hSDQRzau7AtdOBHdOOiQI+ZkCZv0
         SRKoIXCArPHcJmeLoImH8ureefUGoxgEiVoie2XT2a0bWb9HbsZEyAc7QTSIo/5ESNsT
         mr1S6DXvJ7IbHnViE/VjChQwPP3lEFyE4gqLI1Kttk8D1zXo/ljgsQ867S2Nka5gHkLS
         9e/oIarfJ6N0TktFgDGFkIaF602X2+BYC0g4SLfmooyFDnOdv1FYWLe1qJ6Js2piilzT
         M6vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771527471; x=1772132271;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NFBMInVvk2+20qEW3rAuH6OydbWEXhtEVk/J1ukU7mw=;
        b=OfSxzCyTGZtOY0ucPbbPkOeOKfrtjMubwcAfuqSjvSt3fZsl79WjT1fZeRZ/yYTmAp
         0NEUeclzfcNsKXYwRO1GZovWHDh729IhisWjKEota5xWcnv1mATSOKgnisTLWHinWC+G
         NtWRNn9g0hgU1UVKms6d6ZQ//sBBfRvXS3MdaJYVIRQt6w9uwyC+1rJjpbMooUo33+M2
         /5RTGPylsgGMQd/sSbI3+w6r7EQskL504Iln/aS7D++TJIQZP1PorO7D/h+dxcn60ws4
         95Cz7ZrN32QPhQusAi49JzuheZGmoCMqEviCDOhlR4/qduMnWxsHbxloCV/7xFHf+FoM
         GSMA==
X-Forwarded-Encrypted: i=1; AJvYcCUtcQR2/4V0W+O4aH1Sa6LNr2mldYHAJxtmxVElKqgVE4mcEP0ylZNWja7rY/Q4ofc4jFEosY3WLyrbIA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzBI5NYPkV74FVOBkMAp7pw82kdD08BE5mCjN+g3rk68dUl8nLS
	9NisnuQdgn/hVNsTvXuzWekhz1btSeBJ832eYKcQn7B16GbyPYeW/+tw7R3oGABsNpFmxtsBabB
	ulNRObcA4VcwCk5rQMIZFUrbtqidkVSacV1dgC15K
X-Gm-Gg: AZuq6aKXfhiBquySF5lKbxTcCLNqdtr5rE1XO9DKpor6Ah4JZ9TGBH1f2EXgD6xoYC8
	VSBd16oE/qwwvM617gNQ6FcILla0tVVoeJ82dnwzhDLtPBoEAyb/6+ZQf6/IBVxI07XBc7q4qKz
	IuY5C38znFsGMcZraQWPTuVXZbWFKyrtSorJ23loyCGKb+9yZcpt6AG34vLNzQs6haQbMOxMG9T
	4wZ77VME4sc6Cs3aWkEGwENaP60KIhDOVqeZbfsN3D34k8RYaHgIZwAtZFFEa7C04U7kze9otg0
	wlEnPTX2croa8/44d4HBm3jSi7L8ghfvx6fK9kgdoTh6npjOywP4hrWOL5a1TzT1GEUDGg==
X-Received: by 2002:a05:600c:4e0d:b0:47a:80ec:b2f7 with SMTP id
 5b1f17b1804b1-483a3ea10b2mr41835e9.14.1771527471028; Thu, 19 Feb 2026
 10:57:51 -0800 (PST)
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
 <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com>
 <CABdmKX0BJcsv0TaPSsGN2a4nkQaKF=cX8rnnoL5kPTHNfuKL7Q@mail.gmail.com>
 <CABdmKX0DGP9=OOPwU8WjqHnmRDfPnxoAjm8Rvy-D2GYQX0GE0A@mail.gmail.com> <anwsdq5gxzeyfavxqvujbevozknyix6xo7leccqrbznfdgi4nz@hfuqqgtv7m4p>
In-Reply-To: <anwsdq5gxzeyfavxqvujbevozknyix6xo7leccqrbznfdgi4nz@hfuqqgtv7m4p>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Thu, 19 Feb 2026 10:57:34 -0800
X-Gm-Features: AaiRm521HjvGNhdUSunhILK8eWMKqrsMi6CHX_6mrk_tnUftoq73nxUbEb5C0LY
Message-ID: <CABdmKX2JXndogbfvTM0WVia9CtXucth+X3UqXBimN7vZ4X0yow@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Jan Kara <jack@suse.cz>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, amir73il@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 19, 2026 at 3:05=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 18-02-26 14:10:42, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 11:58=E2=80=AFAM T.J. Mercier <tjmercier@google=
.com> wrote:
> > > On Wed, Feb 18, 2026 at 11:15=E2=80=AFAM T.J. Mercier <tjmercier@goog=
le.com> wrote:
> > > > On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Jan Kara <jack@suse.cz> wr=
ote:
> > > > > On Wed 18-02-26 10:06:35, T.J. Mercier wrote:
> > > > > > On Wed, Feb 18, 2026 at 10:01=E2=80=AFAM Jan Kara <jack@suse.cz=
> wrote:
> > > > > > > On Tue 17-02-26 19:22:31, T.J. Mercier wrote:
> > > > > > > > Currently some kernfs files (e.g. cgroup.events, memory.eve=
nts) support
> > > > > > > > inotify watches for IN_MODIFY, but unlike with regular file=
systems, they
> > > > > > > > do not receive IN_DELETE_SELF or IN_IGNORED events when the=
y are
> > > > > > > > removed.
> > > > > > >
> > > > > > > Please see my email:
> > > > > > > https://lore.kernel.org/all/lc2jgt3yrvuvtdj2kk7q3rloie2c5mzyh=
fdy4zvxylx732voet@ol3kl4ackrpb
> > > > > > >
> > > > > > > I think this is actually a bug in kernfs...
> > > > > > >
> > > > > > >                                                              =
   Honza
> > > > > >
> > > > > > Thanks, I'm looking at this now. I've tried calling clear_nlink=
 in
> > > > > > kernfs_iop_rmdir, but I've found that when we get back to vfs_r=
mdir
> > > > > > and shrink_dcache_parent is called, d_walk doesn't find any ent=
ries,
> > > > > > so shrink_kill->__dentry_kill is not called. I'm investigating =
why
> > > > > > that is...
> > > > >
> > > > > Strange because when I was experimenting with this in my VM I hav=
e seen
> > > > > __dentry_kill being called (if the dentries were created by someo=
ne looking
> > > > > up the names).
> > > >
> > > > Ahh yes, that's the difference. I was just doing mkdir
> > > > /sys/fs/cgroup/foo immediately followed by rmdir /sys/fs/cgroup/foo=
.
> > > > kernfs creates the dentries in kernfs_iop_lookup, so there were non=
e
> > > > when I did the rmdir because I didn't cause any lookups.
> > > >
> > > > If I actually have a program watching
> > > > /sys/fs/cgroup/foo/memory.events, then I do see the __dentry_kill k=
ill
> > > > calls, but despite the prior clear_nlink call i_nlink is 1 so
> > > > fsnotify_inoderemove is skipped. Something must be incrementing it.
> > >
> > > The issue was that kernfs_remove unlinks the kernfs nodes, but doesn'=
t
> > > clear_nlink when it does so. Adding that seems to work to generate
> > > IN_DELETE_SELF and IN_IGNORED. I'll do some more testing and get a
> > > patch ready.
> >
> > This works for the rmdir case, because
> > vfs_rmdir->shrink_dcache_parent->shrink_kill->__dentry_kill is invoked
> > when the user runs rmdir.
> >
> > However the case where a kernfs file is removed because a cgroup
> > subsys is deactivated does not work, because it occurs when the user
> > writes to cgroup.subtree_control. That is a vfs_write which calls
> > fsnotify_modify for cgroup.subtree_control, but (very reasonably)
> > there is no attempt made to clean up the dcache in VFS on writes.
>
> OK, and is this mostly a theoretical concern or do you practically expect
> someone to monitor subsystem files in a cgroup with inotify to learn that
> the subsystem has been disabled? It doesn't look very probable to me...

The rmdir case is the main one I'd like to fix. In production we don't
currently disable cgroup controllers after they have been enabled. I
agree the monitor-for-subsystem-disable case seems improbable.

> > So I think kernfs still needs to generate fsnotify events manually for
> > the cgroup_subtree_control_write->cgroup_apply_control_disable case.
> > Those removals happen via kernfs_remove_by_name->__kernfs_remove, so
> > that would look a lot like what I sent in this v3 patch, even if we
> > also add clear_nlink calls for the rmdir case.
>
> If there's a sensible usecase for monitoring of subsystem files being
> deleted, we could also d_delete() the dentry from cgroup_rm_file(). But
> maybe the performance overhead would be visible for some larger scale
> removals so maybe just using fsnotify_inoderemove() to paper over the
> problem would be easier if this case is really needed.
>
>                                                                 Honza
> --
> Jan Kara <jack@suse.com>
> SUSE Labs, CR
