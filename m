Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E2E303A26;
	Fri, 13 Feb 2026 22:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771020448; cv=none; b=K1As7KaxtdyexSD2v9voJ3L6Rf6wKeIFWxy6HoxI1gEjoEOWhP+ATj5o/u8jaG2IaO5Fr1t5PJw+GOma+vwguIptsPJB2BLMHA2t7b+vBU9jaKzvV9fjysi/nf+CbWRyElfti2KNwz98eXvsHKdDhOyfjf6bIWwBjm/6Tht3CYA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771020448; c=relaxed/simple;
	bh=0IUKZwfn3BUVdcPrAgpyEOjKmwUF79BsZF/GvKQp4uQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=I1d2d3pUJ1It6rEXuFhNnlLpBMyG7rXAB03w6fUGCy4fL76xJNv0tq+gSbceDyQCJqWuJFWRFU8L1t2jcfTIqbyKDL3ci86AlC9sGtVIzuf6kO2gry8/LbCc2mlTiJmEIyM+tadrfXwXyhnw+GUPhbBQSXHy70jUXrjlEPSaESQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kC3J6zLu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kC3J6zLu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 151F9C19423;
	Fri, 13 Feb 2026 22:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771020448;
	bh=0IUKZwfn3BUVdcPrAgpyEOjKmwUF79BsZF/GvKQp4uQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=kC3J6zLuRTbhVxuUKfUZaXIbu4vsq9ctVz0stzza4y9bmMaOYKEvyFzTbY6BenWH8
	 V3UiBFJ4DS6awxTN0wYtPObWnnnx+/5j66hL7rHrej1dCAp7Ze0oVNwGs0yLT9kXNO
	 dC5tw+rqk1yPMmY0YPqJ7Ct0LWx8vu5qSH13tTfhhfYAgoVDRaSW0/f8CFN+/0vznF
	 Ap7RSut5xLoNGqZ55DJcRkAiU/UQHI3/iQZnbQfncuPR9CDk2dWwuQATONBj2iDBKF
	 X5laThfTnZM/Z0gXHN0aIJ2vBhU3c7TXjdi7NL9C2YYTzCBJrAfRrMmkCRMr+4ijvK
	 fZD3H6NVnsabw==
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
Subject: [PATCH v2 1/5] devres: move struct devres_node into base.h
Date: Fri, 13 Feb 2026 23:07:11 +0100
Message-ID: <20260213220718.82835-2-dakr@kernel.org>
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
2.53.0

