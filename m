Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F69E4C6D;
	Sat, 11 Jul 2026 18:02:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783792977; cv=none; b=fMHOSwglot8Vhd0POaRu4YDCCZzXOzRWZ9OKQYsA4qOckBK9hb7reOo5LNAbkjFNf5q/XEBCD2jMQbKbK1eAbHn4+Zaln9a+SA2Bkr44s3RFo7lrVZg3e26+qrV+csx2+FMxM/C6kb+mS9iCn7vQ/G5ZnubHTO+lo1k73rpaVV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783792977; c=relaxed/simple;
	bh=1dhsOHCMqtGsC/1rZHjJgSfRl1ZkzY1Wamsmh41mQ0k=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AZ9KnV6xoyYlPRU3IbIl6pgg+0zOX/pInC11AFGWeFEb8sCYVuSMr1F6/HHourKgszPQGNrzooujPMBcgiMwy9BsEvX5y0Gky/hY1rjAk9KHVlUIwya2IdYPXNLaHYZk5ma1GCydOmBwH6qlJPxjVYVf4M0LSRvsGv2tcHYDFjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbXnQdp/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbXnQdp/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FF7A1F000E9;
	Sat, 11 Jul 2026 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783792975;
	bh=bZwg5+Tbow41wijWD1X/nTLMuAfhLgYtIt3qLRqlTzk=;
	h=From:To:Cc:Subject:Date;
	b=GbXnQdp/wzq2mjSw0QH0icHlqXiaAEZW5HeKLffVZ3zUd9RExtSkt/zcRXpfXNllD
	 5hIwJBoMOZJJjO6lB6xQdfGUXPhVV15ULIUFISS3R20GCSNa48n0Hmi33UD3cFXAMZ
	 /aHgFQEIHigtvM0BCWY6emtJ1xgJdmEdlzUE7SSiGoAD+ZBh0pe0983M9paDZQ/eQd
	 X1eugoICkUY7g7ac2hQtyel/HSXs3HDeeWQaXHVN3fRVfnNCWHALG/hCcNz0H2Szf1
	 wvQFVoD+d6yL35/4Yh1wozpInBCjHFNy3NbXAgU8uUIGmJYIHoFNWqTXuKNwrbQ6RO
	 5ghm83c6ni2sw==
From: Miguel Ojeda <ojeda@kernel.org>
To: Luis Chamberlain <mcgrof@kernel.org>,
	Russ Weight <russ.weight@linux.dev>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>
Cc: driver-core@lists.linux.dev,
	Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>,
	Trevor Gross <tmgross@umich.edu>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	rust-for-linux@vger.kernel.org
Subject: [PATCH] rust: firmware: avoid UB in example by passing parameter
Date: Sat, 11 Jul 2026 20:02:31 +0200
Message-ID: <20260711180231.229525-1-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The `Firmware` example crafts an `ARef<Device>` using a null pointer,
which breaks the safety requirements of `Device::get_device()`.

Instead, pass an `ARef` via a parameter, which is simpler, avoids UB
and removes an `unsafe` block.

Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
---
 rust/kernel/firmware.rs | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/rust/kernel/firmware.rs b/rust/kernel/firmware.rs
index 71168d8004e2..3aa9de3c4a04 100644
--- a/rust/kernel/firmware.rs
+++ b/rust/kernel/firmware.rs
@@ -51,12 +51,9 @@ fn request_nowarn() -> Self {
 /// # Examples
 ///
 /// ```no_run
-/// # use kernel::{device::Device, firmware::Firmware};
-///
-/// # fn no_run() -> Result<(), Error> {
-/// # // SAFETY: *NOT* safe, just for the example to get an `ARef<Device>` instance
-/// # let dev = unsafe { Device::get_device(core::ptr::null_mut()) };
+/// # use kernel::{device::Device, firmware::Firmware, sync::aref::ARef};
 ///
+/// # fn no_run(dev: ARef<Device>) -> Result<(), Error> {
 /// let fw = Firmware::request(c"path/to/firmware.bin", &dev)?;
 /// let blob = fw.data();
 ///

base-commit: 8cdeaa50eae8dad34885515f62559ee83e7e8dda
-- 
2.55.0

