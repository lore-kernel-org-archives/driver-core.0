Received: from pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.12.53.23])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43F623C3789
	for <driver-core@lists.linux.dev>; Fri, 11 Sep 2026 17:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.12.53.23
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789148668; cv=none; b=dxAUVt9LwKYpm7i7I87k76KyX6a5pH6QjCu1crH9iUNaLBiMbqwvQPiVmctHo0V2tMthVxiMACsg1xicCyRdt7tdZqtmAzRV++jcpCyy6khMogIJzizVopjcxDtahG/p7H6UGZtHgen7mqJ/B2ej9kfIO23sWZWc08+2JY+WxUw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789148668; c=relaxed/simple;
	bh=8r4gc3xKoWIXaeHEbv2OHiJwyaQA1NKjsYvm9JZrpKM=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=Nl+dG/qNtl8mNZ7jDaDs2w5cp02ZIPrvmqrZUYLvar5vh/ADSAB4g4Nd2FntHDOo/WirEH/YcqMTI8DmPiaJgbkGZ3dN94v3+ELPAvlXSFieKVmFWQR6YszXW7oX2I+IsOHypIaoCbEahhT4/r9TEyc5qSXwGx6bRTBVcfFZW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b=pRh4/frZ; arc=none smtp.client-ip=52.12.53.23
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.de header.i=@amazon.de header.b="pRh4/frZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.de; i=@amazon.de; q=dns/txt; s=amazoncorp2;
  t=1789148662; x=1820684662;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=6iOtJLCOMaVu1u7N9u6FCZ3yXZzuE0TLkNT/UH0NMLg=;
  b=pRh4/frZ4MWTZvSlagOaDRQpIBrx+sLA0V5Bsc8sdTdW/mlOpVIDDNAU
   8RtgYAttc383S3Wwaj+K+uAFQbhuq2PQ8GeMQ/57dIU5vsoY5gwUbt0hZ
   03hm+CI8grRoinSThAso2DgpoWonAh5vO05s0NOn+9IyMfHHs99OXfuqG
   B83QhaN4YYNP1TS+nT1Zz9I+iMaLGX4GuStN7ClEEqP4ZS9ApkUzqRsyX
   t5fVxMjTC1+iJBCIi1aQAYRjyJYF4P8jykPb4PNaBOCgM23Cg1p+cAqzG
   FXFRyC8KIDexOkOv7tE6+nHlJBbFkrho6IG6+RnWW7HZEwE40pjKpXzvA
   A==;
X-CSE-ConnectionGUID: d9ta3Z/UTFish95eKkRVXA==
X-CSE-MsgGUID: 38T1FJ6wQVmiXLKH9NcH2w==
X-IronPort-AV: E=Sophos;i="6.27,97,1787011200"; 
   d="scan'208";a="28317879"
Received: from ip-10-5-0-115.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.0.115])
  by internal-pdx-out-010.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2026 17:44:18 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:6341]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.6.93:2525] with esmtp (Farcaster)
 id 9b6f30e1-fa4b-42b7-8f8b-344e3e7b0c22; Fri, 11 Sep 2026 17:44:18 +0000 (UTC)
X-Farcaster-Flow-ID: 9b6f30e1-fa4b-42b7-8f8b-344e3e7b0c22
Received: from EX19D001UWA001.ant.amazon.com (10.13.138.214) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.45;
 Fri, 11 Sep 2026 17:44:18 +0000
Received: from dev-dsk-sakacpav-1a-480d1124.eu-west-1.amazon.com
 (172.19.96.155) by EX19D001UWA001.ant.amazon.com (10.13.138.214) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.46; Fri, 11 Sep 2026
 17:44:15 +0000
From: Pavol Sakac <sakacpav@amazon.de>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Tejun Heo
	<tj@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>, Danilo Krummrich
	<dakr@kernel.org>
CC: <driver-core@lists.linux.dev>, <linux-kernel@vger.kernel.org>, "Andy
 Shevchenko" <andriy.shevchenko@linux.intel.com>, Xu Yang <xu.yang_2@nxp.com>,
	Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>, Bjorn Helgaas
	<bhelgaas@google.com>, <linux-pci@vger.kernel.org>, Alex Williamson
	<alex@shazbot.org>, <kvm@vger.kernel.org>, <nh-open-source@amazon.com>
Subject: [RFC PATCH 1/8] kernfs: factor out reusable directory helpers
Date: Fri, 11 Sep 2026 19:43:33 +0200
Message-ID: <20260911174414.97060-1-sakacpav@amazon.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260911-vfopt-s5-v1-0-fa4cacdb6ca8@amazon.de>
References: <20260911-vfopt-s5-v1-0-fa4cacdb6ca8@amazon.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: EX19D037UWB002.ant.amazon.com (10.13.138.121) To
 EX19D001UWA001.ant.amazon.com (10.13.138.214)

An upcoming change adds staged directories whose children collections are
protected by a per-subtree mutex instead of kernfs_rwsem, so it needs the
pure rbtree and directory-creation operations without the rwsem assertions
and accounting wrapped around them.

