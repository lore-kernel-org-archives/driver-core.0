Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A0CC3451CE
	for <driver-core@lists.linux.dev>; Fri, 30 Jan 2026 10:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769768819; cv=pass; b=OzO+JZQj7ZbLBuZzcoksqlmLYcG5oeN7JKsP/QTyU2zdFufoLtHO2RYkIzQcvN/T60yPBGIVx4SeGZH/8hs8hJkqeDS+W6i7y8ob5rxsqosMI/ISRcyb0uk0iGoauEhRYLR9z235fDjwTrZyypFPHJRebVx7alVhGa0bAb4PN5g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769768819; c=relaxed/simple;
	bh=keKwmUlZ7OSonG/lmZBAIMewZ5+4Yjw3f7MIUH9AdaE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ctT49edLCDE0s5njf5Qr5TpUTpsUuMOjwW77N15S9QHv/iqAdCGt1OdFSMuaVDS7xQn1AZpu0GY9KCsJaxy7z9VTrM7BJI+2q9n8xzgx6CS/+5suBFKIa9Eim4W3Q2v1erKqRLt2K9vayvEmzNb5+Qpm+DRnPaO2Bdy3DVkda28=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=eSuGPjow; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="eSuGPjow"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-4359228b7c6so1430241f8f.2
        for <driver-core@lists.linux.dev>; Fri, 30 Jan 2026 02:26:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769768816; cv=none;
        d=google.com; s=arc-20240605;
        b=NPGTy8h9VwxeFnudR++8EEcr005R2SlwjN0CA2Chf40qAuNQWC1FR+N9p2zL6g3+L0
         764wZYVnmRg0WGNpal7LXMW7QMF7OHoep9JDRzXSGyG5G7gWNZb2MAgzCXvbVqMz7Q0q
         TYDNJe8IzIjXsCiBM6TRBQXR2TtrUpzAyW1XChYtu2Nuh+hg/ipsqVp/YnY+3v7LZ8KN
         iv4j7WWN9tl1nuOWdOJ/yZTMoP5c+o9K04Zk5h1tc1yOBf4CokVj4WLR830p8llIK1kn
         5lZQNm5hzOw4VYuv8ZQ1Rhk3lxaaDgCVxs9dUr8uazr9o4oltaTT/C1QPSy/L41iWKLu
         ZGQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        fh=CcxFmYCE6E/EzqM5yHcpXu1ptYHWp8Azn1cyFs9LbAA=;
        b=KrJ00avBVQxw2GqR326o0LlIrgdqZlyCKBu6RPaKD050E1cgFEA0WBpt8+HvnhE9sq
         l5QsgI4War+65RVDAygv83DRZLXopBOb3L5vKEX6vhl8GHr8Z+BAhrTQKHuU4gNGNbMT
         xwCjb+A1rKIyxhU7W/kOz00HCOXkJTIkeL32b4awkh6eP1U1SJxQjuCPz3l5VxXDaY7e
         z2bsHip3AhuFclE5p9RoZizmOt2Iy5gySy+oj/D/fKZcDU3H5ZY7lTJijizL7DXF/egg
         D/W3Tzw5eenWCU9gtvMdxg8ERp5wBNX9BzaYcSqQhb/dDdbi6Jm1ktAQRI5jafg4xjlZ
         209A==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769768816; x=1770373616; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        b=eSuGPjowuyAn+8CF4trGJfJgrxXFiAzwrepyc309jqkhffr1qncmL+rMxJbRawHbRy
         OjLGQxJFGPZAq4iql4jdo+2iv5vFRQsY3oJgpaVqB/GpABr7aoRjaqSth3U6rY2KPyNj
         lVwCPqB5A2USsmqkIDX82R9pdC5AmbCmxdYBuwR/u+1r/QKw3x98Ype8DAPH7fK7wjGy
         +Nfj/EYUDbVsAgeFjxhE97sFWQyWQpbXZ3QytckgRp5kCs23nrFlsgmZ4/IFL11hUG6U
         4yA2cfln6mFNK0yq70laJHzxa3mlO9p2NU1JcSg94Q5ND1DiG3twnx+Ctn7tz1BpQhbA
         knBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769768816; x=1770373616;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=qKGf5ayE/1fi3WtglGaStB/NskmIOWGBfGvj57gDQYY=;
        b=nCGnOyalybJJXUe2dAk0UxkQBvB4CwxZAVbg9oocgt/FNeTi9EKgAfjS/GOvWgUHP3
         C4C6xvsaKVTNjDXoz+C/JOjJN6lhIUPar6pVG0Xnxi255cKoF+Np0U+1DgL1mdJSXKcY
         0aaZxsVUUBFomXqgN0CpwJLjSva/0OqBfomhDZZwfvN6p3BqtK9/noNIXSVOJYc3rGZo
         v8pTT8RMTnk9oKC9x4t6GMskGotzBUCGr40f1gbiwsUlSirvqSHAS5e2NC1XrnZRIQFA
         3p0GkW4LWcROz7YjNhWO/Af5n1rjYVdAoS5tK983mSTj5MtoEzdzlTidKeoQJkv0Z9T7
         BT+Q==
