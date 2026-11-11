Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794422502;
	b=it/7xgCMKS3yjnNeT/a76UTHRIbvzQrrVsslMO7nzUiva5IWgTH+fDx3gtA0AHT+L7W2
	 aCOVRdJ2HAHuFWpkbNZUTPDvRvdkogtlsmyMhqAKbYGKIYSUUb98F8PByuuea3PCeqlQF
	 pPcObMf58+bguGfAK5y1DD4EmgctqB0HYIt1+TjF9IMzeUyEMltSSHfCm0gUuiET67a8q
	 4g+r+ZKkDTLDqpGIXnyDzAXdC5sNsasMArHLteIP/AnkM5a6hpxWaqjwSHZuIoAMJU6GP
	 N3fNy9sqC9mdNHMTddpbvMiaVPazr/lfj/3TaZeN266y800+jksy4oR/T6g0yTTACcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794422502;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=fEFB23GYYSAVUMElp98oDaSOHoYSeRnW38q5RcHqNO8=;
	b=XGF9dVT+xyoU9fvpKhfDndy5OdrDTd+rL7YIX6b+klIwZHRaQrhxzSA/qax0AiDAbdKZ
	 TGizdXGLw/qxpD0VC/bxj3zQfWePermeTs4+ozMKvWZHQgNPZYJuw8k5vYuCdOh7d6vUc
	 kaQ4lb4VgCii1NIeaMT1ID3oFG1UQQk6pSwZHMhPgVmD5ZL/XlKlD6+c/iKqYyJ7h8a+D
	 ZerR3RIhO0AxKQesIW1afljCPyXNMO5bN4VGbAtCGUlvvRWqmex8Z/wfjX8KgkKr3Zf7X
	 fnN3wZANmX65HS4B4sXN5d+AEIQEzH76SmTweJA2BTsWOU6KU1OJhIRgNO8cNW01PfQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=uci.edu;
	spf=pass smtp.mailfrom=uci.edu;
	dkim=pass header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=RJQYmi1m;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8171D606A326
	for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 18:41:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8171D606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=uci.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=uci.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=uci.edu header.i=@uci.edu header.a=rsa-sha256 header.s=google header.b=RJQYmi1m
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-14394530ec6so4603160c88.1
        for <driver-core@lists.linux.dev>; Wed, 11 Nov 2026 10:41:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=uci.edu; s=google; t=1794422502; x=1795027302; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fEFB23GYYSAVUMElp98oDaSOHoYSeRnW38q5RcHqNO8=;
        b=RJQYmi1mxI9iDppMacDJRj/OvTYQEmF6V6cMsgL8GElw7xirUpypAbqZFu1QyDjgsU
         hifn47vay3M5FjrGwyePpBfEadfjtk4vyJX3W909pVzsYP+15BVRnj90nvnt3GefkdjT
         soTzcRiOdMVBnBTyZzqcOm3hxHmm/VkvHGnyAh4NPhqA1nTZfIIBYGhX65RviGusWzTr
         BHbIvWfhbAmZcuYTxaSm3VqEtdkb4zuesWkJyZm1bsPy2xVmmxYX4Vu/v9wQG8xFRDcp
         C1pCuvoqUrNLMxPVM7XAZcvD+xrgW3Ckb7/U/0dmqnIWH7JzJ5eQuqiEFpzJ1WPuJtrM
         CNyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794422502; x=1795027302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fEFB23GYYSAVUMElp98oDaSOHoYSeRnW38q5RcHqNO8=;
        b=irpRusdBbRLmGoRwNpWOSYTb3KQilwhHK89HD1rJtUJahTxF0JWJ3ZjGP9lQ4X5unT
         tbQQp+8JsrwBepzSZa6dLNg6jGjb8afaKTuLbud/MjiN/Z92+hKGhAVy5ob7lRG56avT
         lq0U3UGotlhUHVpiuk8bgMtNhEdxfXC8eIT+JobulI6SH41M45oVt7KHB8x+cdSNMdaH
         RGGjZahA9Y1axks1e3eF2GjtzuZdd/r7tXy33RpSaWRXqkXODB2VNIEikmA6JmXytIlt
         SD6kQDxWD0449ONzOqJNmyK/c/Ic35lv04KjOh5lvFH1M7kpgW+aKvcBRbt5HUsm1/j3
         I5hw==
X-Gm-Message-State: APuU4Z/okt+/LgBp8fTGCcvQp7Y8HJTWZnKAtdGp/4V1uDwimw3rPtYY
	1Ze3kvsaJCBNM6RutlG356GcumAtU+1Zwi34zWiG9s74TrR81qgCna7r1SvAmkd7cWw=
