Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C26D03ACF00;
	Mon,  3 Aug 2026 20:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785787400; cv=none; b=Cb4sBcaCyF2jmQ8/5GJ11lptbsHzml2cCrTWk2RFKkrnihNIzMdv22KSegvR2ZFYULXZZsxZrawGa03qxSwgggGutgtrAVfYKfHsCgwDhUlYW6KMdwMv1XVwm/WRVAHVG/b9VM86LSdP6IrWkqN0VDL3e1MPuKHHRdWm7gQ0vvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785787400; c=relaxed/simple;
	bh=5ZpKVzbt84wiNbd7BamVSHsGgr3xUbM5pJuDq05RNMY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=mmVPzSY9b0jjbyBB94Xc8zPMX+1uMZnhu2DkTTy2aI1au5j16KQOwvKcQQLWehryGjKz20iSuT/RWx15bYsEH4YdKr9iSQDSu2lhTGQKAOQw23yOKOrjYot1zXB3ivOSGMQGQ95/3zFLFHczFZet2D+i8wxoiARhf8yQAqW1+Ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O8Su1wQr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O8Su1wQr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B331F00A3A;
	Mon,  3 Aug 2026 20:03:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785787399;
	bh=XfSG12r314i1W2zkJIn8K/JR6u+8r85tUQgIN06z1qM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=O8Su1wQrD87ZejT92Jhthf/C6WFeCwCtDVHnB27QTzHf56zz+PXlH50yWrd9UUrC6
	 6CfyigBFwYv+Z+Fq9GCpBu3d6wuKVYBe6siiFhjO646oj4iRstgG1EzwcYtobzCsLB
	 9PNzyaWU/ek/snAhkem+dW7XI8nJ76+tRkwZnNvmE6siJB+K87qBlQWtsa8B7f4vm5
	 u7do0+xZ9NQ4ilwJDcaaaeQ3jFFMTqxEBPjabWUFPydGJsvXkvRZw+3P26qLZBFTFL
	 Kg140Zu5tcvzQ4RqKiIFxIYP7C9a6fh6lKGd9a+22o+IBrHRexWMij3bJnjnOTBYUe
	 /YbyHlkOQ0W8A==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	ojeda@kernel.org,
	boqun@kernel.org,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	tmgross@umich.edu,
	tamird@kernel.org,
	acourbot@nvidia.com,
	work@onurozkan.dev
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] rust: io: gate ioremap doctests on CONFIG_HAS_IOMEM
Date: Mon,  3 Aug 2026 22:02:37 +0200
Message-ID: <20260803200249.3494259-2-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260803200249.3494259-1-dakr@kernel.org>
References: <20260803200249.3494259-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The doc examples in io.rs and devres.rs directly call
bindings::ioremap() and bindings::iounmap(), which do not exist when
CONFIG_HAS_IOMEM is not set. This causes build failures with
CONFIG_RUST_KERNEL_DOCTESTS=y on such configurations (e.g. s390
allnoconfig).

Gate the affected doctests with `#![cfg(CONFIG_HAS_IOMEM)]` so they are
skipped when IOMEM is unavailable.

Fixes: 3f70ebe63858 ("s390: Enable Rust support")
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 rust/kernel/devres.rs | 1 +
 rust/kernel/io.rs     | 1 +
 2 files changed, 2 insertions(+)

diff --git a/rust/kernel/devres.rs b/rust/kernel/devres.rs
index 11ce500e9b76..8ff8aedf251a 100644
--- a/rust/kernel/devres.rs
+++ b/rust/kernel/devres.rs
@@ -59,6 +59,7 @@ struct Inner<T> {
 /// # Examples
 ///
 /// ```no_run
+/// # #![cfg(CONFIG_HAS_IOMEM)]
 /// use kernel::{
 ///     bindings,
 ///     device::{
diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index fcc7678fd9e3..9e0c8a891656 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -80,6 +80,7 @@ pub fn maxsize(&self) -> usize {
 /// # Examples
 ///
 /// ```no_run
+/// # #![cfg(CONFIG_HAS_IOMEM)]
 /// use kernel::{
 ///     bindings,
 ///     ffi::c_void,
-- 
2.55.0

