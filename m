Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792452894;
	b=BR61qRtSx+Ho8+C8DrH6E4tvEMlnQlIWHS1D0w49OfIPztnFBUsGDk01PWfsOA/ajWyJ
	 kyVh9JooNjpt53c2V2oDVIkLbzyIydwivIxUBmbi/y+bPDqAYzgy0SL/3wQ0NEquEOIDc
	 ZqkyJMofhtJcnWtU4gI/QiPgfpYvydQIcQPotr0XK1FZGbomcBeZSVTYyw/+P8QWN/rqt
	 yDjWXFwxNIyCUzg5RKRXtgsKzBrodoQD9wgzgZt45Wnlvlgg1ik6Exm55eieuEq3mb1ul
	 dvKZMz5XQygGiBtt6haR1NUMd/Neq6kkiqrjLnCzfwSft/DmpJf/EemVu0ybgitmyog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792452894;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=hL9z3sxmqPHu6DZpQKLBUOtEfTvn2OY05fH87pUmBmw=;
	b=gj1EnZFM8fWoz8o2LC6IBn7k+CcmeBv7CoFcu9OTEy6hDhXCm47sgxKtD78F218bp1MN
	 yOG1CFk9/7zYw0RTY4I9AJ/qkF1/wm38lP0vYkFDXIlbi6q4A9gHe0olkLkDAwgMXlTe9
	 Po7x4erms0BugCgFsNa+sUYP2KAFFRoA2yNFk0eZEuIbLeIOMmlk18q5eaNmqk0+6P8k4
	 fktnnbHT+8bo9QIon7Z5H9mdSVGKu/osYMCaDBfL/pbzsCAdpctXR+pJz7meO9uvnx9yG
	 1RYrL7f/9wqJ5lusNAXNvHxQSenabqjWBJU+6SytuxB0sL7eVsSRf5csLgC3lgtAvFg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Sip1INfC;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE172606A324
	for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 23:34:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EE172606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--samitolvanen.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=Sip1INfC
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-35c3c370b17so5235530eec.0
        for <driver-core@lists.linux.dev>; Mon, 19 Oct 2026 16:34:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792452893; x=1793057693; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hL9z3sxmqPHu6DZpQKLBUOtEfTvn2OY05fH87pUmBmw=;
        b=Sip1INfCUV5WQqyCjnzs7gnzOof3LvqgpHy2Gm9/ZcLjR5KiuMNRihNZyRaHtPZkTQ
         IrMNGtYpw/fEt+Z9WDoyxs0dKIpivGkZF8VBozGC3zxUGbofZ+vnc7GGz2aXUJObBcDq
         5YmrY1U4kN2dOJe2iE/spmUyIB3aPLfBf1QxQLCK4dpgDiqGXdqPIOGQc+hPia85G8na
         b4THa9fo8dHwAqk0OWoypTVJpGrC6DaJwAWn2E0s4eBmFYhg4Iv+ogm4YkZCk7OB1iX1
         y/gqjR+ugha5fq8mQrBAi8wowxyn1jDwh2BpU5xMIBo3llUSyyyZJcIMAqUpbJzPgv8e
         Ov+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792452893; x=1793057693;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=hL9z3sxmqPHu6DZpQKLBUOtEfTvn2OY05fH87pUmBmw=;
        b=vBElDEc5zRwyY1PoMnrXO45+jIPprug4jRT+hSJIx7FIKcM164zFafxA3aWyaDrrwp
         Ohf4lPOcM9SHrLA2gOaCDE4FCKtLbg4O2VbmixHqhUPCwXXbUPIwJzforHQxd02sOZpQ
         OaRARNSevLc1QVnCGnWTviMGT7viYBcag51Uqji3av5ssED6WWhdADhFJlQwBIsCHSxh
         5Hoat0irNUOI50glg1IASHZvUw2a4s72nFl7/9VlF5Q3MNhAZX4I7bKLKsMWJ3196872
         so+LIGOEF7O7BRfQ5LMNrQkmMWH7vqMDRYkWfr9hQYMkqStQOHVpL2Txi55FZOtZIBPJ
         9oPQ==
X-Forwarded-Encrypted: i=1; AKwUvBzkPYJII5j5pzk6sgNBMPL4LYSvIpqg88fqA88yAsyyDcXVd2Tgq03pyE0JVmusDSUaX6hYOAW0BuidHw==@lists.linux.dev
X-Gm-Message-State: AFq9FYLkaIDq5LCIShmTZymV62v3J/2Rc1JNnrTbWTQdKqa5lUpvtBts
	kHd8q+O2AnjEwCafMo5Phh2LXFJryrrBxr1Zun8VxR8zJUzMp2X62VesjYAj3jXt+fcAFg1daUW
	2xgIgpvftFRpVgh7HEq0irv6Unj7AnQ==
