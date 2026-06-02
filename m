Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BB2838B7B1;
	Tue,  2 Jun 2026 15:03:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780412631; cv=none; b=k2CAhBiMkl5FTU2l0Jw7UQKDNKdGTxCjHidSbS0UtKcHXk/LVFw/0GEuso1yZxUAHobsT2iNt6OzqQYbTpsAc01Zg5kM8zkiMEfFh31295IbbJZEa+/t78z8LWt93htBYgQiT1Afg76dZaTPqkckyte6mCce9csPsJb3tKzblvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780412631; c=relaxed/simple;
	bh=8xQkRJaNuQBvap9IdHj5s58Pi1Gs8jwPfEySsq40tGo=;
	h=Mime-Version:Content-Type:Date:Message-Id:Subject:Cc:To:From:
	 References:In-Reply-To; b=Kb2OPT+YCQNXgiW24zGxSqWondkZYQaTpkVXzm5HWCuz2K80ZdubmGjm7iDa+pEgbip2P0ozxI82vtp2wjXrNCJqq20CJ/rXIolJOQFmanBqVLG2LFlGzIEbu9K33SzpJMIEthaCiriDErzM3Tww9aUocyzc1XeYkYxYQOEK4pI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Qnjl7o3c; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Qnjl7o3c"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F761F00893;
	Tue,  2 Jun 2026 15:03:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780412630;
	bh=8xQkRJaNuQBvap9IdHj5s58Pi1Gs8jwPfEySsq40tGo=;
	h=Date:Subject:Cc:To:From:References:In-Reply-To;
	b=Qnjl7o3cUe6I8eHXYPjAtQLRZpFKinpSSuzG2bGoLcGg+i1l/S+wbF2mnNIAQVeGq
	 +e5h3NYDJLN8SKD7RL2q4j14sbuBK/vTw3ZWZG/JYhuODWC34f+dYbxCZoYEkWxqvI
	 RKCG24HJfGOKauB/7unfdk0j8N7sl5SWagfh5YFfX3cTRAO5cfZRvdvUzGsZ+neUCw
	 LaOXgDi16JbY1VnNttkl6GqT3+0O96cJTDkzkyGfHUy8ld3J+neJ1fJVy+esjgdnbh
	 soBl8ZOeTcVhYnbH3V8pLKQ6/zI0wk1K6b1r6ThttHSrERV7z3yMlq8jzbLVgHyc8g
	 8NbfiiIAqcmSg==
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 02 Jun 2026 17:03:45 +0200
Message-Id: <DIYNLOMQPWYW.HBQ59GSHGENX@kernel.org>
Subject: Re: [PATCH v2 0/6] Rework index projection syntax
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>, "Abdiel
 Janulgue" <abdiel.janulgue@gmail.com>, "Daniel Almeida"
 <daniel.almeida@collabora.com>, "Robin Murphy" <robin.murphy@arm.com>,
 "Alexandre Courbot" <acourbot@nvidia.com>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>,
 <rust-for-linux@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <driver-core@lists.linux.dev>, <nova-gpu@lists.linux.dev>,
 <dri-devel@lists.freedesktop.org>
To: "Gary Guo" <gary@garyguo.net>
From: "Danilo Krummrich" <dakr@kernel.org>
References: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>
In-Reply-To: <20260602-projection-syntax-rework-v2-0-6989470f5440@garyguo.net>

On Tue Jun 2, 2026 at 4:17 PM CEST, Gary Guo wrote:
> Danilo, we previously discussed merging this series with I/O projection f=
or
> patch logistics. However, I'll need more time for next version of I/O
> projection (implementing view types that have original container type
> erased) which won't make it this cycle. This new version for projection
> syntax rework is minor changes only comparde to v1, so I think it's worth
> sending out so it can still land this cycle and get out of the way.

[...]

> base-commit: 46def663dd34da36464ba059f7cfeacf29d98e5e

Agreed, as discussed; and in this case I think this can go through rust-nex=
t.

Acked-by: Danilo Krummrich <dakr@kernel.org>
