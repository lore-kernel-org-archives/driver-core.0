Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB3E9313E39
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 23:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771370022; cv=pass; b=b4QAa3U6HHcqSozNOwcEUup7nXRFQrGIXcbPQV01peWfWtPA05ZmmRf/4aRkEO7+A7Me6Weq1QS1IztZeNSK/a6fHkwMfLaYx6SoEmRlL7G1ul+U2vW2pAj4BpSLrcTm2/6plRdoVXFaHOKLiIPGL5t4WH8GiSlwu7BiQGsxm6I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771370022; c=relaxed/simple;
	bh=r79iQhNrRyLXah4G9YOSWVaBuc5LQcACm1x/uvKMWos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CSJ70ExWsGDrNh1QO+VrZvGCTpo8sqf03SjUQD8gcj17H+bTE6Iu/iLewotLJrrxE2glmgpa9hao9sWvyrNVBATkuYLN/KdJCgWTNrHlqzgJsi1Oo4fJq8QdgEtJGfmz54Ye/pT9WwFMWgGe3mf1rsb/3OpxLGpaKKHzlqWNIw4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WW7Ts7Bb; arc=pass smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WW7Ts7Bb"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b885a18f620so166389066b.3
        for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 15:13:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771370019; cv=none;
        d=google.com; s=arc-20240605;
        b=Eqs4+l0CO7/8ZnH6XqnJCvT/E1ZqZVFUZGktQe8Yg1JlTN9TFcFzeV4Iins7j+L9lF
         EsVZE9yJ1oAXW39lTrRm/hReAUPkGznVXhsOwTH4WqTJSkska7eI06g/iiCT2U9wODTY
         Vkgzqd+QRQuPUSkXYb1cfawZwL7DIv9C0+VhldgejjCeHBViisghYB9iqpA+ONKIchRs
         HowPLMZCMWIT+xmExPLoGfd7J9D1mv7tkW6ikRpAp6/6o79DZpIwtfg57ECi07mzMXMp
         69Iv7pb2n+rp3X/23LDedNoduj/9KaFktxn15ieDhVJOu+8scwKILLrHzvmWM1k16n89
         J43Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lBoiDccagGFr7t/Rdt9JIQl1MV82SoTCGhUB9Q/6K18=;
        fh=Cba7bcQv9fMP/O1/oErk3vVL/ge02JkW1DG84AD3KP4=;
        b=kMoKBn3ZGDMGPEXJlqSYwl7eiUBPckvz9XGhc2ZZKJKjHVENCdbzYWByaBFjgqndNg
         uNOoQkCNJfg3w7Zqci47+98EURVN56Ssjfe/4xkd/Pp7vpl85NOTNcMyG52+OA8liPF0
         vkkUcdU/0SXTsT4cJwXPQfSaGUOopSIgMOupHEGLT40Hilmz4yFp8ZxRx6+wX9VROhcE
         A+wqmtyDoMBsd/M9SkV0XvvCj74sRQU5jYImkC+9+1yQcnKq3pD/ANrpnfbbGjWGU3IV
         1nR4EuO2bAVycSrtDa9cdqk0NG3NM4FeIulG7vIExDGXEHUBJ3an5HurYXTwa7s2ZK6C
         wcKA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771370019; x=1771974819; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lBoiDccagGFr7t/Rdt9JIQl1MV82SoTCGhUB9Q/6K18=;
        b=WW7Ts7BbsQ51pMhcl5OwJk5VYebILfAvcMniB1+CTxpbVd21SpaOY1LDaOYsv3o1kz
         XupCvORS3S8g0oRiK3aCTHH6uJlcCyC4AoHCIPL5zyYln58no5Lv4mu8EApSLpDB1VI1
         uTQoMKRfYYPTpQEnUTK7bgquJuiSDLaLXFEYv1jcdVfIbT8k6Yu+GIXOTPLzhnBdk51Q
         omPrcqvk4U5xjTY6kstw0G4CwjvukdZww1XhST4iYWwjLfSAd1qG4ZRDJvKcmGgxdloB
         UdUBzoBBvCGSWNPzKr9NlayuBj/ir4hZ0gTkIiJzZyaoroHOB3lxARyJEXlAD8B4MUB2
         RANA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771370019; x=1771974819;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lBoiDccagGFr7t/Rdt9JIQl1MV82SoTCGhUB9Q/6K18=;
        b=PIa/0lkPr7rwIvs4IaiCC9hxD7gSCgMTHq7G3+CkHtzZtz3w19dl3+UZDGK0/0KXKz
         yvlD+RgxSEPTCuFJyU+LNmc/YmfCaY0lJIAVrjJeSGja9qNjYy1S9IRHPb3RjV50g07b
         9dpsU8x3rPkaUjoHSROm94cf95nweu996XzAzOk2CMWrdY/UvkIzwDQwFyyhZnLzSiIe
         fl1cBnFrxJ3UMI4GXnx+SpWn5Moxy1O6CvNQm/zMsgvPk1Ja2aUePBKYQVi80IkLb3Gc
         6VAtERSyh6GYnN1lXQTjTYeCkOGx+GrJFMMWDncWNBG5DrspjIsEMp1euCj8tJW6dP/g
         6UGA==
