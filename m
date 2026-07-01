Received: from luna.linkmauve.fr (82-65-109-163.subs.proxad.net [82.65.109.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15FE035F16C
	for <driver-core@lists.linux.dev>; Wed,  1 Jul 2026 16:11:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.65.109.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922296; cv=none; b=JzN3lHcKkhVf+CIGwJbSxq5uJkk/+Zs7puONH21GHqenQqPATG3l97ulTyhPBo7fXaheW+JrPIyWSH2t+sMgzoR2SjPgxnM5aTcEFIVd2OJNM17Xfhe+yoGibCtzI8MFdDXc3EbG8bS6ZykWc1PpQlm+9Mq0XIs+Dp9MBM4mkQU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922296; c=relaxed/simple;
	bh=FqvZdons7T/sC4h1H5YBGx20QHiT4tvGaI/E7Lr3CsI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version:Content-Type; b=svHtJEcBQrUyRFKqfMITJyTCciti2oSiHesuMVodIqYo95h26ik0aU32pbMomF8pkIES7KxtW3yxdf2nm6v08liasfo6T8Ytl/KFhXpDU0kJNnnmrQWJ6i7DORdy/D0zvSY6Yo1ARsaBIDMnXN/ZZVDRtRIHF47cC2Q31xRAkZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr; spf=pass smtp.mailfrom=linkmauve.fr; arc=none smtp.client-ip=82.65.109.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linkmauve.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linkmauve.fr
Received: by luna.linkmauve.fr (Postfix, from userid 1000)
	id 8F407F40B26; Wed, 01 Jul 2026 18:04:01 +0200 (CEST)
From: Link Mauve <linkmauve@linkmauve.fr>
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
	=?UTF-8?q?Onur=20=C3=96zkan?= <work@onurozkan.dev>,
	driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Link Mauve <linkmauve@linkmauve.fr>
Subject: [PATCH] rust: io: fix example in `register!` macro
Date: Wed,  1 Jul 2026 18:03:54 +0200
Message-ID: <20260701160357.29031-1-linkmauve@linkmauve.fr>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

In this example, an u32 register is split in two u8 in big-endian order,
but the high byte is actually defined as taking nine bits instead of
eight.

This is completely inconsequential, as I expect most users will just
copy the bit ranges from their datasheets, but it doesn’t hurt to fix
that typo.

Signed-off-by: Link Mauve <linkmauve@linkmauve.fr>
---
 rust/kernel/io/register.rs | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/rust/kernel/io/register.rs b/rust/kernel/io/register.rs
index f924c7c7c1db..66449377a0b7 100644
--- a/rust/kernel/io/register.rs
+++ b/rust/kernel/io/register.rs
@@ -448,7 +448,7 @@ fn into_io_op(self) -> (FixedRegisterLoc<T>, T) {
 ///
 /// register! {
 ///     FIXED_REG(u32) @ 0x100 {
-///         16:8 high_byte;
+///         15:8 high_byte;
 ///         7:0  low_byte;
 ///     }
 /// }
-- 
2.55.0

