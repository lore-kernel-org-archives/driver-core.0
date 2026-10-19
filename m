Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.198
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452892;
	b=Ntxu0d5Sy2w4NQ7Ur2Zkuv8TWEFsyrrd4yHkBKdnwrO+EaDkFCnnGuPNtzVZ7wLACci5
	 hIchgIsjv6Awb/2+Qh0uSwPhcQHRDUO9WvKTxyK5kYbsRzgm4jS7EpBhK8DgDBsbq8REQ
	 Guwkm2t/SaU34PNZLGGqb9w/8utwxvi5B+2AmqFq1w/6my9RweMJbZPas3VTP0GDLGYcA
	 pHiYOIBniT1aBPiMmagnqMCXE6q9rKp386Dej+SJrUItxVQaiaagsnh05RXyWnrG5e7Jg
	 4rve43y/RoISoV2vx/KmWOb0MS84+YKEnguorkTfj4yogLvgG3vj4amGq775gQ8DWWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452892;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
	b=bYGVbHSROzeIEwQ3k9z8Wmm+U/e24Bx9yWxTSbv6afwAgegypEfPh1Bpga10ycBnGGwb
	 z/jRRujFES63dyfB9AFRgxhCqUbDI3Gr7fQnYZY5+F2+si2oQwkuEOlJEBUyNLKAm2fyN
	 RFBh8d70qx4AmNuvlTfIDu2qrD4nN8DuyEvF6h4jP4AI5VY5PtTR9hfeEO8XNoS8sI2Zc
	 fTBKyv1RevancB56BA5ScNR321tRafAGkpeSiX8DSIiOkWaLxiLcFLZ6gMx0zjtFUakb2
	 mg89qef1o6BP1jIz2r+DWhVKfKrjby5WRg5zkPx0RZW6Vlw45MyoAG5PuyukqIKL0mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ndwLZQN1;
	arc=none smtp.remote-ip=74.125.82.198
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C5E4606A32F
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 23:34:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5C5E4606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=ndwLZQN1
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33c35f5ca6cso5482019eec.1
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 16:34:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452890; x=1793057690; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
        b=ndwLZQN1VjLtWm64kHNBs0aByeUl+9NdWxzWGDnbn6x/RVpxRnhD0AUBXeyQLwZzzk
         FYCW0lEIpmhAGVAil3Y1HWEXaOuaa9rOLZq5RXlazZl2s29GGmkalUx/lBYc+eDNTZjD
         dLhjWOqA6bc9Lcdb+KN0XdGAZvlDowLo2DtJH7CfgucX0xKNiNdqo1j87TN0dtv4atxa
         BnmD3z8G75Q29aWzp33exnkZhJWJjO9ER/xJuJ9uudmS/TyP8xdpt37ZC/PDc3MRrQpy
         5XW8Wc0+kMowpZOjpT+cbpmdnTm/9h/rEkXTWV2Ru1prjxGydkKipHWtZxeD8RgZmfOj
         pfJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452890; x=1793057690;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yYgGBwtoModPOWWXIECz8dwnr/MeNeZyXwpagOjeJf4=;
        b=hZ9zUIzh0K0M9AN5npDkbtVX/myYWMmNm7Hk4hFgsx76zaMzRyIIsaMVYqNm6ZG5WT
         w7ZTEquXfRYjtHX0ase5GmjnyHVkBM8nZljPdljUMVUa/WoinBQOnbmpm13zxuQzWxfr
         s1UZ8jcc+ct0Z/qR5X9z0qRNdUtWh39u7VurCUZmqcPRC4AKtDJpH3ZwHwedqzMTv7LI
         AalJGukNz+EcdUW+2BaPMoN8Q8dhVtFt11fernKcMz3vAYlEHzk4LD9G2+MxXKDK9GSh
         e3QUe3+0A0a2WEkTI04jEfaCA3iLIWuKtt+sdgtSkOIgYueTa00OOgr+ByKwIwQxjrn6
         V6+A==
X-Forwarded-Encrypted: i=1; AKwUvBxVEtPYnMk1dqLdSsZ6rpW+7BxXXgJ+Q89AJ85MVAy68UUlY38L3ooDWjFtC+KRcjPRHsHVdKKxglaUZQ==@lists.linux.dev
X-Gm-Message-State: AFq9FYImOrlvgG9OI90qln4JmT4PkMEJWnyH/NIv88jBotjm0p4jDh6N
	x/wZXV2dLv+DaiGyFuuyQKRgOJJRQ3COf3aHumBPSoHythpKCkhpF/wuU4WZpdx/caFum2+1s09
	fkZWouDQg36/j6xMST0tw6rPahQlbuA==