X-Received: from dldyq17-n2.prod.google.com ([2002:a05:701b:4551:20b0:14e:8121:6eda])
 (user=samitolvanen job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:701b:2414:b0:18d:2a:370b with SMTP id a92af1059eb24-18d002a3854mr1805095c88.9.1792452892724;
 Mon, 19 Oct 2026 16:34:52 -0700 (PDT)
Date: Mon, 19 Oct 2026 23:34:39 +0000
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4650; i=samitolvanen@google.com;
 h=from:subject:message-id; bh=JwJNlGuBiQ8g6xhZrLGYDfrsZ7obgLAdDp/5rBj/R3w=;
 b=owGbwMvMwCUWxa662nLh8irG02pJDFnXVoqpNN3YtdNaKtPpfNf8v2pbOA2L7kS4XOWS+3y+6
 ca3TNYrHaUsDGJcDLJiiiwtX1dv3f3dKfXV5yIJmDmsTCBDGLg4BWAit1cy/Pdz9JgoqsF//5WP
 /8kXnHIfMktTw3VL/ul8bz6xSPPHTEaG/+UPS0RPqF6LKwmKPy5dsOvXipQri4xiTrnO33daUuX 8Sl4A
X-Mailer: b4 0.14.3
Message-ID: <20261019-rust-cfi-fixes-v1-3-9503472ba738@google.com>
Subject: [PATCH 3/3] rust: dma: declare cfi_encoding for dma_data_direction
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

bindgen generates bindings::dma_data_direction as an integer by default,
while C callback tables such as dma_buf_ops declare the parameter as
enum dma_data_direction. kCFI encodes enum types by name even with
integer normalization, so the type ids would not match when C calls into
a Rust callback taking bindings::dma_data_direction.

Generate dma_data_direction as a newtype with a cfi_encoding, as is done
for lru_status, and convert DataDirection through the newtype's
constants.

Signed-off-by: Sami Tolvanen <samitolvanen@google.com>
---
 rust/bindgen_parameters |  2 ++
 rust/kernel/dma.rs      | 21 +++++++++++----------
 2 files changed, 13 insertions(+), 10 deletions(-)

diff --git a/rust/bindgen_parameters b/rust/bindgen_parameters
index 6003d5127676..8577e7663e02 100644
--- a/rust/bindgen_parameters
+++ b/rust/bindgen_parameters
@@ -27,6 +27,8 @@
 --opaque-type spinlock
 
 # enums that appear in indirect function calls should specify a cfi type
+--newtype-enum dma_data_direction
+--with-attribute-custom-enum=dma_data_direction='#[cfi_encoding="18dma_data_direction"]'
 --newtype-enum hrtimer_restart
 --with-attribute-custom-enum=hrtimer_restart='#[cfi_encoding="15hrtimer_restart"]'
 --newtype-enum irqreturn
diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 2ce09f8e90c6..2ec5fe7d56bc 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -310,25 +310,25 @@ pub enum DataDirection {
     ///
     /// This is used when the buffer can be both read from and written to by the device.
     /// The cache for the corresponding memory region is both flushed and invalidated.
-    Bidirectional = Self::const_cast(bindings::dma_data_direction_DMA_BIDIRECTIONAL),
+    Bidirectional = Self::const_cast(bindings::dma_data_direction::DMA_BIDIRECTIONAL),
 
     /// The DMA mapping is for data transfer from memory to the device (write).
     ///
     /// The CPU has prepared data in the buffer, and the device will read it.
     /// The cache for the corresponding memory region is flushed before device access.
-    ToDevice = Self::const_cast(bindings::dma_data_direction_DMA_TO_DEVICE),
+    ToDevice = Self::const_cast(bindings::dma_data_direction::DMA_TO_DEVICE),
 
     /// The DMA mapping is for data transfer from the device to memory (read).
     ///
     /// The device will write data into the buffer for the CPU to read.
     /// The cache for the corresponding memory region is invalidated before CPU access.
-    FromDevice = Self::const_cast(bindings::dma_data_direction_DMA_FROM_DEVICE),
+    FromDevice = Self::const_cast(bindings::dma_data_direction::DMA_FROM_DEVICE),
 
     /// The DMA mapping is not for data transfer.
     ///
     /// This is primarily for debugging purposes. With this direction, the DMA mapping API
     /// will not perform any cache coherency operations.
-    None = Self::const_cast(bindings::dma_data_direction_DMA_NONE),
+    None = Self::const_cast(bindings::dma_data_direction::DMA_NONE),
 }
 
 impl DataDirection {
@@ -340,7 +340,7 @@ const fn const_cast(val: bindings::dma_data_direction) -> u32 {
         // CAST: The C standard allows compilers to choose different integer types for enums.
         // To safely check the value, we cast it to a wide signed integer type (`i128`)
         // which can hold any standard C integer enum type without truncation.
-        let wide_val = val as i128;
+        let wide_val = val.0 as i128;
 
         // Check if the value is outside the valid range for the target type `u32`.
         // CAST: `u32::MAX` is cast to `i128` to match the type of `wide_val` for the comparison.
@@ -358,11 +358,12 @@ const fn const_cast(val: bindings::dma_data_direction) -> u32 {
 impl From<DataDirection> for bindings::dma_data_direction {
     /// Returns the raw representation of [`enum dma_data_direction`].
     fn from(direction: DataDirection) -> Self {
-        // CAST: `direction as u32` gets the underlying representation of our `#[repr(u32)]` enum.
-        // The subsequent cast to `Self` (the bindgen type) assumes the C enum is compatible
-        // with the enum variants of `DataDirection`, which is a valid assumption given our
-        // compile-time checks.
-        direction as u32 as Self
+        match direction {
+            DataDirection::Bidirectional => Self::DMA_BIDIRECTIONAL,
+            DataDirection::ToDevice => Self::DMA_TO_DEVICE,
+            DataDirection::FromDevice => Self::DMA_FROM_DEVICE,
+            DataDirection::None => Self::DMA_NONE,
+        }
     }
 }
 

-- 
2.56.0.212.g129ede20d9-goog

