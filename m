Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793032875;
	b=YQyjIUnSU6DF3BvqZjN4GdL2mm+P8Bv8CZOBPfrjBcNVEm88YbrXt0Rzp0xrA6G4ahTF
	 Ln50Z8SJyRf5qAR/rL6ZZR6uBgDfsYxSHGPQnKbUAE41IOjSZUsbwtR1AKoI9e0WNKBA1
	 OYyCmVTUgOcmEhBL5WOysQ8Q9N7k7pdy8LACHFXKEWJm0vPF78qy95blx8otlKTEdiKy1
	 ga3GeHuw/cEioCVLkxMfItG+sJzDdkqOnzfPMxf/TZ2xQO/wnmJ3lqFd1a0PBHkRc9zwE
	 y/gTOkBnNzop3W5bsNW/uJzq6HYAVnqnxxEHOv1MyOVtgz/RxtTOqUGF2YMjiok+RTA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793032875;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=UI0duaktdJo75orpWto+5YzczDf1eOZrJ5Vk4N9gpg4=;
	b=0X/uAm8f/ZFAUt+UP21m8HsfOK2f1teEhvt/ywtjOLNBYjcnGqiMlZp9I/JOYSBzfEUN
	 VI4rRdMBxcWRqjBOY1sy87+fokZ9L1leCSjHZTYHmRGAhcSKoaV4xqiZwod6HGfE53uTo
	 Zz149liSvZx0EBCYzCAt2TMZebCTsVsnXNXtRjYZk0yJfIEXwAnGeHNSZWnQqXPcL1xNT
	 vaaepBLZtWUi1HdtRlA0GPNoHbq7eLRsYfNMAolbzcf5fFYMEUYz/E9C0vNi0VisaODKU
	 /84WzXNcVwE7MaGmsvx5wFtj3jzN7qIDHVxYfDGr6OHyvUb2X5XY4xEIq973dEvjjnw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfHTVTAf;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEB16606A323;
	Mon, 26 Oct 2026 16:41:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=YfHTVTAf
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793032874;
	b=2ARuB3ykTtHlUTH/jZ95Rlt4OigXEQlSkglNeKyNi2CmudsKqsO0N8RPSMTD9now4Man
	 qxuDHMpTkZvPNI2POv0StzLG7y8mX/P/JohtxKBHkUgWtckOvmlypbMfwQatiIZhuvdbw
	 +vnE2Qs/2T3GJnmH+Lau3BIXi6TF1sbczXyeX8pFxiyjjy/3DuzyOKZFK5Ng3RcWg9kYh
	 kw0GxV67/qb2qoUcgJ6L22zfkfJtgZoNeATyaSe6HPTkHgyF0X6Z+yDB/VSr7g94dVkaK
	 G2PpFdWfO+vkE75o6GEVe26rDQyoExKeFr9i4veRdDv8FvnJj2HpVMkSh7eLqpamlcg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793032874;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=UI0duaktdJo75orpWto+5YzczDf1eOZrJ5Vk4N9gpg4=;
	b=sNCPlOLsxNL9Jndk2o9HjhObbvIEzCvz/KdG9qHhIazXIEGH6A8jTMfQc1pUF5giIyQ4
	 nnW1HMGokEX5pXSUXOWkeRe8UTsvEINazOukUstglMysmizLogEaw42KmVkysspLV4EvL
	 IImeUJqY/AQzMj7NS95ZiGs0CU304FYeztfIaebIKxv6m3QyrYZYHfaKYqALDCr6ZdHH2
	 IyafhqNkNqVvYo1GFmU7w038fp919Qyx5J3cWPQw+K6QoYbBXwWtVrC8+HlQT0JdNGN2Q
	 OoT/L0Hl17ymh2Bb1gbVqHbBZUoRwALxwhjht3SeTagc3BVkXSJ/9pr8ABAlAomTvkQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id E434C1F031E1;
	Mon, 26 Oct 2026 16:41:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793032874;
	bh=UI0duaktdJo75orpWto+5YzczDf1eOZrJ5Vk4N9gpg4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=YfHTVTAfyuBGJH0k2Zi1L51+QfxQAY8t8azxjew24b92XaZP3TAA/QmA4WBRmQYS9
	 YZHgiNaBOZuWukmNeyVvKoMCO18OhKbKBJgJrzuGEx4G14CLTK0xtEZ5QxYXebdhPk
	 WXm4n56Ah4W8adGIP4vjjB44N0rlw/aWAPj3+NnukNnv8xrNYCTr28E1/DFG82Swyw
	 1mduV0y6SHU7Z0iwWESam0KeLf9sfhPvuIO30SOFAbOR885DEiLaLgZM+0Zc/rY4xI
	 BPf2pPVCD3yXWE2rkYFOwezjavSTnUtC5GhMd0pwVXGskZyQW4bU6VwDoM4hhtccBy
	 GE7vieL6xDhMQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 6C74444DD1;
	Mon, 26 Oct 2026 16:41:12 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 27 Oct 2026 00:40:57 +0800
