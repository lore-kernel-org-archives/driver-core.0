Received: from mail-lj1-f169.google.com (mail-lj1-f169.google.com [209.85.208.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93CEF3F12C6
	for <driver-core@lists.linux.dev>; Wed,  8 Jul 2026 15:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783524332; cv=pass; b=QPaTM5udCMH47yamPrsy1xCon31mVb1zSzC8eNMRNYpmW/398xLqVlr1fHv4g38zhqh8htGO3gxdlqcMHWaCSEe3gzeFsjomybMbq7xTXfnQ9XzZJHaAqmAaxw0qK6UbRkb+ueWE6VfgOVBDcW5a0kiIk+EMPNVwcYKJFFTcIXs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783524332; c=relaxed/simple;
	bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iwzwXFL+ETchwqYujIlrCXykRxNmb/sJ6pvnqFJ8PAlqi/yMjL2BUaF0hNBQP2i7Z6JcED4kMyw4cKZ3BikxXaG1cRgGZse8SwyMbMR77Sx0upAgHD0wGsFmVkWe2SNVkERgYDsIUJpBbQwA1/kMfp/8DeQ2HotvR+3Erl9Dx0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YLTAFuzd; arc=pass smtp.client-ip=209.85.208.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YLTAFuzd"
Received: by mail-lj1-f169.google.com with SMTP id 38308e7fff4ca-39c7648bf24so1344441fa.3
        for <driver-core@lists.linux.dev>; Wed, 08 Jul 2026 08:25:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783524329; cv=none;
        d=google.com; s=arc-20260327;
        b=gxpEfC/Vub8hWQGA56Fvp9/cgiogDH3UTAOqzHZUSd+jl6QOUYu4S+svhqjIEK94Gh
         U+h1itRFfBIWa1Ml4Bhrl422H0fjR8WU/sAoUkqpxc+ycpRG7b5w7QgDAsMppm+MBJkt
         R0QSvbBNFTSBXny7uy5qAsSv6q4YYVNoijs45qv8dBAdZERrtF2yBwkBK+z/iX/7WcSj
         +fcEkO6nD9C1WTKo2Qpy907qynssRz3OYIlTKdB0bvVpMGzF4ISzCOVVm0D4n5Rei5Dm
         4Kn5P0e24qskDpbnlB4Ehn4qP4uWcJ3lOQRs0wEv0X/8C84cW4RnyNY1lEIMBLForUOU
         i0ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        fh=KqDJf5U2CyxkawDz/nIejr+/P6cP+3mDqQGoH/p2l04=;
        b=FgNSpYZo8I7uQjruatdvx3jlXXctUx/lZDmtrF690OBUWDb9QATH65KJ5TgsUxytSG
         3PC/7ueEGeIKi4+MTAXrpLfUS2wGLCSNjd+bYCWCpEyxH7XoCWYB6zG4s3TjyihO4w13
         JLXtbOeBbX6Z0EH4443I8JAGOJ7o1oLer136/flvzpB78Ofuho8CMgbKgAh/3Wqr5sKR
         2AcRRuWw+swMIiJHusSPW9tK7apcGZbvgcrVa8K6RyTC4XiE9HSrbejIGiu9hqBii91M
         yN2aTSNs5IOqA4QTeHQPJP/T8ZSixQ6BB3AZp3fVFPhRLnViEqYHF5Msq0OeFmCBzrqG
         0r6g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783524329; x=1784129129; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        b=YLTAFuzdEqBzBPuVAaLB6lP34iImFbn3iM0K5ywXRWut2vASFdaP0BQb0IZIQSKUpJ
         LNa9SI4oCTH2y3BuhiOZU6r2xWtt5B9+DZd7QluC/wzta6EYi25uaWXNWrS8xNCP2DbZ
         hYTAIZumxx5QBqHdkI7UDB8zsqvrx4xClBlOgp6PZXf4DDjZhH018zHnMVHjc3gdphKz
         FFlLAPTa4qqAMxH0SQBZ/HuN74FcLIsTB12rbr2PNshs99dZ7LGoQl00gwEBtX2tfAHH
         2zi5ROvReGDaBCpe8bNaLxDodZKP9kXHo+SsjzjC6oHGDtcD6XkNHOETFsjIL39ZBr1K
         +zKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783524329; x=1784129129;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vOZfMiEQfO6pItb9Vox/F3+dXN8hmkgAn9QnqBq/R7Q=;
        b=eHn/rkMom2fjepXFgj9DD7B+VRV7vkk3xy6iNZ4RVes85MJ4uK3fhG1MqgyKC7LVJ8
         H5niWbt5J2YMwdPp44JLPgxre2M4L+svMyZnicRSurZU8oylRLiPVoIDiOosKMo+RtO4
         gHZJoPoqR4ejeA5nprLdpDNvOQJ3ynJWO6DicjXwiGp7N/kZLAGqdsFO19HWrwVHHCXK
         OV8N8dAj8lMRP8vRrgR1MATiBw7p38nhx+zuqB1tqUTTPuqeUKKrIrIhW4+SRpz9xqnH
         M0jRFlHdHQfc3JJsonTI5H00P2z6gacO5VP7VlPi2mZcMfPufzg6eN5tl7AoJFxZq68L
         B+Jg==
X-Forwarded-Encrypted: i=1; AHgh+RrBOVNl1mcVvOPHfHFJX/h2pZk0vB1rN9+G7ylLWQaqimf9AHt6nmfiad95uLK+78vxyYnXtlHRE0lB2Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwbFoFsTQCzip/ydkRrtykPoa9AhS/WnzTE6J+6nPeDhDbDayul
	Y/kgBmy84VWJhyAgTp3dG0gNsM14IcVJIlWFe3fCxLWwPsW/b6gsJW0xmeXzzCCgJ2dz1Ao2WHq
	14ZgVmIfUNwjVQY60M/XAimjzsuDvTHM=
X-Gm-Gg: AfdE7ck35X2LRVzJE/tNrr5x6bYwBcHslf2rC7JQL8M7VzHL96YJRmDf5haBzGVMatm
	B/66Twp056PIj0n2ypKxRDlHKG/Q/5As1JrXUPS+l0igpfSZTAggNhwVrIWgvvPbFOaEhq9XmKc
	p4bkR2kQJirunv178CoaVYKDNsJgowFDZaDc2CIBKXTbLpxMkKIPbi3Yh6er1oPbI4HaQVOlSvz
	t1OazRDrlsKJ07zxSaS6gbSpmDgdCUbkepWNrTjolRlxaejq5VEx/1fFyfxVJKSYDXZ9wo5LQIu
	s60HgvdAxIciRsXTYNlZv5VHYs0URxYnPmoTh82NyPSJcfvhnSGUQ0fhCsrgD5G2LnbXuV9VCiM
	AyqL0lbl4wabp
X-Received: by 2002:a05:6512:3987:b0:5ae:b9b3:9f96 with SMTP id
 2adb3069b0e04-5b0115c01f7mr445459e87.6.1783524328462; Wed, 08 Jul 2026
 08:25:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260706-io_projection-v6-0-72cd5d055d54@garyguo.net>
 <20260706-io_projection-v6-9-72cd5d055d54@garyguo.net> <280FBE45-5653-499B-9BB0-A2C77030A826@collabora.com>
In-Reply-To: <280FBE45-5653-499B-9BB0-A2C77030A826@collabora.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 8 Jul 2026 17:25:11 +0200
X-Gm-Features: AUfX_my_GxC4KLJmz5i_4DX9QExeJawd6XQyKpw76D3pBDNdQQvLPjQ9qPUqEYs
Message-ID: <CANiq72nyEK7cMphaawV73bN7VmAKG-UOE4SPDWDpAqoLs8zzKQ@mail.gmail.com>
Subject: Re: [PATCH v6 09/20] rust: io: use view types instead of addresses
 for `Io`
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pci@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 8, 2026 at 4:37=E2=80=AFPM Daniel Almeida
<daniel.almeida@collabora.com> wrote:
>
> You mean to avoid that cryptic =E2=80=9Crust_build_error=E2=80=9D when th=
e assertion fails?

My reading is that it avoids the assertion failure itself -- if the
compiler decided not to inline, then it would fail to build when it
should have succeeded.

i.e. it is not about improving the error message, but about avoiding
the error to begin with (not sure which one you meant of the two,
though).

Cheers,
Miguel
