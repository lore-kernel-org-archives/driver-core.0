Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 368DC3346BB;
	Thu,  5 Feb 2026 22:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770331681; cv=none; b=ZRh3dtCi4fK/Hk72dQK3mnm1e8Ucevuov1VaaKHglJJM6ZBiQUgYq1hCVc48KQwJH7M3mAcMet46/r5frAGrC7XW0RtTvtyYAxtRMY25y7jJYpvL/D3dIJb4aYcwb2rgNN8+/njEfkYfsaCjdgkCIEI2gCsTAg5KIVuHl01ZnRo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770331681; c=relaxed/simple;
	bh=FOdadmQ+S2mCHDnQCUMOZD6q7lK1m9onAeTEGMHVtfc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=onG5G52AQPs3k/SPbyN9oDBUq1Ys6trMBGEY1kkfdbTP7BMQilwRuos4jkofA6Wb9JqF0mFAkU6BLRuS8WrQrVE7egVfycObfSFk77oNGC2K+HD7vU1+hNsKX1Ix1dAdH+mVlC8Z/gPXsXTZ6Y0YJSzvTvUyZBJ1UGoI+IoIsoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iVhj8NSe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iVhj8NSe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1F31C19424;
	Thu,  5 Feb 2026 22:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770331680;
	bh=FOdadmQ+S2mCHDnQCUMOZD6q7lK1m9onAeTEGMHVtfc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=iVhj8NSep1JP8gOgjqk0JCzU/qMgsZlRwmjk+i1m3ClEgvmxzy2KN37Eb3EIJRFql
	 4Oo4/y78DGuzagh1z4Sb9DQ9qFDV8andDbDOEZjfpT4tr/c+Is9ze4VZAH4HNGihZj
	 RANLb/SKW6ycrnk0KOnWl8i96dR+CGtEWO+lBHTThjgu9vm9T8iXJV1OUZ1cXtRr+K
	 nyA13aGV4IUphQKZb2xg/nQvrUfRHd69p4ptPZOtK+NkLL/T09f4OF/Yk2QpMqplfh
	 Z4/avTRi+1Xp/tZwJEVU+/jD4ANPgKffrbK8YsA4C1acfJaR/kJPepxLhoKoUURaec
	 SxXHFgTkinmQA==
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
Subject: [PATCH 3/5] devres: add devres_node_remove()
Date: Thu,  5 Feb 2026 23:31:26 +0100
Message-ID: <20260205224706.91996-5-dakr@kernel.org>
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

When the Rust Devres<T> container type is dropped we need a way to
remove the embedded struct devres_node from the device's node list.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   |  1 +
 drivers/base/devres.c | 17 +++++++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/drivers/base/base.h b/drivers/base/base.h
index 0ad52a847bd0..93b2020baa99 100644
--- a/drivers/base/base.h
+++ b/drivers/base/base.h
@@ -237,6 +237,7 @@ struct devres_node {
 void devres_node_init(struct devres_node *node, dr_node_release_t release,
 		      dr_node_free_t free_node);
 void devres_node_add(struct device *dev, struct devres_node *node);
+bool devres_node_remove(struct device *dev, struct devres_node *node);
 void devres_for_each_res(struct device *dev, dr_release_t release,
 			 dr_match_t match, void *match_data,
 			 void (*fn)(struct device *, void *, void *),
diff --git a/drivers/base/devres.c b/drivers/base/devres.c
index 51d079acc9b3..54a41ae599d0 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -363,6 +363,23 @@ void *devres_get(struct device *dev, void *new_res,
 }
 EXPORT_SYMBOL_GPL(devres_get);
 
+bool devres_node_remove(struct device *dev, struct devres_node *node)
+{
+	struct devres_node *__node;
+
+	guard(spinlock_irqsave)(&dev->devres_lock);
+	list_for_each_entry_reverse(__node, &dev->devres_head, entry) {
+		if (__node == node) {
+			list_del_init(&node->entry);
+			devres_log(dev, node, "REM");
+			return true;
+		}
+	}
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(devres_node_remove);
+
 /**
  * devres_remove - Find a device resource and remove it
  * @dev: Device to find resource from
-- 
2.52.0

