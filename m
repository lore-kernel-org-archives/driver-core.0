Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795352574;
	b=hqLTx0QkPI45s7Snbgovw3bVJvsM3kGK0kjA6R8vnZ4QrmnD5qHMjvJSYwTGtWGrxo84
	 DjhGJSA5+UCt79ldyqyuKFSiLLJhoBrZWxgxlYze47GiaFy3tZOrJkFolyG6+pOSEHTe7
	 JcwxQFx3wPmtjsbmTXzWz5TKLNL84cti8DALNswgmHZRhKXt0ZufzErzoQAiD7Ibed7/Y
	 mRrtSYaaOdVV4+XuPhC2lnG81Y8Tjt8eX4ENFOV4wXXXiGJxv64z+Hj6aLIF2q/S+lb8N
	 fOHDL4NalDX85tvZkC8MSj6FHuNXNPrgKeO98R0PJ0PMArxp8qm18TwDTBCFBdYjl/g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795352574;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received;
	bh=m7Y0DUmWmemIVmt3tRMTAakLFX2ubavWDLmuDtny6Uk=;
	b=zBYWW5k6nY4U2o6zc9IVVwfTPK/Pbzw4B1QIQM7EXTDahEoqS30SV9k3bhGQynCR9obY
	 DRIi9KPW1JXSr8ZCKE/sjSgT2hg8uTBGUmSAYgyMlEdCLAe0leujBzYJnhbDluOs3Kb60
	 GdI/3iTVuvEflfRV8U4ar3bDSAxINjooihEV0KOW2VlmsjP6E8TR85zu+WsIDmdMfXCFC
	 BBwBGI0DxxFM7wOF9A7Eqc6m5POzelrHDHJL9h/8m4mVMhHyWGYGHyhbfw0CMHa8B77Cd
	 8/51QqN0TKV9T5ZFzfYLp8sxGdtj5IvchC6J1Q8Z+X3Sois2lDcZ82iRTzHpttaHfjQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=SD2A8cdK;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E91ED606A320;
	Sun, 22 Nov 2026 13:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=korg header.b=SD2A8cdK
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795352573;
	b=VXivxQDaMI4bjZ0hRyOlowPbyYr2nWiClB3s2ziWKOk3knRRLdyIT7CB+35AUXDGeGdX
	 ZuKCDoGYW8HxnE+UxPJdP5wl4J/LFb0/pIgQSu+IYaEd5MD17KRqT+Wsokh4991E7lT6g
	 6zVMPy5WK02uR1OAxKKvj6M1WGDBsOOlV7ROnZf6JyY2gyLzyIj9tHx2JW2lTf249X1fD
	 pSd+faBkwOGPbl0u+yJzPEeXXs8/9/UTaEhNIHh//HrGpyJ3TpaJ7zRDbwnA4LLs1Bvt/
	 7OABo5jzI/SRLWYupLe1s2GuOPeC496tg1LNuXpfXG1SUCUWylA7fpV+CSPEZ/KnD5Q==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795352573;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received;
	bh=m7Y0DUmWmemIVmt3tRMTAakLFX2ubavWDLmuDtny6Uk=;
	b=T6KvUInL/d1inHt51tI2siUcBhh9yIIRvqOmGPxJzQSGjIHvQMFTaAL7GfG/vCFABLEx
	 9CY2BzvWNvYp2dU5aNgixmycC7PdfIrBay9awLEpCAbap6VWkcoSFB9bvE24W7icC/9lQ
	 +2sWCJ6oxAdmhJfpBIkvGpktlRY03ZTwezavjXIxaYDdmWneAdjqs9QakabT4aFO5uiUa
	 0vNsQqywx2pCx6bfojXqmwEyIjwpcN7cOq1XbNa6vLXQDhnjKG8Cx8mp//QIXmtW2yn5l
	 GyiaFbFp577XG0IuZmEahSB6nTASxinmDiakPmEaqNFvdaWg8d925swFcReBYxeUMHQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 4FFD81F000CA;
	Sun, 22 Nov 2026 13:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=korg;
	t=1795352573; bh=m7Y0DUmWmemIVmt3tRMTAakLFX2ubavWDLmuDtny6Uk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=SD2A8cdKHFYNPD9n5/UnuLfHYN1yEUw4mNEXLksAqtt2VtzPAuKJAkLNWH+Q4EbIq
	 3dNQg6kTW4xU5Jvb3JHfJz6BCn//DdajBPkx6WV9Rt9cA5yu+5Cnvp5yCYOvoCeaQ5
	 5PlMgtORuU9Kzt6D+FlhqPbHdec+/U9aOFwsB4FI=
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 35B354C05F;
	Sun, 22 Nov 2026 13:02:34 +0000 (UTC)
