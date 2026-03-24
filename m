Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BAF917B418;
	Tue, 24 Mar 2026 14:02:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774360971; cv=none; b=cZEgsU4Bc4Mpx0Gy1uicb+Vsf+OLfM56rVUrKlmoySEcHrgR9WMGQLe+c+LlIN+mnbGLyOaSHRKDNzeHuT1c6Yy4knQ2GqrIK16pa6/ZSUAvRhyYfzOHeySlNYlemvnrlFO200gXPzGm5BzTvPEMzEsAJj2bvQ7aCZQ4369dYPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774360971; c=relaxed/simple;
	bh=7PpyUgaN+hR/mcrAloIqkwPScbhc6VOuFnHSKYwmy0A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=RRfS0nSCyl4DWUYdKlC0mCvStBWx9kfaO+193eT3ugkl4qVdfVG26WepDuGec8XsfPMw+v5Kl6x7FizIMl+p42/vlZ2tfJK8zp6Hwt5rG2RTHxNIt7T7SPx5CsmFpkmOFCHXYDFq/CQjpOe6Vv+3oenvHfrLRzSzbBHmqcuyAk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ASZzrdr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ASZzrdr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45611C19424;
	Tue, 24 Mar 2026 14:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774360970;
	bh=7PpyUgaN+hR/mcrAloIqkwPScbhc6VOuFnHSKYwmy0A=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=ASZzrdr6G1YNdy3VIWR9h0H2RO8QVyj7F4ekz66mXysHYPnmBf0CCRwv2TQz/vKd7
	 lowjFRVVKzhi/0+pguVkixUKuJVDT45+GxZph9cbkMNa4iluXzAaUGIFGzs9BFtJat
	 6hO5u1g49YHUDCxiC6tOzTETGItBOKB6o0p0kyw6cGzM4Q/c3u43XdBF36DNw9d0vW
	 qfpgMcvLwZKl4Ie1tca7dqy5WwHH/GoRr9bPUY3rCx4G8nXWaXkWPyLMJs8DjBhlpl
	 cJ9/uFyvZMLV7TI/8QHYtZF+M+Ms0hE7t0KpwqY9j81ySN7dZjVnFifkhQCf3Aw+a3
	 5Ub764AMu1Lkg==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>, aliceryhl@google.com,
 acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net,
 bjorn3_gh@protonmail.com, lossin@kernel.org, tmgross@umich.edu,
 abdiel.janulgue@gmail.com, daniel.almeida@collabora.com,
 robin.murphy@arm.com
Cc: driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org, Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH v2 1/8] rust: dma: use "kernel vertical" style for imports
In-Reply-To: <20260320194626.36263-2-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
 <IFgpz7BJ1u0FZfIVnNpmhnmvYDK9ZkoGMuAsmVCXaQKcwPA9Mx40rNBRqxfG-PXr_fCNXYsWcjqWSrFvUdzo3g==@protonmail.internalid>
 <20260320194626.36263-2-dakr@kernel.org>
Date: Tue, 24 Mar 2026 15:02:37 +0100
Message-ID: <87v7elpbpe.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

"Danilo Krummrich" <dakr@kernel.org> writes:

> Convert all imports to use "kernel vertical" style.
>
> With this, subsequent patches neither introduce unrelated changes nor
> leave an inconsistent import pattern.
>
> While at it, drop unnecessary imports covered by prelude::*.
>
> Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



