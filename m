Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2544F407CFE
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 15:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779807791; cv=none; b=eWhI2ts1FkTyWERuC+QT1DbqzYFNjSc7ZDb7Sx148etdyh2U1SReqwB8NCXg4kIeklVVcNoTRN0k28J/ePA7JXogtOf79NiAXPGS5A8yX61QSoszpepZk3V/W5q+zguq74/noVvfj3NbAbokkLSRfaT7BARivUTo/6MzQfwNbc4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779807791; c=relaxed/simple;
	bh=ICDwcl9L6q9y1CfG5kqdxmin//l8F4ZI7JbykfR+QdI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=W2NtdpLBnOEQ3+yoj6hLNJg9iNt4g/7t5gTF8ZOa9/7Ek7DrhGKvEvXBK+pcVp0etX2mw2KKc+Uft02E+jqU2jYKw2Nl1ETf/fQYHmeAFjq2cqNwZ9UWd9GQzwXZtGGaQgbX3MREMGaVLCXi9JYwkz0Jm3oCl/QIbFdK/pxDiBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oYZ2kie6; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oYZ2kie6"
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-49040362e4aso51277155e9.0
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 08:03:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779807789; x=1780412589; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8iMitWWCqZ/up88QzDubBPwbYtpSjPJrOVW3+OZm20A=;
        b=oYZ2kie6UPR2Zq6hg7TbjeEF028hXlEcAwVF57GUVbV9fNmA6N5KgHGJGpSdggoRLL
         Hul0516QuWum/b7lubiwNcQlIkD/QYLh+fttlX1LvU0KWYHlJULkVVAOeL7gb9Dkx0mc
         SigzQh0FNVruXkfH+LrF1MLgwojLVGWLca/sAPrMFgJdeViHMOi9KqQ32jY6wax0hnDk
         VB4h7Pgf66WzCeqgPg6re1llugqTeU9Y62x66aRnItCujuvQzelt+4DE6Y8QEqBcaCnC
         As4XRqoYSbVeolAYporDPU1tYHb0Vikalo0bHL0OViC4Pi5Zl4Td41FCNhzqOtHGfuij
         AHhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779807789; x=1780412589;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=8iMitWWCqZ/up88QzDubBPwbYtpSjPJrOVW3+OZm20A=;
        b=NZRWn5uFepUJkrkQAdpBhp5wSNBYnmfG5XJ5lXaVditYNwStMAyK/GVF0eKkicaroo
         CI7bA2ec9O3aGV2TBOsb4IFVHljYBziCRkQDHROzGhZpd/jaMlnfkTxUWIP7pOGTnwuj
         qtx/eVgtNfYuJNgb7ksmZKKZEcZyj6F1xdtEXgLycVx01Udln57DxFG5v5M1GwfXnL9Y
         go2o2Q4UnxG5YgPsF6cQJpC6HmrQu9QgbA0ZI0N1JvVnpf43xSAp4Em88eSr+E62QgZa
         Q0INPzZZ3S/yD8lDlttfWCEOcMEPk8OsFbY+QKlyuwEsJa4/D34QZd+VyrU6cL4SaXeT
         itJA==
X-Forwarded-Encrypted: i=1; AFNElJ+TD+uTniDUlGmilTki6ZE+wKMEef9wzGbZ1VZgmpUQWUzapVnOZTK1lMvoveJywnNCNchYyLFXVwh1HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxKBadZxP8yCVk1iXdKoO9A586nRaoF+XUucvhfxHaiaGcNH5wq
	XUFWlJGcbuIX7L/qPF+ISI/52n4yu7HY8RbBu6DvDNIXSIaVyxIHL0/n
