Received: from mail-dl1-f50.google.com (mail-dl1-f50.google.com [74.125.82.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862283A9D8B
	for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774606279; cv=pass; b=lepD57n6Yo43zBREeAZMQnCDzaSBmUsu1j+fUesaP1Ggj4L7WUI7hNkidE5lG1J+O0itu01pUFSlqVC/nq28DpVYV/EjoPX5I9IPw6dVCUa0h4sz/kIqOe+xTXaCEKFpIB2IEaORWdSikjaLRGCM4uCo46n+NjymeJd4IhNUZPw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774606279; c=relaxed/simple;
	bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=vEWDYKApqANb0Vp58a+xZ6ss9ZwhwPa+T0WMmVBggSAA2vaRnCNyJsNCOBUUPShfnOkxmXqgQXgZaW0tw/VCQXWMtd/yTOAIEZVDiVIdyG4ZrjtmtVVPBox0HENVzPGTSEFazJkg9kdSUXWEf3HGR3RJtad6wElLwFh6rN2R1Fc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VkDai6dM; arc=pass smtp.client-ip=74.125.82.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VkDai6dM"
Received: by mail-dl1-f50.google.com with SMTP id a92af1059eb24-12a6b260693so249966c88.2
        for <driver-core@lists.linux.dev>; Fri, 27 Mar 2026 03:11:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774606277; cv=none;
        d=google.com; s=arc-20240605;
        b=LopuyTqXNFvfB1DC4Ag1ixJfydknmcF6n/iIcqmtbsYWvAj3ixp4oQI4/lUq3jZYbq
         XwFhniGTTSW4KrdtUoVJa2RuvYYsVOIXLRK7y0UBQ/LDi2GKlyLCNlQqqnS4DLjB6mOH
         3dW3QK4e3auC3zFBuJ54zPFOkNz7ySRqZTmxGSB1Wjrh9tBOLB8OluwCY4+yZoB4WKyS
         z9DCNhuyMJVbGoT16BN6876loSUuW1D1styMAfXED2PrVP9v17fniHnYPnOrrZUwfNAS
         srju4z/TF3qp5f26r7H6uuH4os9a6Nn6/0hww1Yn2PGyV51LMggarmd8s9XTGm0keXD1
         nTjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
        fh=rC/utLeOr4f8padOShpKkVbr84GmpKU6ItPUSXeYIHc=;
        b=CWC7yI/IfG4nfL8A5MeTZBuf2fy6MB5wQ4eVf4k8qVDH0OsQSxTaRYoVGswqXQuD0U
         /5dN/IybOgDnPOsxdLdxtbGCugYG7t5QMz3VmLyzF6gywCKo+W/MORDqkthBNCfKu4Oh
         cG/0KvZho0WZVDzR+o1RlqDAk7/OQ2SaTvZAPEJn4nCiHSVOVG90VkR/Aukkg+jasHtT
         u1QhU2FK1yfzoyg2Asqkv8k5bRVJGUnz9BI4gAm+pcT10EwG014pYdyCyv6xE96KsFKX
         ca5+xePBibenmJT8HtEqpyintBWHD9cZT55Jc3GJyj5S9TRQfKCLfR9HK8Etwzw4WjY/
         +Wng==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774606277; x=1775211077; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
        b=VkDai6dMPgrBAD7SCU+/yb5OZM4nXJGAIxzl4OXBVGCTSfij8rVJ1nZL1zC1PrBwAa
         9tNHgnMnriYymQKuzaJAvQY8Tu9B+6pXN82K1E3f5MpOEHUcawhxbxoQSFSio1i8ZDH7
         WcobWz6istBPatP9KFqNBbCOayoCpfQpQlZvwxNK2G5fs7wjjICsmyXV6XEskm323aB9
         koW/COKpxKOMafySQBsm71fbA8NLHfFB93bAcJXjVqI5uR2vfIVk+3NKPFpFCFZpuiAl
         YvUSl6pRFXjZ9wqIaWUjnF+J86V+hGkNBkP97LBn/IEvwqGN6UpGJBbFnmQsr9xNvqDD
         jv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774606277; x=1775211077;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=+uFnV8BoYScCWs0H3DAkHtcerzqW4bAA76yB8kYBKYM=;
        b=gOxxf+V6R4vX8hPe7HliFTpKdkqv3BXSONeGBA+ZUUC5M40MMXWNtRlDwqbcOqpiif
         4F99CIqgbRd/lpYnzY1SmErhZoFZrC2IeoNmhyq05O812Yxkp6vy0XI/VmJpljKTopKD
         TQgHwJ2TE72IOEWtnQBeuPacSMg7RScId67CKi2tc2qHePycFcmW9bu74iWc2ZmGge/N
         vn5Psj+//7XIZOt0S/En8Zrlda7Ojxjtk+i/0Sp1PkmnbFyjISeWeIMKREgwvsrXNTrL
         Pa9e3QaB/U2BCx/mU1BZqVrKWQXbgszkdM2DcnKvkFCsJ4Ee84Pz78gLe/jmLDM4+SYD
         JRew==
X-Forwarded-Encrypted: i=1; AJvYcCVmiE5BvMRtCwqvlsAqiOc5gVq9WPg2WwhI6AhS27zvm5r3hULPf8F32ppTeaoOjfQB6q1vm2A2PhZ/Eg==@lists.linux.dev
X-Gm-Message-State: AOJu0YzrTW8AliV07SKfJcTQhRaq0DeZq2+9EvsfpQqnnnGZijTk3Jyf
	SfyVMytQDf5MTRxcjPLRaizuO7AAO6zHwJlxRnLhwmX+KkYJR3aJyC4pMhPnoDlb0+gg56XHhVR
	B840z3PmT5+QBCxTBe0n+lpJ2iJWrzjA=
X-Gm-Gg: ATEYQzzQt1G28SMgd2JWgtf3lRMYy6M6MYBXs7dxgbWe2LOKmuXrTHpgID5GILkdlVP
	P3iNFGflrEmI8ZVz2Za3THOEth31SjGVDvhPsqi34WiMSHRf9H1ijAUpJlz41YETidM6gmIaNRG
	wNTS3uipOwpghBv8EeXJM4OdDfvW0lKIHdiNMIYmk9l88epS4LO2lMvkE88Nr64h3DI9MjbDLJW
	YarS/KVY55VB8GKmWHyTdZWJXu7CgdyK6adbxAmZJU986iJtB2tX78gmBo0LtxZAzztGULKlPym
	JdKMdtByIEjmUcU2c3Cd91iR9d+jlqmggUK+gSKiCtesBDZLp4Ft7xTX2C83i/KIHvT5OTrs0HC
	aS4BN60VXxJsK3U30VoBrsuA=
X-Received: by 2002:a05:693c:2c07:b0:2c1:778:d888 with SMTP id
 5a478bee46e88-2c185e6c137mr515564eec.4.1774606277404; Fri, 27 Mar 2026
 03:11:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260323153807.1360705-1-gary@kernel.org> <U_v6wkMtfgu8yfV2Nh5Im8t1w4KZ7mdbG3VQciT2g3DULhsKBXJgIz2psuj76-V94TPNtUry3J727gLTbUByug==@protonmail.internalid>
 <20260323153807.1360705-4-gary@kernel.org> <87ldfey8nh.fsf@t14s.mail-host-address-is-not-set>
 <DHCSEZH8M3JU.3LB4M2ERBJSYX@garyguo.net>
In-Reply-To: <DHCSEZH8M3JU.3LB4M2ERBJSYX@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 11:11:04 +0100
X-Gm-Features: AQROBzAc4vO9OJHfJtMaQN5CiuyoS_KQK7JMXrfbHVTl0wLJ7I2VVbDBNfr8YhI
Message-ID: <CANiq72nmM_L2qSZtrvPN1bt9OzMiKu7NUZQXM=TknhbCOU=wuA@mail.gmail.com>
Subject: Re: [PATCH 3/8] rust: io: use pointer types instead of address
To: Gary Guo <gary@garyguo.net>, Tamir Duberstein <tamird@kernel.org>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Gary Guo <gary@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Mar 26, 2026 at 3:35=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> This is a `*mut T` -> `*const c_void` cast which needs
> `cast_const().cast::<c_void>` which I think is less readable than just `a=
s`.
>
> It's also existing code that I haven't touched in this commit.

I agree it is usually best to change it independently.

In any case, regarding the suggestion, the latter form is more
restricted, which is what we wanted when we enabled the Clippy lints,
no? Cc'ing Tamir.

I agree it is definitely less readable when one is not accustomed to
the `cast` methods (e.g. which one is supposed to be used for what
etc.), i.e. `as` is just obvious. On the other hand, it also makes
more explicit that we are doing a "bigger jump", i.e. both const and
type, which is why `as` is "worse" in that it allows for more things
to happen at once.

Cheers,
Miguel
