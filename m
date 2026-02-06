Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E170D315D3E
	for <driver-core@lists.linux.dev>; Fri,  6 Feb 2026 16:23:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770395024; cv=none; b=PE5oLYlfvvx9yOkkGDWYx7YElo7VS1wrl0IxsmQFrwkKHO6gfSdPwAZKWBB4rQnc1FaacA69jcKvXLz/qUUUbreOQctZOgLBsAyru22ngntJaPopxtWKhqA+MiwpHIgla4lUe4zejnorCBbYLn6YUPC8QiGIkfMXU03T3jUWFfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770395024; c=relaxed/simple;
	bh=PDB2SgMpjoyPYXsycU7QqblnHau7Qc+s9BjaMA1YRXw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=bfNF2PSJE78XWEV+c9UYpLdgVRG3RrXHFiBWFdJLswtcAhNYXiy22cgv3PDwjA3R98Xpfxj4KbEE83gKUM10Dqa91F65VOP1qprrVPz/6ERvqReLbisVe9lfmDiLk/8SUJ8sVlj4Oq0R+oI0/3iVI4JTxGQIJkmJcXKw6DA0B8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oJ85C81t; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oJ85C81t"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-431054c09e3so2063943f8f.0
        for <driver-core@lists.linux.dev>; Fri, 06 Feb 2026 08:23:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770395022; x=1770999822; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ASfbMYdreUZsTeOEbqPVUbJkiLyzVG7/cT60T+k1OEo=;
        b=oJ85C81tL3yHl27evt636zRXPLySB+hAqfysVTPzRhyQWIS3HPGSPV4q8Of3DBzoaB
         WU35YNXBTh44W0JsWUnMoFsgVsmoqirB9/6BBCJTU5E23EdYIBLOj458Bqohzf6HT2zS
         nKzq+kLWLpHrvJfV6W5xil4wy3sqHiYnhxWB0VdmjBTtG69yU4Q1rLWzeEdXUA8LpIRl
         utGQDmgKGNNoxlx+f9PIBARL0cQau4BgfWakpbcvs6I72tSVqeFmBBXe+B2NSyEIb+tx
         BRcvXvRGToNmor00aGUMY+1NW6KgquJG81+9F/eXkKrCqrWgpgNLL8kDknP26FEgjwtQ
         Aoag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770395022; x=1770999822;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ASfbMYdreUZsTeOEbqPVUbJkiLyzVG7/cT60T+k1OEo=;
        b=Ux0lCvq6uoFqGFGw+gSWQZ6s58vXVdzbhrMSxtPlY5/29kLoPW1EEeO3pTJNLFNxrn
         /Np1e5BzPtFW9uF6mLxN7WI17UvOl3Dmg9TpGIPCsMUC+yLIyF19+vOufJxusEKtWqPw
         5CdW6I3E0ThxVfMw0CyeJgCIETmmlwOkTJ80k1zBNJkVqoFOxFN23D3ItWp1aRPYIF9Y
         gJeEYSai08n2oXGA3uVeH5jRbFHo2wOlB09C8jCpMOYEFSk1kbxyq8tj5WVkMOhk6TMI
         SNrnw7pHlDI0aeJRGbkOD0QHRNPr2kDti6ht1ANk3+J5xaVytSPZy0GMkKm6JqmjTpFY
         1TGw==
X-Forwarded-Encrypted: i=1; AJvYcCV6p/GZR8Juf9uBAkxWTL8l8El8wEl0V84bPfjB7uf1yOVcR+dujaNm6J6Q3VRXqr00bOv47Tc8ObwZ3g==@lists.linux.dev
X-Gm-Message-State: AOJu0YxouMzYueexK/Z+M+X9bHNfikg2AVte09VZx3OEHxee6GF17gQS
	Z7ApRNKv3F6x8VoZw3OvfKZSQJn8lxJhKQ4+gqkgemkXg8APQhNrqUf/VvhLWzyUTXzs0lkUWxi
	6FY9RI99HnNG8QqUsLQ==
X-Received: from wma12.prod.google.com ([2002:a05:600c:890c:b0:480:4a03:7b62])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c16b:b0:480:2521:4d92 with SMTP id 5b1f17b1804b1-48320214793mr51550685e9.24.1770395022468;
 Fri, 06 Feb 2026 08:23:42 -0800 (PST)
Date: Fri, 6 Feb 2026 16:23:41 +0000
In-Reply-To: <DG8036NHQJ98.3A2RTSB6THUB3@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260205222529.91465-1-dakr@kernel.org> <aYYOoyD8QAHEsWTp@google.com>
 <DG8036NHQJ98.3A2RTSB6THUB3@kernel.org>
Message-ID: <aYYVjT8OZTKYdaML@google.com>
Subject: Re: [PATCH] rust: devres: fix race condition due to nesting
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, ojeda@kernel.org, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Boris Brezillon <boris.brezillon@collabora.com>, 
	Markus Probst <markus.probst@posteo.de>
Content-Type: text/plain; charset="utf-8"

On Fri, Feb 06, 2026 at 04:56:54PM +0100, Danilo Krummrich wrote:
> On Fri Feb 6, 2026 at 4:54 PM CET, Alice Ryhl wrote:
> > On Thu, Feb 05, 2026 at 11:25:15PM +0100, Danilo Krummrich wrote:
> >> Commit f5d3ef25d238 ("rust: devres: get rid of Devres' inner Arc") did
> >> attempt to optimize away the internal reference count of Devres.
> >> 
> >> However, without an internal reference count, we can't support cases
> >> where Devres is indirectly nested, resulting into a deadlock.
> >> 
> >> Such indirect nesting easily happens in the following way:
> >> 
> >> A registration object (which is guarded by devres) hold a reference
> >> count of an object that holds a device resource guarded by devres
> >> itself.
> >> 
> >> For instance a drm::Registration holds a reference of a drm::Device. The
> >> drm::Device itself holds a device resource in its private data.
> >> 
> >> When the drm::Registration is dropped by devres, and it happens that it
> >> did hold the last reference count of the drm::Device, it also drops the
> >> device resource, which is guarded by devres itself.
> >
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 
> Thanks for the review!
> 
> >> +        // Take additional reference count for `devm_add_action()`.
> >> +        core::mem::forget(data.clone());
> >
> > I'd feel better if you called .clone() prior to devm_add_action(). That
> > way, even if devm somehow runs the callback before we get to this call
> > to clone, the refcount has already been incremented.
> >
> > I know it's not really a problem because of the &Device<Bound> argument.
> 
> This is intentional, since, as you say, &Device<Bound> guarantees that this
> won't happen and since otherwise we'd explicitly need to drop the reference
> count again if devm_add_action() fails.

It wouldn't be explicit, as you can let destructor do it. But I'm not
going to force it. Feel free to land it as-is.

Alice
