Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792484749;
	b=iiTqg9nRN9DaBuZgRmm3Iu9GzS8+t6gt8y8o8UUL3UQKtrTd4c3TE25ccQBojYRA5VP3
	 OCtkskNaHYACO3UIB0PMe9HQe/lAb1tniqsaNIR2Z0nPs4GWpUtJRBE03bZaRXvizD3Hh
	 My84I/Dy5Ui0YZkrd9dS42Rt/kxbAQpVFNEYa8KJsZ9bu6mDmQPSzGbA9J/EmJ2fB0K4h
	 H4ca+jufDEPZg+YYUVY6drtWqxXcFkXEI1BqDfp4bU3tiErlAmLf3y4EeONSMLHhd1O01
	 ziGxc0viM30AGGTvS+vwCPP1zE/7V8LoDkshtvs/DCBEv5MLM9fkWU34MYwGrfEgFeA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792484749;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=raq1lTLyZFkyEP1xVlPd0xytE0KyV3iNoTs2UjZZjVs=;
	b=dZr1IbjIOn0lLZUQAccxiohiN1Ge5bzFmaSwQU4mk4q3aDwUykP4YAA1k6SutEDDtLh4
	 L8PmGDB+hLaoToFaSbw8BG9jWUuTopoFwwpVNH6xpN0CgFl+Mb67hV2Cb7ZHqupRUU/xZ
	 qTA9k9xFFVYcOHY74A3V9ydqP/c+eGcdRDp4M4R82jS4RMwHVyVrgg5iWLI89h1xt4KvU
	 YWBKL42aPDzjG8HSDIeWQR6/iYMaxP5f75vcRu5o5RYwQvJFedY4fax+w69TeairXpoQY
	 oPctox150iPR0PL/zpPJEormbFqjbXauAWMa/JpWSFyJ+Qf9jyDfG6/Y/xpzhRgbd9A==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLBTMGo9;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB20606A334;
	Tue, 20 Oct 2026 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QLBTMGo9
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792484747;
	b=YwaemslX09BQVOdv70Nzn2JOUC3MkBu+kT3z0lTStT1vXFZRG728JUSPxSBLdQC3NE1v
	 C2V3wfh9NQRaNYH6A/FPoOw4kWnuBl7r/eLOyJzWNqHJDKZbB0taMDT+ciBiWPIbjCPqa
	 1uE+Pv0Zxca9BhyY08/dscny1aoEPwUbyleDMpYg/g8WAO4hvJDexTLYBRiXD9JoUPTUU
	 2rZ8vZMee/NiuPcZ2ELEzh0gtSXF2w23L2SrFOq+k+wC0CHEakNglQtQSA1TA/6ib+vq3
	 KjexnwQ3MR+TBRYBQ4lJ+y+yRLs9j8UpIGM45LqEE10Evzt3EyB5btCNm+FtYfsSaFw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792484747;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:References:In-Reply-To:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=raq1lTLyZFkyEP1xVlPd0xytE0KyV3iNoTs2UjZZjVs=;
	b=e142vOP2upc5wJwUz/rCS6eD2XmtRMN49pMc6Fzm1Oe6dzfI2ATNlvcHZ71wZFCh3yIf
	 A2uvEN8iYCu50KJpAYBxi4H/wsf/KxfFQNweUN01oix5lQlYwdC0fS0EI6J4sGPKyn2tW
	 AyGhi7JTMD8Gbd27QwM5Sn6c+6HsCOHn59vcJaHYF7icJytv0/2rnuBbcyL4QFG6/WmjV
	 WPJk+w6FHPwVz6UGBS21cRES9njBCgCTyURTfroxhaPcw6aNHjnMY6y7cXni5MCgrabtA
	 /XinPZuOH7GLvO91aA7hH0i0NnfcGobPZU3V0MEP3Ftja2kRjVKfVV+4f3wA9cNoV6Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 45D361F000C9;
	Tue, 20 Oct 2026 08:25:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792484747;
	bh=raq1lTLyZFkyEP1xVlPd0xytE0KyV3iNoTs2UjZZjVs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=QLBTMGo9WebiStFeGJZ5Q2MlfzjapKaEtqNQjdGVczuzsfrZQzj9jOAgBfK7X0EgL
	 Clm6Y/TKiUTqznLX/57lyUGvA3U0Jbjd66FsiLZ0yq0yyAg3fJaHlumn4rA6VVH+gj
	 X5P8PbG3DKHs9cjv2tweGGgBWcu6BTsGYUpa3SFjalzypPaAh5kJPgGlNa4qjGte0W
	 pl43o63mWPXXWX6TylZbb7GAx0okesBd+ZplPbKqP/chFl+MwWf/SMrV52yMSDJKzw
	 +kR/S1mtp6aFw0uOMW9O9ABVgfJxMuv28fu8oStwuEBQFSz3avnQBaaS20CaNWtlf1
	 gSQfpGR19jOIA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id B8575430DC;
	Tue, 20 Oct 2026 08:25:45 +0000 (UTC)
