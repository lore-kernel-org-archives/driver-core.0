Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC7B3B995F
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 16:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779813019; cv=none; b=pnhbN0SFObgbRTAFOZvfGHmE4nPeO5RgJISATj5w93xJ3q9CPUv4uZTzl8nEBwNyWe/UG4Udxl1VHY5/MhkvW4kiw7wOrtFI54u/rnu5cjz4MCUt9XJimINnlO+Ihv0Oo2LNO3+NoH8Fmhzz3lUDz0+YD9+n9BcLn58wSL2HXVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779813019; c=relaxed/simple;
	bh=JECUL7d1RrDbuNWc1fiKrq5fc2pqxt15t8/KKX09aWs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fpJrHrn1XF8+v6qSWCZ2eIewQx8dXEuAGvzk5DNYaFqzBHs6yB3bcugQZO34eb1kutXPz2ArXY1LnslgHa9xCCN4xkrZBEc1WdXrskzlm4eR9oUMfNs+BNQ3XuBSYRyClMjwqezEhkvX1a8ozvvJRGobbSKhysUGrVsTJpqgSTA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ClKe6yTJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ClKe6yTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 83D151F00ADE
	for <driver-core@lists.linux.dev>; Tue, 26 May 2026 16:30:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779813018;
	bh=JECUL7d1RrDbuNWc1fiKrq5fc2pqxt15t8/KKX09aWs=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=ClKe6yTJShO2EHKavv/i4PJPngnaDjsIoQau7hsrnPF/fC4FHBzlibnbqf3zz+OEF
	 55w0uOC6ySMKTIKxJqNgkq8uJaet+YtEBqqSlbQDv7n2RXAIpD02Out3WNwHJyMTG3
	 1V1LjEayrwwO29oqCeyxRHyFePLWS/rcVfIh2o8Ad2u7YBUUWo/j7OtvhPLQrXMKBf
	 oTi0UMETy3iKjlDUO/RW/9UVA+ublzC+KfpA441udWLJPlSIxPzioyxkkvoAdLLGo0
	 4hVRLEp13oZ/D2aRLx3yozXeITG4VVfLAr/r9MoJEqjJnEvZtS94LJLj9TKQB9Kpgo
	 ex2TvpE8pAVIQ==
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-38be5e86918so13871201fa.3
        for <driver-core@lists.linux.dev>; Tue, 26 May 2026 09:30:18 -0700 (PDT)
X-Gm-Message-State: AOJu0YyeUGXnSGKMcoKXFUzWGT6aDmLCGQ791CMaahTNXVqIxuG60iZA
	xrhiW8hvgd/zDmLk23rXDYKAEPTU9qnSS/W3rVl+VB1xmpHQRMpNt8Lnptei9so9Sy1DhNbSoJC
	sGwCBXcwjPkV1M22kHgbe0MARZo85HBo=
X-Received: by 2002:a05:651c:2114:b0:394:635:70b1 with SMTP id
 38308e7fff4ca-395d8c35aefmr66850541fa.3.1779813017114; Tue, 26 May 2026
 09:30:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org> <20260526-trasnmute_ptr_to_ptr-v1-2-d89bc1dda3b5@kernel.org>
In-Reply-To: <20260526-trasnmute_ptr_to_ptr-v1-2-d89bc1dda3b5@kernel.org>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 18:29:41 +0200
X-Gmail-Original-Message-ID: <CAJ-ks9nRaAj8q-K=ikdgk2mSRDak5H5f5nDKWLcxcTtnhEgX0A@mail.gmail.com>
X-Gm-Features: AVHnY4IOeo5ofg8QCIGcwVlPbDBiZdtnZHCxz2CpgN0SONUZnwJi8cFKTkM90Ls
Message-ID: <CAJ-ks9nRaAj8q-K=ikdgk2mSRDak5H5f5nDKWLcxcTtnhEgX0A@mail.gmail.com>
Subject: Re: [PATCH 2/2] rust: device: remove array copy
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 26, 2026 at 10:39=E2=80=AFAM Tamir Duberstein <tamird@kernel.or=
g> wrote:
>
> `[T; N]::map` constructs a copy of the array which is not necessary
> here, thus follow the example in the `MaybeUninit` documentation and
> transmute `[MaybeUninit<T>; N]` to `[T; N]`.
>
> Signed-off-by: Tamir Duberstein <tamird@kernel.org>

Please disregard this patch from consideration (but please still
consider patch 1/2).
