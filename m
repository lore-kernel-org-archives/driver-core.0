Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0538247F3D5
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 13:43:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789134213; cv=pass; b=qDEyBrjmKH3f2DA2hDNcJB17m2YChHFhtmTpNqNXbTme6LMkZtl+wcBe1/l6K6HUs38i8+4YgTYm0o7tiIp2NwbfareeeBoZ9Mg5esGANQnmDqmQ1oyTdp3JofIeSLkAkfX+JdCzD2KAzack6ZSvj4HUqZmWFQwB/8vH0P6P9rE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789134213; c=relaxed/simple;
	bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iTKzp99AJBvLVC5U3WuPWhm9K27gfT4+rwSM7lSrJdwc/11vToIc+44MfOfopEgmtHhYfoPQW9mR5r37rMze4P9u1tGe7a78QYe9Be0DaK2PD5guPgyMIcxj9EyzI1oZ3ayNJFIr6imgBhOSoNWhhkloz2p0DYj8uF45v1VxtK0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XcvhnJ4J; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XcvhnJ4J"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-49b965570d7so11607525e9.0
        for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 06:43:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789134210; cv=none;
        d=google.com; s=arc-20260327;
        b=dbkhLynMEobiRtMB76tAGCZC/X/LUspEzH8gK8u7/hzzIJ91dH54dGBzF7H29d9QCI
         AFIWTVf5BXYFJ4CK7fINvanISJ/iZKj9DD3D8D2si/zBzzSFHHMDIgDgqrbfVqPrVCV1
         V9e7slzkzXqkIMtn+nU3JrbJSuvTDgEOXxXO471EMv4+QSmCsqvkxT1JbAbfQ6W436lV
         /04Xv0pnyax7eHZ+RaGBRwCUZ775pGZJMtAcZ5d+GAksNgpJx75ffOzoJdUAYtyT6ZMb
         ScZUAK8x91pqD1ZNTQNUJtIHFLtCwD3G3swpkhlmllqtrjxL7psjKwrb2mmpuwFK+/pL
         gZfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        fh=Aa+nqUkFplSrUG6gaRuseRsZeuNYK182TkqtljuYufU=;
        b=S3n9aFxK38YziMjN7uxyQyKURVdT/G01yoTBd5JaI/deBHTmUagb7tjg/v0cTwg9on
         Pb0ocNT4MuqQXJzUgdbkc0woCC9vUO6Spg8lSrB48KgIC11Riugb+OYgBg0s0fw0JA/J
         tgBNpNFn5GpGJoBCJD6ILWK4u30e8K7eQRCF58zwi682m7yY6zHD3c1+r2Mud11HI1DX
         iGJG9KSL39Uh0UBwQISwVoxBV8IX5KqCXFSUrk4hvEC5zHl8VV1VXsaVIHloG1EFwagO
         18s3uzOg5O5yphLvRrVTsaQn+tHVPEKefvsbaaGqDHdgMU0KCgI8r7LNCclcEBkW7aOA
         wRSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789134210; x=1789739010; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=XcvhnJ4JfW15TJhi6+Ld+OnM33b5+L7z0LG+/DMVeb5GANGX7SXF/Sslcbo5cJ4ZzF
         E9JVbqjbzN/NHpfKIlkRKNFLyRUWwq8lpuJxFsP/foeZjcTfCDjnrgIIyUJJ0qM0F3IP
         76u+72vY6Dhd5wdUfs6ZeKsU4ynPBgRlYLEjDKqVQm3jUxKKw/1pu3qHRYhKLQaGehCE
         m45xpISx1Czyt+gdzPxMLsY/sHc7cW9114yoa/lraG9N39TqBQAdHJvaeTx/qNOW99kx
         GB3GKlppAPvqk7V5LPeAGjzhx1GdfJwEOmE8aCkX+9m9ouo86uRTXD7GCOSbd+VCavYF
         Q9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789134210; x=1789739010;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qqONGiVmU3Y+JSEn4qygivSbxUuzyWx0IT02Btj63eI=;
        b=TzTOMs7dvzMgzfJWz2rRLTAgIJFDlok0pYqztHw1rqjMUuh6H3Ske7CkYWbgvPxvHc
         SK1B66SdRSeOUuf/K/qTVY3EJN2m0/0OoGPUIYD61IZUno5LsSAZoMUTUpuYY8w2b3v9
         uc0LBtyInfs/SDbrXDAg2BcRinWfqiIT1mCOuHa7ShjTbzaUrFXUy3tq33wQoJzS4wCO
         g80I4e63RnOezhUcRGABMJHEZcp12La8k18/7yNC5iQ5sR+NnRgOiXG0HWy6PoPESjoW
         wf2TTfT+NV6yT6qwox6FoWAg09KwS/pZzUSkbHg2Ad8oBtwxvRG75U+8/CiE+LHMnQOC
         69sA==
