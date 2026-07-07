Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFF983FDBEF
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429470; cv=pass; b=eId1NWWvaW9c6mPEyfDf+C2uTiMPCirj6HtOlWYb75IfMDEnDrrRUyRc4TyMDVsJNtwWYcYoNz/Abx1rg5pYyJGOw3/0byLKZcUNjDxGb2o9UpB6eO+21+uPXZLr85TaqrUXeubSoNkcc1yqjlNSGm1EDBWuX7KOqnAqOCz0z8Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429470; c=relaxed/simple;
	bh=TmPGIYAzJvC80RsuDMRwEJ1EsP9UZtxlgsFYi2qUwwE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oIL4Xs7NdN4HjYidSHuKzQEec1ogXHUOAFg07YrBtRnTzRVw7NKlRTpV45eEETQx18aRuv8xc9DCcR93rvMd8JMxUf1xEwk+GJu675vXIPxzlFS4uQjvPeCAayfE/WaixbsNHYNdNE+ES+Hd/TqB5IIaK28Lz1d/Jb+gaUf/VjU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=NZqdqL6r; arc=pass smtp.client-ip=209.85.128.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="NZqdqL6r"
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-493c52cde9eso41401705e9.3
        for <driver-core@lists.linux.dev>; Tue, 07 Jul 2026 06:04:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783429467; cv=none;
        d=google.com; s=arc-20260327;
        b=guP5DBsBVxqxf43siwVg8A5NqgUbnW3J+6AId1+tg7GnFtJMd/Z67/iRuhhRFFtw5a
         qksTfUCTvlBzdi5qhg5WqDnYVQzNx31U+1W5hTw8W81TC3WpOj7nRXXXdOwOAgIhCs3e
         9LscmgEYf6ur23mEFCjE28CZ3eNH//HFVITLQZ0oERMGuj8xvKVnuEUfJU/ZNBNcmg7X
         oEsJCMw3BKjJLDW+181fyTrVb68q8sDDveWxoI5whHWq/uMSDNuLtwbMm55NsqnEx9tb
         u5dgrLFGoWV/VdmhzBRp/tZvlTSm9teuyck1T0fI6Mtz6DzOw2zD0w4JJEceX2Lxy14h
         7mvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kMZTTwd8MYpbLMhgPf9wJy+JM0u3tngYW75375hm26s=;
        fh=6nnZAL3wJA/uA53qZ7/v3UhKwPMD/Q7E7i82NZXWBDE=;
        b=LrXTJUJXaG9v02H1UO4p0i0fr9IwNgoIVM8uHF62EStB2gQiAfbPrekCeyxZQ1Af4H
         qm/9wJbBLtuleesQwv9SK06UFkEpX4Ix0katu5CI29JtrnovgwIvOqAd6dAkI+FTGq/Q
         Hh+rU7eqjPMqSQOlKnzTCcX1vSmfgTsrbOqC+vS05rf5L612hCEilFsfNpkamHkUCvrI
         jDfuWNZD5VlZYKU/5eRMz+M0BLeeAtXJD9LDqRJtFG1fwZAoNckIlCtXsK4Qeic5YXTI
         +746m5C/9Q4/mP2EGkl2M6GlFEuRd4uGQygcZLrKwQ7T1a/BTbCfETCd2ZNsNW/rcf3u
         ThcA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783429467; x=1784034267; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kMZTTwd8MYpbLMhgPf9wJy+JM0u3tngYW75375hm26s=;
        b=NZqdqL6r4viA1b8BlwKCZLdgdyUVk6X+1bZrezTQjjNKhEcJjEDLTKska6gKBFWgeT
         NiOyxLQknOa5Lez8MD8JS/WHMEX6i3Kh73JtBOrwWRYFuER5SmbNStwIE8XtyVTr6yja
         NG+ijxoSlhIcdmiG+4kCSGZ6btO03tU5PnSb0L8l5w+lKFf3Yo1RhO0de6PHZKPFQfnZ
         ggqGtUGsTTpNiPXroND/ZrR8r0Ck8PhBpa90grJKAi53FmWc9krsEhAMAwlpr4JKuRy5
         kJOnsne2kiYRIZoBeye0VAGQhZQ4YGqKsoFYn+OfLRiOA9NQGjJKPx/bOmbHPLmFRGIh
         rIaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429467; x=1784034267;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kMZTTwd8MYpbLMhgPf9wJy+JM0u3tngYW75375hm26s=;
        b=V1KOSr0W8oZuev52uETwkXt3At85z8GWXS0sI0PHuNgxKnI8LkXXSY8ZoITXNoXrsp
         9H9OetN3Jjpctzf3ozKB+IjFBhGWYD14gRDiI965YGutKNliaLPTGDaOiOdjib58RMHU
         OeBS/6H/A+BCAhXi3HIonRSR0GJzAI55SHN2ZcEcstShPYDECBFmFVyp40bPQjpvZUaZ
         OVCuD4kRldj45SuDqVZJhIWZ/USjsYyB5b4dOaEyiESYpWLyDtiGcHEAmybhTb0DVswJ
         Djh+orvHYcWRJ+j3Ha5g9jF1ktzx8+Ulp+inBxnQU/e31I4TSvhDjlu73XVXsIyDqRWY
         nXvw==