Split those out: __kernfs_link_sibling() and __kernfs_find_ns() for the
children-rbtree work, __kernfs_create_dir() for the sequence both directory
creators repeat, and kernfs_update_parent_times() for the parent timestamp
bump open-coded at each link and unlink site. The existing names stay as
locked wrappers carrying the lockdep assertions, the link-side wrapper
gaining the write-side assertion it lacked. No functional change intended.

Assisted-by: LLM
Signed-off-by: Pavol Sakac <sakacpav@amazon.de>
---
 fs/kernfs/dir.c | 128 ++++++++++++++++++++++++++++++++----------------
 1 file changed, 87 insertions(+), 41 deletions(-)

diff --git a/fs/kernfs/dir.c b/fs/kernfs/dir.c
index 1938edd39eff..a6290f94139c 100644
--- a/fs/kernfs/dir.c
+++ b/fs/kernfs/dir.c
@@ -459,12 +459,24 @@ static int kernfs_sd_compare(const struct kernfs_node *left,
 	return kernfs_name_compare(left->hash, kernfs_rcu_name(left), left->ns, right);
 }
 
+/* Bump @parent's ctime/mtime; caller holds whichever lock covers @parent. */
+static void kernfs_update_parent_times(struct kernfs_node *parent)
+{
+	struct kernfs_iattrs *ps_iattr = parent ? parent->iattr : NULL;
+
+	if (ps_iattr) {
+		ktime_get_real_ts64(&ps_iattr->ia_ctime);
+		ps_iattr->ia_mtime = ps_iattr->ia_ctime;
+	}
+}
+
 /**
- *	kernfs_link_sibling - link kernfs_node into sibling rbtree
+ *	__kernfs_link_sibling - link kernfs_node into sibling rbtree
  *	@kn: kernfs_node of interest
  *
- *	Link @kn into its sibling rbtree which starts from
- *	@kn->parent->dir.children.
+ *	Link @kn into its parent's children rbtree.  This is the pure rbtree
+ *	insertion, without the subdir/revision accounting; the caller performs
+ *	that under whichever lock protects the parent's children collection.
  *
  *	Locking:
  *	kernfs_rwsem held exclusive
@@ -472,7 +484,7 @@ static int kernfs_sd_compare(const struct kernfs_node *left,
  *	Return:
  *	%0 on success, -EEXIST on failure.
  */
