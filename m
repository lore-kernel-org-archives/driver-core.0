Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E286933A718;
	Thu,  5 Feb 2026 22:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331678; cv=none; b=kQlp6E4dLxbwHAhVCV7smjfNl8SvhBtQTB9zwqfWTID/tHZGIGLmybFPHg/qglZxYx5DIlR2d3v6DQvuZspIAJ5KtrzAkzGXxO9aErX8OCiUOS5f9VLo1J837+sBvJmxwGBE7UD6VmVrmUlBqXs3DvcHxLCGvjt42+s5EWks5Ls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331678; c=relaxed/simple;
	bh=ICVLVypokoWC+bfJfZh1jhl3S5EXMKv+QsOC/Bsr+Es=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=IIObHlADSi0Jj0+nNPlEjWAwjlFTr9J9BqKMaNrYbd+QpXdbvri2HIvcWQUmpm4rAgiEvA8Zx17P8ijjaS/ZlxEwcVt4/KMslhFwQip331A+Y7W9B0vh4kgQYcaRzVdnkjd3vfy6AwYqrOiKHyCqX7ArLoc/krB+3y9IX+UCNbc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QQzJWFr0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QQzJWFr0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92578C19421;
	Thu,  5 Feb 2026 22:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331677;
	bh=ICVLVypokoWC+bfJfZh1jhl3S5EXMKv+QsOC/Bsr+Es=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=QQzJWFr0+ByxTxxRl80Ytte+ZgDWmcps1PysT8mE3v9B/fuukJfo/pYmPnEVHFQaz
	 eQ+Ej+bQQVHBXZkzyOmRgwK7ciuhdA543zoal7QEW4zj80sWXHX4Qw+nN7uUu8o+1+
	 LxpOZ1DdkuEhK4p4DosvTVkJ/jDXHj7B5APWjmPpveiaUE2G4XpxXxiUTAHf7yhk6A
	 AzUnORXzV16J6RFxiT8ZP3hlUkbPCITVRLGqFYn/2pfKPbrG/vWrKpchlTP1WFk37q
	 SgncMrsSjhgOS/3kyMRV+AQVQ3cMbLsgQFyflgbdOVHJfEwaei2tzUblt7gOkP+ybu
	 iSjg5DP6xO3dg==
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
Subject: [PATCH 2/5] devres: export devres_node_init() and devres_node_add()
Date: Thu,  5 Feb 2026 23:31:25 +0100
Message-ID: <20260205224706.91996-4-dakr@kernel.org>
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

Export devres_node_init() and devres_node_add() through base.h, such
that we can access is from the Rust devres code.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   |  3 +++
 drivers/base/devres.c | 10 ++++++----
 2 files changed, 9 insertions(+), 4 deletions(-)

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
index 7c9ef6fc6827..51d079acc9b3 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -36,14 +36,15 @@ struct devres_group {
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
 	node->free_node = free_node;
 }
+EXPORT_SYMBOL_GPL(devres_node_init);
 
 static inline void free_node(struct devres_node *node)
 {
@@ -256,12 +257,13 @@ void devres_free(void *res)
 }
 EXPORT_SYMBOL_GPL(devres_free);
 
-static void devres_node_add(struct device *dev, struct devres_node *node)
+void devres_node_add(struct device *dev, struct devres_node *node)
 {
 	guard(spinlock_irqsave)(&dev->devres_lock);
 
 	add_dr(dev, node);
 }
+EXPORT_SYMBOL_GPL(devres_node_add);
 
 /**
  * devres_add - Register device resource
-- 
2.52.0