From: Alvin Sun <alvin.sun@linux.dev>
Date: Sun, 22 Nov 2026 20:50:24 +0800
Subject: [PATCH v7 05/10] drm/tyr: add user and MCU VM specifications
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261122-tyr-ioctls-v7-5-3a2af624b992@linux.dev>
References: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
In-Reply-To: <20261122-tyr-ioctls-v7-0-3a2af624b992@linux.dev>
To: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795352551; l=9907;
 i=alvin.sun@linux.dev; s=20260317; h=from:subject:message-id;
 bh=UxzkSfLbABgGU0VsTywcZGOv3EcMBzHTUG2U1M8oLR8=;
 b=8iVlp4Odj+yRawVf5M1gFvB4JVJCljjwQRVzsEAljtqjY5f2qZOBGZVgHE/N4boa2kCChpUoS
 U4z8ELG3/GnDD/Ym3+bqei/cAqBZ1Rpab+6AqEONzJivc0Illlc1xo5
X-Developer-Key: i=alvin.sun@linux.dev; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for alvin.sun@linux.dev/20260317 with
 auth_id=684

The MCU and user VMs need different VA layouts. Give each a dedicated
constructor: new_for_fw() builds the kernel-only 4G layout, while
new_for_user() splits the address space by task_size or a user-provided
size, rejecting oversized requests rather than clamping. The resulting
user range is what VM_CREATE reports back as user_va_range.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/fw.rs |   3 +-
 drivers/gpu/drm/tyr/vm.rs | 157 +++++++++++++++++++++++++++++++++++++++++-----
 2 files changed, 143 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/tyr/fw.rs b/drivers/gpu/drm/tyr/fw.rs
index aea151ff1f934..196ffc96d9d99 100644
--- a/drivers/gpu/drm/tyr/fw.rs
+++ b/drivers/gpu/drm/tyr/fw.rs
@@ -51,7 +51,6 @@
         KernelBoVaAlloc, //
     },
     gpu::GpuInfo,
