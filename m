Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0BF3303A0D;
	Thu, 20 Aug 2026 22:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787266478; cv=none; b=vDOCdkDhABWo4tKagA7s6qcIJj8/sZhZZpdf5gJfpTmTAvzqMY3+A02k9Gcjd8D+9sIeyl1/TJ/wVRooZi9e+n44DKXiC8EZyzOtMPJab+21QH8FoBPZ8y/hU9B/xIjxc+oIBNwQN/z3drISarnyZGElK2JIFGtxG/IHTogTeVI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787266478; c=relaxed/simple;
	bh=9+MHsuZBuhFjLPoegaTal0e6+tfSDEXkir38gjIAXSA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=QRjztZEDUVW1lFf662Dszn/AzmXPaifv7be/W/FqUGEIALPHI640vJKcysU8CHXjUJwW7DUnEbrFDUH8HPkTrqgUBzb5nve2slk08dNRIFCZB4btliW848xS6C1oDNu6F8ybXdcjae5lL1yuVqqYQwI8KEMHnfReJ6Lz0IQJUYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ieL1gjkh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ieL1gjkh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438AA1F000E9;
	Thu, 20 Aug 2026 22:54:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787266477;
	bh=8lC1I51w8t5S9/K8C61biVz8vw2mbhzdLExuupJ5UGA=;
	h=From:To:Cc:Subject:Date;
	b=ieL1gjkh3/FNzH2eOnU1dL39az86AIgkKUFA7gRmary2VpjuSZO0vzVd5crD5QZNO
	 eDJey46BhySg4HfHg6AHypYefcQr1ORFnHsNEqZOgkr29jPn/bBPXn+OB4f9uQitEW
	 tnsiXoQC0E5FnlryMgRcUgC51goob6HLeg4MyWHgTByVA3SDCzHFlsvWhmLh/UAlIB
	 3SH609yZmZxSe327CwQgWeUALFfkOIiJAwtWqjgyKUxKEk71hickRxLj3B5CaIbWwA
	 Yw0G0SwxTa6rwXI0rZBWxtBbImtV04scieJrZfcNie2rNnorxyRAKubEstvBeyD8R+
	 ynCkrV9brcC/A==
From: Danilo Krummrich <dakr@kernel.org>
To: krzk@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 1/3] w1: use match() callback instead of hardwiring dev->driver
Date: Fri, 21 Aug 2026 00:54:09 +0200
Message-ID: <20260820225430.1847356-1-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

w1 hardwires dev->driver before calling device_register(), relying on
the if (dev->driver) special case in __device_attach() to call
device_bind_driver() and skip normal matching. This is a legacy pattern
that should be replaced with proper match() logic.

Add device types for master and slave devices and implement a w1_match()
callback that routes each device type to its corresponding driver. This
lets the driver core bind w1 devices through the normal
__device_attach_driver() path.

Link: https://lore.kernel.org/driver-core/DKU2J83B6IX6.2CG1WOB66WC39@kernel.org/
Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Compile-tested only, no hardware available.
---
 drivers/w1/w1.c | 37 +++++++++++++++++++++++++------------
 1 file changed, 25 insertions(+), 12 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index 486f321eadc8..faa1c03f4807 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -58,11 +58,6 @@ MODULE_PARM_DESC(slave_ttl,
 DEFINE_MUTEX(w1_mlock);
 LIST_HEAD(w1_masters);
 
-static int w1_master_probe(struct device *dev)
-{
-	return -ENODEV;
-}
-
 static void w1_master_release(struct device *dev)
 {
 	struct w1_master *md = dev_to_w1_master(dev);
@@ -165,24 +160,42 @@ static struct w1_family w1_default_family = {
 	.fops = &w1_default_fops,
 };
 
+static const struct device_type w1_master_device_type = {
+	.name = "w1_master",
+};
+
+static const struct device_type w1_slave_device_type = {
+	.name = "w1_slave",
+};
+
 static int w1_uevent(const struct device *dev, struct kobj_uevent_env *env);
+static struct device_driver w1_slave_driver;
+
+static int w1_match(struct device *dev, const struct device_driver *drv)
+{
+	if (dev->type == &w1_master_device_type)
+		return drv == &w1_master_driver;
+	if (dev->type == &w1_slave_device_type)
+		return drv == &w1_slave_driver;
+	return 0;
+}
 
 static const struct bus_type w1_bus_type = {
 	.name = "w1",
+	.match = w1_match,
 	.uevent = w1_uevent,
 };
 
 struct device_driver w1_master_driver = {
 	.name = "w1_master_driver",
 	.bus = &w1_bus_type,
-	.probe = w1_master_probe,
 };
 
 struct device w1_master_device = {
 	.parent = NULL,
 	.bus = &w1_bus_type,
+	.type = &w1_master_device_type,
 	.init_name = "w1 bus master",
-	.driver = &w1_master_driver,
 	.release = &w1_master_release
 };
 
@@ -195,8 +208,8 @@ static struct device_driver w1_slave_driver = {
 struct device w1_slave_device = {
 	.parent = NULL,
 	.bus = &w1_bus_type,
+	.type = &w1_slave_device_type,
 	.init_name = "w1 bus slave",
-	.driver = &w1_slave_driver,
 	.release = &w1_slave_release
 };
 #endif  /*  0  */
@@ -574,11 +587,11 @@ static int w1_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	const char *event_owner, *name;
 	int err = 0;
 
-	if (dev->driver == &w1_master_driver) {
+	if (dev->type == &w1_master_device_type) {
 		md = container_of(dev, struct w1_master, dev);
 		event_owner = "master";
 		name = md->name;
-	} else if (dev->driver == &w1_slave_driver) {
+	} else if (dev->type == &w1_slave_device_type) {
 		sl = container_of(dev, struct w1_slave, dev);
 		event_owner = "slave";
 		name = sl->name;
@@ -590,7 +603,7 @@ static int w1_uevent(const struct device *dev, struct kobj_uevent_env *env)
 	dev_dbg(dev, "Hotplug event for %s %s, bus_id=%s.\n",
 			event_owner, name, dev_name(dev));
 
-	if (dev->driver != &w1_slave_driver || !sl)
+	if (dev->type != &w1_slave_device_type || !sl)
 		goto end;
 
 	err = add_uevent_var(env, "W1_FID=%02X", sl->reg_num.family);
@@ -666,8 +679,8 @@ static int __w1_attach_slave_device(struct w1_slave *sl)
 	int err;
 
 	sl->dev.parent = &sl->master->dev;
-	sl->dev.driver = &w1_slave_driver;
 	sl->dev.bus = &w1_bus_type;
+	sl->dev.type = &w1_slave_device_type;
 	sl->dev.release = &w1_slave_release;
 	sl->dev.groups = w1_slave_groups;
 	sl->dev.of_node = of_find_matching_node(sl->master->dev.of_node,

base-commit: 073e62fd33fe9cec754cb89e60c0ebbab781a50a
-- 
2.55.0

