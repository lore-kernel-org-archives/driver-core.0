Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500772;
	b=0SiVcJae8K+VwhlqYbLKuBNCnBtYVROYRerG+7kiosp8YHuoVvAdzN9nMyCts/VOPyDe
	 iztPZ49jk4tqISDj/L8KyHLsKDCAJi5KctR5CIqHtxK2LRG9+mcdSOVnqiouQUi02qBxn
	 tO1Zxbu1tfgpvzShX+RwROGkXFSiKPacTxpt2ocxNmp+WpONym/5M9MhiogrSUFsiEMx6
	 3KsgcQwDRWPufSiP+OfXtqa8wwfbC5Oh6d1uI8dp7MNdm/4xe5mEz4ownTQ0CMaEkiyVn
	 T7QJJpj5EJ2FhRLopGoykCMkLjAqs1AZotlYyrkRmg5dEs+ydrUbSvfK/HjvWCdLfCg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500772;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=twTTzwJyohkqmY5h5Pq5sCK9c2e3ondYs5MKDMe3E9g=;
	b=EVBdQSP+nh85uwjN+BYNQ90+kvlbMQ1Q/Moj7akZHWl2kmnON5NmSkmJIGrHdd9ofcyh
	 8zkK95zGIND9cAgeAoQrsKiIEyIq6Ob80SXxOrixi+KX7qyZEzFV38/v/G4e+R4q5iimj
	 /feKBprYcP++Bvsf2mxUjb6/+V+i8Mq6nkBNSYraNzFASEchUBq4camT7bT/Nq4H5pw75
	 FL0YsAE8O1IfKHjuAz6/S2a3KWsxU1mf284VVdaKwuEhK/OvBk74HX5yBrfqGJKqCmHr3
	 mHVq8LcIUaLEjrsKk5F1mhiu/rCO0cbQVhNnZXHz6o8J7pYffv86FlUjM1qf6SHiXMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=b9CjJfx9;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B04B60A2613
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 12:52:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B04B60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=b9CjJfx9
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a1e295b702so25087445e9.2
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 05:52:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792500770; x=1793105570; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=twTTzwJyohkqmY5h5Pq5sCK9c2e3ondYs5MKDMe3E9g=;
        b=b9CjJfx95VMLlnWM9kk96BlRaG7lNOpOj4ZAojFcPg9phWW+2eRHG2nHCj32xgA6uF
         tzTHiG+wsbRILhIAkORM9hVwbj5NJ3+8/3GlCO57jPEYY4xY5Qkl10rMHUNMx6HCrdja
         fnt6yV4hwQ4NSPdbxpFtOiFWOQz2v2nzXf3I0u1gIOSlWZ8YDm5Mw16e28S7Oq7EaLks
         FqDKtKEw0+c4rLD7bdLASRVT11MyOmSC9Zo+iN3oQ7+SRSNZhPnYZdb9jGOyrvkF7udq
         zI7p+0HMHM7Psq0Z04KAZoGKOCRLZ5DXAueAOGT3ETgXzbgNjUHMVhn9fYLGg/abHM1z
         SK9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500770; x=1793105570;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=twTTzwJyohkqmY5h5Pq5sCK9c2e3ondYs5MKDMe3E9g=;
        b=RbUogD0SzBEJu41MBTE98FgSagsi5yjgg19Lb5iZ7v8NVMnt9aWNTHejhOlUqiPJtY
         WMRnKBeiIvWDWNtQECq1ghJers75skh9njkceexh6MqT/u5m43X57Ip3Oz/9Dlvcfyr0
         vA16kpNb8fOY8KfTB6qwlSBUd4xtZ2w7b7bJ5ViZW9CLs+WIXUF9oju//qV6cpVoGb8i
         Iw6/gkdWau3DcU0H6EI+RGP5LX5A4uleNh993uDkLB4KVx3sleoQQcycXRkYy9bDIdNn
         pJxfW5hwV3CbrkrbEbls7BT5tJbBfril5oTCQxWVOMLi2xVsHbCpd2u6e6hHClsj/l9g
         jg0Q==
X-Forwarded-Encrypted: i=1; AKwUvBw6/nvLZ+ugPpKLXukMDY1F/FYlJYwGHGRSiCUFm5otOoPC9z92qdU2kQEPf0AXYk9/dJSlrOjsOZA0tQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYIWnsNhLbnY5knwPgmfKr4cL9QY8RIPHgi2RLJC9eGlXG/CK4q6
	C3GQF/QJBhCuFZC/E4Gh6CXoT5WecH6rKMVw05ZKOYU6kCVt8mS8f0PhI3ZxwYAUct01ljaYFHb
	WYXn/I4RA+bLJUY7D7w==
