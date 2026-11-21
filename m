Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290086;
	b=3TUwYhgMVKEd4MUYg1bofiARZN67pRQc4gSzWs6FueTM/4KkQaPOZ2omOXTXuY3+//CE
	 NA55BctjAhhQBAT2ionolDXhD3UcFRz98D1Xw8QzawAlrF86+PRyUZCjH2pxGtcrlh2tk
	 GEvFmzmZA1fHyd4zNcti4jrGx7m5lTqKCcgptROY/hThZ07NJjb25Dd8MmEB97wP/F3nd
	 fi4yGr3M3sOB4W0Ww9Qs4h1/kaKdtfD7lrCNw12nkG4AyNx72e12OI8H6PV4o6q+iWHuk
	 LfZB+qvEGCxZrh2B3SryVogXHH1XV7HUbK8TxvhDDrh53aWA6xWAPjXa8DC1dvJQRWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290086;
	h=Received:DKIM-Signature:From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:X-Patch-Reply:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=TA0IsQ5WZgrtFShBb0WWPjs6nBEnRi5bmxyzpqn+RUc=;
	b=vaumNUO+Su+zdljbwfTt57g70L6agJoEuUlfCyOkjzrOkh8Q1/fYzdtfaAdqqbqyXkHM
	 HTebaKZoiKaf74r6pAWtv9nWpGfIMqXGUO24/SJV1ql+wmVX3sunVC1+Z+H3LUSGR7aoN
	 22m2Opmd7fR0CpVMJtK12nKotf7/qVnpSBZF8qNOaz6WPWC7poBM8C6mfBJhPWtWildjA
	 HmIsqSKvm/hiYYGWkGd8awHjGAwK3E9FVibmGhRkz8XFAuE+1KyqVbe7JeBoxiMDjTe71
	 5HLDhuZHSPMs3zw2e3VhDm6ZWwEqcQgihwj6huiMg0YNbUU3BBLmQhkZvRpRVwP4nww==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJUJNVSj;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E29B606A320;
	Sat, 21 Nov 2026 19:41:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MJUJNVSj
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BB4F1F000CA;
	Sat, 21 Nov 2026 19:41:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795290086;
	bh=TA0IsQ5WZgrtFShBb0WWPjs6nBEnRi5bmxyzpqn+RUc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=MJUJNVSj2PJwn3eSV8+OeIQAn0OiG/QXGWrv1JbNfS2t0n8/E9Uat3xr3rrWJP9gb
	 KBh8YbrSWKW8Ju/m5O/vVtlM/lLgRC0OWCpBN2YBu6XcqwzJbeCVf5pgED6nMyFn82
	 fzMUFGtPbRrwIE2s1ynBmW7bjLsLqpEM5/NCR3fC181CGK8k6+3oKrGK11IxNT9rz9
	 v/w7/P6mQQqcVhfQ19sA8mbuymBT3Z/aIWC6bgGk3+IMib2ncrnIjXoptLinHba/nf
	 LEtFOnRs2svMjh/QKvVP/MKZnIjMR4xyi4XAQ8U/AgtrURyiGn0KDzlRGEmVbHge/j
	 ODOb0A520VcAg==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: doc: mark `Io` as notable trait
Date: Sat, 21 Nov 2026 20:41:21 +0100
Message-ID: <20261121194121.510969-1-dakr@kernel.org>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261019114811.1105192-1-gary@kernel.org>
References: <20261019114811.1105192-1-gary@kernel.org>
X-Patch-Reply: applied
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 19 Oct 2026 12:48:10 +0100, Gary Guo wrote:
> [PATCH] rust: doc: mark `Io` as notable trait

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: doc: mark `Io` as notable trait
      commit: 4abd139a3f1f

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
