Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E84F73CE0B4
	for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 09:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781690093; cv=pass; b=FOnXQTgoRkMaRmXdU+AZx/Z6Zy4Y/1dxtAoFE1Sygx3hPB/gF3dlbCegismk9h++yqsFx1by2LeW3R9iywLCGvMLikaV5TA5r5F6Kd7zMa7x+i9fF2lAd9N5MTJAqJ5I7kQLd0PcvRUfuoJvFTv0oaPf2F+nWU6QcORytXYihoA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781690093; c=relaxed/simple;
	bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ODzeDld0WEffQn9Kwmbsxs+5A+PpkVm7Vj1XthMZ7E7kHVIt5vs45WgijFw0wY2z1VU//xomS6TWa9yc5OT00jOfxnZhz9DFDgQfzS4ccpOU3Kz6HLvI38/P+V298LjaW1r/JvvSi+KM4A7vQbawz99ohXTiWpXvMbYUrFZmcrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hAacAu4d; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hAacAu4d"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-45fd464d51fso3267646f8f.3
        for <driver-core@lists.linux.dev>; Wed, 17 Jun 2026 02:54:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781690090; cv=none;
        d=google.com; s=arc-20240605;
        b=BmDhXs0/iXxWlSDqR99eb3vB9wOfP2ts+QnQi8DC4zGLKxLhp7XwSfREaQNlF7ZHz8
         5FUWTwaCQGTKRPc9x/NJ4nYWk5SHVBoPRVAuAZwvgPt3YHSnv/LV8FB6sSd/4+uNp7kG
         rPIIMz8wudhNdN3yrgdiNFK+NJMn9dPRkZq01jQh1Mys4a6T7Zr4p57lk1ukr2uXT25r
         QJKBEDJZkfN7AJ2K+yyX0x3tKUlX0dQhLTiiQcwsMezudAcFKA1AxrqaLOe9mTfj1rc/
         xmNYpMcVpB4oJpz1n2U0k+klpcnCQgsJLXx4RzJD0Cm7M5w4TyhleXbShR91mZkVUAjN
         Sm4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
        fh=PQSQ2bRUCzV4FCeDCpHeNAD8RLNdzDLSjz9L6ZNwYrE=;
        b=L5INJsoGCnApTNkTqJjjEYyExHt/zrArbA+Tod58R3ZoQPK97e2mW8FGaHQh7D372C
         kMlU/SgwiGR20NCUuiRJlB/xRT3SOm5ah6wWFnWEZbnAd3fpuVryGH6TFAdmWNP6wma7
         /iTsYHlNT72sSOvImirRhsbESvGcI56Hw6hAGOQngv0FZXWJJwnj8BKISzC/nSZzlk9P
         ImD98CrhpTBPiP+rzSS2NTqjolHvgCk4Ri3GAT5yk+4B8ZdnH6dbdQVd3lhrXWJwh6Dk
         narPb02tx33lri/3jM09dCOc5iF9B6pYTaPIrQ0zSn/BXdHTi6lhjHXOcwUWZEuhWBFk
         UBEA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781690090; x=1782294890; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
        b=hAacAu4drNABBrcGPV2wIypnlFOmzvcUhFWrCgL9A4J/MQCELmDFFekBz9A9J4PWTT
         8uHMhFMxzYGQpjPOFB4qboVXEy9IMcxSlHgWw4HphSbd6x71OlL713dLF1PPqYcqIGj4
         3F38uOtz4mkPrNIctsbTlOc2ZizXobI5XEFnHMlZKeTG7BeymPjAdlFDObXzWQTQ327J
         lCrkd1ZMXOe3ZQTU40zy9sNmeQHJlRKasbZWwqLAvqLa5I8TSjelRjm/ZEBE4BueoXoa
         HWWip175kJ1jvTh1DyCHEVP2OfBElaIdKFDv6S2uJm6BwEwr+UgKWLRRiy35B9YEwFQp
         DYaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781690090; x=1782294890;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=WKF34iFNpf0eQktLcuPksLJYduBCknZ/BznJRp3knLU=;
        b=XmAq2TrQFmzGn1MWrUEKOr/PMxCWjLG/9rIM5xPthCMrtTMtkigEZs1RZqspleGHGc
         rXkEMKinLswuRfJdU9XX17XEzTxwxSiqoyEjQJIaa9VzrQQt2dYV8Ut+ltsj7+gRNwxf
         i4WuqDWcoHhCoyW5pKFvoJukGzEcfP9981robY3F4j9tWeY6ULqsAuggUFSeCCJNQ6Nn
         h/v0yS1Ew1XOeq9cV2JMaO+c5nhHOqhy8soiLG3j2dA7peeS7m+hnnoYKpH2LZOLbmNj
         BiYW+exFBic1oupQaQw8JQDZdSEMet+6p7cHO9XM8VFuyJW9Xbn0V12UaWX3NDn86lti
         AZAA==
