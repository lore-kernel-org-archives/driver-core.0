Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8AFD30595B;
	Tue, 24 Mar 2026 12:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774356718; cv=none; b=XS84mYEu5lac7oKWHXwmlfvND4qwadHXODATQVBMVDFQg6v251MNk00o8PO+PEmduXuDpGDrqOyF9xRx7yVIaAnxv4DetV3R9T9rvQS+v4wJcjLxdYkbZ4lAOb31Uj7OlYd4jc2agXCj1OOYJ0Vj3r5Kkjya0JwjHSIChEDC0Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774356718; c=relaxed/simple;
	bh=xvicNmew9YGVE06h8feoW2WxPglCVqW6Ob1aqjokys0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ULudMTqgzBvk/1cZlea0fms3zUECWB2cpJByIOL+A0ZUKJtTWUkinw1iYWCTuGaryJgDD0mcuMqQzS8QRRuSUKY4B5EZX8yfloFvCkmAy2Ro/DqkAJcDdUYobdZJRdFsGN9sEMU+Uj0SwDzQ8ocdIU3guGdwdmpjXK9fbeNRF40=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J0m0ok8m; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J0m0ok8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C77AC19424;
	Tue, 24 Mar 2026 12:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774356718;
	bh=xvicNmew9YGVE06h8feoW2WxPglCVqW6Ob1aqjokys0=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=J0m0ok8mYABf6NtwFb0fQ+bgKBJ3sRCDZwG55FzC8VdLXM7hmtw4ep11W9+APxQrx
	 K+TjLbau9TJtVul6lXk2YJtFlWB8WozTRPB09jQiJOYMg8Yk9BR7DK7m1lbZPc+LJN
	 OXWDEeCwzXSwwRacJFBHEB4HDSJqtPx6uP7V6C0HKMThlLM8rqprL/OHjWdTPXQbNJ
	 x8TF56E26tOSH5SHyGdqXT0XDu76YDL/8lDyEqkQao0JGydrksoMGet8iepwO759EG
	 iI/MISunGCc/IAinK3cZvEYEkPTOLJpi9lJQkRS4A7xUxqgBVNX615iyz0JfZvuqMj
	 Rz0cM/PaXdU1w==
Message-ID: <5ea753b2-a702-4d13-973a-9eaffa9562fe@kernel.org>
Date: Tue, 24 Mar 2026 13:51:53 +0100
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
 <NNO45MYwzudmCWH1mWf1k0Icy8Q0eKR4ANI6fg9-zxq3_dHLfhyRsHaq2l77l-RBwmek7tHzQIv2vNhOFg1Ysw==@protonmail.internalid>
 <314ab89f-3aee-49f5-804b-f33dc8ef5ba4@kernel.org> <87a4vxqtsj.fsf@kernel.org>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <87a4vxqtsj.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 3/24/26 1:46 PM, Andreas Hindborg wrote:
> "Danilo Krummrich" <dakr@kernel.org> writes:
> 
>> On 3/24/26 1:33 PM, Andreas Hindborg wrote:
>>> What did you base this on?
>>
>> drm-rust-next
> 
> I don't think 1195fcbda62f12108dc9be56fa4173897905b90c is in
> drm-rust-next - or any of the other branches in of
> https://gitlab.freedesktop.org/drm/rust/kernel.git .

Oh, I did not notice that you replied to v1, there's already a v2.

[1] https://lore.kernel.org/driver-core/20260320194626.36263-1-dakr@kernel.org/
