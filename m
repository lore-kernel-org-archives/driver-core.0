Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FED3AC0F2
	for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 10:59:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782557984; cv=pass; b=ewVniMo3M/Sihln50UXidUk1+sDjTZQMWZ1NDwggh95XzZ+oSXLx8yhyu4+vYREnkD8+4PPH383oCs3mnlKJad6eh/bQ/6MHZEUcSOfBI+MwffN62meszsoZGImeKh2VZRSMUEe9iJ8guM1cWab4AOFRy/vp8EgJVT91wt4sg1Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782557984; c=relaxed/simple;
	bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=p4V/5uIviQRdHQBzwPzx2oktnQ1DrRNrfc+F2475mxd3ASUxRaJ35xhSJWjXgvWXkIv0I4zaR8Yhib/n0GS2OEX9dzmKYwjyQzgAMsPajbIyt9nbHfWJiBoWDX4jGMPrbhqtn4M7W3ngTqXnUqIMw1RwbPP49dmogfHHudiapq0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nAuTLoM0; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nAuTLoM0"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-30e377fdd54so10144eec.3
        for <driver-core@lists.linux.dev>; Sat, 27 Jun 2026 03:59:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782557982; cv=none;
        d=google.com; s=arc-20260327;
        b=iLv08uxcpj2EW+Y/9kuGIps393UIcTi+33shUVLgGEiflMatfke4KpAcdHSlUb4zD6
         VUvA5dlx5m3GBBgHerwYpJqFVPDv4L0jbgec5aNRWKTe1heWyJeEi6dMI+PcvqUq8BBa
         sdmrYFZci30N4bW2p9xWH+00wqVxsmePl9Ingj2tNal7F/+s/HONYl/HDofveY2aaQ6E
         U1cv+a/2NO/8NRoPg5fNx3PkX0oQaESzf37m9x/fJ59+55CdZhGFeYWo0GuE1EuQxMbA
         WpBIBDTw4VL+2bCbeJPi0wLCYqpuYVl0bM+oGzsWP6JN15q/ncIlBU6x/m2Gu8JcMfty
         QtTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        fh=3FrHeYW7u2xJTPF9Ybm3EmNEb9YAqAdQDF5Sp8VFrDI=;
        b=ffcdrP3dLhpyOQL0vbXv/y180LKCOG74dDI/3WiNRd7ZxxaYF449QO/Is/UdOjuUSp
         Jk3vgEGlQsX4qmrzEMFeKd5yb7oZyG44AOrdNaJ/rRKawbD82FmmcvRy5hBhieJ2yDUO
         VQNkqCcjmpxfc0Kw7nT5EFIkNe3d82Z5BqM9s5V8yyO7jO8Dpl1YrBd76u9c/h1gXK4H
         n0lTi8SNM7R1p0vfkjrADj/L+px05EF4itiQNybNO0YzTLYn4fokuUedOD0YZV3LFCdq
         5NuEP9J09UijV7ItG7H31saPcU4oMrJRDwxaSdYbt6hIVuqHbuY9ZAbY8a4aRJe6MA1l
         EYYA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782557982; x=1783162782; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        b=nAuTLoM0W6BQ+MppY+cKbyUqImfoVTVrghNAM136EQfRaLez2PPpI/74qrRtaVZO1y
         cSB4LnpeI+ZQ5vfTx3FL/sfkB53Tv2HSPuqXjVGa1CY/pY/iII5JCSUXkOFAnBmxlQM/
         kzCVr1+/D920tJhvmb3ZG/Y485XY090ffOwRuRYqn2lOpzYRJr+w8mLPeKI6B1/gKcrX
         BdfHWqO2C54UcuwhJ5uompA6u7bRpIr0EZ7RTo42ia7Oz2fvodI7tgKaoyVKbBEE1/U6
         Ac6tC48swLipcNgwNTezeNi0xnnpDp/VHINoHRkV3VJZQn1rOtq8xNFfdWEFrlkJGd1p
         oj/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782557982; x=1783162782;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n+nDLLPZ6wEr/4dq0uqyhXXPZoefpLj+VqCWxHyZNrQ=;
        b=bk4ejmtlpObdjF6s05Fmg1CS7t/FwiMKE/wsaMfp33yeHjBj9bd6wSiEgKUTwenZx3
         tuaNVL9WG+3PwVArX4G/IZDgPDfuuSWrpDhEhbwgEKZFr1a8uRhgQRp9TWaWAuDwFIxZ
         h0N7W3EdOlqEiglVS1dyfQQzyrV7wV8BeGMxv3oBCaua4RFFv/uAiRW1hG4xZmPxAfWq
         y2BSbkzy/BGfMIJSnXMSglioKLc9USIriOkeBEf7NvrkJUuXG5g6/AQzW6OnlEl+UW/5
         XIRV9D4BXKmSToCgIBUd+tRWhhVEaD941QAjMWH4C0pvV3sdxoXo+2+YxIARTN7JhbFz
         LBlw==
