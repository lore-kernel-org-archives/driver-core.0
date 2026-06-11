Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E163CC310
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 11:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176046; cv=none; b=HtsvmmmmG8id+8ZwXb3MZ0f4m5b1DipnUCHXz8waHN4HauUnMUa4a7AZrPPf4RrMQlqiZBVP60a/VT0pCv48AwTxyakXhZU7vq7bOHc6I4RMB+5RUqKvR4h53gR/WAiNgBiXpK6VvP5MK9QwBAJj1r0MFVBH0DKQ3SSWzrUyi5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176046; c=relaxed/simple;
	bh=La5eLg+856u6yb2356E19wq4qWMjXt4WDF8YAZskR9g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=B5qIw/b9eanYDYonyCnHabPv5UVSOAGag52FwRLE+7dkwRaVrohRy8zqbPev4YiT4XAR5L5wFXLVQPVZkr6Nm/giprXeAALmvPSVINFbMP89QZ9dQTck0k3kJEjY6xVGGCtZlpdO4b2vF7KT4Vz1t7Zfx4b7FsugtD/2uOGUY6A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DVd3KiWP; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DVd3KiWP"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-bf5ea9d13f9so521557066b.0
        for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 04:07:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176043; x=1781780843; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=SLWe+2FcDOwhw41u/Q69O94pEc+gWeJDYXa+4qvlFG8=;
        b=DVd3KiWPmY9j8C5nh35Ky+pWEQmLykFGLaz9vIiH9kmvnYDLwa6Tzs9ooxDgIAkM3T
         HEbQOBkACatf9s3W3YO/XQ49DORgeZs36M6pqsneqQHHzHpKAa7Sw1plcuLJ6lt1LzRo
         a0Fjhj5kepqm2MibcVw/VSX0wYCVaRtO755wpuYdUi5G5eAsTJIT81G76MgAsSUACEeX
         pAfvuPYSRZ1OSVUJuzQv9cPPvKbGxbJYQbqO2IYAHhGLDKNiO/6MSkr3T6tlSg1NKh+X
         ZK94lT05aixfh74X6739zS9VWGR0nwOe8Z3hzpV24NtDYed+t8PtB18c7H6zeZ3147Dr
         sMbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176043; x=1781780843;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SLWe+2FcDOwhw41u/Q69O94pEc+gWeJDYXa+4qvlFG8=;
        b=g6PXzHik8W9c1fd73GC01BQ9+g+9ZF4O5ulkRIk5zjwTwfdnudufRcKGlgrjeLGjAj
         Y6WVTeX9Oh/ue9fsTYVZsfc7bcC6tDWjd5IiNajK49W0OtI8F3fBIYcjDrdT3qoNEpx5
         Vcp2L992Zu/JykCReAxESYYfxzeoetJ304z2p6hJyhcFPQfz/2xbXHa/On3Qsf+4KnxR
         TSt2DoNnENVdMxRrl3NHCR/qCCDw2oNI9IlBfmG2rtgxVgcIGdWrsC9DRXVrdF8lbR7M
         CZzrS4N8b1hdHfmCY+/TU5rbULHXdsuoV9b7TcdtYQ/T24rDtH2vX1N3tjzknmOaC9C7
         ruuw==
X-Forwarded-Encrypted: i=1; AFNElJ9PcQXB70V8/ld9IfMWz+zwupKhjO7xutospXfrw8Q6/lfVPIW0OGpcNv9Y6jyDzr7iFetaDsZwbr6IGw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yyiw64+vsomdpaEoXijd2TrQ0E3J/YFj2G/+F6dGhiJOIR6iREu
	kqEDO1Gi/WxC75IaNAR/9lmyZdbWqBRkhAbAUM23pNJKE/Y6t+mz2HccQtBlaTNChmNIR1aiVbn
	Pr8fvdM9Pd2O79fE3Lg==
X-Received: from ejad6.prod.google.com ([2002:a17:906:406:b0:bf1:4fcd:aef0])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:72cc:b0:bdb:4cf3:7035 with SMTP id a640c23a62f3a-bfc85745bd1mr113064466b.4.1781176042458;
 Thu, 11 Jun 2026 04:07:22 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:07:21 +0000
In-Reply-To: <20260610162433.923550-2-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-2-lyude@redhat.com>
Message-ID: <aiqW6WcagiyiOAKZ@google.com>
Subject: Re: [PATCH v20 1/4] rust: drm: gem: shmem: Add DmaResvGuard helper
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

On Wed, Jun 10, 2026 at 12:21:28PM -0400, Lyude Paul wrote:
> Just a temporary holdover to make locking/unlocking the dma_resv lock much
> easier.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Alexandre Courbot <acourbot@nvidia.com>
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
