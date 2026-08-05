Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 534013F3270;
	Wed,  5 Aug 2026 21:29:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785965371; cv=none; b=uliYOBP90kn8sn/nx/B6cl1nclGIprnV9sx9MaaZRBz0cyU7CFx504dFViq61N/9SkFbD4QSuGANVBheuGirVXAkpnLOAvW46qcv5jqBaZt5+aCZc9akO+XZB8Wm4uzgU+1QvIGKSx5Xos4SemBpNwcIWApWpmEIiX61RGHKMqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785965371; c=relaxed/simple;
	bh=H+ex1rhmqf7SaSgwLKCnF86aWW0XVeqP85nQ+tYuI08=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1NwS84qCXUDXthzUByD/Z5mVX8WWk3RxZpzYy4CgQ4g2KshG882dKWcDO35RzYxX2tjkbjEZX1BsyHDYJBjPirLUmbXcKmAqZTS99KUMpJeiBBD65LxO1M298o3ol40Hce8Pds8UE4eB1TWU9O704G8EV5g5j9K2sbFyuhxKQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G7Jq546C; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G7Jq546C"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 790B71F00A3D;
	Wed,  5 Aug 2026 21:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965370;
	bh=SmN3UZnYPGJlOxdz/vYWo8HMtfQFtN5rBr8sg92+zgg=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=G7Jq546CLyvAnGRqn99DfAy8D4LJ6VZIRrDWh7RqseU2E2POCY48SO/3gs45tnlWm
	 p3FG+2SXEea2ddxhIksqrUZW0KTxIn+cBlLwrLkPnPQAMGZi9lLwGJNss+OKDiAXcA
	 z9DCW7BbRNI2lzlQ2yoopSeB9bGJ08YRbRWcEZAea31nJI75FRmXjKVKhTSNnhoB3+
	 750BZuzPJHqTqVB51n7Au4vh2wS4/hctedcBrZtNTjS9HXWeeULKBsNCS3zg6UX+l0
	 Cwp3T3aUwrbiq25kIgnuvSdgb1nUW+wciPh0nomVXztitOsUkxTKWrA6DZQfwLCfsG
	 25eu9JnztIflA==
From: Danilo Krummrich <dakr@kernel.org>
To: dakr@kernel.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	aliceryhl@google.com,
	daniel.almeida@collabora.com,
	arnd@arndb.de,
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
Subject: [PATCH v2 2/2] rust: io: gate ioremap doctests on CONFIG_HAS_IOMEM
Date: Wed,  5 Aug 2026 23:28:36 +0200
Message-ID: <20260805212920.1996937-2-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260805212920.1996937-1-dakr@kernel.org>
References: <20260805212920.1996937-1-dakr@kernel.org>
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
index d30bb5c6d4fc..d4063ee41200 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -81,6 +81,7 @@ pub fn maxsize(&self) -> usize {
 /// # Examples
 ///
 /// ```no_run
+/// # #![cfg(CONFIG_HAS_IOMEM)]
 /// use kernel::{
 ///     bindings,
 ///     ffi::c_void,
-- 
2.55.0