Subject: [PATCH v5 04/11] drm/tyr: add per-file VM pool
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
Message-Id: <20261027-tyr-ioctls-v5-4-59dfe98cb003@kylinos.cn>
References: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
In-Reply-To: <20261027-tyr-ioctls-v5-0-59dfe98cb003@kylinos.cn>
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
 Lorenzo Stoakes <ljs@kernel.org>, Lyude Paul <lyude@redhat.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
 Ke Sun <sunke@kylinos.cn>, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793032870; l=6351;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=6e0UJyCzBHvcs8/1Mg3KbNqFll8FkJW8X5qsZig8y6E=;
 b=FX8sQqJrJdCqFTSIzfdDwBF6kM5toCLSNdMQMskpp+WEv5Pq//bLLAdHGrbzCeF8osd8hxza4
 d1c2l7F2hs5BQByQMv8xecddU2U41lQ2TCrGykG8SPT1MN+a9FtFZ7L
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

Userspace needs multiple independent GPU address spaces per file,
addressed by ID through the VM ioctls as in panthor. Store them in an
IdPool (capped at 32 for panthor parity) plus an XArray. On failure
the caller receives the VM for teardown through the returned error,
whether the un-stored clone or the original on an ID conflict, so an
aborted creation never leaks a VM. The pool kills every VM still
stored when the file closes.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/vm.rs | 140 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 139 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index c5e307b1e2416..69b092a130883 100644
--- a/drivers/gpu/drm/tyr/vm.rs
+++ b/drivers/gpu/drm/tyr/vm.rs
@@ -33,6 +33,7 @@
         }, //
     },
     fmt,
+    id_pool::IdPool,
     impl_flags,
     io::PhysAddr,
     iommu::pgtable::{
@@ -41,6 +42,7 @@
         ARM64LPAES1, //
     },
     new_mutex,
+    num::casts::FromSafeCast,
     prelude::*,
     sizes::{
         SZ_1G,
@@ -53,7 +55,11 @@
         ArcBorrow,
         Mutex, //
     },
-    uapi, //
+    uapi,
+    xarray::{
+        AllocKind,
+        XArray, //
+    }, //
 };
 
 use crate::{
@@ -948,3 +954,135 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
 
     Ok(())
 }
