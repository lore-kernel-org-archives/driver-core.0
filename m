Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96B42480DCA
	for <driver-core@lists.linux.dev>; Tue, 15 Sep 2026 10:58:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789469933; cv=none; b=QTO0Xe3/Dq6euxhN4J0sdvSRmEnD7Y08HHBLYFHjD4R+lfd2Qwjt3gN5B5a95m50PkU9wzgh9dbQ+VUqW7SUH173Fn+7tQrELr/tWWW3NnIh7URB/QU6CfoVSFZFTMKeH3lTiGO5qEFNmGeimrnjyjc+bsgxjephc1MvlH6Wt+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789469933; c=relaxed/simple;
	bh=jXuaTQjPyb4xO9pssUnGVMqVXbt5axrUd8ntimRL17Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lZZ/ugW0xzcGC8xzJXsI1+wumQVIe3PfxWAlScJm9NFaUBb4VNS5WP3Qv2FTvh/Hd8yKOuU/Ek1J0lUAB50lq3OciJiwYYK11nkgwLxtDc0l6sMTmOCjLA/sKphOEL3d5F60QjiDSAJqnXWAKVCnErZh9OiYYgD4GwVcttkgrLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=EuRWrGyM; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="EuRWrGyM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789469929;
	bh=jXuaTQjPyb4xO9pssUnGVMqVXbt5axrUd8ntimRL17Q=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=EuRWrGyMky5sqC2YY0KHkT9vd7lfG6XfE1C6AXwg9Sxar+zp542kUsEtrP54q+S19
	 dQCMCwi7UusMNH15rABFI9MDB1J5nA4ej2I+FsBQO2t7M114ZNJmASeUVxgqcstY5d
	 KfX2H/abrloNI2RJRhau3vAOSl3tR0cxL7OfTJquXIw0rFsdwh8e41pJVPZO/qriEN
	 ueDBZKQ5BdWN7lnribqS4MPvV+0u1XQUycHz10+enc7l1PGZCZCQJM/0ashg6EvQ1U
	 hEX6pdUMvkJoGedcYSOwUGlXdvOxpUkUwapUFakk/7D8jMacevqVyUGHZ8eTtWAiga
	 AO+JzHEZn/7rA==
Received: from laura.lan (unknown [100.64.0.215])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laura.nao)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9E42717E0E01;
	Tue, 15 Sep 2026 12:58:48 +0200 (CEST)
From: Laura Nao <laura.nao@collabora.com>
Date: Tue, 15 Sep 2026 12:57:40 +0200
Subject: [PATCH 7/9] rust: time: add arch_timer_get_rate wrapper
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260915-tyr-interfaces-v1-7-5d28f1f75aca@collabora.com>
References: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com>
In-Reply-To: <20260915-tyr-interfaces-v1-0-5d28f1f75aca@collabora.com>
To: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 FUJITA Tomonori <fujita.tomonori@gmail.com>, 
 Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 Thomas Gleixner <tglx@kernel.org>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 kernel@collabora.com, Laura Nao <laura.nao@collabora.com>, 
 Deborah Brouwer <deborah.brouwer@collabora.com>
X-Mailer: b4 0.14.3

From: Deborah Brouwer <deborah.brouwer@collabora.com>

Provide a safe Rust wrapper for arch_timer_get_rate().

The Rust binding calls a C helper that returns 0 when the ARM
architectural timer is not available or not yet initialized. Map this to
Option<u32> to make the absence of a valid rate explicit to Rust callers.

This allows Rust drivers to query the system timer frequency and
select appropriate time sources when programming hardware timeouts.

Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>
Signed-off-by: Laura Nao <laura.nao@collabora.com>
---
 rust/helpers/time.c |  6 ++++++
 rust/kernel/time.rs | 30 ++++++++++++++++++++++++++++++
 2 files changed, 36 insertions(+)

diff --git a/rust/helpers/time.c b/rust/helpers/time.c
index 32f495970493..70fda31bd758 100644
--- a/rust/helpers/time.c
+++ b/rust/helpers/time.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <clocksource/arm_arch_timer.h>
 #include <linux/delay.h>
 #include <linux/ktime.h>
 #include <linux/timekeeping.h>
@@ -38,3 +39,8 @@ __rust_helper void rust_helper_udelay(unsigned long usec)
 {
 	udelay(usec);
 }
+
+__rust_helper u32 rust_helper_arch_timer_get_rate(void)
+{
+	return arch_timer_get_rate();
+}
diff --git a/rust/kernel/time.rs b/rust/kernel/time.rs
index 6c0a5e8090d0..6c48ce21984a 100644
--- a/rust/kernel/time.rs
+++ b/rust/kernel/time.rs
@@ -423,6 +423,36 @@ fn div(self, rhs: Self) -> Self::Output {
     }
 }
 
+/// Returns the ARM architecture timer frequency in Hz, if available.
+///
+/// This function queries the system-wide ARM architecture timer frequency.
+/// The architecture timer provides a consistent time source across all CPU cores.
+///
+/// Returns `None` if:
+/// - The ARM architecture timer is not available (`CONFIG_ARM_ARCH_TIMER` not enabled)
+/// - The timer rate is zero (not initialized)
+///
+/// # Examples
+///
+/// ```
+/// use kernel::time::arch_timer_get_rate;
+///
+/// if let Some(rate) = arch_timer_get_rate() {
+///     // Use `rate`.
+/// }
+/// ```
+pub fn arch_timer_get_rate() -> Option<u32> {
+    // SAFETY: The C helper is available in all configs; it calls
+    // `arch_timer_get_rate()`, which falls back to an inline stub returning 0
+    // when CONFIG_ARM_ARCH_TIMER is disabled.
+    let rate = unsafe { bindings::arch_timer_get_rate() };
+    if rate == 0 {
+        None
+    } else {
+        Some(rate)
+    }
+}
+
 impl Delta {
     /// A span of time equal to zero.
     pub const ZERO: Self = Self { value: 0 };

-- 
2.39.5

