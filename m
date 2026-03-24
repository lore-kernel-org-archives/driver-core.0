Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC43C36AB4A;
	Tue, 24 Mar 2026 12:36:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774355784; cv=none; b=GFgPpTnik4+yPRkcpIJbrInO0KQUsss4xLXvREjo9RS10qut2yQ9lDywImrPCL++BQTqkARJ2b5/PjXy7vhaitUN3mQxcMaiJYqP386i5en/8MVw0J5OSty8vsEMqT/4q5AIbtJbP2GGxH8ZUczpDGfzm3dFrD2RSFh8gEZxIGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774355784; c=relaxed/simple;
	bh=KAmLyMQeA/wWoEw3rDgQ8UAc/AjO4juofRDFITp/M7M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=vAk+7kWyrp427RcmZOigvgmPFlvvsSAfsLpO85Z1Me74kkGm+2ul8wB3fMitJdREHHWvIPYflhZkREXRcE1blSeRyM+4jM5rGcjqvSSw+dd3IlaS0Joa8Tvs1OiFzTMvSl+yx7bIsltUrP3/nB+KO1JYkm4pBjikAJV00a9kfjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FB+4nBp8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FB+4nBp8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F528C19424;
	Tue, 24 Mar 2026 12:36:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774355784;
	bh=KAmLyMQeA/wWoEw3rDgQ8UAc/AjO4juofRDFITp/M7M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=FB+4nBp8y9xP8wkFgkv+Ns/o1iWPPhZJlChqynTjJjtg0aatmPnRW+Pcoqd9Wtjzl
	 Na7kHH15HeEy6ku9mBGrw0sW0xBLorWc14IxGeEhu5K+fPBLBiD6+juSJqfEYWap6M
	 hP9u8lyq1HYkZv74mu9zyrPXDS5Ja05lYftczS2OUXqwJXdY7ksNaGPyeKVESFM1gR
	 W7NgyWmZ8pVRIDJjmxL7h3Sgfb3xn6WUlEQ7PEyJB8FjBeKu4O6UvWyqKK1RGop8AI
	 osac1ec6Ur7n4A0kTuqyX1i+e2kjp4UFsDyXaSd4ylhMxSr+cM5JYTAQ7IwauZNDyd
	 9WbPEW2GkmQyw==
Message-ID: <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org>
Date: Tue, 24 Mar 2026 13:36:19 +0100
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/8] dma::Coherent & dma::CoherentInit API
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: aliceryhl@google.com, acourbot@nvidia.com, ojeda@kernel.org,
 boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, tmgross@umich.edu, abdiel.janulgue@gmail.com,
 daniel.almeida@collabora.com, robin.murphy@arm.com,
 driver-core@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <9A1gWen63AbJmi06Y_vu_qF1S86nj3fcQEil9RzLAn8QkIYpCOrLMNO7JcgIP0BccPHhzaYaQ_te1S_gKuHRgg==@protonmail.internalid>
 <20260303162314.94363-1-dakr@kernel.org> <87cy0tqueu.fsf@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <87cy0tqueu.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/24/26 1:33 PM, Andreas Hindborg wrote:
> What did you base this on?

drm-rust-next
