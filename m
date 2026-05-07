Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3F143EE1DC
	for <driver-core@lists.linux.dev>; Thu,  7 May 2026 12:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778158263; cv=none; b=P3Syh7OcK7HHUMvdT3wP0tHq1LGgZzQc8ks5Uu2EDlOgqGMoJL22F25ZAOUjYgOOQeTdi/5j9Azvyx9wzWSwlrFlmXRswCqlO7QrN7YfHi+3VuQeRhKUsu5lXITqUurdykuMHFnQjQh1TIJvmqK2oQOF6cZU0VvBPXKMSjLz01A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778158263; c=relaxed/simple;
	bh=h3Vlkbk5sdnGg13yM94cBpckZTupKbTqjZZ6gANaolw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iPJ4kf1WHobHB6KB3pztFBj3Dxj8cxFDHZ/r8LtJ0fy09cKYTK+NL8luI4YuPmCssOH1LQJx7ggPfbuWfZJqOolDfqwHUUcKqjemaRZC1lV0Y9wmtOTfOFxZ7Tx2p7dfX7eHyVQJvAVgFdkIoYvawQ2S/d7GcKIQL0avPFMwxDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=h7WBMB17; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="h7WBMB17"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48a5952c635so8304095e9.2
        for <driver-core@lists.linux.dev>; Thu, 07 May 2026 05:50:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778158256; x=1778763056; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=B8srcPUz2iRMxUgzpDjJPZ915RsxNlRqzvXbEly4DTQ=;
        b=h7WBMB17bwvjjC6S5qtTrB2xLInyRv/j6NbIakHN0xZcMUpuRDYgIKTo9u/1R3TBMC
         Xa4PHfhzj/dMJu5wUplGmPvFOefQ9AniUGhXlDMAQY9c6r2n2koBCRFWhb97PbAc/int
         V/gTstmPlNMfoj4TQsL9OCRhQ41tTms6LjEBRpmZ5AOFJlyTB8aPW9wR2730R3XO8OHC
         LHW2QO4HPYcsxG7I4DAvJm4w6fp5dztNwVduEjEHheWFSMA/bZefutwHqJng+5X0vzFs
         f73G+xWEl4llvXHwqO7Xb8FioVBIZCz1uGzc/VisbRszfhXdtEA8c0p03oYA2FU6uxSa
         GdMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778158256; x=1778763056;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=B8srcPUz2iRMxUgzpDjJPZ915RsxNlRqzvXbEly4DTQ=;
        b=VNtK+thNRUpNXi/Wp1B8+MHu/VF8aJzmrmWgUEuvlhVRTICRAupoSu8c2VOUGVv536
         6hZQM2alxsX6N5OmHeR9EUtDIeJxiguzRJ+C34ogkF4+96RSW2OQvI7kv2uSjSGbqmZ1
         s7sQUqn/Gp8SjOvzBlyFws6FJiTR7npyw0h/uBJPZFxUqElfFGh1PrB5CksYP2B9/xpf
         TRQ4Vlbr2jGxS4XF4KEGDZGukT6uOWkvWCWUSerQvh3rRdqvnxZep94ffDEBs6suwoPG
         kDVypTTQksdpRibB8xIuxTlbAhfkGeXq5eJDV+9/7aLyxuF5wCIyPY8h5u6+4yngvRZ9
         9PAw==
X-Forwarded-Encrypted: i=1; AFNElJ++0BVzThHaUFRHF47UWc0DoQGGeLL40J0NSnBqKBg9e7zf+xagvKQOYC/YmUzg9sI52jiKSqBai/pt9Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YwjT+KV8lYWXRA7RzkAn6FLhjOKCifYONmt6cdLX7i+0PwhZ8p2
	83ksllJlVMOyF9KwI6SJQWjGnVdINi4chrxezrr6VhrWYBFjnqG3ZIv9lxFuJrS6Sfbh2Ca/Gr1
	KMNDqIvxW+Ulorhf/ug==
X-Received: from wrpu17.prod.google.com ([2002:adf:f891:0:b0:43d:70b2:d297])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3f18:b0:487:2671:fb8f with SMTP id 5b1f17b1804b1-48e51e19668mr127556795e9.8.1778158255465;
 Thu, 07 May 2026 05:50:55 -0700 (PDT)
Date: Thu, 7 May 2026 12:50:51 +0000
In-Reply-To: <20260506215113.851360-4-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260506215113.851360-1-dakr@kernel.org> <20260506215113.851360-4-dakr@kernel.org>
Message-ID: <afyKqwxDxu3cT7U9@google.com>
Subject: Re: [PATCH v2 03/25] rust: device: generalize drvdata methods over ForLt
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: gregkh@linuxfoundation.org, rafael@kernel.org, acourbot@nvidia.com, 
	david.m.ertman@intel.com, ira.weiny@intel.com, leon@kernel.org, 
	viresh.kumar@linaro.org, m.wilczynski@samsung.com, ukleinek@kernel.org, 
	bhelgaas@google.com, kwilczynski@kernel.org, abdiel.janulgue@gmail.com, 
	robin.murphy@arm.com, markus.probst@posteo.de, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	igor.korotin@linux.dev, daniel.almeida@collabora.com, 
	driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pm@vger.kernel.org, linux-pwm@vger.kernel.org, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, May 06, 2026 at 11:50:39PM +0200, Danilo Krummrich wrote:
> -    /// The type of the driver's device private data.
> -    type DriverData;
> +    /// The [`ForLt`](trait@ForLt) encoding of the driver's device private data type.
> +    type DriverData: ForLt;

Associated types support ForLt natively.

    type DriverData<'bound>;

Alice