From: Ke Sun via B4 Relay <devnull+sunke.kylinos.cn@kernel.org>
Date: Tue, 20 Oct 2026 16:25:21 +0800
Subject: [PATCH v4 04/11] drm/tyr: add per-file VM pool
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
Message-Id: <20261020-tyr-ioctls-v4-4-704de77da223@kylinos.cn>
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
In-Reply-To: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
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
 Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, 
 Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>
Cc: Sami Tolvanen <samitolvanen@google.com>, rust-for-linux@vger.kernel.org, 
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
 driver-core@lists.linux.dev, Ke Sun <sunke@kylinos.cn>, 
 linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792484721; l=6136;
 i=sunke@kylinos.cn; s=20260317; h=from:subject:message-id;
 bh=rJMDF0E+r5CboO26qM5Av79VG6Xqis2m0v/SvkplpIY=;
 b=o8eHUnvbgftKrmserToYOPjYqdYw5svjt/W7B+4ZCNdVZW9SKp0WIFIA/p2BzF5VSPGuy/PgN
 S12ippHW8iRCiV9PEamc8sQWo1jZsgV/Ec28IJnLIDblWQEl15ddZcH
X-Developer-Key: i=sunke@kylinos.cn; a=ed25519;
 pk=CHcwQp8GSoj25V/L1ZWNSQjWp9eSIb0s9LKr0Nm3WuE=
X-Endpoint-Received: by B4 Relay for sunke@kylinos.cn/20260317 with
 auth_id=950
X-Original-From: Ke Sun <sunke@kylinos.cn>
Reply-To: sunke@kylinos.cn

From: Alvin Sun <alvin.sun@linux.dev>

Userspace needs multiple independent GPU address spaces per file,
addressed by ID through the VM ioctls as in panthor. Store them in an
IdPool (capped at 32 for panthor parity) plus an XArray. On a failed
insertion the caller tears the VM down through the returned error, so
an aborted creation never leaks a VM. The pool kills every VM still
stored when the file closes.

Signed-off-by: Alvin Sun <alvin.sun@linux.dev>
---
 drivers/gpu/drm/tyr/vm.rs | 138 +++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 137 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/tyr/vm.rs b/drivers/gpu/drm/tyr/vm.rs
index c5e307b1e2416..6935e4db667b9 100644
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
@@ -53,7 +54,11 @@
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
@@ -948,3 +953,134 @@ fn pt_unmap(dev: &Device, pt: &IoPageTable<'_, ARM64LPAES1>, range: Range<u64>)
 
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
+    pub(crate) error: Error,
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
+        match vms.store(id, vm, GFP_KERNEL) {
+            Ok(prev_vm) => {
+                if let Some(prev_vm) = prev_vm {
+                    // An existing VM at the freshly allocated slot means the
+                    // IdPool and the XArray are out of sync: the stored VM is
+                    // a pool entry, so the pool kills it and the caller's VM
+                    // is handed back for the caller to kill.
+                    let stored = vms.remove(id);
+                    drop(vms);
+                    prev_vm.kill();
+                    self.ids.lock().release_id(id);
+                    dev_err!(
+                        self.dev,
+                        "IdPool/XArray out of sync at VM pool id {id} (stored VM conflict)"
+                    );
+                    return Err(AddError {
+                        error: EBUSY,
+                        vm: stored.expect("VM was just stored"),
+                    });
+                }
+                Ok(id as u32)
+            }
+            Err(err) => {
+                // Drop the XArray spinlock before acquiring the `ids` mutex.
+                drop(vms);
+                // Release the pooled id; the VM never entered the pool, so it
+                // is returned to the caller for teardown.
+                self.ids.lock().release_id(id);
+                Err(AddError { error: err.error, vm: err.value })
+            }
+        }
+    }
+
+    /// Removes and kills the VM with the given ID.
+    #[expect(dead_code)]
+    pub(crate) fn remove(&self, id: u32) -> Result<()> {
+        let mut vms = self.vms.lock();
+        let vm = match vms.remove(id as usize) {
+            Some(vm) => vm,
+            None => return Err(EINVAL),
+        };
+        // Drop the XArray spinlock before killing, since `kill()` may sleep.
+        drop(vms);
+        // Kill the VM before handing the id back to the pool, so a VM is
+        // never reusable while still alive.
+        vm.kill();
+        self.ids.lock().release_id(id as usize);
+        Ok(())
+    }
+
+    /// Gets a shared reference to the VM with the given ID.
+    #[expect(dead_code)]
+    pub(crate) fn get(&self, id: u32) -> Option<Arc<Vm<'drm>>> {
+        let vms = self.vms.lock();
+        let borrow = vms.get(id as usize)?;
+        Some(Arc::from(borrow))
+    }
+}
+
+#[pinned_drop]
+impl PinnedDrop for VmPool<'_> {
+    fn drop(self: Pin<&mut Self>) {
+        let this = self.project();
+        // Kill every VM left in the pool. The ID range is bounded by
+        // `MAX_VMS_PER_FILE`, so this loop is cheap and runs at file close.
+        for id in 1..=MAX_VMS_PER_FILE {
+            // Release the XArray lock guard before killing: `kill()` may sleep.
+            let vm = this.vms.lock().remove(id);
+            if let Some(vm) = vm {
+                vm.kill();
+            }
+        }
+    }
+}

-- 
2.43.0


