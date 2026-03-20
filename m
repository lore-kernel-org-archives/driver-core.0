Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9132F353EF2;
	Fri, 20 Mar 2026 19:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774036022; cv=none; b=S2OI+ww8qnazbOf7DtZzDrE2hQwC4fq+3Ynn9LPYc2UlZtFosZpjbOCNx3ERkxWzZr5AFWhvJozVP6HkwNp36aIt/b1KLXeRlNrXJx2sqeTf4bsVLaMbbW9239VhHOWFdCZt8ERGMr5A4gbuR7C9OljqRmprGMOs42gHRrLhWlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774036022; c=relaxed/simple;
	bh=ju9WyBxPqyhdguAHgPK1Hx/Tksq0dRThuffsKQ3jlpE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DR4VBc+cLMu/pefrI54ZTJB3ip3Dn7ejZQtMl/29vPC4UubYCxUAxz6tYN94eTsMHyY4B4MKfS2XTustyp3imkJOe/Fkge4kCdfBQBDAqtnXuc8CmWQXcBlMIGBN1BFaVI7LXmPfu9QeDWLcq55gVPZIyI+hDyjNu5wPqdTODU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YDSa3Qr6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YDSa3Qr6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69C74C2BC87;
	Fri, 20 Mar 2026 19:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774036022;
	bh=ju9WyBxPqyhdguAHgPK1Hx/Tksq0dRThuffsKQ3jlpE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=YDSa3Qr6JFZRqqZLQfMA9a0TfK0uoNtJcg4U8dI8QYEkz2CP7v7g1K0IFpZj9yLlI
	 dXPS94g4ZCX7jFUhgMeh7cVBfYF8zmqMWmcod2/fWEsugYVFtM6ENu5znrCin3nqbC
	 L5sm9dQ3VQOPiO2UnvKphnuwXH03tB6GpKICe3tPbEBy020QkUKW0fmGc3LqhkNh+z
	 /HPdt35vQTisvSGbtXMO5tWL5zu8frMsB2kmcbqBlM7wH2oACBL/R5DFIu/m0gHtap
	 PU3UhYo/FntqaZcuQZx56wdknXiKMglFIvM4CCYzHvrfKOf+cnp3atWhAwtYkCv+CU
	 MEw+MB2D3beTg==
From: Danilo Krummrich <dakr@kernel.org>
To: aliceryhl@google.com,
	acourbot@nvidia.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	abdiel.janulgue@gmail.com,
	daniel.almeida@collabora.com,
	robin.murphy@arm.com
Cc: driver-core@lists.linux.dev,
	nouveau@lists.freedesktop.org,
	dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH v2 5/8] rust: dma: add Coherent:init() and Coherent::init_with_attrs()
Date: Fri, 20 Mar 2026 20:45:40 +0100
Message-ID: <20260320194626.36263-6-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260320194626.36263-1-dakr@kernel.org>
References: <20260320194626.36263-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Analogous to Coherent::zeroed() and Coherent::zeroed_with_attrs(), add
Coherent:init() and Coherent::init_with_attrs() which both take an impl
Init<T, E> argument initializing the DMA coherent memory.

Compared to CoherentInit, Coherent::init() is a one-shot constructor
that runs an Init closure and immediately exposes the DMA handle,
whereas CoherentInit is a multi-stage initializer that provides safe
&mut T access by withholding the DMA address until converted to
Coherent.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index cefb54f0424a..6d2bec52806b 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -709,6 +709,44 @@ pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> R
         Self::zeroed_with_attrs(dev, gfp_flags, Attrs(0))
     }
 
+    /// Same as [`Coherent::zeroed_with_attrs`], but instead of a zero-initialization the memory is
+    /// initialized with `init`.
+    pub fn init_with_attrs<E>(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        dma_attrs: Attrs,
+        init: impl Init<T, E>,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        let dmem = Self::alloc_with_attrs(dev, gfp_flags, dma_attrs)?;
+        let ptr = dmem.as_mut_ptr();
+
+        // SAFETY:
+        // - `ptr` is valid, properly aligned, and points to exclusively owned memory.
+        // - If `__init` fails, `self` is dropped, which safely frees the underlying `Coherent`'s
+        //   DMA memory. `T: AsBytes + FromBytes` ensures there are no complex `Drop` requirements
+        //   we are bypassing.
+        unsafe { init.__init(ptr)? };
+
+        Ok(dmem)
+    }
+
+    /// Same as [`Coherent::zeroed`], but instead of a zero-initialization the memory is initialized
+    /// with `init`.
+    #[inline]
+    pub fn init<E>(
+        dev: &device::Device<Bound>,
+        gfp_flags: kernel::alloc::Flags,
+        init: impl Init<T, E>,
+    ) -> Result<Self>
+    where
+        Error: From<E>,
+    {
+        Self::init_with_attrs(dev, gfp_flags, Attrs(0), init)
+    }
+
     /// Allocates a region of `[T; len]` of coherent memory.
     fn alloc_slice_with_attrs(
         dev: &device::Device<Bound>,
-- 
2.53.0

