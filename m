Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4081E386557;
	Thu,  4 Jun 2026 18:43:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780598623; cv=none; b=kvfdLjN/EpVbciF4UdFeBrQhDKRrgEZfyz3Tp/Oimj2JPCx853v9cglgKrYVaAE7YtgN6FZg5kNllBIGQBdEOC8lurhsu2GITxJFGowQznn00ICzN/0swUSvB+O/f1A+53v03Jej2t91xgeg7QHg/i5WIh4EgjmLM3wD/MI2E4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780598623; c=relaxed/simple;
	bh=VKPyWDP8wEHsnTmdQakUzJ/YlsZ9OeRc2MXbo/ylCrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=NS9CQtKG8MSRFoel0A4aysIfrPHgsVViYwbufR+w9u+svtK8A5y/SPTJsSb1w9oRXSYZYHyo9ADqCzesVuKIIvKPHVVRR1CPmGH/In2H+qdMx6hIXedBlcivOZQWunXekR29i1lqpZifQlWsM7JQ7uRFPnsd3Dr3u6fuFrqp8VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jkC6NuG2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jkC6NuG2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEE2F1F00893;
	Thu,  4 Jun 2026 18:43:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780598621;
	bh=VKPyWDP8wEHsnTmdQakUzJ/YlsZ9OeRc2MXbo/ylCrY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date;
	b=jkC6NuG2ixvowA5B7TSNRmDTZt+SWb45CmQvmN8LkpvsidSbi2Lk3h28pQOfL3brr
	 zObsGg7qEBoj26kERQ7CR8msv4kMOAfmbW+lrj5ws5CbwhE0S/WfUDyWY9NP3cGyLB
	 m+etHLyb3awd2TU0ZbJnRETdvoIVFXoQXZO89dOtDK3frrAQnGuPsBX4Hka/lcPHfV
	 tCU+aHyACHZFTV6HYZt++jXsT2pUidhTA8/bUMfRBjoJbiCuVVdFe9YdSYhG0h8Dlm
	 Lt1S0HFyJmaY9aIu0SeZfY9Ax41gtHWf0yNaOFVFp8YsV5ugz+7kN9IiEXFHSG3kSn
	 cLJSeaW3f4U3A==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng
 <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn?= Roy
 Baron
 <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl
 <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Danilo Krummrich
 <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel
 Almeida <daniel.almeida@collabora.com>, Robin Murphy
 <robin.murphy@arm.com>, Alexandre Courbot <acourbot@nvidia.com>, David
 Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev, nova-gpu@lists.linux.dev,
 dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v2 3/6] rust: ptr: add panicking index projection variant
In-Reply-To: <20260602-projection-syntax-rework-v2-3-6989470f5440@garyguo.net>
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
 <20260602-projection-syntax-rework-v2-3-6989470f5440@garyguo.net>
Date: Thu, 04 Jun 2026 20:43:28 +0200
Message-ID: <87bjdqjgdr.fsf@t14s.mail-host-address-is-not-set>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

Gary Guo <gary@garyguo.net> writes:

> There have been a few cases where the programmer knows that the indices are
> in bounds but the compiler cannot deduce that. This is also
> compiler-version-dependent, so using build indexing here can be
> problematic. On the other hand, it is also not ideal to use the fallible
> variant, as it adds an error handling path that is never hit.
>
> Add a new panicking index projection for this scenario. Like all panicking
> operations, this should be used carefully only in cases where the user
> knows the index is going to be in bounds, and panicking would indicate
> something is catastrophically wrong.
>
> To signify this, require users to explicitly denote the type of index being
> used. The existing two types of index projections also gain the keyworded
> version, which will be the recommended way going forward.
>
> The keyworded syntax also paves the way of perhaps adding more flavors in
> the future, e.g. `unsafe` index projection. However, unless the code is
> extremely performance sensitive and bounds checking cannot be tolerated,
> the panicking variant is safer and should be preferred, so it will be left
> to the future when demand arises.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>

Best regards,
Andreas Hindborg


