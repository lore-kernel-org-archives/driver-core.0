Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86FB7400985
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 10:22:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784197378; cv=none; b=CuIbROiYCxas11zFW/2YZ6DojQabf5excBMGfsj8dLVNTZMc5Bsne4qJX++ySoyfVMmAFjAO9XRkgG6TqUryac/wLd+2NM5fQD9qbNbqg1/gWzFOo865aGkqZOL9DDw4MeDsS/3Hs+MV9f9AFZ6Pd/Yzw/HCN7ysjr+iO6hmu1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784197378; c=relaxed/simple;
	bh=CEB7cSB5VZeuvZcE2U7qcb4DmzUSxIr4fcv6Fn/xfYs=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=SUMqDD1C9x55X23f7mao2p3pqWg5cC58ntyZrE+dLsyViy6zKw1o7KPE8eIpuCWL3InSppb5Nhz95kptQq125qQDptuAqvf0QRwTEfpA4BeCwYRzJTcGRSRlu0hlQG+zjnuDuCgYMUDMy5kgjDWCZK3CTdELbmguJF/yoIlx7Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=N1XWSBYE; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="N1XWSBYE"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-47f24a50f0cso5569978f8f.3
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 03:22:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1784197374; x=1784802174; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:mime-version:date:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l4LZHVP1BW407EGuW6dnUL3Kfk1zeC5bbxSp3F5DgwI=;
        b=N1XWSBYEibNc1eUQxUF/+o5AnLxVCOUJNNZjX54IZkcrUdfKw3e17tqvUNKo655xQH
         9h/KnXk53Kg4KOOB36Sknfqbx119QIqnVAp1Cs1k7P1tZnbhD6OGDUVgVDxJCXvPnXir
         Ixo7RDOIhuqYMcNlk5qzNoGuNPrSj7CRTQF0MrKONudnUQXi0xzG3S/3mKjJ87BlEX6e
         tpHq/y/zd3egAy8Ogto2b91TG1C0mSTLoSXZicP2FwDdQFGAjlArIdevYfYlEo1xDM8m
         i248h35IM7pQeqUCBxH5D1RgN8IfAGAJubeC+G2X7BpRoY6VntnbMmG1cnmsLf7XXTPb
         9+8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784197374; x=1784802174;
        h=content-type:cc:to:from:subject:message-id:mime-version:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l4LZHVP1BW407EGuW6dnUL3Kfk1zeC5bbxSp3F5DgwI=;
        b=dJ7aC4Hiy8rEGFXn9wJEbxuJ2nZB3lvEt8bgrxcbor981KbOIh9JoBmGShEoGwSOn0
         DnP8NnwwtCZL+Sp3zbQMUZtrT3hCHOtoszoRPdrWbWetjpiQxMWZHwmW/PN2sI39cpkY
         wNuOfnGn2rEMsO9WdcI1qy5QkP3QHB6KGdaSWdCuIpP+dvEvrEgp2j/UIxv53i3Bi/0N
         v66BbjFo4RF6TqJu0ztPjJv83A+R+eRKXOzd0v0rsRSrghwyD//B0N+YBM6/X1ZzlnmE
         C6QJZE+buZCDBdyhlEaEYzmyl7pcFko+cr7QU62TK3DYKCP+gN+LV6ryYJu4uQDVcRNe
         Ji5w==
X-Gm-Message-State: AOJu0YyNSHusgAi5pkJZDUdX43Mv4nIiF/7uUmNO+haodI23sfn3m/Bs
	3YEW8HSopS+UlXPNKppjxXrFeD4xq2CO4DH59J1ru6gA84WEo+oi40zrn2iz8MftXjqZCRpcK3E
	AqO3OV7B+igQrp3UjMQ==
