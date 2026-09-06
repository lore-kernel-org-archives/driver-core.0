Received: from mail-43101.protonmail.ch (mail-43101.protonmail.ch [185.70.43.101])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A853634D4C9
	for <driver-core@lists.linux.dev>; Sun,  6 Sep 2026 10:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.70.43.101
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788690526; cv=none; b=k5av7IdttTdaROmtf2IK1HD2iEYk/bjl+qSYcXgvKEv8Fn6JntuaUTb5rqYGnS35q/9ddqnTyxL/e2vwpLyarJ6/LjmSyJbB5x5x+jYeM2swWkH0WRdAjrj1pB+eRzYM8GJHPRFkAsvsCBApqTNLPYkORJEswlYHb6CeGze8/to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788690526; c=relaxed/simple;
	bh=tL8sIC6QLDl8w6EVxitJamuoUEdvD5R0cq6sKy5DHhU=;
	h=Date:To:From:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=eMuOjyWc7lzcPP1K0m9lzlkUVBA6rzs9+iX5JHtdj7oB2yRwuNcfM7c48AMSOpEZYZZRS68VIDHU4nAt5JaLUlWBlyUpVN9V/WUUXn4iRD2xkF8n4yAVjTEL3OjwNXm6X+ChhJY9pnQPwMsUJjGwE2Ukj5OL7GKQysjIeu9lC7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=YVrgdNnE; arc=none smtp.client-ip=185.70.43.101
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="YVrgdNnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=pxla437r6faclkk6zezuntmxjq.protonmail; t=1788690519; x=1788949719;
	bh=N/40xsEU7tolwSN75TzYB4doWa4y8gDvG2iAcA2tqvI=;
	h=Date:To:From:Cc:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=YVrgdNnE5vZyEpx8VQeT52RVtZlqI9N/0nR1Y4dX9OHvYHWmbpb17CagSfdkEAkKh
	 9lrNrXB8MYtowcVz2jGqBTnMTk6bJjrUJ5FOD9TkssebAFB9eXk3gnMDBnZCVt2/Bf
	 /3boeVH9Hag1xbYPUMrwJ3zxCaZjtsrz7jUOMPNMG5kK6KDtP0oA66FL5qcPrDglfX
	 S8O+JTiH9ZOK1Ls5onmYuxOxqat+yzwqmsd0hlsoLtY3zpjCE5WuWttnsM48eeKoyV
	 /r7f4YM0efw6jc+JLR4tC5/qJIXmvVtn2Rrm2ktd56Hj3AcpKpMbzBog0KZKw0WenP
	 +c7uGxjBRZcmg==
Date: Sun, 06 Sep 2026 10:28:34 +0000
To: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>
From: Sagar Taunk <sagartaunk@proton.me>
Cc: Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Eric Dumazet <edumazet@google.com>, "David S . Miller" <davem@davemloft.net>, Simon Horman <horms@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?utf-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Sagar Taunk <sagartaunk@proton.me>
Subject: [PATCH v2 0/3] rust: migrate users to zerocopy traits
Message-ID: <20260906102826.202874-1-sagartaunk@proton.me>
Feedback-ID: 130121444:user:proton
X-Pm-Message-ID: c9fd85c2705fa81c68284356847651d19339fb13
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

This series migrates `dma.rs`, `uaccess.rs` and `net/netlink.rs`
from the kernel's `transmute::{FromBytes, AsBytes}` traits to the
equivalent zerocopy traits.=20

Sagar Taunk (3):
  rust: net: netlink: Migrate to zerocopy's `IntoBytes`
  rust: uaccess: migrate to zerocopy's `Frombytes/IntoBytes`
  rust: dma.rs: Migrate to zerocopy's `Frombytes/IntoBytes`

 rust/kernel/dma.rs         | 22 +++++++++-------------
 rust/kernel/net/netlink.rs |  3 +--
 rust/kernel/uaccess.rs     |  5 ++---
 3 files changed, 12 insertions(+), 18 deletions(-)

--=20
2.55.0

