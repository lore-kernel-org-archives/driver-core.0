Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E79774DC55F;
	Tue,  3 Mar 2026 16:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555023; cv=none; b=d7aUHIUq5WDHaSi8/sI11+t0OPz8zwSXWS4QWYn5N/8TgjS+AHAjdkayy5lX77qPQgsoR7MOuco1xW4u3VC9jKVvGCF3YV7oZJ14O+Wpp9eHN5on6puP4a4KVWCLeGJLqueyk591F0MFpFE4cynW7J1XFQBpqbfiaRlGVtHA1cE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555023; c=relaxed/simple;
	bh=+liU4pQNiYF4RC3Z3F4oQnCGR+HREs2Sq3MMzyTGAOA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XdfoUEjFUBAeBm/Pzyjfq0mqsMd/6o45tSCrJS/hCmNVXPUxsDsSkH2m/hs+ZYLQl/Q1g7/CIaX7rNYNP+BjDMRLdvOjc0tdmIlon+9to9HkVMMbsoDzQe95kwprdgcjWYSMk9VJ3hiSNsE9c7++k5k20m3hd/Ym5YpSzvGGsA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Bmk0Z2oM; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Bmk0Z2oM"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AADDDC116C6;
	Tue,  3 Mar 2026 16:23:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555022;
	bh=+liU4pQNiYF4RC3Z3F4oQnCGR+HREs2Sq3MMzyTGAOA=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Bmk0Z2oMWzuq509fyO1v/aQOfoxTxOlzclkhD5GNbCyhMh2yu7FChr7EvI1YQFM37
	 Fx5Mp4iZ2DPDaE+dXPD5pHJ4jClMOez0HOTmtreERsarMbW/eVna6KcaUiexSp+Hjv
	 Jze0+p30dGCWoZXalXq1WaWwbtypMGwe5IPDaZSyirikkHoc6dx9Ee5JXE/8vTK4i0
	 DxBMAxlOHejyxts5d7/HXVI62feIhiQC6h//7SBUWvWUiNsr8Nb0sCvAVxXew1tuLK
	 4/c/3cEZ20EAZCdl4DInvPgBRsrOAjU0ohTE3xerRQKGN5oVMVR4FxemYsjIxAhnwn
	 AcNgedmkzliPg==
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
Subject: [PATCH 5/8] rust: dma: add Coherent:init() and Coherent::init_with_attrs()
Date: Tue,  3 Mar 2026 17:22:56 +0100
Message-ID: <20260303162314.94363-6-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260303162314.94363-1-dakr@kernel.org>
References: <20260303162314.94363-1-dakr@kernel.org>
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
 rust/kernel/dma.rs | 37 +++++++++++++++++++++++++++++++++++++
 1 file changed, 37 insertions(+)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index 79dd8717ac47..d77c1b6cb0c4 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -706,6 +706,43 @@ pub fn zeroed(dev: &device::Device<Bound>, gfp_flags: kernel::alloc::Flags) -> R
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

