Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD173CC310
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176208; cv=none; b=C0iimo5wLHaKjSgSAgZtpQYqXovgp0R4/WM+BOb20tvA3mKTpycovnoB4F4KjrtexZg8plUV0yji+jTKbb1xfL7PE399XE+MJeYcPJNJHtQw1cufCDUaKC8daFH3ZmxAgnz4HsbCX5QRYwNCEoIxX7fIJrpN8dY3oB3W496YTyI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176208; c=relaxed/simple;
	bh=TEOPeQRDcTO8ZT8oB50G4bbjCXtdEl0gblwbnGjfT1A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ufT89dMBKEoCLhwopkHQsf0I8A8VsyxoFFWNKC6KGUG031sbxZNeAJKg8qeUnW5muu09tENtPryb9s/uAdHai15KzLErhpA4G+ycb6AGV7S9W1C5LnfJTa1yql/wHVc3Vml0dBBpmmrRxhI50b9ePRRBdC3KSVWKlEp7C7nHCr4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=WzqB4THU; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="WzqB4THU"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490b7959b9fso77747985e9.2
        for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176206; x=1781781006; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=WzqB4THU/v8Pk+DdgQ93sy60nJxXl5ZxZXJofFaJuoI6oVODoKaIw7hOwvNjrymyj/
         xvBvKes6wBhtwy8dK5c/qDxwqnX3b38n/xRsZ4y908FOyiQmL/gJbxd6O73ZS83T2qBp
         8kBGrmF84ko87FHaviEGcaRh4h8k0TgiLu/2saZBG+Hcvh9k4TVd7Ry6ggFeDy46fK1R
         ywB+vLxzPJrGQU2mq3HTe/unfxqFuW6wGyy1nB2UlDdWjuNW51xojybumkY//PmurHNE
         nDw83g5Xu1KHGV2XfKjknX6oxPb0OlSpZ2Wk+F8c4heb4EzQ5QxiUvIGNiFAfCdN3lqB
         RXtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176206; x=1781781006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=rt6DMeBL0nxdbQIasf3cFFR1s7l2ZZRSwZIe2pfO3kJbWUmTXDNKdJckAFjKsuA7H0
         k69AkX4cfdR2IF5FFp7dFJbHJHMyNUzgvH3fW35yOCok50GvtMOYlfYXahlQkPbLhwO/
         6eTjVimhKOg8JWIulqSchcFIeCcv0SVs1YIu0aTNlj0LQ2P3BY4KOQqdwN3ISaUiTZhi
         09PwP5UzsQTIs7LlfXeHDyrAZTktNfxEWRD2UOPIF3Q2sEdo94x9JwydbIeX6aRFA7bJ
         1NAMf495ntiaEP5I2TfIJeyUg9hOKD8EfFZ6u0mBg2AWEwkd/U0N/JxCQou6AzvyJXwf
         WV/Q==
X-Forwarded-Encrypted: i=1; AFNElJ/QKLMgrtlNeCi4svKfiKeE3kxw8vwYFYX9TkvpKN5MHev97ihtJw0XdN+WavMYvwIwFalKNghzfmNsLA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxtQvKFcd+B0pNgIw1S47ePSWrgjc5MfrUcfMJt3S+DQiYjCwJ9
	Qjwq12Cmk9CpEq8NslXbQ/bxpTsCLP5c4VWLuAiGB6fu2PIPgE9n5h9IHeYQRvov3Ab1m8YJJ7t
	8mPQykaFshJHL0apOcA==
X-Received: from wmqe21.prod.google.com ([2002:a05:600c:4e55:b0:490:b058:c623])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:ca59:0:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490e561ee97mr20621955e9.25.1781176205567;
 Thu, 11 Jun 2026 04:10:05 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:04 +0000
In-Reply-To: <20260610162433.923550-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-3-lyude@redhat.com>
Message-ID: <aiqXjAPQCQ7POxWS@google.com>
Subject: Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add vmap functions
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 10, 2026 at 12:21:29PM -0400, Lyude Paul wrote:
> One of the more obvious use cases for gem shmem objects is the ability to
> create mappings into their contents. So, let's hook this up in our rust
> bindings.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
