Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9462818C332;
	Tue, 21 Jul 2026 00:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784592112; cv=none; b=DuPR46skOJTJQEowwHKhll2r+pVdU9C90CMVKwlwYNM/am/2k+2E4rgBM73PoddzkP2Yv6PkqGebXNgcEjZqC1oOIO0BRZZ6J5ibQs8pBmyQHxcajhdG1RQLM0rnQlORZOz1F1HdT6k9JVfDEa1F1Pdfk70gOdG+wJRwI6+n0lY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784592112; c=relaxed/simple;
	bh=I09kAenF2zHruG4YwkU1qkojijDdhxV0ocm4vvuCWl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=WxQXTWpCaPyOBEd9AUX2ld8k+JL/MNTWtZ4N1USW72IKEpSKO9DBDIBpdEYzFQcP33k75rEawyopd6gVsHGdDY3dGQ0hFROW0OiRbEnWbpBlX0d/gUqmDyPbBRKzkwC1HkjdMAQevalQKHWcXqtlzGzJZe6dQOg4V7wBefSPBuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCTO5gGm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCTO5gGm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CC64D1F000E9;
	Tue, 21 Jul 2026 00:01:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784592099;
	bh=W3vyD/7t60LbCA/yrBlYWSeKqmBr5qpMh3Ao4f4ubW8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=KCTO5gGm3QvfswTvqNDSICGaIFIn9IW/ZasYg8APPK4R1EBzVdqdj2S5lc4SzVnUM
	 2/kqdeBs8EqMYNdXFzZxeWhbMbPBliV3vyl2U9/Wg1WNTkukwWqhVS1Gg+P89fhWE5
	 ifyCbTWwgUKQEX6bt/hSVJvPOEnE2TMN+ersuwzbtdWn6mVuTOQUD4wWoB6HAMC0km
	 BccSEsUDH5luV8MMG6HND1yDSMj82fK+Abd+yX62hCP8RNAH5dG7wCBfzTz1NHJQuO
	 b4wMQWd6AbT3cvyz1GOPhwk6L8gw/k48aKg3tqB0DxVlpk2dd+zvOOQ04wOgRbnlii
	 g+vs4tSDje0Hw==
From: Danilo Krummrich <dakr@kernel.org>
To: Gary Guo <gary@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Alexandre Courbot <acourbot@nvidia.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	Eliot Courtney <ecourtney@nvidia.com>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: device: make lifetime on `Core` and `CoreInternal` invariant
Date: Tue, 21 Jul 2026 02:01:32 +0200
Message-ID: <20260721000132.1304294-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260713201455.640151-1-gary@kernel.org>
References: <20260713201455.640151-1-gary@kernel.org>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Mon, 13 Jul 2026 21:14:54 +0100, Gary Guo wrote:
> [PATCH] rust: device: make lifetime on `Core` and `CoreInternal` invariant

Applied, thanks!

  Branch: driver-core-testing
  Tree:   git://git.kernel.org/pub/scm/linux/kernel/git/driver-core/driver-core.git

[1/1] rust: device: make lifetime on `Core` and `CoreInternal` invariant
      commit: f7acb19abcd8

      [ Fixup the debugfs sample to use an explicit lifetime instead of
        Core<'_>. - Danilo ]

The patch will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patch is in the driver-core-testing branch and will be promoted to
driver-core-next after validation.
