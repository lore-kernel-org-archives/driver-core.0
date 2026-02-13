Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1426E303A35;
	Fri, 13 Feb 2026 22:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020455; cv=none; b=sJbwfCEPTYbJLjwplPx9X1fGJZvP7uFn4oMTvORGjyj87xGoIUcBQ65PHSTznGbM6846ANEm90C+rTUgxdvE2kOOHt+NTue2zMKKzVwmcXJp8C42nC5momSuP73ZDyvbYruiTp8Xq/O6KCznlrmKl46xM0HlhK6dXwdcTVgFnQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020455; c=relaxed/simple;
	bh=5AVHo1gEodXkShfE/oa7y1+OZxZ1jufYkYdoM9ADMZk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=rUB4GGzFCtgD0UkbbHjds1RUl+Qa3yzYOXHwvq3NpO3WB2lQVVxhicLvwrT2HxZEsKREeeoYAz9WHkCvFdKaYJ/R+dBdgStA57vKPQdcZT/lPC+sZFV6di5NPameu40VI2YgOepE7Gp4dWW5hz6jlVfxsshC0+U09VERE8FVQEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=fgPd/QN1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="fgPd/QN1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C854CC116C6;
	Fri, 13 Feb 2026 22:07:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771020454;
	bh=5AVHo1gEodXkShfE/oa7y1+OZxZ1jufYkYdoM9ADMZk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=fgPd/QN1ftJ9LkQEVnTob+R/c1jELS78v/kkHm8YcYDLabtN6nl3oFIm+8087Tula
	 cWH+xbswwnwNaTigY5RBH0W6PL3eaiHYBWoodurdS24QfpxInTiHNLZOkgVrwknkY4
	 1+HCG03WPRFuT0J81X9kYYu+CJVxj9l3CgojT3/Mys8ZQxQvwIwcpTdwUZpHqxaKAT
	 0cFcGdh9tQPKtpDPvegbv44VGOyMmTpJrqzd3Hfr7QQMIOYWQjmuBi5scksfGW/Pfx
	 gOor3LBfef2ExlUIbBHvKt3UM9kIYShG/+RnK6cu7gGad5CRwxjWmZprptfd2AjNZK
	 vSSJzkPMSzEDg==
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
Subject: [PATCH v2 3/5] devres: add devres_node_remove()
Date: Fri, 13 Feb 2026 23:07:13 +0100
Message-ID: <20260213220718.82835-4-dakr@kernel.org>
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

When the Rust Devres<T> container type is dropped we need a way to
remove the embedded struct devres_node from the device's node list.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
 drivers/base/base.h   |  1 +
 drivers/base/devres.c | 16 ++++++++++++++++
 2 files changed, 17 insertions(+)

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
index aa39e87082a1..bf51404e2bf4 100644
--- a/drivers/base/devres.c
+++ b/drivers/base/devres.c
@@ -361,6 +361,22 @@ void *devres_get(struct device *dev, void *new_res,
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
+
 /**
  * devres_remove - Find a device resource and remove it
  * @dev: Device to find resource from
-- 
2.53.0

