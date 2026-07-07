Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC01F3FA5F1
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 12:13:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783426392; cv=pass; b=pNdhdFcxVRUl/B+juDhUw1m5q4VHOCyuZTE0JQ8wDBPKD+I+8RAA4M7r9AnTuRh17elVgbo5uHz2myrOt4NZ1LhtNXnFCFhJfT+kjQF6aCw6rCL8HoCD3C51tE5MgBo3pNPUNSjhI/hquOqx2p9mXzDADsoq6Oy2vyfG9OB4Bp4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783426392; c=relaxed/simple;
	bh=HhpGB3OYa2CqKqz6yuFbvT6lpvjmvLz426BCM2aCtyg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mAH05qkXNaZbvzFsy2U18SeVPqFUB2LQmooaLRiYf4Mho+zC1QiaESocRFKUn1CCo8x2q4FN+Xm8z8jMIQG2kMn2cbipCf2ZHKwEITgKkxqlrvO7ZhZU90FAS+AMFTX7Ds7P28mIO63YDIGXweCB8zv514rncTpdP3N64jRcnrA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gLnT3UtC; arc=pass smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gLnT3UtC"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-c88ada0e12aso339975a12.0
        for <driver-core@lists.linux.dev>; Tue, 07 Jul 2026 05:13:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783426391; cv=none;
        d=google.com; s=arc-20260327;
        b=Qk9WAY7scbkOYHAvieuMuJtznbUvMhvwSSbtI4QZ/o/3eeHdRQ+iyHlLmVs7RAhsql
         6L1a0NbjfeQOoCxeCQET+4ePAEWSm6btbXFo/BXNzl4ttSvKzYkTEJyOQbGahJGYZauU
         b+hVsbCiFNnSjQJnkGUAe5R8DHk7gf813KuPd7mItVlRCD+NFZ+pCMC7vppKKHUReOZi
         TJNJkPPFIyUo6wCruIH4+7aZMBhMN14+wyUrIOwW8x4NErRz5eCJvHfUMaFT8FI/++5M
         zivzun/UzCx1H6E0hwJQuALxWWUo+Wsvi/Yqn35tSP3SuttvUq+tZNeoL4bhUruBnOzC
         gKXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bHu0GnIIgWH4db1JTnTdYIc6jfcrn5j/73Z/EPreQ4A=;
        fh=mQTHUxMvivCM5VkaipIkauh9BSWdHwNuvUTZWp21Dq4=;
        b=g9l331KN6QvrlTlOn7jkqljl3vKyh76GVV2u2ulbXp6A8DEVCewELzLQaZNf88NgXe
         GMqOL4EVI7D4trbv8Twl97axiz6isTBmSpO42qPJlTBCdd+9dQjgDIxZ+ZCmlCzyUCs4
         I17rcwziyaJGcO3J1y+etXHHQxvlhh51lbw1jU9RsTZwi/fCk66jfcE3dI85XuTblR6/
         rTn8FV11DgWu1PWK1kxQYDd3fg7uILDb9szaX0bd2LHs4h0CF7T4HN0SIRIhHFgJ+VJm
         v7Cisj38sc6DSmE80mHKrQdN7LYP0CHv0nyR4pnv1PYGa6e1Umdxw5Ro3Nfen2vn3mZa
         Do2Q==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783426391; x=1784031191; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bHu0GnIIgWH4db1JTnTdYIc6jfcrn5j/73Z/EPreQ4A=;
        b=gLnT3UtCc9hSY2pmsZRK6EBifea3hVub/8gBKpn4b45pa+7yNx1GVJiQl2NE6fnRm9
         1wDfA5WQ6D1uCbPSgEFclWtHP7+Qk1970MemiIGfH7H9spj6oXIrrHF/Cbj/0/RX46fQ
         feLob1JIuXPdrhR9trfuI0hw+n7UhbFWxg8l6y4eSkEJuFCF3Z/OYygP4iipx8Ni28sY
         krkxdI2xr5PnQR5jJYilBiugst2n/eF3p8fwywCm4ltzBPnHCgqOndQjkA/VrF13nABp
         wIi8TwEiVmY8Tq+XqYydQkyqOcC2+stTThf0kJ3qfRwaGIS/xXABYVXrjL39QuyoE/N/
         UUIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783426391; x=1784031191;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bHu0GnIIgWH4db1JTnTdYIc6jfcrn5j/73Z/EPreQ4A=;
        b=b0MkrZqZ9GLeIETnttseHNGAZ0pwl0rFUMY2kQENTocVHk7AeoUsNppHGWd6tCN1A1
         0mgvCi60jOkz06aEnjsv4aD1aZLaR3Os0yFy0PYeiJX0FG9ek1wsOK6R617xz0i2uFMu
         74l+AbG8eCuxXHGiI6HdkDGwSlWMg4bcFwOqToX4ZEbpFcsyQTZ6qdxPybcZMl7boU//
         cpblp0C6WWkMGOI+8FrTsWaD7m47iGjRmMtb9U2I28+CaqGANbgfhufTPF25NS5Ndjd+
         DoXb+BgFzj4YxD/RTKlW9KN8+HRLwyRRmfwwO/thcHY8LSULcIUymffbhDARSIqoicUv
         tyKg==