X-Forwarded-Encrypted: i=1; AJvYcCWobbAQg6bwJAdBgAa96LiAnR4TqBlSWIyTtNNBY8t9kISICwayJ2Q+S38yprBEAFN2jzdG+7KcLzJcCQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yz/w9E2UESeqYid+0dpVg7Dyz3z0QvB9XvYNA592kmnWy/Fhtwm
	E08LC/BJaQDwOQZtEGybPv3auoeNQ1Qd+J0w/7bLYQBdKm2DLr8ZTuWhfvcXvH74WnRA6mj4Z68
	/PBjNXRk3aHcOA54cBxZvRoKFMsDZCIME+UYZVBUi
X-Gm-Gg: AZuq6aL850uVXpc/9fNXLqNHA5pwxl3X8yfrFXeDS4z6N+9yJD4fGeF6U8wgxXv/Jb6
	tkWVyK6OvZ5MqHLczfS+4rxNvKE1ItekAXyUGb/NZ6d2Mer+noZ5rjNYWmbqyRofIe6CC7yDS5k
	XirW73yPujav9lb6Yr6Kv9GccQKzmEcl239dOhg3CYUbFoBBf2PXv2FJ5EqSG96ZYYLHGwrpoYC
	2/mIwB0ko7nJIStCtvl27ORg12Skr8NBxh9YXbnc6K+GIHzKtfBIM2BUj3rTDNXzRqbEdSuoYx9
	84+VlCPbUmon5VuXtnJQX1O8kA==
X-Received: by 2002:a05:6000:144a:b0:432:8504:a383 with SMTP id
 ffacd0b85a97d-435f3ab53cfmr3434365f8f.45.1769768815664; Fri, 30 Jan 2026
 02:26:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260130-coherent-array-v1-0-bcd672dacc70@nvidia.com> <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
In-Reply-To: <20260130-coherent-array-v1-6-bcd672dacc70@nvidia.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 30 Jan 2026 11:26:44 +0100
X-Gm-Features: AZwV_QjIZnbbm9xp8XOB5ABAESxw5YmRd900W4CPJMrijbzi9HEw_BSq-MEG1sk
Message-ID: <CAH5fLggBd6s5MooGPfUaoarNF651BjTyBt+KcuJc0zdx5xg7cg@mail.gmail.com>
Subject: Re: [PATCH 6/9] rust: dma: add dma_read! and dma_write! macros
To: Eliot Courtney <ecourtney@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, nouveau@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 30, 2026 at 9:35=E2=80=AFAM Eliot Courtney <ecourtney@nvidia.co=
m> wrote:
>
> Add dma_read! and dma_write! macros using the new infallible methods
> on CoherentArray.
>
> Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> ---
>  rust/kernel/dma.rs | 103 +++++++++++++++++++++++++++++++++++++++++++++++=
++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
> index e4bca7a18ac1..f3920f74583a 100644
> --- a/rust/kernel/dma.rs
> +++ b/rust/kernel/dma.rs
> @@ -811,6 +811,24 @@ pub unsafe fn as_slice_mut<const OFFSET: usize, cons=
t COUNT: usize>(&mut self) -
>              )
>          };
>      }
> +
> +    /// Returns a pointer to an element from the region with bounds chec=
king. `OFFSET` is in
> +    /// units of `T`, not the number of bytes.
> +    ///
> +    /// Public but hidden since it should only be used from [`dma_read`]=
 and [`dma_write`] macros.
> +    #[doc(hidden)]
> +    pub fn ptr_at<const OFFSET: usize>(&self) -> *mut T {
> +        build_assert!(
> +            OFFSET < N,
> +            "Index out of bounds when accessing CoherentArray"
> +        );

This build assert does not depend on runtime values, so it can be
written as a const block:
const { assert!(OFFSET < N, "Index out of bounds when accessing
CoherentArray"); }

Alice
