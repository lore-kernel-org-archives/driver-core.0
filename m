Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452890;
	b=YeyhBWVfIpvLXc4nRh0auHwjt5pg/7WLWXhoTrw4hWp/w1qIMEeuS3pjGl2ylUpLuoS7
	 e9pzNoyuocu657n7MdimVsk99E8xtTESoVjaRIurVJMasiVHeDaidqiwdsHbvnK3flCal
	 /dAdJZGliE6qALhvCw7bItL1CCxNY/627AIgoM2BWT+gdFKN7NPAqpd1ZrsTEdqdVwJ6q
	 aBlk+vZSdDrqvp8eisUm57wt2wUb5ojhjA2oZpccaXG+KYWowf5qYoR3HjUYCqnrE5Cv7
	 4s88vWNMXQVwcjAUpIWUNstumeXm57xGlOUxYzFBnzLQ/ViO5rXt1pOTl6F48m9ohDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452890;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:Mime-Version:
	 X-B4-Tracking:X-Change-Id:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
	b=1QRRb4H2U1Zsim8zcxQgbKeNH6zX6o4u4kkom6rtsHWj4X5FwAMBuFg9kkvzLM+Zz3Yu
	 k8G8d2N1TGS91wXYcpTPjqMaf43JUDqDClxcAaenLV1kfGxa56hb06yX4eM9F5t28C+XI
	 pt2vMgr2SZdQP0J8H1YkEcXBk1YlmFybRdN4Ine54vKEg3eQ3pcYhXrw8u6jUBOhe9I+a
	 bN/pXLxJFaBIav2WiOqmlnTTp2Z6Kt2HnLWMwAS0gnUrLHGPHXd8nRGJTjG1a7f7iFmBO
	 sxarojK5BImqGYmjCcex7RXqIPjNN1XrvJxRzbySLK/yr4EF5vOe03Lt9yISi3Tlgrg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=twShgU9n;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDDE1606A31C
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 23:34:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDDE1606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=twShgU9n
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-30c0d568830so5705016eec.1
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 16:34:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452889; x=1793057689; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
        b=twShgU9nuX3xCWx+075yKeNLoggO+11OU5gOmikSzZFR6GeD81MASH9qzzL1UOyksY
         qAQLr/BDzxJhybb7w4Rxyg88DMegT09qKOkPXLQT4f7XR8We1WJyOW89SovSIIt/HcQS
         t8I7v3s6ZN5MVFwOBWpQ/R8r/5Z3N1mFNexvX/+Z5zPho10ZW1URCHDaCqYtQ1mfasHX
         Z2tV5o4AcGlPXKozDqIiM6pxHqO3LhIXo7d8Fab3KPJ0VYbLPniAJsZH/qZ8wU3KC+rP
         2PziRWeH87fuqX4wW3Gv9hlo8dnYbkiDiYcyzZffofevBRB1mzNionJQBu97IGcfqhRB
         jLMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452889; x=1793057689;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
        b=Unf9+pWbe+dO3ojogzjJfxT6ic9N3gpGmBy6iELZadUrvULzOiBYFaozfFnUvsHS0V
         L2uUgRSdSFxoh3KPNxpkuD9pCp4Wodr+H3rSbgvfSTazcE8nuMW3Oi40XROzxiyX1PKQ
         jS2w/dj3/7rHGcP+jL/fR8dcYTEyatp+WnR6/W76Jn/6gksoPU5HNnJ6pTCJhHMfDoFR
         cmxQ11jk/g5XwBlVXjvLdIUHlHMUwZa++mDsL/LqEWAQeva7Yefbum50bHIDPMo3JFcn
         NJd8eRu8BlYNL2bpuq4WmIusweRl37o3KR35eDM4VC6zJth4sJjCb7IknhKaGexqKFZd
         hSmQ==
X-Forwarded-Encrypted: i=1; AKwUvBwkN4oQK/xwgSn1MJDE+sgTGHKN70WOBuWJEd9u4YttqXNHyrg7uJk/m/iqCUlmadPiDnLJxHyvFeDUHw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLvRcBETseY0F9S8lVkqW7UM1od5gn2BRAOGl2atHGUffhDbVTv
	ccd9zCx6yotNaGhP1d3hKRmN2leRUKQ5GJzXGHwmVswRFe0Q8pL8ETJBYSRI06B+f4fDK4tYI/K
	OwOd77ZXdGl+ymclJzm4QGYDFFT4zGQ==
X-Received: from dlbur21-n2.prod.google.com ([2002:a05:7022:ea55:20b0:184:b43a:63ac])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:241b:b0:16d:dd5c:4261 with SMTP id a92af1059eb24-18514449a5emr10311455c88.46.1792452888497;
 Mon, 19 Oct 2026 16:34:48 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:36 +0000
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAA2p1moC/x3LMQqAMAxA0atIZgOmglivIg5qU81SpVERSu9uc
 Xx8fgLlKKwwVAkiP6JyhAKqK1j3OWyM4orBNKajhizGWy9cvaCXlxUX19u+teQ8OSjTGfkP5Rm nnD9WpKuuYAAAAA==
X-Change-Id: 20261019-rust-cfi-fixes-bd898391df1d
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=352; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=hXRBmypsfSbOoyyjwjH80x+T5tVVukih5UNKVVGaJDg=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVop2PJE5k9Su8bg1QKXcrvTT0qTrs5695d7DtDXpp
 9qpAFb2jlIWBjEuBlkxRZaWr6u37v7ulPrqc5EEzBxWJpAhDFycAjARQUtGhtMdGSfnX824833a
 6TMc/aHvprb5+IgybNz9dFXQy6tbMgMZfrMc/VxyLsN9rd1/i/K8vQrWs3uc1y0sF3A9pc7U9zL ChBcA
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
Subject: [PATCH 0/3] rust: Fix CFI type mismatches
From: Sami Tolvanen <samitolvanen@google.com>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Lyude Paul <lyude@redhat.com>, Thomas Gleixner <tglx@kernel.org>, 
	Anna-Maria Behnsen <anna-maria@linutronix.de>, John Stultz <jstultz@google.com>, 
	Stephen Boyd <sboyd@kernel.org>, Abdiel Janulgue <abdiel.janulgue@gmail.com>, 
	Robin Murphy <robin.murphy@arm.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev, Sami Tolvanen <samitolvanen@google.com>
Content-Type: text/plain; charset="utf-8"

This series fixes a few CONFIG_CFI indirect call type mismatches that
I've run into while working on Tyr. If we're going to run into a lot
of these in future, perhaps we need a better solution than addressing
them one at a time?

Sami

---
base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
change-id: 20261019-rust-cfi-fixes-bd898391df1d

