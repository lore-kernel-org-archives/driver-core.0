Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA5E13B777B;
	Tue, 26 May 2026 18:08:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779818887; cv=none; b=LwqZ2xBZbvARRtNZSeWVCbtBwSgJP0gd1J0J0GkW/RfLnRlIwleYcpx+Ocpq23lfYRapXRhjDhmvwN4nKGTn966MVy5MY4LAnRW2W+2mzUX+JtSCWwnPmF/Bn+I9a5GS4K1iuk7m4GGs76pCghvZWSWbipyWu2plHjpjI+BP9ws=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779818887; c=relaxed/simple;
	bh=9ADbbEt616Wzg/LPf+RE06MK8211u/jvXlvoHLV2xBE=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=tXN6HWUIvP92gjXt+RhZyqWbWZj8LSsE67GviAzKP9Zot14WQ2eFehwq1WSdAnPyAuZRlgFsCZssB3mQi3KjCuGXy1MXkfiIXX/7KcO37ZrNIHVJRoE9hAwR/Wf4nJYOSRRl3oeT7Xlkm/VgQ86kik+4Oe8nY0SnkL7Lg5Uu07s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=G3MGvjGY; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="G3MGvjGY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C3611F000E9;
	Tue, 26 May 2026 18:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779818885;
	bh=AgLZ0sl84MyjYmhW3GXgg4qRtWGYwbHUXFGsMdL41s8=;
	h=From:Subject:Date:To:Cc;
	b=G3MGvjGYDbuEmRxeLFn4X8VU5rUC4XGxuGzgldvEWnOYX5pdN/Z5Es4fEyWJAA9nc
	 fyR/WNM5jevWmnMQJti2V1V1e+16u+EslFQxL2P3ZWH0tdlONXk69w8l1Lz7TPvBzc
	 xfRb1SxpuU/EFDy4s1vr9t//SGG5uDLkdCuWnu/Zq2z1jN5tPJp09umYqgd8K37yuv
	 d6rBb5Cejzo3NBm7hJv+P8qMBywdVXp2SW/PLZXmyVedv0LTk4NxJKl1U7CrTWeYtt
	 vjHdrZVSAUrBYgeX473UWlPxkp6tvJA0pg3u6+/nqndUFGLP9Iz7COu/v7zx5RlPsW
	 dANg45Q49BvCg==
From: Tamir Duberstein <tamird@kernel.org>
Subject: [PATCH v2 0/2] rust: debugfs: fix callback file unsoundness
Date: Tue, 26 May 2026 14:07:57 -0400
Message-Id: <20260526-fileops-unsound-redesign-v2-0-6fc11066b530@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/42NQQ6CMBBFr0Jm7RjapJW48h6GBaVTGCUt6QDRE
 O4u6AVcvuT991cQykwC12KFTAsLp7iDPhXQ9k3sCNnvDLrUtjTaYuCB0ig4R0lz9JjJk3AX0ai
 mUk5dgjEa9vmYKfDrm77XP5bZPaidjt5h9CxTyu/v96IO74+bRaFC55WtTOuaYOztSTnScE65g
 3rbtg+u9noj0wAAAA==
X-Change-ID: 20260526-fileops-unsound-redesign-51a81b17f552
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2337; i=tamird@kernel.org;
 h=from:subject:message-id; bh=9ADbbEt616Wzg/LPf+RE06MK8211u/jvXlvoHLV2xBE=;
 b=owGbwMvMwCV2wYdPVfy60HTG02pJDFmiD5t5dqSI3H917dwuqZKM2/vWMGz7FxKYmh7vuIune
 /YmoSWKHRNZGMS4GCzFFFkSRQ/tTU+9vUc2891xmDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0EjHQMeYgYtTAKZ6Wj7D/7hotV0yortbtgVu/jc7sZ/dJ8RtSR1/4IRV5+z2F0z8dJDhnzXL8Qu
 XF0/hP8z06Hve20ytonDB3EtL3dlPyrlOX/bbhAEA
X-Developer-Key: i=tamird@kernel.org; a=openpgp;
 fpr=5A6714204D41EC844C50273C19D6FF6092365380

Commit 40ecc49466c8 ("rust: debugfs: Add support for callback-based
files") introduced two ways to construct references whose requirements
are not met.

First, `write()` constructed an `&mut seq_file` although file operation
callbacks may run concurrently for the same open file. It only needs
`seq_file::private`, so patch 1 reads that field through a raw pointer.

Second, `FileOps::adapt()` transmuted a reference between different
generic instantiations of a default-representation type, despite there
being no layout guarantee. Patch 2 replaces this with an explicit
adapter safety contract.

I discovered the second issue while looking to remove
reference-to-reference transmutes after discussing with Alice [1] and
the first issue was found by Sashiko in the v1 review.

Link: https://lore.kernel.org/all/CAH5fLgibt_BQmOtkfEfo1=48zUeoWBJ-=u5gzw_a3X6Q7=aUSA@mail.gmail.com/ [1]
Signed-off-by: Tamir Duberstein <tamird@kernel.org>
---
Changes in v2:
- Fix the pre-existing `write()` aliasing issue reported during review
  of v1.
- Link to v1: https://patch.msgid.link/20260526-fileops-unsound-redesign-v1-1-bd1685cbaf56@kernel.org

To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: "Rafael J. Wysocki" <rafael@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
To: Miguel Ojeda <ojeda@kernel.org>
To: Boqun Feng <boqun@kernel.org>
To: Gary Guo <gary@garyguo.net>
To: Björn Roy Baron <bjorn3_gh@protonmail.com>
To: Benno Lossin <lossin@kernel.org>
To: Andreas Hindborg <a.hindborg@kernel.org>
To: Alice Ryhl <aliceryhl@google.com>
To: Trevor Gross <tmgross@umich.edu>
To: Matthew Maurer <mmaurer@google.com>
Cc: driver-core@lists.linux.dev
Cc: rust-for-linux@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Tamir Duberstein (2):
      rust: debugfs: avoid borrowing seq_file in write
      rust: debugfs: avoid transmuting FileOps

 rust/kernel/debugfs.rs                   | 20 ++-----
 rust/kernel/debugfs/callback_adapters.rs | 67 +++++++++++-----------
 rust/kernel/debugfs/file_ops.rs          | 96 ++++++++++++++++----------------
 3 files changed, 90 insertions(+), 93 deletions(-)
---
base-commit: fc1ce3afa2e61b4b15e71436ece91b0441a9f4f0
change-id: 20260526-fileops-unsound-redesign-51a81b17f552

Best regards,
--  
Tamir Duberstein <tamird@kernel.org>

