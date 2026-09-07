Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D86F4F4739
	for <driver-core@lists.linux.dev>; Mon,  7 Sep 2026 14:07:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788790029; cv=pass; b=UIOH7YRTVWhdM8ilH9RB6RqrMqP8sKqOuGubQz+vy5NDx2w5Ui2c/1v6aVKmwSmq8Vez3isKQbJpzHO2CKi8j8fRsKHSFo0lkJ4AH+L0T4XpYnk8H52BPujOgNOpA5Lou1bBP4xwjbz+iHBBUrBsu6mhjZzxJrwxUE/4seJ9udw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788790029; c=relaxed/simple;
	bh=HvMD0whYP38ILXbRvW4RQd+DD6z86Cgv8Z7FhShCV6w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Z+W7cRGzTWxkH4DwRBi/jywaag71eaUO3l0sqI8PdO3CqNxQcG8I6vrvMujZKJXnwQOUqkMnk8vfppM/fwPMBwZkrWGCjVyF3gPx9P2m0DarOeWOOCvqAGMuxpFQpFEbqsV8o7yB72TxuXZXS7bn5FllgRuPA2s6dYfBV9b/CvI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EsJl2rQB; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EsJl2rQB"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-49ccfae359fso32182565e9.3
        for <driver-core@lists.linux.dev>; Mon, 07 Sep 2026 07:07:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788790024; cv=none;
        d=google.com; s=arc-20260327;
        b=oHJw/oOVJgToDNYZ6l7osuuZamqwNHjQjDU+VvVKN+g/s25mBQgipiSk3+lCMUK1Uo
         IdNqLD0TuQMKt1sutsVvVP3beqlLIqPD4IRqXtuJFlm5eJz2j1xbpD5iai4FdwkiWdKI
         zZ+j9JodGvY7oVchPdWk6O1Gn31RpjIee60v6nD6VyhSykqabvwL8UkKWt1Bn3wzkPkD
         vbhxRJaoLcia5fFusyNzPgV1nzhxh6/7ruZcO9s4Y0YsGBqHKexPN20OCAURJv8zgm85
         gE2Nha2sZ7bAvZSmAH1GqvX7+nFkUVW2erCpdZHH1Iv2aABQjAPz0S9a00GnCRkCQnEQ
         BqxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Vg2AiEFa68ARzliVtiEYWMnugqjIY8Sb5bHhQpyrHpw=;
        fh=Wdkho3R/p/sn6eIKgKh7e9WZXMt3QTKxIKnsk3EKAO4=;
        b=kx4PdCe1gSNbgcQWeq7g1rmaRSiZAadMkP4++Tytq7+FZeNTqQ9V9TQOV1u0LIU19p
         50kMZlMqyhOLD9JroujpdbooyFbrolXsY84X0bTB1B6V9kV5hIa6F28HsUfsFmLIaZnz
         gBnqv3BERWMqCp7fdXmMV/upe7cBHBlDdL6sIMZTWVm6ji9FdR6YkCFUscA7Fy2EcP4J
         W1TYLvUG9/djWXFKsMAJewWuBP4jqJNeMWf622Qc5GBuysbxTFyCAjFdQKzgTYt1v3QZ
         hStJGfbAiBYKyWw1nGCqGWG2p2uxAAkhBTjoGLOx8gImUd0mimTFKux4riP9N1PhDv0U
         SMGA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788790024; x=1789394824; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Vg2AiEFa68ARzliVtiEYWMnugqjIY8Sb5bHhQpyrHpw=;
        b=EsJl2rQBoittSfSanJdWa8za3V83WmUP1h2ESOrY5PNI0lFc5CIe49GPe/j91ilXxB
         T1IVuGOd7yKJXHFRchRz5/e2ch5XXE3vgctTaBSjaEEHUnmJq0AB9sBPS6CDanbeFMyB
         No6sDglXmVU4ea3He4A2ouvvrAD4UQDdG9dKqrOTUMDB1EnoJDHtatc0goOwaNnv2SZK
         pmkmxL/IX5bpBsxrb5E3WcvBLhfq+e80ArU4wv2eL/wRNegOFs8HmBTpg/8kmjm3TGhF
         hrnyCfJLXK7uxNIeCk3hq+luCa8b/3HFC0IJDuuqjU3O8QcdAMW1JYLZcqr2+Q2EY708
         v8dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788790024; x=1789394824;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Vg2AiEFa68ARzliVtiEYWMnugqjIY8Sb5bHhQpyrHpw=;
        b=kecnRduzxX9JGl1bG7Q5zWkD7A4Wm8zL+Ysdxpgwvqpi9CuizC+wPAlf8LFgIP00on
         lcKCyFS+zLgPaC22eA7mEiGYTPXF120u+lB9tmjB8GC3Z5nNRseP3FZ6Oouv2UmzBKUL
         sMY9Z61wCJUMACRq7HbviBq4r+LB3jd9jlFkBr5bfZ6VY0U2z+TCunFIV3SQnQtEnfQl
         AQLXb8TGa/oVH5lOsXLXUTjEZQXzqSFSNeUNpN9kOFijpqfX1lsUS4LjLIISg76wPw4M
         A4fIkw5X6ykkHxSsqOfSW7R0Rm8pJr/Ctyo8Vkc/DRcPJxPtJJYOjJB8KTGXT0myvruP
         IVEg==