X-Forwarded-Encrypted: i=1; AJvYcCVf+eJNqaFJ/7/PMqWiUWg3hr7g77zc+BiotcoHWWx8uM9lRWUtsnPXYPbJ03MCrtYWRJ0cmptN77l59g==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw5bKVABoA+Jclu8fvdphYBz2ukw8dVvSvN5V8iPZU6T58YTezq
	ozAyxaiB5Jl0I8KEPRQvpk1TUJL7rV20kPuygCQdnEOQCgsAngU2GljhMUIvTQDYKh14lM2YMuG
	ppG/Uhq3V1HRtTwjPWv+jPUqIlb1S4dE=
X-Gm-Gg: AZuq6aL8ZlJWnKmi5I33lHqYB4SMmSyu6em34tnyt182qNzKlfJZ6//NyITMPWpI1xm
	+Dn/rOgPY42ng481ExfFxS3ogOzg76AfVz5chtMa5FhmJiyBW+eotg/hqLn+43XYWPBkuF1WCqh
	xFmd2KciyEYs4PCvo8/FT6s8d6nrCCHXpApn1eNt5k1a6hKuPub1Mfqez9AGgywhu/yEg4HE/12
	jQYIbYl6gx1KWtXnhjeqpmeVe6Q+FoxasF376Cvq1x/aKrv6XqWFbul02fpXbOO+E9ed1zlDXqh
	nHIclcik
X-Received: by 2002:a17:907:9808:b0:b90:48b:b53c with SMTP id
 a640c23a62f3a-b90048bb667mr408965466b.32.1771370018919; Tue, 17 Feb 2026
 15:13:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260212215814.629709-1-tjmercier@google.com> <20260212215814.629709-3-tjmercier@google.com>
 <aZRAkalnJCxSp7ne@amir-ThinkPad-T480> <CABdmKX3wsWphRTDanKwGGiUWoO0xTaC8L_QxjHzhpxfZn256MQ@mail.gmail.com>
 <CAOQ4uxgrP=VdTKZXKcRE8BeWv6wZy7aFkUF-VoEpRSxVnHZi2w@mail.gmail.com> <CABdmKX1ztzJ6B13uzdDtN-uVWbdWuYJ6PMvjGoAfu40MMHCpaA@mail.gmail.com>
In-Reply-To: <CABdmKX1ztzJ6B13uzdDtN-uVWbdWuYJ6PMvjGoAfu40MMHCpaA@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Wed, 18 Feb 2026 00:13:26 +0100
X-Gm-Features: AaiRm52hU7QfH-Wv9-Iuqet313dBf2qvcHaBiSfPSpB5qXd2EOgSyRj8MoDjcQo
Message-ID: <CAOQ4uxijd+viTGvQ8Mn1sLMH7dk1cGUmyU_n4HfW5Pg4FLLRPg@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: "T.J. Mercier" <tjmercier@google.com>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, jack@suse.cz, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 12:32=E2=80=AFAM T.J. Mercier <tjmercier@google.com=
> wrote:
>
> On Tue, Feb 17, 2026 at 1:25=E2=80=AFPM Amir Goldstein <amir73il@gmail.co=
m> wrote:
> >
> > On Tue, Feb 17, 2026 at 9:26=E2=80=AFPM T.J. Mercier <tjmercier@google.=
com> wrote:
> > >
> > > On Tue, Feb 17, 2026 at 2:19=E2=80=AFAM Amir Goldstein <amir73il@gmai=
l.com> wrote:
> > > >
> > > > On Thu, Feb 12, 2026 at 01:58:13PM -0800, T.J. Mercier wrote:
> > > > > Currently some kernfs files (e.g. cgroup.events, memory.events) s=
upport
> > > > > inotify watches for IN_MODIFY, but unlike with regular filesystem=
s, they
> > > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > > > removed.
> > > > >
> > > > > This creates a problem for processes monitoring cgroups. For exam=
ple, a
> > > > > service monitoring memory.events for memory.high breaches needs t=
o know
> > > > > when a cgroup is removed to clean up its state. Where it's known =
that a
> > > > > cgroup is removed when all processes die, without IN_DELETE_SELF =
the
> > > > > service must resort to inefficient workarounds such as:
> > > > > 1.  Periodically scanning procfs to detect process death (wastes =
CPU and
> > > > >     is susceptible to PID reuse).
> > > > > 2.  Placing an additional IN_DELETE watch on the parent directory
> > > > >     (wastes resources managing double the watches).
> > > > > 3.  Holding a pidfd for every monitored cgroup (can exhaust file
> > > > >     descriptors).
> > > > >
> > > > > This patch enables kernfs to send IN_DELETE_SELF and IN_IGNORED e=
vents.
> > > > > This allows applications to rely on a single existing watch on th=
e file
> > > > > of interest (e.g. memory.events) to receive notifications for bot=
h
> > > > > modifications and the eventual removal of the file, as well as au=
tomatic
> > > > > watch descriptor cleanup, simplifying userspace logic and improvi=
ng
> > > > > resource efficiency.
> > > >
> > > > This looks very useful,
> > > > But,
> > > > How will the application know that ti can rely on IN_DELETE_SELF
> > > > from cgroups if this is not an opt-in feature?
> > > >
> > > > Essentially, this is similar to the discussions on adding "remote"
> > > > fs notification support (e.g. for smb) and in those discussions
> > > > I insist that "remote" notification should be opt-in (which is
> > > > easy to do with an fanotify init flag) and I claim that mixing
> > > > "remote" events with "local" events on the same group is undesired.
> > >
> > > I think this situation is a bit different because this isn't adding
> > > new features to fsnotify. This is filling a gap that you'd expect to
> > > work if you only read the cgroups or inotify documentation without
> > > realizing that kernfs is simply wired up differently for notification
> > > support than most other filesystems, and only partially supports the
> > > existing notification events. It's opt-in in the sense that an
> > > application registers for IN_DELETE_SELF, but other than a runtime
> > > test like what I added in the selftests I'm not sure if there's a goo=
d
> > > way to detect the kernel will actually send the event. Practically
> > > speaking though, if merged upstream I will backport these patches to
> > > all the kernels we use so a runtime check shouldn't be necessary for
> > > our applications.
> > >
> >
> > That's besides the point.
> > An application does not know if it running on a kernel with the backpor=
ted
> > patch or not, so an application needs to either rely on getting the eve=
nt
> > or it has to poll. How will the application know if it needs to poll or=
 not?
