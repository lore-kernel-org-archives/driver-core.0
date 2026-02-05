Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770263358D1;
	Thu,  5 Feb 2026 22:47:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331674; cv=none; b=qHVmchcL9D7//WmxQSoydX8C2q5ogd6J3xniitMwWBp/HCRe/6FdQofec8B66e3917YJKhlCg1BgcrZsQwhWIwhkaHGQsQdHTVN8vVyU64A2h26jkex9uJcCdljLaqAafT5IUtUt8FSNrrBPHh7C9u6/Ix1axMndMrNXJHbbA7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331674; c=relaxed/simple;
	bh=pK/Qga/Jpf4ObpwFtGxESpW9MDWF5KFbPEvWA/njgrI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=LVUieqta6akd9jdr1Z2iyCLEaSbAZhIvuD96fGHC6LH2LhI+GImo8WgIhFTx2WBbXSNJza/bN7WeDQ5NLLPF9IxZ4GIau0vHyK9mLB0Kxm/mrKPFKaKUHIo2Qa5K/Sh6cM1ecU8OAu68dQ59qjWriB1VK4iMU2tb1YThYGhtkc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kCn36Ku3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kCn36Ku3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 386E1C19424;
	Thu,  5 Feb 2026 22:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331674;
	bh=pK/Qga/Jpf4ObpwFtGxESpW9MDWF5KFbPEvWA/njgrI=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kCn36Ku3sKLwVuTjFr3JaEBF2WhCWV6v/givcfqUugPL5qxT+FMdBzeiq1AT3Nsud
	 D7nU6tBWCM3vPcFWVQgxCSI4iKsU/CQ3oHFfiUBhIm7GG2ccVpMQ7dafvuUo5ReipA
	 vmf4WVatNJsqx+9D+c+ovgFqX9tRBJJAePJOG6ONNo7Ts/S6rkHdsXj6cOtZ2UK1W+
	 w8nbYaR3f4qnURVwOlM4kpIM8D0qZ3+NrlJkqcaylGos0KRG/tfUR3MR3NlA8f5E/k
	 xavq7uCRld+fqctqt1pqTZbdvDixo2YbBfB+B+kRIwKX50hsPnC5ElBSCvNPa+LdQl
	 3nmcGlbkWTZxQ==
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
Subject: [PATCH 1/5] devres: move struct devres_node into base.h
Date: Thu,  5 Feb 2026 23:31:24 +0100
Message-ID: <20260205224706.91996-3-dakr@kernel.org>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260205224706.91996-2-dakr@kernel.org>
References: <20260205224706.91996-2-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move struct devres_node into base.h, such that we can access it from the
Rust devres code.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   | 12 ++++++++++++
 drivers/base/devres.c | 12 ------------
 2 files changed, 12 insertions(+), 12 deletions(-)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 8c2175820da9..5e0e7eefa405 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -222,6 +222,18 @@ static inline void device_set_driver(struct device *dev, const struct device_dri
 	WRITE_ONCE(dev->driver, (struct device_driver *)drv);
 }
 
+struct devres_node;
+typedef void (*dr_node_release_t)(struct device *dev, struct devres_node *node);
+typedef void (*dr_node_free_t)(struct devres_node *node);
+
+struct devres_node {
+	struct list_head		entry;
+	dr_node_release_t		release;
+	dr_node_free_t			free_node;
+	const char			*name;
+	size_t				size;
+};
+
 void devres_for_each_res(struct device *dev, dr_release_t release,
 			 dr_match_t match, void *match_data,
 			 void (*fn)(struct device *, void *, void *),
diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 0fca73b56168..7c9ef6fc6827 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -16,18 +16,6 @@
 #include "base.h"
 #include "trace.h"
 
-struct devres_node;
-typedef void (*dr_node_release_t)(struct device *dev, struct devres_node *node);
-typedef void (*dr_node_free_t)(struct devres_node *node);
-
-struct devres_node {
-	struct list_head		entry;
-	dr_node_release_t		release;
-	dr_node_free_t			free_node;
-	const char			*name;
-	size_t				size;
-};
-
 struct devres {
 	struct devres_node		node;
 	dr_release_t			release;
-- 
2.52.0

