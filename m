Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA7D22D5C6C
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 22:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771367561; cv=pass; b=LhVD0uOEY/Bm/ZJ3lEfL0196qUHzIW7m9jmXoNAK0Q5L3X2wZFFcDnqugbEzpyLcVXo/ZHLBiQLwSKuhR3c/w9xfHYdAwMOf2+w6oMPdO8ammzHYIue22YZl1Bi3+K0Ngn+MjabToSqI2wPcfdpd/PfF/A0EKqSMdQljj26uxGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771367561; c=relaxed/simple;
	bh=tyLWulTPYAWC5On0WxerMjv6uLHBMLdwWxyRIQpmlzc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FyD5IHZVf4vohbBZpEbkuWAUvlSDSm3GMf5eOmPcLlt/UDCOPN9S8lN0lwk3szk4fc0n0gpnW5kXYXMVWhgE6ZkvSr8c379IhMc72tZyXYj3lh7nk6Wx9KuoW56+LGHAQZt8ABZAn0VQDQ9mNRAG+1CrJZe5W1BVS1ziFVjyHMs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XRzp5mUP; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XRzp5mUP"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48371d2f661so10845e9.1
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 14:32:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771367558; cv=none;
        d=google.com; s=arc-20240605;
        b=hZdqa9KuNKzfqk4ZhtV062rY5kwYDSMNro05DYyEpnYHfYN+TstkilfNkvb380bhzG
         wHnvKYZNzKX8RFmuCVa7hUD9x3My841njPHssRG26eVsnikrcRPsfyN5iy3HZ2gLxeR5
         Zv5J/czMtrrrZkMvhkriC0j3TGQ4aDuycihznc2EVQ5osD2gaEH3QftrjRNJonxG6YL9
         5la60ocpl1kO+ygwqE61wao34sKmeJJ6FVWiOafoLxrqBdhWC0kNzD4BISKu3wAxqvQ+
         2RYuOQXxcmGSDJBbJkVHsKxAe4nJSATs2AUsUdr8oDi0WiJCAIAffyE04/PHrjwvDPXU
         M1cw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=PZgh3X22+q3SSfXDKP9Q8wPN8AleeftUpwOLeBQmvDs=;
        fh=xOCtW8BrMmubeknqg5QcGHIuraVmPLbvQ5eP2rvQ7xw=;
        b=fXMXLbcjsJX1VipwpCWLJKsdMGJavbefJHx8waEYvrgaeZKowatAIAhkKyFsz/+0i+
         xUG6OVFU9lPlAkPknZvQizVbLAOcHeD1NxbzNsFKeJEZMNUq3+kzlvGCN8eGgw1kHV9T
         TZZOfjWFPXiu6ypD/jK0tO6KXh6jBPPnL99hWupoPHWwq2qpJSpdfcQ0xFN/RndWBnAS
         W88AFmK8JuzH2SI8T/KrhefL4q+Wv33GwMQQJ5Ob553y8u2nE2+fmhtdwUtxaTdID062
         ObTs1+VIwt0iY4hAogm2n/ykJwW+Ir4tQIjEfu0LlUkRVj2vYh9kY0/1k1+7jsAXj5R2
         3xOg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771367558; x=1771972358; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PZgh3X22+q3SSfXDKP9Q8wPN8AleeftUpwOLeBQmvDs=;
        b=XRzp5mUPy+hbQTuK/3G0Ntmmk5qNysbFgdV6fw0ELNj0/XxdKhFeYV6/XAzbiDblep
         4SGhc3l2ak9URGXKDTpwwrv++l5a5AEaiFhv9eTdqbBmNTF8MQt9UYYB1x7iByWi6mmD
         A/xoxgkwgHfb5dtcRQRl51+DG/yxYjIO5T6cmogjIo5H68HH90UciWzWf8FlZFzN38Dp
         RQAOQLQyqIbyxeaKtqlwxP621e7Q7K0xHqfE/5LI1l64PbJulrY5pOOP/osFyJznqVW8
         RfcUSEe8OaaM3SgcXp+zdjIRqq3p3/tvf3pH8PFG4JWAwfqM4JsCa8DKdSy9Pc+hDSLI
         5PQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771367558; x=1771972358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=PZgh3X22+q3SSfXDKP9Q8wPN8AleeftUpwOLeBQmvDs=;
        b=VJhKITchtEgVXYLAxsxS+e5Vh4wJWfonVgYLMc3LVjvwLXu6RF86OaLs+j9mhoWnka
         fa9W2RgtZxmkh2QsWIqGZHizDcE8mQSJLQJ1T0NthC0k5Y7GC+5O7F+ZHvzj/gfFOjhP
         9mmf7SM0RN0tt2P1u0yRbsF0Zd6uexBL9gG23aVcCI2w5shvv+MWFcSbrcIAmaSUhktn
         FRkIg3bMH55duVIDZnWpDpuveDcvmFy76v9k5qyvzvkwilxEoPmzD6bqclAhFEoKz9jk
         z8lXmJWkTSx6hFIblUBsfKDJ4S604CWC1yClBVaT4Tg+TRMCxxF/v0ML4gOAyASwCM0w
         tLmA==