>
> Either by testing for the behavior at runtime like I mentioned, or by
> depending on certification testing for the platform the application is
> running on which would verify that the selftests I added pass. We do
> the former to check for the presence of other features like swappiness
> support with memory.reclaim, and also the latter for all devices.
>
> > > > However, IN_IGNORED is created when an inotify watch is removed
> > > > and IN_DELETE_SELF is called when a vfs inode is destroyed.
> > > > When setting an inotify watch for IN_IGNORED|IN_DELETE_SELF there
> > > > has to be a vfs inode with inotify mark attached, so why are those
> > > > events not created already? What am I missing?
> > >
> > > The difference is vfs isn't involved when kernfs files are unlinked.
> >
> > No, but the vfs is involved when the last reference on the kernfs inode
> > is dropped.
> >
> > > When a cgroup removal occurs, we get to kernfs_remove via kernfs'
> > > inode_operations without calling vfs_unlink. (You can't rm cgroup
> > > files directly.)
> > >
> >
> > Yes and if there was a vfs inode for this kernfs object, the vfs inode =
needs to
> > be dropped.
>
> It should be, but it isn't right now.
>
> > > > Are you expecting to get IN_IGNORED|IN_DELETE_SELF on an entry
> > > > while watching the parent? Because this is not how the API works.
> > >
> > > No, only on the file being watched. The parent should only get
> > > IN_DELETE, but I read your feedback below and I'm fine with removing
> > > that part and just sending the DELETE_SELF and IN_IGNORED events.
> > >
> >
> > So if the file was being watched, some application needed to call
> > inotify_add_watch() with the user path to the cgroupfs inode
> > and inotify watch keeps a live reference to this vfs inode.
> >
> > When the cgroup is being destroyed something needs to drop
> > this vfs inode and call __destroy_inode() -> fsnotify_inode_delete()
> > which should remove the inotify watch and result in IN_IGNORED.
>
> Nothing like this exists before this patch.
>
> > IN_DELETE_SELF is a different story, because the inode does not
> > have zero i_nlink.
> >
> > I did not try to follow the code path of cgroupfs destroy when an
> > inotify watch on a cgroup file exists, but this is what I expect.
> > Please explain - what am I missing?
>
> Yes that's the problem here. The inode isn't dropped unless the watch
> is removed, and the watch isn't removed because kernfs doesn't go
> through vfs to notify about file removal. There is nothing to trigger
> dropping the watch and the associated inode reference except this
> patch calling into fsnotify_inoderemove which both sends
> IN_DELETE_SELF and calls __fsnotify_inode_delete for the IN_IGNORED
> and inode cleanup.
>
> Without this, the watch and inode persist after file deletion until
> the process exits and file descriptors are cleaned up, or until
> inotify_rm_watch gets called manually.
>

Yeh, that's not good.
Will be happy to see that fixed.

Thanks,
Amir.
