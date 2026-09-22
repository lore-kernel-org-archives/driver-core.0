Received: from quail.birch.relay.mailchannels.net (quail.birch.relay.mailchannels.net [23.83.209.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0CCD4A68A9
	for <driver-core@lists.linux.dev>; Tue, 22 Sep 2026 19:44:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=23.83.209.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790106298; cv=none; b=strpAH3NlSx47Yrq+3PAizADjC+Rg+asReugnznLOU/WDClbPLvX+9kkfnbw+R8kfXK7IKoe/+L9+QG0NowHYGHqlf3OGx7nZk6znRe0x4UMk+nUGXwJZeC5YqxCxsLORwvBD5Hi2TAQXJCI+6ps5EknjaOdyyjgSWWPjAdN+os=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790106298; c=relaxed/simple;
	bh=VZ1siS7xTNAhWQlCzpVc4gscwrJNvuqdWAZNtG9MlnU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Xa6K+uO+2wwalok12QvM9xVwNQxlf+cyubc94Bn8bOpbCFvz767nQMp+SkHkftMj3gJOcHz2V09vItxInuwQ+fVOR3vV9Xi/vfcvWQYIyr5Ak8SfiZ8W0u7O6ky3DEUkBmflFf/Xqn9Pamz8ZMjGSfEUj0KzzxUSsdBTupu9kuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaehlcke.net; spf=pass smtp.mailfrom=kaehlcke.net; dkim=pass (2048-bit key) header.d=kaehlcke.net header.i=@kaehlcke.net header.b=oLTaMvI8; arc=none smtp.client-ip=23.83.209.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kaehlcke.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kaehlcke.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kaehlcke.net header.i=@kaehlcke.net header.b="oLTaMvI8"
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 81CBF8C21C8;
	Tue, 22 Sep 2026 19:19:01 +0000 (UTC)
Received: from pdx1-sub0-mail-a203.dreamhost.com (trex-green-9.trex.outbound.svc.cluster.local [100.99.242.205])
	(Authenticated sender: dreamhost)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3D4B28C1F5D;
	Tue, 22 Sep 2026 19:19:01 +0000 (UTC)
X-Sender-Id: dreamhost|x-authsender|matthias@kaehlcke.net
X-MC-Relay: Neutral
X-MailChannels-SenderId: dreamhost|x-authsender|matthias@kaehlcke.net
X-MailChannels-Auth-Id: dreamhost
X-White-Shade: 20a291dd35d68a00_1790104741363_1945273157
X-MC-Loop-Signature: 1790104741363:957160975
X-MC-Ingress-Time: 1790104741363
Received: from pdx1-sub0-mail-a203.dreamhost.com (pop.dreamhost.com
 [64.90.62.162])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.99.242.205 (trex/8.0.2);
	Tue, 22 Sep 2026 19:19:01 +0000
Received: from bielski.sytes.net (unknown [79.117.203.148])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: matthias@kaehlcke.net)
	by pdx1-sub0-mail-a203.dreamhost.com (Postfix) with ESMTPSA id 4hq8z86XFNzRK;
	Tue, 22 Sep 2026 12:19:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kaehlcke.net;
	s=dreamhost; t=1790104741;
	bh=6Hr6Gc85beWAWBHxVe+VIi8zg8VzPZDdvD/Wvy27PMc=;
	h=Date:From:To:Cc:Subject:Content-Type;
	b=oLTaMvI8ROD+DN9xUk684TXhp/uvnJTB0e1PoBHshztKB6TbaPUxTctMU4W8wkexI
	 9iWCUA6kilUJL5Eiw/9D/8LCOsQCYXT58fRVtNVX+egEkmCu5imdKvYz8rxK3+pKtZ
	 UbL7BxiltmMM+JggLkHCyDKC6KIe5bwBtAJ1HN0HusAyO6t2g76c6qUYG8M0QRwc0A
	 ozFkLn0+tUeE0wHwao2+zsZaz7vnP63Jr+WecIdnlrzwYkIzt3lZKzgrOP9msgdDDW
	 zYAs2Wtx2Bo7Xgi7rCXNa3eOcxRuV3osLJs92ZKU/BK5QqDViMMnGabn2FIg9U3KHv
	 AgPPbKaOKx1vQ==
Received: by bielski.sytes.net (Postfix, from userid 1000)
	id 556E280E1C; Tue, 22 Sep 2026 12:18:58 -0700 (PDT)
Date: Tue, 22 Sep 2026 21:18:58 +0200
From: Matthias Kaehlcke <matthias@kaehlcke.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] rust: debugfs: add primitive type bindings
Message-ID: <9306c51f937e4bb4026e68d862b64b16f6894282.1790103860.git.matthias@kaehlcke.net>
Mail-Followup-To: Matthias Kaehlcke <matthias@kaehlcke.net>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>, driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Introduce `impl_debugfs_primitive!` to implement debugfs attribute
creation for native Rust primitive types by wrapping C debugfs creation
helpers.

