Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401BE3806A0
	for <driver-core@lists.linux.dev>; Tue, 17 Mar 2026 06:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773730344; cv=none; b=V1wkiVVrekguk0rNRFVHyyCFkxJqiPUnybGLcqkUDdRw+hNXalfdPJi5Da5H8v2bkP6QkXJFhm6P65PKY344g6FLj6CbPWjoCvPaZuChAzER+3xU3EWRXLY1jieoHX6BDCXwyfNfPMCm0ia0HA4yQRhoG8XWiHh6O5sykxXXv+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773730344; c=relaxed/simple;
	bh=3R1SS/JCZM/Lfoc9w7kAsHUSiEC8aTlug28cBDnn6ZI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=enco7/tUbrxCIn7Uy4ew6ysnQQnomfKQDIbr4LCoP2p4IITTXwNf2ZNXoEi8wtUkD7JBzL+2ALF1xY0Pq+tvP26UflbQMe4ts4boYCuNTeNi8NveTD6rwm5eEN71q0UA8Dnfku30iKUxTbxxTOQ+KP1PTloEtoBKd6uyut4KoD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=XpxW1DdX; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="XpxW1DdX"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-660fa747a8aso4791910a12.2
        for <driver-core@lists.linux.dev>; Mon, 16 Mar 2026 23:52:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773730340; x=1774335140; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=FV64adRB9qOuDZltuxVkHORmf9URma8WDk8N3r49JmA=;
        b=XpxW1DdXpzyTOcUDAxLMvpgIpCIF0Y1NOJJ+fTbjjVwxyw1KNfpJXROuaIhq2IloCx
         HFMRhZyH+ntRSIgXMu5aHtuWwiuivmj86UmTe6ULP9FwSnfMBZqhkhawyIGiaNgPWRZR
         Mgn1pYBsWOvrS76TpW+eHuz/Nj2+HiB8YgJUPVmJihh/8ugOWWk6Q7z0moZmR1jadmq0
         ULJq5473dX9FBYq2I3rzg7feUj64SuisyPcoLuifcbhthrZNktbasI2Lgnfa8lXxrjEK
         Nf8prAG5Oyav9gxmeYtwAux/xXkld2c+H1iL7VDYIQQlklJWQvdZ2ZzOmR9BqC5U/8Hn
         vznw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773730340; x=1774335140;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=FV64adRB9qOuDZltuxVkHORmf9URma8WDk8N3r49JmA=;
        b=nkBzlKOpbAVn1lyqf6oIOhy0GWEH5U9i3/u+l2GNoPVI9FGpCO/ypfO0yelkhay/hT
         Xk2/XcSjcGwEyHt3jq+Z8QieGc7vA3YOeBodere3k9aeiMp7vyNUVpGNncHZ3nLV6wZ6
         8y0C7lrkiSkdTPREcosT2MSzz9XiStNOCgNgpeyNmdcXDrmqrt2O3X8EdgRjS7iqbTVQ
         PYiu8mF/2YeGPn6gkXOxSrJJM12lH1B8KYiXAkoqXK6tWRQxUMiO30oJYNrCOZsOox3e
         tzvjrpLuWQY3IMrgPo7oQAnGO3/jENJAMkPKF7cTMxNre4DrQ8kXuqwfgvB2MqyDvTmD
         nqaw==
X-Forwarded-Encrypted: i=1; AJvYcCVXxNxLMr4qPqmmFfMTMJ5H1iWKfqfHGStyt7zy9DyuHGp3mBqtCzyZhD9sDaq8Vw4B7x+BgVK33GJBGA==@lists.linux.dev
X-Gm-Message-State: AOJu0YyHgDBMndYgNOr4wLOsy6zJOZ2UxtCHOySZ3s+PYbiYfRQcK9Vu
	Z8JAdOINnWZGOwf8sg96Po22ori7HyGwAEIO/YftAnrxTpxCp45f8xP4F4pj/HaEpe4Ilmbjkc9
	J6J3aFehS0pmhLmkEEQ==
X-Received: from edrd8.prod.google.com ([2002:aa7:d688:0:b0:660:cd0d:914e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27ce:b0:663:8841:17c9 with SMTP id 4fb4d7f45d1cf-663babc44ecmr8734757a12.10.1773730340157;
 Mon, 16 Mar 2026 23:52:20 -0700 (PDT)
Date: Tue, 17 Mar 2026 06:52:19 +0000
In-Reply-To: <20260303162314.94363-5-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260303162314.94363-1-dakr@kernel.org> <20260303162314.94363-5-dakr@kernel.org>
Message-ID: <abj6I9c_2IR0cKJ6@google.com>
Subject: Re: [PATCH 4/8] rust: dma: introduce dma::CoherentInit for memory initialization
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: acourbot@nvidia.com, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, abdiel.janulgue@gmail.com, daniel.almeida@collabora.com, 
	robin.murphy@arm.com, driver-core@lists.linux.dev, 
	nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 03, 2026 at 05:22:55PM +0100, Danilo Krummrich wrote:
> Currently, dma::Coherent cannot safely provide (mutable) access to its
> underlying memory because the memory might be concurrently accessed by a
> DMA device. This makes it difficult to safely initialize the memory
> before handing it over to the hardware.
> 
> Introduce dma::CoherentInit, a type that encapsulates a dma::Coherent
> before its DMA address is exposed to the device. dma::CoherentInit can
> guarantee exclusive access to the inner dma::Coherent and implement
> Deref and DerefMut.
> 
> Once the memory is properly initialized, dma::CoherentInit can be
> converted into a regular dma::Coherent.
> 
> Signed-off-by: Danilo Krummrich <dakr@kernel.org>

overall LGTM

Reviewed-by: Alice Ryhl <aliceryhl@google.com>

> +        let ptr = core::ptr::from_mut(&mut self[i]);

&raw mut self[i].

Alice