-static int kernfs_link_sibling(struct kernfs_node *kn)
+static int __kernfs_link_sibling(struct kernfs_node *kn)
 {
 	struct rb_node *parent = NULL;
 	struct kernfs_node *kn_parent;
@@ -500,7 +512,26 @@ static int kernfs_link_sibling(struct kernfs_node *kn)
 	rb_link_node(&kn->rb, parent, node);
 	rb_insert_color(&kn->rb, &kn_parent->dir.children);
 
+	return 0;
+}
+
+/*
+ * Locked variant of __kernfs_link_sibling(): kernfs_rwsem held exclusive; also
+ * performs the subdir count and directory-revision accounting.
+ */
+static int kernfs_link_sibling(struct kernfs_node *kn)
+{
+	struct kernfs_node *kn_parent;
+	int ret;
+
+	lockdep_assert_held_write(&kernfs_root(kn)->kernfs_rwsem);
+
+	ret = __kernfs_link_sibling(kn);
+	if (ret)
+		return ret;
+
 	/* successfully added, account subdir number */
+	kn_parent = kernfs_parent(kn);
 	down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 	if (kernfs_type(kn) == KERNFS_DIR)
 		kn_parent->dir.subdirs++;
@@ -934,7 +965,6 @@ struct kernfs_node *kernfs_find_and_get_node_by_id(struct kernfs_root *root,
 int kernfs_add_one(struct kernfs_node *kn)
 {
 	struct kernfs_root *root = kernfs_root(kn);
-	struct kernfs_iattrs *ps_iattr;
 	struct kernfs_node *parent;
 	bool has_ns;
 	int ret;
@@ -964,13 +994,7 @@ int kernfs_add_one(struct kernfs_node *kn)
 
 	/* Update timestamps on the parent */
 	down_write(&root->kernfs_iattr_rwsem);
-
-	ps_iattr = parent->iattr;
-	if (ps_iattr) {
-		ktime_get_real_ts64(&ps_iattr->ia_ctime);
-		ps_iattr->ia_mtime = ps_iattr->ia_ctime;
-	}
-
+	kernfs_update_parent_times(parent);
 	up_write(&root->kernfs_iattr_rwsem);
 
 	/*
@@ -990,25 +1014,24 @@ int kernfs_add_one(struct kernfs_node *kn)
 }
 
 /**
- * kernfs_find_ns - find kernfs_node with the given name
+ * __kernfs_find_ns - find kernfs_node with the given name
  * @parent: kernfs_node to search under
  * @name: name to look for
  * @ns: the namespace tag to use
  *
- * Look for kernfs_node with name @name under @parent.
+ * Caller must hold a lock covering @parent's children collection:
+ * kernfs_rwsem.
  *
  * Return: pointer to the found kernfs_node on success, %NULL on failure.
  */
-static struct kernfs_node *kernfs_find_ns(struct kernfs_node *parent,
-					  const unsigned char *name,
-					  const struct ns_common *ns)
+static struct kernfs_node *__kernfs_find_ns(struct kernfs_node *parent,
+					    const unsigned char *name,
+					    const struct ns_common *ns)
 {
 	struct rb_node *node = parent->dir.children.rb_node;
 	bool has_ns = kernfs_ns_enabled(parent);
 	unsigned int hash;
 
-	lockdep_assert_held(&kernfs_root(parent)->kernfs_rwsem);
-
 	if (has_ns != (bool)ns) {
 		WARN(1, KERN_WARNING "kernfs: ns %s in '%s' for '%s'\n",
 		     has_ns ? "required" : "invalid", kernfs_rcu_name(parent), name);
@@ -1032,6 +1055,18 @@ static struct kernfs_node *kernfs_find_ns(struct kernfs_node *parent,
 	return NULL;
 }
 
+/*
+ * The asserted kernfs_rwsem hold (write or read) also covers the RCU-managed
+ * name dereferences in __kernfs_find_ns()'s walk.
+ */
+static struct kernfs_node *kernfs_find_ns(struct kernfs_node *parent,
+					  const unsigned char *name,
+					  const struct ns_common *ns)
+{
+	lockdep_assert_held(&kernfs_root(parent)->kernfs_rwsem);
+	return __kernfs_find_ns(parent, name, ns);
+}
+
 static struct kernfs_node *kernfs_walk_ns(struct kernfs_node *parent,
 					  const unsigned char *path,
 					  const struct ns_common *ns)
@@ -1218,6 +1253,31 @@ struct kernfs_node *kernfs_root_to_node(struct kernfs_root *root)
 	return root->kn;
 }
 
+/*
+ * Allocate and initialize a directory node with @extra_flags OR'd into its
+ * type flags, without linking it anywhere.
+ */
+static struct kernfs_node *__kernfs_create_dir(struct kernfs_node *parent,
+					       const char *name, umode_t mode,
+					       kuid_t uid, kgid_t gid,
+					       void *priv,
+					       const struct ns_common *ns,
+					       unsigned int extra_flags)
+{
+	struct kernfs_node *kn;
+
+	kn = kernfs_new_node(parent, name, mode | S_IFDIR, uid, gid,
+			     KERNFS_DIR | extra_flags);
+	if (!kn)
+		return ERR_PTR(-ENOMEM);
+
+	kn->dir.root = parent->dir.root;
+	kn->ns = ns;
+	kn->priv = priv;
+
+	return kn;
+}
+
 /**
  * kernfs_create_dir_ns - create a directory
  * @parent: parent in which to create a new directory
@@ -1240,14 +1300,9 @@ struct kernfs_node *kernfs_create_dir_ns(struct kernfs_node *parent,
 	int rc;
 
 	/* allocate */
-	kn = kernfs_new_node(parent, name, mode | S_IFDIR,
-			     uid, gid, KERNFS_DIR);
-	if (!kn)
-		return ERR_PTR(-ENOMEM);
-
-	kn->dir.root = parent->dir.root;
-	kn->ns = ns;
-	kn->priv = priv;
+	kn = __kernfs_create_dir(parent, name, mode, uid, gid, priv, ns, 0);
+	if (IS_ERR(kn))
+		return kn;
 
 	/* link in */
 	rc = kernfs_add_one(kn);
@@ -1272,15 +1327,12 @@ struct kernfs_node *kernfs_create_empty_dir(struct kernfs_node *parent,
 	int rc;
 
 	/* allocate */
-	kn = kernfs_new_node(parent, name, S_IRUGO|S_IXUGO|S_IFDIR,
-			     GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, KERNFS_DIR);
-	if (!kn)
-		return ERR_PTR(-ENOMEM);
+	kn = __kernfs_create_dir(parent, name, 0555,
+				 GLOBAL_ROOT_UID, GLOBAL_ROOT_GID, NULL, NULL, 0);
+	if (IS_ERR(kn))
+		return kn;
 
 	kn->flags |= KERNFS_EMPTY_DIR;
-	kn->dir.root = parent->dir.root;
-	kn->ns = NULL;
-	kn->priv = NULL;
 
 	/* link in */
 	rc = kernfs_add_one(kn);
@@ -1706,18 +1758,12 @@ static void __kernfs_remove(struct kernfs_node *kn)
 		 * to decide who's responsible for cleanups.
 		 */
 		if (!parent || kernfs_unlink_sibling(pos)) {
-			struct kernfs_iattrs *ps_iattr =
-				parent ? parent->iattr : NULL;
-
 			down_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 
 			kernfs_clear_inode_nlink(pos);
 
 			/* update timestamps on the parent */
-			if (ps_iattr) {
-				ktime_get_real_ts64(&ps_iattr->ia_ctime);
-				ps_iattr->ia_mtime = ps_iattr->ia_ctime;
-			}
+			kernfs_update_parent_times(parent);
 
 			up_write(&kernfs_root(kn)->kernfs_iattr_rwsem);
 			kernfs_put(pos);
-- 
2.47.3

