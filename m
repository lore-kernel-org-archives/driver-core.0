Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E74F237BE60
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 07:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323303; cv=none; b=THDL7puErIwfnqAI1Zm9siAxcJJyosZgIE2B4i8w8asmmObkKm6HmsyEodfb2IZD0Lgx/NNMo8QA+WEhKFui1sefgK4uBW3/9HglYC0IWO5sfoeZTN1mopPnu1VhOvJ/3Sx7FMqEYcN6t5heHxsXvmHqqn5TaykvuMG+/yEC8LI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323303; c=relaxed/simple;
	bh=28/fZRbuAyUZVXYQ52AQH33d2fza7Pic6P+nIAQ7J0o=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=VnG03/APj63da9qq3qrV0j60gFlWvv+OURdLYk+ZWjILwvSH23uIdMupfoGW3wksnkh/2jRd7Pe6Zes+2g3yGf4GFdy6uPSlcJVO8O2MkofdAga8xgDFdafg5weN+vQ2S7aR7aCi/HhLSoAqxRmlycHzATD7YynskMl9KUffHb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XMrjXlc1; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XMrjXlc1"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-ba24fa76ad8so78318366b.0
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 00:08:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323299; x=1776928099; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=jl2zYP8ItHo8A1Pr9lCgwMtrzp2rEjUaJnpjqviDWB0=;
        b=XMrjXlc1UiXgpC4N64aiU//AHgvkWo2LMSFVNJ4/W5WhlZHf6fcxzOUNwOrGiiRjM6
         0h/HvsKPYew/OetCMJ3eOKZ3Li4t2VX7J3eekgRcu+YaNXDThXpW9LebyZpmbsG54YYb
         7tMfPPn4+A463AcXq28I+fs2Q8JYPam61/QR1mRjuXtkgIaa28qDHeymx50ezpHq1GfL
         w1R2Fbfc/4oEUolY0hz8Y+nvB9dd/+gJiIWGIiKpa/zVy9vA1BgH2xBjYvORxWeMMbWJ
         fJuDSL+7jSDQaKeFKZjZChQsshfPAk9I16zURGHRnzR7acvaEu+QShFmf6iMroGOep2P
         ctxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323299; x=1776928099;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=jl2zYP8ItHo8A1Pr9lCgwMtrzp2rEjUaJnpjqviDWB0=;
        b=TF4ESjjjXPU2wr8/e2uHM+OoH5IFpWgKVm3fNLZGeV/cXfsxBEnK2wfuaugqhyw/mR
         IEcbAMiyLP7drfCkHQJJt+mqe5BWwcEiSWwe0thperog12fMhQhL/rhzlaFOf4j1pDlF
         F6IqRbEl9ScIcj8kh71NMA5Yr/7FqNW0Jjka7q2cyVGeF30XK3wY5iGTnfstKKt/kyhw
         rfb88MonHqc32ISh5v0nUJNM1eNPpdI7HQgPBOIvGofVvn4hQZHhQsCmKuDUMtOTFwv4
         jaC64j/FYDH4dYcBJA1mcpwR05NkifvkSAC8ya4VHahh8JDbsXKCqrgWyCLwVkpeMZQU
         lP5Q==
X-Forwarded-Encrypted: i=1; AFNElJ+4+Opinmd2N7s5FzZL5z53PyCQJrzkxMHoMF5ii9okb6/j9k3iCJTGNDWGCUMM4LwbvHnYk0OCSz1xEg==@lists.linux.dev
X-Gm-Message-State: AOJu0YyAJL/dLJeeuYM3Zn4n8c9/nwH9MK+SzXfYcBoRsxm9Wm1AZasr
	BZAhuSuS4LFx46y5BG6TRQHto0CUHVXOhn5xvYACK3BPRPGxEwfS5blsVDTKTDo8KC8e/QKTsJs
	yvFcPuWoFbQdaCg9hXg==
X-Received: from ejdcm6.prod.google.com ([2002:a17:906:f586:b0:b9c:5eae:2e29])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:86a2:b0:b98:7e20:b25 with SMTP id a640c23a62f3a-b9d724c8f5cmr1366009766b.20.1776323298770;
 Thu, 16 Apr 2026 00:08:18 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:08:17 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-3-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-3-450723cb3727@garyguo.net>
Message-ID: <aeCK4cLHsM7jbWEl@google.com>
Subject: Re: [PATCH 3/5] gpu: nova-core: convert to keyworded projection syntax
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

On Wed, Apr 15, 2026 at 08:57:14PM +0100, Gary Guo wrote:
> Use "build" to denote that the index bounds checking here is performed at
> build time.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

