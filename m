Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7DF4FC8F4
	for <driver-core@lists.linux.dev>; Tue,  8 Sep 2026 09:18:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859138; cv=pass; b=dthKiYYSbZWUi7HFbLY/Bdp+wZ/NPGaTNV/2BsvIwTpoX7b/4/kTPkOhGzxICH9Sz9cPymdnztM6k+ayKIikv0PHgUdAI/OUMBKHNU/SYTnAluj2Q1j9wcA24Zrm8LDBs7GLU3wP/z96ZLR3o2LLczQthjE2m+TUmokPhhw0C8w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859138; c=relaxed/simple;
	bh=eXO7Dx+pbjhDr44qla+xgyZaF085tCxcRrffYGenIAk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bkAPDPLHliIeHaITDjW72sldjF+9/Xg1Yjrx7eOlXhGv8FgA4zkhiXFTa8L308tMcjVl05JOHqAVM3tCSV2VWN9Fdtk6+YaU+QBU92Fkb9vDN+g+6f/mOIFQlSSQ2cZwsksOfZs5MRGwnVMn7FqIfFDQ+76IKL5rY/NVGjar76I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oKDw43YN; arc=pass smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oKDw43YN"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-47de0093c42so4215742f8f.3
        for <driver-core@lists.linux.dev>; Tue, 08 Sep 2026 02:18:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788859134; cv=none;
        d=google.com; s=arc-20260327;
        b=p9Ks3wxzIc3BSoT9ggsWskCsfXnsxG2uKmBVKK9yt88K/wFijh2aF+nJgNsChRgDNV
         uRy2PCsJss1KgrDfCEIVuKrjPoakEJjqsMnH8GV0HA8/fp3a+I77wHvi7hRuWoN+/UYj
         DGOIGConiEgCUBQOQI1LhBA04X/oo8hVmktfcBPlHCFPyAVZ7oQowr1nIOLSou11ICYP
         67auUA9rbwuehNusd2kzVhGvezKlqPNF368OLLa9AqXR8y9H4lqQ7f8bSjOyE8rWj+Zj
         VmBLk1IwWXggYaphzv0P4dOHF3aA8n/5hZ+rd6+MhKsvFbHn/77YJlxYEY01c38RMJZ6
         y/OQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VIgSHXB8I26MCbzgx5LIxLwOOEsEsffKtC5qMFw/5wM=;
        fh=xeM/1z0469wTHnxg25XoqwpWBDtaGlqDmCEvklwRDGc=;
        b=kT0IgsE1t6oQEFxQtJ95F5WsHB98r3H4rBV+1ZWXEKEQmoR0lLg7zU54feoMpZjs4C
         BDqkHIworAIIMPrsaWksB0Syfc2Qqd8xZdyMbD+m9qlWFI2FbBy9wgyUnuTIi8EZDW6r
         /s6bALSnpj1qaceaOnJTY5quvPYpxZzXEBi8l4WrZFVVMU6TgHQOjLeP+/iyVJCcAvV2
         JfOCaO9nNd23kKMaVuan3LeAwBUldfsvpBY+tP1YvGajxYjbWG1Z23kChKNsNKezLNuk
         YmStqNGfJK1XCuFq2CTF+yd0szoRG2Y8RwzpNQ4KsNr9bJnJ21gJ2znGMX4M0Ku/6bM0
         YxdA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788859134; x=1789463934; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=VIgSHXB8I26MCbzgx5LIxLwOOEsEsffKtC5qMFw/5wM=;
        b=oKDw43YNshtvXCYIKyOjBvcN0n0csve+8tnR0AhO7IVTHNoMu8FE2xM3/FCJIag8Tj
         MyC+n/jxsJUx6lWICYqrAlgcWPhDEszZbqeAPdVxo2bDdKm3Xq9qeRr5YCOYiYpPfXfI
         RFHR2QBL5yvTTzdE5ilK32BaLgcX8XCTFH+N/tWnMdnvQHIxswX5pK+7fI/g/gUlE5Ao
         R3GWWVTlbO/EQX0+lvFVwtoS62zDCjrgzAzNsRGrk0Nhy6phc67yzTpzKe0azR9iCucr
         8Eoe6j5QmkLFVJBb89wVxROMP3uE2PLnsoyj88rn/33dKizv6CqZYMGek7CfdkB0/45K
         ENqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788859134; x=1789463934;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VIgSHXB8I26MCbzgx5LIxLwOOEsEsffKtC5qMFw/5wM=;
        b=UzMVC+7dP0TVGc/ThDY6v42/8t0y1xUk6nEo+NMdffmdqpPz4yTxUEkKeTj4lYoMty
         WCNLbMXB4J3eqGt4nk77HdNL5wQu5RHOuluU6SLClQOE/LI4Cl6RcG8wXfrhKk6W58Lf
         YtoGP+8+c+0kaBYi0g+Huvjt6Xcso5b3ttxwcCKDS2xq9HDu3KN3RT/8TNnNx9bZFLDQ
         YbzmBwf82BevKwZDm/l1amsaz8CEjRL9crgOb5UzWfBjCkcl9WoBmYZIgcrf1PQJK7qC
         dUPUUOdEGBGAJ80HW6cCpNOMPClzwK9MIihgN2bl3706SsrTqFWlaXEdVh6Q/iJu5QtV
         wmjw==
