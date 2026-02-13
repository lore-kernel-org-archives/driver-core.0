Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A140F303A01;
	Fri, 13 Feb 2026 22:07:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020451; cv=none; b=cthpiQJyqTs5lr/NI83o1aM3LeqpD3Jaywk75QKfrPtm6LTrwGl+z4QkBE6WT/MkQ7QadhBE/981FVgS+nEOVR5WBXKgLn7rEQVHpY7hma6rrhVcasxZSIrM8smB+uhxZv9fneiXSuc83pyYNA8kHLgTybVoVFQ1o/HuadYgBWU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020451; c=relaxed/simple;
	bh=xo5sU91OR5Gc6dMD4w7aMlpbSlKYhosLwmq+Cy4FxcQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=YSdU+BwmPw5mNFT0xbT2LiH6o1sj9WyzCayeI5j2wzUWkjsCnFKvLQ6h2jyWnTK/Y9sfKET5LAaihuhFYrp6S2GF2jA115+bZMUDurXvOZhmDcL3aAtKmbvDreNieKJCuJ9BbSRuG1qDkajrZ8qZ4xk69rzzlSsXMz/4vXcVLb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ES6XRR1t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ES6XRR1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B7DBC116C6;
	Fri, 13 Feb 2026 22:07:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771020451;
	bh=xo5sU91OR5Gc6dMD4w7aMlpbSlKYhosLwmq+Cy4FxcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=ES6XRR1t0xXSYBRiD409gyYQQIXugz4WMdOX3jAU3OJ/30/iI3G7fyo9DRByEitv8
	 8H53x4jQ2jA7OzUy5a8E4mopV1rUdlg4w+DiFGzVAGVI/W2WAECc27leS/wAmhLwt8
	 edY21bX06rMjUDDSiqPlx//IclMZoqAT1fqj1ZjNPcvIOXHoq6p2yX59b6gN1N2rVL
	 oxS2pw7pK5g2XSuS4auvOVw182EXpb6lciWmkmAsUHN2QffyBi7V5nKYyndU6gZFi8
	 I0vyMli5h+g5f+9xVxmJDoEhs1sHFb7Tqa7+6ew5+y1gNV3aJlijKwbjyr4dbdlzWd
	 fC8ticAkuAh9A==
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
Subject: [PATCH v2 2/5] devres: export devres_node_init() and devres_node_add()
Date: Fri, 13 Feb 2026 23:07:12 +0100
Message-ID: <20260213220718.82835-3-dakr@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260213220718.82835-1-dakr@kernel.org>
References: <20260213220718.82835-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Export devres_node_init() and devres_node_add() through base.h, such
that we can access is from the Rust devres code.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   | 3 +++
 drivers/base/devres.c | 8 ++++----
 2 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 5e0e7eefa405..0ad52a847bd0 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -234,6 +234,9 @@ struct devres_node {
 	size_t				size;
 };
 
+void devres_node_init(struct devres_node *node, dr_node_release_t release,
+		      dr_node_free_t free_node);
+void devres_node_add(struct device *dev, struct devres_node *node);
 void devres_for_each_res(struct device *dev, dr_release_t release,
 			 dr_match_t match, void *match_data,
 			 void (*fn)(struct device *, void *, void *),
diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 7c9ef6fc6827..aa39e87082a1 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -36,9 +36,9 @@ struct devres_group {
 	/* -- 8 pointers */
 };
 
-static void devres_node_init(struct devres_node *node,
-			     dr_node_release_t release,
-			     dr_node_free_t free_node)
+void devres_node_init(struct devres_node *node,
+		      dr_node_release_t release,
+		      dr_node_free_t free_node)
 {
 	INIT_LIST_HEAD(&node->entry);
 	node->release = release;
@@ -256,7 +256,7 @@ void devres_free(void *res)
 }
 EXPORT_SYMBOL_GPL(devres_free);
 
-static void devres_node_add(struct device *dev, struct devres_node *node)
+void devres_node_add(struct device *dev, struct devres_node *node)
 {
 	guard(spinlock_irqsave)(&dev->devres_lock);
 
-- 
2.53.0