X-Received: from wmbjl20.prod.google.com ([2002:a05:600c:6a94:b0:4a1:b6ba:c116])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c166:b0:4a1:f736:79f3 with SMTP id 5b1f17b1804b1-4a1f7367b83mr29948805e9.5.1792500769489;
 Tue, 20 Oct 2026 05:52:49 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:52:36 +0000
In-Reply-To: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=1874; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=cu9swDUAudCFGY8DwC8UzyHKwP4kDBpF+chMRvCQCzM=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq12QexbxCjcu2Wo2ay7NV5FNOmmXPmHBuNFLAj
 tSKLW6Qk4CJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatdkHgAKCRAEWL7uWMY5
 RrHcEACW50D0Z9gpH08aYI8t659J1oF0nr1u8qkpdLSJiypTSr8j9G5EizatBWz7lKOknLXDSky
 vdqeQi7Y2psQH7h17PWdgscmq491wvrGNoTJvjgcdomUdmYJHic6q6uTY4XRH0x8ppJC10YORNB
 wNVh27niy+f3fGhrxJxS4rD6vouZeA1fCiKgX+iVtZCoe11yUxZHxzqyWv/cFXTOMjx7StcSZbu
 Y1RDWk6Uij3Yn9QaUGsZDDcYKeCTjA+elzh+Z4yUpCsC1RsYyyowd0pwZxe4oh2oRuuIIxKollV
 P+XqHK1DMhHKB5u11B0LFCxHQzoJLhlgwL3Qw/mEINi7h58GMOc7j39Tp8WqduQsQjeSE9Myls9
 GR1Uog8fOeVv1djYPy/OU6KD+Pg06cSWrUkdSVnDAE4f8xzXGvAmpMnkToq3UT2ntF0UL8nJdnL
 WbODwXiE7FFKeaMkSx63vjfZcEa9ULbqnGopB00nX09uEZtpcui2J5Im3DvAG67Wr5JaCPRpsPq
 kEZCR5weFnUauKBXEss1kYmPNActmBbx7aKFBJZK1KRWzw+1Vv6R0yuQzwCeOu8IXwtEFQaU5+8
 Jv/WRCE56rfhXEzRlGnDyUTRnTiiiawidJYVUuoVRD6v6P/WKudX9iZ42FdCOJYURZZQ+gKj6Ej XZ0yDan7yX+M3eQ==
X-Mailer: b4 0.14.3
Message-ID: <20261020-rust-workqueue-v3-1-ea7c74d02068@google.com>
Subject: [PATCH v3 1/4] rust: workqueue: restrict delayed work to global wqs
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

When a workqueue is shut down, delayed work that is pending but not
scheduled does not get properly cleaned up, so it's not safe to use
`enqueue_delayed` on a workqueue that might be destroyed. To fix this,
restricted `enqueue_delayed` to static queues.

This may be fixed in the future by an approach along the lines of [1].

Cc: stable@vger.kernel.org
Fixes: 7c098cd5eaae ("workqueue: rust: add delayed work items")
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Gary Guo <gary@garyguo.net>
Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Link: https://lore.kernel.org/r/20250423-destroy-workqueue-flush-v1-1-3d74820780a5@google.com [1]
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/workqueue.rs | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index 7e253b6f299c..aa8a472f4547 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -302,8 +302,15 @@ pub fn enqueue<W, const ID: u64>(&self, w: W) -> W::EnqueueOutput
     ///
     /// This may fail if the work item is already enqueued in a workqueue.
     ///
+    /// This is only valid for global workqueues (with static lifetimes) because those are the only
+    /// ones that outlive all possible delayed work items.
+    ///
     /// The work item will be submitted using `WORK_CPU_UNBOUND`.
-    pub fn enqueue_delayed<W, const ID: u64>(&self, w: W, delay: Jiffies) -> W::EnqueueOutput
+    pub fn enqueue_delayed<W, const ID: u64>(
+        &'static self,
+        w: W,
+        delay: Jiffies,
+    ) -> W::EnqueueOutput
     where
         W: RawDelayedWorkItem<ID> + Send + 'static,
     {

-- 
2.56.0.212.g129ede20d9-goog