X-Forwarded-Encrypted: i=1; AKwUvBwbAApdSiCc7jMKNelezs2LkPBeafQgdLEoQ7M3nA2obhaH4PJwoj+5ykib9ZXyfycqUv+WmhEy1xsPLQ==@lists.linux.dev
X-Gm-Message-State: AFuF++n8mJc1bhhAJ8xuC/O0XyrZyUJmtljLouoyDf8iqvxFXWS3Nn0Q
	p0uYmwv5xf+s/vuJLRwZqhf3kEkP47qWhqQYMPX3g6motqHMQxQ0RzFpmh9xB+Mwd8kfFNbI8Y2
	YUmhZBWMf89Smef33yhO6YSWRVz2f1/LV24GAnn/J
X-Gm-Gg: AYBFou3Ek9zvdMlJdyzIXsZM+ly6mKhwN2N0BaklSxFyMIQA+dSXUNpJjRRlRWOdCF6
	WKW1ApMtj3L44mdl6O0R16Px9oveOODsDQlQop2hAMy6Ky6Qi3VqZA7c4dYrQ3azfdYNS32XAeQ
	zy5nRux//RklKfSbE1naR9wu4YkHp5l+K6wxCnZP3hg9nzjWNYqhg5FTi4Nzn3uuxQcOTWOpVU9
	CeqJpN3bonHLTiWwW4cCckNDxSjzEf1F3twJdP3AHTR3pfFf6TweFgbftMgWi3CNm2/im4I/60Z
	TMw8e1yI6b4m1wR7Yqq083ksUs7hnZ2THi+u/jHWNrZ8B53Cs4BLAkztxztohUZg/7bS5FWf7QB
	s3tEeppcJeh/RZLgC5AjXHDygZ8c4sA==
