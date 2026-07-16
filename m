Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8511F42B33D;
	Thu, 16 Jul 2026 14:26:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784211968; cv=none; b=sNhM1+Wyu8lry0fhq04J5M47PtJ/5I7lYqweszQamqqaXP8YuNkkKpXaHK9YAz4X66FN/DjhTCey6bBGU78AQybPAw14E+bAAi2+dgSjLNkJdxPZ/9iNA5kifOYSRGGd3ReDSqE94bUSJBt02nG8nUTOJiYvedp4SwvC8eD9wYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784211968; c=relaxed/simple;
	bh=TGxFBrSl9l7R6aA7dPj+oxr2UuJdrpXU3+w5TIWcCA4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=qwaKSoWU1tRQaAS6zehxxfsybTpc4fXQ6R2c3qt7Z5gHy2XNOsm8jmsySUyZouhYXSAl26gvhHsLec7QLW8xLzzVrWuTpb7MjrfYjcXx17bJNDP37TZfn47ce+49Vi/+R089ziVxKTYAnTGGqLtle1lEuMiIUS4rxqQWmKNSZTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLAi09UO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLAi09UO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7663A1F00A3A;
	Thu, 16 Jul 2026 14:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784211967;
	bh=qdgntmI1yFebdvMcIgClrl8sFi4W+ayZ3vQfY1PI9XY=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=nLAi09UOmwq/uu6eaynzov16dtyw2J7oNxN+PGSm+JzmTM48isA/WZL2xjVUnkc2v
	 w/2LzW7ztLklvolP9ZdVs2prIiSFYuee5L7b1tdiz52jaIDc07X1qzJIRGWSfOdeDS
	 L933+6a1tSQcq89f3desFbXWY5lv8JBu33nvlndmQRWe28FYvXzwMlkftfpSv83Y/3
	 boBs788R2ekvmFuGzXdIwzpribMe5W4VkK8sDLCqOsNYfJVmtmuoz+SBU3JI3/+Sjv
	 3bkCCuKaBpZB9tsP8P84yFk8nwrmMURouGDdmNZ43d+67AT7r+jJ5d9Io4g0/F0Cic
	 hru/ngMCdQa/g==
From: Gary Guo <gary@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] rust: io: document const-offset requirement for infallible accessors
Date: Thu, 16 Jul 2026 15:25:43 +0100
Message-ID: <20260716142545.3622278-1-gary@kernel.org>
X-Mailer: git-send-email 2.54.0
Reply-To: Gary Guo <gary@garyguo.net>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Gary Guo <gary@garyguo.net>

Due to the usage of `build_assert!` for address validity checking, these
accessors want constant offsets. Non-constant offsets can work but it
depend on compiler optimization levels, so it should be avoided.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/io.rs | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index 95f46bb75f9e..a38c20ba3d23 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -721,6 +721,8 @@ fn try_write64(self, value: u64, offset: usize) -> Result
     }
 
     /// Infallible 8-bit read with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn read8(self, offset: usize) -> u8
     where
@@ -731,6 +733,8 @@ fn read8(self, offset: usize) -> u8
     }
 
     /// Infallible 16-bit read with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn read16(self, offset: usize) -> u16
     where
@@ -741,6 +745,8 @@ fn read16(self, offset: usize) -> u16
     }
 
     /// Infallible 32-bit read with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn read32(self, offset: usize) -> u32
     where
@@ -751,6 +757,8 @@ fn read32(self, offset: usize) -> u32
     }
 
     /// Infallible 64-bit read with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn read64(self, offset: usize) -> u64
     where
@@ -761,6 +769,8 @@ fn read64(self, offset: usize) -> u64
     }
 
     /// Infallible 8-bit write with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn write8(self, value: u8, offset: usize)
     where
@@ -771,6 +781,8 @@ fn write8(self, value: u8, offset: usize)
     }
 
     /// Infallible 16-bit write with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn write16(self, value: u16, offset: usize)
     where
@@ -781,6 +793,8 @@ fn write16(self, value: u16, offset: usize)
     }
 
     /// Infallible 32-bit write with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn write32(self, value: u32, offset: usize)
     where
@@ -791,6 +805,8 @@ fn write32(self, value: u32, offset: usize)
     }
 
     /// Infallible 64-bit write with compile-time bounds check.
+    ///
+    /// `offset` should be constant.
     #[inline(always)]
     fn write64(self, value: u64, offset: usize)
     where

base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.54.0

