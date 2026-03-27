Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBC8D3DEACE
	for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 10:39:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774607975; cv=pass; b=AYRH0BuOdapPuGVM2BpYRFYszoWKe4ws4+La7HD/oivO/Uz/7jsCFI8YiXZ6ne8cY5X0d1N7QSFRVEwVyJmaUar68Alls50YstB8gcuHjAsy0MyWLFGFzbtYetGQH1QZLV8oNQIaiT9UJaAOyiottSD2Hq6BV/emGMrQE9XFr7U=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774607975; c=relaxed/simple;
	bh=KgmKnCUtJdjeKLpSmoc54lARtS0ABFL1HxE3vOF4+to=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uuxrHg+1LBhuy/G8ehJaqjmr60vlih9M+82BIMxHOO+Sot1Me0pcedaJeb5UeU4dWDDVnl8CGxcAORBnpN/Qf6UL7DC9k+jAGTYaXh6ZLq6yd8N+Zci1jw5qbVh1HAZrKDRjOYIuL7M2L3YDHSMbbV7IhISjKUbo21UaAIT2pmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hKWfY3nj; arc=pass smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hKWfY3nj"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12711867ca1so137980c88.3
        for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 03:39:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774607973; cv=none;
        d=google.com; s=arc-20240605;
        b=WxBJJO2uBP7Pt5i2GPCQPJQ9ZITLhWvNn/O8yTxERpAl8E6DJifA08Wc3KfUh7m5a3
         pekbNm1IzuSaHuVXui5FlxKD461xCshFPJYkvr0Do9ZMcl0QdaRfqfXkxZZCHU4koTri
         e+K6W1kOLXvw9IKiFOZfj4u65Cj7d5HVGIM5mWIaLnhIcTh9hrNLkVn0oP2zY1T2bhuI
         K970VZn2SXgIh+o7jsANproffJ25k2TeAPkIBcFzMsDIExKlSPNX0SsezqJ8bU2GNwpd
         o5vcj5Wh1LIuI5POTlQF0GMpAH/Z3WCE/2hVA4bO+BUeI6u34TityrEry8Q9uZYm4lGg
         fJbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gaWnQAueb/Sgl9MJS7B5EK/iQLA8MIqRPnv/jLDrg+Q=;
        fh=57oR7RDFq1ob2XyCakn1Wxm7OhqWabYaC5BMX8azNHY=;
        b=jcvgEne9TW6em+qItz45mfUy8inS6QG3kfDgNXdIG2Pi6xauozdRt45hFGS9dLI4Jj
         zr29yGkaShMgIWK2xrEj794qXo2ENmXik9Mp/Khb/lAlVrt/rxiQseLmI+r49uMentBH
         1GxBbZWS0wCfD9qLUJ+Mt72v6E4ktephCq/mp+cos1DrontbQ6JW6nkrAdPGT6MmiAH4
         Yh9pAwvblms8JS/au9h1o5j52ox+6zp62nxwEeRgOG0QXu+FPUg/d5MIH1N1gkSxy4jf
         MEoZiwvK7Fe3kerpD4fDKf3jw/gb1Jhw/gumCKReCP1CV/47Udial2Ex2GqvajxWFnNl
         kr+g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774607973; x=1775212773; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gaWnQAueb/Sgl9MJS7B5EK/iQLA8MIqRPnv/jLDrg+Q=;
        b=hKWfY3njOZ1+afh3Z7Gsy1j0ENlq54bp0hy+IzID+HJLyYWLlcVbBMB8BwylX3/Al7
         KPSyNPIK/X6jiLUrbNlmwsQqXuiWDqQrdcr73z0wFwkDh3BU8a7esK5JJn/2WT7TdQtA
         v/N9na8EMOYti0duxSrNhVuDLIrgRgtAfaXxerzXwypU97aXGyMpk4mSfkwHOn9XSPBN
         W6Zu/aXVOVfXa11ygMxp2k5HPfTOv4V46MiazODBoVRlSqob6qG/7RP9YbwR8JIgL95r
         Ve4t3DFiL4+HVJjp/BQrwiaAwRf3OicS33kmUDhOnsqD9qVzxZKQEEgrfl/P3t6LX3T6
         hHUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774607973; x=1775212773;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gaWnQAueb/Sgl9MJS7B5EK/iQLA8MIqRPnv/jLDrg+Q=;
        b=UtNBdZLA+Z4d67abUV7UEaglqfRAjrJ5C+6hR3n4kUPqoHABnbgywLN0LgrRSiQXkA
         stC0s/isEl92KAgxwuoc4lySudI/uMI643tViOaRu4NeqRVhp/rB3YWEBUpITcUmbkc0
         2fPwCSmIH2B8B1rNxep6zl5aLBKHAH6G5ihVHNBT11XZ77JlQAsMOnLb9SPGhop8RcQN
         CM4pUJ55/xa0HxP7SXn4GqUIZKHvEHyMPIf1P1syIXBo5a4PrtwQ+LFVBWVjo73aOCOp
         6YuSqTFGuarmZv3X2hjDE0we+/SziibCKl83z2TVP0t8vNu7GYgNltpqcDpVVEv9hkO0
         A6ng==