Signed-off-by: Matthias Kaehlcke <matthias@kaehlcke.net>
---
 rust/kernel/debugfs.rs       | 52 +++++++++++++++++++++
 samples/rust/rust_debugfs.rs | 91 ++++++++++++++++++++++++++++++++++++
 2 files changed, 143 insertions(+)

diff --git a/rust/kernel/debugfs.rs b/rust/kernel/debugfs.rs
index d7b8014a6474..bec600c67a06 100644
--- a/rust/kernel/debugfs.rs
+++ b/rust/kernel/debugfs.rs
@@ -400,6 +400,58 @@ pub fn scope<'a, T: 'a, E: 'a, F>(
     }
 }
 
+/// Implements `debugfs` interface operations for a single primitive type.
+///
+/// This macro generates the necessary FFI wrappers and glue code to expose
+/// a specific primitive type (e.g., `u32`, `bool`) to the `debugfs` filesystem.
+///
+/// # Type Support
+///
+/// Accepts standard integer primitives (`u8` through `u64`, `x8` through `x64`),
+/// `bool`, and `usize`.
+///
+/// # Examples
+///
+/// ```rust,ignore
+/// impl_debugfs_primitive!(u32, create_u32, debugfs_create_u32);
+/// ```
+macro_rules! impl_debugfs_primitive {
+    ($type:ty, $fn_name:ident,$c_func:ident) => {
+        impl Dir {
+            /// Creates a debugfs entry for a primitive `$type` value inside this directory.
+            ///
+            /// # Safety
+            ///
+            /// `value` must point to a valid memory location that outlives this directory `Dir`
+            /// (e.g., inside a pinned driver state structure or a `static` location).
+            pub unsafe fn $fn_name(&self, name: &CStr, mode: u16, value: *mut $type) {
+                let parent_ptr = match self.0.as_deref() {
+                    Some(entry) => entry.as_ptr(),
+                    None => core::ptr::null_mut(),
+                };
+
+                // SAFETY: `name` is a valid CStr. `parent_ptr` points to a valid parent
+                // dentry or NULL. The caller guarantees that `value` outlives the debugfs node.
+                unsafe {
+                    bindings::$c_func(name.as_char_ptr(), mode, parent_ptr, value);
+                }
+            }
+        }
+    };
+}
+
+// Bind native Rust primitive types to their corresponding C debugfs helpers.
+impl_debugfs_primitive!(u8, create_u8, debugfs_create_u8);
+impl_debugfs_primitive!(u16, create_u16, debugfs_create_u16);
+impl_debugfs_primitive!(u32, create_u32, debugfs_create_u32);
+impl_debugfs_primitive!(u64, create_u64, debugfs_create_u64);
+impl_debugfs_primitive!(u8, create_x8, debugfs_create_x8);
+impl_debugfs_primitive!(u16, create_x16, debugfs_create_x16);
+impl_debugfs_primitive!(u32, create_x32, debugfs_create_x32);
+impl_debugfs_primitive!(u64, create_x64, debugfs_create_x64);
+impl_debugfs_primitive!(bool, create_bool, debugfs_create_bool);
+impl_debugfs_primitive!(usize, create_size_t, debugfs_create_size_t);
+
 #[pin_data]
 /// Handle to a DebugFS scope, which ensures that attached `data` will outlive the DebugFS entry
 /// without moving.
