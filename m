Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D7F2E5B19
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771363516; cv=pass; b=THo/j5cS9hgkK6pjY/YCLS4Y5sjewRUTPLrcG8Ly1qIxJj0R3fmLPjZ1WarKqmGw0TK5A+PqeFWI9BJW6jBO8Z3QnTwaqif+hAcsgFUlDDDZszhmWrNodsYtTvcHat8ATxqUToGlezBqs68tvcrslPxTjExdjD8jcq+kkGmFuAc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771363516; c=relaxed/simple;
	bh=fbhIDMncw2o3OGAnMUfavkAE0+3CvTo4wLCTth3BWak=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BIZ/PO7+uMVU2Vxap8U8U/IuwtV+U3leWO1KJH70/K5OXkQHeDCWDmcXbgpt3vy1H7naVaKXkEnZm/Xmn8MDy0SQ/rk85SM7w9AeyXs5qr1vY3k7yuhaPhpya/T3mxpAs+tpTQ0t30yQ/gt28VyTh37C7oQoG9P3rXgi8g//0Lo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nDBBe654; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nDBBe654"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65815ec51d3so7728185a12.2
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 13:25:14 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771363513; cv=none;
        d=google.com; s=arc-20240605;
        b=DEu60QlrOOkmofTlCo1W4Wg33kHrpE4yjOzGQAZgDLb9dmuQMQlMvUlwnPKIKDozqI
         7cPnhbO9aG6gWOEX12Nmvf0Q/T9gpvHjq9UvfdjtW4rmHTNpkJSQBpWtmsgjiiAT4/BK
         YBPxp0uzSz7xfAJOsuIM0VAjpujNGsR6FG0+kI9trxbBMM6uOtczH2y797PTTogzW60u
         XZxraEfRLCnxmMN11n35+10ITglW1FWHshaQ0g6wBojABZKSgGXoS0kypwPm541lLUc7
         sdgI1A9APRcdV0aBCz0CtxBEXfCv9HwyQtbHZLP7OCyxoXiwvPbevpUmFZs9XMmfqw8h
         oDHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fw82UQHVg2xZhGg7XycSDFADTgXvBB91CaL/8gvyO6E=;
        fh=IqrZdJ9wBvOs1wyKp1KXFFyLiTM/oXQnSTU7T8dXcqY=;
        b=AFhoZiLWl2niNQP/wlyXRTqDwBnT2fkDtzm6g5dQPJFf4B9mlE4hZ5BERJgYIucboj
         sP45GJEONhgiIWqruWq5qZDiC7oJWqWKVK/XFTuIzAlgT/PnbuFEMyjS2lizi9HXLSqP
         05o2qODH4c8gBDCH5YPeyktFkJiZgR4yO3E6LGfQYX7VWmrRUnKX47Z2dnnWCWJnvMBR
         LCNYkFTqbm+w07ZGeiepgwgFKLwjPyJ+Ky6xIuha6M3cAQUNY7u6qpSv534T5eeuc1qu
         nk/PGfKDDEMpr/NKjlSKlrM/igKXHqjFH4xx1/pbc1O8XeFL4cRCgHnmq+54s4jaqDJB
         fbrw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771363513; x=1771968313; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fw82UQHVg2xZhGg7XycSDFADTgXvBB91CaL/8gvyO6E=;
        b=nDBBe654Wqxc/14c4nhRTcuBQz1PkNFFnTfsR2Gn3OF3wY+a2zSkb1LfD0xB7ddhSi
         drC7nH+xHGl51IW5j1rtdA70q10wQem9C6WKr2qLWldvB1FJT7Hnbi9vLVxdcTJMatIK
         LGqkdvabSpKiUNGPnpErXQHUj8lO7eJJrV8H50Pkgez41T9FkdzWmeF6PLP320St6fHd
         mIw5DMmlPuloO+JqtSDSsBl3WyHnNiZAKPb5J8nPDoW5NqkonG/oD8UQok0pZjjnqsgv
         zF2wxN6R/kuJ8SJjp/iTMy/bCO1eawEAIZPOfRW+d5XRg4kQJeEQ/3QdzIitArEKotUz
         OrEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771363513; x=1771968313;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fw82UQHVg2xZhGg7XycSDFADTgXvBB91CaL/8gvyO6E=;
        b=fhEVOMcCCbi6fOcvxSxYp/2ap1xRBiXofBnBGqqMdZ/4Iv7BFYXw7JJqHG8RecCYJp
         MH+l6QLiuK1nYzqqEqqMa2CSDhFEnqTzEuxf9NRBw39mW4e0fOZ018yqWrIO0j6Du/Mi
         kwmlVR4XzOCpF0anlRzN77hjbTzELWc5CgtrdYWSVQXCRMwCjqIZc80wkemqWpqyvIn4
         BYsAo0dTvOqG8evAkSCvEZNPE+o70gwRyPN1SHHnozmB+91PA1jkKk4W0OLaPi91ZC9g
         0JtYXXB4qEfndkOsrvST6h0dbnvA16X/YdjIBoxF9oPb8Xm56+g2mD4iOBRjgkcTqaSa
         ugMA==
