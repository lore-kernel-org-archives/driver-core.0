Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936643FA5D9
	for <driver-core@lists.linux.dev>; Thu, 18 Jun 2026 15:21:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781796104; cv=none; b=b0Mf/M4o7A8qkbARzwq+V4f64HBvbj0mOCY/dBDx1B6MeZz0cpqtOkrH4p0J/PAkyVVcDsPAfIKLz5af6CSArL05aM/DiO32fC0GzTG19MANk/dA3IyN/pnnV5q7KmPlPaqZEuWSHhMED5ea6exY+KL0ArI5uyrzpewARVJGxtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781796104; c=relaxed/simple;
	bh=t45MIEkRQOfK4hGcKkVdoLowN/bGQEo8SwrJII5tK28=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=cy/S1PqYirnnH3tjlOiIZsVVCjXLhYq/6ZJep7e/c9bgH776WMHQSmVZyKxoSm0wYoQ0d+xaCeearedIKmB/eO8RnPTKGzIL6JHMnm3bQnH5PJd1hhcnTRge/mJfF/z032X50jl3jCNnZ/VFo5dbw5Yu9heigVWqC2ThnlHK9b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [94.134.109.237])
	(Authenticated sender: albeu@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 0C9F3780502;
	Thu, 18 Jun 2026 17:21:14 +0200 (CEST)
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
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v2 1/2] of: property: Fix of_fwnode_get_reference_args() with negative index
Date: Thu, 18 Jun 2026 17:20:34 +0200
Message-Id: <20260618152035.1600436-1-alban.bedel@lht.dlh.de>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

fwnode_property_get_reference_args() should return -ENOENT when an out
of bound index is passed. An issue arised with the OF backend because
the OF API use signed indexes while the fwnode API use unsigned ones.
When an index value greater the INT_MAX was passed to the OF backend
it got casted to a negative value and it returned -EINVAL instead of
-ENOENT. This patch add a check to of_fwnode_get_reference_args() to
catch negative index before they are passed to the OF API and return
-ENOENT right away.

This issue appeared when the following pattern was used in the LED
subsystem:

    index = fwnode_property_match_string(fwnode, "led-names", name)
    led_node = fwnode_find_reference(fwnode, "leds", index);

Unlike the same pattern with the OF API, this pattern implicitly cast
the signed return value of fwnode_property_match_string() to an
unsigned index leading to the above issue with the OF backend. It can
be argued that the return value of fwnode_property_match_string()
should be checked separately, but I think there is value in supporting
such simple and straight to the point patterns.

Link: https://lore.kernel.org/linux-leds/aimVRwJPhlGxsIUj@tom-desktop/T/#mc43cbf7e0599991b56dd0d9680714d28d145fbc8
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
v2: Fixed comment block to follow linux coding style.
---
 drivers/of/property.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746f..a4e9ffe1a4121 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1157,6 +1157,14 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	unsigned int i;
 	int ret;
 
+	/*
+	 * This function should return -ENOENT for out of bound indexes,
+	 * but the OF API uses signed indexes and consider negative indexes
+	 * as invalid. Catch them here to correctly implement the fwnode API.
+	 */
+	if ((int)index < 0)
+		return -ENOENT;
+
 	if (nargs_prop)
 		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
 						 nargs_prop, index, &of_args);
-- 
2.39.5