X-Forwarded-Encrypted: i=1; AJvYcCUZyT8016aqhqinp//1Uno1wD49/uEw/SiQSjft7ahZ6eJoIy2g82aQFffjNKrgPLvy2og6MZt/hrWCyw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy00gTDD26h67a7rk3aOVwfXu3eup1srJl5GsY1yimxpBWmu1Oi
	N1uUCBAi+5GP2kDU9ufk78TyZ13ps0XFsY5OydGqlcH8B3pDMB1YhnBOmrfPBnU2JhM8D6cT6VQ
	T49SlAfXaQ02hF9/X+qXv8JVPbGilqomZuCgkFzT9
X-Gm-Gg: AZuq6aL882t6vUHQzOS1akcJhZ385Xq28+oamDyZ+VgCu4lpguY/xGXqpI39Tv5BVEp
	Ej46N4Qbp/Pr+eULN++s22DHfyY4nL3wtuusmQj/EQKV9fagsq/5RRZAZSngKoNz4xlrelYZtHB
	nReI53WIX/ps8Wi42N8L7KIKxZ+oD/35VTgOw9cbzJ1hNvL34pQvY5chWAi1uqfTVt5G6QfZg+Y
	fE2U0oQgleS5d/zbLrBYixFBYP32MHlMBbq81kzbG2ZdhqFktj6o6TPivBhaTYNeT5E+QVjxEM3
	8tbFt7AFBYWeUb66adpjh//s8GZWrv6WSd+YHphhMmtwNsKmiEIt3FSaDh0/6Zzo5J5Vag==
X-Received: by 2002:a05:600c:8b61:b0:477:86fd:fb1b with SMTP id
 5b1f17b1804b1-48398c19fdamr325e9.11.1771367557747; Tue, 17 Feb 2026 14:32:37
 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <20260212215814.629709-3-tjmercier@google.com>
 <aZRAkalnJCxSp7ne@amir-ThinkPad-T480> <CABdmKX3wsWphRTDanKwGGiUWoO0xTaC8L_QxjHzhpxfZn256MQ@mail.gmail.com>
 <CAOQ4uxgrP=VdTKZXKcRE8BeWv6wZy7aFkUF-VoEpRSxVnHZi2w@mail.gmail.com>
