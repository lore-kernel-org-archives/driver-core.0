Received: from mail-ej1-f74.google.com (mail-ej1-f74.google.com [209.85.218.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 274EB43CEC4
	for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 11:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781610632; cv=none; b=pTgBOLUsp8tPdYZopW1p/uWHWGoTel4CH4vVzlzJEWBEYr+wt+Muglp7iMPEwlyjyw/l/HE5b1TEEC2Rpp+V1YOpEqeEJIvjajaPJpsPHxsoDfjECHtihLa3fu5Js51ESU4lHxtVdUt0q1SFRfrT39FivfizkeGWwKWkS6dYe3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781610632; c=relaxed/simple;
	bh=TObrEHhKuPNM42P0oLKIGdOx5sA4x16gAm9/x6UBmOw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gSzP4vtn0LXY670dlhaGW7+oUc3zc88JU76ANViT6N+F84amiw/cs4fboveMP8L/V2eW6CdEZibc4s8Rl1bxv2HkfYgv4KgDo+9dBZxkqbnyUZmwJ9/HihVqLm8uuZrJezIi2WEB1Au/ZFCGutf86Q3u1rWmE7SqjMFvUCy0Rmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wF0OmHg/; arc=none smtp.client-ip=209.85.218.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wF0OmHg/"
Received: by mail-ej1-f74.google.com with SMTP id a640c23a62f3a-bfe735f3bc5so381906566b.1
        for <driver-core@lists.linux.dev>; Tue, 16 Jun 2026 04:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781610630; x=1782215430; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=hcH8wbzZOm8yn4lLoAkAwb8V6hZltU+bJ+2UV9XpA9s=;
        b=wF0OmHg/JS4trFoh7ui7m0OjJCHk4qnhlyHOrseH1GPnJ5UKj/q2ZPBsGhh2bPPhnF
         wZF9s/08cJvCF5NrZe1XIiQaA3HE36j5Ih64vqBrEFnoF8VkBjgrGeurnrw7Q4WIsQQi
         vZBFayswbhJCy+Ochd9WBa0gcC5/ZxIbdrg+sVUi1zKF0pbrZ4UZV2WIbxJGEoYiYWJO
         3niLHhqwH2kIOCBlEwdo1PUn95q6dR1GhhhSBtLgVZ9Mkfcas8lsHxhAzjRFueoeQfC4
         GCwNSrYCRDPfxIhWJ0NpxslT5zChuR2+ex4Ydv9sBXBEs7Gbca89QN0z43suKYQ1U3+G
         KfoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781610630; x=1782215430;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hcH8wbzZOm8yn4lLoAkAwb8V6hZltU+bJ+2UV9XpA9s=;
        b=bebjbxqz9u/y0/hjbvl6FOil1luhaKqUnuytZ0mGgk1gt6dCNo1oK1VcNHn2hDY8iu
         QgN8uXIeOlJAhoMq1373Qn80Tx01Q7sShN0zMMX8vKZeMH1boifdBwG3rVg6DoKmdiV9
         Kwt6evJHvJgTTBt+EHCDw6U/e6DjeFOxm7Yn7vjQyVl4pZ6FBgs378bkR0xZS//vM2ZL
         6rJ27c5Gm1OKb08xx3F0lTtT3c8klsZi0Klz4dEn4E7mdzEqjewJLiW7/Ujct9Cy6cPY
         1cFBpcF5U9vgGFP+NpUnqJV1MtydsFrw0PHWQivxBKLANzvomwNuKKxhexmMrhiRXiHu
         DRsg==
X-Forwarded-Encrypted: i=1; AFNElJ/1Nmvy5jq0P5BksWsKNu/Ikgcv8piQ/VMmzE3uCwWswOGxXg0NCZ3qmZtmiTUYPbwaN/e9XTXRaHjoJQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YwUvEunlGF3LYmmdKzf+JBIMfQGQQdn2gmM0vSv7PkMU657WllD
	3HhxiEY6SjOlVutkhinAesqacejFxMuMRtUfupRoHaNjII/6RojsORgRdcgzCCwwx5T0WYZfdY8
	m+HjMLB9aEaTkVD4j3Q==
X-Received: from ejfp18.prod.google.com ([2002:a17:906:e92:b0:beb:c99:aa2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:1dd6:b0:bed:9a7:5ed1 with SMTP id a640c23a62f3a-c043a477df5mr130254166b.5.1781610629337;
 Tue, 16 Jun 2026 04:50:29 -0700 (PDT)
Date: Tue, 16 Jun 2026 11:50:27 +0000
In-Reply-To: <20260604-unique-ref-v17-1-7b4c3d2930b9@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org> <20260604-unique-ref-v17-1-7b4c3d2930b9@kernel.org>
Message-ID: <ajE4g7JsM6bnpEOu@google.com>
Subject: Re: [PATCH v17 01/10] rust: alloc: add `KBox::into_non_null`
From: Alice Ryhl <aliceryhl@google.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, 
	Serge Hallyn <sergeh@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	"Krzysztof =?utf-8?Q?Wilczy=C5=84ski?=" <kwilczynski@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Uladzislau Rezki <urezki@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Igor Korotin <igor.korotin@linux.dev>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="utf-8"

On Thu, Jun 04, 2026 at 10:11:13PM +0200, Andreas Hindborg wrote:
> Add a method to consume a `Box<T, A>` and return a `NonNull<T>`. This
> is a convenience wrapper around `Self::into_raw` for callers that need
> a `NonNull` pointer rather than a raw pointer.
> 
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
