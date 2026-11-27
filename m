Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795795935;
	b=MEYkJ7tKA0hnn9RvozvDavvai+QvY9/CNI+o8iepxaqOe7XuF4xwqUFgq7KKX202N2lP
	 pykgn9gphoisTaOQsHcj9UHSMZJIxhC1PtjlR7oUZEWcJBzMAe75fwTyIfqGxTfQKS6uQ
	 oume/wZ86eUBCYpW2jZ+eDJTjTfiRLZfA4nZ/TqxS5BnfTtUicFqtcPROsHzUHvoRjWj5
	 HU/91+SiQ8cZ+QSlMzQiQZOz/tJJwT1129k7FfJAVKOSyt976tsPLGB4/fH4HEGnBfDcB
	 9vS5xkKA00vvVAey8RNuTR6roeipXA71+Yn3h6/PYI6KwbCSrCNUtRIQqCdSK7FTwVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795795935;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=VBgH8+Q6QHWEj0qZC0+SboPRRBmICX+3ZM9Ab5HQr2s=;
	b=npc/RDvI/8nmxCgdMUGNv4Rxl98uS+FDJZ1zL8i4ckPHl8cArXzewBi/fYEG/kg0AVrS
	 7A0vzN8rSiJZTpdx33n6vlCxAP29mXN4QDMcEXiJ4ZtvRmsOZ1frCpuQBZloxxURf1yps
	 UzPXguLJ+qU99RF4tzcRlZcNWH8ozItoZSrG4g/spusgOs7tS0hmJdbGoWFIXynu5TA6f
	 EAMOQOZ5pTGMyLotVQsTa0tnMl3Nidu/d6JSTj042WpIrB1yrFW5hAEB7AcLaMTTlxA4B
	 eJiyDkO0m9OWaquALfeyvtLDPxnz4XEfbJdpG8D7lW2afnOOH3IiLrqPaqimoDtIUpw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8yYY+4t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2CC606A329;
	Fri, 27 Nov 2026 16:12:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=H8yYY+4t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C0F951F00A2C;
	Fri, 27 Nov 2026 16:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795795935;
	bh=VBgH8+Q6QHWEj0qZC0+SboPRRBmICX+3ZM9Ab5HQr2s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=H8yYY+4tIiy3LbXOAHA8yprNDZ8BxfhutArHw8EX7sd2LmdWF3Rnl+cBPqkKJD8hU
	 HCVAWuenQuX3oLwWn9tXGkHnn7lA2DfXj6lZIojCS2U5Exnpe3IRdHyjv1Z10Ha+81
	 t2VaYqBcU5iVXovXZiDzcwuI7HTbQ5azdWvZS/2jC49ShlTJVBiZSYKj495i+3bPDe
	 WhrtmbQ5k9ZZFEbZegbVX7/vVuzTBufB4Zf1+yyyEi51lnzFK4COzf6w5je+oMN1z6
	 pz3pb+AlMwEjzw5lJYmJ74hutXs2y+IR2D1OZknEch+2mtQk54PQd37U6hJAYlIHdr
	 Wf+rDMm1vXGbQ==
Date: Fri, 27 Nov 2026 06:12:13 -1000
Message-ID: <2ac377700fd9cd17c32aae2a9d3dbea7@kernel.org>
From: Tejun Heo <tj@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Tamir Duberstein <tamird@kernel.org>,
 Alexandre Courbot <acourbot@nvidia.com>,
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
 driver-core@lists.linux.dev
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static work items
In-Reply-To: <CAH5fLgjvFXX6oZRkH9OFCun4eNGWKkmoeCfVK3_16Yc75dfRkw@mail.gmail.com>
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com> <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org> <20261125181752.2027207-1-aliceryhl@google.com> <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org> <CAH5fLgjvFXX6oZRkH9OFCun4eNGWKkmoeCfVK3_16Yc75dfRkw@mail.gmail.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Hello, Alice.

On Thu, Nov 26, 2026 at 12:43:07PM +0000, Alice Ryhl wrote:
> Of course, there may be other ways to enforce the non-reentrance
> conditions hold, which could let me get rid of the lifetime. But the
> lifetime is there to handle the cleanup before destroy_workqueue() is
> called case, so a percpu refcount does not come into play.

I didn't explain myself well. I'm not saying that the current scheme
doesn't work. My concern is how easy the interface is to use, and I wonder
whether taking workqueue lifetime out of the compiler-managed lifetime
rules could make it simpler. Something like the following:

- Every Rust work item and delayed work item is bound to one workqueue.

- A Rust workqueue has a percpu refcnt and each work item bound to it
  holds a reference.

- Destroying the workqueue waits for the refcnt to reach zero. A leaked
  work item then stalls workqueue destruction, which seems like an okay
  failure mode.

Work items bound this way never move between workqueues, and neither
delayed work items nor ScopedWork would need the workqueue to be 'static
or carry its lifetime. This doesn't solve data or device lifetimes but it
decouples them from the workqueue's, and device accesses can use workqueue
destruction as the draining point.

We can add whatever is needed on the workqueue side to make draining work
well, e.g. an operation which expires a workqueue so that work items
queued on it afterwards are dropped without running, self-freeing ones
included.

Workqueue looks the way it does because it's C and leaves all lifetime
management to its users. Carrying the same model over to Rust and then
wrapping it for each use case seems like a missed opportunity. I don't
know Rust well, so I could just be blowing hot air.

Thanks.

--
tejun
