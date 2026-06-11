Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA5736AB4D
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 20:35:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781210161; cv=none; b=ObLllSIum6yF30T8TcuwmHdEopysDpYV3vplSUxfDqnkDS5GQGwGz6eDABQFvlqZUYR6tsNwnzUVWF2VlRbpK5HVXQx4yAi2eGA1hTU//i+EFWzt+4ocUhGiSFNQCNOdm25IKnHc4ZGyWOEyIO0rZccMbM4YCZyxHmmtLMLOLas=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781210161; c=relaxed/simple;
	bh=3Q2YwluvYGccTj8xHDYb4/SxtTFNcPw+qEZ+0VjwhKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=oIuZDDgVrU7WyEwfhVuo97evHOqGe+7gzV9NkIoFRWclDufAD8rTrTv4tAJKkGHQ3xKkr4T0Qb0/NTtTtHqyMU3QV3oUNrWcOfwEqGGxGZ26BEw3X3A/vDCPy95ucxS8jG+7dfprgZVRueCYOjSP5KdHIgq4ILyw2j6/8PLoWsk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oo44fN6f; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oo44fN6f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781210150; x=1812746150;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=3Q2YwluvYGccTj8xHDYb4/SxtTFNcPw+qEZ+0VjwhKY=;
  b=Oo44fN6fZNXMrm1xEJx4MX+i+uvQ+j7oia3Xz8+E8PYjKzMrg9PsLDtj
   Lx77jqIuDATonj4XUrg9Tr5xCuxu4SSczhXhDEf/t8D6cao5vJE2Cx8wM
   FfMi1dt6yzLckl22XBRN3vWuV50LASUfSe9TlEaxXFn8zomruda82DmV6
   0cPeMKtInLA2TUMNJoR+5W+ZLqalHQbMYQ4PwSvrJgb9FfkmSJV8MY4EC
   84Iq07HjzI61ZS46prnMU9c8VKC9k6yBZiK9oSNf0B/hNfVVpCRN06FLQ
   3gD411bTWvis3TbYtepPHDcAXo7KO1SeLVMMV+Q8jeEpsrwP8KvRuiFT6
   w==;
X-CSE-ConnectionGUID: LdKp9bIqQRiWxCcqgYfKzQ==
X-CSE-MsgGUID: K10lCrSzQ66nyixMRMC0GA==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="99456620"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="99456620"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 13:35:46 -0700
X-CSE-ConnectionGUID: ocijLvAbRAahK0j1PpRIkA==
X-CSE-MsgGUID: msQIaXvFSYmGwQ2JDyOchg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="270631217"
Received: from black.igk.intel.com ([10.91.253.5])
  by fmviesa001.fm.intel.com with ESMTP; 11 Jun 2026 13:35:43 -0700
Received: by black.igk.intel.com (Postfix, from userid 1003)
	id C801698; Thu, 11 Jun 2026 22:35:42 +0200 (CEST)
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Xu Yang <xu.yang_2@nxp.com>,
	linux-acpi@vger.kernel.org,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org
Cc: Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v4 1/3] device property: fix infinite loop in fwnode_for_each_child_node()
Date: Thu, 11 Jun 2026 22:31:06 +0200
Message-ID: <20260611203537.1786399-2-andriy.shevchenko@linux.intel.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20260611203537.1786399-1-andriy.shevchenko@linux.intel.com>
References: <20260611203537.1786399-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Xu Yang <xu.yang_2@nxp.com>

When iterate over children of a fwnode that has a secondary fwnode,
fwnode_get_next_child_node() can enter an infinite loop if the secondary
fwnode has more than one child.

                       Parent        Child
      (Primary fwnode)   FWa:   {FWa1, FWa2, FWa3}
    (Secondary fwnode)   FWb:   {FWb1, FWb2}

In this case:

 ┌─> fwnode_get_next_child_node(FWa, FWa1)
 │    - fwnode_call_ptr_op(FWa, get_next_child_node, FWa1) returns FWa2
 │
 │   ...
 │
 │   fwnode_get_next_child_node(FWa, FWa3)
 │    - fwnode_call_ptr_op(FWa, get_next_child_node, FWa3) returns NULL
 │    - fwnode_call_ptr_op(FWb, get_next_child_node, FWa3) returns FWb1
 │
 │   fwnode_get_next_child_node(FWa, FWb1)
 │    - fwnode_call_ptr_op(FWa, get_next_child_node, FWb1) returns FWa1
 └────┘

This cause fwnode_for_each_child_node() to loop indefinitely, reapeatedly
output {FWa1, FWa2, FWa3, FWb1, FWa1, ...}.

The root cause is that when the current child (FWb1) belongs to the
secondary fwnode, calling get_next_child_node() on the parimary fwnode
incorrectly returns the first child (FWa1) again instead of NULL.

Fix this by dynamically checking the parent fwnode of the current child
before calling get_next_child_node(). This approach follows the pattern
established in commit b5b41ab6b0c1 ("device property: Check
fwnode->secondary in fwnode_graph_get_next_endpoint()").

Fixes: 2692c614f8f0 ("device property: Allow secondary lookup in fwnode_get_next_child_node()")
Cc: stable@vger.kernel.org
Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
Tested-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 drivers/base/property.c | 19 ++++++++++++++++---
 1 file changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 8e0148a37fff..f7b30d9c8716 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -807,18 +807,31 @@ struct fwnode_handle *
 fwnode_get_next_child_node(const struct fwnode_handle *fwnode,
 			   struct fwnode_handle *child)
 {
+	const struct fwnode_handle *parent;
+	struct fwnode_handle *child_parent __free(fwnode_handle) = NULL;
 	struct fwnode_handle *next;
 
-	if (IS_ERR_OR_NULL(fwnode))
+	/*
+	 * If this function is in a loop and the previous iteration returned
+	 * an child from fwnode->secondary, then we need to use the secondary
+	 * as parent rather than @fwnode.
+	 */
+	if (child) {
+		child_parent = fwnode_get_parent(child);
+		parent = child_parent;
+	} else {
+		parent = fwnode;
+	}
+	if (IS_ERR_OR_NULL(parent))
 		return NULL;
 
 	/* Try to find a child in primary fwnode */
-	next = fwnode_call_ptr_op(fwnode, get_next_child_node, child);
+	next = fwnode_call_ptr_op(parent, get_next_child_node, child);
 	if (next)
 		return next;
 
 	/* When no more children in primary, continue with secondary */
-	return fwnode_call_ptr_op(fwnode->secondary, get_next_child_node, child);
+	return fwnode_get_next_child_node(parent->secondary, NULL);
 }
 EXPORT_SYMBOL_GPL(fwnode_get_next_child_node);
 
-- 
2.50.1

