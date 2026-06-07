Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB6F815746F
	for <driver-core@lists.linux.dev>; Sun,  7 Jun 2026 14:50:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780843840; cv=pass; b=gMvHa6ibl7GtsgMqsht4izl+RKw+Z8DW0ynBF6GMqmbIDnWq52hPY0FWPe7qPZoj9SZSfZxHvQoxrOSETCNwbMpYXuw72vZNAG0beLD7yuz0kadgtfdurONTHvh34iE0hVn+tFNS5fEhJ0Y7QRbckiLP/9EwACbryLJ3fzRlrpM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780843840; c=relaxed/simple;
	bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AqFhH43Y9SY3bg0sOlsP3NCjLDX6Ok0RN4TH5KukC4Z6bMO1/8I19P9Ix63iusgO7xm1DIzVt+zy+KiRjHF1LgLO4G7Eb+vG/fqSx4mPMJYOsNksTNEfkNsdo3ASLEAeo+tPQvnTIm5lnaARy4Vo4fYax+rI9duV4fKJ1XSGMSs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eyItgILJ; arc=pass smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eyItgILJ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304eb0fc233so280045eec.3
        for <driver-core@lists.linux.dev>; Sun, 07 Jun 2026 07:50:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780843839; cv=none;
        d=google.com; s=arc-20240605;
        b=kZCifkr48joy74SCS/EgdL5IMYxXougCmR64Rh5WWVx0IJAAwy3fdclKuqTlsJ2oVc
         XSDLlQ0VrKN33g5EjpyvLP0Jg/JYUW7079GAOM92d6eqr84azpezOg9URr3nBF3zXCiz
         hO++21bv7I3VovblUGiiUJppTCxps5DKVXvfi0fJmwSwKJNEC5k04KCfArNwFKYnCz/n
         +UYzHS4GS51s6SnfwlMvTQfLOvjdqUJirEVM5OaoSa4Z5uVmGyw0vdSVRNMnxdXbIu5b
         hyuuck1jusg9Vi6sIXi3a0C6a7XfirKA7FIZXcgIb33QPBOcQxBhaWypYUjOKF/xG8WG
         Fajg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        fh=NkVx7WtUj/CIlkqA6XhRQV/FUfqOlXT7c4NB9yAmiAw=;
        b=UyBeoeLlcLYasIArU5gpJp4aF30RURPW6JYzUtO/twM4nKXIOernoHpCuwcs/OXEH4
         hKIzb18reBbPCO+Bx0qu5b+xq1g6q1WVAFfsnpcDSGXSv4OagnZ8DrWktO97gKcFDVi1
         gQGADEfN1o259CPo6FQAaZGhwDYjUtjXahk80qy1/IsH/p3Rm9mrFpGly1otrqtokAhT
         U3ioxEMozb8xAGlMVMHwu5i1mSYWPSYDwe+K71gKkK0UlPJev21uKcxgVyCPNboJKLaD
         48fdF3YZXh8T+YjgpI1XzNdigSKDg7EDoHdMyG1CT/5VUGWX9lbWOrpppXU1SaPuQYI8
         6Wfg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780843839; x=1781448639; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=eyItgILJcfquoI/v2oVV9BeQ6MdA9PwYzzCD9aR4oieTT4YLWKOUHP6vekUII4CXcB
         wyunenzLLl9oNvX6Xl4enu0Nrsp2h2+ZI7yaK9VBI2kKrstNbAP9nBkotV2VxBIUSaQO
         yUimMckwuuXGxYWOSuF8TPYVQwDDe3/de57T9Fgp9QttL8kg52oWPZOeBEGwixwFyNIk
         u2Ph9TerATJezvjw3c4of6PkV68AGFkdD3+Otlq/OvQEbZyz+pRmHKZGJ7hw732CwuDy
         VS4OyCQcF62VEwdUk5JvSf+NnQqXhmb5IN9Z4OQEE24lXCkK5EXmSDpJHZY2FPr7d4yz
         lQOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780843839; x=1781448639;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KeOkw3p+smUt9mDbUXijVkwoFTCqBK/LvWOrl4P+Zo4=;
        b=atcNTcwkxhdIn3Tcz6JzZ/yAz4wJVVQxPMpMG0M32d19PW/1djxVU/+quKYS6Jex7P
         S7XSlJtvJ5Wr7UjGJA2QfOnU530eMhmvhscFxWRIErodiU2wBT5L/z8+oHncFpymuzHh
         WsZAmzr943s3OAjQqGJ+vxbrDY2L3w9Idu949402NIDHhsY0NBXOasuUMMz35BQUu0Kh
         okFHwGVdXR7/MI4me67eFeszreKVpUjdhInIEO74wC0YL2JA78rGbGjectaaUfsAYpqz
         AyLuhNe4elxdNIDwDEFRTLc1KB9bGcRwhDuTDGu/7HzvYS306dgw22vjew44/jqKDiW8
         vPRg==
