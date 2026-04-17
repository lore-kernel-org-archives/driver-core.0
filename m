Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CE873B5851;
	Fri, 17 Apr 2026 14:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776437949; cv=none; b=DkBNn6tPCG7GgkBoLty17m5f1fEPc3z7hb1bhBk+//wP5zuyTlKJlm0JtAwWMVo5UBb1eY09awQYUg7N3Z3Ea56Pri4B8ZF/93A1+fQSuqasvtaLgOH6LknCjBi9ExUQUjimOEsZUeZpV/6/mi1BGTzyqQsAOJ0tCj9C+AeW0uY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776437949; c=relaxed/simple;
	bh=jEI6+xx49hEv/4C8YdVfp0QhsA+wg2iHesx7rFPUQns=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=AJ53HGy15Thcb7lSMoBOF8skya9sVDiah25gCnecyfU9pR6N+GJm1ZBa6oOsDmXqGEppc38ZVTxvP5QfGeVwx/1IrJXq+bINhr7WDULsM6SkMRVNiBmdI6qCx448h7nHPYmVft+7AMBmaIXaxEKzSBBRDiXrLXDUSVauwTg5r4c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gC8VDLKC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gC8VDLKC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B2AC19425;
	Fri, 17 Apr 2026 14:59:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776437948;
	bh=jEI6+xx49hEv/4C8YdVfp0QhsA+wg2iHesx7rFPUQns=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=gC8VDLKCp7mzvnwChzSMA8GaOnvXzWYl6iaWBVNIQmMlf5AtLL76enCpsg1CI8u3p
	 FZIroQwFfa8+gycJu9QWF43LGrPztV7kLzYIz2sGRvdJyI1aeDNQ6YInutx8+gp48b
	 Te92qo6iAPqjduymFd/Sad1z+w9Hn9FNAWrvNHVPhicGhbFUNAJO+EQIkuSatFUwKY
	 pME3UgqkOo3ucmL8YZ2IMS3QHk9LiyBAk5nquVjEOVKAiavfqadwugFZhLgftwwGsl
	 G5Om7nlz5vddi5tqpSA/FW/E5hXdw0gJ/DiEkMT16IWsQEbSGGB3YnhMHzenD870a5
	 CTdx4VbmHKQKA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 17 Apr 2026 16:59:02 +0200
Message-Id: <DHVIP0L7RFCP.38KEXAROGM3Q9@kernel.org>
Subject: Re: [PATCH v2 0/3] rust: add `bitfield!` macro
Cc: "Mark Brown" <broonie@kernel.org>, "John Hubbard" <jhubbard@nvidia.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Yury Norov" <yury.norov@gmail.com>, "Miguel
 Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "David Airlie" <airlied@gmail.com>, "Simona
 Vetter" <simona@ffwll.ch>, "Alistair Popple" <apopple@nvidia.com>, "Timur
 Tabi" <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260409-bitfield-v2-0-23ac400071cb@nvidia.com>
 <798e83e6-eb7b-4502-85e7-5a0f6d9c6281@nvidia.com>
 <DHUXFAD38G5Y.6X6QNTANYNGH@kernel.org>
 <CANiq72k0FXcekxs=E+xLe3=wyu+KHr4yM0wLj1VgtgTUb_K4MQ@mail.gmail.com>
 <DHVEWDBHYKQF.XBXZ704CMXCF@kernel.org>
 <CANiq72mNP4J_czVo25d1yRdWxBNFKaT9OPOC7k5EDzZ9YmdEww@mail.gmail.com>
In-Reply-To: <CANiq72mNP4J_czVo25d1yRdWxBNFKaT9OPOC7k5EDzZ9YmdEww@mail.gmail.com>

On Fri Apr 17, 2026 at 2:21 PM CEST, Miguel Ojeda wrote:
> On Fri, Apr 17, 2026 at 2:00=E2=80=AFPM Danilo Krummrich <dakr@kernel.org=
> wrote:
>>
>> This all builds on the assumption that we don't have a process in place =
that
>> covers this.
>
> It builds on what happens today. From what I saw, Mark merges
> `drm-rust-next`, which is why I mentioned it, i.e. to help prevent
> something unexpected around `linux-next`.

We're not running the new process yet, so the current state isn't relevant.=
 The
for-linux-next handling will be in place before anything changes for Mark.
