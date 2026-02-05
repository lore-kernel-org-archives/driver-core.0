Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D06C33A007;
	Thu,  5 Feb 2026 22:47:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331671; cv=none; b=hI+KJvSFQBw04xU0TeJZKNsNCawqSnP6XCtbsyMc3brwdLLDRDxDBCVdYoZs+pRbL/S8FnJyqgAlh9DCN82X2dUzZZakcrjBAlp4AN60nEUKUTSYwROKCpjiYL7lYtiP/jZUduLxCkCKtWtIR95YFoqAgVkJAx2lK3oqI9lj2Wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331671; c=relaxed/simple;
	bh=e8wSTiiTvERd3xcoRzudPKhHazcf1heFtzfB7SYEFKI=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=dAEmdTfh9HhfvgW5TOaPsTIbiAC/ABJJMwhHqPFTL+fpIf3rz/JA6OqtOxK8IIHl6xJYmPykkIpBv1MlAS4wqPKWuRRuu3xwqf3SHf9B9toQGSxKIGIUAJ9D9tnXyMXRBb/xQO8RxLTtSGH0FIhHs7KVcoD1Y8SjFzld6Y8ybIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DRbgMMkV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DRbgMMkV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C91ACC4CEF7;
	Thu,  5 Feb 2026 22:47:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331670;
	bh=e8wSTiiTvERd3xcoRzudPKhHazcf1heFtzfB7SYEFKI=;
	h=From:To:Cc:Subject:Date:From;
	b=DRbgMMkV21y18LdkgVJFjq0GfdB6Z1voyHDt55/gzCo85RON+V4tC4IkErN57cwvw
	 NzB8nVARsSdF05KBKecZdDWjIvhSaXY1WtKlzBnYOaus5evBf0oom9fbaWJ0qwDTxu
	 06gm5es2Z1MXTguVzsFk+rc2Q4Pm5Q3COZqgvoo57sd+gh3tuw38ZjmAPXZZu3p/nT
	 IFtkMDuH4aJA9/ZF2/O00OzjgS4AvrBte+UfxTAEzyWoT2xKgcvEmfzWPCA+PP7q9j
	 nvz9N8lSix3rhACL2Ngo8gZ4tQIEvOWM9sIFxcWSc+s1xRrgU3U2WCm7m+M/O5vvDQ
	 vVPEmNyIsLTFQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org,
	ojeda@kernel.org,
	boqun.feng@gmail.com,
	gary@garyguo.net,
	bjorn3_gh@protonmail.com,
	lossin@kernel.org,
	a.hindborg@kernel.org,
	aliceryhl@google.com,
	tmgross@umich.edu
Cc: driver-core@lists.linux.dev,
	rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/5] Use struct devres_node in Devres<T>
Date: Thu,  5 Feb 2026 23:31:23 +0100
Message-ID: <20260205224706.91996-2-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Currently, the Devres<T> container uses devm_add_action() to register a
devres callback.

devm_add_action() allocates a struct action_devres, which on top of
struct devres_node, just keeps a data pointer and release function
pointer.

This is an unnecessary indirection, given that analogous to struct
devres, the Devres<T> container can just embed a struct devres_node
directly without an additional allocation.

In contrast to struct devres, we don't need to force an alignment of
ARCH_DMA_MINALIGN (as struct devres does to account for the worst case)
since we have generics in Rust. I.e. the compiler already ensures
correct alignment of the embedded T in Devres<T>.

Thus, get rid of devm_add_action() and instead embed a struct
devres_node directly.

This patch series is based on [1] and [2].

[1] https://lore.kernel.org/lkml/20260205222529.91465-1-dakr@kernel.org/
[2] https://lore.kernel.org/lkml/20260202235210.55176-1-dakr@kernel.org/

Danilo Krummrich (5):
  devres: move struct devres_node into base.h
  devres: export devres_node_init() and devres_node_add()
  devres: add devres_node_remove()
  devres: rename and export set_node_dbginfo()
  rust: devres: embed struct devres_node directly

 drivers/base/base.h   |  18 +++++++
 drivers/base/devres.c |  54 +++++++++++--------
 rust/kernel/devres.rs | 123 ++++++++++++++++++++++++++----------------
 3 files changed, 127 insertions(+), 68 deletions(-)


base-commit: c98d3727720db5f74bf40a8cd1c2da05081845ee
-- 
2.52.0

