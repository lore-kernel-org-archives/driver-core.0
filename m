Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793697274;
	b=3yCFU3UzjTLzdaVIKhR+XZGfTGDVgIVzRKDOIgCkOE93n1Pf0EdtLejYKFXpwA3ZhRks
	 vX4P9GOnBME0eStalnyegvaQeCwsj9XA+JidyrhgKbgeqCxeRHxnI+YT3WeoUod1HvIJl
	 qt4wDDX4Dvn0Cb/IyzBdV+QjUW3irOiUR+fP90C3P8kf/8FvJr3preo5FflrDxbWGgqTs
	 5Bmu+ykQROZ5ufop30YilextQQpUolOj0ZLP2H1honJ/oJ6MvBxWA80Q05kEWMpe4FZ42
	 AeAxat80c7fmR2+pkwAvsgj/ajKcvML49DzzT4sXhaHD2EROca2HGeNiYSHUvix9Bnw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793697274;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
	b=k4Xj714di/vPIEe36eoceoMMyjQkMG+Un2G8a3MX2NJkJJiTJ8arS+fMP9plFDYteW/p
	 OK8Ew3CY41MaHMbE2TfDrY8dWqVmGjEXLTyym+n5qmXHN/GEp1vIVIcSDcxlAf6OxUg8j
	 kgDw0BdJY/v86ObzYNep8MVQfSy728Lh14O3Q8tO6zuoXmMsuFkKYKpmHrFeaTvHBTOeh
	 ommNd1428TOkbLqgUVl/RFb1zPGIDyFKHkj1NIkFk6X0SwSNdFdtvSZQEifgzxCtcL9Eh
	 5O5uqmz5wWBQ6PhGvnBhIfgw2iDOeeOp3tICvrV24IBwByaRrrUDfB45Mz5DGIR+DVA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWtsNxlF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.160.175
Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 879B5606A338
	for <driver-core@lists.linux.dev>; Tue,  3 Nov 2026 09:14:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 879B5606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=UWtsNxlF
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-54492d8a988so203911cf.0
        for <driver-core@lists.linux.dev>; Tue, 03 Nov 2026 01:14:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793697273; cv=none;
        d=google.com; s=arc-20260327;
        b=mRTrcRbVJcD6uDeulYxcxOiNOQeZpvnJKbkjhn5iXnUb7KQzlXnAyZyOY7Y5okpfMZ
         YMW6Fb5ivFgL1DjDYB+8hFyahYP152CMOeWjsPImR0+HxeOVzNv8JYpLdIYEI63fsxlj
         0WNRoE53tbehZrkSZ9OGLJm6PVWCgEWuKNzLwal/j39mvEjHwxrPt5lwLyp1+a4GCC5M
         /vkBK7+7vfPsTyJCw/sSQtxSzvN4cJo/OBMWGc4O0DjmBT92hN20+1nJvTGvazF6XWEp
         f6aBaVC4AhDUDKRAR4LahFqzy7qaYB6ldYY1PX0tX5cZfeuNzaIENz+WhHV0vFVGmoe/
         /qgA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        fh=YKCI7Kaap15XeMs1mm/eeyXsPXhFGJ2bYxUU1eMbnjE=;
        b=KeZg6j7Lq5ko2WHyLMnoxGv8f+DD58wCI+94kEmWHTVfTcLhzuskexSPlhui/c5pvC
         DmR+RjzGlKQkpFnaJPoG9W7aa1SNaYf1Obv7oxxXZ+6kQDSt3Kr0xTwKFaojwo0rTITC
         hanE0N15hujePV2U9vKCcMbVGNZ8zgAVGFGmI1qiwSlvCQRdd2evLXlu+j02MFKQZZCB
         qrQuY6ekTj3Br9TeuYKUwKRyIozFJCrUYILQSa/1HaTpTfoGKpuE5Ir3OCynw7hHsujX
         FAGoBxW6VnypLF+tW3wBbWhpM2YL2EpzOPo64tuagQkkt0lCIxtqotYcqI2Z6V594Y3i
         ZNbg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793697273; x=1794302073; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        b=UWtsNxlFdsDVZeJNt4xNwoT8N1zA9gB6+AXCml4JSJpObFQD6ThzDrh+WYT8f/HuWr
         va1jROxT7dXmwUnZDuWkyJERPa3SCwjznkpxGtYmNR6ZH1LBlZuqiazhtqPx2qZyUFZw
         CAWU1dhaWbie8DomaKgAEasTdtXnMIqEba1b0sZytBD4okBaSY6SSyFXuTdFt4GhgBbO
         XXop+UBewOCmHvxSVga3FSzquANdKltiodZq3Tn7j/lcLQYhXiorpO4LLI4KFLajrkNn
         bk4vzrROX6bM6yhc5lf8n3mK59si3fLYKws81xA59X+uveqhGoSYKOO4tpuYnLTk9nj7
         gTDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793697273; x=1794302073;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=i14dmH5BR+9SimyzQMrEk5iidp8zGrGHl7mp1tLTg74=;
        b=fjRH2T+c43aEAtDlTQ8jRASVujDLC8o0QpdLv0ZM16dKpygaAiGraYde//dd/qjFkH
         S3x9/PO12OypYPaZP3nQOgyyPvJnUdPOtvok+npb+yNgHa7jVpHqCGqvG7+RVVwNI73T
         c0Y0TdthjyPaHqLYuh19dwOdzEGGe/HIXQ5xBF8kELESOfTf3C6e/82oqUi66kB6AoNA
         E4owi38CZRdbujPMw2+A4VgJ9txWSqm149Ya5f0XaLeboThjJdnqm8QiZOdmM/RDincd
         Y2BCDEsj1PU9sxcDqkjr2nAWpTe4JrjFDa38rkJOD4knN1X5D8vPPBGjntaGaf5oJhHD
         S1fQ==
