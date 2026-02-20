Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 618FC32AABD
	for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 17:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771607771; cv=pass; b=aFgcEO7LiV4nldOgwOy8E1B/lWFCr8pOamfO6+HcxYu/E+MIK+ZcWCc4Ih7jEdWAv0IliqTPSRrWFnZ0RHXD1MIFtRTGL5xX4GdwRdK+dbmvwp5n6cVgAjWsB0DAcjVQWBHmRbkiOm+X0mlLl5KOILfWmvwFZVyjLOEpqtbBa/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771607771; c=relaxed/simple;
	bh=qUpADLv3fW4c6VKkfzK/U52QH49WpAV8Od6WUnTJ06g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fF6Wob3DHtggsmnB1WruKAgF7cUiUPS/Ohrl5EMrozGSx/6BRbbX7fYvT5t7aBI2tS//k/uy7FfQrqjR5WLNJhShzPZWjhNK9XntKUUvLQ3tzvCEj6/948bTIkXR26cmQMMionp6T11fs6q/POg6nf+xWz6vbP8QujzkZ46mGVI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Hgd9ncFM; arc=pass smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Hgd9ncFM"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-65baa72399fso3108727a12.0
        for <driver-core@lists.linux.dev>; Fri, 20 Feb 2026 09:16:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771607769; cv=none;
        d=google.com; s=arc-20240605;
        b=OaoyX9StE8BvxbswZgB2ACY0bJckmD/CTh9fIQzU8CZfckEL0Hb5QYhpyZTu0l1Q9o
         Kf5I3OG3gwn9qV68DaEFrpMAYUrpUzSMEAaEmp0AxB4UbbyCcutGJBH9YbSe91F+P2xt
         gB5nQqIwII3WMTiA+r8upOhCpzEPFCMlyAl3i/05Kwz4DMKSepE1iBM3oCZ9wm+DZiSL
         YNO+6r+YNyQyS7i/4HdbB2IpCp39qP0szu/tKbgFRt2KVOszXRJgsVT0IOXZ2S9hUB1p
         hSarNK7632P2wMFhBN4/5+qrm8JEBRDc6CaYdMX+C/EouOwBFZahfcqR5VCdWbvXpx5s
         Qr0Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+FIG9q/M+yTBjTrAHAw7SaWHpsPSmQOUIDS7bx4BpBE=;
        fh=30/ndgcQlBTijYGeKEAET+2SOFrfqGu0KqAtEokyU2E=;
        b=EjT3NQFjKUB6hBdpan8o99a1Q8bm7X702P07vt2odUrSORJQA4FBESDrdA7fqOsdAj
         jhb/u1PIScyd8qtkKF7ofgp3uYK44IbFLw2chA4SXhANESoDvK9z7rm5KYGXyhQ47QRk
         bDYk3YF48gv6n94DkcW0ajcp3g6iKNMvR+5q8zQmOs5GObB3TwIR3H7X4+e9vPshElc0
         IKSCGngXglSfg1nqK6QMK/9FuWyMLxlyu6v4+WD6xCxiJCDzPkjhC0hQrho8mBP1NpPQ
         9bXhoRLudJHtVRYzVmQwVnR+Gc7OjMg8V9tQE0pbkU5Yepytebt9gRlRrt86oqTcZamV
         RnZg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771607769; x=1772212569; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+FIG9q/M+yTBjTrAHAw7SaWHpsPSmQOUIDS7bx4BpBE=;
        b=Hgd9ncFMo8aqf61+MrgXVzs+ZggMoeMk1Le1KxlkbVZESzbH0t3se53P1IkYBIxxa2
         hdDezCnh4vxrOxcXJdEbuK7lNDSp6H0nOJwVpdp06vd4qi2TdhrUUNpfuSBdLcO+ff6L
         a75K2BP4uLyDq0x0H+USIi5p5GIJ0ePaeMncTTJKtXU38a/cnnq6khIh37+xfqblOCuQ
         3nZQL/fiyVtPxGBVGM9mG7oFYcFCfhT3BQhClf5lz17y2YTtovMS2Cntj23wBVP0AbnX
         R6iA6lqXcVfLPC2oKicPppZBN5oa7R21gEMJNjWfFrwlNBS9PtrB26mKH1+8WgjE385d
         mLew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771607769; x=1772212569;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+FIG9q/M+yTBjTrAHAw7SaWHpsPSmQOUIDS7bx4BpBE=;
        b=UjbEl5kw0JRiNVqqBaH2V3ZjkYCFpwhHgNF4FbocJstjjSUrCAcj7ee8L9lRRB1gr+
         sNMobVhZVbpa52+kXuFPb9kNxQjYFleTUwFyvjkfCol7hHBqNYuvwCDOmPyb3NXj+y6Z
         uOSfcbcvs9tQ4JPOry5phl6Z4IvDWCffG2XzntXWfMokd7HbkyeokZZe8dLjegGaBv0C
         VUmCL/cvwGy4S3ntHEySalyDxSIbyYSsI15S8i9Eu+WiRUyYGXlaAfa437yHru3bZh5D
         KdqA1H2W5Oo8r7Lm+xsnEYasCoEfQOo0nA+zpE7KzN6UWSZm5rnNYga5OWFiId7zIH8t
         sL9Q==
