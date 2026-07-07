Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15869436BD0
	for <driver-core@lists.linux.dev>; Tue,  7 Jul 2026 16:56:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783443402; cv=none; b=mAq0An6QD4sJ+Y8eyjxZcrzGwjt6U2W88X2wCkzW2mma4+iDgI60akWEeL+0S+xxtuzhBJN9nHqdsZspQ4ez44+0MCH+NhG4CsKlCXssghk+P3zZOMOa7qxoihWuNlMlw4HgxUtzNf/PKby2InKUAEeATBpn8sykhw3rSKaRrl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783443402; c=relaxed/simple;
	bh=B+YL4zMNYtDivsUVoPGFNpknDTH5beSNCo+sUFChvro=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u21B3Z6gs9SExIU1EZiBuCmUzIIPDD4z/Y9UXZktq7rSL/jP0L1u1t/yGUejNBFvtq6/Ytk77N9gxhwLRmaz1NSAYN0ua5qfz/hg1Z5WA9gUKUjqccN5tAAukhWHO+POjdJUcY0kpzeOlc2liJhp05+Wmu4sp1Kv4DQp+5vDrjY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=OtqlwDW0; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="OtqlwDW0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1783443398;
	bh=B+YL4zMNYtDivsUVoPGFNpknDTH5beSNCo+sUFChvro=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=OtqlwDW0SNDo9V/9cfquAxRhun2POeA9XFtAOLRcCHmm4H34MzAJCjtUnXqzPNib5
	 z0r9oJdmTrgjYr+cKZ1lV7SNIM12ML4ttmSpYTvmONwntlzgf84/MPd/INZFc3LRQY
	 wI4bw81DI3pASOjIGP8wmab00Dr13BDvB0gg4CVM=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Tue, 07 Jul 2026 18:56:32 +0200
Subject: [PATCH v2 1/4] kobject: Provide macros to initialize 'struct
 kobj_attribute'
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260707-sysfs-const-attr-kobj-attr-prep-v2-1-35ae1bc0f9ef@weissschuh.net>
References: <20260707-sysfs-const-attr-kobj-attr-prep-v2-0-35ae1bc0f9ef@weissschuh.net>
In-Reply-To: <20260707-sysfs-const-attr-kobj-attr-prep-v2-0-35ae1bc0f9ef@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
 driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783443398; l=1648;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=B+YL4zMNYtDivsUVoPGFNpknDTH5beSNCo+sUFChvro=;
 b=1+wD3VMhIssao+0zFRD/MbpoQLh1smDnKCUezYxy/D5Fl4JAiqKXkEYzCv1e9jw6HEEAVagiM
 mWLJCOiPD2MBNN/GmzYHPp00Au6KIlHGw6RJ0Kv5hlrDlhHfEGa+dQK
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Currently the generic __ATTR*() macros are used to initialize kobject
attributes. These are not able to handle the upcoming piece-by-piece
constification of the attribute callback handlers.

Add dedicated macros of kobject attributes. For now these are the same
as the generic macros, but they will change soon. Users will be
converted to these macros as part of the constification, but it is
expected that they will be used generally in the future.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 include/linux/kobject.h | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/include/linux/kobject.h b/include/linux/kobject.h
index bcb5d4e32001..13bd0e87af7b 100644
--- a/include/linux/kobject.h
+++ b/include/linux/kobject.h
@@ -144,6 +144,28 @@ struct kobj_attribute {
 			 const char *buf, size_t count);
 };
 
+#define __KOBJ_ATTR(_name, _mode, _show, _store) {			\
+	.attr	= { .name = __stringify(_name),				\
+		    .mode = VERIFY_OCTAL_PERMISSIONS(_mode) },		\
+	.show	= _show,						\
+	.store	= _store,						\
+}
+
+#define __KOBJ_ATTR_RO_MODE(_name, _mode)				\
+	__KOBJ_ATTR(_name, _mode, _name##_show, NULL)
+
+#define __KOBJ_ATTR_RO(_name)						\
+	__KOBJ_ATTR_RO_MODE(_name, 0444)
+
+#define __KOBJ_ATTR_RW_MODE(_name, _mode)				\
+	__KOBJ_ATTR(_name, _mode, _name##_show, _name##_store)
+
+#define __KOBJ_ATTR_WO(_name)						\
+	__KOBJ_ATTR(_name, 0200, NULL, _name##_store)
+
+#define __KOBJ_ATTR_RW(_name)						\
+	__KOBJ_ATTR(_name, 0644, _name##_show, _name##_store)
+
 extern const struct sysfs_ops kobj_sysfs_ops;
 
 struct sock;

-- 
2.55.0