X-Forwarded-Encrypted: i=1; AFNElJ8hIwcKLvTG4TleP348ZKHy3D3JM8uLEQM2/7fWBejl1by9zSkIzkb+IOSyANIRV08rzsOtU0xQfuFwwQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw9JqL+CrEUaHfsELiohlgWxBxvTV9sSrCzzWUBvvUH1H0vupok
	wJQunWfEg74k1mZQu4HZ/FI1J4MiVP4TjroUfmDFWY13qDsMlRklGv766l0gvF1W/NV0NYHhJ64
	RdxSNktxAgOqqvYF2UHg8Dvh6k7/s1jzshb8Mn58H
X-Gm-Gg: AfdE7cmPGwiEMlYoMdY67AxhfeOPlLnP5W/7+1JsOzPNoCNFEn5Qea/iGpjf3Uqln+c
	8ACrsOfvNSxzvGisF+SMq4+DbzW3x33PAhrJYnm+Oo64vmM+8G0EyfU7ADNa8jL66YyYSyYGgiS
	zF2xVFA1tC06icBrjQcw9av81wjaU8jCBXNZ8pxATG2NdXZ2RErRm7YyC0luotfSz/gYgb6jSV9
	/oIenB4sTbqeC3Op0Gsqi9WYMtrchxCj/ru3KO9bz5SieqTGKAH7kgkmsrTcrPFRaMR3Ot9Hzmg
	cg0rFs3jsJOCZdHLMW6sNPcb+Podyk8VGnwWJS/Z/nN+ZI9dQlwjz20UeJM=
X-Received: by 2002:a5d:4a91:0:b0:460:f36:79b0 with SMTP id
 ffacd0b85a97d-462376a4df0mr4361735f8f.19.1781690089839; Wed, 17 Jun 2026
 02:54:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260604-unique-ref-v17-0-7b4c3d2930b9@kernel.org> <20260604-unique-ref-v17-5-7b4c3d2930b9@kernel.org>
In-Reply-To: <20260604-unique-ref-v17-5-7b4c3d2930b9@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 17 Jun 2026 11:54:37 +0200
X-Gm-Features: AVVi8CfPlpZsDlv9ciJ6wpjG8CPXMs720UTUcxwfh8qgpqFIXUpU1m_9T99wYrA
Message-ID: <CAH5fLgggdf0CM0o4Oa1VbY+y8gQxrU0VU5z_yB4GWCxnbqsFuQ@mail.gmail.com>
Subject: Re: [PATCH v17 05/10] rust: page: convert to `Ownable`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Viresh Kumar <vireshk@kernel.org>, 
	Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Uladzislau Rezki <urezki@gmail.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Vlastimil Babka <vbabka@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
	Igor Korotin <igor.korotin@linux.dev>, Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org, linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	driver-core@lists.linux.dev, Asahi Lina <lina+kernel@asahilina.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 4, 2026 at 10:14=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> From: Asahi Lina <lina@asahilina.net>
>
> This allows Page references to be returned as borrowed references,
> without necessarily owning the struct page.
>
> Signed-off-by: Asahi Lina <lina@asahilina.net>
> [ Andreas: Fix formatting and add a safety comment. ]
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>

This will not compile unless Rust Binder is also updated.

Alice
