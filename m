Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795201098;
	b=5tseuDVyqBigM8LFYnl9AsjrQnjaS3An8MdRDbIcSZ23FivTLbsDEZTwZOH2+IcQ1Kki
	 Be2PT6ip2EiIqp1zpKFTgTZBv2vDCa7nHuY0xv9fI2iKI7Z17QXInLadiIaj2eEvD3OgX
	 BhkRI+KNVl1ZsIZr46KYzv59mTmDhPhII0MVh6hGKK5fnX2tNt0AFEPUrggGcWHT6TpZ7
	 6+Rc/v2ZxK62GsQ+9so6Ngcp1FL8xghcY6jbjOTIF/UCmYYrPD30ZK+ou6IhNq1CgotAJ
	 rM6KspYIljRvy4gn+zOoJEeXYybi0ymfZ1ARRUASfF1ZiMEUVCoJ8SxhkVZGZp5melg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795201098;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
	b=08V50sCmunk82ukRNAhJN3bgdPZbMjChO0MaAktbtOdAQpXvIFMZOoe6MXa9/inq2/hd
	 y15a7xSHvGRTYeBpifsz8XgvPNhr4Vvk+bkAWaFU+4v2sWUMvcc8spQQtWEWZceVkJ3vy
	 qn3VrHDf9O1s/WeYq07rpBwBl0nSCphct07Sjaehahw+fER/bdmQlZnE9Swcad01QSupq
	 45wfwegP5mWazB0BUUiZGZNeV0+2+xBi6nTtazJ4EXZzALNWfglSwaveaqOCbsJ4DXYo8
	 p73Qe2MWfvc5FZh1li7703c9DQiU/RhwbktD5caRwlEQUxs42TQZTGym3ri8g7FW6bw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V1cMRKix;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57F9F60A263F
	for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 18:58:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 57F9F60A263F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=V1cMRKix
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4bb6860f867so4725e9.1
        for <driver-core@lists.linux.dev>; Fri, 20 Nov 2026 10:58:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795201086; cv=none;
        d=google.com; s=arc-20260327;
        b=isSmVzJFQxESD29pCdHnh+AOaF4GotKbcK+u+6CU+jN9atzzYUxUg6XIDlFY+deb4c
         RWbGz3T5tiVD6CtOqXhf31n/hhczfixgMoisWh+RODubwYIkU9KiWrBoDhyzlMI9u5FE
         MvwMO3WtETm6kBb8CaE3Au1fzQl0M0TSgzvinEQFz2uNiq4vFagW1ERdJ7LJEz8Js8lW
         cwD53LQjrBF48SKJS8jsXL3R1x7Mlfda9CTJnPVwFH4gfTFzS1Hpw/hrzDgHDEgWDWOP
         Y6jVHVM9ulw5eBGpN+MOi1Ics84le8z52KvBLzLRzYnJkW6E5xkuBLZRw04vGprEI5Th
         51EQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
        fh=y6UL1kLoCOdClu3JczWs8bjwk+7i1o6gNXFW8yUNr4A=;
        b=Ye9d2EH8xkovcrWUm/0w14HqVQBzVv7rG/amxewfI4cHCKYHhWcxcEKptLBVuAgaGy
         O90BBMTRHhZJCRW48ttWcI6PAYmPCXzuNV8gQ9+kpipos4xkQ/tfrEgVOPJKQw45Gunm
         nVOP4hEJKu2nhEdQgqtOs4pIJqCo3rtTh8a1LeMphyZ+sOm+v+yGJ44M4yOxG5oQNeTB
         TgIsPJDpkTi9vbVzq8LVZpJcMzyPToQhsik2fJ8w9fJEEXj8q3ZIuXS3gw83VFpJCJhN
         JvdIL98SX6x+VJsC3g9sLPBWHGoyJ1D5C3fsyBW99rqBnnVElVzxGMHny3/VUzSaN4vY
         FHsw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795201086; x=1795805886; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
        b=V1cMRKixRXH9+3Q9KOsK1XmO1aWu2H2z9zywFmfe+BoAG5e8xF7ypKRvi6gXm+EwDT
         bgH0OnhxmxHMuQXjtbTWomg9PtbxYerXz5VPRPDK33uWNbC99OMvD5hud0qwTI2KETXZ
         En/wrtIvmwU8RwvcwRfyzyE5/6Zy0Bij5QaXrWsjpujefDtgARgv1cNlBZICkT39rSon
         K59O47MBclVCUnT8YiAPV/2JpR/NvG316EDmuc4EN9ZREl0txERDlTZhW86O5ESiJzyp
         PXm//eHfHRp6XbZ8axL/VqpofKhBR86QXTc9QbQXW+ox+vycB+iBmcOV/v+o+6FtV80o
         MEyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795201086; x=1795805886;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SUSmUAsFropF9N/rs+U4cpsjS2D8qF6cpjMI0ccZ0f4=;
        b=hXPETScdny5N2Cg5187BIZkI4U+Vpdk7NVvzPAOPUo3ZqTI2vYeIf+tzAr/Ni6heYC
         hAG6LXsNH/FzjOE6iijuyEh0lI1i3SQLH3vW4wAe3GZeyrqzMgjgQ5bWe+jzVGHZp4tN
         tJmVHsLfipu5LoeGdSEub1O4SAmgU8nmn5XOHI1IBERz23DQdlH1cL+05eLjBlChzD2E
         dJZAvLTnkHqZuwgbd93zB1Xh8h/Qb+82E3B/pZYJMoZjgBfb4tTGs+UasAt3siPLSWLx
         4+mt47rooDhlxJ0AarSSqS1XxEL4wHisgTaBJo3BqAnAli1KnQLiMDP3Fpol3vGqu+oJ
         9b1A==
