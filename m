Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794822186;
	b=V4mYk6Tuo8vOiVkkZv+xdC675/C1vi2PYGJicqQ2JD1VEcGR14YBWzdYmD9QP/QW32nS
	 +vf1+Tg1CVBTaBpUpNiqaojasuZp+l7o/gSOJdaecOCkyiwr0Zcw494un1s0BDk211YOg
	 S6iI0e/YIn7zzi/b/OT1tNwC+lyzcXokA+5ahOP7ek6K5SMNvXRos2uDifo4AG4K4Z44x
	 a5mlx8di3ghaLWlsFZlyT5bg4xMMHHJkSf6vDk0Ar7UrKDM+0RHYe9tUEU3GqRniA2COp
	 QPoqTCYK0YY1jxBxJIDnDFjSvJMweVOcJQBdnBvsSicWAI8QyQLd6mMNe3KnREhnRWA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794822186;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:
	 References:In-Reply-To:To:Cc:X-Mailer;
	bh=aQYuNsJG+unqWiBaoF2MWGnUGOMRtZW004M8c7FPvgY=;
	b=3xneVA1woB/FRSbSaIZtWhQpdlQg0wkFNq+v3hDKShmchv51rU0FFN3RUufM3X51q2Rn
	 80jlV+1sIp7cOMxpGuC4AcFEkf6AH7QNHuAkRBMnh2mE1RTizzzf63ojlzpWvs+lc68ne
	 fvw0wsxDt2r6caElxe3t9pSq0rLGb+DzZeFPokpxwESUjATOx+HBCweu1TBS914KVU/pO
	 7N8ZQx4ZUUA74Tn6fjBr0xSbj5V1wfMtI+/vprYZMmfDA6xkTO9GQP/XPNG/Ju50sYfj0
	 cLZYH98TAIJ4vddkfaqaqvbWcLZgsd5EKfr2bYtGZMebq8uMEx4Q4g6luQvgquk7EOA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXTOV8qw;
	arc=none smtp.remote-ip=209.85.210.170
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40105606A32A
	for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 09:43:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 40105606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iXTOV8qw
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-8b6b22be970so1062304b3a.1
        for <driver-core@lists.linux.dev>; Mon, 16 Nov 2026 01:43:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794822186; x=1795426986; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aQYuNsJG+unqWiBaoF2MWGnUGOMRtZW004M8c7FPvgY=;
        b=iXTOV8qwIp6k6AtEB1ITnaEGoybHIKjdyn1RcMYEpzq3kEP+3Inzk62E7vMG5+Z5rY
         W3ZxQigcIVgrL6jYM8dwggLJvYTLAJ0MnAvG3EgqJIiylOeaZFxY/hyWnEkVhbUv5J4k
         UlKTjCiXuMY8KNa9gE6BVilbjEdoCdZ6RhQZPAxWhVMFQgryprlhVQhNMybktzDKe3aN
         nXAg1hRuy/c3UZE1loyN/KQdp1MU7CoW93dO730dL5cbEJrKiPE5YC1CryCI1dtDO7Fx
         nFe7BubAAtRrA0ayJg4tc9kh9+LHoi6/XERx6nSrqz0F5jKxZsywdZp1yZNYWt6/5X9W
         f+jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794822186; x=1795426986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQYuNsJG+unqWiBaoF2MWGnUGOMRtZW004M8c7FPvgY=;
        b=l2OnYe43glBwVuJjm3ir/qdkvJ9jMeLHnrkHDMsJe5KGLvO3iVuy2nkuNd9nne0+tj
         HEGmp0g2qG2Jt4IMeyQAbn/aRVPXQBE6b91BLB1TKhqa7WwN8YjiUhjtjkxQKDOrXNJR
         D5ovFbeCBjfsjvNc+gZCkRtwJu0IntjXSsGea+7vrD9kW2xq/dHJIwZu2xCzv3f6ncOE
         OocWXYldbTBdT9WZqLQEX5okGUF97AcC6UOIGEoMuXTh0N8LHjDCBsy8nEAOkRlzDqvR
         czz8UZ7OJEnsgzMpDis1Q9VHbnGwbba8uNNpTYKvaV3Si5lsuLjM6yC4J2PECDbIC9vD
         W4Dg==