X-Forwarded-Encrypted: i=1; AKwUvByfChcNTzzSJ1qFUtjg8ITAqarTkkCEd3HCnRtMmc/6gZENo0bz9AJcf1/kzOna2sOfAAtJAkhHXO4+ug==@lists.linux.dev
X-Gm-Message-State: AFuF++mWMo7aGiSM66hy2J9RP0NQ+ffsNJAuctzNqWXbcjYYwF4d2RIW
	S9QWhJAU58yVjAX9fwsY67TM3ZtaYdJEWYvnXCfA3WBvOUaaFxKoUwCyy0kEk0GV5MPNIuXZqAU
	qdrFrziju9u1EkOXjKTyJKVmBeoM6M5dsoQZoCpS0
X-Gm-Gg: AYBFou0iT3beyRCqsZCen/D1OQ0GSDtvzADs7PQzaHbn1PzPhS6ibhB2os/arhdHjKe
	L7w6IzWy0Uy5I7egID3VHK3NmP7Sfw6N71bFNJL37GqGL2smNmilmHoPcocXsYh+nkE9TmTGGz0
	NTCMxv8hc5kIZsoFGQoKPWLErYU5GJXOns7H6MOrl5mUpNjbOi2lLFPnwZI/KBAEg67NLI7fGZm
	WXlxd5RWCXvD53oyMmrhtxSz4wTRhQNi+c6VmmsaIERf4U+DhrzN5agL0PyIAS+mL4a7sibSnTl
	7BD8H17VVbHSFMc58HUPQ393Tl4Gc637RU1ev3nHMpwLsNfovyRUKWIkYJZITT32yhOWKUAun43
	Uf0LlylUYxA004+nlrIuZSFxfKuCMgJU=
X-Received: by 2002:a05:600c:620e:b0:49c:fc6c:be19 with SMTP id
 5b1f17b1804b1-49cff2078b8mr196871015e9.31.1788790023400; Mon, 07 Sep 2026
 07:07:03 -0700 (PDT)
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
 <CAH5fLgjEfZO9DwcUxaKCWd_hFUrXU+cxiwmRg1UnM2pKD6gPvg@mail.gmail.com> <87zextw4c4.fsf@t14s.mail-host-address-is-not-set>
In-Reply-To: <87zextw4c4.fsf@t14s.mail-host-address-is-not-set>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 7 Sep 2026 16:06:50 +0200
X-Gm-Features: AcwNN1U77QgBa8sE7Mjd0WimH4SDjDY5r-Et6lPB5NUv3A9JgqpUTtiAXpyWSl8
Message-ID: <CAH5fLgjYmvp1Ph3dYXnTKkAvWgNpgCAPeq_7PZhRai6pCNmVmw@mail.gmail.com>
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

On Mon, Sep 7, 2026 at 3:58=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel.=
org> wrote:
>
> "Alice Ryhl" <aliceryhl@google.com> writes:
>
> > On Mon, Sep 7, 2026 at 2:38=E2=80=AFPM Andreas Hindborg <a.hindborg@ker=
nel.org> wrote:
> >>
> >> Alice Ryhl <aliceryhl@google.com> writes:
> >>
> >> > On Sun, Sep 6, 2026 at 3:02=E2=80=AFPM Gary Guo <gary@garyguo.net> w=
rote:
> >> >>
> >> >> On Tue Aug 25, 2026 at 2:20 PM BST, Alice Ryhl wrote:
> >> >> > On Mon, Aug 24, 2026 at 01:17:56PM +0200, Andreas Hindborg wrote:
> >> >> >> +        // SAFETY: We just successfully allocated a page, so we=
 now have ownership of the newly