X-Forwarded-Encrypted: i=1; AL+hErFAvZYNKxM6ZCEx9YjB/L1ngaLo4I4p1dF1heSeuzSpbJSV3xt4gFNzWOzYbCMU/1mJtmyQ5zWjuWHciA==@lists.linux.dev
X-Gm-Message-State: APuU4Z+XJFT4h2AlisnsXd0WNq1xOfm045XL3AYyOpQlXLagqhGyqgEv
	4WG0PPCDEr9TYvPpx7h1XEJ/vO4ssQO/QfyePufHzCGW+IybYsM4rYXHOZ/01EW1hFQieOL2mbZ
	Kgh7zkYN8jfw2+BBdH+g6DUw/m98vBegAE7Je+ROC
X-Gm-Gg: AYBFou1/zB5qJeoW/wdZrweQ6EmKnxSa2Ta80muHGf++j/VtmpjMlFYKTK/NC/epe3W
	XmIsYPeVfgzxvds9BYF6giZDi9RPgtcUPvDYgNoop2UJCd1FKzb/xQvFrVAqFEfYyCGZ6C/CIRN
	8jLGzFYyteQgaXZ1L6FP/wKS9DpTZw2bEIUNUGo2zD8yQWvFK148+O3OWWAv9aBxVd3kEvwfx4l
	9zUy/vQzx/qVPY3wLbLeqBHd5winKN8tGEmP06RkTMqODhBL31ovLUmiHawtD24/Dr4OtkIA64+
	z8nk77BgUNWSqx3CrLOlDn1Hks9yZEaZA1hZrj54OBAa7qgf5mTJvgGgorrIdz22WbDi1m4dhy4
	zl+VtbfY2n4FVe4t4YeP7ETc9haM+h90sLWTKSEkH1K0lgBBJxCq4csm8uw1K9whOqcM=
X-Received: by 2002:a7b:c013:0:b0:4a7:1116:2065 with SMTP id
 5b1f17b1804b1-4bb851bd399mr1347485e9.15.1795201085271; Fri, 20 Nov 2026
 10:58:05 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261118220154.2965621-1-shakeel.butt@linux.dev>
In-Reply-To: <20261118220154.2965621-1-shakeel.butt@linux.dev>
From: "T.J. Mercier" <tjmercier@google.com>
Date: Fri, 20 Nov 2026 10:57:53 -0800
X-Gm-Features: Aa3M54oeme_MbHCPj8QJ7UbZJ3gKz6ac7ZgfFvJPWhUpehNdFPXUV52bzquf-SQ
Message-ID: <CABdmKX3DUR72jcgaH6zzEO54iFDpbAf8vGzpEi_tXEV+hJ6-mg@mail.gmail.com>
Subject: Re: [PATCH 0/6] kernfs: stop taking kernfs_iattr_rwsem for writing in mkdir/rmdir
To: Shakeel Butt <shakeel.butt@linux.dev>
Cc: Christian Brauner <brauner@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Tejun Heo <tj@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>, Ian Kent <raven@themaw.net>, 
	Meta kernel team <kernel-team@meta.com>, linux-fsdevel@vger.kernel.org, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 18, 2026 at 2:02=E2=80=AFPM Shakeel Butt <shakeel.butt@linux.de=