X-Gm-Message-State: APuU4Z+hmDgJHzgTTXoMTctM/BKtD1l2vrLAKqptrBtdl+57q6HAIl2q
	CpNDaBPDvXti/jn1olvSz9CC42IlymP80vp19xyDXMT27nZQuVkh9opa
X-Gm-Gg: AYBFou2odjGZzdcDRk4r4tQ2rTKhlpZpOKxY3pPmo8+hF32gZD3R0RfdfBo7mhLkJo9
	yrLvdpw/6TKM1YF/+jJZ7Yxu2jSMsWZnViWEZ3UrdbCCeJFsWNMRF9h0HyY2Ff+WPs8MXyfjge2
	ggQAROOtWAXC3B28jon0jPRhRp4ZA+K0gsG7AGWPJZJ5dmCBEPOUw2y6AnQgKs/DwWYYpm8nrDg
	rdmOLRCvGpALWPm5wZjChruWGgPL8z1GhmQbhNZBAIvD35NN/0nQVB20K6VvJQWckRWKMfzSX5J
	7h6JIKB8/S02S9m1QC54QEgNhOGaAkmHsT+eiorhPDH2l4F9evVBof9HIkiIX3Tez2ilwjx7w08
	q6o6jaZ+zVljhwKG7VMz0vlArhJOiq3oPcaOL9oBA7CJeKqUtq/r7jIIQWORBe7axYWSAVnHCIG
	KWw25K6Psskctc/UyPFvqkpI8aNZx4AtE7M/wFfyIIql0BkV5pznNStYkT+K3dkr/bGmKzzjpOi
	XTgx8/MeUrrXlvafny9DKmFl9YS+Q1db83l4S2dHo6sYBzanloINHXh9r9rBKIjPWsN+UFzPlc/
	1oYnEPELZOXzNKA9VM98pvFg29KR4VRTx7GicZ6nswzwRp74sALfbiB28VckbJ9ntsj0ZyMLTUk
	XPLPvyHz8h/JdehQIQg==
X-Received: by 2002:a05:6a00:189e:b0:89f:b166:bddf with SMTP id d2e1a72fcca58-8beb7c1fae7mr9373366b3a.58.1794822185494;
        Mon, 16 Nov 2026 01:43:05 -0800 (PST)
