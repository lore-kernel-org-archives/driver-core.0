Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BFB42EEC0
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 16:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782749723; cv=none; b=XG3fdw5+kKSpwX6VQBIHxtaNn5UpKMD8NZ8PaWS+AygdmYTgb9Qk+O7qL7H25F1Emg71/gpzixOxN1gZbCzmSuN3Y1/EmP+S2eVouEoj5GJgrsgbn29GX2MtZ9BWNCHbJXwyA1GTAdwW8BQOHQ8frj+qiUktdJRaLltKg2C0ews=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782749723; c=relaxed/simple;
	bh=w6ZVnKbd/yP5ciQEeAt3KGcP1DU9DnB81w3BTQgoGHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7N6eKHpa+vbm8P80HGXasMoMwNuzHPMeWybMtTiHErso+tEWzkU6B/r0A1/Gx0grwkuTTnHeZRLJwl9O/3Ia/+yCXCAUPzM3LDyX79s3q5GCmrZpeIGCxCwxeWkv+CxlY32kGGohZ2VLxY54GeuT/EEod/trP/cPfjDDk/RkO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TJoazlts; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TJoazlts"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22291F000E9
	for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 16:15:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782749721;
	bh=2echV2TuUCorDUo3P+lP4EOwfZ6UxnA7Vrhb9+2po14=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=TJoazltsXCrMCTgucF9n2rj55ynbhFXimvamVNgnZhCjgNyjgNqGE+fB84F2BOlK1
	 Lhep4YdXesYdd4f+yP36ezAZZrT5O1TXql4Eq7vImX0an2xO5P3S37240UffBz51JH
	 F3OhdkIPez8rlNHeQchlruofSmheg8cfSA7hNy5fv1OwhBJmiJSLX8P2+qE0X45xRL
	 okDyyj6H7k7wo4fFTcbK9a7Sh+rJsQe9YgiHuH0jnIwIhNoP2+bk4RCNC0CnkEPhhr
	 lyayZgs64iOAznZH9uHM9q2Wokb0AxK7AQaTYq/Mwb3dFzVDr66xXJ8cp17sX3KN9q
	 710v1sBBZcBEQ==
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6984169c126so4413272a12.1
        for <driver-core@lists.linux.dev>; Mon, 29 Jun 2026 09:15:20 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8tQEbPQhePkZvnMpuCSxF83ULFlpioHyO0FLuz6/DiGES8wJfcqWxU5VcaVlzkRFhCkPHLJ9+XRHZ6Xg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyYaThRiiKX/zIgvnPVg40VhZ9pT/0+1WyTNFwFjEnfwsM6/jGY
	pJcx41RVyCNkZ8ERGD4MzoExVRSuAzH4M0eTBakkS0gZbbjHU4gZSb71cK+UTx0yGhbtoO0xrNt
	p5Cws6BZryTSRqa100OkMxv0pZ2Ulog==
X-Received: by 2002:a17:907:1c91:b0:c12:58ac:9869 with SMTP id
 a640c23a62f3a-c1258aca1b9mr349323966b.9.1782749719747; Mon, 29 Jun 2026
 09:15:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260603-rust_serdev-v12-0-3400ffb88b12@posteo.de> <20260603-rust_serdev-v12-3-3400ffb88b12@posteo.de>
In-Reply-To: <20260603-rust_serdev-v12-3-3400ffb88b12@posteo.de>
From: Rob Herring <robh@kernel.org>
Date: Mon, 29 Jun 2026 11:15:08 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJEqUbA8t_01E+QBbsfdV6JWKGJPhEQMD7YKPKYk3vYuA@mail.gmail.com>
X-Gm-Features: AVVi8CfhB--Db5QbuVKNGlVOJyT9ymFkRQjZNe17XqY3kKJM0r_8jlarJXXYsZQ
Message-ID: <CAL_JsqJEqUbA8t_01E+QBbsfdV6JWKGJPhEQMD7YKPKYk3vYuA@mail.gmail.com>
Subject: Re: [PATCH v12 3/3] MAINTAINERS: serdev: Add self for serdev
To: markus.probst@posteo.de
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jiri Slaby <jirislaby@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Kari Argillander <kari.argillander@gmail.com>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Boqun Feng <boqun@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	linux-serial@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-pm@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 10:56=E2=80=AFAM Markus Probst via B4 Relay
<devnull+markus.probst.posteo.de@kernel.org> wrote:
>
> From: Markus Probst <markus.probst@posteo.de>
>
> Rob mentioned he needs to find someone else to maintain serdev.
>
> Link: https://lore.kernel.org/rust-for-linux/20260430195858.GA1650658-rob=
h@kernel.org/
> Link: https://lore.kernel.org/rust-for-linux/da85ceb81f51079d4a8248a1ffde=
6a27d2ef24ad.camel@posteo.de/
> Signed-off-by: Markus Probst <markus.probst@posteo.de>
> ---
>  MAINTAINERS | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Acked-by: Rob Herring (Arm) <robh@kernel.org>