X-Forwarded-Encrypted: i=1; AJvYcCVn5eQZ86wnaiC7CtplkQ8Vy5JLtf3wO7sHo1TNKEY30VrmYg7pzKqhBJxuMQ+EfNvr37cOpTnP0prAdA==@lists.linux.dev
X-Gm-Message-State: AOJu0YzDtZIxV8Nii9jcfQZGTNqiDUkluETO6/okcylkMsAtsYp+A78i
	R/Z+kDz66/qkPEjzkgREIUE2pUegoYAnOmwedmpF1Y8oy65pS8iCeVMkL1qD58tx06Fg0jy2bbm
	GfvasM5SYSnmjmXK+2ShQyy4I7g+ew/0=
X-Gm-Gg: ATEYQzxkQh0SSAOHVeuAyG/cTeJ20fxevDXVJeBbCWUnxXDJMHXNqgs2xKAcMQ66+RO
	wOXtUAW5sagKxV2NKvbqlwdYTe8lv6H0cd2DjLDUerLhIciDeJ5oWsEvBDYx1siRFyD5X6VzA5n
	HKGPPyrx/H+EjB/zz0U/wmJc6VQJCj73fPOh2JkKz3xuK5J+7XBTVTwbITH2vRhmRCiOZct4NqT
	/U384WRwYLWQS17rsPhE/hcpz7h+yH/pMn3yrVaAm/TZSMWnwuztzdi//Wtte+47j1BUR4hjpFA
	YISNkjS8AbbhLVYcdS2Il+yNBgMnKlVYnZXEOwpGUbA4mX1p1wecC78z/o+mfxlxOkkk7Ua8TEj
	QRtkXCTuVGlZnMptFUTDziHM=
X-Received: by 2002:a05:7301:578e:b0:2bd:a3fa:9bdc with SMTP id
 5a478bee46e88-2c185e5063fmr380182eec.5.1774607972924; Fri, 27 Mar 2026
 03:39:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260321-b4-nova-dma-removal-v1-0-5cf18a75ff64@nvidia.com>
 <20260321-b4-nova-dma-removal-v1-1-5cf18a75ff64@nvidia.com>
 <DHABINRM1861.3HQ3J4IZ150F4@garyguo.net> <DHCSXDEMMPZ9.FPPFUV6AMU4P@nvidia.com>
In-Reply-To: <DHCSXDEMMPZ9.FPPFUV6AMU4P@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 11:39:19 +0100
X-Gm-Features: AQROBzADerygp-PNkSCNfuM7KQknZIJrHT2zwp_Pm-Yy7FuiJN8HyeniNgPhMkE
Message-ID: <CANiq72k4ib+pXymM9Z2gGvVk3UoDSdrw8d61W5-x+zuV3542Zg@mail.gmail.com>
Subject: Re: [PATCH 1/7] rust: dma: add from-slice constructors for Coherent
 and CoherentBox
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:59=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> Then it looks like this:
>
>     let mut slice =3D Self(Coherent::<T>::alloc_slice_with_attrs(
>         dev,
>         data.len(),
>         gfp_flags,
>         dma_attrs,
>     )?);
>
>     // PANIC: `slice` was created with length `data.len()`.
>     slice.copy_from_slice(data);
>
>     Ok(slice)

Hmm... I think I prefer this version because (conceptually) it has
less calls, closures and conditionals (i.e. 2 `map`s vs. 1 `?`). Of
course, it should compile to the same thing.

In general, I think removing wrapper types early is better than
carrying them around. It also seems closer spiritually to the early
return style of the kernel in the C side.

For this case, I think both are understandable anyway.

Cheers,
Miguel
