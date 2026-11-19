Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795097577;
	b=vRIKe8BF/bynKXfoz8Bmid/TXZIh6b7OSjRHFr1QoYjvtNjpSybQ9N0kjmS5B3xUe5wH
	 7INrvkkypENTNGYNl8XxcoAgvxG3i8ZAm+UBLtk7+TcY9EkHdnLdXtLRLjCbdfW0kSA+R
	 DiA5NBIUkb5H64G4K8R9zLhh2fKCI6pMO/gbiiXyS0wXBSesRr/0nltxeIDLzVcTsKjrf
	 KHttr8dY3MIdxTJBFUc0j3qR/e4eA74gNgV44z9aSSfSxA+1TV/9s1fnzCIjBnAg6yjux
	 QF48gOC9CvUUqgyT2qYZU302TYLVxzaOOnQmFZOZDaDZcms8WF/ePBMsU0gyZ3z9Wng==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795097577;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=J4S66RXJTePpoG4ZrW1OWJwvFHsJXZkm4BOys2wDNFA=;
	b=T9Jg9ISnDnGCOEBy2C0J1iZQL8tttbsB0ETC+3+8f4jUWfZurfoKgZRRTRp5GznF/0Z9
	 uEifGEz4NfOmmch5Allunriy8o8AdorLhA3vJ/zIr5xwHR2WklBDVEB1kHxBx7n9jPKGe
	 vsjTmfWFyTZGNuAMaBygYtUOaMfIk5xFq6RqQiAoucRjxcRDHt2ROh/jdXpkuKmr3T7CS
	 dwokyJwDT9Dc+Noo+SHemapVmCrMDP/r/MrDc/it8DiYe/NI/qCT/xSB/9uwwp2qVjkGw
	 LwQ7f0IXVQKPQG/6OOaFks6iI/LljOZ7R/PC/szf22ElY3f2JI/DI5yy7OxYZouh9Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fHLZjE40;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC58606A32C
	for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 14:12:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FC58606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=fHLZjE40
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a16dc2323cso19181875e9.3
        for <driver-core@lists.linux.dev>; Thu, 19 Nov 2026 06:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795097576; x=1795702376; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J4S66RXJTePpoG4ZrW1OWJwvFHsJXZkm4BOys2wDNFA=;
        b=fHLZjE40nMaSIyxqQyQKcRCPql+d09JQ+AFaNOtUNXwmFKRNTDiYuYZIQTb55Iqrgi
         lMWcdJ8AKRIoZOD2jLyoCi6hd0Csi9h+vTX9i93Q3zoThmxDDzODpTzYfrQw8MiN2YwS
         pq2Ep9vFPjZA9jMHnPCysfwf4f1LRpHvoY52UBUyHMXFjeF3Fol3q4CriwtH6522cnfx
         kltWAiMPIER8cRazNaJcQh6lXcSLvuXb7Yj+rLlj7UD/W98QYIfW+hkxGxeoF/po+ENq
         MKfowRvyJFpH9g84amjQW1/+WR3aLwOWO3jPyIjD3/aPIfN6npZEwb9dy74efJlt4AXk
         mAJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795097576; x=1795702376;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=J4S66RXJTePpoG4ZrW1OWJwvFHsJXZkm4BOys2wDNFA=;
        b=vxqFrYKxutp7WE/wYrWo14EullrxXPjQ5ceMgYZ7PT9cCz1jBlKplyPtVmR1VEmKWc
         8MIe+2TckMhgzjigh4orZQsHsX0bbgKxYq0cSFajOSxf1BGFAReEJpzSHP76En1VRfuO
         pRvI6bfZli6pdzsFKuQHNYzwOtPhsYYu9+k9o0Lj5pi49Ng5fVRV7p6GaPfSqmlf2+WB
         VxKWG7MOez3GIBARj1/LJs7u6Y26bWAUsQdbpDguN8DPJNVJLKJsp1jmGyCxk64cVNC+
         Z334/lH5Nr6JGO1lXSFMStAwbQH7cwAyMOcgS+5SoLPFIAIce4xa6sqRNJUkBeuLyl+i
         BlJQ==
X-Forwarded-Encrypted: i=1; AL+hErGPmQ6S9vodqExArBpNLWgEEezPoNZq2d9qwwNZkdnH81egHvEZWvqPYjyv6VVBX2zyzqF2flUK/jk7Rg==@lists.linux.dev
X-Gm-Message-State: APuU4Z/2EZBYE7SpW8bzwfL+3PqjSmeK51KDlXB2vdEFKG53Q/C4FenU
	OPPp5dLw66F4jhD8bEZk8FkEwMmIet1045pow2nCMeE8dGGMwKxrT3JkhKofrT7BD1+r8vQa8b+
	0o3WsFSdA4II5Jszztg==
