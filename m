Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DB123FF1A1
	for <driver-core@lists.linux.dev>; Thu, 18 Jun 2026 15:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796112; cv=none; b=GtZD1JUJ9QurzBa2rXeMyITgqxWnXgu/gI7kXEpp96LMT6Vgt7n/TdjoWlc5YZmsPbtO56dmsOd1X7gLisGlst9W2TUizAQ724zUyVa27U7fKcvcpE0wWkkitfvtlpkm6K5HcMow3TBy+5SOe+jqxmy7WbP6PYf9q3FpyUIf6Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796112; c=relaxed/simple;
	bh=WVGHvfjDofZzATB4GUy0LRJazQGsFUTWfwfcE0BiNAs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ay/vKPk3uHDXDv/Nkff6mE9pcFzVzrWxZ6pWdT8dtXdZPXvI9OSmIYiy45JBVX/5Jxkr24ekUawyle0MEqWjfHKE6Kym8JJyPqYZdJ8+GJ57nwVjgHMj/Txeu6KNpyoqQ1V21WWbeFFQPdFvSxlfIRz5AMiXS/pNgowk4IwxSC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [94.134.109.237])
	(Authenticated sender: albeu@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 77929780368;
	Thu, 18 Jun 2026 17:21:32 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: driver-core@lists.linux.dev,
	devicetree@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Zijun Hu <zijun.hu@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	Alban Bedel <alban.bedel@lht.dlh.de>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH v2 2/2] software node: Fix software_node_get_reference_args() with index -1
Date: Thu, 18 Jun 2026 17:20:35 +0200
Message-Id: <20260618152035.1600436-2-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
References: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bounds check for the index passed to
software_node_get_reference_args() was failing when passed UINT_MAX,
this in turn would lead to an out of bound access in the property
array. Fix the bound check to also cover the UINT_MAX case.

Fixes: 31e4e12e0e960 ("software node: Correct a OOB check in software_node_get_reference_args()")
Reported-by: Sashiko <sashiko-bot@kernel.org>
Closes: https://lore.kernel.org/linux-devicetree/20260611103904.7CB131F00893@smtp.kernel.org/
Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
--
v2: No changes. Only submit this patch along with the patch that
    triggered the Sashiko report, to hopefully avoid another useless
    report.
---
 drivers/base/swnode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 869228a65cb36..2bc76f01eb77d 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -537,7 +537,7 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 	if (prop->is_inline)
 		return -EINVAL;
 
-	if ((index + 1) * sizeof(*ref) > prop->length)
+	if (index >= prop->length / sizeof(*ref))
 		return -ENOENT;
 
 	ref_array = prop->pointer;
-- 
2.39.5

