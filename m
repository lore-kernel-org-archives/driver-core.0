Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0BA03382C9;
	Mon, 13 Jul 2026 21:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783976960; cv=none; b=qVxSmSae0jsmpv3jOWV9zI4CktsEwud5I4xDUjJnGI6FfF+NGJ1oqUo2RoLGJZMPyE47EvBtUVVaNLGmr3SBccSc5FWliqGb+386pNU31/tvU6qOsJbWcZMSY1RDp61l3W9kCqsoxyocTfXjRV0GJAfD/jvcWtUl4LbClIpbkuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783976960; c=relaxed/simple;
	bh=c52mMQX9J4H2f3aHwpRg0V7ywMz0NgEjSePFhkqtKgE=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=ilV+aR/NuYsn0Mqr+eyZetBbYw8pR6UIAXLTDqDKh6sDSXDjsxoR/rajGu15EbC/btd8PZplmSjpr+ZIZoDHT0ejZfUs3WreN3LLFFBA72q6nVQ1vobbSDJohv6SFjm13564A5rh2h9mKwV97xUEtmR4WrM/nDE/0isV59IyYo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cvxblqpC; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cvxblqpC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298EB1F000E9;
	Mon, 13 Jul 2026 21:09:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783976959;
	bh=c52mMQX9J4H2f3aHwpRg0V7ywMz0NgEjSePFhkqtKgE=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=cvxblqpCo7wlq6C+75Jh+74Gxa4itrJOCfg8XZ9Xl42F8Rkh7OWyIhhvTCa+2MeEX
	 ud2QiVrME/WA7tohwMPrx8jDmCln9sOg7OUWIJY2cevOdnytKSYia0tK0lipbivKnl
	 F9U624dFZ2blq8qsNpyy4S4ohk9wpzhrzwvo75MzFKVMk04emAqxrJTyij4GmGJvdZ
	 sRw1eovpvPmIT4T/E3q6so/lc7Gyb88K1NRzRrqX37uviz2cldNaTU/Lw0vNHlxhOa
	 q8fxBlVy7Hs7KaNJwM1dZVCUy9cCU7uHuu6hvfosnGHyl5jE//443a0/pqINZIzP7M
	 JduRHY8Jo55fQ==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 13 Jul 2026 23:09:13 +0200
Message-Id: <DJXR1UJSFVGA.1O6GR87RE8AIM@kernel.org>
Subject: Re: [PATCH] rust: device: make lifetime on `Core` and
 `CoreInternal` invariant
Cc: "Gary Guo" <gary@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, "Rafael J. Wysocki"
 <rafael@kernel.org>, "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng"
 <boqun@kernel.org>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 "Eliot Courtney" <ecourtney@nvidia.com>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <rust-for-linux@vger.kernel.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260713201455.640151-1-gary@kernel.org>
 <DJXQ72BQ9CJY.3U4YFYKGYEEKU@kernel.org>
 <DJXQX3NU90PQ.2WB4WD69F3H81@garyguo.net>
In-Reply-To: <DJXQX3NU90PQ.2WB4WD69F3H81@garyguo.net>

On Mon Jul 13, 2026 at 11:03 PM CEST, Gary Guo wrote:
> but `use` is stable in 1.82+ so we can just use it instead.

Ah, right. I was confusing this with the situation before the version bump =
up
from 1.78.
