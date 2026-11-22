Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=91.218.175.225
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795382814;
	b=3Zbl/rr0xMEPiwbsMYKEV8ol/w/p85tRmDRmNq5VtIw13Fh4ONSLYrCkqq4bxVx+VRFi
	 U9cSTy5dyNEkvw6H/mfsetF7/s8X6ZfBi4eiXEjSl++bOUo3ztW42ade0LOJEaU5QwL1G
	 wVvE+OiMwzzKD4eKp62Yl57my2VxNU58fA10BxM18MZ8x/xq/A6rI1KgCDoCwPyCMhG0q
	 Ipg9HSTOSIzAaVlUv4oxC7mQP7LJM6UMMq5nqlF65JrwfzFSjYfN6w+sdgKQ4PK8q09UM
	 /QqTjHq/tsJBa2nzfo2KVDxMyozrPzQXULVVJ3yuBJk84onyOIayNNpownuPQRA0PkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795382814;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:From:To:Cc:Subject:Date:Message-ID:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 MIME-Version;
	bh=jsDS/or0ZVK6HGVKSX4EnqK/vovBXxaPLUaDJcNOoUA=;
	b=29NnJybHav9tz0TXrtJJOl3bL4U85OW8H3ViHLnTX5Wwuvobh1cCuKF/JuBrQiL6jMd+
	 GnXnhpYXkCKfh7r4ZtDH2IkzUXMm3Sig6eRKwgPzB7Gx4+g0T0bVw7MdfpRJ8lPU4oR6r
	 89b1YN82uECT9UtZKA9WqsI/A2hlBJeA0KShej7kjRB6/w4Qw9DSmZ9D5s3SkIQ/cE4Yl
	 jrjIiJF68u3FHl9+oH5Xmcd18WnzuGXK8bbEpuUUCFUQvD6E3rUHKxgNz32AZV4WXgtTi
	 MKHSXjDJVaoCgZgsVrrU+uER9QvyQTKxGopluE4bvzrHzn9QLyEMi2eIdpcyK9gEhtg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xANBxYUI;
	arc=none smtp.remote-ip=91.218.175.225
Received: from mta0.migadu.com (out-225.mta0.migadu.com [91.218.175.225])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FEE9606A31E
	for <driver-core@lists.linux.dev>; Sun, 22 Nov 2026 21:26:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FEE9606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=xANBxYUI
X-Envelope-To: driver-core@lists.linux.dev
DKIM-Signature: a=rsa-sha256; bh=Uow9eIxLhRXEAVGxWSlS7vx9hm4sdE+4FNVYGS631Rc=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795382811; v=1; x=1795987611;
 b=xANBxYUITi9B5efgDjY21YP7+PE0dMcqBar8Ng3EmiStWfVHanEK6c560pHB4t/9gsezaBaH
 rvwhOT1xv/6Y/QStO/Re8XRrr8GbhcQ5ytx93CZbsQfCiK63G6ZX07+KW7qX58pKratQgFo8Vuq
 NBJqFOjimS3cokAJfeWpVizM=
X-Envelope-To: driver-core@lists.linux.dev
Received: by smtp.migadu.com with ESMTPS id 0d161315944e3b4a;
	Sun, 22 Nov 2026 21:26:51 +0000
X-Mizu-Trace-ID: 0d161315944e3b4a
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
Subject: Re: [RFC PATCH v7 3/4] rust: add minimal IIO subsystem abstractions
Date: Sun, 22 Nov 2026 21:26:50 +0000
Message-ID: <179538281024.9825.4132712997497273037@linux.dev>
In-Reply-To: <20261109155743.83740-4-muchamadcoirulanwar@gmail.com>
References: <20261109155743.83740-1-muchamadcoirulanwar@gmail.com>
 <20261109155743.83740-4-muchamadcoirulanwar@gmail.com>
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

Clippy shows two issues in iio.rs:

1. Line 332 -- ..unsafe { zeroed() } in VTABLE. The SAFETY reasoning is
   already written above the const, but clippy's undocumented_unsafe_blocks
   wants its own comment immediately above that specific line.

2. Line 408 -- unsafe { (&*priv_ptr).channels() }, drop the &:
   unsafe { (*priv_ptr).channels() }. needless_borrow, no semantic change.

Cheers
Igor
