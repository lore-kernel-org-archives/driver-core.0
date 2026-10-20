Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.69
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792500774;
	b=y824MfawDMRwFd4ed3vrrGFClex2p/eyTsLIByKIxUOa8tvrsb9hkaFO8sPkj6nDfC5U
	 5GYoORqErJba/5Lc9f1VRdKtPactEfQWTQMNrOQi4OCXDgSS0HjLf32BhFY3DRRExcmzb
	 APidDYzxQIIF1zLZekWvFNkIZfUuOpGcvz2wHKsDQiwTuS8rVo4NEZfhhIjx35Yg+deqP
	 61mC5JEuscO5e6IsMvqfChjvFq+Eo2UsddtO24irxQyun/NNMlk8tt50sk9GYJvBoFM6w
	 sFUmvfmkomOcnbSR4RO+la6/hHlWfxXZsdOjP9r0e4QhQB0orxMHtN/7JZR1bWSDfjg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792500774;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Developer-Key:X-Developer-Signature:
	 X-Mailer:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=VjN4SgCHff53zWvbD6Ulm9nG1pvOkOeafS89+kwLb04=;
	b=fkJ0i4uwD9cclmuFjxrHUhOfRWEDSqv+d2kxZYswDn7vKbzrAH2bcJOUgY8zMwjlrGfo
	 VvpTEPbP8G+9SgiayM9knk0zO1ouCYNnvPWXlHzn0uh9RjcrPHA+0t28CNdhVjIhZZw58
	 NR1mWm7fY5PpXvbHhPiS9FYluxkWhSwclv5aWB8dtoQsj9Zqc/MpxPujYEtAA5pm+48pT
	 tG9VMha4iCNldYeXvH+zOWMYl1u2WUhdbGPjoWIcl1mfaCzeGS6QGVzRw5R7T+LdNWJY6
	 P1liyuCCzmnF82oxwZhYSJlXDw230sdA2lTTQU+BezP48DiEnsEenRz0vbEt9iqSIHg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fPvsYvyX;
	arc=none smtp.remote-ip=209.85.128.69
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com [209.85.128.69])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13F0360A3837
	for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 12:52:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 13F0360A3837
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=fPvsYvyX
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a009f82bedso24784235e9.0
        for <driver-core@lists.linux.dev>; Tue, 20 Oct 2026 05:52:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792500772; x=1793105572; darn=lists.linux.dev;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VjN4SgCHff53zWvbD6Ulm9nG1pvOkOeafS89+kwLb04=;
        b=fPvsYvyXPR75/2SHuHn7+IngUgouKoXoel3Ky8fKBelTsKBz1GSL6LpwSCzulJekzA
         Zd0LcmEs99g1cj9pnF9SjN05xnWVi1W01R2Tr3B2z87q4R9pEDcJ+6v802T68Ovqtftr
         cVi0he74YxUQTOfmkaffYTqihUA98DLKHxCkuVIUgBhclGuMfx5HCUP1Oyw/UkO0xyAk
         Nx2YVWHeblko1TR3bOL9/TmxHYOINoXVTu+UlwMeiwkFKoTXAWTesqX0p0a7BZlfQX6D
         3AQebwLcQZL/rwgE7R3a6w41QtMyPLEXgTLedtRct3KtvQDelMBzIoGWCARQlqMVGDV1
         bjxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792500772; x=1793105572;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VjN4SgCHff53zWvbD6Ulm9nG1pvOkOeafS89+kwLb04=;
        b=y06+LgTfJ6CSi2vwDXZuaNUS6JJLorxO+DAl7IA16rCNXDh/CU4xgxD3WRyLy+IZud
         xObabISMFhLZQ36nfJ/3na3xkP+rqvaDxTKjH4KpS4ZlvT1WHgDApCZBnQ7JMLtEKgkl
         ojJt/X48p53NzvU4nRHCP7UvxRnlXDKaqtODckYFNazhJtOIQyiwMmuwAmlKKqqnTwKv
         IKY3822+BxS4dhwYpdGDi/FG0njKHJ9YY/dmwT2GJ5WF7zb7gZTpwUMQ1xuVgsaUh+HX
         BJXDZusfgGwbQQvr6/IaEbE6t9pH58KoTcYpyXmsicEUZFVZCd6kCNP1LN4KNq4JZ8+n
         P3CA==
