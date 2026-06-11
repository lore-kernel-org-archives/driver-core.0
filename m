Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF48C3C417E
	for <driver-core@lists.linux.dev>; Thu, 11 Jun 2026 10:29:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781173761; cv=none; b=ErsNNC1d7CkQhNUgTFk2rkJx0qIjyNjrtjvJXL7KyH01BJtPco94GWG9AtrbYkz5Djfy4ThqdrJMFPUmh6qodmZk7QzDkh7Urb4thRsI0aJ1ZXCidFT7VLeHNrF/MGDmgL1fTt8UxbDnLMlAx8sxBrFOZfC0AZ48CWQmLcEncpY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781173761; c=relaxed/simple;
	bh=QEwbvu7mUl02rdZ2YotbMNLfRzLGoT0E99J+cPvPYOE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=a0wPt6DezABbVKW8F7pdm/rbkt80RuaoJY/wWPzoeaoO6lp6IKcLwaLrlG08pHinW6suUlR/EZ/4zkof/U25kEwv6RVBxrPfUY8Rvhny8wyFJSW7HAYGIWr+Sxb+elIOtQvNQOBrkumLrtJwoLL/P/gfU3ve+EU+hOMJ9Db/Ljc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de; spf=pass smtp.mailfrom=free.fr; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=quarantine dis=none) header.from=lht.dlh.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Received: from albans-vm.. (unknown [213.61.137.106])
	(Authenticated sender: albeu@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id A285B78035E;
	Thu, 11 Jun 2026 12:29:02 +0200 (CEST)
From: Alban Bedel <alban.bedel@lht.dlh.de>
To: devicetree@vger.kernel.org
Cc: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Alban Bedel <alban.bedel@lht.dlh.de>,
	Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>
Subject: [PATCH] of: property: Fix of_fwnode_get_reference_args() with negative index
Date: Thu, 11 Jun 2026 12:28:06 +0200
Message-Id: <20260611102806.2643869-1-alban.bedel@lht.dlh.de>
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
Signed-off-by: Alban Bedel <alban.bedel@lht.dlh.de>
---
 drivers/of/property.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/of/property.c b/drivers/of/property.c
index 136946f8b746f..eace2d1847b99 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1157,6 +1157,13 @@ of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 	unsigned int i;
 	int ret;
 
+	/* This function should return -ENOENT for out of bound indexes,
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

