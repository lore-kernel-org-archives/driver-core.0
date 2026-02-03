Received: from mail-dy1-f201.google.com (mail-dy1-f201.google.com [74.125.82.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61B56199FAC
	for <driver-core@lists.linux.dev>; Tue,  3 Feb 2026 15:46:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770133603; cv=none; b=Xas3x/smar4oQ3O2XiK8B+zBiB+VBMffDrvBKeCyc0IDXHcVUErmyGA3u1htu+N/ksHlLe946T8yzx03Y9CcVNU2ZH7CVP3B/vJJhrIcm6KPkPJfJRJe3OhHNFh3tqepsXrd6rem+kcDRkD0sAZjjO7MqDdilwxI/gCIXS6HMHU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770133603; c=relaxed/simple;
	bh=RwCJ/xEwqbjligRdRo7donBAUlsdrVxdbuTW9DJLV3g=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n2Idcy9UrPGPpd0cgUDwTkqqI5OUG2SUdA7YhEmIw2vsiKacKgUEDam4DvxRxGddla8Sdm6Ltxb2/Oj48CkLbQZyyo2cyAVVlSWTprzx/9f6DU3Qt0O3N/2tuliFTkLfXSbgfTMjdxTr39eVHqNuKoiIWouCIFnNdHreK0dgoSo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=brdK8dOf; arc=none smtp.client-ip=74.125.82.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--mmaurer.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="brdK8dOf"
Received: by mail-dy1-f201.google.com with SMTP id 5a478bee46e88-2b74aff34efso10550377eec.1
        for <driver-core@lists.linux.dev>; Tue, 03 Feb 2026 07:46:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770133600; x=1770738400; darn=lists.linux.dev;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=KdXVf1jtiVVdnaqb+rLnoB8/QmUjcxzniTwKjo2bXrU=;
        b=brdK8dOfTZDTG8M4+fy/IvQRnC7QxV0ggi0CCy6GNKLbKIqumU9eqS7pjr2Q7m68Cq
         IiTFbs/YJZH32Njb9QoOsI0ZvtpmbGkqYXIvbHgLNqTy+dANLSv+UBWkKOw+yfpJcmyF
         +ahcvzXOem+wdjDct3IFxs1C8B+3SR6qsHclrEMy+L5IHyT741dfVUmMaKvnMt5vADfn
         d9Nm81TqeMgVbGoyn5lCoSdg9ginmga3ujHdchl4K2M6rtx1gFtHNTNfRCufHqJhNDIg
         0nx0z9KaNtwNVPNpxd6GJdaqYU4DiZ9TK3MXPz2DkK1NIn0iw2b3PISO+o+yd2nAuP2j
         5fnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770133600; x=1770738400;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KdXVf1jtiVVdnaqb+rLnoB8/QmUjcxzniTwKjo2bXrU=;
        b=mEl1Ol8adPoyje+4GDd3HGRbODPFUbe6iz0EikLOFpeOzklw8lhERn/BDx26cFFL8z
         0MKotCo6SIALz+CMSpCgRr0Yj5irMggW/yBcTIto7ZjUWH0+kRdrBvEBy1/1bM6W1Nnj
         tnDotHGifnGAaWB53oo1QFiwoO17wQ7qWndoVv+AyQIETknXWx2IgEAPNtA5D+Ympkp/
         iiMvqPejJZ3Yl4qeqpDpMU0HMZQoCRQwYSv8ibildHiVONsw9bz4Fnsx9pRwJKg0n1Ox
         YzCBUsYHstNNy6Oe9//+AOM1tfUKw7+YJdfkjxnfBZFW6F6qDmpA1g8YhknrEEFbnmOd
         iQWA==
X-Forwarded-Encrypted: i=1; AJvYcCWBVYIFaNcRK34qhFZ9x3OpDadA3vRleVyX6aOxhlJCmYK5ner5Ah/YJXOp3qD9ErkOH5y/dxwrqo5Xmw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yxnn1ts+ddkFlED0qF+CSj7q3PSDjQl9rIiL0J81IeqCqaNXxBa
	WLK50JJsuM3JJ3pdguBeP2jXiTGynTFjmmDlPkzbCgMlQXdWnKknwF8BWMiExsU0Bj+b8wU4hdq
	u+nSp12a4Xw==
X-Received: from dycrt20.prod.google.com ([2002:a05:693c:2d94:b0:2b6:c6a7:636a])
 (user=mmaurer job=prod-delivery.src-stubby-dispatcher) by 2002:a05:693c:3002:b0:2b6:c617:f795
 with SMTP id 5a478bee46e88-2b7c86663c1mr7418033eec.17.1770133600442; Tue, 03
 Feb 2026 07:46:40 -0800 (PST)
Date: Tue, 03 Feb 2026 15:46:32 +0000
In-Reply-To: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260203-qcom-socinfo-v2-0-d6719db85637@google.com>
X-Developer-Key: i=mmaurer@google.com; a=ed25519; pk=2Ezhl7+fEjTOMVFpplDeak2AdQ8cjJieLRVJdNzrW+E=
X-Developer-Signature: v=1; a=ed25519-sha256; t=1770133593; l=2963;
 i=mmaurer@google.com; s=20250429; h=from:subject:message-id;
 bh=RwCJ/xEwqbjligRdRo7donBAUlsdrVxdbuTW9DJLV3g=; b=SQdCmaIOesp2nNqbcmI1qfM3G5NEMlAiTI7JoMUcwHSNW8vyq+fqK1lL17+OwnTzARN5rGU+z
 9PyU4DL3NSyDmB3rGdnOpkIMgMGTW/9HGTk/h/gqJgPbPfyQrUyBmYk
X-Mailer: b4 0.14.2
Message-ID: <20260203-qcom-socinfo-v2-3-d6719db85637@google.com>
Subject: [PATCH v2 3/6] rust: device: Support testing devices for equality
From: Matthew Maurer <mmaurer@google.com>
To: Bjorn Andersson <andersson@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Satya Durga Srinivasu Prabhala <satyap@quicinc.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Dave Ertman <david.m.ertman@intel.com>, 
	Ira Weiny <ira.weiny@intel.com>, Leon Romanovsky <leon@kernel.org>
Cc: Trilok Soni <tsoni@quicinc.com>, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	driver-core@lists.linux.dev, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Matthew Maurer <mmaurer@google.com>
Content-Type: text/plain; charset="utf-8"

This allows device drivers to check if, for example, an auxiliary
devices is one of its children by comparing the parent field, or
checking if a device parameter is its own device.

Also convert existing `.as_raw() != .as_raw()` to  use this new
implementation.

Signed-off-by: Matthew Maurer <mmaurer@google.com>
---
 rust/kernel/device.rs     | 8 ++++++++
 rust/kernel/devres.rs     | 2 +-
 rust/kernel/drm/driver.rs | 2 +-
 rust/kernel/pwm.rs        | 2 +-
 4 files changed, 11 insertions(+), 3 deletions(-)

diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
index 94e0548e76871d8b7de309c1f1c7b77bb49738ed..aa10359d3ebdd1c99cc567a35b89f52ddb2ee050 100644
--- a/rust/kernel/device.rs
+++ b/rust/kernel/device.rs
@@ -516,6 +516,14 @@ unsafe impl Send for Device {}
 // synchronization in `struct device`.
 unsafe impl Sync for Device {}
 
+impl<Ctx: DeviceContext, Ctx2: DeviceContext> PartialEq<Device<Ctx2>> for Device<Ctx> {
+    fn eq(&self, other: &Device<Ctx2>) -> bool {
+        self.as_raw() == other.as_raw()
+    }
+}
+
+impl<Ctx: DeviceContext> Eq for Device<Ctx> {}
+
 /// Marker trait for the context or scope of a bus specific device.
 ///
 /// [`DeviceContext`] is a marker trait for types representing the context of a bus specific
diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index cdc49677022a6b466e771d9d8cf3818ab9b9112d..20126daad193370868661b9412937937eda6d3c4 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -281,7 +281,7 @@ pub fn device(&self) -> &Device {
     /// }
     /// ```
     pub fn access<'a>(&'a self, dev: &'a Device<Bound>) -> Result<&'a T> {
-        if self.dev.as_raw() != dev.as_raw() {
+        if self.dev.as_ref() != dev {
             return Err(EINVAL);
         }
 
diff --git a/rust/kernel/drm/driver.rs b/rust/kernel/drm/driver.rs
index f30ee4c6245cda72ac72852bf9362736d8fe992f..497ef46028d560bc9649dbbdf69316ce4fce8199 100644
--- a/rust/kernel/drm/driver.rs
+++ b/rust/kernel/drm/driver.rs
@@ -139,7 +139,7 @@ pub fn new_foreign_owned(
     where
         T: 'static,
     {
-        if drm.as_ref().as_raw() != dev.as_raw() {
+        if drm.as_ref() != dev {
             return Err(EINVAL);
         }
 
diff --git a/rust/kernel/pwm.rs b/rust/kernel/pwm.rs
index cb00f8a8765c8ec58ed78a73275b022b02bf7aa3..033f778909a2633acbc25d5a21a1c8a7b8e41a70 100644
--- a/rust/kernel/pwm.rs
+++ b/rust/kernel/pwm.rs
@@ -680,7 +680,7 @@ impl<T: 'static + PwmOps + Send + Sync> Registration<T> {
     /// calling `pwmchip_remove`. This function should be called from the driver's `probe`.
     pub fn register(dev: &device::Device<Bound>, chip: ARef<Chip<T>>) -> Result {
         let chip_parent = chip.device().parent().ok_or(EINVAL)?;
-        if dev.as_raw() != chip_parent.as_raw() {
+        if dev != chip_parent {
             return Err(EINVAL);
         }
 

-- 
2.53.0.rc2.204.g2597b5adb4-goog