In-Reply-To: <CAOQ4uxgrP=VdTKZXKcRE8BeWv6wZy7aFkUF-VoEpRSxVnHZi2w@mail.gmail.com>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Tue, 17 Feb 2026 14:32:25 -0800
X-Gm-Features: AaiRm52ioB3yC-2XCNzG1OujfUKMHheOLnjYrqdZdEBKlcd4a_WIoA6uKbp4XL4
Message-ID: <CABdmKX1ztzJ6B13uzdDtN-uVWbdWuYJ6PMvjGoAfu40MMHCpaA@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Amir Goldstein <amir73il@gmail.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 17, 2026 at 1:25=E2=80=AFPM Amir Goldstein <amir73il@gmail.com>=
 wrote:
>
> On Tue, Feb 17, 2026 at 9:26=E2=80=AFPM T.J. Mercier <tjmercier@google.co=
m> wrote:
> >
> > On Tue, Feb 17, 2026 at 2:19=E2=80=AFAM Amir Goldstein <amir73il@gmail.=
com> wrote:
> > >
> > > On Thu, Feb 12, 2026 at 01:58:13PM -0800, T.J. Mercier wrote:
> > > > Currently some kernfs files (e.g. cgroup.events, memory.events) sup=
port
> > > > inotify watches for IN_MODIFY, but unlike with regular filesystems,=
 they
> > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > > removed.
> > > >
> > > > This creates a problem for processes monitoring cgroups. For exampl=
e, a
> > > > service monitoring memory.events for memory.high breaches needs to =
know
> > > > when a cgroup is removed to clean up its state. Where it's known th=
at a
> > > > cgroup is removed when all processes die, without IN_DELETE_SELF th=
e
> > > > service must resort to inefficient workarounds such as:
> > > > 1.  Periodically scanning procfs to detect process death (wastes CP=
U and
> > > >     is susceptible to PID reuse).
> > > > 2.  Placing an additional IN_DELETE watch on the parent directory
> > > >     (wastes resources managing double the watches).
> > > > 3.  Holding a pidfd for every monitored cgroup (can exhaust file
> > > >     descriptors).
> > > >
> > > > This patch enables kernfs to send IN_DELETE_SELF and IN_IGNORED eve=
nts.
> > > > This allows applications to rely on a single existing watch on the =
file
> > > > of interest (e.g. memory.events) to receive notifications for both
> > > > modifications and the eventual removal of the file, as well as auto=
matic
> > > > watch descriptor cleanup, simplifying userspace logic and improving
> > > > resource efficiency.
> > >
> > > This looks very useful,
> > > But,
> > > How will the application know that ti can rely on IN_DELETE_SELF
> > > from cgroups if this is not an opt-in feature?
> > >
> > > Essentially, this is similar to the discussions on adding "remote"
> > > fs notification support (e.g. for smb) and in those discussions
> > > I insist that "remote" notification should be opt-in (which is
> > > easy to do with an fanotify init flag) and I claim that mixing
> > > "remote" events with "local" events on the same group is undesired.
> >
> > I think this situation is a bit different because this isn't adding
> > new features to fsnotify. This is filling a gap that you'd expect to
> > work if you only read the cgroups or inotify documentation without
> > realizing that kernfs is simply wired up differently for notification
> > support than most other filesystems, and only partially supports the
> > existing notification events. It's opt-in in the sense that an
> > application registers for IN_DELETE_SELF, but other than a runtime
> > test like what I added in the selftests I'm not sure if there's a good
> > way to detect the kernel will actually send the event. Practically
> > speaking though, if merged upstream I will backport these patches to
> > all the kernels we use so a runtime check shouldn't be necessary for
> > our applications.
> >
>
> That's besides the point.
> An application does not know if it running on a kernel with the backporte=
d
> patch or not, so an application needs to either rely on getting the event
> or it has to poll. How will the application know if it needs to poll or n=
ot?

Either by testing for the behavior at runtime like I mentioned, or by
depending on certification testing for the platform the application is
running on which would verify that the selftests I added pass. We do
the former to check for the presence of other features like swappiness
support with memory.reclaim, and also the latter for all devices.

