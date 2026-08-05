Received: from mail-yx1-f46.google.com (mail-yx1-f46.google.com [74.125.224.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4F5C3DFC8F
	for <driver-core@lists.linux.dev>; Wed,  5 Aug 2026 07:02:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785913365; cv=pass; b=JO9QQYtxmty2f9TK36YEKaWzuD+x8d62lVR4Z7MIVZrB2cGDNjWKS597QJZCzbXVGUPY2e6SE6NIoulfAdzh4IHQMmRutVs9LqhNkY4TS/TFIlIOsErtTOo4aMH5I0Zesqb/9IvLFkDIUEmQkwNNjqzR+CulMcnHQJ5ZbWvVh04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785913365; c=relaxed/simple;
	bh=X9DLVvJ8kZ3o/aKGNrmT4crMmKXXqJyZuyKxDrdOtyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SFlZcBBrLnqLx0ZZQR6fLE1GnHgKFFYTeEvUcXieQgJugxx3zmZ6H6yQJO6HTqXhIERnqGMTMqsB6bI6NP9Dr6AoY5s+sRNp6KGWa9ivXOrNWksJ4Tf8mCai9PN0lIQ10S29760z9ZsB5JAG/ndY7fywl6sWorXyC+qgVoWUosM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIhWKI2d; arc=pass smtp.client-ip=74.125.224.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIhWKI2d"
Received: by mail-yx1-f46.google.com with SMTP id 956f58d0204a3-667b0ced2d3so1028994d50.2
        for <driver-core@lists.linux.dev>; Wed, 05 Aug 2026 00:02:43 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785913363; cv=none;
        d=google.com; s=arc-20260327;
        b=Bov2UsNat/dZHEFnNOH8Ln+eO7H0yoWoXHThC009OxZXn9bupGLwPTmtkn7cWowcz+
         rIYEA03NAbHnYGktJ5ODttX1manwcFMA7GIvZ6eXYdxEA4jv7cUeLKSzeJjwkGhfsyjZ
         y/PbzDLMU04L+ajBLQHNmR7rYLODdRK700szMwPZekElQPi5EqBaD4j+TYkBAlS1F5U5
         zNLqI1m78YjSaNlRtVyQYbrd6eFZV39eSqK4LR5uppwBY9WnRKHemKOkE43IGh0qbTmq
         kwuuNkX//4edbLYrNZnY2+WRGuIlNlqapThnhDm71npup+gu0EqMrSiiV8ej6y+7vF+k
         3J6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        fh=Lnsahs0fHXQvjXw0b8uaB9y76DeHyumYQ/2yUWGXYbc=;
        b=Cfw540U62lWRlPhKQfyTOBvy8JAeE3wU8hY5Ad2pb2dmB+3ctTaMhHlljnGEI6oGIb
         wOj3uRiHZ7vM+SWfiQuVsDYypvGd72piEBr/k6pAh4xz07I76WxC4zkauaJLnXkRrWuL
         GycPOKocmk6ujG0APfkaJ/VzBMqyNutXk/0FuFdpzARCdoIEbWEGrD/7aS17nZLkQPpn
         SNAyLaS9pbnGn4emz8UXNsiTHL3jTGLXyfcP7xub2F5H2IcqtFxh2vMKEr6TMN0Cnwkx
         0rPwQPWL7f+XzIEfjeovca4xtELmsIXGnkKnQn0CSvIauTDnE1xH0FwfUbOpq/Qn1T1Z
         zaLw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785913363; x=1786518163; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        b=hIhWKI2dqw/WMACw8aHPKgfR+Dybli98uYxG8Oush5MXHRTUxGSnUXNMIZKp6GJb3V
         +mpOTrGmiI5H6hBa1/nROn2PumyJp8/5kaVPoh9FjEVjbfcXLZ9CkBQvTbb2NiFeZHIA
         iOaPfotBmR4mUwVUo8uZZEIe2+LnXJg0JkXx5I0Rwb0frNgyRZzGQckXXkd7x+TrMntL
         1YBcvetWgpSoQjEybwKs3g1qwcIbdVPm9MqWZKu3rHwUZ2BEJcpVGvV3Ra+2UujgdaW+
         sj6C4f/SLaq5sqOzrFZ+i0bRc4omHclferj8fAEWfe0QPUrBmpRoVp4KdBliwsw8bk+y
         X5Yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785913363; x=1786518163;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Y60TCRk5n5yLOLon2qFjPKh9SFL9tvHl6trgyo4bm3Q=;
        b=c08uy8FOGpU1GlmWveiuN4BDrX4nZ37iPA/GbrVF739iN96RYnSBn3UTS27gkonPT+
         +wL+LDzAO7rwPaVEQj1lgN7iPPCQLQCgIU6OBGbCd6MDwXLgqgX1FEPXQZDannRCrNm7
         sGtpWEmqLZuQwLeUOtm/T9i55RkVn+CEYpU2j0BJ8fO7DgMBOAeyOLZvPrEq9LPSkATE
         YmNrBnbg25cJemXb12OD9ximFVDp4Uc7knh1KwcBELTNscj9VlWzW+pqcaQXQob4CM/R
         Ln7sMV1vk+UGdNZ5vSCcUNJKih129T7MNq/qZ2znhLDcQygvdevBVNzHSqwYThagnKR4
         Jcjg==
X-Forwarded-Encrypted: i=1; AHgh+Rp96yBFglKaQBD298ikair1/f97ll4fyCJMCRFfo1Apow5/B/70wQY0wzzdLUPseDiF5nSVLhgS7Fbn1w==@lists.linux.dev
X-Gm-Message-State: AOJu0YwmVj7t01KmfYDVL3e79ferjQcs7H+zZpOErY+hDkB67Yvhw1mi
	hduyMgACCtCsUOroFWowdaQ3mFmBWxVUKDzYDI+IpzvW6lLtJM2BbzBdE8539XL7pbZ3cS8oAiA
	SGHcY4hcABLL/hDDvTEkCQHqWjJDs/6E=
X-Gm-Gg: AR+sD13pxZWGrHO7IFTykV1vGUpL3pDEZ+FyHpfPBkC5r8VBTeg9psX6PxgKwtmeaPJ
	8O+jk90xntra+7iF54rXutEjlP2se0fZynskwuYZDvzb+yY/gq1/A2ynkBJIhuPUn0X+bqrFaQj
	h+DVl+dXuEPDSUwO/DCjseisWi36RSLu6xJ/t0EiP+AAk3qJfi0laN6nn/UkgVtl7zlJcE+2Ntw
	gc+HZh+A7IysCMKEnzwUTphgSYnnd1Pp7nyM3aTkdsB4Ma+svtQwS6RKUxzp7ZESchBjcdfaPKq
	CU0gny9Euq7ZXVhqDTfmvwuSlB1dZcE8GcSy4m8o47aY
X-Received: by 2002:a05:690e:11ca:b0:664:dbfc:e454 with SMTP id
 956f58d0204a3-6699a892fe6mr2574216d50.3.1785913362887; Wed, 05 Aug 2026
 00:02:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com> <20260805-falcon-dma-projections-v2-1-4cc9f3f13ee9@nvidia.com>
In-Reply-To: <20260805-falcon-dma-projections-v2-1-4cc9f3f13ee9@nvidia.com>
From: Ethan Plant <plant.ethan@gmail.com>
Date: Wed, 5 Aug 2026 00:02:31 -0700
X-Gm-Features: AUfX_mwzehL-ePDmTswSjyc9hlF-NtAAFmKSmV6DsLAB8oAWcLbYIszSPAFss0U
Message-ID: <CA+ZM=sFFWx-yCWaWsUk0usONc7BMh3xckFxZj5tQx70SXtao+g@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] gpu: nova-core: falcon: remove unnecessary check
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 4, 2026 at 10:03=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> The `try_with_base` call performed on `NV_PFALCON_FALCON_DMATRFBASE1`
> already returns `EOVERFLOW` if the address is too large for the
> register, making this check redundant.
>
> -        // The DMATRFBASE/1 register pair only supports a 49-bit address=
.
> -        if dma_start > DmaMask::new::<49>().value() {
> -            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dm=
a_start);
> -            return Err(ERANGE);
> -        }

This also changes the error returned for an address that does not fit
from `ERANGE` to `EOVERFLOW`, and drops the `dev_err!` diagnostic.

Is that change intentional? If so, would it be worth
mentioning that in the commit message?

Thanks,
Ethan