X-Received: from wmco9.prod.google.com ([2002:a05:600c:a309:b0:4a1:fab9:8d7f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c173:b0:4a1:e00b:a10b with SMTP id 5b1f17b1804b1-4bb7da064e9mr120053975e9.7.1795097575446;
 Thu, 19 Nov 2026 06:12:55 -0800 (PST)
Date: Thu, 19 Nov 2026 14:12:42 +0000
In-Reply-To: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=3422; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=Iru6sGFXC06+A/HPpsu4Zd4jaO7RI1x+UoHopl8nDg0=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq/wPjSRFd3HB3yvGFmBsHpbV/WViLPTWF2GSrh
 mYVlEH87aqJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCav8D4wAKCRAEWL7uWMY5
 RjB1EACizlpNqOjvX1q1jC+NW7ztjl97VqoYQxC9L6MpqlVIX+bkJv7KSbC9k53P6UUI5SYPQlW
 zq/OpzZrckpE+aNY2UHJXrDXFMEoZk9IavfKq6fm0lQ5qrtdzx+s9Av+tEGEQX45aU/WHgg/4j0
 1ATpsP2JrUnIU3rqG/6o606EzCqMue2Iuj/haFtuSNMJ1EQ8zxgRHwnnOgzPKwIJp52ECLumoLK
 ypPbNeKXtzH8Nv/BYFVVFeCacbnaX8rUBtr6Q7CYuApzrEyLQE6UOCSkR1iBEbVP1hLxEOe4awR
 i6sCQlBMr6ttu+eOEE0DZS2Q9uU7K/B3leNk2cDk+gqOjdK2ncr+7Mlx58/LrlQ9b5WdARc8+00
 EZq17ntJnUNbhNAGX6sOnwUZ9D37acS6pA4CXoafTJIKse7Oa0ZFQhoJf8gH7Q9mcDZoLFtasJJ
 NX9nhqmoL8rfGssDT94CJCKuB5iJyWXENQsasKCY8kEdV7cL1gvm0I8cylAl4XfVwWidkMjqogy
 M9ekwjzTn6z8ep52+TfGcc4rCQl2SrgnRNFg97fvVj6RgYrfRQXNJpWcHiKaIrBVzwl02Wns+fa
 6C3k+FOFfd6bcY2l3SGDIrxSQi8Mqox0Mrsvd2CCDvv7em0k5MpB7OtpUtyI7cy7viALO5jcM8h AAQpiJjXewxFOmw==
X-Mailer: b4 0.14.3
Message-ID: <20261119-rust-workqueue-v4-1-707c68994940@google.com>
Subject: [PATCH v4 1/5] rust: workqueue: support stack-allocated work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Pass `object_is_on_stack(work)` to `__init_work()` in
`rust_helper_init_work_with_key()` instead of taking an explicit
`onstack` parameter, and call `destroy_work_on_stack()` when `Work` is
dropped. This ensures `CONFIG_DEBUG_OBJECTS_WORK` properly tracks and
cleans up stack-allocated work items without requiring separate
constructors.

Fixes: 7324b88975c5 ("rust: workqueue: add helper for defining work_struct fields")
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/workqueue.c |  9 +++++++--
 rust/kernel/workqueue.rs | 13 ++++++++++---
 2 files changed, 17 insertions(+), 5 deletions(-)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..337382acfbf5 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -1,16 +1,21 @@
 // SPDX-License-Identifier: GPL-2.0
 
+#include <linux/sched/task_stack.h>
 #include <linux/workqueue.h>
 
 __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
 						  work_func_t func,
-						  bool onstack,
 						  const char *name,
 						  struct lock_class_key *key)
 {
-	__init_work(work, onstack);
+	__init_work(work, object_is_on_stack(work));
 	work->data = (atomic_long_t)WORK_DATA_INIT();
 	lockdep_init_map(&work->lockdep_map, name, key, 0);
 	INIT_LIST_HEAD(&work->entry);
 	work->func = func;
 }
+
+__rust_helper void rust_helper_destroy_work_on_stack(struct work_struct *work)
+{
+	destroy_work_on_stack(work);
+}
diff --git a/rust/kernel/workqueue.rs b/rust/kernel/workqueue.rs
index a872f9fffb90..6eb6c40138f2 100644
--- a/rust/kernel/workqueue.rs
+++ b/rust/kernel/workqueue.rs
@@ -481,7 +481,7 @@ pub trait WorkItem<const ID: u64 = 0> {
 /// This is a helper type used to associate a `work_struct` with the [`WorkItem`] that uses it.
 ///
 /// [`run`]: WorkItemPointer::run
-#[pin_data]
+#[pin_data(PinnedDrop)]
 #[repr(transparent)]
 pub struct Work<T: ?Sized, const ID: u64 = 0> {
     #[pin]
@@ -513,7 +513,6 @@ pub fn new(name: &'static CStr, key: Pin<&'static LockClassKey>) -> impl PinInit
                     bindings::init_work_with_key(
                         slot,
                         Some(T::Pointer::run),
-                        false,
                         name.as_char_ptr(),
                         key.as_ptr(),
                     )
@@ -539,6 +538,15 @@ pub unsafe fn raw_get(ptr: *const Self) -> *mut bindings::work_struct {
     }
 }
 
+#[pinned_drop]
+impl<T: ?Sized, const ID: u64> PinnedDrop for Work<T, ID> {
+    fn drop(self: Pin<&mut Self>) {
+        // SAFETY: `self.work.get()` points to a valid `work_struct` initialized in `Work::new`,
+        // and the work item is not currently queued because `Self` is being dropped.
+        unsafe { bindings::destroy_work_on_stack(self.work.get()) }
+    }
+}
+
 /// Declares that a type contains a [`Work<T, ID>`].
 ///
 /// The intended way of using this trait is via the [`impl_has_work!`] macro. You can use the macro
@@ -686,7 +694,6 @@ pub fn new(
                     bindings::init_work_with_key(
                         core::ptr::addr_of_mut!((*slot).work),
                         Some(T::Pointer::run),
-                        false,
                         work_name.as_char_ptr(),
                         work_key.as_ptr(),
                     )

-- 
2.56.1.708.g77570a6a1d-goog