X-Received: from wrwa16.prod.google.com ([2002:a5d:53d0:0:b0:478:b7dc:65f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64e5:0:b0:47e:81aa:3822 with SMTP id ffacd0b85a97d-47f4fd1fe44mr7437542f8f.42.1784197373274;
 Thu, 16 Jul 2026 03:22:53 -0700 (PDT)
Date: Thu, 16 Jul 2026 10:22:43 +0000
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAPKwWGoC/x2MwQqAIBAFfyX23IJ6KOpXooNsr1ooDY0Ion9PO
 g7MzEMZSZGprx5KuDRrDAVsXZGsPixgnQqTM64xrW14KpKAz+R144xdJW4xsBXj4Dp4KzOV+Ei Y9f7Hw/i+H7ui3LFoAAAA
X-Change-Id: 20260716-device-trail-semicolon-1c02e29ea1cf
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=4264; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=CEB7cSB5VZeuvZcE2U7qcb4DmzUSxIr4fcv6Fn/xfYs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBqWLD1ZEdWyiv8/XGg2gs9Lu+iwlm/WL70pP1cZ
 /pV+LIAqbCJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaliw9QAKCRAEWL7uWMY5
 Rk6jEACcW8b4A/RlINCpHGoMmXGQcgHokZ8vPjmXpT9qRxwwmJE83jpOLI+MPs584bexMND7BP0
 m4poFxC9crPBJcsIGBUepVSsjH61PFcD6nTLnP2EZTjeQY5LYrSWjq+n4uDee6kqQceqHiiq0nL
 wk8JXBN5ijd24PXxo4tonmxfVWiwCXkuBewwDNfiBrDoFTdDxB2bl+fQYglhz+8+Re8qSYanve+
 D1ONODxgnK6pNq1qh/hFlr1UisNsM8iuqTUdaxD1q7Szc7SkLNz/tyPiP+dmc8pZJ+OU+LHsRwF
 jm3H/mG9xzWkxIeMhNiBvbw4lqISgpgUv9tLcyjZtYTt92XrR5gzjgCJPbxlm4mxQbQg5mCoDh6
 5Na2xrtLZXiziyI1t08go0olRltnhWq0tHgOrg26gw2contCSpehq0tQq5cZ1IRO0K6Zk1oIQkW
 YQWk0Thc0GdZoYZPtcQpD5Uaew4Vb7Cm+uPK9vhbAKls/nSsAVqLtYTd6g3hJ4FnFQcuvn2R9cj
 +PIrDAQdTywUe3s5uaupHRGQTie/QP9qhIrdv8VrLV/Coqk6jqpxshtWhHs0MHh3QdPZYUfwKza
 t2Qrv8MVTp0jCxigYYlcWjPAr34FiF1C38Mw6d6tZEo412IAQQuuJHR40wo480sUmovZH+IF4Cl FzbB+ES4KqcHlTg==
X-Mailer: b4 0.14.3
Message-ID: <20260716-device-trail-semicolon-v1-1-f48e9dcfae15@google.com>
Subject: [PATCH] rust: device: avoid trailing ; in printing macros
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

These macros are used like expressions, so they should must not emit a
semicolon. This is being turned into a hard error in a future release of
Rust.

error: trailing semicolon in macro used in expression position
  --> drivers/gpu/nova-core/firmware/fsp.rs:79:34
   |
79 |                 .inspect_err(|_| dev_err!(dev, "FMC firmware missing '{}' section\n", name))
   |                                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
   |
   = warning: this was previously accepted by the compiler but is being phased out; it will become a hard error in a future release!
   = note: for more information, see issue #79813 <https://github.com/rust-lang/rust/issues/79813>
   = note: this error originates in the macro `dev_err` (in Nightly builds, run with -Z macro-backtrace for more info)

Cc: stable@vger.kernel.org
Fixes: 5c7ca6fa603f ("rust: add `dev_*` print macros.")
Link: https://github.com/rust-lang/rust/issues/79813
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/kernel/device.rs | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 645afc49a27d..1a38b3bbdfb7 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -708,9 +708,7 @@ macro_rules! impl_device_context_into_aref {
 #[macro_export]
 macro_rules! dev_printk {
     ($method:ident, $dev:expr, $($f:tt)*) => {
-        {
-            $crate::device::Device::$method($dev.as_ref(), $crate::prelude::fmt!($($f)*))
-        }
+        $crate::device::Device::$method($dev.as_ref(), $crate::prelude::fmt!($($f)*))
     }
 }
 
@@ -737,7 +735,7 @@ macro_rules! dev_printk {
 /// ```
 #[macro_export]
 macro_rules! dev_emerg {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_emerg, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_emerg, $($f)*) }
 }
 
 /// Prints an alert-level message (level 1) prefixed with device information.
@@ -763,7 +761,7 @@ macro_rules! dev_emerg {
 /// ```
 #[macro_export]
 macro_rules! dev_alert {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_alert, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_alert, $($f)*) }
 }
 
 /// Prints a critical-level message (level 2) prefixed with device information.
@@ -789,7 +787,7 @@ macro_rules! dev_alert {
 /// ```
 #[macro_export]
 macro_rules! dev_crit {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_crit, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_crit, $($f)*) }
 }
 
 /// Prints an error-level message (level 3) prefixed with device information.
@@ -815,7 +813,7 @@ macro_rules! dev_crit {
 /// ```
 #[macro_export]
 macro_rules! dev_err {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_err, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_err, $($f)*) }
 }
 
 /// Prints a warning-level message (level 4) prefixed with device information.
@@ -841,7 +839,7 @@ macro_rules! dev_err {
 /// ```
 #[macro_export]
 macro_rules! dev_warn {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_warn, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_warn, $($f)*) }
 }
 
 /// Prints a notice-level message (level 5) prefixed with device information.
@@ -867,7 +865,7 @@ macro_rules! dev_warn {
 /// ```
 #[macro_export]
 macro_rules! dev_notice {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_notice, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_notice, $($f)*) }
 }
 
 /// Prints an info-level message (level 6) prefixed with device information.
@@ -893,7 +891,7 @@ macro_rules! dev_notice {
 /// ```
 #[macro_export]
 macro_rules! dev_info {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_info, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_info, $($f)*) }
 }
 
 /// Prints a debug-level message (level 7) prefixed with device information.
@@ -919,5 +917,5 @@ macro_rules! dev_info {
 /// ```
 #[macro_export]
 macro_rules! dev_dbg {
-    ($($f:tt)*) => { $crate::dev_printk!(pr_dbg, $($f)*); }
+    ($($f:tt)*) => { $crate::dev_printk!(pr_dbg, $($f)*) }
 }

---
base-commit: a13c140cc289c0b7b3770bce5b3ad42ab35074aa
change-id: 20260716-device-trail-semicolon-1c02e29ea1cf

Best regards,
-- 
Alice Ryhl <aliceryhl@google.com>