-
     mmu::Mmu,
     regs::{
         gpu_control::{
@@ -219,7 +218,7 @@ pub(crate) fn new(
         mmu: ArcBorrow<'_, Mmu<'drm>>,
         gpu_info: &GpuInfo,
     ) -> Result<Firmware<'drm>> {
-        let vm = Vm::new(dev, ddev, mmu, gpu_info)?;
+        let vm = Vm::new_for_fw(dev, ddev, mmu, gpu_info)?;
         vm.activate()?;
 
         let result = (|| {
diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index e67a6efcf451b..029a08051a87e 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -8,6 +8,7 @@
 //! mapped into hardware address space (AS) slots for GPU execution.
 
 use core::marker::PhantomData;
+use core::num::NonZeroU64;
 use core::ops::Range;
 
 use kernel::{
@@ -46,6 +47,8 @@
     num::casts::FromSafeCast,
     prelude::*,
     sizes::{
+        LargeSizeConstants,
+        SizeConstants,
         SZ_1G,
         SZ_2M,
         SZ_4K, //
@@ -161,6 +164,90 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     }
 }
 
+/// User VA size request for a user VM.
+pub(crate) enum UserVaRequest {
+    /// Split based on `task_size()` and the GPU VA range.
+    Auto,
+    /// Caller-specified size; construction guarantees `> 0`.
+    Fixed(NonZeroU64),
+}
+
+impl UserVaRequest {
+    /// UAPI boundary normalization: `0` -> [`Auto`](Self::Auto).
+    #[expect(dead_code)]
+    pub(crate) fn from_uapi(v: u64) -> Self {
+        match NonZeroU64::new(v) {
+            Some(size) => Self::Fixed(size),
+            None => Self::Auto,
+        }
+    }
+}
+
+/// Final user/kernel VA layout for a VM.
+pub(crate) struct VmLayout {
+    /// Full GPU VA range covered by this VM.
+    pub(crate) full: Range<u64>,
+    /// User-accessible VA range. Empty for MCU VMs.
+    pub(crate) user: Range<u64>,
+}
+
+impl VmLayout {
+    /// Kernel VA range, reserved for future kernel object allocation.
+    #[expect(dead_code)]
+    pub(crate) fn kernel(&self) -> Range<u64> {
+        self.user.end..self.full.end
+    }
+
+    /// Compute a user/kernel split for a user VM from the full GPU VA range and
+    /// a user request.
+    pub(crate) fn compute(full: Range<u64>, req: UserVaRequest) -> Result<Self> {
+        // Minimum VA space reserved for kernel objects (heaps, ring buffers, ...).
+        const MIN_KERNEL_VA: u64 = u64::SZ_256M;
+
+        if full.end <= MIN_KERNEL_VA {
+            return Err(EINVAL);
+        }
+
+        let user_max = full.end - MIN_KERNEL_VA;
+
+        let user_end = match req {
+            UserVaRequest::Fixed(v) => {
+                let user_size = v.get();
+                if user_size > user_max {
+                    return Err(EINVAL);
+                }
+                user_size
+            }
+            UserVaRequest::Auto => {
+                let task_size = current!().task_size() as u64;
+                let candidate = if task_size < full.end {
+                    task_size
+                } else {
+                    // If the range exceeds 4G, split it in two so CPU and
+                    // GPU share the same addresses (SVM).
+                    if full.end > u64::SZ_4G {
+                        full.end / 2
+                    } else {
+                        user_max
+                    }
+                };
+                candidate.min(user_max)
+            }
+        };
+
+        let delta = full.end - user_end;
+        // Pick a kernel VA range that's a power of two, to have a clear split.
+        let kernel_va_range = 1u64 << delta.ilog2();
+        let kernel_va_start = full.end - kernel_va_range;
+        let full_start = full.start;
+
+        Ok(Self {
+            full,
+            user: full_start..kernel_va_start,
+        })
+    }
+}
+
 /// Arguments for a virtual memory map operation.
 struct VmMapArgs<'drm> {
     /// Access permissions and caching behavior for the mapping.
@@ -336,26 +423,64 @@ pub(crate) struct Vm<'drm> {
     /// Non-core part of the GPUVM. Can be used for stuff that doesn't modify the
     /// internal mapping tree, like GpuVm::obtain()
     gpuvm: ARef<GpuVm<GpuVmData<'drm>>>,
-    /// VA range for this VM.
-    va_range: Range<u64>,
+    /// VA layout for this VM.
+    pub(crate) layout: VmLayout,
 }
 
 impl<'drm> Vm<'drm> {
-    /// Creates a new GPU virtual address space.
+    /// Creates the MCU/firmware VM.
     ///
-    /// The VM is initialized with a page table configured according to the GPU's
-    /// address translation capabilities and registered with the GPUVM framework.
-    pub(crate) fn new(
+    /// The MCU VM is entirely kernel-managed: it has no user-accessible range.
+    pub(crate) fn new_for_fw(
+        dev: &'drm Device<Bound>,
+        ddev: &TyrDrmDevice,
+        mmu: ArcBorrow<'_, Mmu<'drm>>,
+        gpu_info: &GpuInfo,
+    ) -> Result<Arc<Vm<'drm>>> {
+        // As in panthor: the CSF MCU is a Cortex-M7 and can only address 4G.
+        let layout = VmLayout {
+            full: 0..u64::SZ_4G,
+            user: 0..0u64,
+        };
+        Self::new_internal(dev, ddev, mmu, gpu_info, layout)
+    }
+
+    /// Creates a user VM, splitting the GPU VA range per `user_va`.
+    #[expect(dead_code)]
+    pub(crate) fn new_for_user(
         dev: &'drm Device<Bound>,
         ddev: &TyrDrmDevice,
         mmu: ArcBorrow<'_, Mmu<'drm>>,
         gpu_info: &GpuInfo,
+        user_va: UserVaRequest,
+    ) -> Result<Arc<Vm<'drm>>> {
+        let mmu_features = MMU_FEATURES::from_raw(gpu_info.mmu_features);
+        let va_bits = mmu_features.va_bits().get();
+        let range = 0..(1u64 << va_bits);
+
+        let layout = VmLayout::compute(range.clone(), user_va).inspect_err(|_| {
+            dev_dbg!(
+                dev,
+                "Failed to split GPU VA range {:#x}..{:#x} into user and kernel regions\n",
+                range.start,
+                range.end
+            );
+        })?;
+        Self::new_internal(dev, ddev, mmu, gpu_info, layout)
+    }
+
+    /// Initializes a VM with the given layout.
+    fn new_internal(
+        dev: &'drm Device<Bound>,
+        ddev: &TyrDrmDevice,
+        mmu: ArcBorrow<'_, Mmu<'drm>>,
+        gpu_info: &GpuInfo,
+        layout: VmLayout,
     ) -> Result<Arc<Vm<'drm>>> {
         let mmu_features = MMU_FEATURES::from_raw(gpu_info.mmu_features);
         let va_bits = mmu_features.va_bits().get();
         let pa_bits = mmu_features.pa_bits().get();
 
-        let range = 0..(1u64 << va_bits);
         let reserve_range = 0..0u64;
 
         // dummy_obj is used to initialize the GPUVM tree.
@@ -367,7 +492,7 @@ pub(crate) fn new(
             c"Tyr::GpuVm",
             ddev,
             &*dummy_obj,
-            range.clone(),
+            layout.full.clone(),
             reserve_range,
             GpuVmData::<'drm> {
                 _phantom: PhantomData::<&()>,
@@ -387,7 +512,7 @@ pub(crate) fn new(
                 mmu: mmu.into(),
                 gpuvm,
                 gpuvm_unique <- new_mutex!(gpuvm_unique),
-                va_range: range,
+                layout,
             }),
             GFP_KERNEL,
         )?;
@@ -418,10 +543,12 @@ fn deactivate(&self) -> Result {
 
     /// Kills the VM by deactivating it and unmapping all regions.
     pub(crate) fn kill(&self) {
-        // TODO: Turn the VM into a state where it can't be used.
         let _ = self.deactivate();
         let _ = self
-            .unmap_range(self.va_range.start, self.va_range.end - self.va_range.start)
+            .unmap_range(
+                self.layout.full.start,
+                self.layout.full.end - self.layout.full.start,
+            )
             .inspect_err(|e| {
                 dev_err!(self.dev, "Failed to unmap range during deactivate: {:?}", e);
             });
@@ -558,14 +685,14 @@ pub(crate) fn unmap_range(&self, va: u64, size: u64) -> Result {
 
         let end = va.checked_add(size).ok_or(EINVAL)?;
 
-        if va < self.va_range.start || end > self.va_range.end {
+        if va < self.layout.full.start || end > self.layout.full.end {
             dev_err!(
                 self.dev,
                 "Unmap range {:#x}..{:#x} exceeds VM range {:#x}..{:#x}",
                 va,
                 end,
-                self.va_range.start,
-                self.va_range.end
+                self.layout.full.start,
+                self.layout.full.end
             );
             return Err(EINVAL);
         }
@@ -575,7 +702,7 @@ pub(crate) fn unmap_range(&self, va: u64, size: u64) -> Result {
             region: va..end,
         };
 
-        let full_vm = va == self.va_range.start && end == self.va_range.end;
+        let full_vm = va == self.layout.full.start && end == self.layout.full.end;
 
         let mut resources = VmOpResources {
             preallocated_gpuvas: if full_vm {

-- 
2.43.0


