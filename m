Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 40D5836B90C;
	Thu, 20 Aug 2026 22:54:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787266480; cv=none; b=GeyluhTVbH7QVjlTLGzyFr1s+4chdNCIRmBdoUadTxym9LBbWHJegC7+mC1DeBnC/dO+D0X991a8Gm+sg6wmdZljfXf4dJLO2tF/6SrtUEKLSaMzdPY7bcHyzYrEh3ny6uvsRzNtAaqB0vLCMEFauZ9joiZSm3qlrEbLO6uDP2I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787266480; c=relaxed/simple;
	bh=1JaP2DEpAEBQFM0+q4bU+lbfR8OAglsR0+pnqTzmUIo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nt8VwlKGHg6di0+DWW76yBomyZaCU6SUyWPqsZfoM26cRlqUu3T7DjPIPJ7Kli8zCa8kUpl4fAbCQq+8ZkxZKmLH4OF6mVLpCqx+sIiZuhqQkghMyg4EDOHy4GlCj+Ggo7ClAmKf1Kv532vDbAv28Ec2hrcNTAT0mhiH6bEmuqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FFXC0O6j; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FFXC0O6j"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF7161F00A3A;
	Thu, 20 Aug 2026 22:54:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787266478;
	bh=UMa3P870NbVCLbfMk6yVLt11sH06XfayTjfC2UWHnm4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=FFXC0O6jkXGb1Lf0oeYfPyYO3m1p581sP106PuRbNrbuX+jmiSAoQ0wBmFGzNLC4c
	 SRVbBJvqFYjpjn4pGpqKH6NNO/vG/Gm+fF/Gj/qKufmzpYpO6MwATfFalmOxLpyGOg
	 fYfNOaBWWF1YovhzJPZoZ+54ZJcz0LrI+EMVdNpWk3gBLgbni2CJ3+ofOLYsZldSbn
	 37NVpKxU4cfAUBUL5TivuD55TaHxiWA+/bxh3cVDaOJvpnam7eKHlhjVkRsAK8hJNh
	 caaEgPmmGthGq2Yl6MznrQ8vHc13R0SANfhYYfdjvAgHQGF9dYKoVTWh5nnzp+ZNlk
	 CvJK4kORm+Thw==
From: Danilo Krummrich <dakr@kernel.org>
To: krzk@kernel.org
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>
Subject: [PATCH 2/3] w1: move slave uevent into w1_slave_device_type
Date: Fri, 21 Aug 2026 00:54:10 +0200
Message-ID: <20260820225430.1847356-2-dakr@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260820225430.1847356-1-dakr@kernel.org>
References: <20260820225430.1847356-1-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The bus-level w1_uevent() only ever added uevent variables (W1_FID,
W1_SLAVE_ID) for slave devices.

Move the slave uevent logic into w1_slave_device_type.uevent where it
naturally belongs and remove the bus-level uevent callback entirely.

Signed-off-by: Danilo Krummrich <dakr@kernel.org>
---
Compile-tested only, no hardware available.

I think the dev_dbg() stuff wasn't really  useful, so I dropped it.
---
 drivers/w1/w1.c | 37 +++++++++----------------------------
 1 file changed, 9 insertions(+), 28 deletions(-)

diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
index faa1c03f4807..b40f2d9fd29d 100644
--- a/drivers/w1/w1.c
+++ b/drivers/w1/w1.c
@@ -164,11 +164,14 @@ static const struct device_type w1_master_device_type = {
 	.name = "w1_master",
 };
 
+static int w1_slave_uevent(const struct device *dev,
+			   struct kobj_uevent_env *env);
+
 static const struct device_type w1_slave_device_type = {
 	.name = "w1_slave",
+	.uevent = w1_slave_uevent,
 };
 
-static int w1_uevent(const struct device *dev, struct kobj_uevent_env *env);
 static struct device_driver w1_slave_driver;
 
 static int w1_match(struct device *dev, const struct device_driver *drv)
@@ -183,7 +186,6 @@ static int w1_match(struct device *dev, const struct device_driver *drv)
 static const struct bus_type w1_bus_type = {
 	.name = "w1",
 	.match = w1_match,
-	.uevent = w1_uevent,
 };
 
 struct device_driver w1_master_driver = {
@@ -580,39 +582,18 @@ void w1_destroy_master_attributes(struct w1_master *master)
 	sysfs_remove_group(&master->dev.kobj, &w1_master_defattr_group);
 }
 
-static int w1_uevent(const struct device *dev, struct kobj_uevent_env *env)
+static int w1_slave_uevent(const struct device *dev,
+			   struct kobj_uevent_env *env)
 {
-	const struct w1_master *md = NULL;
-	const struct w1_slave *sl = NULL;
-	const char *event_owner, *name;
-	int err = 0;
-
-	if (dev->type == &w1_master_device_type) {
-		md = container_of(dev, struct w1_master, dev);
-		event_owner = "master";
-		name = md->name;
-	} else if (dev->type == &w1_slave_device_type) {
-		sl = container_of(dev, struct w1_slave, dev);
-		event_owner = "slave";
-		name = sl->name;
-	} else {
-		dev_dbg(dev, "Unknown event.\n");
-		return -EINVAL;
-	}
-
-	dev_dbg(dev, "Hotplug event for %s %s, bus_id=%s.\n",
-			event_owner, name, dev_name(dev));
-
-	if (dev->type != &w1_slave_device_type || !sl)
-		goto end;
+	const struct w1_slave *sl = container_of(dev, struct w1_slave, dev);
+	int err;
 
 	err = add_uevent_var(env, "W1_FID=%02X", sl->reg_num.family);
 	if (err)
-		goto end;
+		return err;
 
 	err = add_uevent_var(env, "W1_SLAVE_ID=%024LX",
 			     (unsigned long long)sl->reg_num.id);
-end:
 	return err;
 }
 
-- 
2.55.0

