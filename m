Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF47E3C345C;
	Sat, 30 May 2026 13:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780147667; cv=none; b=G4+Rotxl8P+skeRNodnrpC42WerAUX3SxQ9vEy3pEENeqVnI+RPVNruXgPIPvfOs0sQ6GwOIaZSQKuLxFWKd3SA+1B2SUWzS2m2fI2RNV4Xsku4mE28Li7ORZtmqFs61JX/Kd84sjlELpKmOe54Od9DKGcg5XK+vW+wzBb/QJcw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780147667; c=relaxed/simple;
	bh=u0ku0xS8ydO8YMW4rkNEsmjR08j26cXSsEju375/Y0c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=OkQRkO4NR/5t53ZNvYuooY78sYwNMPKIrC2l9WKYUith4VQG/zjTgs2A+tajU99a3qJ/4EuY0CGQO6D80xaB8iRUd68OlAQsubeimUqtxCEqTcBES1/fwxF1xKrjZUJQ159XWAWCad9v0GO5nR8C1MBuYarQ/1Qz25IwDJ+sbM4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DowU7Cfo; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DowU7Cfo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 796E21F00898;
	Sat, 30 May 2026 13:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780147666;
	bh=vfqnTi4tnwYTmW+k2U/TOVU+rT4u0rWBC4MTuUVMl5I=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=DowU7CfoK4CWVLwvkSY4e1xu+PcZq429vw7Bd7aCWSvS36NDwvyQz1XebE3zQERNQ
	 ipmtp801DrLKpC3W0ULFKZxFE7JrvJ54h/WGNc2RIYX2nl/W1fIu8sOtcR0rJ0TWKB
	 L11JZwvNzM9WCHKoMfGZe71H5t8zqUaXGmnlHprYaVInG3qFWt5M2V5duZzeBzmgY+
	 ryCSDvVwSSXcOO5j3AjIS0QTGAtY6RQS+Y5CM8c5AIsxAS33ZPn5oDCyqDeD4QGh42
	 /wQHExRpDUqxLKnKkChBiVLV9Y5k/yhoH8PHxWaAPNTsv5tazlI5RTSS4Lmf7V/p5c
	 gaSJlkzwy7hHQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu,
	beata.michalska@arm.com,
	markus.probst@posteo.de
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: [PATCH 2/2] rust: device: move drvdata_borrow() to InternalBoundContext
Date: Sat, 30 May 2026 15:27:32 +0200
Message-ID: <20260530132736.3298549-2-dakr@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260530132736.3298549-1-dakr@kernel.org>
References: <20260530132736.3298549-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move drvdata_borrow() from impl Device<CoreInternal<'a>> to
impl<Ctx: InternalBoundContext> Device<Ctx>, making it available from
both CoreInternal and BoundInternal contexts.

Fold drvdata_unchecked() (previously on Device<Bound>) directly into
drvdata_borrow(), since it was only called from there and the generic
context cannot resolve methods through the deref chain.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/device.rs | 18 ++----------------
 1 file changed, 2 insertions(+), 16 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 354c4045f404..b538c39982a6 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -236,7 +236,9 @@ pub(crate) unsafe fn drvdata_obtain<T>(&self) -> Option<Pin<KBox<T>>> {
         //   in `into_foreign()`.
         Some(unsafe { Pin::<KBox<T>>::from_foreign(ptr.cast()) })
     }
+}
 
+impl<Ctx: InternalBoundContext> Device<Ctx> {
     /// Borrow the driver's private data bound to this [`Device`].
     ///
     /// # Safety
@@ -246,22 +248,6 @@ pub(crate) unsafe fn drvdata_obtain<T>(&self) -> Option<Pin<KBox<T>>> {
     /// - The type `T` must match the type of the `ForeignOwnable` previously stored by
     ///   [`Device::set_drvdata`].
     pub unsafe fn drvdata_borrow<T>(&self) -> Pin<&T> {
-        // SAFETY: `drvdata_unchecked()` has the exact same safety requirements as the ones
-        // required by this method.
-        unsafe { self.drvdata_unchecked() }
-    }
-}
-
-impl Device<Bound> {
-    /// Borrow the driver's private data bound to this [`Device`].
-    ///
-    /// # Safety
-    ///
-    /// - Must only be called after a preceding call to [`Device::set_drvdata`] and before
-    ///   the device is fully unbound.
-    /// - The type `T` must match the type of the `ForeignOwnable` previously stored by
-    ///   [`Device::set_drvdata`].
-    unsafe fn drvdata_unchecked<T>(&self) -> Pin<&T> {
         // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
         let ptr = unsafe { bindings::dev_get_drvdata(self.as_raw()) };
 
-- 
2.54.0

