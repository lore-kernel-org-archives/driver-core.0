Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382540;
	b=Nvmhvf0eIi2PJCF/4ppR6ELolL6wTJezrXvjU3f7WBX1RdgPI5k8XfIUa6y+OKQfD55m
	 L8Dm1+FEDCu4vlvgw3LSi7tdpMLxfaolreJyaEvpK2v1seY296S3LNimD2FtnSeriIQk3
	 zbDETm4ZG2W+4bYo5H3/Lj5ZdXjRn8GMWMFk0EYhGZ05bcYTEmTAsv+ybQ28gHruFn4X0
	 LPDwoSejVf8ZntVVNqbc8G8Jf7qzkLiE0b8b7WmJOyO/8hBt5f5NN/ojLR6ZspW9KqOls
	 qzbt4PEbX8bkrxxjDPVjb5NIV0zHlX1mq+GY0Z/jAEsCzL40uj9NBSHeJGg7y6D52HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382540;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=4fufsDQ1xvC3zbg+yGa1jsAS5bqwuf7ZledZ5/n7XQo=;
	b=CO+Z3oA/FlwA0ZdxeB12MnB3wdTHHNAdUcowEhdVeKgxClrhxSuh7TTCQzY4JdOJGM54
	 eeOSqbo/dUSqzwhAqg6h3awDbwBL7wzZZ89ht43PpKYk2I9Iy0u/ewRp/Ysu20+TEp3R5
	 mIRhOQCYzgy8Hgho/07/iMx16XewgFgQ2ss23m7Y8Z8ZVHcStFBfR3YeCpfCPyI8uXLOB
	 RS8GZ6N30g4e793NeyXFkXUiFMr+16fO5R41a/l5Ny1klkkL9qvUgY/jztN3QbMpT0yak
	 RMKopRBM1oCEts8/2guZtWJEfvP67cwSy2J3NaHohL4Mqp5oNEcsWsFnvs39pHhAPAQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JVJPIi0E;
	arc=none smtp.remote-ip=95.215.58.35
Received: from mta1.migadu.com (out-35.mta1.migadu.com [95.215.58.35])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D542606A31A
	for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 21:22:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5D542606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=JVJPIi0E
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=4fufsDQ1xvC3zbg+yGa1jsAS5bqwuf7ZledZ5/n7XQo=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795382536; v=1; x=1795987336;
 b=JVJPIi0EDwWXRiH/d2wzluigPGkV5m4LZO+SNnp7wUmcsRtzN71WUg7z+jL6vrjaVv24MJOd
 IDxeYaySdblhDH6wrScbqyy5OJfJ4UmC1jEEqXxB1iusR+lMvpRnFAZmnTaecsgMQBL6QNim3F9
 rayvxA4Y0x2gUBUrCRFnH6lk=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 71d8f717f0abf706;
	Sun, 22 Nov 2026 21:22:16 +0000
X-Mizu-Trace-ID: 71d8f717f0abf706
X-Migadu-Flow: FLOW_OUT
From: Igor Korotin <igor.korotin@linux.dev>
To: Muchamad Coirul Anwar <muchamadcoirulanwar@gmail.com>,
 Jonathan Cameron <jic23@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
 Danilo Krummrich <dakr@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>, Alice Ryhl <aliceryhl@google.com>,
 Daniel Almeida <daniel.almeida@collabora.com>,
 Mark Brown <broonie@kernel.org>, Andi Shyti <andi.shyti@kernel.org>,
 Shuai Liu <847807867@qq.com>, linux-iio@vger.kernel.org,
 linux-i2c@vger.kernel.org, rust-for-linux@vger.kernel.org,
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
Subject:
 Re: [RFC PATCH v7 2/4] i2c: rust: implement SMBus access via IoBackend
Date: Sun, 22 Nov 2026 21:22:14 +0000
Message-ID: <179538253428.9669.5532258807115715261@linux.dev>
In-Reply-To: <20261109155743.83740-3-muchamadcoirulanwar@gmail.com>
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-3-muchamadcoirulanwar@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0

Reviewed-by: Igor Korotin <igor.korotin@linux.dev>

Igor
