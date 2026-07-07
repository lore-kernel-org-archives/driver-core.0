Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F22C329AB1A
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 13:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429501; cv=pass; b=YNfC/R0r4fGOTtbcx+Qp+pIleYly8qPV+SE7I/vRwDhFgmQZQLtWDmx2dMaMNl3oE9KGqT0cvevBQciB+wGlMJkd03c/84jPCi+kMojg+jIXVGvm9XG2O/bEFfA6rEWs2u2ZbPHOPDACVi744qwsUWKVfB+bSiuCtQ7FMyNM6zs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429501; c=relaxed/simple;
	bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrrGfTVPqJHUz5nT4xCj+Eqxrx9XudmeaZ2mMk2Ut+KSl79D+CD7hK/+D9ZDhdjcexHVzaicNy68W9kAcABGZN7vx7iIQIF9abfW/kxzKsmt+pzOF4asdPY4M+BsQ5nguTcwIAZ2AD2RABQI1kUvV8Zy4904IN1kgFfFlqY0kyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=romvF1PT; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="romvF1PT"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493c19bad03so39168665e9.2
        for <driver-core@lists.linux.dev>; Tue, 07 Jul 2026 06:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783429498; cv=none;
        d=google.com; s=arc-20260327;
        b=liHG0L/ZAjkmymFlBGKpQlVxBXoiFMH3peRtG0bMD8R12HXB8kz7t6S/h9V1dHwVGq
         XgX2LO7klkxvtv5PoXn1LetJ9JiwmEERQM6jr3jOAiL9D82J95VBzBBE+WvogyIMnM0i
         YZTuHtk8mMqffMXcHVt0r3GslvXD+LqiqutwANQ0Z+iaacTbwIBj3mgljlPbRwGR36Qi
         SFSUIgqDtC/hexZGpLsEYo3iyX1SJM9+qZXknczKFxNRhuaU/Ddh5FJXShm8Jk9FgS0L
         28keGkUIgzR3pXdahXeFOwgIPl0x/vzcgkCH1XGAjyTo4uoJSCsfaupajlREnYYF3E0O
         IuaA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
        fh=VwFCF5auD5eTOOxcGLYi3ArG9wUFQvp/lsk1m+9vaTI=;
        b=YMVS95egNFqbdRaIZnSwkrA2gcuHljxIugHoAU4usB3OyKVZ9OTXSJjUoM5BpTFTIt
         leWQaXdgqzuTDujl02psYZKizQeK5yg7nY9KhcHs4b/THy7U2EenmzUI0zJDxqXqRvCp
         xKI7/fjmMWhUT8SMTaJMkoulyIeoj3I1qsF2YEcvqsmbJPigJnLdj+Hh3EzM2zC825vp
         eQ6qeiHQluH573V7wYO+hMf95OFIgf7bsUYSZ3ierIGVQtuVoGOq2RvvAuwztPyyRhoW
         RWZccnFXU52BDMRqofenRlSPWxU4hITZpPkSJ+Fx9Ae7bnHaGwT7P+By/NHUiJk2OSAZ
         SR3Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783429498; x=1784034298; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
        b=romvF1PT0QaNc9ckPyn4S+iq8TfHEEblkBJX5p+HrhL42trn7yzX/xKSNqJgqyq0L0
         CTtIgVAmvyO8094rHKATiLmVoST2o7FuuAwmSn03yJUeKjTW6ciftY5NAfXiRtN4rS3o
         S4FPrmBiLEGgGSvcb6qz6DNKzQHu//YKTKD4ixFDCTyD/8TBOQXLJqT8e68tzwDSFMYm
         y0IEjaaSVeQ9JPS/SESZaNYfzkLPdzw0Jf15zePjBHZ8RcFV8ocwKpBKcVH5tYs7w5DN
         Zrn+8gGk4D24o3dGFTxaSPbIkewbAXapDuN0kfpfRmPtOj7eIRCv/C28AULdfYNgIrVH
         6WeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429498; x=1784034298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
        b=Y2QmFl3hZbnNv2v29Dv7K5xqHLm1jcR07rptng4t8S852L+lIPGgzBcDHWmp1B4u+v
         pWIpPTGjWbrje0copVlFELdZgrpgTOvoVpNlExPj87QgOjD3sHYgD96P/sz7iSmqoWvm
         PA2J+S1vJQZga70K5qCc6XW8mf9dl0EB1YAHPgIe/gtWER8MRRPxLTwEgGa5d/AebjLR
         BHQYZ1c+/kixpUhk1iJkdOvdY+9Y0qafcpvfpi5IhM/PFfnSMa4WFqqVJCzDCSLH6d3c
         LwM6NUp1Ep0wnLs7WLqfIg+ymB62x6APQqas/beGNsJ6/0FqJ1QKXRxv6STImU2l734P
         NSog==
X-Forwarded-Encrypted: i=1; AHgh+RpZN824IF0pnqFB6NGLaXDnyg9C3I+gwFiKouvpFkyzXjsSQRjgO2yC46Q72AWKgdydKwhqYc5NIo8auQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzQwEECZCQ+YrRW0ln2BvBblB2CRshneDCv+UBtumJyzg0UJaez
	dqsfYU67h7Jw1u1wV262BsKWpNSQ1WzG5b++OYf6uwwSq3Xa4yLPEtBfugnEFIe6WFh5YXkafCb
	7vcpGp8uwNUCNHnr4Ot8eDnRPO7qWwqIXF9BUcXdn
X-Gm-Gg: AfdE7ckIXQjcDdMjqspKkw6pJ6WHaWhKCxueNf5U+BmJzATIN/A4wdRjmNKkp6C1grd
	Juqm9CzuJYLtOT7MT2U1vw4BPUayaDYyTnDZAfoQliYMytLgU0rWopPFSZcWeIXunDyZ6ndd+0o
	5nm5qdd3gSlfpvax2+oq26NLUTOVgrZMGEbbVVkT+SYwqtncvBx7TU6KGsPm89evbysy1hjLcdO
	UX5H3UTL35Gvtm/LslHFV50bXSRO6QbFGnLa67f9u1tO/q8FVtZzYeHwWfzIqPcwpOKyUqd9b/1
	RYpywVcX7AK5zvWrA8BhoFDcG0I=
X-Received: by 2002:a05:600c:8b70:b0:493:b6e4:fb2b with SMTP id
 5b1f17b1804b1-493df06e943mr52096855e9.25.1783429497735; Tue, 07 Jul 2026
 06:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626-unique-ref-v19-0-2607ca88dfdf@kernel.org> <20260626-unique-ref-v19-3-2607ca88dfdf@kernel.org>
In-Reply-To: <20260626-unique-ref-v19-3-2607ca88dfdf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:04:45 +0200
X-Gm-Features: AVVi8Cd8GrEsrkEwxzhRkanTcpbMUA7MU6OpTudOnt7DIfIGqhosSlF_BI7LYTM
Message-ID: <CAH5fLggMeHUgXj7JGYSJejUrR2PdWymOOb+3E1VmHokzcox4hg@mail.gmail.com>
Subject: Re: [PATCH v19 3/8] rust: implement `ForeignOwnable` for `Owned`
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
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:55=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Implement `ForeignOwnable` for `Owned<T>`. This allows use of `Owned<T>` =
in
> places such as the `XArray`.
>
> Note that `T` does not need to implement `ForeignOwnable` for `Owned<T>` =
to
> implement `ForeignOwnable`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
