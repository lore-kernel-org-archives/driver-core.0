Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B304F1F938;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784449743; cv=none; b=gtkGSb8yFdYl3exwgbIXC/qo18SI1yGm2sTeUYzSVxCeFFnSZa0DldcANarrXVumiYE9OBB5yuVP09oW2cseTy1KmAoGqlbWbYLTq4DDzt1pACA4VOWOxCEaOjtdBfYGmIlIjmaEE9/Qi1lOkEVydiP5rTc4Q+o5zx5eTk4w9Tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784449743; c=relaxed/simple;
	bh=+Y+dMqSu30++/HeilifSoYXXCl2DeneoUS6AA6C233s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=MT1ieWH0j6iixx4WHKuocz/wbdVyGsadaCC/965A+odsU/PHvxwygLE5e7VkHvLrkBqAp0akie3dZbUtpQqTztfSo5fopQPlnLbgN1NyBMiyIwjNtXf/d1k5mSt0M3ituULpLmqBtJVMSvtYIbL4OAbR56OQMiho2ORSPYxXJtE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pb+2Qtgm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pb+2Qtgm"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 37E27C19425;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784449743;
	bh=+Y+dMqSu30++/HeilifSoYXXCl2DeneoUS6AA6C233s=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Pb+2QtgmmHS3Raz5rGsfSzn+kvsXJS6B09c1TSrcHcnET7dgVazzYTrN7xyCAshwT
	 rtLsnlTYmKH3IRiR192b/RqE9LaNAPwtN5eBR2o/0HTXSL2wv/WhnPD2FwShFFqjSV
	 ftyrTuKTuOftNgzNEX0Xf9BBX3o6RlR00f1SRj17gcWrySzDpe+cwFZE2acydm4XkE
	 Dm/1r7TEymawPcrgM9mDpvU+xQgDnPvfwzRiwhqwSOnsGEdT2HM+ZRGiwcYG68rmb+
	 XvCmVNXdqDeNpeyy9mcxBSxNT6CLKzZRXEY+RnigBbw3zote/YZV07sDk1rHoymLDu
	 1APhAjqiExJ+Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24587C4451B;
	Sun, 19 Jul 2026 08:29:03 +0000 (UTC)
From: Josef Ippisch via B4 Relay <devnull+josef.ippisch.dev.mailbox.org@kernel.org>
Subject: [PATCH 0/2] rust: debugfs: migrate BinaryWriter requirements to
 zerocopy
Date: Sun, 19 Jul 2026 10:28:47 +0200
Message-Id: <20260719-migrate-binarywriter-to-zerocopy-intobytes-v1-0-27ed30512e75@mailbox.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXNSw7CMAwA0atUXmOpKahQroK6SIJTjERSOeYTq
 t6dAMu3mVkgkzBlODYLCD04c4oVZtOAv9g4EfK5Grq269u9GfDGk1gldBytlKewkqAmfJMkn+a
 CHDW5opTR0CHsKAxb27dQg7NQ4Ndvdhr/znd3Ja/fA6zrByIjqcWOAAAA
X-Change-ID: 20260719-migrate-binarywriter-to-zerocopy-intobytes-1e8f4ef93a60
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Daniel Almeida <daniel.almeida@collabora.com>, 
 Tamir Duberstein <tamird@kernel.org>, 
 Alexandre Courbot <acourbot@nvidia.com>, 
 =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Joshua Liebow-Feeser <joshlf@google.com>, 
 Miguel Ojeda <ojeda@kernel.org>, 
 Josef Ippisch <josef.ippisch.dev@mailbox.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784449742; l=2110;
 i=josef.ippisch.dev@mailbox.org; s=20260719; h=from:subject:message-id;
 bh=+Y+dMqSu30++/HeilifSoYXXCl2DeneoUS6AA6C233s=;
 b=4LzJukWpHx3BW3yuSqUZo97oUWqt3RybmSx+UHgmW9fomCT64PQcc9bLa7inTXeC0hIHwZBuH
 TtdHCTFY0OPCoYiP/lFsAq2slW10wNg35UZi7EBHboiqDL8J/jSYWFx
X-Developer-Key: i=josef.ippisch.dev@mailbox.org; a=ed25519;
 pk=M4DnWHhz9yT9BkhXKzsmw6wTVrK2U1WBK0QiEjHoo1U=
X-Endpoint-Received: by B4 Relay for josef.ippisch.dev@mailbox.org/20260719
 with auth_id=884
X-Original-From: Josef Ippisch <josef.ippisch.dev@mailbox.org>
Reply-To: josef.ippisch.dev@mailbox.org

Migrates the `BinaryWriter` default implementation requirements from
`kernel::transmute::IntoBytes` to `zerocopy::Immutable` +
`zerocopy::IntoBytes`.

This is part of a bigger migration from rust/kernel/transmute.rs to the
zerocopy crate, see also [1] and [2]

[1] https://github.com/Rust-for-Linux/linux/issues/975
[2] https://github.com/Rust-for-Linux/linux/issues/1241

The crate zerocopy was introduced with

c37398010a05 rust: zerocopy: import crate

This introduced among other things the `IntoBytes` trait that, when
derived, does better checks on the actual requirements of the types than
the existing `kernel::transmute::AsBytes`.

This is my first kernel patch so please let me know if I do anything wrong
process wise or regarding some other aspect!

There are some other points that I came across when investigating this

- rust/kernel/debugfs/traits.rs still depends on
  `kernel::transmute::AsBytes` for `BinaryReaderMut`.  Should I directly
  migrate this also in this patch series? This would require migrating also
  to `zerocopy::FromBytes` as the implemention for T depends on both
  `AsBytes + FromBytes` currently.
- I noticed that we could probably get rid of the `BinaryWriter`
  implementation for `Vec` altogether if we implemented `Immutable` and
  `IntoBytes` for `Vec`.  These are already implemented for [T] after
  all. What do you think?

Suggested-by: Joshua Liebow-Feeser <joshlf@google.com>
Suggested-by: Miguel Ojeda <ojeda@kernel.org>
Link: https://github.com/Rust-for-Linux/linux/issues/975
Signed-off-by: Josef Ippisch <josef.ippisch.dev@mailbox.org>
---
Josef Ippisch (2):
      rust: debugfs: migrate BinaryWriter requirements to zerocopy
      rust: debugfs: remove unsafe block from BinaryWriter impl for Vec

 rust/kernel/debugfs/traits.rs | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)
---
base-commit: 7059bdf4f04a3e14f4fafb3ac35fdca913e3e21a
change-id: 20260719-migrate-binarywriter-to-zerocopy-intobytes-1e8f4ef93a60

Best regards,
--  
Josef Ippisch <josef.ippisch.dev@mailbox.org>