X-Forwarded-Encrypted: i=1; AHgh+Rp/h60eEI9UB16ctkPzwr656sKQVGEdZHtG25kJrUn/RFX2x8lypo0Y0gawH9juWgkI8Dtchty9gp/AlQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyZE+Hy7N6tdQYSLAOCI4W2Idm4Sx/foltDQDtGeCmCddDSCURf
	4+QQJaA71Gm/RRafJmYlfots8K1/IUaO1M71XPglfrZxB6Mld3iXTm2oTG0M9q+CVMmgH/Jt4Fl
	1pven1EsHpE81x3rTFe0x5aSzPmhPvHmFpX+m4txW
X-Gm-Gg: AfdE7cmet1FfRmSoKBtpjm24H74oeTyz0szbMVVFCtNsagtM8nN8bHhjZ2MS9jalb7x
	nOpw/ZMbv1I5qLyN82S72REPIaCPNpvp4IroRNoZS78byZGC3fF5AvVyZr36AyB85U6Gi2YoUXw
	bH5fVLCPG2u5Xwqh8llsk45bxQAwqgopAySPeGZ0+uBocVkxYKlbLCQYo5aQ2Eoo8uU/I+zobst
	cXVukfnua0o5n8MWLTOK0+5zwQje4esFy4VuqN9cFeCHj4DMt33YN3tXkAR0WFKuIiWMy04Vnfr
	ReH5DrAIxxqLbhYGFaAfau+rIpk=
X-Received: by 2002:a05:600c:3e14:b0:493:bc4a:e7d3 with SMTP id
 5b1f17b1804b1-493df0a08d1mr56240095e9.39.1783429465838; Tue, 07 Jul 2026
 06:04:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-unique-ref-v19-0-2607ca88dfdf@kernel.org> <20260626-unique-ref-v19-4-2607ca88dfdf@kernel.org>
In-Reply-To: <20260626-unique-ref-v19-4-2607ca88dfdf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:04:13 +0200
X-Gm-Features: AVVi8CcTh9Rs6YX_7yLE2pYLhG0EOfuYJdmTfdwdI6hvKkhrcisIrByGWFuDPNk
Message-ID: <CAH5fLgguLAQG7mUwD1NPECYSsPdpPD_tLskU3NdwLZhKR1H=aQ@mail.gmail.com>
Subject: Re: [PATCH v19 4/8] rust: page: convert to `Ownable`
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
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:56=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Remove `BorrowedPage` and update users to use `Owned<Page>`.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ Andreas: Fix formatting and add a safety comment, update users. ]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

>      /// Returns a raw pointer to the page.
>      pub fn as_ptr(&self) -> *mut bindings::page {
> -        self.page.as_ptr()
> +        Opaque::cast_into(&self.page)

cast_into() is mainly used when you have a raw pointer to opaque. When
you have a reference, you can just do self.page.get()

Alice
