Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14B122FE060
	for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 19:15:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771442145; cv=pass; b=FUxRQgpf5j4keasgB5xvoZKucyg2bkOZDVg/Q0b8Od42A0a8I4caZyrtb9LblMUwQ+l7AwOvtVqHzYu1nQawqxD3AohiAYReKcYiC+J+4UzZz+EDROSzasnybugqO2Bb6i5aFJLDyd+i3hMe+s5RVXsDb948LJRJphC9G4zDBU4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771442145; c=relaxed/simple;
	bh=wBFNCt7xEGs0VQ8C7Z13cB9OU5SAamOgWMLc8IFwhTg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FZwpmfSuPHGmOvuFpMc6x9vqVvaoIIIh2TQXheTQda6MgaBzAblRoKpSDRG7CdNnEnYkQNrndHDg738L30AVbNAi6xEeqPh1Fal+3ZVtO3HNNz+cx4uQgZ7Pa1fboxdgLv4GseIyR2nZqW33vzV00JPVv4yR8GAH5AR+adRAJug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Dl83+PVB; arc=pass smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Dl83+PVB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-48373ad38d2so11185e9.0
        for <driver-core@lists.linux.dev>; Wed, 18 Feb 2026 11:15:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771442142; cv=none;
        d=google.com; s=arc-20240605;
        b=bKjCf16woseuTWgPo6cnIOs1o8Z6oCTmVgH9UMMxcstPZsx/w+vPW5SFTsdKyGHoD1
         ijdW0evDkB9r18Jg1s0v+QM7fT2Z85Tc3jDWAsa6gfBCdIc0YfA1YSU3BpjRqVgNLVuH
         i1xOBXjuv2teb9U+CwKoDdIGzAbtvLTl/LERuyR+axPZEmIbSRvfBuvI+TarvwmXrF0r
         xLKKlgllV/YxpZZI0ucA3bE6GaaMPKtkp2l+Nxy1ndHGT0sV7aF8RTMLCpwBzUWvQWNo
         a9fzYB36FxZG9Ds7m5esAVU5d5V+Qo2cg0QowVKDbd1fgzcRh/WCuZpUsC0VMbOCIq76
         5xDw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uYEklyyKGYW2ZvnMpqijJPxd6tx0mQrMdEMbyIKAW9M=;
        fh=9E87yxG/QR+hgjmij8Vl9oU1z9vAkoMV+DpDbQ9JGKE=;
        b=lgtz5QgUNcjL1YkdgYLpPjFbxtglMkCBQtWniHgziugecZpI20veFFEdKOFXhAWvdO
         aOXS+WTMlrQpR0C15NV3NB8ioY4hvQ7DDcCKidv24JPEPwi/wPxXqO7Zr4CGpsRAWkHe
         LvK+OHV/sp+yvUYvpTZxTX1F4XBcE/uFp77NWItfuid746e+bZ/IDxAdjEiKz8SCjyFM
         xUPoDAWAOrrIlfIc+gUWDseYo9uGhhnjLLq58fox1dTPLII21e3rqjAHUOqzHqhPzOMU
         +FObukvemyFi6L7ZrQMC8U09eGydI32AhJR5LUNKtHHFaYgFtU0Zazx3qnfTfyEOmoVZ
         ATYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771442142; x=1772046942; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uYEklyyKGYW2ZvnMpqijJPxd6tx0mQrMdEMbyIKAW9M=;
        b=Dl83+PVBOlrYRZVHZwGWN+oYQazLI9+VMJ8mT0faLq+s4x/eMoWJv7BbMYc0dD3/eY
         4l+9y/kiB72/CUkWpZmwTr2eyH2ZAJ7a/QU2hvWIRiTEML5Ol5070JfSnXdiLm/lE8gF
         zad2Pbtrg2jf2QpWwGsbfwt9GnJ47FWuj+acdem/vC83fmbJB8t3cNJvMsOCJQzKiRGu
         w3Q2CjblmF2dKj5x1mIaqV+0CmOeemUKlfjtN0OG1yDd/Fk34tV/BzXR4NHJRDqDsph5
         0pkrhGHP7/SrI1VF5c+oTw5noC/amxs/jo8avQq9x1SA4HIHC3KNIN1fzwsxtAwvC1AY
         0b/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771442142; x=1772046942;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=uYEklyyKGYW2ZvnMpqijJPxd6tx0mQrMdEMbyIKAW9M=;
        b=f5HP80TXP18Dn/Ul0JIvb1z+mLncy/eueFMY8PMwiR/lQYkiDK1GAKE7SHRLWF5a2s
         EXgkwcoLmJTNQnttPIxNalWHoI8lg7zh2d7PXmvb6FG11Z7KAlDPtIaQ0+bX7+p33Bl0
         cIMzaVZxAM5bjv959RvLpyi4vv5aH9ofGqVAGDC6iiwm7yMocO6s01c/G4a6kbyEFw4V
         UGYyeCloxFKu0ozMY0eC48jPeLSAmdJy68LBQ8JNzmr39bGfXaEfXLunNbORH9DqI3jv
         BAktlEnHaAlmIlqv5+O5s7ZR5V+4lsdbZWr4BvGhtGq9ziAsqiXig4f2f+ts/Re6XQX/
         7MIg==
