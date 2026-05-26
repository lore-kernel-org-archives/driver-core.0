Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9D03C8C7C;
	Tue, 26 May 2026 14:39:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806382; cv=none; b=IIca6d1RQG3gpVGJ2p8NgWxydH6ZZKBJ2axKd+RhXzxFCu+vF4P/oVsGxL2/mb4lSUVeeS8xhDRp4O8czK9lrad3y4zdJizTdndItgpA5wYszAExg0Yx/jWTnFfguHjy6SIFvL5TqZ++8cqFvIJZIiToDtsO/aO1rQItroTHERg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806382; c=relaxed/simple;
	bh=jtSVR/F6PNKgzGgxXsKqAicbXWohzTvPvShM+TgstwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tY/ZY079xrFt/+fzpBkkPaGGr5aI5GqZxyRnhtzLJN8WIOHlxzmaQBRQH8Mt4qEamCpKgP0jF+y9K4hPE9YDGXLtO2MB7DAIEU/3/K1f57XZuv6hEw0FcFm8Vfs4tC/+9E44I40ZrbcyGMNXZ7/KwB4yoix92xH9IL4zURCskmA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kECZXKqB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kECZXKqB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 158B51F00A3E;
	Tue, 26 May 2026 14:39:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779806379;
	bh=4iVepei/+7bQofT0t4P5cu88kUQu5myDyLxDZfehFtg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=kECZXKqB76o3vjV+vsk/RKKP59wVnCtoeiHf9sHXV9wa2entj+Qc0kngmhVW1Ej5k
	 T+YGI94bGjJpQHW0pigLpN3lJMgt3d6AFO+/dBeHTDD4U+M2vbIcrpZ/1Ecb4zekbK
	 dkSwmjiouKpfzzeuJg+D86uiBgCdeLIXQOUBepkPIHuKAUJmiVwBC+zL3W20zAmAgT
	 wHCeOckPj8wrc+b6yudJqI2nXTskceXIEuXrpIQufb8j0LckIK7Us/EWFWZzh8k4qV
	 s1qUqWWy/nLUbBNLnLnRRcD3dHZknZ2UZcw/289oOgFvn6qFq8D8HOWlYGFjjQk7rW
	 SBA6KaKQLFzww==
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 26 May 2026 10:39:32 -0400
Subject: [PATCH 2/2] rust: device: remove array copy
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260526-trasnmute_ptr_to_ptr-v1-2-d89bc1dda3b5@kernel.org>
References: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org>
In-Reply-To: <20260526-trasnmute_ptr_to_ptr-v1-0-d89bc1dda3b5@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Tamir Duberstein <tamird@kernel.org>
X-Mailer: b4 0.16-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1102; i=tamird@kernel.org;
 h=from:subject:message-id; bh=jtSVR/F6PNKgzGgxXsKqAicbXWohzTvPvShM+TgstwA=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiG5aF9Gv8Vjxe90Bl+4rYx3M/3y5abP2TgcG74P4Fa
 R3dpGWeHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKb6myzDP0tG+52MKSy9Ge91DfaXvPA3sHM78o+vvlHj+K7nrnMVzzMyLF3XJxX
 K2mJpFcPOtPN5zwRht8wpEv2vXCwc2Se+O/OFEwA=
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

`[T; N]::map` constructs a copy of the array which is not necessary
here, thus follow the example in the `MaybeUninit` documentation and
transmute `[MaybeUninit<T>; N]` to `[T; N]`.

Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
 rust/kernel/device/property.rs | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/rust/kernel/device/property.rs b/rust/kernel/device/property.rs
index 87be2784f7a7..a85467c99636 100644
--- a/rust/kernel/device/property.rs
+++ b/rust/kernel/device/property.rs
@@ -549,7 +549,9 @@ fn read_from_fwnode_property(fwnode: &FwNode, name: &CStr) -> Result<Self> {
 
                 // SAFETY: `val` is always initialized when
                 // `fwnode_property_read_*_array` is successful.
-                Ok(val.map(|v| unsafe { v.assume_init() }))
+                //
+                // See https://doc.rust-lang.org/stable/core/mem/union.MaybeUninit.html#initializing-an-array-element-by-element.
+                Ok(unsafe { mem::transmute::<_, [$int; N]>(val) })
             }
         }
     )* };

-- 
2.54.0

