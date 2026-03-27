Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E4A38A73B;
	Fri, 27 Mar 2026 20:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774645120; cv=none; b=CRBFahpl/tDPBbzuS/AW/tDwTGG8Qpvet99VbjFKTlC5CmDUNLn6GVecucdb1D9lK7BW+rev3W9nOnE8qJgl6goZXN+xSQCnzLugqGeHFfUkbEeCjCZudkDMr6Kfc6q9q8Ra64tIbWhZktX0gQEzMUQTxpQ/JIJJ6d1AiNZn0mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774645120; c=relaxed/simple;
	bh=6jlUKI5SJaZ0+SeYdeQprWB7R4mJ7/L6ni+8RY3kuyU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=TkfqoL9P4UN96JqcH/dDxVGDHiugoLBEhbW6fjpI7xMi+pqbODWb0Wkw0FnWCgxVDHKTJt9aNWbYiF8lLAiYWq4LlrknSnkwVLHIxRUJ0pYWreXLCSt0cffH5WPHpE3HaN0AkOsoj3AHX79HmrF9NNTjpEs7WWNaMq7yOH49Pnw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tD/f6+1h; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tD/f6+1h"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AA31C2BC86;
	Fri, 27 Mar 2026 20:58:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774645120;
	bh=6jlUKI5SJaZ0+SeYdeQprWB7R4mJ7/L6ni+8RY3kuyU=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To:From;
	b=tD/f6+1hibZ3IBUmKE7XL9cFeHAFRcnB5DyJyH14mdqqiHaza2YHRG8pjd8jyHFTr
	 7xTcoF05LC9gsSp6YLwhwqHT0uefzvsc4697RIdXqKAsm6UlRq58PqUKUANaGL6qLF
	 ZnwVt3Ot8TU8a7i1zge4q9n8rNMyBambKldhBHU5qp8N2Xnbhjl9iXjqI4EYIrv8gw
	 Q/uB7Q6XBW4EznkgU7TYbPRU+fKLjOsDxwY7HbsHpeceBx/fBwRIXj4sHoid4rHBx7
	 Lra2U+Ee0qR63jfEdgPUaAd2sF7m+1cYYTSAyBEMFrdERgt3aj2LHL4Q9vHsXuOc4C
	 VnO0KlFvnL7vQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 27 Mar 2026 21:58:34 +0100
Message-Id: <DHDV6UZK4LB0.1P98SCT5CMJMZ@kernel.org>
Subject: Re: [PATCH 2/3] rust: dma: generalize BinaryWriter impl for
 Coherent<T>
Cc: <nouveau@lists.freedesktop.org>, <dri-devel@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <driver-core@lists.linux.dev>,
 <rust-for-linux@vger.kernel.org>, "Danilo Krummrich" <dakr@kernel.org>
To: <acourbot@nvidia.com>, <aliceryhl@google.com>,
 <abdiel.janulgue@gmail.com>, <daniel.almeida@collabora.com>,
 <robin.murphy@arm.com>, <a.hindborg@kernel.org>, <ojeda@kernel.org>,
 <boqun@kernel.org>, <gary@garyguo.net>, <bjorn3_gh@protonmail.com>,
 <lossin@kernel.org>, <tmgross@umich.edu>, <ttabi@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260325003921.3420-1-dakr@kernel.org>
 <20260325003921.3420-2-dakr@kernel.org>
In-Reply-To: <20260325003921.3420-2-dakr@kernel.org>

On Wed Mar 25, 2026 at 1:39 AM CET, Danilo Krummrich wrote:
> Generalize the BinaryWriter implementation from Coherent<[u8]> to
> Coherent<T> where T: KnownSize + AsBytes + ?Sized. The implementation
> only uses size() and write_dma(), neither of which depends on the
> inner type being a byte slice.
>
> This allows any Coherent allocation with an AsBytes inner type to be
> exposed as a debugfs binary file.
>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Applied to drm-rust-next, thanks!
