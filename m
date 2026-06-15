Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD0052EEE77
	for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 11:47:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524061; cv=pass; b=WFLVtziy/Cwz9LhMVeQO9ynXDKUe3wjIsIpmWlYZg8bwEkH/Yqz/q4MHWC5ep0KpPhQKSe5K+qtLFLVBb5HjFx+U2shkl3WjCDMa44Y9CyBNy6pLOvM8qiLlq/50E0udrbmTios0CsW4UjbhtC2zC2lRjpJzotkFAhDAK65w61I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524061; c=relaxed/simple;
	bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=P5DOqLt5J69Ba02EHzEZfPA9Rb6zQrFbzd1gxJeTupyKfl+vtLKcL1kdVEkGqS2r+lXbNPMbl4CUtKHMG2FuVjHcoiL7CUUfVBMW91mlI9YuUd5cDI8MKEWLNZrVCOoxL80+77+6K3UURBzmfRHbcnJcFQNwtnRn4VrgipdGBPI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PyngYQQh; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PyngYQQh"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-304dd3bb7a6so320882eec.0
        for <driver-core@lists.linux.dev>; Mon, 15 Jun 2026 04:47:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781524059; cv=none;
        d=google.com; s=arc-20240605;
        b=Z+8ZN3BWXcxPZECEmjkXnQDixdolv5nS3oU0glcwuh+qpYHRT7BUptJeibqE1Ak8Wy
         +IciRGSGpQ7p0bSshjIAPKX8QexH4jDGYCE0xiNMp7qElr4RlGq+eqwi7ZxQHgwLNtI4
         9bB/FQoz6jA82iTEtcEC7cFUa34FfsCpVP+AXtgcfpiYWbFiqn7Sr9bOsaioMWGBOooJ
         Ah7K4GO3BK2BY4Hz61IA7YURdAnRWmUHrrrX+vhcWUtp2D/r8hOHw+SQtS/koc1+3pQf
         EOYzooJVRTFHjbGW/udD2HyNDFIOcLo2jnt3ZgJRNL0DVNaiEpMYBbxLSWOdgY+Hqaj5
         o7pQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        fh=NhJK5/FZJQDvlTUJ7F0dcxgCsYtNPRjPQG5Qxa855lk=;
        b=gDlRFSY1gqasAhTCKMu6nolMgreI5YQzyY+98sUcnw55UUF6fbKS1sCM+pCEWQzEVJ
         WADBG+88WG3rXVn86Ji5WXOkNtEXzvZlvs6As/LnmHA3kEwUfd0X7vHVVFHD9RBRsTIV
         AmGFjUB/tJ6wspPoQ25ygAdxvpdGx11m9YDZw4xaxW3pbkdK7j1VsRWyaKhCAoDpSvsc
         qsc25GXEMAYatRRQiWComJJ8Ay0wA6n4YjIvgopETYthKCKhKBQpRPXRso0BuhVEK3pq
         AQMopX+2tEcfmNpgg7gHrGmBkQOe9mifjTSgdT/Xk6AeErXi3l72ENsQp3KEWYDg0OAZ
         z3RA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781524059; x=1782128859; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        b=PyngYQQheaxi50FLTXSiH6D4DhESs5KRhp4b9plCUGQFSKccYqGf1TOBFOINV2ZcqV
         4d9YXPCFXprUB9SY+Kw9D2DhBdn7wJrAGPwvXX9YhxWJGLcrjc1fwEJvi6eb3lIMb+bc
         GiwdprWQyvcjeV8Yw3lI2/eekjhL40mT8jUB3gDo+wH7j53CZaU9/R2q+0O5rwoz55zM
         sumM7qEhZUj9wjzW/hP54BeilUOLqZtjOTTLuyhoer1iGC8rwULrWexndjcPThVH37lq
         PYQzmFnRBB0O92fKnsF/tivoPspwe9dOwTl6xYGwt2WAqPz4UgetXnmj7Sx1X/AicG6m
         cLCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524059; x=1782128859;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRWyWl9MNHhiDK4KIqS4y63xpkwXQM8SRd+8elETUN8=;
        b=pxaujxofnwzAhlZC0jxciLH+2manq65pN45/wwY3kwYtGr1ibnH256Z0F+Irq+8fBd
         GVAmiMMHuoUiUiPsPTlLN7xmYktPjMkxUURHGOtJuu2WqDt8d4hEfMtUig3BReTje2Oq
         Mg33rUGqRo05TPuCVLlYzxszioVel22NqWjW2wFbFoduoxodRlioxMKf0Z7SAuuUHNLn
         +My0Dj1zi/Xm9iZ1cvxADID6Xz/KFFOAjjMz2NT4GaIAo9Q8p1c19Ef75L5eBof4dSuz
         brY8MvvgwFJEs7GwmFE7NZ2CXdnJDpxYFkTmFEli6rSrV9oYMYplEC739offyWglqXPN
         7ung==