X-Forwarded-Encrypted: i=1; AJvYcCWCg7cjGpdNlvcSLZQYbRmJeY4m/w4jfJd/UkRex0MC7QSYXC/LcQaijXw0yMoVQ09yDvMgUzxG1IUpgA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz3zIkt7WMqNfw2zshXlTJSvB/zZQvVQMVAFchjJt11K52DVwpN
	ZpwuE6HBh8ZICNcah/w4WJfw9TpnqfvOq/0lM/pXQh2NWiY4UPrV7Rdgr23NpSRcQD2DY4UHVOe
	v6ptxsaPJurV/3Fj0B0txP6eXUDQt27c=
X-Gm-Gg: AZuq6aKBeG1ERoT6jZOYU75Rq9iFRMPjwKRdiaexDlDqraOZODp1yFvkHUCAkToTCUz
	rhkGtoIY3IPM33n2FrjRLmQMt5xfyVuEQVmxgzCmSNU/R+R/qyhU3zUedkhKcUvRpbZuqqgtW5g
	qXRw9jKT7wNurGsqpPc/IOJkyFiHA6Fq1bRDqYgPhr1ulTv1prG8qIXFp7NHVwovethYdKcG6Kl
	0bDMFWGIo/D0gJm4acSHhi3IfV5AMW8+8R0TkpPjm9vneG9cgTAfON6ezteWVLPztYeEOV1o09R
	3whMobSpLk6y8KphpM/Hat4zItWJ/UTm8Swc1IKT7w==
X-Received: by 2002:a05:6402:50d2:b0:64b:58c0:a393 with SMTP id
 4fb4d7f45d1cf-65ea4f07f63mr241574a12.30.1771607768401; Fri, 20 Feb 2026
 09:16:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260220055449.3073-1-tjmercier@google.com> <20260220055449.3073-3-tjmercier@google.com>
 <aZh-orwoaeAh52Bf@slm.duckdns.org>
In-Reply-To: <aZh-orwoaeAh52Bf@slm.duckdns.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Fri, 20 Feb 2026 19:15:56 +0200
X-Gm-Features: AaiRm51-NxZivWP9n79oFDzWvBAa9d7rBDJz7DAiXkp5nty2l6CfzMRpgIoYHak
Message-ID: <CAOQ4uxjgXa1q-8-ajSBwza-Tkv91tFP-_wWzCQPW+PwJMehEWA@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] kernfs: Send IN_DELETE_SELF and IN_IGNORED
To: Tejun Heo <tj@kernel.org>
Cc: "T.J. Mercier" <tjmercier@google.com>, gregkh@linuxfoundation.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	cgroups@vger.kernel.org, linux-fsdevel@vger.kernel.org, jack@suse.cz, 
	shuah@kernel.org, linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 4:32=E2=80=AFPM Tejun Heo <tj@kernel.org> wrote:
>
> Hello,
>
> On Thu, Feb 19, 2026 at 09:54:47PM -0800, T.J. Mercier wrote:
> > Currently some kernfs files (e.g. cgroup.events, memory.events) support
> > inotify watches for IN_MODIFY, but unlike with regular filesystems, the=
y
> > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > removed. This means inotify watches persist after file deletion until
> > the process exits and the inotify file descriptor is cleaned up, or
> > until inotify_rm_watch is called manually.
> >
> > This creates a problem for processes monitoring cgroups. For example, a
> > service monitoring memory.events for memory.high breaches needs to know
> > when a cgroup is removed to clean up its state. Where it's known that a
> > cgroup is removed when all processes die, without IN_DELETE_SELF the
> > service must resort to inefficient workarounds such as:
> >   1) Periodically scanning procfs to detect process death (wastes CPU
> >      and is susceptible to PID reuse).
> >   2) Holding a pidfd for every monitored cgroup (can exhaust file
> >      descriptors).
> >
> > This patch enables IN_DELETE_SELF and IN_IGNORED events for kernfs file=
s
> > and directories by clearing inode i_nlink values during removal. This
> > allows VFS to make the necessary fsnotify calls so that userspace
> > receives the inotify events.
> >
> > As a result, applications can rely on a single existing watch on a file
> > of interest (e.g. memory.events) to receive notifications for both
> > modifications and the eventual removal of the file, as well as automati=
c
> > watch descriptor cleanup, simplifying userspace logic and improving
> > efficiency.
> >
> > There is gap in this implementation for certain file removals due their
> > unique nature in kernfs. Directory removals that trigger file removals
> > occur through vfs_rmdir, which shrinks the dcache and emits fsnotify
> > events after the rmdir operation; there is no issue here. However kernf=
s
> > writes to particular files (e.g. cgroup.subtree_control) can also cause
> > file removal, but vfs_write does not attempt to emit fsnotify events
> > after the write operation, even if i_nlink counts are 0. As a usecase
> > for monitoring this category of file removals is not known, they are
> > left without having IN_DELETE or IN_DELETE_SELF events generated.
>
> Adding a comment with the above content would probably be useful. It also
> might be worthwhile to note that fanotify recursive monitoring wouldn't w=
ork
> reliably as cgroups can go away while inodes are not attached.

Sigh.. it's a shame to grow more weird semantics.

But I take this back to the POV of "remote" vs. "local" vfs notifications.
the IN_DELETE_SELF events added by this change are actually
"local" vfs notifications.

If we would want to support monitoring cgroups fs super block
for all added/removed cgroups with fanotify, we would be able
to implement this as "remote" notifications and in this case, adding
explicit fsnotify() calls could make sense.

Thanks,
Amir.
