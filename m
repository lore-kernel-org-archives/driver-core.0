Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5304A241665;
	Tue, 24 Mar 2026 12:46:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356408; cv=none; b=p8X/L120PwPnfnLykLVchMvtTLt/sNuDzdo24FJOAH6EuyQWiHY3rpB7HhDDU8Jw3+BU5z7TUpEKWhcK5BOkUNgztOyyk2iKsT0WjwaKN+KG9bXYosYGzBTO1Ta9GeiYqVCMyc060EtMoZPtuW3OqBwQk5v3dSn+DVePGvibimI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356408; c=relaxed/simple;
	bh=dsxveakDjRYMQkye9OWRI3sTONphVUVna8ujrl9GArE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=mnbmIzqG13f79ZzwDsnHTniKprPtZtILfQx45i83RLlB2Yk4Ot5f0k0qnH2NwKDmdNp6W/yC4eGfpn6z3pzKA/z2ikINFPFEq40iTlZebtYtBtx5GowrXSOh5CCltwlJpihkIo253gjguboICBFcj6P9GDqMfCvb45kdVqmwTHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d1cJkGkO; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d1cJkGkO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EC4CC19424;
	Tue, 24 Mar 2026 12:46:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356407;
	bh=dsxveakDjRYMQkye9OWRI3sTONphVUVna8ujrl9GArE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=d1cJkGkOpD3P10vow6H193rMwXx4pCGknvlcsUyKntyc3hs/Dl6cAmaqUqazKT8mS
	 IcjVlKuVgutbV2SYEHS3ON5BlhJLbFK1ejAQ1WosoxDL26QL0j0mz7DNktyKw00AXD
	 61lvhBj5bDAirroIg7FMAWGDBzyEZOWrw41fyi9C3H3Stkrby6J64GFLJjknK55jp5
	 UOSXNVCz2JIKyK7LKDFkhTfVyAVc6YtnTGB4shSfmSdJYUokpq1XBmiAWzMxT5b0nV
	 fKTA03FfPN3sEqu3iB8pjBKWtMCm/Yc+wRHfPpVrhe6R4E1jHNoRx3JWglVIx6TBQ3
	 1CcacJaKLrAnw==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
In-Reply-To: <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org>
References: <9A1gWen63AbJmi06Y_vu_qF1S86nj3fcQEil9RzLAn8QkIYpCOrLMNO7JcgIP0BccPHhzaYaQ_te1S_gKuHRgg==@protonmail.internalid>
 <20260303162314.94363-1-dakr@kernel.org> <87cy0tqueu.fsf@kernel.org>
 <NNO45MYwzudmCWH1mWf1k0Icy8Q0eKR4ANI6fg9-zxq3_dHLfhyRsHaq2l77l-RBwmek7tHzQIv2vNhOFg1Ysw==@protonmail.internalid>
 <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org>
Date: Tue, 24 Mar 2026 13:46:36 +0100
Message-ID: <87a4vxqtsj.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> On 3/24/26 1:33 PM, Andreas Hindborg wrote:
>> What did you base this on?
>
> drm-rust-next

I don't think 1195fcbda62f12108dc9be56fa4173897905b90c is in
drm-rust-next - or any of the other branches in of
https://gitlab.freedesktop.org/drm/rust/kernel.git .


Best regards,
Andreas Hindborg