diff --git a/samples/rust/rust_debugfs.rs b/samples/rust/rust_debugfs.rs
index 77c19a437695..b2ef8c71f7ee 100644
--- a/samples/rust/rust_debugfs.rs
+++ b/samples/rust/rust_debugfs.rs
@@ -34,6 +34,7 @@
 use core::str::FromStr;
 use kernel::{
     acpi,
+    c_str,
     debugfs::{
         Dir,
         File, //
@@ -79,6 +80,8 @@ struct RustDebugFs {
     array_blob: File<Mutex<[u8; 4]>>,
     #[pin]
     vector_blob: File<Mutex<KVec<u8>>>,
+    #[pin]
+    primitive_values: PrimitiveValues,
 }
 
 #[derive(Debug)]
@@ -87,6 +90,36 @@ struct Inner {
     y: u32,
 }
 
+struct PrimitiveValues {
+    u8: u8,
+    u16: u16,
+    u32: u32,
+    u64: u64,
+    x8: u8,
+    x16: u16,
+    x32: u32,
+    x64: u64,
+    size_t: usize,
+    bool: bool,
+}
+
+impl PrimitiveValues {
+    fn new() -> Self {
+        Self {
+            u8: 8,
+            u16: 16,
+            u32: 32,
+            u64: 64,
+            x8: 0x88,
+            x16: 0x1616,
+            x32: 0x32323232,
+            x64: 0x6464646464646464,
+            size_t: 12345678,
+            bool: true,
+        }
+    }
+}
+
 impl FromStr for Inner {
     type Err = Error;
     fn from_str(s: &str) -> Result<Self> {
@@ -171,9 +204,67 @@ fn new<'a, 'b>(
                     c"vector_blob",
                     new_mutex!(kernel::kvec!(0x42; SZ_4K)?),
                 ),
+                primitive_values <- PrimitiveValues::new(),
                 _debugfs: debugfs,
                 pdev: pdev.into(),
             }
         }
+        .pin_chain(|this| {
+            // SAFETY: primitive values live until the module is dropped
+            unsafe {
+                this._debugfs.create_u8(
+                    c_str!("u8"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.u8) as *mut _,
+                );
+                this._debugfs.create_u16(
+                    c_str!("u16"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.u16) as *mut _,
+                );
+                this._debugfs.create_u32(
+                    c_str!("u32"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.u32) as *mut _,
+                );
+                this._debugfs.create_u64(
+                    c_str!("u64"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.u64) as *mut _,
+                );
+                this._debugfs.create_x8(
+                    c_str!("x8"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.x8) as *mut _,
+                );
+                this._debugfs.create_x16(
+                    c_str!("x16"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.x16) as *mut _,
+                );
+                this._debugfs.create_x32(
+                    c_str!("x32"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.x32) as *mut _,
+                );
+                this._debugfs.create_x64(
+                    c_str!("x64"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.x64) as *mut _,
+                );
+                this._debugfs.create_bool(
+                    c_str!("bool"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.bool) as *mut _,
+                );
+                this._debugfs.create_size_t(
+                    c_str!("usize"),
+                    0644,
+                    core::ptr::addr_of!(this.primitive_values.size_t) as *mut _,
+                );
+            }
+
+            Ok(())
+        })
     }
 }
-- 
2.47.3
