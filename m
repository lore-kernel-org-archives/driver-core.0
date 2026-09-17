Received: from mail-lr2-f12.google.com (mail-lr2-f12.google.com [74.125.230.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B14D24B049F
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 10:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789639635; cv=pass; b=LgqPm3jxX9snSbyh4ImdnmuMv75UwUwSPcMGBxExzK/G9YVeBrPKYJNEDlcXBROrmgeXYUI/XE225vaFrmWo0pIPg3FImMM4OBKp50f1KJ6BYDj0Tgw3vyazwhrTdRZ7d3XmzYx4qCx7azM8iacO2cZ5ffhtDITWSSdNMYXHJR8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789639635; c=relaxed/simple;
	bh=jwj8B3HPruDjYfZ7APyAFvVem8IIOrgvFJywLOyTVRI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=us18QwIo/NfbbeuyXx/F5HQYtecnDTMHOoCeOBhMPMsVVEDRPlC8RHEgnTf79bLWT1Oh2ot3Ip/gi3s2xqguezjWiQcnzRnsAyAX/NgqMyM5qUjPzuj5wqvSrs+tsAYrZ1Bj+dXYoV8C6QLOzQeULpY28WYdbaFoehDatrebhdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=korIRKdA; arc=pass smtp.client-ip=74.125.230.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="korIRKdA"
Received: by mail-lr2-f12.google.com with SMTP id 38308e7fff4ca-3a49bc59559so5047361fa.2
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 03:07:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789639626; cv=none;
        d=google.com; s=arc-20260327;
        b=Fj/0Adw/bQjkAIHVvkWHLGeArM0uTc18sHVknEnOJV/udXQDu8QaywbchJtZYW4SJY
         amUL9ROCqF0cAYcbYkDC+SsujmRSKN5AxU9QugJXG2AMZgmMEe0zg5WdSjJojPPXmfKB
         XXK3yyo2XljL887qVC2I+HD3nelG3IKORcZ4zGtYO9gP1dbeIz6qgNeoj9IpXRSpg2Y2
         6KC2t9dVOFhalbZFGAQTNtaMbG6mVVJAuR9veLKG1/gXxyQRKeFikjkajHcFtLpIOulv
         GZquRt2DCanMYPeO06JY1lv4/4jhu/sqQH7iWYCDWYSo2B6A3w6v6MeXTWKCrDtXG0gR
         vvCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=xqC5WMei4eaKFTK8Q60/nFvFgccYW1qYc0L8nbCKzW8=;
        fh=C+zvlhHThoDbk5ap+OpQuzhcEgTOzHE36tao1ReGiw0=;
        b=WDdWP7gFuUa8yt9n5U7TdJgBSHCyMhvfYivuN/WQJVfHTYztmC4PrBPCmwGurSTVL5
         SnaKZelcPhJ0Vj2ZLDZ8jwprQlRrj/UokC7ifEiyOO0dOI0/+81c+FvFisRlIdK5kZEK
         W9qff1+y6r5RAtRbqxDH8V/I6VpPGhzkj9MAdeMrokdUNJRK01fU+e63C0EyhwOpv3W5
         HG3r7IFKJ83+m1fZxYEa5v3KiRq6dEJuV/PTyXvioQvOU233PQsgw8pkwGjpTL4QPpcR
         3pltQbnpHSmu0K7i1VuR69XfLF1yvXk1+JGmKJIU2h2B8ApBoW3Fk9JoQmSiO6/efwja
         xWYg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789639626; x=1790244426; darn=lists.linux.dev;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xqC5WMei4eaKFTK8Q60/nFvFgccYW1qYc0L8nbCKzW8=;
        b=korIRKdAh3gdCYkrzU41buMfaAGFtFtMkLVjGr+hWsQ8B2CgI9NWu5McPMK3ginKzN
         4RGCUFgq/AjSdI1il4EJuyJum9R7YeFL2S7KLzwEEzeiWvpo3Ca1qlbeNw7iQB9w/Ipj
         9Zt4FO+jONR3FCjdRqUqasmMVJSsXIgDm3mvG34dLb5yRc0r5GLBCcvyeo88Dm2Sq7AD
         qGSRRDma59WPtxXCOBQwclTD6bbuxNj9pwfcfgwaa2dV6D5SBo+9AbPxaYHi9f1lvG0O
         22jHsxg5lEzs0qhMF0PlXJ9kk1jzv8B3knmNdHp1tzvrHryu4rrpPkP6FWBD2eAXdUKw
         E2sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789639626; x=1790244426;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xqC5WMei4eaKFTK8Q60/nFvFgccYW1qYc0L8nbCKzW8=;
        b=P8bWFHHGNfBgNSRISnyibaWjM4qf8ciE92mwLbNSrsF8sdMRbxB4t7CkihJlXp1IDb
         32iOBpcKBSXOLIkw1ojkHnL9+HXwEqt/ju21l7YfnyC33NqG+voR4pCtbtAvYkLzlD/A
         4cU6WVPdV0KWUM+5SjDhew0jQ54ACUik5oZ47KTHiN5X1UV4BtJM5ulAG9nVUOW/400i
         oGstAvPg9OLYAXEhaFFqfFfaqioWKTmyYt8eQ9i6gHt0GeSSwvzhs3i9/l4lM1oesr7X
         irKZs83W8yFDs+X+9EkxPgmm1b2nH0AVnT656P0FEFSrWztJt+mxJrrRgkvrP9mkBHoU
         /LSQ==
X-Forwarded-Encrypted: i=1; AKwUvBw0jx0ppaZq5yEboX+KCTh61HCoQq2NcfXzW0x+ImwLcIjri+kZumKweJP/5CYL6eWAuYX8Rx6F50w8lg==@lists.linux.dev
X-Gm-Message-State: AFuF++lkCc5+iXTTa4r9FU8nw1N9Ko4nUBxqpgJRsVd1feRikP6fFEEr
	HQ5xjVN744L03imEy5f1OMI6khKUq0TUh1RLBklxOlZF0KUBv9ypclP6KKC0Ca6mxmCbxP6+NIf
	YmUVcF6IaVswpXUc436JwD4QGlYqX85k=
X-Gm-Gg: AYBFou0kIr+OgH8712/KUpFzZfmjj3MXJM3epBMnxpuVk9hoU7HHVeXT+8Bm7ty3xcd
	OXt7VkT4b8Ylrz9JryD4E6DudV/Pq6CuGX9idUF+DSYsjiNdq11w+eo5/l9nzw583jVXCUm88F7
	g3IBLldQHpeVCRfO84XQQlXG7UWPOSa8FSaQMXUepbiRuUzUkMwmaVYbP2erS+TQtQt1ffsUmPe
	yeq3HuxGyM1+2K0lbwRqDKjUeZrREMZeHYhCrefxtkNbEHfeR6ckt9OCaCKm0FIOyl41lIFJbak
	7cOcve8txi89QBL+zHuc0h5saZavvqD84376saivv5019mdrxJzr4/TYJXzLT3gA5ml8mf0D/hu
	iOQ8V/lEae66ScQ==
X-Received: by 2002:a05:651c:19a3:b0:3a3:7681:6d6b with SMTP id
 38308e7fff4ca-3a5dca034a5mr11708051fa.20.1789639625120; Thu, 17 Sep 2026
 03:07:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CANGjgdn=H50AaA-+O_GA-hkE9UwLANmkjx1zRsKUzxF5za8VfQ@mail.gmail.com>
 <aqa7KgIJYGgf7INk@slm.duckdns.org> <CANGjgd=f9n7zEZS=xi71y_dY6Uk75_qgP9qVDkYBusNz9sp2sg@mail.gmail.com>
 <CABdmKX2Oer9wrxWdR8s48Czro8H51HY+S_mfnUj-RvhjCM1RgA@mail.gmail.com>
 <CANGjgdmKg1_QyzhCSh03T4RStw5_znnhqmFFS8TVwQbm-sZZbA@mail.gmail.com> <CABdmKX3g7+GTfSBKB42Tr2CDusCNXb5+oPc7TcC1RpVndUzVpw@mail.gmail.com>
In-Reply-To: <CABdmKX3g7+GTfSBKB42Tr2CDusCNXb5+oPc7TcC1RpVndUzVpw@mail.gmail.com>
From: Chengfeng Lin <lin2530632123@gmail.com>
Date: Thu, 17 Sep 2026 18:06:52 +0800
X-Gm-Features: AcwNN1Uxpz_f7e3lbLo7xRKU16-2Dq7ZoY20JkyUCDtztrWX0uQOsS_qI1Nxn_A
Message-ID: <CANGjgdkwEsP8ahDX5sVORfKLF52JmvEev9BcWPeTJT2XzyWJAQ@mail.gmail.com>
Subject: Re: [REGRESSION] kernfs: empty cgroup rmdir latency after
 delete-notification changes
To: "T.J. Mercier" <tjmercier@google.com>
Cc: Tejun Heo <tj@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jan Kara <jack@suse.cz>, 
	driver-core@lists.linux.dev, cgroups@vger.kernel.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	regressions@lists.linux.dev
Content-Type: multipart/mixed; boundary="00000000000021c0d8065baaf2d1"

--00000000000021c0d8065baaf2d1
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi T.J.,

Thanks for explaining the locking issues. I tried a variation on your
first idea, using a separate inode_ever_requested field. In one four-boot
run, rmdir() was 22.36-22.72% faster and the continuous
mkdir() -> stat() -> rmdir() sequence was 7.35-9.01% shorter.
The tradeoff is an extra 8 bytes per kernfs_node in this build.

The watcher shortcut raises a separate concern: it also skips
clear_nlink(). An open FD can keep an inode alive without any watchers,
so that inode would still need its link count cleared.

The attached patch sets inode_ever_requested to true before calling
iget_locked().
It never clears the field, even after allocation failure or eviction.
A false value allows removal to skip the lookup; a true value retains
the existing lookups and link-count handling for every superblock.
It does not modify kn->flags or acquire a new lock during initialization.

Creation and removal still need the existing lifetime locking;
READ_ONCE()/WRITE_ONCE() do not provide that protection. I checked the
five kernfs_get_inode() call sites. Four use kernfs_rwsem with Shakeel's
fix applied; cgroup_may_write() instead relies on cgroup_mutex.
Those lifetime assumptions still need review.

I tested on 2f0c1cf72f46 (7.3-rc2):

  A: baseline + Shakeel's file-handle decoding read-lock fix [1]
  B: A + the attached prototype, without the old INODE_INITED changes

Four fresh boots ran in A1 -> B1 -> B2 -> A2 order:

                                      A1       B1       B2       A2
  original rmdir (us)                 9.758    7.541    7.563    9.741
  mkdir -> first stat -> rmdir (us)  30.023   27.317   27.356   29.526

The workload still removes empty cgroups, with no tasks or watches.
The stat() in the sequence is the first directory stat().
I used the same binaries on the bare-metal i7-12700KF, CPU0, with
sched_ext disabled, full preemption, the performance governor and Turbo
disabled. Both kernels used GCC 15.2 and the same config except LOCALVERSIO=
N.
Each value is the median of nine sample means, with 16 warmups per sample.
The original test measured 128 removals per sample; the sequence test
measured 32 sequences, without pauses between operations. For these two
metrics, CV stayed below 1.96% and boot drift stayed below 1.66%.
The improvement ranges compare each B boot against each A boot.
Both improvements held after dropping the first sample from each boot.

Separate traces showed ilookup() calls falling from 26 to 1 per removal,
or from 26 to 2 when one file FD was held open. Required clear_nlink()
calls and deletion lock counts were unchanged. Held-FD link-count checks,
notification positive controls and bounded open/remove checks passed.

I also tested first opens racing removal on fresh, unwatched files:
176 cases without tracing and 176 with tracing on each kernel,
including ordered controls.
Tracing confirmed 96 new inodes on each kernel. In B, the marker was false
on entry and true before iget_locked(). All successfully opened FDs
reported nlink=3D0 after removal.
I did not capture a remover waiting on the first lookup's read lock.
Eviction/recreation, distinct superblocks, other kernfs users and
weak-memory architectures remain untested.

kernfs_node grew from 136 to 144 bytes, and objects per 4 KiB slab fell
from 30 to 28. Simply reordering the fields does not avoid the size
increase in this build. I have not found a safe way to avoid this extra
memory cost. First-file stat() timing was too variable to quantify its
overhead. This is a prototype for review, not a finished fix.

Results, test sources and the patch are available at [2].

These results are from a microbenchmark. I have not measured the impact
on a real application. Given the extra memory cost and remaining
correctness questions, do you think this direction is worth pursuing?

[1] [PATCH v2 3/4] kernfs: don't lose IN_DELETE_SELF
    when decoding a file handle
https://lists.openwall.net/linux-kernel/2026/09/05/828

[2] Prototype results and reproduction
https://github.com/lcf0399/linux-regression-evidence/tree/b9ce1d1b34aa1fe5b=
5bf6b49dc334f36a7aa8bfd/kernfs-empty-cgroup-removal/bare-metal/inode-reques=
ted

Thanks,
Chengfeng

T.J. Mercier <tjmercier@google.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8816=E6=
=97=A5=E5=91=A8=E4=B8=89 06:01=E5=86=99=E9=81=93=EF=BC=9A

>
> On Mon, Sep 14, 2026 at 11:08=E2=80=AFAM Chengfeng Lin <lin2530632123@gma=
il.com> wrote:
> >
> > Hi T.J.,
> >
> > Thanks for the patch. Your changes reduced rmdir() latency by
> > 21.87-22.86% in the same empty-cgroup benchmark, with sched_ext disable=
d.
> >
> > I tested these two states on 2f0c1cf72f46 (7.3-rc2):
> >
> >   A: baseline + Shakeel's file-handle decoding read-lock fix [1]
> >   B: A + your INODE_INITED changes, without modifying your code
> >
> > I used the original binary on the bare-metal i7-12700KF, pinned to CPU0=
,
> > with full preemption, the performance governor and Turbo disabled.
> > Both kernels used GCC 15.2 and the same config except LOCALVERSION.
> >
> > The clean timing sequence used four fresh boots: A1 -> B1 -> B2 -> A2.
> >
> >                      A1       B1       B2       A2
> >   rmdir (us)        9.727    7.600    7.548    9.784
> >
> > Each value is the median of nine sample means. Each sample contains
> > 128 measured removals after 16 warmups. All four B/A comparisons showed
> > the improvement above. Removal CVs were below 2.03%. The drift between
> > boots was +0.59% for A and -0.68% for B. The improvement held after
> > dropping the first sample from each boot.
> >
> > Separate, untimed traces showed the same 26 kernfs nodes per removal,
> > but ilookup() calls fell from 26 to 1. Deletion lock counts were unchan=
ged.
> > Basic checks of file/directory deletion notifications and link counts
> > with FDs held open passed on both kernels.
> >
> > I also timed the full mkdir() -> stat() -> rmdir() sequence using a
> > separate binary on the same kernels. The latest continuous follow-up us=
ed
> > four fresh boots, with nine samples per boot. Each sample had 16 warmup=
s
> > and 32 measured sequences, with no pauses between them. The full sequen=
ce
> > fell from 30.07-30.65 us to 27.97-28.34 us, a 5.77-8.76% reduction.
> > The maximum CV was 1.76%, and boot drift stayed below 2% in both states=
.
> > In the earlier continuous follow-up with 128 operations per sample, the
> > full sequence was 5.15-6.52% shorter, but CVs of 4.52-6.46% were too hi=
gh
> > to establish a stable overall improvement percentage.
> >
> > Untimed tracing placed the added write lock in first stat(), during ino=
de
> > initialization. The patch skips lookups for nodes whose inodes were nev=
er
> > initialized; it does not move those lookups into stat(). The individual
> > mkdir() and stat() timings remained too variable to quantify their chan=
ges.
> >
> > I also checked whether the benefit persisted with less frequent operati=
ons.
> > For this diagnostic, I added 50 and 200 ms pauses between sequences,
> > outside the timers. I kept 16 warmups and 32 measured sequences per sam=
ple.
> > rmdir() still saved 2.10-2.58 us, but its baseline rose from about 10 u=
s
> > to 18 us, reducing the percentage gain. The full sequence was 0.66-2.85=
%
> > shorter, with a maximum CV of 1.53%.
> >
> > I included [1] because the file-handle path on this base lacks
> > kernfs_rwsem protection. Source review suggests a possible wait cycle
> > when that path recreates an evicted inode. Initialization waits for
> > kernfs_iattr_rwsem, while removal holds it and waits for I_NEW to clear=
.
> > I have not reproduced this possible deadlock in the kernel.
> > Does the base for your diff already include [1] or equivalent locking?
> >
> > [1] [PATCH v2 3/4] kernfs: don't lose IN_DELETE_SELF
> >     when decoding a file handle
> > https://lists.openwall.net/linux-kernel/2026/09/05/828
> >
> > Results and reproducers:
> > https://github.com/lcf0399/linux-regression-evidence/tree/f101b1b9c0d3d=
fce07f81b11ca2da2c252150e4c/kernfs-empty-cgroup-removal/bare-metal/inode-in=
ited
> >
> > Thanks,
> > Chengfeng
>
> Thanks for testing. I was also not aware of Shakeel's fix [1] so it
> was not in my base; I used 2d3090a8aeb5 ("Merge tag 'v7.1-p5' of
> git://git.kernel.org/pub/scm/linux/kernel/git/herbert/crypto-2.6").
>
> I think you are correct about the deadlock. The synchronization
> requirements here are more difficult than I initially realized.
> kernfs_iattr_rwsem can't be used because of the deadlock you
> mentioned. Additionally, kn->flags is non-atomic and only modified
> under down_write(&root->kernfs_rwsem). Inode allocation runs under a
> read lock (or locklessly before Shakeel's fix), so setting a flag
> there races with writers and risks lost updates on other flags.
> Grabbing a write lock in kernfs_init_inode() would add contention to
> normal lookup and stat paths. So I'm not seeing a simple way forward
> with the KERNFS_INODE_INITED idea.
>
> This is a more straightforward but even less exact way:
>
> @@ -1526,8 +1527,12 @@ static void kernfs_clear_inode_nlink(struct
> kernfs_node *kn)
>         lockdep_assert_held_read(&root->kernfs_supers_rwsem);
>
>         list_for_each_entry(info, &root->supers, node) {
> -               struct inode *inode =3D ilookup(info->sb, kernfs_ino(kn))=
;
> +               struct inode *inode;
>
> +               if (!fsnotify_sb_has_watchers(info->sb))
> +                       continue;
> +
> +               inode =3D ilookup(info->sb, kernfs_ino(kn));
>
> I'm not sure that's really worth a few microseconds though.
>
> > T.J. Mercier <tjmercier@google.com> =E4=BA=8E2026=E5=B9=B49=E6=9C=8814=
=E6=97=A5=E5=91=A8=E4=B8=80 00:17=E5=86=99=E9=81=93=EF=BC=9A
> > >
> > > On Sun, Sep 13, 2026 at 8:47=E2=80=AFAM Chengfeng Lin <lin2530632123@=
gmail.com> wrote:
> > > >
> > > > Hi Tejun,
> > > >
> > > > Thanks. I found this during research into kernel performance regres=
sions,
> > > > using a microbenchmark of cgroup creation and removal. This was not
> > > > prompted by a production issue.
> > > >
> > > > I reported it to document the added removal cost and ask whether so=
me
> > > > of it could be reduced while preserving the fixes. I agree that the
> > > > roughly 3 us increase per removal does not, by itself, demonstrate =
a
> > > > significant impact on real workloads.
> > > >
> > > > Thanks,
> > > > Chengfeng
> > > >
> > > > Tejun Heo <tj@kernel.org> =E4=BA=8E2026=E5=B9=B49=E6=9C=8813=E6=97=
=A5=E5=91=A8=E6=97=A5 23:03=E5=86=99=E9=81=93=EF=BC=9A
> > > > >
> > > > > Hello,
> > > > >
> > > > > On Sun, Sep 13, 2026 at 10:43:04PM +0800, Chengfeng Lin wrote:
> > > > > > I found an increase in empty cgroup removal latency across 507d=
8ce13f5b
> > > > > > ("kernfs: Don't set_nlink for directories being removed") and e=
ea5d2bb34ba
> > > > > > ("kernfs: Send IN_DELETE_SELF and IN_IGNORED"). With sched_ext =
disabled,
> > > > > > rmdir() went from about 6.5 us to 9.6 us, an increase of 46-47%=
.
> > > > > > The result held in two independent runs.
> > > > >
> > > > > I don't want to make cgroup removal unnecessarily expensive but a=
t the same
> > > > > time it's not an operation that I consider to be a hot path, so a=
s long as
> > > > > the operaiton can finish in a reasonable amount of time and singl=
e digit us
> > > > > definitely is, performance of rmdir usually isn't something which=
 is high in
> > > > > priority. Can you please detail why this matters for you?
> > > > >
> > > > > Thanks.
> > > > >
> > > > > --
> > > > > tejun
> > >
> > > Hi Chengfeng and Tejun,
> > >
> > > We use this kernfs IN_DELETE_SELF feature on Android where multiple
> > > cgroups are created and removed frequently on a per-application basis=
,
> > > but we hadn't noticed a significant delay due to the inotify
> > > functionality during cgroup removal. It's probably masked by much
> > > larger delays (milliseconds) we regularly see due to unreleated issue=
s
> > > with cgroup locks like priority inversion with cgroup_mutex, and
> > > contention for cgroup_threadgroup_rwsem.
> > >
> > > As far as what we can do, I think avoiding inode lookups for kernfs
> > > nodes that never had an inode created should improve the situation. I=
t
> > > doesn't eliminate the locking overhead, which I don't think can easil=
y
> > > be eliminated. The code below doesn't deal with inode eviction either=
,
> > > but at least files which are never accessed won't introduce the inode
> > > lookup overhead.
> > >
> > > diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
> > > index 4f9ade82b08a..3ec9f79b1aa2 100644
> > > --- a/fs/kernfs/dir.c
> > > +++ b/fs/kernfs/dir.c
> > > @@ -1523,6 +1523,9 @@ static void kernfs_clear_inode_nlink(struct
> > > kernfs_node *kn)
> > >         struct kernfs_root *root =3D kernfs_root(kn);
> > >         struct kernfs_super_info *info;
> > >
> > > +       if (!(kn->flags & KERNFS_INODE_INITED))
> > > +               return;
> > > +
> > >         lockdep_assert_held_read(&root->kernfs_supers_rwsem);
> > >
> > >         list_for_each_entry(info, &root->supers, node) {
> > > diff --git a/fs/kernfs/inode.c b/fs/kernfs/inode.c
> > > index 38b28aa7cd02..f8b4a8b8ade4 100644
> > > --- a/fs/kernfs/inode.c
> > > +++ b/fs/kernfs/inode.c
> > > @@ -208,6 +208,10 @@ static void kernfs_init_inode(struct kernfs_node
> > > *kn, struct inode *inode)
> > >         set_default_inode_attr(inode, kn->mode);
> > >         kernfs_refresh_inode(kn, inode);
> > >
> > > +       down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
> > > +       kn->flags |=3D KERNFS_INODE_INITED;
> > > +       up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
> > > +
> > >         /* initialize inode according to type */
> > >         switch (kernfs_type(kn)) {
> > >         case KERNFS_DIR:
> > > diff --git a/include/linux/kernfs.h b/include/linux/kernfs.h
> > > index e21b2f7f4159..87f074ce19d3 100644
> > > --- a/include/linux/kernfs.h
> > > +++ b/include/linux/kernfs.h
> > > @@ -113,6 +113,7 @@ enum kernfs_node_flag {
> > >         KERNFS_EMPTY_DIR        =3D 0x1000,
> > >         KERNFS_HAS_RELEASE      =3D 0x2000,
> > >         KERNFS_REMOVING         =3D 0x4000,
> > > +       KERNFS_INODE_INITED     =3D 0x8000,
> > >  };
> > >
> > > -T.J.

--00000000000021c0d8065baaf2d1
Content-Type: text/x-patch; charset="US-ASCII"; name="0004-inode-requested.patch"
Content-Disposition: attachment; filename="0004-inode-requested.patch"
Content-Transfer-Encoding: base64
Content-ID: <>
X-Attachment-Id: 

LS0tIGEvZnMva2VybmZzL2Rpci5jCisrKyBiL2ZzL2tlcm5mcy9kaXIuYwpAQCAtMTUyNCw2ICsx
NTI0LDEwIEBACiAKIAlsb2NrZGVwX2Fzc2VydF9oZWxkX3JlYWQoJnJvb3QtPmtlcm5mc19zdXBl
cnNfcndzZW0pOwogCisJLyogTm8gaW5vZGUgY2FuIGV4aXN0IGlmIGNyZWF0aW9uIGhhcyBuZXZl
ciBiZWVuIHJlcXVlc3RlZC4gKi8KKwlpZiAoIVJFQURfT05DRShrbi0+aW5vZGVfZXZlcl9yZXF1
ZXN0ZWQpKQorCQlyZXR1cm47CisKIAlsaXN0X2Zvcl9lYWNoX2VudHJ5KGluZm8sICZyb290LT5z
dXBlcnMsIG5vZGUpIHsKIAkJc3RydWN0IGlub2RlICppbm9kZSA9IGlsb29rdXAoaW5mby0+c2Is
IGtlcm5mc19pbm8oa24pKTsKIAotLS0gYS9mcy9rZXJuZnMvaW5vZGUuYworKysgYi9mcy9rZXJu
ZnMvaW5vZGUuYwpAQCAtMjQ3LDYgKzI0NywxNiBAQAogewogCXN0cnVjdCBpbm9kZSAqaW5vZGU7
CiAKKwkvKgorCSAqIENhbGxlcnMgbXVzdCBzZXJpYWxpemUgaW5vZGUgY3JlYXRpb24gYWdhaW5z
dCBub2RlIHJlbW92YWwsCisJICogdXNpbmcga2VybmZzX3J3c2VtIG9yIHRoZSBvd25pbmcgc3Vi
c3lzdGVtJ3MgbGlmZXRpbWUgbG9jay4KKwkgKiBDb25jdXJyZW50IHJlYWRlcnMgbWF5IHNldCB0
aGlzIGluZGVwZW5kZW50IGhpbnQgdG8gdHJ1ZS4KKwkgKiBTZXQgaXQgYmVmb3JlIGlnZXRfbG9j
a2VkKCksIGFuZCBrZWVwIGl0IHNldCBvbiBmYWlsdXJlIG9yCisJICogZXZpY3Rpb246IGEgZmFs
c2UgcG9zaXRpdmUgb25seSBjYXVzZXMgYW4gZXh0cmEgbG9va3VwLgorCSAqLworCWlmICghUkVB
RF9PTkNFKGtuLT5pbm9kZV9ldmVyX3JlcXVlc3RlZCkpCisJCVdSSVRFX09OQ0Uoa24tPmlub2Rl
X2V2ZXJfcmVxdWVzdGVkLCB0cnVlKTsKKwogCWlub2RlID0gaWdldF9sb2NrZWQoc2IsIGtlcm5m
c19pbm8oa24pKTsKIAlpZiAoaW5vZGUgJiYgKGlub2RlX3N0YXRlX3JlYWRfb25jZShpbm9kZSkg
JiBJX05FVykpCiAJCWtlcm5mc19pbml0X2lub2RlKGtuLCBpbm9kZSk7Ci0tLSBhL2luY2x1ZGUv
bGludXgva2VybmZzLmgKKysrIGIvaW5jbHVkZS9saW51eC9rZXJuZnMuaApAQCAtMjE3LDYgKzIx
Nyw5IEBACiAJdW5zaWduZWQgaW50CQloYXNoOwkvKiBucyArIG5hbWUgaGFzaCAqLwogCXVuc2ln
bmVkIHNob3J0CQlmbGFnczsKIAl1bW9kZV90CQkJbW9kZTsKKworCS8qIENvbnNlcnZhdGl2ZSBo
aW50OyBuZXZlciByZXNldCBkdXJpbmcgdGhpcyBub2RlJ3MgbGlmZXRpbWUuICovCisJYm9vbAkJ
CWlub2RlX2V2ZXJfcmVxdWVzdGVkOwogCiAJdW5pb24gewogCQlzdHJ1Y3Qga2VybmZzX2VsZW1f
ZGlyCQlkaXI7Cg==
--00000000000021c0d8065baaf2d1--
