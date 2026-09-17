Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE40D3A6B92
	for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789658328; cv=none; b=OHsYdwAxKRR8F/0CL35SgzRihDFqVo+V1nrcKXxUIa0NOIf2Lc3Do0Ox4WvegiNdw+Mr1U6YxGddYht+tDVEpdMqUGghmof64n2nnB1H7lCv0nG7trB3TyzH4fKqdtrCXblvLwrCO+bi5pn8LzT4gEGuK6uQyRnIvAC7zxGyEwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789658328; c=relaxed/simple;
	bh=ei97T4Navrh7XZYuh9kk6IMlxOtE/I5ajJ7jAqFv5B4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VoYS/mxL6mbnBb3uO8qeB6bSgoyGI0kAsIBXdqxzuD50xrbkq5d/lx7+wdKfGDHL1XObtRJrkynuR/bemZOc28fl/C2uRAH0AcCEJUsKiJHCU64qTvS5MnaW4GfKTRfO5kONOUEzhCr5wEgbg3Z8cDM9QqR2hBO72jg48Wpv/J4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UWktcsmh; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UWktcsmh"
Received: by mail-pz2-f43.google.com with SMTP id 41be03b00d2f7-cc433d52421so591594a12.3
        for <driver-core@lists.linux.dev>; Thu, 17 Sep 2026 08:18:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789658320; x=1790263120; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=an16D1BLDmpgdn+H3vzSxv0+HLMXqJ/V96lgL35ts2o=;
        b=UWktcsmhWU0agV2GR/dai549AQj9U/0gGFddwkxRzGPAVW8DHc+FruGfUN03KK5smu
         Mz855l1wRsQWgAaG27Py7WBagnb8hdwW0beXQaF4mYHLqzqFw/a+n175RcI2ncO7fxRI
         x1wvj1RW2Pfj3Qq9IVdVkUDg+pr2LjNvXH3zd6txsZt9GXAbHpdNOj1MjCcdbhU00Xc1
         OnDZZ5dbYCEIM8zu53tDJFG4SSlx+v2KNE3OEtbJ2YC9Hzv79gMYL3Oei7hopWPxewRw
         I+pKG3fH582D7BZEOAt+lcQu9LJq1KOGhfYMJpi+WKY9CctZ8xCWsdZSeK1JBlD5oyeA
         9D5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789658320; x=1790263120;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=an16D1BLDmpgdn+H3vzSxv0+HLMXqJ/V96lgL35ts2o=;
        b=c9XMUfKV0DAK7g3/6NPLC0u/imRqlLLhRZRROqs43SeP4MfptfgJvnIocw3cnxjx3H
         w2F6lIVJxkEtYpl6mcIX5yN1Kx/wgVNS7SDW/St75Z1RHxcr45UJtIyNz6nqNxFxT34h
         6iHZdA5LGllIzG3nNw8nTIgqX8NEwVZp6WelqmRcd0a/4BkkKlfaZCkWfo/IhIwKZSVi
         pPbaEsm+ZR2osBUPSPdZ2F/p13fYhtxzmXMaHTAxYmU+ly60DLjpDplK4O9zkaDgja3O
         EI6cV7f0rv6d3l7Tc6m039SLvnI1YNrVxkFBLtO10WzuHLd45xih1+aXPMe+C4A2wlJv
         IOCA==
X-Forwarded-Encrypted: i=1; AKwUvBxTt4i8E1MtpKlens1owek8pJW/ZyCUWDPVCXfVTL7S2n3KB9Tpa3ymkbFhxkgVliH0Wibg/KznRKta2Q==@lists.linux.dev
X-Gm-Message-State: AFuF++mnyaSoTt2DFiCiK4xEJGdDPmYN0hHIGTnEh6lNp9bf4p9cJCiR
	7GK9UIoNuNwOk3+aYyFY5rUNPyQ78tdqb4E4KSdkTfX0HmAnObGykJhz
X-Gm-Gg: AYBFou3fCZKKnhy/rxTE2N4cVNpiuDjSZXDJVE0eN9a103YUSWeXrrcHlkSB9XRDRXQ
	xAEunwio83jk/XWsIang4i3gewii7nOgNizZPwKpt3TMXttF/FF9eTDEGNAhAz1t60Iddh2ShbO
	jc51OBMVXJHgB6e7E8BaBjLoJyc9oTVdEf/WlnViaLGunTW6o6RJrQBuhS799QncVZ0HTB1lLlb
	impxCT3TAiM1w3CaWbGvMS3SxQjgJZn9NLKCSY3UQncP5DuW8K3e7caNX+63LLEdYdqHhvlShmN
	keVYnOG0bTlKrAGgAHuMpoBg1aIxR2LCVPQUOmJjRXxKNwvVl0+rbNGF380VEvjrr1F8V7yoDOY
	NZgDAkAEvnYNjtkvlQytowDis7FVQ5XMqrNQonLSh+eEa5++xUQuW5bZ5DCl0hQu9dcQenPSZtu
	Jxk6Ak8I2IvqXDXmFyVXil05lOtdAR4YE78lECHJz+KoA4/iazsmtf+u/rZ6qognx098ZaLfvj1
	Q==
X-Received: by 2002:a17:90b:5848:b0:39e:3558:f91c with SMTP id 98e67ed59e1d1-39e3558fa60mr9348150a91.24.1789658319683;
        Thu, 17 Sep 2026 08:18:39 -0700 (PDT)
Received: from archlinux ([2402:e280:411b:ec:aa93:b1ec:5a6b:5fce])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39e3909d02asm1525287a91.0.2026.09.17.08.18.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Sep 2026 08:18:38 -0700 (PDT)
From: Adarsh Das <adarshdas950@gmail.com>
To: gregkh@linuxfoundation.org
Cc: dakr@kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rafael@kernel.org,
	stable@vger.kernel.org,
	syzbot+4393dfdddf166f2de2b0@syzkaller.appspotmail.com
Subject: Re: [PATCH] kobject: fix uevent socket use-after-free on net namespace delete
Date: Thu, 17 Sep 2026 20:48:30 +0530
Message-ID: <20260917151830.89024-1-adarshdas950@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <2026091756-widen-doozy-399c@gregkh>
References: <2026091756-widen-doozy-399c@gregkh>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi,

Sorry, I wasn't aware of the Assisted-by tag before. Should I send a
V2 with it?

For testing I ran syzbot's C repro with -smp 4 on master, with
multiple parallel instances of the repro. I was able to reproduce
the bug:

  BUG: KASAN: slab-use-after-free in kobject_uevent_env+
  Read of size 8 at addr ffff88800fa7f090 by task kworker/u16:5
  CPU: 3
  Workqueue: ib-unreg-wq ib_unregister_work
  Call Trace:
    kasan_report
    kobject_uevent_env+0xc71/0xd90
    device_del+0x7c7/0xcf0
    disable_device+0x1d2/0x260
    __ib_unregister_device+0x26b/0x400
    ib_unregister_work+0x19/0x30
    worker_thread
    kthread
  Allocated by task 498:
    uevent_net_init+0xe5/0x340
    setup_net
    copy_net_ns
    unshare_nsproxy_namespaces
    ksys_unshare
  Freed by task 63:
    kfree
    ops_undo_list
    cleanup_net
    worker_thread
  The buggy address belongs to the cache kmalloc-32 of size 32

With this patch applied, I ran the same repro repeatedly (including
parallel runs) and did not see the KASAN error anymore.