X-Forwarded-Encrypted: i=1; AKwUvBwm3YAxD8jfbReIGkyg9DpjzY27ZqUh+5hJ2efVq5iyQ3lC+EilgHLrTlV0GwOJELu3SrvwcQpU5/geww==@lists.linux.dev
X-Gm-Message-State: AFq9FYJ1Te8W7lb+J7tCeUu6MuSENU/FeoieoRd/62zPulXoBeXmv0b4
	1Zs2+xFmt3Qbig4PIALY3HiA1AEDlSAjYDATCL6jnDwqvNMWu25tBIKcbb+Hp+birgp/ey0CvyD
	IlGnoGfDcLUtt6Kv0KQ==
X-Received: from wmbeu8.prod.google.com ([2002:a05:600c:81c8:b0:4a1:94fd:6415])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4443:b0:4a0:89:6727 with SMTP id 5b1f17b1804b1-4a1d75f9261mr236301505e9.16.1792500772172;
 Tue, 20 Oct 2026 05:52:52 -0700 (PDT)
Date: Tue, 20 Oct 2026 12:52:38 +0000
In-Reply-To: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
Mime-Version: 1.0
References: <20261020-rust-workqueue-v3-0-ea7c74d02068@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp; fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=15812; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=4Dwia5Ize/w+E6SB6x2sv0rxMk+RFAv7w39zQea/qT4=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBq12QeUfnKVSOphwVi3/hO792GgwfFBOx0F/uFR
 8EEX9O1Yn6JAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCatdkHgAKCRAEWL7uWMY5
 RmItD/41zZaIEWPJTc9CVELL9YC3myWzQ+gOFWT3Cg7+7BKj0o4fvoOPPN6v8GE2S/HwUIZxsmp
 hk6g3vudIriVxFMKLMzonlfw9QYUk74gjYe2gJgvSL3NEXx7TRngE6GaNn3GHNSTHukV+6h+R3J
 Hw7WqBEKqw5DvXKQSKNdndaKRvMw9S3dMF73sR5YA7ycRAz8kGAEciTYXu/VNo6x6r9e/5aky0w
 c2/gZIJj/MsH+tj/5R1zbtRp3oLdkGURD2OTEc8DNKRgx74aGyby54DdQOVN4CgI2u4mBxwnGM6
 wfPobQGEjH1SDBySmKqDN826LTXXNf1aaVonJwJpsi+cawE/J5ypBi7KhnDY0C9m4hTdGnOHlxI
 HQSS35Ov5rl8Xq/1oEs480Hwa1HAZOvq7MOp5pw3eAInp9cp/zqdYMqKPe5rK0Pe300fhyIuW6R
 Z99T9qSgvQOSaCL+f/iGkEuM31t15QwgS7+K/yLMZm+5KjUdrVluuaeHKPR1Uw2X59ybH/MMJUv
 /kmwBxcfk7NBzMvOUWY3KXMLm4puv2NYDsHzwe9YD5SEpQ7o1NS0UPdb3qFoZ81kK6BB1x5f8u0
 nn+dN+imJ5RpIZtT8CBaVM51edAR7tGOm8Pfm8pC9mJMf6ACgzQUT11nLD8+JLKQI3Qmo5t6G8L nh5dbB/fEjDluhg==
X-Mailer: b4 0.14.3
Message-ID: <20261020-rust-workqueue-v3-3-ea7c74d02068@google.com>
Subject: [PATCH v3 3/4] rust: workqueue: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Danilo Krummrich <dakr@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?q?Bj=C3=B6rn_Roy_Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?utf-8?q?Onur_=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="utf-8"

Creating workqueues is needed by various GPU drivers. Not only does it
give you better control over execution, it also allows devices to ensure
that all tasks have exited before the device is unbound (or similar) by
running the workqueue destructor.

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>
Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
Co-developed-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 rust/helpers/workqueue.c         |   7 +
 rust/kernel/workqueue/builder.rs | 370 +++++++++++++++++++++++++++++++++++++++
 rust/kernel/workqueue/mod.rs     |  51 +++++-
 3 files changed, 425 insertions(+), 3 deletions(-)

