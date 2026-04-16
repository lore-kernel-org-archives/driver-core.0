Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B9E7303A0A
	for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 07:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776323260; cv=none; b=SDThpAtyWUmP8Xq7e/uTznLDDVmD+roDvB0lBI8ANE4AOqbkw2bZyzxeE6r9VATxVJUxsXdOXi/3n6RqyBjUEqK4qw4MfVW0AOkLMmR8CjD9Cf/kxsrSXD0JJpk2jcsh2UH4qIn6xwGlulJYvCxpWvZcTuODfHFUXk6dsT12acU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776323260; c=relaxed/simple;
	bh=FoTrsOGwUH78Pq8XPFk2XwHW4lghXrd2tQSAUJNGr08=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Oq/R9fBBhtCBZXMMzdjuSEmcmn6xffIabUyk8sCb2UhNeTfedA/c2jgUhrrZcbGkWHNMBK2B339KBazOnfy2czAvWPgyGdv8t6GObldrhzvc1Hbe0lA7KdeuKWS9DgLzLmdyJfu3gEhMqQV2dPrDRkYaVVal5DoYaL8Swt1irGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=kFhkRFrC; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="kFhkRFrC"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43d76eeb303so4371054f8f.3
        for <driver-core@lists.linux.dev>; Thu, 16 Apr 2026 00:07:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776323257; x=1776928057; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=OjQRj3BbickNf0HB/Z2DC2BFmyenMexJ4QcHYs7WLw0=;
        b=kFhkRFrCrHZg2QbquCUqVs+te41AZHHBI+3z7147vEb8+Z+/NT+o/8qitZb8rTZfQ9
         g4h6NZEgwV522yt1fgxEl8sS8HZKyLb2GC0G6k9ZfYMnhOYafyv1q+jaweohh3CEPZZO
         baw4DQxMJq+CTi4YuA023fJ/V4LidR2oPpFTAG1nl9SOiW+8T0CvNIoV90rq1R9RM3Y5
         BjB6KHEWXJVHUrZZ5Xp8olk2XvTNK3rFkJPXPDLRaGf4crPZkQsK2YREUbvNLmizy0wU
         LFeb3x9uQLglFZ+zyv7os4Nld4otOan8jEZnsfBjSraPa4mNIEEHHiQOp45Zj6e6O5lN
         Ndyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776323257; x=1776928057;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OjQRj3BbickNf0HB/Z2DC2BFmyenMexJ4QcHYs7WLw0=;
        b=eI9AsEz6sl2LkBA4Vy5AiYtBiCJ1304e+kST7r+VILXCsAginbaWkGtxzZhkKe8txw
         dDpG2ZtbRmdHYcgMvcCzzMc9pQk8prPxVxRAr6A+Ku65YGa0hnlixiLb3eQfKwp41dkr
         ooCQqSs+E9YyzLx42lhdpGS+vS0R60t6gJ5rJVugY/SNXiG4Vok2g/kmmpnMbQnRQ8h6
         6hht6zr/N5YmQx63bherg+z7hzIvg6QkzezBMMu1x3Yp2eeUfpDzVQREjUgqDGT8Hy6H
         x6MUTwJXH2+RZIlx8Ba0afbU42dJpc0fWMGM0koHMjOrjog9bMLQ7iMjO81EI9zIWe2W
         B+zA==
X-Forwarded-Encrypted: i=1; AFNElJ96b4k5d5BAWLYM0efIb9s4yXh4EAdw1Hqk6P49AH7fuOmZWVmLcmg/Yy30s3saMnsT9zfnj/xkgCzpHA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxsoEcITLutcG/NOWRxCTGc3qdEZeDmk86SYGs/vr3tbzheerI4
	rQjVvQ/Vx7GXjtrxgsYSCkImM8L7FFqEadvVnbSeEuUVrp2lnLwJtV2kt2/uarsE26SjJC96WZ0
	iET9jXwAib1Oq4RIxvw==
X-Received: from wmop6.prod.google.com ([2002:a05:600c:4686:b0:488:7f1e:5fba])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b6d:b0:485:9a50:3384 with SMTP id 5b1f17b1804b1-488d688209dmr315526135e9.25.1776323257405;
 Thu, 16 Apr 2026 00:07:37 -0700 (PDT)
Date: Thu, 16 Apr 2026 07:07:36 +0000
In-Reply-To: <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260415-projection-syntax-rework-v1-0-450723cb3727@garyguo.net> <20260415-projection-syntax-rework-v1-2-450723cb3727@garyguo.net>
Message-ID: <aeCKuBOrhHWtGvAF@google.com>
Subject: Re: [PATCH 2/5] rust: dma: update to keyworded index projection syntax
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

On Wed, Apr 15, 2026 at 08:57:13PM +0100, Gary Guo wrote:
> Demonstrate the preferred syntax of index projection in DMA documentation
> and examples. A few `[i]?` cases are converted to demonstrate the new
> variant.
> 
> Signed-off-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