X-Received: by 2002:a05:6000:2584:b0:485:8c16:5efa with SMTP id
 ffacd0b85a97d-4858c16617emr27731999f8f.52.1788859132844; Tue, 08 Sep 2026
 02:18:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260824-unique-ref-v20-0-490735672187@kernel.org>
 <20260824-unique-ref-v20-4-490735672187@kernel.org> <ao2WubjLtDuHvRzx@google.com>
 <DL894TFXM5AT.2QOXN683UKXIF@garyguo.net> <CAH5fLggAMfBcxprKJxs4JbieKadC_mKg4B0xNETOH1QUi72UGQ@mail.gmail.com>
 <8733vlxmm8.fsf@t14s.mail-host-address-is-not-set> <2dpwVpJS3VbfQ7CmE3HeY4IJSSMXTP_O9sSP3HHHUD7Z29RNEG4Hc0m8f94jKWjFlekcTXvIBA-QdGYrf8w1sw==@protonmail.internalid>
 <CAH5fLgjEfZO9DwcUxaKCWd_hFUrXU+cxiwmRg1UnM2pKD6gPvg@mail.gmail.com>
 <87zextw4c4.fsf@t14s.mail-host-address-is-not-set> <CAH5fLgjYmvp1Ph3dYXnTKkAvWgNpgCAPeq_7PZhRai6pCNmVmw@mail.gmail.com>
 <87qzj4w2nw.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87qzj4w2nw.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 8 Sep 2026 11:18:40 +0200
X-Gm-Features: AcwNN1VPjOtQdlrm_QvCyA8uta8erft96HkhfUzl1dJDcrSqVwPtKidMELQvEqo
Message-ID: <CAH5fLgjrQDWSPX-81TNdnc=AU3Jge57vUJ_SHCn8=uUyGfRq=g@mail.gmail.com>
Subject: Re: [PATCH v20 4/8] rust: page: convert to `Ownable`'
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Ira Weiny <iweiny@kernel.org>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org, 
	Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 11:00=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Alice Ryhl <aliceryhl@google.com> writes:
>
> > On Mon, Sep 7, 2026 at 3:58=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> "Alice Ryhl" <aliceryhl@google.com> writes:
> >>
> >> > On Mon, Sep 7, 2026 at 2:38=E2=80=AFPM Andreas Hindborg <a.hindborg@=
kernel.org> wrote:
> >> >>
> >> >> Alice Ryhl <aliceryhl@google.com> writes:
> >> >>
> >> >> > On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net=
> wrote:
> >> >> >>
> >> >> >> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> >> >> >> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wro=
te:
> >> >> >> >> +        // SAFETY: We just successfully allocated a page, so=
 we now have ownership of the newly
> >> >> >> >> +        // allocated page. We transfer that ownership to the=
 new `Owned<Page>` object.
> >> >> >> >> +        // Since `Page` is transparent, we can cast the poin=
ter directly.
> >> >> >> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >> >> >> >
> >> >> >> > This doesn't satisfy the safety requirements of Owned::from_ra=
w()
> >> >> >> > because the page may be used with vm_insert_page(), which incr=
ements its
> >> >> >> > refcount and causes it to be shared the vma system, and this o=
ccurs
> >> >> >> > before Page::release() is called.
> >> >> >>
> >> >> >> I suppose the existing vm_insert_page() abstraction we have is a=
lready
> >> >> >> problematic, because it uses `&Page`?
> >> >> >>
> >> >> >> Maybe we want to change the API to use `ARef<Page>` so it alread=
y has to be
> >> >> >> shared? Conceptually it takes a reference count from a `&Page`, =
which isn't
> >> >> >> possible because `Page` is not `AlwaysRefCounted`, so it needs a=
 `&ARef<Page>`
> >> >> >> to be able to do that op.
> >> >> >
> >> >> > Honestly, the problem is the safety requirements of Owned::from_r=
aw().
> >> >> > Pages have a "special" main reference, and free_page() does more =
than
> >> >> > put_page(). It even does something when the refcount does not hit
> >> >> > zero.
> >> >> >
> >> >> > The correct behavior for Page is to allow the user to hold one
> >> >> > Owned<Page> whose drop calls free_page(), *plus* any number of
> >> >> > ARef<Page> references that invoke put_page() on drop. This way, t=
he
> >> >> > owned page controls the special drop codepath.
> >> >>
> >> >> This does not mesh well with the model of `Owned` behaving like
> >> >> `UniqueArc` to `ARef` behaving like an `Arc`.
> >> >
> >> > It's a different case, I agree.
> >> >
> >> >> Please help me understand; with page having a main ref and an auxil=
iary
> >> >> refcount, if we model that with a single `Owned<Page>` and a number=
 of
