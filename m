Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F737385523
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 07:14:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323698; cv=none; b=aEkJWbI86McpXZ07nqu/yRO9oMV1aQcoPxgN7oU75eFOGePbAFiqcPOJkXwJ5Ih9qlnR4Pakw7J42MI21m7bhlKOtZZia5jI3wq7BdW8qyvk9eFabalUlAPHnREbvJGW7aSgmMTeZL2TKRvW4NO3BKj50SMtTfypiOc7BzWwfNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323698; c=relaxed/simple;
	bh=1m9S8XLvLrc62C+rF/LkKRMO1WKHexukb55+7Lx8Vkg=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NBFryYaAmnDGVgDAFuLMDyC2sNP3d98NbmvWk5sqmIP/9QG9OrVvaHPcVBBeO1JeaJ7A0HSp3e4qU8PgE2Hx3X4g2qipQXIfmj0QsF1Oxa6LesBZ9H6n9qlS6ydUYu16VXoqZMKOk0lbAo+vjb4C384Y/QuCyxgFpdy22jP5FSM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AM29CTHy; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AM29CTHy"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8ff07df5e4so582267966b.3
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 00:14:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323694; x=1776928494; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=PL0zxWT9yr8avn3NY1DoBsUP7UaDGDNRZMMzAWVPz+4=;
        b=AM29CTHyZfOzI65h47zrKKHOHYr7j9navMVnjmaZ1v296Dr0zyxTbq4aNUPUy8LtLL
         53cKASFdJJgiLkOqi/DDwJqyZsxVuAkRubroQr8IrivdEFt4zLnBEjrGl547QbmOF0zJ
         UHikptTNu/Up/Pudt43hb1SZSX5jl5Sha6C33RDi03/K5ts/fKU8L2yGFfiVxAZbOyQf
         jnpTFgfR7xKvx5tfJ35iX6FBLsGpKm8o5eUvWLEzuoiciAry2lQXnnSoq8KxRp6ReIr+
         VkF5mKZ7OQXppCf+BZwwg3gSADyGvbTc01eyB/upyVgNu8ABi+2xjEW83mUrqK9Q5zb8
         P5bw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323694; x=1776928494;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PL0zxWT9yr8avn3NY1DoBsUP7UaDGDNRZMMzAWVPz+4=;
        b=IThMk3q2y3U10Kk7eMoFKOIi8BJXCuFuDeCatGirER9RksmkRhnbgd0K+LT6nHVLo9
         XNTAETmOfQygKYms+Bii58SfgQRJ29x60zPkGUjw1x31cx2VoT5O4+JvK+h4+ky24kM/
         wJgrauF8XjCb28gSojvfgdywDWrtg9VKOGhy/9zUsjqO3CSrYvWGuPNvlh0gPdfn4OUj
         X/b4URSMIbIe8QhbEJeJuI+o9dGyWlFrZaAKN7R6sJ7Th1NKXRe9kyT6isb9hZU2VKeb
         omde18a7zeH5dUr2MG+7wzwX5pUpoPrbm1Q9cUZXs1GoXXwmSFYYpH3FYY/IVSKnEjGV
         62Rg==
X-Forwarded-Encrypted: i=1; AFNElJ+CPPkBuJwwR88j71BxC3/vHU9P2p8W362z/bmOP6YWb5szMN9il68pPPdbe04vQjX6ZOYMkmUePuSGCw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Q4Ai12nTIVih1Aima87ePiB+U3IcEgumMbtQ/U/xIT0AU17t
	TB9ePXaBqBSDxtPhu201Bjb6PjJHIrfWSaFuFDlRHNfCY33EkZSaulDZJvLKNpif2oo4TO4FyRZ
	1+rpg1PIJ+HkSls8roA==
X-Received: from ejccs20.prod.google.com ([2002:a17:906:dc94:b0:b96:682e:377b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:8b98:b0:b9c:a70c:d30b with SMTP id a640c23a62f3a-b9d727931camr1261267566b.19.1776323693818;
 Thu, 16 Apr 2026 00:14:53 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:14:52 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-5-450723cb3727@garyguo.net>
Message-ID: <aeCMbJoYQBS_I9lK@google.com>
Subject: Re: [PATCH 5/5] rust: ptr: remove implicit index projection syntax
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Alexandre Courbot <acourbot@nvidia.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, driver-core@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 15, 2026 at 08:57:16PM +0100, Gary Guo wrote:
> All users have been converted to use keyworded index projection syntax to
> explicitly state their intention when doing index projection.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