X-Forwarded-Encrypted: i=1; AHgh+RpC4MH9384Rz6t0NHjFV4KQQl5SiiCOTBH50jlGiWC2xlQkUgkSX8K4Zq/ZlR2YWF78zJZgz1rKDqyzIg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz+gD7ipIzDXPkTt5KOiksY4HfmwJU5zJricDC4NFKpQjT+ApVt
	/U3OU0EgaazXW8DMiycGDxgtuQURqa/GgtH+r7QLbRBGghWiXdvGdD0QgZU/uBEksCjqQ5K9gcm
	ngG5vY3Ssbl9pJLq9qUqCQlql2r+OPGo=
X-Gm-Gg: AfdE7cmlo6akdaOKO1P+Tgm0ANOhZfmFfzHi5yhYzMnYlIuRZGEQr1SrIR/shiLcOMW
	KjwRPQBQtQ4q54g+BTEHqAm+4Drx0cT1S+J0fed7bDnXHG9FrT48d88j0prAHdh7x+8syagJwlW
	7cOQqSoDjl+wFE2jbXg2lKrpQNxaIlhFoq5fU9ZXazkbWmpFN3fCarKRx/uz98W7N97Gyi4jdPv
	PH2fcyVI5FoIhIMCHU1j0jfYvHyFzi0DZxMF0oeTgl+wrsVCuhs5Zu9DTqbM+WdGd81gGYcYFXf
	Cu6TgUX9etKWOiobYMfX3aWX27b7gLTI3e97fsaiVaKkfKBaJ9cJ3glh26gNstZ0LTBEZEJB2ME
	vZMT0M2oinxjR
X-Received: by 2002:a05:7300:6144:b0:30b:c021:5045 with SMTP id
 5a478bee46e88-30c84ce60f7mr4014070eec.5.1782557982397; Sat, 27 Jun 2026
 03:59:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260626183630.2585057-1-dakr@kernel.org> <20260626183630.2585057-2-dakr@kernel.org>
In-Reply-To: <20260626183630.2585057-2-dakr@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 27 Jun 2026 12:59:30 +0200
X-Gm-Features: AVVi8Ce3MkIh0ONlyKuy1KTbQ-yG1BEWeg6mkrKBipEfxJFXZQzFaNA4SZvKL0c
Message-ID: <CANiq72mT0sAUX0Ob0RHzqS3QOzRxkc9=UoOuPTTyH=nAa8D40w@mail.gmail.com>
Subject: Re: [PATCH v4 1/7] rust: types: rename ForLt to CovariantForLt
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, acourbot@nvidia.com, ecourtney@nvidia.com, 
	m.wilczynski@samsung.com, david.m.ertman@intel.com, ira.weiny@intel.com, 
	leon@kernel.org, daniel.almeida@collabora.com, bhelgaas@google.com, 
	kwilczynski@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 8:36=E2=80=AFPM Danilo Krummrich <dakr@kernel.org> =
wrote:
>
> Rename ForLt to CovariantForLt to prepare for the introduction of a new
> ForLt base trait that does not require covariance.
>
> The existing ForLt trait requires covariance, which enables the safe
> cast_ref() method. This rename preserves the same semantics under a more
> precise name, making room for a weaker ForLt trait in a subsequent
> commit.
>
> No functional change.
>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

I don't see anyone else in linux-next using it, so this is likely fine
-- if we expect others this cycle, they may need a merge.

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Cheers,
Miguel
