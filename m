Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DE334DB564;
	Tue,  3 Mar 2026 16:23:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772555006; cv=none; b=bJ9QEjYteUCD/Z72M5QQ5YOqKOnUXqqZm5TF7JINTfIo1kBQr9s3hYxZAkGKdfktbqeZWXAG2N7H7qMEgrbDTEbs1ZwZ17BasDLU+1bG9qP9yCraUC+wW/Jd4QBYGxcukCC9c7Yj08uoTu7KDT/Ep3UcJlG+2l43Q4X6VP9Yyv0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772555006; c=relaxed/simple;
	bh=sZeYMfqAjnE/ZOhGVSDNSGhEbY9o/U7Qeic9UXsETko=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=if37tKuP/wqiHCt/UKysWBwkzUBcpZNXhV6s0nd0CwOJoUHBlpm4U02uM06AAR4aqZhDeVLeVjZm0ntCQYsHrOXuYibVceFUlNFFdi5t25DgGf8osL5J4IKZKRnIhbDonu0DtkchuhmGQoJR2/46TcfuLrQTHxYBC2gD2hBa+ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jW+Ib2ZV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jW+Ib2ZV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 01522C19422;
	Tue,  3 Mar 2026 16:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772555005;
	bh=sZeYMfqAjnE/ZOhGVSDNSGhEbY9o/U7Qeic9UXsETko=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=jW+Ib2ZVBR7gmR5KmTVPaQtcqQagtSa3fj+JrPcYu7+ZunDCTA3gDKPbR3z/hBu00
	 zOBMyBq7puRrTBszGHwAsNBk5w9kq7LGlIn+zgxCpDz2FzxwmGVYiHnmKaOongRTma
	 rhKobipEX3CX5HAyNCCPqLrU6FeZxQ3ws2H1KUh5fsXyyeMdz96JtOkwMNAlQouemQ
	 GLhrvl3pUf5kowisjzDzceQE1fis2lt3WLTA8LnYdDg8TmSpzI3NShub1Qdpvf8bE+
	 mj9xDZ6eFwbNkyMLkhzzBM93/pkdZ+WwZAAUreKp8tg5UIfHLI6AQnogG87KOsn+rx
	 L5lk9HZ5yteEQ==
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
Subject: [PATCH 1/8] rust: dma: use "kernel vertical" style for imports
Date: Tue,  3 Mar 2026 17:22:52 +0100
Message-ID: <20260303162314.94363-2-dakr@kernel.org>
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

Convert all imports to use "kernel vertical" style.

With this, subsequent patches neither introduce unrelated changes nor
leave an inconsistent import pattern.

While at it, drop unnecessary imports covered by prelude::*.

Link: https://docs.kernel.org/rust/coding-guidelines.html#imports
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/dma.rs | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/dma.rs b/rust/kernel/dma.rs
index cd2957b5f260..54512278085e 100644
--- a/rust/kernel/dma.rs
+++ b/rust/kernel/dma.rs
@@ -5,12 +5,20 @@
 //! C header: [`include/linux/dma-mapping.h`](srctree/include/linux/dma-mapping.h)
 
 use crate::{
-    bindings, build_assert, device,
-    device::{Bound, Core},
-    error::{to_result, Result},
+    bindings,
+    build_assert,
+    device::{
+        self,
+        Bound,
+        Core, //
+    },
+    error::to_result,
     prelude::*,
     sync::aref::ARef,
-    transmute::{AsBytes, FromBytes},
+    transmute::{
+        AsBytes,
+        FromBytes, //
+    }, //
 };
 use core::ptr::NonNull;
 
-- 
2.53.0

