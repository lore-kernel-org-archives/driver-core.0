Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B9982F8E80
	for <driver-core@lists.linux.dev>; Thu,  4 Jun 2026 11:58:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780574295; cv=none; b=PvA6mzHMLZHpBqDFZE76tTCRNWCagOD/OyLGqm+Q59fikYpgBQrB2+NDk62pTxEosfs8pniNC5FF2Oe2mvXjBVW1LZiTyrqC2M4MZYjWIeZh7DvVh0SI5Q7jwOksYDnR9KJ1RtYKrQO2qWulnhlaj2Z10HvPd5S3QsQEuNMX5B4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780574295; c=relaxed/simple;
	bh=UVIqVMclZDr4qxCyNWMZ/qWloEXWIhQNsmxjFg/How8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=fqGqjxy4xenY7lcb3eJmISm4YATsvWUhiAvLJyL8RrRxmpiKq5jVVxVpgMp69jA2NVPhnGKW+eCAuVzz81btRQX4TYtXb6b6NDBA9Ok0uPBOMTkPAfJIFUxMWGoYvd0TXyrAI8DvOoc2dNx4tvTh13ZgXmGXUDaSa+YtvSDJi6o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mJsZRgzn; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mJsZRgzn"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-68d2339febdso930527a12.1
        for <driver-core@lists.linux.dev>; Thu, 04 Jun 2026 04:58:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780574291; x=1781179091; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=mJsZRgznkazDxCFnxyoDyaWdIq3F4E9vYOwPf5zJvY+54zf1JNS1L5k/i3htMeIdSf
         FRW2yHmIegxBkeZ9LG7Lgq/cGDStTS6FzqCHPSOSuE24yrNSjNgWaHld5UqZnLzt7NgX
         wKb3/y+uJU6SUgTqZgmneXsSw8IPGhcT0jr68HBDK8L71t6IqkVRbWwbPQ6sF1y/PGNr
         3K6AyH02B5o7fP1wqJp9h1q1q/EhsFi8W3q1gmsEH66Bk8jfr1wHjMymivIvldjDdIqI
         Zxb5Hb88RlBY7n6sMidQPpEwLEe11iiBGInMBtIJqjsf0Da36QQEioRejUoEIWqp2SL2
         C5/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780574291; x=1781179091;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=tsDBf51o8QHp6SAQ5/8ziLKktk7y3LjUQBohqdmyxqM=;
        b=VqIKlBwk7yxP4AhNUT73nTUNlhSsXRiIFp+wnG++UJVZxG5Ed3QGRYmTtNx/ASXfnd
         gaZUhWylyJAAxxZMJbQhdrHCOJkAJGQuW4w6F+q2mVuxZO1HAZkIaF+jGLhTOShRt902
         J8uqW66citDqI2ShSSSYftlwRr9Faed2zuluZ6z7ukg/K1Ht70xx6xv+khRdiBzpXdiq
         KYno+4767NQarMYizJymHWtkVucDf1Ix3F0jNfMsRx1VvGAMRvR7GuXmGlSVH6emNp57
         O29cVgwdANe2iL5FSD8AvACvmWJDzBf5Tk5+c2d6lPlW8REKp7rTqIX7aRPW47ERhiwq
         ytAQ==
X-Forwarded-Encrypted: i=1; AFNElJ+lkZYw2qZ5gLYrG6wYJimOqumGk4FIqBGW9q7ZJodNx9AdzOzxcVtpf4SIHqNgjLCWV1AH+DJlJqBpDQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx1iCzWcLASgX+ruB24b36wqe37f1wpTUshBp3WP205Kf4ai9d9
	XLju0qQAG2cl/pGuwwJzTHkDrKa8pHjSmxtjX/uFDNjRiO/0gg574Ch+If1iuyRGfjH8NHrZ1J5
	lT2Nmar0ag+URfR9NLg==
X-Received: from edrm6.prod.google.com ([2002:aa7:d346:0:b0:68b:163d:99f3])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:27cf:b0:688:1d5:44c5 with SMTP id 4fb4d7f45d1cf-68e6f79352amr4016032a12.2.1780574290900;
 Thu, 04 Jun 2026 04:58:10 -0700 (PDT)
Date: Thu, 4 Jun 2026 11:58:09 +0000
In-Reply-To: <20260603195210.693856-6-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260603195210.693856-1-lyude@redhat.com> <20260603195210.693856-6-lyude@redhat.com>
Message-ID: <aiFoUauWYLz-Oyrx@google.com>
Subject: Re: [PATCH v17 5/6] rust: sync: Add SetOnce::reset()
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Maxime Ripard <mripard@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 03, 2026 at 03:42:34PM -0400, Lyude Paul wrote:
> This function simply drops the contents of the SetOnce, given a mutable
> reference - since that proves we have exclusive access to the SetOnce.
> Additionally, update the invariants for SetOnce to make it clear as to why
> this is safe.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>

This isn't needed, you can just do:

unsafe { (*this).sgt_res = SetOnce::new() };

