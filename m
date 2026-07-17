Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A55F330C142
	for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 14:31:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784298686; cv=pass; b=B08KRL1OrYU47Su4c0lb7bkuCTZ0gXxRqm7JXnx/Zs8sf/87plqkh6FPyGOubRn3bdZk/uq0FUeznOrrF5Lqm2gLjAszYqyTuGOMk3VZM3aEQwpz71xRG3iAecK3bwfMJ5IwnGjN76DNKlCvci1/JP/D/ZHfLuIshRWWRkA0p/w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784298686; c=relaxed/simple;
	bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oO65bjxI1xIAmp4pWWulpsNIJSePNcmZUqi+Z7kElN3R9Cdzl3M+BTE7EWh9EnK13JzYU7d3C1USfb8yfs5XZZZbEDYYywpTUzP6iqB8KLEwMuJ+LWdIplwMnAx0zNiW20d2TMc9z7GHdw/HuCovF0h1NqXtZj7HUm/rIlGqeS8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bjoCKm1Y; arc=pass smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bjoCKm1Y"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-38e5918a0dfso1566a91.3
        for <driver-core@lists.linux.dev>; Fri, 17 Jul 2026 07:31:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784298685; cv=none;
        d=google.com; s=arc-20260327;
        b=NH79MtPLLcFB/vGVwg1ri76cYlgItYK0F9MkpHXbu7Z/uNnaDIO/NFbi7RYeM2LzGk
         VND97DghIdGjYBqtHnfpcPK98rkFh9AxeFixlEl6b8H7ntSXPWQX/pxLSrjwnuqF/j5n
         lcWm6Mo8qKe/I9BujrTZpXaOOB7/v3hO1w0BPQ33nsrj5l65HJS5i1Io+rIMXq2Waec2
         z+NPBBYBw3N7Op+b7oqtku+FSn4K/KmQ3IpUCwV0YZ9fTScqDSaO6kPVBVfWqJEJBPYd
         EZoXeBEoEyOPBfkOX9XAbYuX+o2IBZtMTs4DdWvQ1xEPgH6WizPjnlmP5Z3ak9ATsHyY
         J+Gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
        fh=+QDeCvU0dZN/uneoGVtgUFtZTF6nxSna6/GLWkFjfMI=;
        b=jYgDjJ77eNDf9Ner2k8VQSBTA2KhlflzbnTXLNxApjMg/HjBXZF8S4bzzucVgPfEW+
         TXxqHl4cNZxpT9hA7XXLYpibKmMcqupzKMlJIERyppmQL6WXicjylm+ZPCQCC+pzVABv
         q2U6kYZGnA02gw5aVjps14O38pclh7h7WxH3OjcvtkM8Q250e42Nurk5S8UbvSZWZ91T
         1UNIdU3JiI8YDHPN+FVWk0JZRhnllGoFIyxV/xbIxtyoOhB8s8kHF8z4Kdev6eMKkCYB
         /Wt4udvbZDHFWezaqAg0BcB+mePUleVgZ1pXav/9YhTTtgy5IcWMl5BTqk8qcE+fePBm
         Fm8w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784298685; x=1784903485; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
        b=bjoCKm1YvXfI1Xoqx9C9BRM235FkmttssWTQE0xyHcphL5d1hBp1ifJHCRrV3odV2J
         FvbxdqlT/Klw9rdBuIGO8nY6wdp3pP6XvtAM0dHtw2GwD0hSreXwP1tzEKMzRFMIJXAT
         abtiYeSVxKuoHPhVXdN+8LnC/KjOnopqtx1TZqk9cQKZsJCP6UgDLVRYVvRVjPZG6d3k
         vlA1psGv7hYjNcoNActOp2hYu9fL3jS8tM2yN2+VNbmMsi8nSYmepirfIK28qX9RsLvJ
         ZBdGQJTPp9L8Pdf0iNeTYz6b+BMQ0d99/3Rc4KSRFF3YNMWDJOGf6oHh62JJOvAkjSW2
         kOQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784298685; x=1784903485;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bwirwPdlnEft+r0dSEcs5Z3/QF6OKfOxmp3M9eXrh0k=;
        b=Xu1XrWrszDI634Eov5rkyCRp5prgUzH9Jx3ZImpL5jJiT9oM0DJTY0XG7mknf+e4JL
         FV6ykk7c3Aptm9fB0gYGt/5cB+u56RtUfycoA8nkDGtGJUIAUhIrCvPtNYQnoNahBhbg
         NEhmmyZmzrSHjxq777SXgF5Ydwzzr5eSZ+7qG4hxvWmO2DNqP1biFJnIdhP/BSUG8nLi
         kDKsyYcyGtAir7yQMeTL/bcgp4fLOFQ/ucCiUlBymmK/8Ev/S1Agc7oWpp25OhptkuVe
         8tPD0/TM7rGsnrrPjcYDRUh52H+E1X2GS+jMXjcbQEWTksMJpPwClpDJas1gvtLw022M
         WlHQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjmoqvyFu6z4p0tWR+1680g1TBNlTcWaZdxVudAfuZI8SgzPMlHGK15PNmAqRb1Bw9LKYfV4jJtx27kQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgvKb84BOLTHAPv4cOjHZ/JpyY+SyuLQWhnSVkRo5th2/J0aVZ
	g1yAERaSmzPJk2brHImtRtgtzblgt1XFJ7WQ3e21+L3x7AhvrWruLUq9nE1fxu0XDS74UIj/Qq2
	d/GpVKvu1evbbNDFBNAmu/0ty32ZfUCg=
