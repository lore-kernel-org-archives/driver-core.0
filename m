Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074243845B9
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 07:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323677; cv=none; b=cb2gF7hAbcno3hGqaAkfrzJUJ6uJw7vtFpl0rOOj5CDy/o8S81XCeIJyz40UMDPFQWFBjPevdL9H2LqyYtfX+axjMiIa7EdfuKiFdygFHTbfSIT+1hy5otP2ZMQKjXMAOjBSruMeK07R1K0ORVN0o4tDe5nwO8pBAiN4og/SPzI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323677; c=relaxed/simple;
	bh=7XPFoYVvW840ggfiHqGIw3DjMqJsRLWwR9BRBE6BRwU=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B1OE8pyB3SrbrXXDRO1qTutV9+imrWMzTjqO3tqXeghNKourQw+UrwCBehWdvMPVjwj+1Mc048VXOSiAEoBhfKQFElz5Am2xcLslCJOIxkOXEtmf2YiSvdsP3SXek6KkMONLcbv5LYuUZUIPZ3oiqvdQYElauykOiTVi52HCZUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=M5SQfS21; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="M5SQfS21"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b8f5bce308dso553214966b.1
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 00:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323672; x=1776928472; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvMyyx9perCSSdK6F2JuwmKCFC8HVERv4ogEceJbg0=;
        b=M5SQfS213N7mZj4v9d/o2fVuw+D87w9fS5hAX65fwrwfOalk/pFGrRoqc8l8SCrA3M
         8AbCiubgfc0SPpUwQnPQBw0EibpmT7BVmvnuYpgeFtOfmVq1yRMqF111Hm+MJ8dz34+9
         IEyuW7vR9ibYoHXEr+mOFxLX7kiJq3LIin5bkQGj5bwt+wB0/LVLe2U0F9GYriBZiGjP
         fPTo+NlqQcgXaX9b2WAm+tFrCryOGj5CyerAI8/VbkO+vqbyrMYoHG3plZA0A91GkGas
         4kSI6y3Az2UV30v7nfSoooXHIRDnXR09Zfo0XQLIRSCV39Ykxq/aUVq1jocFqNufeakj
         cuaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323672; x=1776928472;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GtvMyyx9perCSSdK6F2JuwmKCFC8HVERv4ogEceJbg0=;
        b=ov5XotTzud6eV2h/GnNJs45YGeVVUvInnUkM3G8mSomFnmj1v5aIsierLgXPCdivFb
         R595mER1uLRINkeswN4GuSkrk2jJNjKPG5bP8YXnJPzNuSnwS1eRx59ZkGiT47kc+P0L
         KtsTvwXk7apaWQF4tVxCiHr44e7LOW6dNHO4JK1WbAqkosp6fsNUpgvc54K/Z3HKmjWl
         Z074xlunbELH1jEbQxha5h3ClKAS/lwn2iFD+bRd4UH/PBWwbxQqf+Q9YfoD0owF7shH
         TwaEXMEeThYneoBArKnm4ug3+sfwCT0p22eZZWSfhjSw3f9q3HUcrxnb9WOjgSBpBo6H
         z2YA==
X-Forwarded-Encrypted: i=1; AFNElJ8z0ajNVAbrQr5Q0cg+18/FrgfnXtm5s6LBp78gQdxpeHfHdEMNG7ZEYk/t8JGGUjLjh1PMo5Bo6VfwTQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwpNht6x84jCy/VVLltVBlge+qOCC726StBR4GexAqXz2do8uA+
	HmfwrNoHd7tr0OImV5IyNuCg81z+WsEU/P7tkF8E2sc7Hfgkt7AZaKPUKTBDeK0V8ZcDDNcFbLa
	e9Q5q8HbLyIY0T7Rxvg==
X-Received: from edwo26.prod.google.com ([2002:aa7:dd5a:0:b0:671:2fcb:edb8])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4544:b0:66b:aa56:ee5b with SMTP id 4fb4d7f45d1cf-6707b1067d0mr8867411a12.28.1776323671860;
 Thu, 16 Apr 2026 00:14:31 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:14:31 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-4-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-4-450723cb3727@garyguo.net>
Message-ID: <aeCMV-5V6__ptj5N@google.com>
Subject: Re: [PATCH 4/5] gpu: nova-core: use pointer projection for command
 queue code
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

On Wed, Apr 15, 2026 at 08:57:15PM +0100, Gary Guo wrote:
> From: Alexandre Courbot <acourbot@nvidia.com>
> 
> This has been previously attempted but missing compiler optimisations for
> older LLVM versions cause build errors. With the panicking index projection
> variant implemented, replace the manual pointer arithmetic with projection.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> Co-developed-by: Gary Guo <gary@garyguo.net>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