diff --git a/rust/helpers/workqueue.c b/rust/helpers/workqueue.c
index ce1c3a5b2150..e4b9d1b3d6bf 100644
--- a/rust/helpers/workqueue.c
+++ b/rust/helpers/workqueue.c
@@ -14,3 +14,10 @@ __rust_helper void rust_helper_init_work_with_key(struct work_struct *work,
 	INIT_LIST_HEAD(&work->entry);
 	work->func = func;
 }
+
+__rust_helper
+struct workqueue_struct *rust_helper_alloc_workqueue(const char *fmt, unsigned int flags,
+						     int max_active, const void *data)
+{
+	return alloc_workqueue(fmt, flags, max_active, data);
+}
diff --git a/rust/kernel/workqueue/builder.rs b/rust/kernel/workqueue/builder.rs
new file mode 100644
index 000000000000..d253c2f8ed4a
--- /dev/null
+++ b/rust/kernel/workqueue/builder.rs
@@ -0,0 +1,370 @@
+// SPDX-License-Identifier: GPL-2.0
+
+//! Workqueue builders.
+
+use kernel::{
+    alloc::AllocError,
+    prelude::*,
+    workqueue::{
+        OwnedQueue, //
+        Queue,
+    }, //
+};
+
+use core::{
+    marker::PhantomData,
+    ptr::{
+        self,
+        NonNull, //
+    },
+};
+
+/// Workqueue builder.
+///
+/// A valid combination of workqueue flags contains one of the base flags (`WQ_UNBOUND`, `WQ_BH`,
+/// or `WQ_PERCPU`) and a combination of modifier flags that are compatible with the selected base
+/// flag.
+///
+/// For details, please refer to `Documentation/core-api/workqueue.rst`.
+pub struct Builder<Kind> {
+    flags: bindings::wq_flags,
+    max_active: i32,
+    _kind: PhantomData<Kind>,
+}
+
+pub enum TypeUnbound {}
+pub enum TypePercpu {}
+pub enum TypePowerEfficient {}
+pub enum TypeBH {}
+pub enum TypeOrdered {}
+
+/// Entry-points to the builder API.
+impl Queue {
+    /// Build a workqueue whose work may execute on any cpu.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from unbound wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_UNBOUND")]
+    pub fn new_unbound() -> Builder<TypeUnbound> {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a workqueue whose work items are bound to the CPU they are queued on.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_percpu().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from percpu wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_PERCPU")]
+    pub fn new_percpu() -> Builder<TypePercpu> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a power-efficient workqueue.
+    ///
+    /// A power-efficient workqueue is per-CPU by default, but becomes unbound when the
+    /// `workqueue.power_efficient` kernel parameter is set.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_power_efficient().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from power-efficient wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_POWER_EFFICIENT")]
+    pub fn new_power_efficient() -> Builder<TypePowerEfficient> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU | bindings::wq_flags_WQ_POWER_EFFICIENT,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a single-threaded workqueue that executes jobs in order.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_ordered().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from ordered wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "alloc_ordered_workqueue")]
+    #[doc(alias = "__WQ_ORDERED")]
+    pub fn new_ordered() -> Builder<TypeOrdered> {
+        Builder {
+            flags: bindings::wq_flags_WQ_UNBOUND | bindings::wq_flags___WQ_ORDERED,
+            max_active: 1,
+            _kind: PhantomData,
+        }
+    }
+
+    /// Build a workqueue that executes in bottom-half (softirq) context.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_bh().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from BH wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_BH")]
+    pub fn new_bh() -> Builder<TypeBH> {
+        Builder {
+            flags: bindings::wq_flags_WQ_PERCPU | bindings::wq_flags_WQ_BH,
+            max_active: 0,
+            _kind: PhantomData,
+        }
+    }
+}
+
+/// Options that may be used with all workqueue types.
+impl<Kind> Builder<Kind> {
+    /// Mark this workqueue high priority.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().highpri().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from highpri wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_HIGHPRI")]
+    pub fn highpri(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_HIGHPRI;
+        self
+    }
+
+    /// Creates the workqueue.
+    ///
+    /// The provided name is used verbatim as the workqueue name.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// // create an unbound workqueue registered with sysfs
+    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
+    ///
+    /// // spawn a work item on it
+    /// wq.try_spawn(
+    ///     GFP_KERNEL,
+    ///     || pr_warn!("Printing from my-wq"),
+    /// )?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "alloc_workqueue")]
+    pub fn build(self, name: &CStr) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%s" is compatible with passing the name as a c-string.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%s".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                name.as_char_ptr().cast::<c_void>(),
+            )
+        };
+
+        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
+        // caller.
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+
+    /// Creates the workqueue.
+    ///
+    /// # Examples
+    ///
+    /// This example shows how to pass a Rust string formatter to the workqueue name, creating
+    /// workqueues with names such as `my-wq-1` and `my-wq-2`.
+    ///
+    /// ```
+    /// use kernel::workqueue::{Queue, OwnedQueue};
+    ///
+    /// fn my_wq(num: u32) -> Result<OwnedQueue> {
+    ///     // create a percpu workqueue called my-wq-{num}
+    ///     let wq = Queue::new_percpu().build_fmt(fmt!("my-wq-{num}"))?;
+    ///     Ok(wq)
+    /// }
+    /// ```
+    #[inline]
+    pub fn build_fmt(self, name: kernel::fmt::Arguments<'_>) -> Result<OwnedQueue, AllocError> {
+        // SAFETY:
+        // * c"%pA" is compatible with passing an `Arguments` pointer.
+        // * the builder only permits valid flag combinations
+        let ptr = unsafe {
+            bindings::alloc_workqueue(
+                c"%pA".as_char_ptr(),
+                self.flags,
+                self.max_active,
+                ptr::from_ref(&name).cast::<c_void>(),
+            )
+        };
+
+        // INVARIANT: We successfully created the workqueue, so we can return ownership to the
+        // caller.
+        Ok(OwnedQueue {
+            queue: NonNull::new(ptr).ok_or(AllocError)?.cast(),
+        })
+    }
+}
+
+/// Indicates that this workqueue is threaded.
+pub trait TypeThreaded {}
+impl TypeThreaded for TypeUnbound {}
+impl TypeThreaded for TypePercpu {}
+impl TypeThreaded for TypePowerEfficient {}
+
+/// Options that are not available on BH or ordered workqueues.
+impl<Kind: TypeThreaded> Builder<Kind> {
+    /// Set the maximum number of concurrently executing work items.
+    ///
+    /// For percpu workqueues this is per-CPU. If not set, a default value of
+    /// `WQ_DFL_ACTIVE` is used. The maximum value is `WQ_MAX_ACTIVE`.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().max_active(16).build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from wq with max_active=16"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    pub fn max_active(mut self, max_active: u32) -> Self {
+        // If provided `max_active` is greater than `i32::MAX`, then we need to trigger the C-side
+        // comparison with `WQ_MAX_ACTIVE`, which we can do by clamping to `i32::MAX`.
+        self.max_active = i32::try_from(max_active).unwrap_or(i32::MAX);
+        self
+    }
+
+    /// Mark this workqueue as cpu intensive.
+    ///
+    /// Work items will not contribute to the concurrency level, preventing
+    /// them from stalling other work items in the same per-CPU worker pool.
+    /// This is meaningless for unbound workqueues.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().cpu_intensive().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from cpu-intensive wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_CPU_INTENSIVE")]
+    pub fn cpu_intensive(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_CPU_INTENSIVE;
+        self
+    }
+}
+
+/// Indicates that this workqueue runs in a normal context (as opposed to softirq context).
+pub trait TypeNormal {}
+impl TypeNormal for TypeUnbound {}
+impl TypeNormal for TypePercpu {}
+impl TypeNormal for TypePowerEfficient {}
+impl TypeNormal for TypeOrdered {}
+
+/// Options that are not available on BH workqueues.
+impl<Kind: TypeNormal> Builder<Kind> {
+    /// Make this workqueue visible in sysfs.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().sysfs().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from sysfs wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_SYSFS")]
+    pub fn sysfs(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_SYSFS;
+        self
+    }
+
+    /// Allow this workqueue to be frozen during suspend.
+    ///
+    /// Work items on the workqueue are drained and no new work items start
+    /// execution until thawed.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().freezable().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from freezable wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_FREEZABLE")]
+    pub fn freezable(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_FREEZABLE;
+        self
+    }
+
+    /// This workqueue may be used during memory reclaim.
+    ///
+    /// # Examples
+    ///
+    /// ```
+    /// use kernel::workqueue::Queue;
+    ///
+    /// let wq = Queue::new_unbound().mem_reclaim().build(c"my-wq")?;
+    /// wq.try_spawn(GFP_KERNEL, || pr_info!("Hello from mem_reclaim wq"))?;
+    /// # Ok::<(), Error>(())
+    /// ```
+    #[inline]
+    #[doc(alias = "WQ_MEM_RECLAIM")]
+    pub fn mem_reclaim(mut self) -> Self {
+        self.flags |= bindings::wq_flags_WQ_MEM_RECLAIM;
+        self
+    }
+}
diff --git a/rust/kernel/workqueue/mod.rs b/rust/kernel/workqueue/mod.rs
index aa8a472f4547..78e6a7bb960a 100644
--- a/rust/kernel/workqueue/mod.rs
+++ b/rust/kernel/workqueue/mod.rs
@@ -186,7 +186,10 @@
 //! C header: [`include/linux/workqueue.h`](srctree/include/linux/workqueue.h)
 
 use crate::{
-    alloc::{AllocError, Flags},
+    alloc::{
+        self,
+        AllocError, //
+    },
     container_of,
     prelude::*,
     sync::{
@@ -200,7 +203,14 @@
     time::Jiffies,
     types::Opaque,
 };
-use core::{marker::PhantomData, ptr::NonNull};
+use core::{
+    marker::PhantomData,
+    ops::Deref,
+    ptr::NonNull, //
+};
+
+mod builder;
+pub use self::builder::Builder;
 
 /// Creates a [`Work`] initialiser with the given name and a newly-created lock class.
 #[macro_export]
@@ -346,7 +356,7 @@ pub fn enqueue_delayed<W, const ID: u64>(
     /// This method can fail because it allocates memory to store the work item.
     pub fn try_spawn<T: 'static + Send + FnOnce()>(
         &self,
-        flags: Flags,
+        flags: alloc::Flags,
         func: T,
     ) -> Result<(), AllocError> {
         let init = pin_init!(ClosureWork {
@@ -359,6 +369,41 @@ pub fn try_spawn<T: 'static + Send + FnOnce()>(
     }
 }
 
+/// An owned kernel work queue.
+///
+/// Dropping a workqueue blocks on all pending work.
+///
+/// # Invariants
+///
+/// `queue` points at a valid workqueue that is owned by this `OwnedQueue`.
+pub struct OwnedQueue {
+    queue: NonNull<Queue>,
+}
+
+// SAFETY: `OwnedQueue` uniquely owns a valid `Queue`, which is `Send + Sync`.
+unsafe impl Send for OwnedQueue {}
+// SAFETY: `&OwnedQueue` only provides `&Queue` (via `Deref`), which is safe to share.
+unsafe impl Sync for OwnedQueue {}
+
+impl Deref for OwnedQueue {
+    type Target = Queue;
+    #[inline]
+    fn deref(&self) -> &Queue {
+        // SAFETY: By the type invariants, this pointer references a valid queue.
+        unsafe { &*self.queue.as_ptr() }
+    }
+}
+
+impl Drop for OwnedQueue {
+    #[inline]
+    fn drop(&mut self) {
+        // SAFETY: This `OwnedQueue` owns a valid workqueue, so we can destroy it. There is no
+        // delayed work scheduled on this queue that may attempt to use it after this call, as
+        // scheduling delayed work requires a 'static reference.
+        unsafe { bindings::destroy_workqueue(self.queue.as_ptr().cast()) }
+    }
+}
+
 /// A helper type used in [`try_spawn`].
 ///
 /// [`try_spawn`]: Queue::try_spawn

-- 
2.56.0.212.g129ede20d9-goog