> >> >> >> +        // allocated page. We transfer that ownership to the ne=
w `Owned<Page>` object.
> >> >> >> +        // Since `Page` is transparent, we can cast the pointer=
 directly.
> >> >> >> +        Ok(unsafe { Owned::from_raw(page.cast()) })
> >> >> >
> >> >> > This doesn't satisfy the safety requirements of Owned::from_raw()
> >> >> > because the page may be used with vm_insert_page(), which increme=
nts its
> >> >> > refcount and causes it to be shared the vma system, and this occu=
rs
> >> >> > before Page::release() is called.
> >> >>
> >> >> I suppose the existing vm_insert_page() abstraction we have is alre=
ady
> >> >> problematic, because it uses `&Page`?
> >> >>
> >> >> Maybe we want to change the API to use `ARef<Page>` so it already h=
as to be
> >> >> shared? Conceptually it takes a reference count from a `&Page`, whi=
ch isn't
> >> >> possible because `Page` is not `AlwaysRefCounted`, so it needs a `&=
ARef<Page>`
> >> >> to be able to do that op.
> >> >
> >> > Honestly, the problem is the safety requirements of Owned::from_raw(=
).
> >> > Pages have a "special" main reference, and free_page() does more tha=
n
> >> > put_page(). It even does something when the refcount does not hit
> >> > zero.
> >> >
> >> > The correct behavior for Page is to allow the user to hold one
> >> > Owned<Page> whose drop calls free_page(), *plus* any number of
> >> > ARef<Page> references that invoke put_page() on drop. This way, the
> >> > owned page controls the special drop codepath.
> >>
> >> This does not mesh well with the model of `Owned` behaving like
> >> `UniqueArc` to `ARef` behaving like an `Arc`.
> >
> > It's a different case, I agree.
> >
> >> Please help me understand; with page having a main ref and an auxiliar=
y
> >> refcount, if we model that with a single `Owned<Page>` and a number of
> >> `ARef<Page>`, what would happen in the case where the main ref (`Owned=
`)
> >> is dropped first? Is this legal?
> >
> > Yes, it's legal.
> >
> >> My intuition here would be to follow Garry's suggestion and have
> >> `vm_insert_page` take an `ARef<Page>`. Can you elaborate why this is n=
ot
> >> an option?
> >
> > That would be the wrong ownership semantics. The C side increments the
> > refcount rather than take ownership of a passed-in refcount, so the
> > correct argument type is &Page.
>
> Or `&ARef<Page>`? Because with `Page` being `Ownable` it would not be
> OK to increment the refcount from just a `&Page`.

That's just a limitation in your traits. There is no problem with
creating a refcount from just a &Page.

> > Now, for the use-case in Binder I believe we could switch to
> > put_page(), as we don't need the extra stuff from free_page(), in
> > which case we only want ARef<Page> and do not require Owned support.
> > But as long as we are calling free_page(), it needs to not be
> > clonable.
>
> You are calling `__free_page` directly in binder? I could not find this
> with grep except in the C binder. Is this code you are calling into from
> Rust binder?

Via the Drop of Page, not directly of course.

> From `__free_pages()` kernel-doc (`mm/page_alloc.c`):
>
> > If the last reference to this page is speculative, it will be
> > released by put_page() which only frees the first page of a
> > non-compound allocation. [...] **If you want to use the page's
> > reference count to decide when to free the allocation, you should
> > allocate a compound page, and use put_page() instead of
> > __free_pages().**
>
> I guess this is what you are referring to? We could change `Page` to
> this style as well and all would be fine I think?
>
> At any rate, today I learned about Pfn walkers, compaction,
> memory-failure, etc. that take transient refcounts
> pages. With that in mind we need to reformulate the invariant of
> `Ownable` to exclude optimistic transient references.

Yes we can switch Rust Binder to use put_page() and have Page not
implement Ownable at all. That would be okay, because Binder's pages
are not higher order. But this case still does highlight that
Ownable<_> currently does not address the use-case where the
Ownable<T> is a special reference there can only be one of, rather
than a completely unique reference.

For instance, the GPUVM abstraction would be another case where
Ownable<_> could be used if we have this other model where Ownable<_>
and ARef<_> are legal at the same time. Currently GPUVM uses a special
UniqueRefGpuVm type to solve this problem.

Alice