v> wrote:
>
> In the Meta fleet, cgroup mkdir and rmdir can stall cgroup operations
> on the whole host.  They hold cgroup_mutex and kernfs_rwsem while they
> wait for kernfs_iattr_rwsem, which every path walk takes for reading,
> and they take it once or twice for every file of the cgroup.  systemd,
> clone3() into a cgroup, BPF queries and the OOM daemon all wait behind
> them.
>
> - Our lock monitor saw a kernfs_rwsem writer blocked on
>   kernfs_iattr_rwsem several thousand times on a large number of hosts
>   in 29 days (in mkdir and rmdir), for up to 1.8 s at a time.
>
> - Under memory and CPU pressure the waits become host-wide stalls.  In
>   one week, we observed several cases where the OOM daemon and the
>   monitoring agent were stuck for up to 22 minutes.  In October, one
>   batch job caused these stalls on a large number of hosts.  On the
>   sampled hosts with current kernels, the cgroup_mutex owner was always
>   waiting for kernfs_iattr_rwsem (in mkdir and rmdir).  One specific
>   stall lasted 90 minutes and ended in a reboot.
>
> The write lock is not needed for most of what it covers:
>
> - kernfs_rwsem already serialises the parent's two counters and
>   KERNFS_REMOVING (patches 3 and 4).
> - The parent's times get a seqlock of their own (patch 5).
> - Only inode setup needs to set a directory's i_nlink, so removal can
>   clear it without the lock (patches 2 and 6).
>
> The lock also kept times and link counts stable while getattr and
> permission copied them into the shared inode.  Patches 1 and 2 make
> getattr report them from the node and stop copying them, so stat()
> cannot return a stale or torn value.
>
> After the series, mkdir and rmdir take no kernfs_iattr_rwsem for
> writing.  Write acquisitions, from lock_stat:
>
>                                           before   after
>   5 dummy netdevs created and removed       1850       0
>   100 cgroup mkdirs and 100 rmdirs          7500       0
>
> Latency in a VM with 8 vCPUs, while 32 threads walk cgroupfs paths
> (worst of three 20 s runs; mkdir and rmdir by a SCHED_FIFO thread):
>
>                          before                  after
>                     p50     p99     max     p50    p99    max
>   cgroup mkdir     2.8ms   9.0ms  20.1ms    25us   37us   84us
>   cgroup rmdir     4.2ms  12.7ms  26.6ms    28us   38us  107us
>
> A write that only needs cgroup_mutex waited up to 23 ms before and up
> to 34 us after.  With 8 threads and no writer, stat() and access() on
> a path whose directories have iattrs are 12-14% faster, since the
> refresh copies less.
>
> Tested with the kernfs selftests on lockdep + KASAN and KCSAN kernels;
> with extra checks of link counts, times and IN_DELETE_SELF; with
> concurrent mkdir/rmdir, setattr, stat, readdir and netdev churn; and
> with test-only delays that force the stale stat(), lost time update,
> backwards time, overwritten setattr and stat()-during-removal races.
> KCSAN reports nothing new, and its set_nlink() reports from the refresh
> are gone.
>
> Based on vfs-7.5.kernfs.  It also applies to v7.4-rc3.
>
> Shakeel Butt (6):
>   kernfs: report times and link count from the node in getattr
>   kernfs: don't copy times and link count into the inode on refresh
>   kernfs: don't take kernfs_iattr_rwsem for the directory counters
>   kernfs: don't take kernfs_iattr_rwsem to publish KERNFS_REMOVING
>   kernfs: update a directory's times without kernfs_iattr_rwsem
>   kernfs: don't take kernfs_iattr_rwsem in __kernfs_remove()
>
>  fs/kernfs/dir.c             |  48 +++++---------
>  fs/kernfs/inode.c           | 125 ++++++++++++++++++++++++++++++------
>  fs/kernfs/kernfs-internal.h |   2 +
>  3 files changed, 124 insertions(+), 51 deletions(-)
>
>
> base-commit: ccf2a4692fed0fa77751d32d2690585127a152c5
> --
> 2.53.1-Meta
>

Reviewed-by: T.J. Mercier <tjmercier@google.com>
for the whole series