X-Gm-Gg: AfdE7cmLq/8GldV73U+V6JJy4DNktl3VBt8lGUGIx6hsNqFpjiQEjRdOc6eiI5tTn9r
	wLLaPde7AeYyi6syy8XPCVPTFmvEVnwhoT3CnSMtl8qg/NYGdpZPoy91L2OV5Asw7tjO3ePK9Qk
	ghUCNCQ83XXRrSW2ABAe3s6dSNF2mkWda/ZYnYWh1xxE6+T91hXPebIcpLJ2l78NddpfRPtZiq8
	OvDWHEFkVR4y4bOOYgpTq30MCy6fcehRWNeQxkD/qvxCPmr/MPzIh6lb41n2+BvFaKlxx/7RSQa
	A8w+6mZt8PZKOyJQcZp/C4GA+7feuKZnLu3pviliXcxV6tX7Pu66RZ/otI4pggZSW99aW88bOY0
	TdA==
X-Received: by 2002:a17:90b:3bc7:b0:36a:5438:cff4 with SMTP id
 98e67ed59e1d1-38e4b5220e0mr2237396a91.6.1784298684865; Fri, 17 Jul 2026
 07:31:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260717-docs-irq-rustdoc-header-v1-1-36749192aa04@younes.io>
In-Reply-To: <20260717-docs-irq-rustdoc-header-v1-1-36749192aa04@younes.io>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 17 Jul 2026 16:31:10 +0200
X-Gm-Features: AUfX_mz5L9S1u9ZhfFO6HNC7y3ftAjtwDZbUvDOfkx4EwYYmREtedGI9_6WqZY4
Message-ID: <CANiq72nuYjagAecdrd=w+R06Y-fRciMy1PZ1kfWOjqEhjL+NDg@mail.gmail.com>
Subject: Re: [PATCH] rust: irq: fix C header path in module docs
To: git@younes.io
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 17, 2026 at 3:27=E2=80=AFPM Younes Akhouayri via B4 Relay
<devnull+git.younes.io@kernel.org> wrote:
>
> From: Younes Akhouayri <git@younes.io>
>
> The IRQ module documentation displays `include/linux/device.h`, while
> the link points to `include/linux/interrupt.h`. The module wraps the IRQ
> registration interfaces declared in `include/linux/interrupt.h`, so fix
> the displayed header path.
>
> Fixes: 1f54d5e5cd2a ("rust: irq: add irq module")
> Link: https://github.com/Rust-for-Linux/linux/issues/1246
> Signed-off-by: Younes Akhouayri <git@younes.io>

Looks good, thanks for these, for adding the Link: for this one and
for backlinking in the GitHub issue, I appreciate that!

Cheers,
Miguel