X-Forwarded-Encrypted: i=1; AKwUvBwngkkqt8iA9mRVnbEzflaKieB+cVrFZvuSzuxlTLAMvsYy+nzf4rfzCazG5tvQnKoopmPbgjnMgbO0WQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z8xebUB0KObBc5dnAOpdejbLvsctwXLnJ1GdQEmVNnYeZpCdu2w
	Fd99ouD9tD5abHNloe2K8P6T1ME+izTM5tA6YDyihbx0/7pWXb4R7oQTuHy3lsmFt8Qrn7SnKb4
	Aq0vbsk8Ao9qGaWNSXpKQlyHQfIYbOhGqeCNw2FgI
X-Gm-Gg: AYBFou19YT2lcyHJOQOdNGtcKQGYV7ykpZm3aZSaiedPBP/0h4ksRKGgX8dacj1Ho4Z
	x0pGHpjAaQ1HUVwnKb6MK4uu1uOmvBbKeLcA7CBVTNDD23DCDy7MRDs1jB/tIM/9wisRsBWqj5O
	Fo7PjPZexzca/8QrA3svPct01cgWQqlM/8AOKReWbRkiJ8pxwx1SKq1LATEzSmvcSQJxe8xvJJv
	JEtmav76bn/COSETlHrPtglbvUh7s+sWetQjtHgLgAiIhXOgN4cnLlxxUer6tMQ7jERLJgKv3nX
	Egb3C5ZNtpbaRUTOutBXMiiwKdUzRIcJM066EDJQRBBvGBWtmuvAHdH+TuF97aShaW+YOfHyUj6
	8k4+QbITUobsgGgrmQMswFkOuD1TLGR1NaGwyZWmjLt1hthiKgmhyVbHx94c=