X-Forwarded-Encrypted: i=1; AJvYcCWfrDX/eQVvLaQaiMurCHc4/ml+OFBY8ekds+qFh1IQ9uBAAioKbYxnywEcMKUpxar2+jtYd2FbtFTmng==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDQbaWha5nb/ia+WLHJNpDX9O0+KUbvZW9GLsBQuXVMpWcXa6m
	nL7yeAnuLZHkZKw6q1XcNxUbc08kzgI0p8I0DXyY+PUAsxLSvyNkbpv1m5XDcNv6Dw2GmRSMStV
	e2WYcKpsbLsnsR/fc6mF466/HFLS2sHI=
X-Gm-Gg: AZuq6aL5QP1OpZLV8ou0Eyzs4xiQ7RDjVtYwtKMYkORx0LJKObj/PZ2PhxjHo8MCROs
	HQKy1TpY8dsZ8uz29jBBERX+TtX7dB/nBY8bg90yKKASIVtHc7uqPekli1xOsLWpEbRa5HB1RVB
	GaStfaFrgl64dMD6BB2C1+qvdC0YjCgweQp1uwO54rp+qihFtr6azjLVVQjsJJKaP+l27FkHexK
	dyZpHLKWUkMXK9LcrPjZ3al6EHg+mUKj9vXtouPfmfA2khBVixGEKR43+hGmdjxVkBP5i38Mb/N
	Nsz4xkAl9G8IdolAI1w=
X-Received: by 2002:a05:6402:1470:b0:65c:63f0:a92 with SMTP id
 4fb4d7f45d1cf-65c63f00e8bmr1535827a12.23.1771363513152; Tue, 17 Feb 2026
 13:25:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <20260212215814.629709-3-tjmercier@google.com>
 <aZRAkalnJCxSp7ne@amir-ThinkPad-T480> <CABdmKX3wsWphRTDanKwGGiUWoO0xTaC8L_QxjHzhpxfZn256MQ@mail.gmail.com>
In-Reply-To: <CABdmKX3wsWphRTDanKwGGiUWoO0xTaC8L_QxjHzhpxfZn256MQ@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Tue, 17 Feb 2026 22:25:01 +0100
X-Gm-Features: AaiRm51TQrPoY4M1hB7zomqcMjNss-PCU-arAe40VL9qb1hRq1aV4JYHGiHMROc
Message-ID: <CAOQ4uxgrP=VdTKZXKcRE8BeWv6wZy7aFkUF-VoEpRSxVnHZi2w@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 9:26=E2=80=AFPM T.J. Mercier <tjmercier@google.com>=
 wrote:
>
> On Tue, Feb 17, 2026 at 2:19=E2=80=AFAM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Thu, Feb 12, 2026 at 01:58:13PM -0800, T.J. Mercier wrote:
> > > Currently some kernfs files (e.g. cgroup.events, memory.events) suppo=
rt
> > > inotify watches for IN_MODIFY, but unlike with regular filesystems, t=
hey
> > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > removed.
> > >
> > > This creates a problem for processes monitoring cgroups. For example,=
 a
> > > service monitoring memory.events for memory.high breaches needs to kn=
ow
> > > when a cgroup is removed to clean up its state. Where it's known that=
 a
