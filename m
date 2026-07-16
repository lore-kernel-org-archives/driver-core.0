Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AC2C435AA6
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 14:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212149; cv=pass; b=hW63OGVOze4D6HMhZQ/LJyCPpIuJA0W2wfPCySGvPyO4unW481435HxGK0GpnFo1B+ecMnlaPqxPhGjOw1XFFTsT0EyCKCP/Wii0sOIGBslUEjX4SMml5bKFvwH7TUqGYol0hWjgQq7fV+iTADB5hTtZeDePidPKPx0Imodtrh8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212149; c=relaxed/simple;
	bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=q8kzLvLqlG7RpM9DzKpnQUD8KgBKCrDeqm2dCzf8WutUKSG24M06Xv0Cuvp1AiDf4ZyVUdqH90Bcb9KCSlX0AoC7G/B3ik8eHVQUznJKuYcofo4LUhMnAIA6p7dBWMFjKHdcC0J08BKOkXaax2djpXryhwhQvFvmDKEK7RCt6cQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CkUovNTG; arc=pass smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CkUovNTG"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-38096590070so1045955a91.3
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 07:29:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784212148; cv=none;
        d=google.com; s=arc-20260327;
        b=eR4RIzotn9S1IsKk9g9Wzbaijj5UIM9gokGGq5rFccj6ZHjBkBR/1+ojK4dqwt3/oH
         9BUwfw3LJ3On+yj+fBkPveKIaEW3IHceenUNQJgLZaDG8Z+d1qXFZVor71/v6fJFHips
         I6/iuHD1i4Rhh/Ir6DJqn6pz+NN4bjdi+0n6wQOP86J1pfxDxdmAAq9nRUmlEFJul8mw
         eh8wmqXKF17BXD4vypA7GqIPhMfGZjcOFcQ4SASxFWxrpqZSbDDMycUU48Ih9NMDo/dR
         nIkT01Jc3qzXrTF2GFKhmVc9HGnmnoDxdUe3c8hkzt7Jir8gEcIw1AwpumqJeVulgDde
         a3lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
        fh=XirNJSCQ+lNxzYJhXaTFGFVp8BEaDro0EL0XjQd2XIc=;
        b=EsdQbeaUa28w1XoVgspu1ppag5VF1/hyHuD34MgeevMzFNFDWYpKby45CDMAfW4xRv
         0jfF+ZuF6YhaTv/85/7FTrl/3GAmrdXhC9QLvpdEw7/IJo0suM9Rz7UE4VnhGDfrwCEL
         nlXIESAGUg7NXL6of1xYqr7yrkxl1xZg9QIBfhKUlbOeu39rYyiVCSusujhMNxcuvPnC
         yNGqPUaC29NTRu8eik2IkpDkErcBIzEWMeaj6DoCDe6j5ntZE0a8HHV9KXSICOVxVSv0
         dGGlhBwxMOy9zpELTPcEHgOc3Z9KTEA/+d5AcREf+vCAIHdy7w/JYSXbAPke2yn6sJNb
         27zQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784212148; x=1784816948; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
        b=CkUovNTGmM1++5JBmbYhdhPdhNCiRP/QeZHGtTE2zBdCouuOhy4V4rVoL/ag8ECqbn
         rx3qBLE+mCO2c1F0bKbJe8DRD0miF5QGFMN5/96dINS0m8YNYBqko7Pv9VVYc1M7eqKE
         riTzzcHqtgLjRu3WGMi//34kTV2hjqkbrUr00jJ109VY1iksFChSgifDby/SzRErWcdd
         +8j5Q9+CXLTMBlcQy4LF+8028AKfn26vn8vDzufkWCbUg9tHeGQcRIbyT/0Vmdzwb1wa
         fl1WJaAFDrNAb5C2qJ8rXflKu53lwp/XPcaR4LBF8H4nWYLHmjN9CSp86xX3GNs7MT9D
         YdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784212148; x=1784816948;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0EQNb5xuuVXTap9WsSSYcCI5990Gc5XWs1gKOF/9wiM=;
        b=D7YIU4WDsG3XXT+CejgLm7blqn9Cvsm8235/5hPMsSzmlkcKoToL58g/dAMgejlN0F
         +Ym2bPiDM2EZnk0cOEKIwDZm3pw89SwuxP+1jSIxwAGjBeuRvx6YORRaVOpCtfsmv4Vw
         rG8vSaiAwMIovmjQD/SIzxyKguCLBLiTC9RYVnfV7HU00zMvhYVUVq9JasVIEqVRoOqO
         MWHdrWwwH0b7g61vsiP4Czb1ovt8sJ+1YP4mDuIxQ+p/A0U0+TBLYeKW34NSxo3xf3SF
         sHLDfMhprHlCOMF+m1nZTnAF45yp3wtYe1lm4I4PmwhF+LL+QwEhfqJG4d2kRXKK/rKa
         ea8Q==
