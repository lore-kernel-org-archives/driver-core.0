Received: from mail.unwrap.rs (mail.unwrap.rs [172.232.15.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8FC28641F
	for <driver-core@lists.linux.dev>; Tue, 17 Feb 2026 22:24:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=172.232.15.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771367075; cv=none; b=man/4jiTF+u7IAXKBAhEGPgYCs+oCxTy1tZvkXJrsKPvMi5PzpA823ubw/y/wcGPBxAL8qq3vcXE508r5sX2z/Bl8kG4XAr4xBXBep/2pYySEyAx67egOyuLabNuvcvEYSiXURhpEOO8q42Gy5oNvNe9yhNw+ZS+Ii/w4Up34bE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771367075; c=relaxed/simple;
	bh=wtHpZ4xJf2I080ZaOgCSmBuS1t4rJepU1hmjLHbMsYc=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=O5E5uBZVNMLMC2bsrL9h5ponDFc02AgIvYM7GaQG2BG8PxSZbuvM67k1qxej6fxhVZREPq15b69f6Xmkxsgf7c3KBxgSOdhYu2UQZFPMzvIJOHOM5rbYLJbZ0Zw54wSm52AZIGOM9c4ObaJuGx/zhpZDOgTDJtC0qATv45/cosI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs; spf=pass smtp.mailfrom=unwrap.rs; arc=none smtp.client-ip=172.232.15.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=unwrap.rs
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=unwrap.rs
From: Cole Leavitt <cole@unwrap.rs>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>
Cc: Miguel Ojeda <ojeda@kernel.org>,
	rust-for-linux@vger.kernel.org,
	driver-core@lists.linux.dev,
	Cole Leavitt <cole@unwrap.rs>
Subject: [PATCH] rust: irq: add missing 'static bound to IRQ callback functions
Date: Tue, 17 Feb 2026 15:24:25 -0700
Message-ID: <20260217222425.8755-1-cole@unwrap.rs>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The Registration<T> and ThreadedRegistration<T> structs require
T: Handler + 'static and T: ThreadedHandler + 'static respectively.
However, the callback functions that are used with these registrations
were missing the corresponding 'static bound:

  - handle_irq_callback<T: Handler>
  - handle_threaded_irq_callback<T: ThreadedHandler>
  - thread_fn_callback<T: ThreadedHandler>

This bound inconsistency was previously accepted by rustc, but recent
compiler versions (1.93+) enforce E0310 more strictly when casting
raw pointers to references in generic contexts. The callbacks cast a
*mut c_void to a reference of the registration type, which requires
T to be valid for 'static when the registration struct requires it.

Add the missing 'static bound to all three callback functions to match
their registration struct requirements and fix compilation with recent
rustc versions.

Fixes: 135d40523244 ("rust: irq: add threaded handler support")
Signed-off-by: Cole Leavitt <cole@unwrap.rs>
---
 rust/kernel/irq/request.rs | 12 +++++++++---
 1 file changed, 9 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/irq/request.rs b/rust/kernel/irq/request.rs
index 67769800117c..7a36f790593e 100644
--- a/rust/kernel/irq/request.rs
+++ b/rust/kernel/irq/request.rs
@@ -260,7 +260,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_irq`.
-unsafe extern "C" fn handle_irq_callback<T: Handler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn handle_irq_callback<T: Handler + 'static>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> c_uint {
     // SAFETY: `ptr` is a pointer to `Registration<T>` set in `Registration::new`
     let registration = unsafe { &*(ptr as *const Registration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
@@ -478,7 +481,7 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler>(
+unsafe extern "C" fn handle_threaded_irq_callback<T: ThreadedHandler + 'static>(
     _irq: i32,
     ptr: *mut c_void,
 ) -> c_uint {
@@ -494,7 +497,10 @@ pub fn synchronize(&self, dev: &Device<Bound>) -> Result {
 /// # Safety
 ///
 /// This function should be only used as the callback in `request_threaded_irq`.
-unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler>(_irq: i32, ptr: *mut c_void) -> c_uint {
+unsafe extern "C" fn thread_fn_callback<T: ThreadedHandler + 'static>(
+    _irq: i32,
+    ptr: *mut c_void,
+) -> c_uint {
     // SAFETY: `ptr` is a pointer to `ThreadedRegistration<T>` set in `ThreadedRegistration::new`
     let registration = unsafe { &*(ptr as *const ThreadedRegistration<T>) };
     // SAFETY: The irq callback is removed before the device is unbound, so the fact that the irq
-- 
2.52.0