X-Forwarded-Encrypted: i=1; AHgh+RrToXvanO5E34eUXjbh9flwVCRYoh38/Tk56VL0a0KwJgLStA7m3w11tV+omCl1q6RjJWoQcX8jpAG1HA==@lists.linux.dev
X-Gm-Message-State: AOJu0YwP53DgXZMJjXqTW1+sbdsSxdN/LHJMZkkX1TZZh0ZkiGxFnR50
	6/L9LVK9/O/QE5JoVPNLa+/JDeWAKbE4UON2r5qkVFxNLPzGfDPKhMzAXFvZt9CR9QeCUJU5eGA
	KLRFUHs5F3zVOKdSNXaZWNrA0PMjkSf4=
X-Gm-Gg: AfdE7cmom8zEwsug+7mbv9wHZ9BY9+ExfEf1C4maCVV492IUSVllbFP7KgSaR2+o/dG
	nZ++Zi9fhjGvFRL6mbyMA9ee/yOSsqpNjsu7DcHuOTfBPeJF/sHUV3/Dlz7lYfgiTrgOoXidPKL
	fPMIoH66Cw1fkOrHpvQUdf2iZIYl2g1acGKLrO/n+UwUCR+/1XQ2n5bxS68f6EWV/Nn3nsTPahT
	mf4zPXSGs+bt9wfV0B1qN//DfdRJMuOtk/7dh3SK0po/EIetfEPSxDLHtdbi4WcyNTIDU8EMRnP
	WH4hNJ4gVbeVdkwJ69kAGgbAfF7cbzXcE/UsVDejpwUobHOBvyyjCWKmIxAEKYV85i7MpXiVQF/
	oyvOGt7k0fTGg
X-Received: by 2002:a17:90b:5544:b0:380:9cd1:d985 with SMTP id
 98e67ed59e1d1-3829fcdabb8mr9859894a91.6.1783426390826; Tue, 07 Jul 2026
 05:13:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260707-soc_unwrap_or-v1-1-1ca1757a259f@nvidia.com> <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
In-Reply-To: <DJSB9NRJ9YMG.2B8SJBD7VNEC0@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 7 Jul 2026 14:12:57 +0200
X-Gm-Features: AVVi8CcP5ImJtTczbXQMmoOeYju_lcwoXyukPRGT5iSjmvdSTTHk636s2xri4Zw
Message-ID: <CANiq72=Q7aR51uvwKXUh2YWJmDuBAHPECA57qG3Hr20xWCt0mA@mail.gmail.com>
Subject: Re: [PATCH] rust: soc: silence clippy warning with rustc >= 1.88
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 1:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> We set `msrv =3D "1.85"` in our .clippy.toml, and my local testing with 1=
.88 and
> 1.96.1 doesn't produce this warning.

Yeah, I was trying to reproduce it locally too and didn't succeed yet.

If it does reproduce somehow (e.g. a particular toolchain), then we
probably want:

  Cc: stable@vger.kernel.org
  Fixes: 057d44b05775 ("rust: Add soc_device support")

Cheers,
Miguel