X-Forwarded-Encrypted: i=1; AJvYcCUx1k+41gLg5ekBnA9sKnqnHhqug/IHmdO1Vc7fGo9q6mUp2BEBeJY2eS8XkarQduUxPKTio+Z8BrsXlg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh/AFVVRaleh/99ypocqBu+kkPDHza2lwPLfGSvj1IWWluszBx
	W/CjsYZxz54MVrTuOvLJiExFH6J+bWc1XZhTt6L1pborq+dU/prHUZGMqWc/Q3USfnWJdQpoBqe
	kLiVsjIrFtCtrRkd/jN0X0RduLiBfPjJY6Ex0XOIb
X-Gm-Gg: AZuq6aIg40pV9kd6ta+MuTWYy25BpKjMEpGnAXm4aeYgRMNbpBITukHfpd0IuT+F/Zw
	5Cc0+n1XsCEL8zng0c7wg6YLICSnXLCW99JD5VpD7lApa6a10+Tu1kVPExKojmnQ2tnNMREneEd
	mzUdlLGEoqA7tAyA8xh4UESknkJYazfynuYLCIbb3hCkRjvyaWm46ndK8spfLHVL/4iE/aIpji0
	5Izw0CC+k19PfXqVWhI6cAzUUrt6s7t0r5NenVcrtX7gHkwaLAaVlKn3DhnXY/z3pkeU8UdHfnb
	dlELZcyAOUq4yjY6G8cLXbTqH2M6txKYeRfZ6enD3YStc8US4pLi5SF60qgIgnbI8gSnaQ==
X-Received: by 2002:a05:600d:4452:10b0:483:6a76:11a6 with SMTP id
 5b1f17b1804b1-4839e6312famr23405e9.5.1771442142133; Wed, 18 Feb 2026 11:15:42
 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260218032232.4049467-1-tjmercier@google.com>
 <20260218032232.4049467-3-tjmercier@google.com> <e7b4xiqvh76jvqukvcocblq5lrc5hldoiiexjlo5fmagbv3mgn@zhpzm4jwx3kg>
 <CABdmKX1S4wWFdsUOFOQ=_uVbmQVcQk0+VUVQjgAx_yqUcEd60A@mail.gmail.com> <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f>
In-Reply-To: <s4vb5vshejyasdw2tkydhhk4m6p3ybexoi254qjiqexzgcxb5c@ctazolc3nh6f>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Wed, 18 Feb 2026 11:15:30 -0800
X-Gm-Features: AaiRm53wtP0XVPm7Td49NxqM3FHtwAMm9Y-nYQJjMavu1aBdzT7jkoJc9BaBFyc
Message-ID: <CABdmKX2cQCneFyZhTWmWYz-RTmAOQcEKh5ZQewz25E6Xfok1tQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] kernfs: send IN_DELETE_SELF and IN_IGNORED on file deletion
To: Jan Kara <jack@suse.cz>
Cc: gregkh@linuxfoundation.org, tj@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, amir73il@gmail.com, shuah@kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 18, 2026 at 10:37=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
>
> On Wed 18-02-26 10:06:35, T.J. Mercier wrote:
> > On Wed, Feb 18, 2026 at 10:01=E2=80=AFAM Jan Kara <jack@suse.cz> wrote:
> > >
> > > On Tue 17-02-26 19:22:31, T.J. Mercier wrote:
> > > > Currently some kernfs files (e.g. cgroup.events, memory.events) sup=
port
> > > > inotify watches for IN_MODIFY, but unlike with regular filesystems,=
 they
> > > > do not receive IN_DELETE_SELF or IN_IGNORED events when they are
> > > > removed.
> > >
> > > Please see my email:
> > > https://lore.kernel.org/all/lc2jgt3yrvuvtdj2kk7q3rloie2c5mzyhfdy4zvxy=
lx732voet@ol3kl4ackrpb
> > >
> > > I think this is actually a bug in kernfs...
> > >
> > >                                                                 Honza
> >
> > Thanks, I'm looking at this now. I've tried calling clear_nlink in
> > kernfs_iop_rmdir, but I've found that when we get back to vfs_rmdir
> > and shrink_dcache_parent is called, d_walk doesn't find any entries,
> > so shrink_kill->__dentry_kill is not called. I'm investigating why
> > that is...
>
> Strange because when I was experimenting with this in my VM I have seen
> __dentry_kill being called (if the dentries were created by someone looki=
ng
> up the names).

Ahh yes, that's the difference. I was just doing mkdir
/sys/fs/cgroup/foo immediately followed by rmdir /sys/fs/cgroup/foo.
kernfs creates the dentries in kernfs_iop_lookup, so there were none
when I did the rmdir because I didn't cause any lookups.

If I actually have a program watching
/sys/fs/cgroup/foo/memory.events, then I do see the __dentry_kill kill
calls, but despite the prior clear_nlink call i_nlink is 1 so
fsnotify_inoderemove is skipped. Something must be incrementing it.