> > > However, IN_IGNORED is created when an inotify watch is removed
> > > and IN_DELETE_SELF is called when a vfs inode is destroyed.
> > > When setting an inotify watch for IN_IGNORED|IN_DELETE_SELF there
> > > has to be a vfs inode with inotify mark attached, so why are those
> > > events not created already? What am I missing?
> >
> > The difference is vfs isn't involved when kernfs files are unlinked.
>
> No, but the vfs is involved when the last reference on the kernfs inode
> is dropped.
>
> > When a cgroup removal occurs, we get to kernfs_remove via kernfs'
> > inode_operations without calling vfs_unlink. (You can't rm cgroup
> > files directly.)
> >
>
> Yes and if there was a vfs inode for this kernfs object, the vfs inode ne=
eds to
> be dropped.

It should be, but it isn't right now.

> > > Are you expecting to get IN_IGNORED|IN_DELETE_SELF on an entry
> > > while watching the parent? Because this is not how the API works.
> >
> > No, only on the file being watched. The parent should only get
> > IN_DELETE, but I read your feedback below and I'm fine with removing
> > that part and just sending the DELETE_SELF and IN_IGNORED events.
> >
>
> So if the file was being watched, some application needed to call
> inotify_add_watch() with the user path to the cgroupfs inode
> and inotify watch keeps a live reference to this vfs inode.
>
> When the cgroup is being destroyed something needs to drop
> this vfs inode and call __destroy_inode() -> fsnotify_inode_delete()
> which should remove the inotify watch and result in IN_IGNORED.

Nothing like this exists before this patch.

> IN_DELETE_SELF is a different story, because the inode does not
> have zero i_nlink.
>
> I did not try to follow the code path of cgroupfs destroy when an
> inotify watch on a cgroup file exists, but this is what I expect.
> Please explain - what am I missing?

Yes that's the problem here. The inode isn't dropped unless the watch
is removed, and the watch isn't removed because kernfs doesn't go
through vfs to notify about file removal. There is nothing to trigger
dropping the watch and the associated inode reference except this
patch calling into fsnotify_inoderemove which both sends
IN_DELETE_SELF and calls __fsnotify_inode_delete for the IN_IGNORED
and inode cleanup.

Without this, the watch and inode persist after file deletion until
the process exits and file descriptors are cleaned up, or until
inotify_rm_watch gets called manually.

> > > I think it should be possible to set a super block fanotify watch
> > > on cgroupfs and get all the FAN_DELETE_SELF events, but maybe we
> > > do not allow this right now, I did not check - just wanted to give
> > > you another direction to follow.
> > >
> > > >
> > > > Implementation details:
> > > > The kernfs notification worker is updated to handle file deletion.
> > > > fsnotify handles sending MODIFY events to both a watched file and i=
ts
> > > > parent, but it does not handle sending a DELETE event to the parent=
 and
> > > > a DELETE_SELF event to the watched file in a single call. Therefore=
,
> > > > separate fsnotify calls are made: one for the parent (DELETE) and o=
ne
> > > > for the child (DELETE_SELF), while retaining the optimized single c=
all
> > >
> > > IN_DELETE_SELF and IN_IGNORED are special and I don't really mind add=
ing
> > > them to kernfs seeing that they are very useful, but adding IN_DELETE
> > > without adding IN_CREATE, that is very arbitrary and I don't like it =
as
> > > much.
> >
> > That's fair, and the IN_DELETE isn't actually needed for my use case,
> > but I figured I would add the parent notification for file deletions
> > since it is already there for MODIFY events, and I was modifying that
> > area of the code anyway. I'll remove the parent notification for
> > DELETE and just send DELETE_SELF and IGNORED with
> > fsnotify_inoderemove() in V3.
>
> I do not object to adding explicit IN_DELETE_SELF, especially
> because that would be usable also in fanotify, but I'd like to
> understand what's the story with IN_IGNORED.
>
> Thanks,
> Amir.
>