> >> >> `ARef<Page>`, what would happen in the case where the main ref (`Ow=
ned`)
> >> >> is dropped first? Is this legal?
> >> >
> >> > Yes, it's legal.
> >> >
> >> >> My intuition here would be to follow Garry's suggestion and have
> >> >> `vm_insert_page` take an `ARef<Page>`. Can you elaborate why this i=
s not
> >> >> an option?
> >> >
> >> > That would be the wrong ownership semantics. The C side increments t=
he
> >> > refcount rather than take ownership of a passed-in refcount, so the
> >> > correct argument type is &Page.
> >>
> >> Or `&ARef<Page>`? Because with `Page` being `Ownable` it would not be
> >> OK to increment the refcount from just a `&Page`.
> >
> > That's just a limitation in your traits. There is no problem with
> > creating a refcount from just a &Page.
>
> Yes, I agree. The limitation is by design. My point is, `vm_insert_page`
> can work fine with the `&ARef<Page>` type. So if that would be OK with
> you, I would patch that as part of this patch.

IMO, Page should implement AlwaysRefcounted and this method should
take &Page. Anything else just adds limitations that are not needed.
But I'm ok not implementing Ownable for it.

> >> > Now, for the use-case in Binder I believe we could switch to
> >> > put_page(), as we don't need the extra stuff from free_page(), in
> >> > which case we only want ARef<Page> and do not require Owned support.
> >> > But as long as we are calling free_page(), it needs to not be
> >> > clonable.
> >>
> >> You are calling `__free_page` directly in binder? I could not find thi=
s
> >> with grep except in the C binder. Is this code you are calling into fr=
om
> >> Rust binder?
> >
> > Via the Drop of Page, not directly of course.
> >
> >> From `__free_pages()` kernel-doc (`mm/page_alloc.c`):
> >>
> >> > If the last reference to this page is speculative, it will be
> >> > released by put_page() which only frees the first page of a
> >> > non-compound allocation. [...] **If you want to use the page's
> >> > reference count to decide when to free the allocation, you should
> >> > allocate a compound page, and use put_page() instead of
> >> > __free_pages().**
> >>
> >> I guess this is what you are referring to? We could change `Page` to
> >> this style as well and all would be fine I think?
> >>
> >> At any rate, today I learned about Pfn walkers, compaction,
> >> memory-failure, etc. that take transient refcounts
> >> pages. With that in mind we need to reformulate the invariant of
> >> `Ownable` to exclude optimistic transient references.
> >
> > Yes we can switch Rust Binder to use put_page() and have Page not
> > implement Ownable at all. That would be okay, because Binder's pages
> > are not higher order.
>
> As far as I can tell, we can also switch `Owned<Page>` to allocate the
> page with `__GFP_COMP` and use `put_page` in drop.

I'm not entirely sure if __GFP_COMP is needed, since the page is order
zero to begin with, so I don't think it makes a difference.

> > But this case still does highlight that
> > Ownable<_> currently does not address the use-case where the
> > Ownable<T> is a special reference there can only be one of, rather
> > than a completely unique reference.
>
> This is not the use case `Ownable` aims to solve.

Maybe not, but then it doesn't apply to Page.

> > For instance, the GPUVM abstraction would be another case where
> > Ownable<_> could be used if we have this other model where Ownable<_>
> > and ARef<_> are legal at the same time. Currently GPUVM uses a special
> > UniqueRefGpuVm type to solve this problem.
>
> I am wondering if we can make case I intend to solve (Ownable is a
> unique reference) coexist with the "at most one of this ref can exist".
> The "at most one of this kind" sounds similar to the `ListArc` use case
> to me, which is a different problem.

I think they can co-exist. If AlwaysRefcounted is implemented, it is
the ListArc use-case. If Refcounted but not AlwaysRefcounted is
implemented, it is UniqueArc use-case.

Alice