X-Gm-Gg: AYBFou31chz5LxVQYCtxSucaM3JlhFZB+1S/gAHQjxRi+vdJQi7RpVrbe1jvTddAsgO
	CE6vbDeONXD/osKqUm7/eHTY3wy4AE032k28kTvno4NBNN2n9IEVQy4wWcByrF9W0Epk6Lgnr9V
	oR+sZ6kE/23IL83HAqQl/KW9ektJWKQejaJkgQwAS5lQfqiOsFfAC2DYkI6xoVSPtgpswbfBrB2
	JCsgq7IpPD6ZRGQ1vgzg3+S4iiOFdO+01JYiBBvZDHKBEd5W/nw5s7umrH5evZg612my7IfMxhP
	l2L2lCpRpyVBzWvhkrVim296/fbU7cTIUEyndeMxMbDd3SJ7nMqMCzeT/Ch1zbhl7np/vewfZac
	yq6i+d5iWR9tnIX0CGJu5iI4dRRGELMcSwFAFWZEAe/Pkskxcc0Pex40d2rNfDBaiyq+1PpQQFm
	kYqPI2pPkl3bjNrTUYzx1xRmacrfx2za6tvEVeSRn1Q5QrBB9JeSMKehsYZ4zDJKLVIHCtwFukC
	zVxCeKMvolMpvGlEpQ1D4HIwI6mfQ8wbcTVdk5Nkk3HrG191g7bXaUmcGB3APWZHd7Ff0iP6+wF
	slySdbjXMpGcrmsgYWHTNJoWvO5Q45hhet9dia6fbgl7m2TjonL/5FsvWFNm0ULWLWwn+D0k6pm
	T7PH3oPMYa6DyAA==
X-Received: by 2002:a05:7022:928:b0:1a8:b566:80c2 with SMTP id a92af1059eb24-1b3c034e98bmr3940344c88.17.1794422501673;
        Wed, 11 Nov 2026 10:41:41 -0800 (PST)
Received: from guest1.. (charm.ics.uci.edu. [128.195.4.118])
        by smtp.googlemail.com with ESMTPSA id a92af1059eb24-1b3b5b2fc09sm36593441c88.10.2026.11.11.10.41.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 10:41:41 -0800 (PST)
From: Priya Bala Govindasamy <pgovind2@uci.edu>
To: dakr@kernel.org,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com,
	a.hindborg@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev,
	lyude@redhat.com
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	ardalan@uci.edu,
	zhiyunq@cs.ucr.edu,
	dzueck@uci.edu,
	pgovind2@uci.edu
Subject: [PATCH 1/1] rust: scatterlist: pin `Owned::sgt` to prevent invalidating `DmaMappedSgt::sgt`
Date: Wed, 11 Nov 2026 18:41:38 +0000
Message-Id: <c8e4ab7f0f5417b53c3aed95169778e22afe7b06.1793652314.git.pgovind2@uci.edu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1793652314.git.pgovind2@uci.edu>
References: <cover.1793652314.git.pgovind2@uci.edu>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

`Owned<P>` contains an indirect self-reference. During pinned
initialization, `DmaMappedSgt::sgt` is set to the address of `Owned::sgt`.
`DmaMappedSgt` is then owned through `Owned::dma`.

At the moment, only `Owned::dma` is marked as structurally pinned.
The `#[pin_data]` attribute therefore only considers `Devres<DmaMappedSgt>`
in its `Unpin` implementation.
Since `Devres<DmaMappedSgt>` implements `Unpin`, `Owned<P>`
is `Unpin` and can be moved.

Moving an `Owned<P>` instance could also move the `sgt` field.
This would cause `DmaMappedSgt::sgt` to now point at an invalid location.
Using this pointer would then lead to undefined behavior.

Fix this by structurally pinning `Owned::sgt`. Since `RawSGTable`
internally uses a `PhantomPinned` marker, it is `!Unpin`. This change
ensures that `Owned<P>` is also `!Unpin`.

This issue was detected by FerroLens, an LLM-assisted analysis tool, and
was then manually analyzed and reproduced.

Fixes: 05aa6fb1c21d ("rust: scatterlist: Add abstraction for sg_table")
Reported-by: Dylan Zueck <dzueck@uci.edu>
Signed-off-by: Priya Bala Govindasamy <pgovind2@uci.edu>
---
 rust/kernel/scatterlist.rs | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/rust/kernel/scatterlist.rs b/rust/kernel/scatterlist.rs
index 3a5250f85000..afa2640061f1 100644
--- a/rust/kernel/scatterlist.rs
+++ b/rust/kernel/scatterlist.rs
@@ -318,11 +318,14 @@ pub struct Owned<P> {
     // `struct sg_table` and finally free the backing pages.
     #[pin]
     dma: Devres<DmaMappedSgt>,
+    #[pin]
     sgt: RawSGTable,
     _pages: P,
 }
 
 // SAFETY: `Owned` can be sent to any task if `P` can be send to any task.
+// Additionally, `Owned` can only be constructed pinned, and `sgt` is structurally
+// pinned, so transferring ownership cannot invalidate `DmaMappedSgt::sgt`.
 unsafe impl<P: Send> Send for Owned<P> {}
 
 // SAFETY: `Owned` has no interior mutability and can be accessed concurrently if `P` can be
-- 
2.34.1