+
+/// Maximum number of VMs a single file may hold, matching panthor's
+/// `PANTHOR_MAX_VMS_PER_FILE`.
+const MAX_VMS_PER_FILE: usize = 32;
+
+/// Per-open-file pool of VMs.
+#[pin_data(PinnedDrop)]
+pub(crate) struct VmPool<'drm> {
+    /// Parent device, for error reporting.
+    dev: &'drm Device<Bound>,
+    #[pin]
+    ids: Mutex<IdPool>,
+    #[pin]
+    vms: XArray<Arc<Vm<'drm>>>,
+}
+
+/// Error returned when a VM cannot be added to the pool. The caller
+/// owns the teardown of the VM in [`AddError::vm`].
+pub(crate) struct AddError<'drm> {
+    #[expect(dead_code)]
+    pub(crate) error: Error,
+    #[expect(dead_code)]
+    pub(crate) vm: Arc<Vm<'drm>>,
+}
+
+impl<'drm> VmPool<'drm> {
+    /// Creates a new [`VmPool`].
+    #[expect(dead_code)]
+    pub(crate) fn new(dev: &'drm Device<Bound>) -> impl PinInit<Self> {
+        let ids = IdPool::new();
+        pin_init!(Self {
+            dev,
+            ids <- new_mutex!(ids),
+            vms <- XArray::new(AllocKind::Alloc),
+        })
+    }
+
+    /// Stores the VM and returns the allocated ID.
+    ///
+    /// On failure - ID space exhausted or a store failure - the VM is
+    /// returned in an [`AddError`] so the caller owns the teardown.
+    // TODO: allocate IDs with the XArray directly (once it grows range
+    // allocation, the equivalent of C's `XA_LIMIT`) and drop the IdPool.
+    #[expect(dead_code)]
+    pub(crate) fn add(&self, vm: Arc<Vm<'drm>>) -> Result<u32, AddError<'drm>> {
+        let id = (|| {
+            let mut ids = self.ids.lock();
+            let unused = ids.find_unused_id(1).ok_or(ENOSPC)?;
+            if unused.as_usize() > MAX_VMS_PER_FILE {
+                return Err(ENOSPC);
+            }
+            Ok(unused.acquire())
+        })();
+        let id = match id {
+            Ok(id) => id,
+            Err(error) => return Err(AddError { error, vm }),
+        };
+
+        let mut vms = self.vms.lock();
+        match vms.store(id, vm.clone(), GFP_KERNEL) {
+            Ok(prev_vm) => {
+                if let Some(prev_vm) = prev_vm {
+                    // An existing VM at the freshly allocated slot means the
+                    // IdPool and the XArray are out of sync: the stored VM is
+                    // a pool entry, so the pool kills it and the caller's VM
+                    // is returned for teardown.
+                    drop(vms.remove(id));
+                    drop(vms);
+                    prev_vm.kill();
+                    self.ids.lock().release_id(id);
+                    dev_err!(
+                        self.dev,
+                        "IdPool/XArray out of sync at VM pool id {id} (stored VM conflict)"
+                    );
+                    return Err(AddError { error: EBUSY, vm });
+                }
+                Ok(id as u32)
+            }
+            Err(err) => {
+                // Drop the XArray spinlock before acquiring the `ids` mutex.
+                drop(vms);
+                // Release the pooled id; the VM never entered the pool, so it
+                // is returned to the caller for teardown.
+                self.ids.lock().release_id(id);
+                Err(AddError {
+                    error: err.error,
+                    vm: err.value,
+                })
+            }
+        }
+    }
+
+    /// Removes and kills the VM with the given ID.
+    #[expect(dead_code)]
+    pub(crate) fn remove(&self, id: u32) -> Result<()> {
+        let mut vms = self.vms.lock();
+        let vm = match vms.remove(usize::from_safe_cast(id)) {
+            Some(vm) => vm,
+            None => return Err(EINVAL),
+        };
+        // Drop the XArray spinlock before killing, since `kill()` may sleep.
+        drop(vms);
+        // Kill the VM before handing the id back to the pool, so a VM is
+        // never reusable while still alive.
+        vm.kill();
+        self.ids.lock().release_id(usize::from_safe_cast(id));
+        Ok(())
+    }
+
+    /// Gets a shared reference to the VM with the given ID.
+    #[expect(dead_code)]
+    pub(crate) fn get(&self, id: u32) -> Option<Arc<Vm<'drm>>> {
+        let vms = self.vms.lock();
+        let borrow = vms.get(usize::from_safe_cast(id))?;
+        Some(Arc::from(borrow))
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for VmPool<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        // Kill every VM left in the pool. The ID range is bounded by
+        // `MAX_VMS_PER_FILE`, so this loop is cheap and runs at file close.
+        for id in 1..=MAX_VMS_PER_FILE {
+            // Release the XArray lock guard before killing: `kill()` may sleep.
+            let vm = self.vms.lock().remove(id);
+            if let Some(vm) = vm {
+                vm.kill();
+            }
+        }
+    }
+}

-- 
2.43.0


