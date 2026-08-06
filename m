Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10B6E1E5B68;
	Thu,  6 Aug 2026 21:25:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786051516; cv=none; b=L3ael7wrEWkLGFWL+D0uDbH8BJyE44KImTjrgNQJdR0vXrJTm6izmk+d/h2jmH7qEkwh8cg41V/ippcnBjuv/hWD+8JnBUarTFzVVgDkofTkhUxPdwr0bhR9x7YnAz69mc+2+VA6sSyM9CpJk6jp8Q3EISkLHEcxXXlw812emAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786051516; c=relaxed/simple;
	bh=N8VRQJ4MkIfpnTQiIOscelHCVRy04u4Y3F620KjCqaY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=gJyKeawP27n0AWlF3FxOiyzB/1yXWHCBa2Cx3wCi21Eb9YVkyLOpYPPASGh17LmlPQnZIHGrNat7cJR+zk5fpMnYw7MSq+zINGIkdnhoZADFIsQFs7oxOZ33+JfTDEf2IEGYflsFG6T2bK8nhyFEknANO5WX9X0YjTI1OCH2ZoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OhRr/xNG; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OhRr/xNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D15951F000E9;
	Thu,  6 Aug 2026 21:25:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786051514;
	bh=3tceK2xtNlYhOcz6OaNWtrjdb7u3B+Z01jO55koQw/M=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=OhRr/xNG+ECcrQHdUYyPQn2zb+sN/O8z1e9koTN9fa9P2ILDYNnf3Hoy3BVlKUoMV
	 r9ZTn4iWTqFuBzgLR/qCDaMaq86GcYxNdF2jIHz+RGajLmmyN9YHvqIqnPVaKUtVCT
	 1KPiAsLL2zBNhH9PcFRyua/CV6C5FvdE7ssOSagDqwd9lpaBbXAC17yO5Cq7CDeQd2
	 XDZqC6XukbeUV6tPvxmYOjtu1eXY5yV7fZlGmu4gyo+HSSrBDspFDZL0ig+QKoNzHl
	 vJASPkFYKk4Tuku06FKXJyo4GZD5ZGizIRzKoNaP5YCnqe77lpK/1ZE/rHPnx5eRkH
	 GtP5vAbp6M8IQ==
From: Danilo Krummrich <dakr@kernel.org>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	John Hubbard <jhubbard@nvidia.com>,
	Alistair Popple <apopple@nvidia.com>,
	Timur Tabi <ttabi@nvidia.com>,
	Eliot Courtney <ecourtney@nvidia.com>,
	Zhi Wang <zhiw@nvidia.com>,
	nova-gpu@lists.linux.dev,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/3] gpu: nova-core: falcon: use I/O projections for DMA transfers
Date: Thu,  6 Aug 2026 23:25:03 +0200
Message-ID: <20260806212503.3119449-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com>
References: <20260805-falcon-dma-projections-v2-0-4cc9f3f13ee9@nvidia.com>
X-Patch-Reply: applied
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On Wed, 05 Aug 2026 14:01:44 +0900, Alexandre Courbot wrote:
> [PATCH v2 0/3] gpu: nova-core: falcon: use I/O projections for DMA transfers

Applied, thanks!

  Branch: drm-rust-next
  Tree:   https://gitlab.freedesktop.org/drm/rust/kernel.git

[1/3] gpu: nova-core: falcon: remove unnecessary check
      commit: d1dc8faf1152
[2/3] rust: dma: rename dma_handle to dma_address
      commit: 91645a52ebf2

      [ Rebase and fix up build failures due to newly introduced dma_handle()
        calls. - Danilo ]

[3/3] gpu: nova-core: falcon: use I/O projection to check transfer bounds
      commit: 4c9ba407018e

The patches will appear in the next linux-next integration (typically within 24
hours on weekdays).

The patches are queued up for the upcoming merge window for the next major
kernel release.