X-Gm-Gg: Acq92OFboFaV9pENXA/sI50OsrgLiv5/uBHBfUDvkpFmQBMnmVcF1dYnNdHh0IUGKmZ
	ffkzVIK6v6RC9lq1eBJTtAOrjr5MekR8qoJs7eBEbXc8IHqxuTEDbHp/Fs4QqAdEbpFuQ+u1Y/b
	+mgtMCG6uovBdUdcsruRF1IVowSFC9m+LCyT+0YtxOi5kSaunDokqZmYDtEqGuEsbJ0R9b0jJ/c
	kuWgNpJBcJCD9hSksrwoAW1xz74SSTXKyc0cpeLnNOvRpYDsKEUAw/ncZ9mwVHzciYVu4z9I0Qg
	AUgwNdnpQc2Bke+4FLMwN7midpjjMSViB5c9zGxqyxOiwkmaXt+XYnCUVSamGIDXHXMrjqvvauu
	Trxs0FXDNfnV1AVLU3Py/M+Ynfnvepm6rzfKt4nQgYHUiD35cbgSuHkTFkafS/PeiGcjH65uUMn
	SvZNO+ZeOLrKBuwX/w/Xqi1Y3tDVRxpqiUTJnwGVngWreUIIlhVgXnEkHRTglXOdoO
X-Received: by 2002:a05:600c:4e43:b0:48f:e230:2a1d with SMTP id 5b1f17b1804b1-49042ae77b4mr334732975e9.32.1779807788363;
        Tue, 26 May 2026 08:03:08 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4904561f682sm354998435e9.13.2026.05.26.08.03.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:03:08 -0700 (PDT)
Date: Tue, 26 May 2026 16:03:06 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Aary Milind Kinge <kingeaary@gmail.com>, Greg Kroah-Hartman
 <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Subject: Re: [PATCH v2] rust: devres: optimize type name allocation and fix
 truncation
Message-ID: <20260526160306.15351508@pumpkin>
In-Reply-To: <CANiq72m5MnUJRJTH=Li-GCYEDoHLcPbKKNUQ=hJUKxB=tNLQaw@mail.gmail.com>
References: <20260526094329.533943-1-kingeaary@gmail.com>
	<20260526115825.1480768-1-kingeaary@gmail.com>
	<CANiq72m5MnUJRJTH=Li-GCYEDoHLcPbKKNUQ=hJUKxB=tNLQaw@mail.gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Tue, 26 May 2026 14:37:44 +0200
Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, May 26, 2026 at 1:58=E2=80=AFPM Aary Milind Kinge <kingeaary@gmai=
l.com> wrote:
> >
> > The unconditional 128-byte const array allocation for every unique
> > `Devres<T>` caused unnecessary .rodata bloat in production builds, =20
>=20
> Wasn't the string deduplicated?
>=20
> > terminator), the copy routine now appends "..." at the end =E2=80=94 co=
pying =20
>=20
> Did an LLM assist this patch? If so, please add a tag:
>=20
>   https://docs.kernel.org/process/generated-content.html
>   https://docs.kernel.org/process/coding-assistants.html
>=20
> Moreover, this should be sent to the right maintainers and reviewers,
> e.g. at least to "DRIVER CORE, KOBJECTS, DEBUGFS AND SYSFS". Cc'ing
> them here, but also please Cc all the "RUST" entry.
>=20
> > +        let mut buf =3D [0u8; 128]; =20
>=20
> Why is there a hardcoded literal? Please use constants where possible,
> deriving the rest of the literals from that.
>=20
> > +        let mut len =3D 0;
> > +        while len < 128 && static_buf[len] !=3D 0 {
> > +            len +=3D 1;
> > +        }
> > +
> > +        // SAFETY: `static_buf` is promoted to static memory, and we v=
erified the null byte. =20
>=20
> This should explain why this is all OK, e.g. why it doesn't go out of
> bounds (a local-only reading of the loop above would appear to make it
> so).

I'm no rust expert (or novice) but that code all looks like run-time
initialisers rather that the static data you really want.

Can you generate the '\0' terminated C 'string' by including an explicit
zero byte in the rust one?

-- David

