Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38C2F42A16C;
	Thu, 16 Jul 2026 14:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784212924; cv=none; b=SHXpqxtbBvbiu8t7UsV5NubuWs89BK/pCP1DWa7WHATrslIo63uCqbeEyINM48qMU43nuf7y8WcRIAFTFi+ypQplCGKGyT13EzWTTIYl0Ngyq2magnyTdLPwYFhMK8Wf4/WhDAWe+y1UbiZ5/A7XiVj1NhKXxaaLxEb+MkYUfdM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784212924; c=relaxed/simple;
	bh=ktauNXQOw962D2keUl3Owny9HT+OtRxodz7Uc3JMETo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Ol5ha6l1nhQRXK3UqwzcgxYb8P2Q8dxMwQyX9qkG265fiNY8k6xW7LiLERoI/7hdchOj4PCHQYzc+/wBYRNNVVgwR++FJS5H8un60Mw/i0KeGgMGgeJMyElBjxKunJIvzBNDoCP7CtPY2mhe72mM6Yp8eGxN7dn/ycC9W49J19o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g6DEGEOf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g6DEGEOf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24EAA1F000E9;
	Thu, 16 Jul 2026 14:41:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784212920;
	bh=cBNhQvk+IcvUbH3tfApg+mXowQa+Tjg9XU2exeDrHrI=;
	h=From:To:Cc:Subject:Date:Reply-To;
	b=g6DEGEOf31fG3Jwr9BSxX4isdJudiUNdIW0DEbPngJTXpZKZu7poSPKTg5loOuOqu
	 lx4ZgDohf0xvAHYY9/BIWv/uD0flvPqD++8V42KbN4/pNCl6eNVsnSxQhrJzWfYepy
	 eex8HKr+JJLuYUBZhikyd3P7mPnYCiIRPF3N90VCMAGbQpu8OhkEvRP0xqhYkwcQ4n
	 l5H1B7dykTVSJQkKuE+xpJ05690JyGZLVQW4TZHOAQg1Z6V8E9xSTThkVMLCkMboY7
	 C7WzroIQ5HDwQPnvjiTwXV9LEioC2A5hpG9HdPJo39FMUyX0dRlP1kDMbMB7iAHLHQ
	 /RANaZb04x8DA==
From: Gary Guo <gary@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
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
	Matthew Maurer <mmaurer@google.com>
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] samples: rust: debugfs: fix excessive stack use
Date: Thu, 16 Jul 2026 15:41:43 +0100
Message-ID: <20260716144144.3665719-1-gary@kernel.org>
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

The current implementation creates a 4K array and move it into the box.
Klint reports that this causes excesssive stack usage:

warning: stack size of `create_file_write` is 4472 bytes, exceeds the 2048-byte limit
  --> samples/rust/rust_debugfs_scoped.rs:54:1
   |
54 | / fn create_file_write(
55 | |     mod_data: &ModuleData,
56 | |     reader: &mut kernel::uaccess::UserSliceReader,
57 | | ) -> Result {
   | |___________^
   |
   = note: the stack size is inferred from instruction `sub $0x1178,%rsp` at .text+2205

Use pin-init to create the array in-place instead.

Fixes: f656279afde1 ("samples: rust: debugfs_scoped: add example for blobs")
Signed-off-by: Gary Guo <gary@garyguo.net>
---
 samples/rust/rust_debugfs_scoped.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/samples/rust/rust_debugfs_scoped.rs b/samples/rust/rust_debugfs_scoped.rs
index 6a575a15a2c2..33a4a0865f5b 100644
--- a/samples/rust/rust_debugfs_scoped.rs
+++ b/samples/rust/rust_debugfs_scoped.rs
@@ -75,7 +75,7 @@ fn create_file_write(
             GFP_KERNEL,
         )?;
     }
-    let blob = KBox::pin_init(new_mutex!([0x42; SZ_4K]), GFP_KERNEL)?;
+    let blob = KBox::pin_init(new_mutex!(pin_init::init_array_from_fn(|_| 0x42)), GFP_KERNEL)?;
 
     let scope = KBox::pin_init(
         mod_data.device_dir.scope(

base-commit: b8809969e1d7a591e0f49dd464a5d04b3cf02ab1
-- 
2.54.0