> > > cgroup is removed when all processes die, without IN_DELETE_SELF the
> > > service must resort to inefficient workarounds such as:
> > > 1.  Periodically scanning procfs to detect process death (wastes CPU =
and
> > >     is susceptible to PID reuse).
> > > 2.  Placing an additional IN_DELETE watch on the parent directory
> > >     (wastes resources managing double the watches).
> > > 3.  Holding a pidfd for every monitored cgroup (can exhaust file
> > >     descriptors).
> > >
> > > This patch enables kernfs to send IN_DELETE_SELF and IN_IGNORED event=
s.
> > > This allows applications to rely on a single existing watch on the fi=
le
> > > of interest (e.g. memory.events) to receive notifications for both
> > > modifications and the eventual removal of the file, as well as automa=
tic
> > > watch descriptor cleanup, simplifying userspace logic and improving
> > > resource efficiency.
> >
> > This looks very useful,
> > But,
> > How will the application know that ti can rely on IN_DELETE_SELF
> > from cgroups if this is not an opt-in feature?
> >
> > Essentially, this is similar to the discussions on adding "remote"
> > fs notification support (e.g. for smb) and in those discussions
> > I insist that "remote" notification should be opt-in (which is
> > easy to do with an fanotify init flag) and I claim that mixing
> > "remote" events with "local" events on the same group is undesired.
>
> I think this situation is a bit different because this isn't adding
> new features to fsnotify. This is filling a gap that you'd expect to
> work if you only read the cgroups or inotify documentation without
> realizing that kernfs is simply wired up differently for notification
> support than most other filesystems, and only partially supports the
> existing notification events. It's opt-in in the sense that an
> application registers for IN_DELETE_SELF, but other than a runtime
> test like what I added in the selftests I'm not sure if there's a good
> way to detect the kernel will actually send the event. Practically
> speaking though, if merged upstream I will backport these patches to
> all the kernels we use so a runtime check shouldn't be necessary for
> our applications.
>

That's besides the point.
An application does not know if it running on a kernel with the backported
patch or not, so an application needs to either rely on getting the event
or it has to poll. How will the application know if it needs to poll or not=
?

> > However, IN_IGNORED is created when an inotify watch is removed
> > and IN_DELETE_SELF is called when a vfs inode is destroyed.
> > When setting an inotify watch for IN_IGNORED|IN_DELETE_SELF there
> > has to be a vfs inode with inotify mark attached, so why are those
> > events not created already? What am I missing?
>
> The difference is vfs isn't involved when kernfs files are unlinked.

No, but the vfs is involved when the last reference on the kernfs inode
is dropped.

> When a cgroup removal occurs, we get to kernfs_remove via kernfs'
> inode_operations without calling vfs_unlink. (You can't rm cgroup
> files directly.)
>

Yes and if there was a vfs inode for this kernfs object, the vfs inode need=
s to
be dropped.

> > Are you expecting to get IN_IGNORED|IN_DELETE_SELF on an entry
> > while watching the parent? Because this is not how the API works.
>
> No, only on the file being watched. The parent should only get
> IN_DELETE, but I read your feedback below and I'm fine with removing
> that part and just sending the DELETE_SELF and IN_IGNORED events.
>

So if the file was being watched, some application needed to call
inotify_add_watch() with the user path to the cgroupfs inode
and inotify watch keeps a live reference to this vfs inode.

When the cgroup is being destroyed something needs to drop
this vfs inode and call __destroy_inode() -> fsnotify_inode_delete()
which should remove the inotify watch and result in IN_IGNORED.
IN_DELETE_SELF is a different story, because the inode does not
have zero i_nlink.

I did not try to follow the code path of cgroupfs destroy when an
inotify watch on a cgroup file exists, but this is what I expect.
Please explain - what am I missing?

> > I think it should be possible to set a super block fanotify watch
> > on cgroupfs and get all the FAN_DELETE_SELF events, but maybe we
> > do not allow this right now, I did not check - just wanted to give
> > you another direction to follow.
> >
> > >
> > > Implementation details:
> > > The kernfs notification worker is updated to handle file deletion.
> > > fsnotify handles sending MODIFY events to both a watched file and its
> > > parent, but it does not handle sending a DELETE event to the parent a=
nd
> > > a DELETE_SELF event to the watched file in a single call. Therefore,
> > > separate fsnotify calls are made: one for the parent (DELETE) and one
> > > for the child (DELETE_SELF), while retaining the optimized single cal=
l
> >
> > IN_DELETE_SELF and IN_IGNORED are special and I don't really mind addin=
g
> > them to kernfs seeing that they are very useful, but adding IN_DELETE
> > without adding IN_CREATE, that is very arbitrary and I don't like it as
> > much.
>
> That's fair, and the IN_DELETE isn't actually needed for my use case,
> but I figured I would add the parent notification for file deletions
> since it is already there for MODIFY events, and I was modifying that
> area of the code anyway. I'll remove the parent notification for
> DELETE and just send DELETE_SELF and IGNORED with
> fsnotify_inoderemove() in V3.

I do not object to adding explicit IN_DELETE_SELF, especially
because that would be usable also in fanotify, but I'd like to
understand what's the story with IN_IGNORED.

Thanks,
Amir.