X-Forwarded-Encrypted: i=1; AKwUvBw4wtI2rng5wgQ5CHGN8tGc+EPlMRH9exsOreOLoW3yEfdpUUokmwDRbJWiO5vkNb8KGLIM1B0Elf3NTQ==@lists.linux.dev
X-Gm-Message-State: AFuF++nnhX0SELYRekJLIppvmAAxiZmMS1OXXGZ45XMeKlFqEP/Haf6A
	QsHaOgZlbKpCdr4Yy029phnuqrQVmhp1gR1czpCrqSHoxQZixjFAzyUOHwebuXItSU1sV4DO0yZ
	i4sL3Cuyo+RjW3hloE3YroaE27Mi4JPCUjab9wBvN
X-Gm-Gg: AYBFou0yTCXDKA0akZSLOffZK+vZgmyP+gfhKs0VMTcJndE90tkJqelD6NlngdbfAys
	Ro7vYJID85Wsy5mf2gGycEprUPrBu92dDe/dJqGvk83lzpHij6RXWK2kGl51aJ29n3ty5rYlKI0
	9P3W52K/6rthiMqqdFEEg25fwYvPVYqbprWCN4PZDkM40j1RuH6/GPDBtNazjwlYOMM+hYAIcFq
	aRs6N83Oh1AClbiqi4Yn5+yfkNj51cgaTEH9bm+dAIQhqM2ix0SxGxol+CBlqCEVm3YnHnojAq0
	kzvLd/ewnC5+UKMPC/oKav9Z66NWPgpUkZy3pcpm+kedTP3VvaAiIIXbSmvwIFuv7FB3sbhf/HQ
	lyh5Z7Pi6IF62R4HiFsfAJAQLfTgp7vdgwNyoAmhWR89vg2mZRGEI
X-Received: by 2002:a05:600d:8445:10b0:49c:cf18:494e with SMTP id
 5b1f17b1804b1-49e6198a3b2mr36939915e9.12.1789134209249; Fri, 11 Sep 2026
 06:43:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260910-unique-ref-v21-0-e83257373062@kernel.org> <20260910-unique-ref-v21-7-e83257373062@kernel.org>
In-Reply-To: <20260910-unique-ref-v21-7-e83257373062@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 11 Sep 2026 15:43:16 +0200
X-Gm-Features: AcwNN1UlYe5vy_4Ph8n7W5xph6nzuuUOW4o-tvYKznIiNAx0UgbfO_rFNfVUhuY
Message-ID: <CAH5fLghC2qRh8qNmMHMWQXiWW9FAPdd-O4z-O-17FFDB3hy=+A@mail.gmail.com>
Subject: Re: [PATCH v21 7/9] rust: page: convert to `AlwaysRefCounted`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
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
	Ira Weiny <iweiny@kernel.org>, Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, linux-usb@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 11:01=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> `struct page` is managed by a native reference count, and kernel C
> code routinely takes its own references to pages, for example when a
> page is inserted into a VMA with `vm_insert_page()`.
>
> Thus, implement `RefCounted` for `Page`, backed by `get_page()` and
> `put_page()`, mark it `AlwaysRefCounted`, and return `ARef<Page>` from
> `Page::alloc_page()`. The page is freed when the last reference to it is
> dropped; for the order-0 pages allocated here, this is equivalent to
> `__free_pages()`.
>
> This also allows `Page` references to be returned as borrowed
> references without owning the `struct page`. Remove `BorrowedPage`
> and update users to use `&Page` and `ARef<Page>`.
>
> Assisted-by: LLM
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