X-Forwarded-Encrypted: i=1; AFNElJ/9JEYv2LmbX9rbShbWfFb7BB+e+iHdLBywJ5zMvkfYzopZZN3KkCUR1kpyOkH8UuPIsYo6sYSz7H1u3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxlYudA5MRbjP73+c8PtUd4u1V4lVncW2h4NBGgThkcy902XlJ9
	byVP1IJAHTgbSMEKGfsACgERraMoFjdN/+A1Srl7FOnX/3t3FsbAlX9fBfMdD5jq5rUINcfHJAP
	c4IBkxhOVXLmIb6nIzuIZlmbXqKb4CxM=
X-Gm-Gg: Acq92OHuyBBeb4Jxk2NgJM0r25OLwRBj5oANO84MtWzG5ZTXukrjawq2A0dF4V5o6Hn
	iwtNivLpwghaQB1rBJzU6ZdJ0ql7p42aH7P7uBFfOcIs8ppnnuoJoFlgWu7jlymOAA8M/8SaoNg
	JGIu5hCYcSFn6YV6zBbbscn06SAfCzSZD2YkpCskP3RxphLdmJv4nR+Wp0sCWBL9qJtgBhFWUpQ
	JSuZ30MRwDkt2gOpsLhSfv7Yhft86HckvbLW1/f2zYaRysTxpIGeh5D7LEFF87IkW38u1+iWJ0z
	qzQpoFbekLxECVa+6Ph2aRFpm6YfLEfEYY1btVNGXd+b5F56xw5VhRInkcbFd39TVIB8VDuP2dh
	ZF4UTcIRo60Qg2jFT1gZx8avI3SR1ea9QLg==
X-Received: by 2002:a05:7300:5723:b0:2ea:5057:a320 with SMTP id
 5a478bee46e88-3077af4a612mr3072058eec.2.1780843838713; Sun, 07 Jun 2026
 07:50:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604192740.659240-1-lyude@redhat.com> <DJ2G8D0N6EK7.2PDDSC28O8K4P@nvidia.com>
 <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
In-Reply-To: <DJ2T75A5H6Y2.ISIBOQVMAO4I@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 7 Jun 2026 16:50:26 +0200
X-Gm-Features: AVVi8CeFi5djIGvrvuLFIe0ggcr2ckGO7PwhkagBDt7mLNkIJPuv5Gv_nWehfL0
Message-ID: <CANiq72=qKckJXFJU6TDKf1yh3a2wBS4SQE9fiGKpVOYWYtL8QA@mail.gmail.com>
Subject: Re: [PATCH v18 0/4] Rust bindings for gem shmem
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, nouveau@lists.freedesktop.org, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	driver-core@lists.linux.dev, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Alice Ryhl <aliceryhl@google.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 7, 2026 at 2:17=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> IMO we really shouldn't use Clippy to generate code. We spent too much ef=
fort in
> fixing codegen issues that are only present when driven by clippy.
>
> We should just run a check phase with clippy to get the lints only, and t=
hen use
> rustc to generate actual code.

Yeah, given the trouble it is giving, I think that will probably be a
better approach medium term. I don't love it, because the original
idea was to avoid such an extra phase, but it is definitely better vs.
random source code changes...

We could also increase the symbol size-related variables
(`KSYM_NAME_LEN`, `SZ` in `modpost`...) only for Clippy builds to a
ludicrous value. The extra phase approach would avoid surprises more
generally though, so I like it in that sense, and has the implicit
advantage of avoiding someone using a Clippy kernel in production by
mistake.

Ok, I can take a look at that. For now, I will pick the other patch.

Cheers,
Miguel