X-Forwarded-Encrypted: i=1; AFNElJ/4KbKZJpDr0iPrJuyo0j4uqsCmGf8dPrKZyGv5jE0muOukDliOy2Ku5R3tZZ1dAkLmde+XWbJk5lg/gg==@lists.linux.dev
X-Gm-Message-State: AOJu0Ywgq9HhX/HPE43wX92Onxm2LOZM+MxzDaXvP87y5gaww0DWY9Ty
	aamTR1J6Eo1bhTU9CX7Pxio3X2fZ7C3EPI4Y2emiv0+Qr91NKrsHsHS6DhdMzQnWRvf/Jcs+g3T
	1iOPUX8X/CcUdOo+6ER1PY6MIPTmTYn0=
X-Gm-Gg: Acq92OFtpbBaKbQhCJPdtWT/YDHbfsI5SpOzfQs6XvjEhgdcMPrMKcKEtj0a8nJ4p39
	qHeSIEJ5IgV/wv2hJ1AwR96lOjMd0fEbN/2nWITG+sMCN0S2MGssL7JD692Iq9cdqqvkmm/J/I/
	xK+R0BE/S+dgOzv24oXRrRskXH8yojcKgZVI6MiYMWG5EvrSw0jJ68Okot8KmlM9xVYfgJ4TUtm
	QNr16/GBhvN1vpqoRCetI1CEZDui+G5+OA8aSX+IcyXs2d4h67wdfYyHnY+/jWrCEU/96MqYSX7
	UdMLWMV6u1aevyPAwjU/Lr+BFfBKr7lhg+3uxseR0a/AK2EPc+AO3yMDlUOqQcKTLxqI3sIJ+dx
	KipMJA3x6VoQmy+QGm+7ZN5o=
X-Received: by 2002:a05:7300:ca1:b0:2ce:db5e:354b with SMTP id
 5a478bee46e88-30820093556mr3538872eec.6.1781524058794; Mon, 15 Jun 2026
 04:47:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260611-io_projection-v4-0-1f7224b02dcb@garyguo.net>
 <20260611-io_projection-v4-1-1f7224b02dcb@garyguo.net> <DJ9BPBO51J9U.FQYCSB4SSC8Z@nvidia.com>
In-Reply-To: <DJ9BPBO51J9U.FQYCSB4SSC8Z@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 15 Jun 2026 13:47:26 +0200
X-Gm-Features: AVVi8CegjUXU8O3nUA4IWQxEABTAWlEoMDkVbcmMfj4RlduFup8ycaEWEgohXlQ
Message-ID: <CANiq72n4LzuHdu+D0BT0iew29rck1OydryyTw5j8JKhtW0prNA@mail.gmail.com>
Subject: Re: [PATCH v4 01/20] rust: io: add dynamically-sized `Region` type
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Danilo Krummrich <dakr@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 6:03=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> s/should/must? I guess we are running into all sort of issues if we
> create regions which runtime size is smaller than the compile-time one,
> and this is an invariant of `Region` itself.
>
> Maybe this method should even be made `unsafe` for this reason? The
> caller will need to write a `SAFETY` comment before dereferencing the
> pointer, but IIUC this comment is bound to cover the pointer invariants,
> not necessarily those of `Region`. Making the method `unsafe` would
> force the user to cover them here.

Given e.g. `dangling()` is available as a safe function for any `T`,
this necessarily can be safe too.

In addition, in general, in Linux we have been trying to avoid
unnecessary `unsafe` tagging, i.e. we try to avoid using it for
"merely dangerous" operations.

Thus taking those two things into consideration, then this should be safe t=
oo.

However, I think you may be pointing at the safety vs. validity
invariant difference (terminology is still up in the air as of a
couple weeks ago, from a quick check) -- it is true that technically
dereferencing a pointer doesn't require library invariants to uphold
right away, but in most cases (especially so if it is not your own
type) one needs to be very careful when dereferencing pointers w.r.t.
the library invariants of the type too (because otherwise it is likely
you end up with an unsound module or just UB soon after).

Cheers,
Miguel
