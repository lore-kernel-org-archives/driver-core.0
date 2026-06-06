Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123D370D77;
	Sat,  6 Jun 2026 10:45:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780742710; cv=none; b=BhJc46Wss2nL0OoSFJAGbq3cd2rB3jGxQNQs2ZTMcbPXOpuHf4iZedwKCKQq0WIAXHXkZ2wb3spjrgOGQ0mY6s3///HJ93CS9TUBCrSPnhDXhXI/8Cp3Kse40xb8F66GORgrvjEtFfvu4ZVTxSw9lvhyRsdqAUEpjYm3UoAQm4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780742710; c=relaxed/simple;
	bh=9cqZO77VTWWktdLqZ0h/mP5IfjZu2eIaSDJRITsDABc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:To:From:Subject:
	 References:In-Reply-To; b=FQhK6DebcqOPW55ShH5aaIIxLsCESOB+fNSMlshY28CQqwLs2anMz7i8wPWK31y1eUQgX2LNIt4g6dLdKyjMaBScz3auTVMabZzrI86iElQz1Tla6gEr16nxOR5SWWeOpPR0O/s6budhsvjwtp7reokrWz80aUSXEzjaZtf6XNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=OE3HFwf8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="OE3HFwf8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63D081F00893;
	Sat,  6 Jun 2026 10:45:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780742708;
	bh=9cqZO77VTWWktdLqZ0h/mP5IfjZu2eIaSDJRITsDABc=;
	h=Date:Cc:To:From:Subject:References:In-Reply-To;
	b=OE3HFwf88cHJBfTJqX48vhYLfMqcOrMLFOWWXic1y2FVcFxc+izDgqSK6HHjiAk6Q
	 gSXeonuNDEj7qnZCY4RER6fmWDvADBZjA4YGVPW97twmk2tCkb5rXC0BQq1XObInAk
	 EARrsSbXivdzQHQxDP5GOcbKKvoUDfX6NgjwIkghTqO9aGg1LqAQqp26eZhTvRb4oU
	 kOwQefWJPyGh+SDZWF/voDA709ZR74HG8QY04+eb7Vt424k4ZyQuNSHeRJLKwRN/VE
	 Fw0nfgnj3rpocFgdLmSInQBmboUI1hYdvY2lhdpkVX/5tSibTrPOBshr2/BlVkAaq0
	 q7AL9VIv94Wbg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 06 Jun 2026 12:45:02 +0200
Message-Id: <DJ1WLS9KVAM3.2DQUO10QXAPLM@kernel.org>
Cc: "Yury Norov" <yury.norov@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Boqun Feng" <boqun@kernel.org>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Daniel
 Almeida" <daniel.almeida@collabora.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "John Hubbard"
 <jhubbard@nvidia.com>, "Alistair Popple" <apopple@nvidia.com>, "Timur Tabi"
 <ttabi@nvidia.com>, "Zhi Wang" <zhiw@nvidia.com>, "Eliot Courtney"
 <ecourtney@nvidia.com>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nova-gpu@lists.linux.dev>,
 <driver-core@lists.linux.dev>, "Yury Norov" <ynorov@nvidia.com>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v4 0/7] rust: add `bitfield!` macro
References: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>
In-Reply-To: <20260527-bitfield-v4-0-e8821d4efbde@nvidia.com>

On Wed May 27, 2026 at 2:51 PM CEST, Alexandre Courbot wrote:
> This version is based on `rust-next`, with [2] applied. If review proves
> satisfying, the merge path with the least friction seems to be patches
> 1-3 into the rust tree this cycle, followed by patch 4 through the I/O
> tree, and patches 5-6 via the DRM tree during the next cycle. Patch 7
> can be merged after [2].

Would be great if all of this can go through rust-next this cycle.

Acked-by: Danilo Krummrich <dakr@kernel.org>
