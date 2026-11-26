Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795695776;
	b=MupDTUat5fT2JE6snTD+k4dhWHfWG6mIbohm9Pv583u2KMeILwLtV0TG31J8C1IPs0d7
	 Da40ZkQcmPNLXcNWHSjuFsZvIytnmq8OEyI+KthElWVeNMKVqzNzl1r4kYeY6D2GkyGex
	 jQ+JuH7yvtD+Ggt5RglDpCuTUnwmr+PBbTCl/wZ1iHsdO5S+iHnUKaaKa2ECKRimM5WuD
	 ocup8udd040c2eeJuwoRlem8U6dtHHM1ntvzM16VI5lbh6o/jZ8jpJm0xpSVrQ45amg09
	 YwdKFyyPZqhHQMUkff0h4lOW3jDlBJX/LgUNgk0MMDB0zIfV9gUJLSG+AJFSptdSbwg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795695776;
	h=Received:DKIM-Signature:Date:Message-ID:From:To:Cc:Subject:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=U5c3MpZCtbAS1IQKT6eCIn8iyPxCecOaQ+GO7P5474Y=;
	b=ygZSuezN4vc3kPQDpnZwQF/qACerU3F3NOt0uGOtmH85XSoCDQWzpLEUte+OFcyvx1sL
	 n6mRycAmfAaIyrHxItQ37a+dB+aboeGfvwE1tPf+nfRIPxBuquhhFtpOVNPSoux7ppq2+
	 llLsFq/VfSaMoq6F7+MXgXtwXk/Sy3qdTRDKZ3XphfkbJkYr/bGYdXG2MTsXIyKnP4DFa
	 qwHeSpLpQ9fS8kCaEi8KgknVujDikr0BMnC3LmXOsWMmnbYCzLq0Yt8W13Oqh7OoI/1i+
	 tosS59EKPvuBcJDq2gUaz0I7McE3bTQY/gI7K2YSdBzNWblQ4Swn1uFHhAZZ2+505mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEokUCGt;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB25606A33C;
	Thu, 26 Nov 2026 12:22:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YEokUCGt
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A49521F000E0;
	Thu, 26 Nov 2026 12:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795695775;
	bh=U5c3MpZCtbAS1IQKT6eCIn8iyPxCecOaQ+GO7P5474Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=YEokUCGtuxUOphlTG5QuIlc2rBf+8hFl7ZgwelSKmYlrujE1m8NZwxGWwUIMjk6+t
	 377JsRm1tE4YBftWCLDDk9Hn97am8B++CeWjvjbo3k/bMLR+Ed/ZFtl9+2lOj5592r
	 D/Z0zErquPePxdMzL0YGEk6wZN3nn2hw9WHLnrhUPbW5VTthXmDsxbqntV+QN1tGf7
	 WrpbxKFT556OBV9/gzE/Play3R/lfKgjjP5WOYflMxaYBZXo+jT29CMeUzqcUBeG83
	 BcxCUTmpR62lZfRKMLAvMl3rit/AHkh82YKAMtNdRgWIVjTlI8Y6HE5MyJxbiFRK3Z
	 boupJhfjVQsBg==
Date: Thu, 26 Nov 2026 02:22:54 -1000
Message-ID: <f9d8ff6a6c4a4d098e0d461da4e40474@kernel.org>
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
In-Reply-To: <20261125181752.2027207-1-aliceryhl@google.com>
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com> <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org> <20261125181752.2027207-1-aliceryhl@google.com>
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

On Wed, Nov 25, 2026 at 06:17:52PM +0000, Alice Ryhl wrote:
> What I'd say is that this isn't the only way to spawn work on the
> workqueue. This utility is intended for use-cases where it's convenient
> to do it like that (e.g. because the queue is defined before the work
> item in the same struct). We already have another way of spawning work
> that uses different ownership rules (e.g. self-freeing work) and that
> mechanism would not go through ScopedWork.

This is your design and you know this area far better than I do, so please
take this with a grain of salt. That said, I wonder whether the interface
is more tortured and twisted than it needs to be.

Workqueue lifetime seems to add a layer of ugliness, at least going by the
restrictions on ScopedWork. Wouldn't that be relatively easy to solve by
adding a percpu refcnt to the Rust wrapper of workqueue and tying work and
delayed work items to it? Dropping the workqueue would wait until nothing
is pending, and cancelling delayed work items before that would be up to
the user. Work and delayed work items would then behave the same way and
be usable on any workqueue.

Thanks.

--
tejun