X-Received: by 2002:a05:622a:598b:b0:535:84ef:2e26 with SMTP id
 d75a77b69052e-549dfce05fdmr11810771cf.7.1793697272817; Tue, 03 Nov 2026
 01:14:32 -0800 (PST)
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261003212241.3432303-1-lrizzo@google.com> <0cc1cac1-a500-489b-9c1b-b49598b5550b@kernel.org>
 <CAMOZA0JaiKsRgDdjHkL_N+MshhcyLSv+cT9SzEbNsC_sumHvOw@mail.gmail.com>
 <b31efcd5-149c-4edf-81a2-1744d363c390@kernel.org> <CAMOZA0+6kAbwgNwGTsCT5AqpwcZKz4pziEGC9UpHkNCVoqrF-Q@mail.gmail.com>
 <20261022201229.GH3381610@ziepe.ca> <CAMOZA0KaanmevmvWS=M3gKfBeborzfCQTiF_xbSeYMWbozG7Mg@mail.gmail.com>
 <20261023140107.GC3977851@ziepe.ca> <CAMOZA0J+MOLv+s4PAvsAK1jbasnbQRyHffZw1VEKutH9Vr6ODw@mail.gmail.com>
 <20261023145023.GH3977851@ziepe.ca> <20261103080933.GA4213@lst.de>
In-Reply-To: <20261103080933.GA4213@lst.de>
From: Luigi Rizzo <lrizzo@google.com>
Date: Tue, 3 Nov 2026 10:13:56 +0100
X-Gm-Features: AclHuK_l2TEIEs7qqznKn-9_c2yONWQ9t4tXrp8CyyoGHrPwnIyHLaBfgdlxlp4
Message-ID: <CAMOZA0+Fhq0_Pm02xGWpex06vb2y5pVzuFxOk=URZB7aq0xJ5A@mail.gmail.com>
Subject: Re: [RFC: DMA_PMD 00/22] DMA_PMD: PMD_SIZE-backed IO buffer pools
To: Christoph Hellwig <hch@lst.de>
Cc: Jason Gunthorpe <jgg@ziepe.ca>, "David Hildenbrand (Arm)" <david@kernel.org>, Luigi Rizzo <rizzo.unipi@gmail.com>, 
	Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
	Marek Szyprowski <m.szyprowski@samsung.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "David S . Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Jesper Dangaard Brouer <hawk@kernel.org>, Ilias Apalodimas <ilias.apalodimas@linaro.org>, 
	Willem de Bruijn <willemb@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Joshua Washington <joshwash@google.com>, Harshitha Ramamurthy <hramamurthy@google.com>, 
	Saeed Mahameed <saeedm@nvidia.com>, Tariq Toukan <tariqt@nvidia.com>, 
	Tony Nguyen <anthony.l.nguyen@intel.com>, Przemek Kitszel <przemyslaw.kitszel@intel.com>, 
	Alexander Lobakin <aleksander.lobakin@intel.com>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, iommu@lists.linux.dev, netdev@vger.kernel.org, 
	linux-mm@kvack.org, driver-core@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 3, 2026 at 9:09=E2=80=AFAM Christoph Hellwig <hch@lst.de> wrote=
:
>
> On Fri, Oct 23, 2026 at 11:50:23AM -0300, Jason Gunthorpe wrote:
> > > Disk I/O is still potentially affected by the same problems
> > > (cost if io mapping/unmapping, iotlb thrashing, bounce buffers
> > > in confidential computing...)
> >
> > The disk folks already have a proposal to address all of this using
> > io_uring and preallocated buffers. I really doubt yet another version
> > is going to be interesting there.
>
> Huh?  If you mean the dma-buf I/O it doesn't really have anything
> to do with disks, except that this is the first user.  The dma-buf
> iovec can work for every ->read_iter/->write_iter consumer, and
> should be adopted more broadly.  Including by networking instead of
> their own totally weird different world.

Christoph, is this the dma-buf series you are referring to ?
https://lore.kernel.org/all/cover.1791975048.git.asml.silence@gmail.com/

I am not claiming that my proposal is a good fit for disk or accelerator I/=
O,
but every subsystem has different constraints, so it is not unreasonable
that a proposal for (N)etwork and a proposal for (D)isk focus on the
different bottlenecks (still there can be learning from looking at the
other solution).

As an example, in networking we have to deal with the following:
- typically at least two buffers per packet (header+payload)
- often, very small fragments (1400-ish MTU plus crumbles from
  data in different buffers
- extremely high I/O rate with almost no spatial locality, which is an IOTL=
B
  killer and the main reason behind my proposal and some of its complexity.
- on tx no good way for the application to pre-reserve buffers
  (buffers are sliced from a 32K per-task block,
  going to possibly different destinations)

cheers
luigi
