Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E1E135E544;
	Mon,  2 Feb 2026 23:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770076342; cv=none; b=COyemMUp+QTBoM9l+AbfRGv1M8GWAB4UNzFY/cBqz6UA7FJZiTKMKZsM60Nq1Gq7P1jkVV123nGmnVjrwDTm2FQGdMd5SprAlceVJkA79hfk2qPanzLzrfkPONPlyOk530XzVpvk0oU+wWReKTDgVc2WhJeSpRDOYAhvJRWwQG0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770076342; c=relaxed/simple;
	bh=Zroqx19oGilSOfy0Rfx0XWndKpg13OWJLH5xFPWTfiY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cJXTFtiOKQgIUAd3lJAj7NJpcizgOjhlO3JzF646idSV7t6advqcIZvnJVZ6JLgcg6kj8btrYMwoMR72GeryuJQeUb05jEN8PvHEN0jF+CnqUuWmhxarhUdunS8DjBKGNpsYtRw1i7EfzFK1JxS+xMVM1Ew7a79DVoUjXdHW5sY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYVl9d8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYVl9d8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DBBF8C116C6;
	Mon,  2 Feb 2026 23:52:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770076342;
	bh=Zroqx19oGilSOfy0Rfx0XWndKpg13OWJLH5xFPWTfiY=;
	h=From:To:Cc:Subject:Date:From;
	b=qYVl9d8kxcl5Rr0qmGi0aKFBIDWXGTVsmWa0+slKTCCCMoc9ktg0uPxdL8lUyDbOl
	 OYHPrj1oUaVvVB9Av36Twmw2xpXzsvietAmqxRDy7j4EUtjrtaV8bihTFhj1ohdeia
	 h1X8/1cVw6KonmXJ4AIFhHc0yAmHI3nFn+gd6RFptHqYoG0rBToEEK+3hdB6ISNg0i
	 3WloS7xpq7z/mE1IvMidiNhQrBM7zLPU/wLccu+aoRlsFtVB/tw6ON+UklNkX4ac5y
	 i91g/Iom9h/8BHcAU0SkrneirxUTzTswlJ1cs2FYj668WOf7yBLcZIKLKtcZfB4y8U
	 hPIyoPKW0yplQ==
From: Danilo Krummrich <dakr@kernel.org>
To: gregkh@linuxfoundation.org,
	rafael@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 0/7] Miscellaneous devres improvements
Date: Tue,  3 Feb 2026 00:48:13 +0100
Message-ID: <20260202235210.55176-1-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This patch series provides some miscellaneous devres improvements.

The most notable change is a more clear separation between the base struct
devres_node and its "subclasses" (such as struct devres and struct devres_group)
as well as the mixup between struct devres and struct devres_group.

This serves three purposes.

  (1) Better maintainability due to clear type separation.

  (2) No waste of memory due to unnecessary minimal alignment for devres
      actions, by introducing its own struct devres_action "subclass".

  (3) Bootstrapping for Rust devres code to embed a struct devres_node itself
      to avoid both the unnecessary minimum alignment of struct devres and the
      indirection through devres action avoiding unnecessary additional memory
      allocations. [1]

However, (3) is just for completeness, the series also stands on its own.

[1] https://git.kernel.org/pub/scm/linux/kernel/git/dakr/linux.git/commit/?h=devres/devres_node&id=6da8ca499fa65992d71c5cb7a51df7260666e695

Danilo Krummrich (7):
  devres: fix missing node debug info in devm_krealloc()
  devres: add devres_node_add()
  devres: add devres_node_init()
  devres: don't require ARCH_DMA_MINALIGN for devres actions
  devres: add free_node callback to struct devres_node
  devres: use guard(spinlock_irqsave) where applicable
  devres: remove unnecessary unlocks in devres_release_group()

 drivers/base/devres.c | 248 ++++++++++++++++++++++++++++--------------
 1 file changed, 165 insertions(+), 83 deletions(-)


base-commit: 289b14592cefe95f7d0ef334873c12b96ce3824f
-- 
2.52.0

