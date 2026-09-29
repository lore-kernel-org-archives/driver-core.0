Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8626C530E04;
	Tue, 29 Sep 2026 18:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790707243; cv=none; b=iNLAJNw6/JWNLSkYiTmwFWmi2smV4fByeesFpNRmJH6Iy0lnmNoTmW4vR5Rw/Kdg09I1wezw/xagwlPkuRF//s5p6NqI8Acqc6SA1O/JV7AK3wQFSgvdIMaNLgsIHU6H0s8R/r40WJWsgbpW6nVVKoc4j+DBNjApHkPm2b0sQgc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790707243; c=relaxed/simple;
	bh=yDA+pcL7IQYIQQjtqHB088yezWAUg1S+dUpzwe1IcXE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=uqOfRmXPoQUAe6CsyAhJVgwLkw9v+0kq01Gmy8WBljpZSpA0O4HAp61bukHgm9K6Ks4s30mwO0FfRdN+6EaR1OQJgCkvKspnGpTQZV6xTE8uPBxrhgd9ROQm8QQBhrPAdEWcCruXuOG7jBotK2Lo+LY9pHKuLPO8Ypor7M2Y9vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=atsFqP6x; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="atsFqP6x"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2AA7B1F000FF;
	Tue, 29 Sep 2026 18:40:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790707232;
	bh=yDA+pcL7IQYIQQjtqHB088yezWAUg1S+dUpzwe1IcXE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=atsFqP6xdrngdjq/FqsLK5lxp5gYUSMSDrKWFJXXMcabyxDn+FSFmeK/E4zfjwlAJ
	 zOjhQ+UigNp5RblAtNIJs+Z/dwwEdt1A4Ky40K45Y8sP+MdyeTH0hsRwPrXm0co5MT
	 4/f5Gj/L9e3IVLtxh9YVYJDZs4/UHw9HL1Y+MCeeD4yaXDTPHHNWNEqLcygzwtEoLD
	 VjfoyWEbfDQliIH3ulLZuRVJtSFJpJQ4df2gGQRhGSSC4UstvZ28htfaPod2zYULg0
	 iASas7W75GDszMGgNadKO6AcYVRGy4bTpQqPCVjCJVhs/QMkQAtqCnxAAPuZXmBxQ8
	 xFOxALfiFcuTA==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 29 Sep 2026 20:40:25 +0200
Message-Id: <DLS0QEPJKOPZ.1MX607W2OQ0RI@kernel.org>
Subject: Re: [PATCH v3 09/11] rust: device: expose dma_coherent()
Cc: <sunke@kylinos.cn>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, "Alexandre Courbot" <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, "Lorenzo Stoakes"
 <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, "Lyude Paul"
 <lyude@redhat.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, "Sami Tolvanen"
 <samitolvanen@google.com>, <rust-for-linux@vger.kernel.org>,
 <linux-mm@kvack.org>, <dri-devel@lists.freedesktop.org>,
 <driver-core@lists.linux.dev>, "Alvin Sun" <alvin.sun@linux.dev>
To: "Ke Sun via B4 Relay" <devnull+sunke.kylinos.cn@kernel.org>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260929-tyr-ioctls-v3-0-26955fb111d5@kylinos.cn>
 <20260929-tyr-ioctls-v3-9-26955fb111d5@kylinos.cn>
In-Reply-To: <20260929-tyr-ioctls-v3-9-26955fb111d5@kylinos.cn>

On Tue Sep 29, 2026 at 4:15 AM CEST, Ke Sun via B4 Relay wrote:
> Add a thin accessor on Device<Bound> that wraps device_get_dma_attr()
> and returns true only for DEV_DMA_COHERENT. The other attribute values
> (unset, non-coherent) are treated as non-coherent.

Why not return a transparent wrapper around enum dev_dma_attr so we have al=
l
cases covered?
