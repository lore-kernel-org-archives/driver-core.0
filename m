Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D478336EC9
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 19:48:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770407329; cv=none; b=Jn9RGq4z+Z/jY4+NLHFPzF8vGAeQOS/tRy+eiRcQyL76erbtqHknGYjoOtSYew0l+ftpaC8o/K/7mEmQ42z4pBemRIv+h6MBhiOnnxxVrQ3SuJg/WEe4I3v0GUKQ0y4m75s7XWqtKpHEJAzmPD1USevxx54/gmgrru/VcMm4pbE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770407329; c=relaxed/simple;
	bh=gukHtlEF7NUa89Ae3ajjgjMGn+ERsvS2EyVcyWJkC2U=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rcy1AeN4qk5x8BS1pJtQNQ6wOdPx3YdJOmoJsiNhQpFr9Q2AwFmBme27BdpM4omJxqKZqDmCznDC0rVZBdTLUHENLmVz1uVxGSQiWj9s4k3wKkSlUx9Jn/pBELmk+J8ySe5nu0DtGhTICH/GG93fdZS13Ql/yaN9OLpS9VmlO2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JUDqoMkA; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JUDqoMkA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1770407328;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gukHtlEF7NUa89Ae3ajjgjMGn+ERsvS2EyVcyWJkC2U=;
	b=JUDqoMkAKNo9s4BCPw8Hx6UW9aVdQoA9+Ut+WLvKgKvyAGVtSLE6MhAFyC7YaPdzyQ6NIo
	rHfAi4wvqjfTH/GREaN2FGTHyydA7+kxily7y5vypttEu9ls24WOBhOcUg83R7fJyd5SxW
	rNPv6JzsC90Lkgks0eJaZIwE/szQgx0=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-xpzWMK3DP3G9SmlvQ-8QkQ-1; Fri, 06 Feb 2026 14:48:45 -0500
X-MC-Unique: xpzWMK3DP3G9SmlvQ-8QkQ-1
X-Mimecast-MFC-AGG-ID: xpzWMK3DP3G9SmlvQ-8QkQ_1770407324
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50620483ff6so79482171cf.0
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 11:48:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770407324; x=1771012124;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gukHtlEF7NUa89Ae3ajjgjMGn+ERsvS2EyVcyWJkC2U=;
        b=qlP8uN3BEWOBfcRz0678hV/cXQ78Vdaqcu4VGqPsMQFpEXrkYukqslwRRzp5cDyu7x
         4mMefQNULwl1Qepk+qDyDz5O9BBDJq7AMNYGt+0ZwrcGn8BJBoXeSvXAnxf22gDDThz8
         DUwtKHyJ3mSZhL8FQ86e5lg6oT3sFL27w/E5A8xNpihuDrImaqx5oppGggWIVP9xZw7P
         bK6hsNd78VGIWUjAJKUnF7aPjExr5rN7RopR71ekwhETgJtA3eaqY3/fUimLBwXOcAn/
         YjgKchID7dssjUYe7ibHEGDcykYEeYgx3COgu2LjVfVFQeUnzb8x0r8O/k108I328TAL
         TH4Q==
X-Gm-Message-State: AOJu0YxP/qv1QdI/bJuV5QiFDltQL4sLc9XHs33jLDErUt9cfJ2QcYWV
	o2PNBZWLHi6tkfJNeXQmD4wVmDeszR4URcUd6g/JgzHHGMEndvHkYrQIUTD/pxsmVtsho0bWQjF
	Q/4uTOjUaiHBHpuP9/e6y7Ev2ZrUaLW+S1S/ltdSORojXH70zHev6AlF4C5UDXSoF
X-Gm-Gg: AZuq6aIMZNi6PE6p8rl4L6lO40/cCQWVXzbOfSmViQEOy9NeqRpCCX1fDkvDbe1BpO0
	fIKM24gjMPjFvqEOtNdrxGs3UzlEL58knjsBrULoB8fTIqwVqznAXZoLmpIHyB5qgbQFPeMGMfb
	duPpkpswAdTjdHWJIwx1g8VaRWC8nIKuJN2EAENr0Bq6gqtqwy4KEf1lg4mbXRDXRpW3O9xNBLO
	PtgV/x8yjclad3a3F9oiYdkX5uyM7dmHFlbJQX7vU631b8e4us3J95TTpuYlNQQm13ObKgbQrf6
	cepagilZ29n345pdh9bObv6/Et22p+LUAqvp9LZZjUtxvLdddA38R+bV3ZQXwoJ8Wi6liKdGETl
	QB5vHmg==
X-Received: by 2002:a05:622a:1304:b0:4f4:c104:8e9f with SMTP id d75a77b69052e-506399c233dmr49042071cf.75.1770407324549;
        Fri, 06 Feb 2026 11:48:44 -0800 (PST)
X-Received: by 2002:a05:622a:1304:b0:4f4:c104:8e9f with SMTP id d75a77b69052e-506399c233dmr49041861cf.75.1770407324081;
        Fri, 06 Feb 2026 11:48:44 -0800 (PST)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-506392902eesm22442391cf.21.2026.02.06.11.48.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Feb 2026 11:48:43 -0800 (PST)