X-Received: from dyru33.prod.google.com ([2002:a05:7300:4fa1:b0:35b:4bd1:e0fb])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:7aa3:b0:35d:74f7:3b9 with SMTP id 5a478bee46e88-361a224ccf0mr11856161eec.33.1792452889848;
 Mon, 19 Oct 2026 16:34:49 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:37 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com>
X-Developer-Key: i=samitolvanen@google.com; a=openpgp; fpr=35CCFB63B283D6D3AEB783944CB5F6848BBC56EE
X-Developer-Signature: v=1; a=openpgp-sha256; l=4533; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=uXHdbixwLcNi6iBpIxcP3Mxix2cxByC1MLC5WD58JuQ=;
 b=kA0DAAoWWgclqzmhp3oByyZiAGrWqRaiZJeszthblBaAnEB9HD3z7C0uIlr+EVlzkAOL4TKoB
 oh1BAAWCgAdFiEEhPWrtbv3QmXq83IYWgclqzmhp3oFAmrWqRYACgkQWgclqzmhp3ofpAEAvbBx
 TqUhXZQDkt25mUO+xCmdfAuf4hD++/eCuHyQR6gBAIH2CiYt/Ce4sMAG3QhYfARKs7grPvSLM9v IY6W2fhMK
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
Subject: [PATCH 1/3] rust: irq: declare cfi_encoding for irqreturn
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

The IRQ callbacks return c_uint. C calls them through irq_handler_t,
which returns enum irqreturn. kCFI encodes enum types by name even with
integer normalization, so the type ids never match and every call fails
the CFI check.

Generate irqreturn as a newtype with a cfi_encoding, as is done for
lru_status, and return bindings::irqreturn_t from the callbacks.

Fixes: 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handlers")
Fixes: 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters    |  2 ++
 rust/kernel/irq/request.rs | 28 +++++++++++++++++-----------
 2 files changed, 19 insertions(+), 11 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 8402b0c93545..5059cc74cb3c 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum irqreturn
+--with-attribute-custom-enum=irqreturn='#[cfi_encoding="9irqreturn"]'
 --newtype-enum lru_status
 --with-attribute-custom-enum=lru_status='#[cfi_encoding="10lru_status"]'
 
diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index c1c6525a676a..1afa9fcaad1f 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -25,10 +25,10 @@
 #[repr(u32)]
 pub enum IrqReturn {
     /// The interrupt was not from this device or was not handled.
-    None = bindings::irqreturn_IRQ_NONE,
+    None = bindings::irqreturn::IRQ_NONE.0,
 
     /// The interrupt was handled by this device.
-    Handled = bindings::irqreturn_IRQ_HANDLED,
+    Handled = bindings::irqreturn::IRQ_HANDLED.0,
 }
 
 /// Callbacks for an IRQ handler.
@@ -240,25 +240,28 @@ fn drop(self: Pin<&mut Self>) {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_irq`.
-unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn handle_irq_callback<T: Handler>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<Registration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `Registration<'_, T>` set in `Registration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle(&registration.handler) as c_uint)
 }
 
 /// The value that can be returned from [`ThreadedHandler::handle`].
 #[repr(u32)]
 pub enum ThreadedIrqReturn {
     /// The interrupt was not from this device or was not handled.
-    None = bindings::irqreturn_IRQ_NONE,
+    None = bindings::irqreturn::IRQ_NONE.0,
 
     /// The interrupt was handled by this device.
-    Handled = bindings::irqreturn_IRQ_HANDLED,
+    Handled = bindings::irqreturn::IRQ_HANDLED.0,
 
     /// The handler wants the handler thread to wake up.
-    WakeThread = bindings::irqreturn_IRQ_WAKE_THREAD,
+    WakeThread = bindings::irqreturn::IRQ_WAKE_THREAD.0,
 }
 
 /// Callbacks for a threaded IRQ handler.
@@ -461,23 +464,26 @@ fn drop(self: Pin<&mut Self>) {
 unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
     _irq: i32,
     ptr: *mut c_void,
-) -> c_uint {
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<ThreadedRegistration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<'_, T>` set in
     // `ThreadedRegistration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle(&registration.handler) as c_uint)
 }
 
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> bindings::irqreturn_t {
     let ptr = ptr.cast_const().cast::<ThreadedRegistration<'_, T>>();
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<'_, T>` set in
     // `ThreadedRegistration::new()`.
     let registration = unsafe { &*ptr };
 
-    T::handle_threaded(&registration.handler) as c_uint
+    bindings::irqreturn_t(T::handle_threaded(&registration.handler) as c_uint)
 }

-- 
2.56.0.212.g129ede20d9-goog

