Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F294E303C83;
	Fri, 13 Feb 2026 22:07:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020445; cv=none; b=JaRv+2usNvOjgeAHq4umSNXe5PE1afJQVHHIiDDs9v4/xaSw1jZvq3kQpERnzYcYS78aWS2pCn4SyU5zgtYAVvHu/WpZSSe87QWhosQEi4xnrcBYt4wZpmcoOEeeLOzhmHouXiOGZfi3AQoaLry+y8j2dOdUIXEMw1BPmFWBIqc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020445; c=relaxed/simple;
	bh=tFwbrWYA3A0KbxBhu94tNUB2GrK4RCxA0Mxn4EU/A+w=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=BgWCFIAGramEAfS6TvH9upZDJGadKXlDrcK4geWUotTZry/P+qdzLRuuHjE+Jc0bxmZLpnH2s6/NkWL0/6/pXvuLymlvRUj6cTAvxk+ee3MO/vOPHWgNLTABsq3I1rVtBXYRUWOxpXVArqLJsmnbx4kZ7fMbDNxaOMGYKFXdYEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c08N4mTJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c08N4mTJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AD79EC19425;
	Fri, 13 Feb 2026 22:07:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771020444;
	bh=tFwbrWYA3A0KbxBhu94tNUB2GrK4RCxA0Mxn4EU/A+w=;
	h=From:To:Cc:Subject:Date:From;
	b=c08N4mTJ4ZYaYIkzazkiJp7ehqDBD18yfXFVuA9gt/eAThN44i7BMwwliwvMFDeFx
	 ZJKmTzeFmJ/s6FhhRiJc0dw2UkIh6rfuVlovH2MzJFfKEQWGfQxx+QbupBl1YiLRqN
	 GS8l0XsEU0JgHL4/vpA+uTyqCWWdQ30KwxxrzOZVsEPW9bVn6w5QTSkEmo8ODvnHUD
	 DJf1gZbFsgubF99odbCuJxUqAGX15KVciYOupYdtMq2lHQq3yLOvhcC/6X8nzuB4Ml
	 82IIg4+bbkNqreMNoul9JGrtfJoYZymUidS4MkLMDB279q3ccfIUaUJa5KxX2J94/U
	 8+fLv7XITFa6w==
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
Subject: [PATCH v2 0/5] Use struct devres_node in Devres<T>
Date: Fri, 13 Feb 2026 23:07:10 +0100
Message-ID: <20260213220718.82835-1-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
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

This patch series is based on [1].

[1] https://lore.kernel.org/lkml/20260202235210.55176-1-dakr@kernel.org/

Changes in v2:
  - Prevent driver-core internal C APIs from potentially being called directly
    from driver modules due to monomorphisation, to prevent unnecessary symbol
    exports.

Danilo Krummrich (5):
  devres: move struct devres_node into base.h
  devres: export devres_node_init() and devres_node_add()
  devres: add devres_node_remove()
  devres: rename and export set_node_dbginfo()
  rust: devres: embed struct devres_node directly

 drivers/base/base.h   |  18 +++++
 drivers/base/devres.c |  50 ++++++------
 rust/kernel/devres.rs | 182 +++++++++++++++++++++++++++++++-----------
 3 files changed, 180 insertions(+), 70 deletions(-)


base-commit: 1680377f05a809e4489731ad0e5a5fd5471ec40e
-- 
2.53.0

