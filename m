Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDC103B7B68;
	Mon, 27 Apr 2026 11:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777289321; cv=none; b=dc3iME4HftHZC6rJ3GAkJXFe9pPRzttSje2CfzF+bBowyYlJiz8ag77UiYA3w6vsk8FH41HKmdfn3Iql/T8hTOrtV7u1JW0FGmk7uwbCS0BeeGw3sUkoWeHwW736mZD8q1WTWTghdFlEbNrG4Y72skoZAHD7GWl/AHm6tuTJxS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777289321; c=relaxed/simple;
	bh=0ntWNbklvUzaFLNmsuPMmji7kfRyTy64xl0FVAXz08k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=EgiXB00Y2FRitemxgoIsXeC1JyOu8+C2bOhPzQ/bpeeSJprsuEqq/n3v8b+ig5okW3Q9LH85v8gPD9mZMby9K4bneu25sWjS9pEVehKh261D1g6hJFIUDq63zHH2R4ivHxbO810/8PTTSIaa1vBlPCRKcmTyLtxvW8lDR1hU5as=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hnrflk4Q; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hnrflk4Q"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590C8C2BCC4;
	Mon, 27 Apr 2026 11:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777289320;
	bh=0ntWNbklvUzaFLNmsuPMmji7kfRyTy64xl0FVAXz08k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=hnrflk4Qdm/hoBxk6yOl6mcleMj2mciyydKP3x2TywvalzuNUL2clXmwVx1M01F81
	 dHfQAC3sBQEswGY/g59rwWcF9kHVRsO+nIYj2grspkxCLvN8LweCcaeqUfMNpNMzVt
	 /V+ythcZMaiVBj+tdJu7kzNhSj6E4d4dXHrlLENZ8046FuAtCuUdDYP0GAavHXauOb
	 QFhoCqW199YPKadQcJX7qx50jzNhyrp8Saa4GGj1hkesMPLO+D/6NiIZpM4vF9BRD3
	 yF1v6bQ9P+UkMY6O5SXPc2a5Hl3pqnWYEjH+4YwGnwB6LowYXdEr9q1jlKIX3r5FJQ
	 AYb6BErMWmYfg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Danilo Krummrich <dakr@kernel.org>, Abdiel
 Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida
 <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice
 Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Alexandre
 Courbot <acourbot@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, Gary Guo <gary@garyguo.net>
Subject: Re: [PATCH 5/5] rust: ptr: remove implicit index projection syntax
In-Reply-To: <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net>
 <ltBY5QYjK4tx6VmSUSi569gKrxT5ihMyaCPL6NuzcjUQNiX536ppjNAjUP9d5eTTBqcksl_pdY6QQrJ6Oy8rPg==@protonmail.internalid>
 <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Date: Mon, 27 Apr 2026 13:28:01 +0200
Message-ID: <87lde8r6bi.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Gary Guo" <gary@garyguo.net> writes:

> All users have been converted to use keyworded index projection syntax to
> explicitly state their intention when doing index projection.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