Message-ID: <9a6adedbfd04eb4c6aa49891453de5bc5cd5bf16.camel@redhat.com>
Subject: Re: [PATCH v2 0/6] rust: io: turn IoCapable into a functional trait
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>,  Alice Ryhl <aliceryhl@google.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Miguel Ojeda	 <ojeda@kernel.org>, Boqun
 Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron	 <bjorn3_gh@protonmail.com>, Benno
 Lossin <lossin@kernel.org>, Andreas Hindborg	 <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas	 <bhelgaas@google.com>,
 Krzysztof =?UTF-8?Q?Wilczy=C5=84ski?=	 <kwilczynski@kernel.org>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, Zhi Wang
 <zhiw@nvidia.com>,  Eliot Courtney <ecourtney@nvidia.com>
Date: Fri, 06 Feb 2026 14:48:42 -0500
In-Reply-To: <20260206-io-v2-0-71dea20a06e6@nvidia.com>
References: <20260206-io-v2-0-71dea20a06e6@nvidia.com>
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: oAJD7Qiy6QrLWRNCbt1-vrp9ulGvJ_PgRP_Za9FvrtY_1770407324
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

A thought that crossed my mind just now with this patch series while I
was working on converting iosys_map over to it: shouldn't we have some
unit tests for confirming runtime bounds checking works as well?

On Fri, 2026-02-06 at 15:00 +0900, Alexandre Courbot wrote:
> `IoCapable<T>` is currently used as a marker trait to signal that the
> methods of the `Io` trait corresponding to `T` have been overridden
> by
> the implementor (the default implementations triggering a build-time
> error).
>=20
> This goes against the DRY principle and separates the signaling of
> the
> capability from its implementation, making it possible to forget a
> step
> while implementing a new `Io`.
>=20
> Another undesirable side-effect is that it makes the implementation
> of
> I/O backends boilerplate-y and convoluted: currently this is done
> using
> two levels of imbricated macros that generate unsafe code.
>=20
> This patchset fixes these issues by turning `IoCapable` into a
> functional trait including the raw implementation of the I/O
> accessors for `T` using unsafe methods that work with an arbitrary
> address, and making the default methods of `Io` call into these
> implementations after checking the bounds.
>=20
> This makes overriding these accessors on all I/O backends unneeded,
> resulting in a net -90 LoCs while avoiding a violation of the DRY
> principle and reducing (and simplifying) the use of macros generating
> unsafe code.
>=20
> Patch 1 adds the `io_read` and `io_write` unsafe methods to
> `IoCapable`,
> provides the required implementations for `Mmio` and
> `pci::ConfigSpace`,
> and make the default I/O accessors of `Io` call into them instead of
> failing.
>=20
> Patches 2 to 4 get rid of the `_relaxed` variants we had in `Mmio`,
> since these are not usable in code generic against `Io` and makes use
> of
> the macros we want to remove. They are replaced by a `RelaxedMmio`
> wrapper type that implements the required `IoCapable`s and is thus
> usable in generic code.
>=20
> Patches 5 and 6 remove the overloaded implementations of the `Io`
> methods for `pci::ConfigSpace` and `Mmio`, respectively, while also
> deleting the macros that have become unused.
>=20
> There is more work coming on top of this patchset (notably the
> `register!` macro with proper I/O), but I wanted to send this work
> first
> as it stands on its own IMHO and is more digestible from a review
> perspective.
>=20
> The base for this patchset is `driver-core-testing`.
>=20
> Cc: Zhi Wang <zhiw@nvidia.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: Eliot Courtney <ecourtney@nvidia.com>
>=20
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
> Changes in v2:
> - Turn `RelaxedMmio` into an actual wrapper type and make it
> available
> =C2=A0 through a `Mmio::relaxed()` method.
> - Link to v1:
> https://patch.msgid.link/20260202-io-v1-0-9bb2177d23be@nvidia.com
>=20
> ---
> Alexandre Courbot (6):
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rust: io: turn IoCapable into a functional=
 trait
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rust: io: mem: use non-relaxed I/O ops in =
examples
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rust: io: provide Mmio relaxed ops through=
 a wrapper type
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rust: io: remove legacy relaxed accessors =
of Mmio
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rust: pci: io: remove overloaded Io method=
s of ConfigSpace
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 rust: io: remove overloaded Io methods of =
Mmio
>=20
> =C2=A0rust/kernel/io.rs=C2=A0=C2=A0=C2=A0=C2=A0 | 435 +++++++++++++++++++=
+++------------------
> ----------
> =C2=A0rust/kernel/io/mem.rs |=C2=A0 10 +-
> =C2=A0rust/kernel/pci/io.rs |=C2=A0 99 ++++--------
> =C2=A03 files changed, 227 insertions(+), 317 deletions(-)
> ---
> base-commit: f55ae0bfa00e446ea751d09f468daeafc303e03f
> change-id: 20260202-io-81fd368f7565
>=20
> Best regards,