Received: from dtor-ws.sjc.corp.google.com ([2a00:79e0:2ebe:8:f133:af41:7614:f46c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8bed12a90fdsm3424231b3a.15.2026.11.16.01.43.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 01:43:04 -0800 (PST)
From: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Date: Mon, 16 Nov 2026 01:42:55 -0800
Subject: [PATCH 3/4] sysfs: support SYSFS_GROUP_INVISIBLE for unnamed
 attribute groups
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261116-sysfs-group-invisible-v1-3-94cd173a7d9a@gmail.com>
References: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
In-Reply-To: <20261116-sysfs-group-invisible-v1-0-94cd173a7d9a@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Johan Hovold <johan@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
 Fernando Fernandez Mancera <fmancera@suse.de>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailer: b4 0.17-dev-6b8b8

DEFINE_SYSFS_GROUP_VISIBLE() and DEFINE_SIMPLE_SYSFS_GROUP_VISIBLE()
evaluate the group visibility callback only for the first attribute and
return SYSFS_GROUP_INVISIBLE when the group should be hidden. While
named attribute groups check this flag before creating or updating the
group subdirectory, unnamed attribute groups skip that check and proceed
directly to file creation.

As a result, skipping the entry that returns SYSFS_GROUP_INVISIBLE
during file creation hides just the first attribute while still creating
all remaining regular and binary attributes, and updating an unnamed
group to be invisible leaves those attributes behind.

Resolve the target node first and check group visibility in
internal_create_group() for both named and unnamed groups, removing any
existing attributes (and the subdirectory for named groups) when
updating and returning early before creating directories or files. Drop
the now-redundant SYSFS_GROUP_INVISIBLE checks from create_files() so
that the invalid-permissions warning triggers if SYSFS_GROUP_INVISIBLE
is mistakenly returned for attributes after the first one, and update
the attribute group documentation accordingly.

Fixes: d87c295f599c ("sysfs: Introduce a mechanism to hide static attribute_groups")
Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
---
 fs/sysfs/group.c      | 66 +++++++++++++++++++++++++++++++--------------------
 include/linux/sysfs.h | 52 +++++++++++++++++++++++-----------------
 2 files changed, 70 insertions(+), 48 deletions(-)

diff --git a/fs/sysfs/group.c b/fs/sysfs/group.c
index 290e70034329..699c2f9e8926 100644
--- a/fs/sysfs/group.c
+++ b/fs/sysfs/group.c
@@ -69,7 +69,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 					mode = grp->is_visible(kobj, *attr, i);
 				else
 					mode = grp->is_visible_const(kobj, *attr, i);
-				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
+				if (!mode)
 					continue;
 			}
 
@@ -99,7 +99,7 @@ static int create_files(struct kernfs_node *parent, struct kobject *kobj,
 						(*bin_attr)->attr.name);
 			if (grp->is_bin_visible) {
 				mode = grp->is_bin_visible(kobj, *bin_attr, i);
-				if (!mode || mode == SYSFS_GROUP_INVISIBLE)
+				if (!mode)
 					continue;
 			}
 			if (grp->bin_size)
@@ -145,42 +145,56 @@ static int internal_create_group(struct kobject *kobj, int update,
 		return 0;
 	}
 
-	kobject_get_ownership(kobj, &uid, &gid);
 	if (grp->name) {
-		umode_t mode = __first_visible(grp, kobj);
-
-		if (mode == SYSFS_GROUP_INVISIBLE)
-			mode = 0;
-		else
-			mode = S_IRWXU | S_IRUGO | S_IXUGO;
-
 		if (update) {
 			kn = kernfs_find_and_get(kobj->sd, grp->name);
 			if (!kn) {
 				pr_debug("attr grp %s/%s not created yet\n",
 					 kobj->name, grp->name);
-				/* may have been invisible prior to this update */
+				/*
+				 * The group may have been invisible prior to
+				 * this update; treat it as a new creation if
+				 * it becomes visible (or a no-op if it stays
+				 * invisible).
+				 */
 				update = 0;
-			} else if (!mode) {
-				sysfs_remove_group(kobj, grp);
-				kernfs_put(kn);
-				return 0;
 			}
 		}
+	} else {
+		kn = kobj->sd;
+	}
 
-		if (!update) {
-			if (!mode)
-				return 0;
-			kn = kernfs_create_dir_ns(kobj->sd, grp->name, mode,
-						  uid, gid, kobj, NULL);
-			if (IS_ERR(kn)) {
-				if (PTR_ERR(kn) == -EEXIST)
-					sysfs_warn_dup(kobj->sd, grp->name);
-				return PTR_ERR(kn);
+	/*
+	 * If the group is hidden, remove any existing attributes (and the
+	 * subdirectory for a previously visible named group) when updating,
+	 * and return early.
+	 */
+	if (__first_visible(grp, kobj) == SYSFS_GROUP_INVISIBLE) {
+		if (update) {
+			remove_files(kn, grp);
+			if (grp->name) {
+				kernfs_remove(kn);
+				kernfs_put(kn);
 			}
 		}
-	} else {
-		kn = kobj->sd;
+		return 0;
+	}
+
+	kobject_get_ownership(kobj, &uid, &gid);
+
+	/*
+	 * Create the subdirectory on initial creation or when a previously
+	 * hidden named group becomes visible on update.
+	 */
+	if (grp->name && !update) {
+		kn = kernfs_create_dir_ns(kobj->sd, grp->name,
+					  S_IRWXU | S_IRUGO | S_IXUGO,
+					  uid, gid, kobj, NULL);
+		if (IS_ERR(kn)) {
+			if (PTR_ERR(kn) == -EEXIST)
+				sysfs_warn_dup(kobj->sd, grp->name);
+			return PTR_ERR(kn);
+		}
 	}
 
 	kernfs_get(kn);
diff --git a/include/linux/sysfs.h b/include/linux/sysfs.h
index b1a3a1e6ad09..bd9a1f910bfa 100644
--- a/include/linux/sysfs.h
+++ b/include/linux/sysfs.h
@@ -68,28 +68,33 @@ do {							\
  * struct attribute_group - data structure used to declare an attribute group.
  * @name:	Optional: Attribute group name
  *		If specified, the attribute group will be created in a
- *		new subdirectory with this name. Additionally when a
- *		group is named, @is_visible and @is_bin_visible may
- *		return SYSFS_GROUP_INVISIBLE to control visibility of
- *		the directory itself.
+ *		new subdirectory with this name.
  * @is_visible:	Optional: Function to return permissions associated with an
  *		attribute of the group. Will be called repeatedly for
  *		each non-binary attribute in the group. Only read/write
- *		permissions as well as SYSFS_PREALLOC are accepted. Must
- *		return 0 if an attribute is not visible. The returned
- *		value will replace static permissions defined in struct
- *		attribute. Use SYSFS_GROUP_VISIBLE() when assigning this
- *		callback to specify separate _group_visible() and
- *		_attr_visible() handlers.
+ *		permissions as well as SYSFS_PREALLOC are accepted,
+ *		except for the first attribute where
+ *		SYSFS_GROUP_INVISIBLE may be returned to hide the entire
+ *		group (both the subdirectory for named groups and all
+ *		attributes for unnamed groups). Must return 0 if an
+ *		attribute is not visible. The returned value will
+ *		replace static permissions defined in struct attribute.
+ *		Use SYSFS_GROUP_VISIBLE() when assigning this callback to
+ *		specify separate _group_visible() and _attr_visible()
+ *		handlers.
  * @is_bin_visible:
  *		Optional: Function to return permissions associated with a
  *		binary attribute of the group. Will be called repeatedly
  *		for each binary attribute in the group. Only read/write
- *		permissions as well as SYSFS_PREALLOC (and the
- *		visibility flags for named groups) are accepted. Must
- *		return 0 if a binary attribute is not visible. The
- *		returned value will replace static permissions defined
- *		in struct bin_attribute. If @is_visible is not set, Use
+ *		permissions as well as SYSFS_PREALLOC are accepted,
+ *		except for the first binary attribute (when the group has
+ *		no regular attributes or neither @is_visible nor
+ *		@is_visible_const is set), where SYSFS_GROUP_INVISIBLE
+ *		may be returned to hide the entire group. Must return 0
+ *		if a binary attribute is not visible. The returned value
+ *		will replace static permissions defined in struct
+ *		bin_attribute. When group visibility is not already
+ *		controlled by @is_visible/@is_visible_const, use
  *		SYSFS_GROUP_VISIBLE() when assigning this callback to
  *		specify separate _group_visible() and _attr_visible()
  *		handlers.
@@ -128,11 +133,13 @@ struct attribute_group {
 /*
  * DEFINE_SYSFS_GROUP_VISIBLE(name):
  *	A helper macro to pair with the assignment of ".is_visible =
- *	SYSFS_GROUP_VISIBLE(name)", that arranges for the directory
- *	associated with a named attribute_group to optionally be hidden.
- *	This allows for static declaration of attribute_groups, and the
+ *	SYSFS_GROUP_VISIBLE(name)", that arranges for an entire
+ *	attribute_group to optionally be hidden (both the directory for
+ *	named groups and all attributes for unnamed groups). This allows
+ *	for static declaration of attribute_groups, and the
  *	simplification of attribute visibility lifetime that implies,
- *	without polluting sysfs with empty attribute directories.
+ *	without polluting sysfs with empty attribute directories or
+ *	unwanted attributes.
  * Ex.
  *
  * static umode_t example_attr_visible(struct kobject *kobj,
@@ -208,9 +215,10 @@ struct attribute_group {
 
 /*
  * Same as DEFINE_SYSFS_GROUP_VISIBLE, but for groups with only binary
- * attributes. If an attribute_group defines both text and binary
- * attributes, the group visibility is determined by the function
- * specified to is_visible() not is_bin_visible()
+ * attributes (or without is_visible()/is_visible_const()). If an
+ * attribute_group defines both regular and binary attributes and sets
+ * is_visible() or is_visible_const(), group visibility is determined by
+ * that callback rather than is_bin_visible().
  */
 #define DEFINE_SYSFS_BIN_GROUP_VISIBLE(name)                                   \
 	static inline umode_t sysfs_group_visible_##name(                      \

-- 
2.56.0.679.gc527c65306-goog

