Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C059A4218B1;
	Tue, 26 May 2026 18:08:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818888; cv=none; b=UiZApDInwJ/nOFgXk+6AKRpghapfCMkK3phHP6FSY30ecdcGeFgETHxS26PKYTPzYsceCULe15VLCr/HHQSmqCtjE9cyWuEbIdqNs2AZHMu9nP8jSAgBBcwDp3XGZWNOP8R8sb/bW1qzSkB3nQndJTm1i5FU1knQDMFViFMWSZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818888; c=relaxed/simple;
	bh=fPhb5mnZ7HY3d0HFo4W0PPSypmwtUTku5QweoDl8nhw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BqWiJqWD8Tomw4CPmAGSVejH4P1CVCNmtZiw33skqmDYpP4+9cnl2mN7OoVZey9eJoswj4L831e6v159oJ7MPTJLZgw+tTS4hJniUoXCoSUGYIOQdk/pdsfWHBjCxgYkG6RGeNppI233yF57P9YTbfoVk8l8uLdRZtj19/iPWVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FyM3phHy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FyM3phHy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D21BF1F00A3C;
	Tue, 26 May 2026 18:08:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779818887;
	bh=f4pQzpCpXJE0edPcAKSsCcSP86m1Lnjofzxf6dYCDUQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FyM3phHywid5C15NFtj40yGYrXEhEioKFPFWJkOyGq66aqUP2hrr5LC9Bl366FHDo
	 1XCIXigiD8O06K8ymcBBaUJaehe7n8J4uOwnknXweudruXG/63OyTutAccgjvM5ver
	 BTEXHlky6FrZEals4/9+UnVo7fCsXCc/DvNNyR2RDNB+37dhf+zMAj20AtVbRIS8Zo
	 MXWT1o2vb8iPnxul0SPPdi7UXMJ7mUGMEX+VYlGZG0zbtbWzeNV6u8uU+3HctvJyJB
	 FpMojztd/FslendcEsxbCrJZk8VVloMv3fVAfEn4B3KVWqq0Ykp5MK+MJH9I66HhpB
	 5DxikNZsKIZyg==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 14:07:58 -0400
Subject: [PATCH v2 1/2] rust: debugfs: avoid borrowing seq_file in write
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-fileops-unsound-redesign-v2-1-6fc11066b530@kernel.org>
References: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org>
In-Reply-To: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Matthew Maurer <mmaurer@google.com>
Cc: Tamir Duberstein <tamird@kernel.org>, driver-core@lists.linux.dev, 
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=2538; i=tamird@kernel.org;
 h=from:subject:message-id; bh=fPhb5mnZ7HY3d0HFo4W0PPSypmwtUTku5QweoDl8nhw=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiD5tZ9nWujeC8ZMrd9uZ3918JrrBTuiZXTnkuN3F+p
 b9ZMfl4x0QWBjEuBksxRZZE0UN701Nv75HNfHccZg4rE8gQaZEGBiBgYeDLTcwrNdIx0jPVNtQz
 NNIx0DFm4OIUgKm2ncfIcOzplBNtwid1HL577K0x7tl/pjDpVETukseLbMqMDty9c4fhnyG7tNY
 hubNPJx1/o71FViP4cLz9/81BDpkrFB3TMhhNWQE=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Commit 40ecc49466c8 ("rust: debugfs: Add support for callback-based
files") introduced `write()`, which creates a mutable Rust reference to
the `seq_file` stored in `file->private_data`.

File operation callbacks may execute concurrently for the same open
file. Creating that reference assumes exclusive access to the
`seq_file`, so overlapping calls can create aliased mutable references,
which violates Rust aliasing rules [1].

`write()` only needs the callback data stored in `seq_file::private`.
Read that field through a raw pointer instead, without borrowing the
containing C object.

Fixes: 40ecc49466c8 ("rust: debugfs: Add support for callback-based files")
Link: https://doc.rust-lang.org/reference/behavior-considered-undefined.html#undefined-behavior [1]
Assisted-by: Codex:gpt-5
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 rust/kernel/debugfs/file_ops.rs | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/rust/kernel/debugfs/file_ops.rs b/rust/kernel/debugfs/file_ops.rs
index f15908f71c4a..2bb2cbe156a3 100644
--- a/rust/kernel/debugfs/file_ops.rs
+++ b/rust/kernel/debugfs/file_ops.rs
@@ -159,7 +159,7 @@ fn read<T: Reader + Sync>(data: &T, buf: *const c_char, count: usize) -> isize {
 ///
 /// `file` must be a valid pointer to a `file` struct.
 /// The `private_data` of the file must contain a valid pointer to a `seq_file` whose
-/// `private` data in turn points to a `T` that implements `Reader`.
+/// `private` data is valid to convert to a shared reference to `T`.
 /// `buf` must be a valid user-space buffer.
 pub(crate) unsafe extern "C" fn write<T: Reader + Sync>(
     file: *mut bindings::file,
@@ -168,9 +168,10 @@ fn read<T: Reader + Sync>(data: &T, buf: *const c_char, count: usize) -> isize {
     _ppos: *mut bindings::loff_t,
 ) -> isize {
     // SAFETY: The file was opened with `single_open`, which sets `private_data` to a `seq_file`.
-    let seq = unsafe { &mut *((*file).private_data.cast::<bindings::seq_file>()) };
-    // SAFETY: By caller precondition, this pointer is live and points to a value of type `T`.
-    let data = unsafe { &*(seq.private as *const T) };
+    let seq = unsafe { (*file).private_data.cast::<bindings::seq_file>() };
+    // SAFETY: By caller precondition, `seq` points to a live `seq_file` whose
+    // `private` data is valid to convert to a shared reference to `T`.
+    let data = unsafe { &*((*seq).private as *const T) };
     read(data, buf, count)
 }
 

-- 
2.54.0

