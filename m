Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792770024;
	b=PhDu1sqTB7HhUjuY/2W4qut2njjVwJ6q/AIvPWZnii9gErm7ZbR9t7tNdyYY85QHzrDS
	 vu+9ezfADIJkQ97cjEHTyWVYTu1CbdVQkjo7lLY0uVzgzZzewR5gJoEwqVNZTtzVQe7CA
	 kUBci9C8acuauIIQiWayOzHfsYLrLgaOBVcaQrbFkpv18bMVSZ4CNFpCkoZcKr1tz4Sbd
	 u94EywE5kASNlucm8qUYXscEKk8Rk9KJlDZzIouHSu9T+CzDDmjrC77TGthcocaSNo2kk
	 LYqxblboEIfBHFJsrkO97OO+z7x9P/HuNuKEJ2aJYOHtIRAoBjxaON0x0LYK6N1nnvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792770024;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Transfer-Encoding;
	bh=IqXxdEe3OWtFQ+kMymyWqIRYYmuFCNZmw/zAFNdo3bA=;
	b=Hzn41dek5vaYy2Xm6nyWWYkR9+ARvN2UMvjmuU8rDVHVTh6sb6WdcQs31KTFZjoqbMw9
	 arUVC8ich6FNoFXk/FQ7+ug0AR0hf5staq+2ZTqyJyDMggSiQpwwfSzv18JrQfdiGp6rM
	 97ReehOPrHTIQlcP1Fii9i+uvWxlpXCB+Zm558JmEfYrBqohlAYBISrdWexK8opDveCSe
	 1SDdlLbkfl8ZtP1ThKrqhw1oN5dB6+AwbN5yyGvVIGFG2syb5LccwdLp4/U1NKGxqt69E
	 UY1/AD3xpb0mYn8zvNL6C8SOwnwGfB5K9L6YwHWbC7TJCHyohJhs3/u5G9kZLcbg4Uw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="Ufc/Xseg";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 871E5606A31D;
	Fri, 23 Oct 2026 15:40:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Ufc/Xseg
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90B4A1F01825;
	Fri, 23 Oct 2026 15:40:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792770024;
	bh=IqXxdEe3OWtFQ+kMymyWqIRYYmuFCNZmw/zAFNdo3bA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ufc/Xseg5gmxQnMHQhhxe3V8gjth2Pebacg73s5CWx+9u/B2XEwFHa2ceGm8DyFNF
	 VmTmlm/1fQtX82eKb/3HoGLpIlAI4mKqJkFg1nEEWaKYMLsUJOOH+yQ7qMkpXHaEW6
	 YbLQhGp9kpLIZhvqdSHTix3k68dDAIjdCqzTsUXqLlpNUL3Ol6U6lz9j3rexiItJR8
	 G+lEgIaubIRpBVWJzaEFqekDT7gWZnq5C1zHYiwVu7rXwpsy27eL9tzI2yR+61CJ/h
	 D1At4ANheVJyLKMfIrPaJfnM82pWjK8BdXqOIOJZZhZGsKzqrbEwSOfzoS3+Q7ZJPB
	 9J4lmVjxuCaIQ==
From: Miguel Ojeda <ojeda@kernel.org>
To: ecourtney@nvidia.com
Cc: acourbot@nvidia.com,
	aliceryhl@google.com,
	apopple@nvidia.com,
	bhelgaas@google.com,
	dakr@kernel.org,
	daniel.almeida@collabora.com,
	driver-core@lists.linux.dev,
	jhubbard@nvidia.com,
	joelagnelf@nvidia.com,
	kwilczynski@kernel.org,
	linux-kernel@vger.kernel.org,
	nova-gpu@lists.linux.dev,
	ojeda@kernel.org,
	rust-for-linux@vger.kernel.org,
	ttabi@nvidia.com
Subject: Re: [PATCH] rust: pci: add resource_flags accessor
Date: Fri, 23 Oct 2026 17:40:05 +0200
Message-ID: <20261023154005.95904-1-ojeda@kernel.org>
In-Reply-To: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
References: <20260908-pci-resource-flags-v1-1-269f29f81de6@nvidia.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, 08 Sep 2026 16:51:48 +0900 Eliot Courtney <ecourtney@nvidia.com> wrote:
>
> +    /// Wrap a raw `c_ulong` value returned by a C API into [`Flags`].
> +    pub(crate) const fn from_raw(value: c_ulong) -> Self {
> +        Flags(value)
> +    }

In linux-next (next-20261022), on UML x86_64, I am seeing:

    error: associated function `from_raw` is never used
       --> rust/kernel/io/resource.rs:240:25
        |
    216 | impl Flags {
        | ---------- associated function in this implementation
    ...
    240 |     pub(crate) const fn from_raw(value: c_ulong) -> Self {
        |                         ^^^^^^^^
        |
        = note: `-D dead-code` implied by `-D warnings`
        = help: to override `-D warnings` add `#[allow(dead_code)]`

`kernel::io::resource` is always built, but the only user of `from_raw`
is under `CONFIG_PCI`.

I hope that helps.

Cheers,
Miguel
