Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17E4E4DA9B4;
	Mon, 19 Oct 2026 11:48:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792410512; cv=none; b=oc7ascoxBK8YyLmHl7zwmPm7sGwBPm6KTCVFA7AqARvfh7ZaZK4aSo/U1TAAlph3MXSHBVLjUog9IEjOlVKJbebpK1dz3J2pWcGtgRUsOI9OrrnACHTaR5fpPiUiu8L8yr1VXMxRXDDCGVmGBi0DZieFpcyHG+iSU0CQuWPwNLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792410512; c=relaxed/simple;
	bh=cavO+vB9WQqPaTpm76RGrFLQ0nYmnIVBpjnQrvt4MSo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=vAertQNVRBfCdPDQ9QRJjcU1CvlvBcRz8pfD36Fsp9FD1FnAB3aebmOXPdkt26YUgNnk6ktdZZ06/bZfojsWlrWuHHoav/aZsUxqtkdmIQYHoSZcfhgsHh0dFtNQjxvogIyPDHbOpVOQLsFrvsv9qYqILiCenDU+/lrRkWT7Lq4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ECDVeieu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ECDVeieu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEDB61F000C4;
	Mon, 19 Oct 2026 11:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792410510;
	bh=qqw66inKRUTRV7Z7B1eVJRip5F//bCyfpe2WMmXcebs=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=ECDVeieuAw36mJSmpXp6A720fvr1iq8ofNi5mt7BTouXFKgxvK27GqTGO33dneXUC
	 GAPbyo8EwdceBgOW0LP6HFLxRSsYpG822b1LpoZtL+sqso16MAHI61SbM+h6smbEX0
	 cqkwThYnNDLjQtrcSNTMpZ1KyDbIIeU9kjZwI+cGwe35xmqlSMkcSZnxdhcFSIqA88
	 BU2Yq4nIq9CV4FoDR5m9gMXG8OEqqAX3gDIqhEOFeTcoCowdqGXZyVQtKmU9XKpphU
	 USW/JkjbMmvGyTf13dmWe8VwE5Vi2x7Cdk+JDAUeBlroCIMkuRfWPOcVO6cKCC9BAc
	 apkiywYOvw2lw==
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
Subject: [PATCH] rust: doc: mark `Io` as notable trait
Date: Mon, 19 Oct 2026 12:48:10 +0100
Message-ID: <20261019114811.1105192-1-gary@kernel.org>
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

`Io` trait is the primary way of interacting with a bunch of types, e.g.
`Mmio` and `Coherent`. It is hidden in "blanket impl" section which is not
very discoverable.

Use nightly feature to mark `Io` as a notable trait, so it is highlighted
at the top of the rustdoc page.

Signed-off-by: Gary Guo <gary@garyguo.net>
---
 rust/kernel/io.rs  | 1 +
 rust/kernel/lib.rs | 3 +++
 2 files changed, 4 insertions(+)

diff --git a/rust/kernel/io.rs b/rust/kernel/io.rs
index a877df11a03e..377c95dda04b 100644
--- a/rust/kernel/io.rs
+++ b/rust/kernel/io.rs
@@ -486,6 +486,7 @@ pub trait IoBase<'a>: Copy {
 /// - Fallible (runtime checked) accessors for different data widths
 ///
 /// Which I/O methods are available depends on the associated [`IoBackend`] implementation.
+#[doc(notable_trait)]
 pub trait Io<'a>: IoBase<'a> {
     /// Returns the size of this I/O region.
     #[inline]
diff --git a/rust/kernel/lib.rs b/rust/kernel/lib.rs
index 1ab41129d557..f7f720b9888a 100644
--- a/rust/kernel/lib.rs
+++ b/rust/kernel/lib.rs
@@ -29,6 +29,9 @@
 // To be determined.
 #![feature(used_with_arg)]
 //
+// For documentation purpose only.
+#![feature(doc_notable_trait)]
+//
 // `feature(file_with_nul)` is stable since Rust 1.92.0. Before Rust 1.89.0, it did not exist, so
 // enable it conditionally.
 #![cfg_attr(CONFIG_RUSTC_HAS_FILE_WITH_NUL, feature(file_with_nul))]

base-commit: d419d682257d813f6cb7a28e42b35d0edf4ad038
-- 
2.54.0