X-Forwarded-Encrypted: i=1; AHgh+RpRq39etM3dsnVSTV/NTA6lZgS0rTdULFaW1uC12WvpgPgXmKDwIPd9YC2yEaacMM8dA1iPASwPero+pA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwDU8sdzf3jCHdvZsM6yq2F9ZabFo8+bPLpLar6ob9+RPlNOWJ2
	ORVItqlU433tRna01PqJR0cuamM4KhYTZl7EEFadjmH4015kMndeOEqVABDI4d7dG+wFTUzktNF
	vGNf+2ky1zGgiBnduShgPPRyf3YiyyC4=
X-Gm-Gg: AfdE7clf4sDGACrcKGxHROmyqG1Tygqs6M8oZDCv4KAA30zAtHpLUDZXXW3KCJp/Vs1
	xVs3CAANtZcJHBDrYAy/+Y8n0Jjn1hCakG3JEgLcjUYuk11536LQeH0oi5xBJ6DToLTWHGPBL/h
	J3RHGX5KxaM94JrgDGrN/Mfg7CE4WnTWjwJ2Zu2K1bm8Pa0wu7EI2Ruq1xhFVbuvy2Br4Pc71NF
	QuvnUx0MdN0572iBU6RyBDci3kG70GvtR6dEYdQbHcdz56iBc9pRgJ67l8jHXkkXY6DcqwEKmkj
	7WQcmzk9AejRb3GL0wR0fqaMpMfBokTS4U36T6oEl/MWG3qZLzGpknMba242CjpQWYOhb+7u9tQ
	HtysKQtxa38YF
X-Received: by 2002:a17:90b:4f81:b0:381:77cd:38ca with SMTP id
 98e67ed59e1d1-38dc7bd893cmr13870734a91.4.1784212147800; Thu, 16 Jul 2026
 07:29:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com> <DK01SW0X7PXH.15BGNJS3Q18BL@garyguo.net>
In-Reply-To: <DK01SW0X7PXH.15BGNJS3Q18BL@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 16 Jul 2026 16:28:52 +0200
X-Gm-Features: AUfX_my1-7SKStDwlC89EJwJoC2eX-6QOKiEcBN7hBCAlw_VWUDv1UPyakhGdVI
Message-ID: <CANiq72mZuFsb_Otu2fUSBHQ+oC6TrhnM6-BzZB7KcqV97yq0eg@mail.gmail.com>
Subject: Re: [PATCH] rust: device: avoid trailing ; in printing macros
To: Gary Guo <gary@garyguo.net>
Cc: Alice Ryhl <aliceryhl@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 16, 2026 at 4:00=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> I suppose this can also be argued to be a fix to the user that use them i=
n
> non-statement positions (by saying that original implementation is for
> statement-position only and expression-position usage is an improvement).

Yeah, normally I don't put that tag for these, because there is no
actual bug being fixed.

Instead, I normally say something like:

Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is
pinned in older LTSs).

I will do that.

Cheers,
Miguel
