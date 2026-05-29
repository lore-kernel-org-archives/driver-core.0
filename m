Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 872B43EFFA7
	for <driver-core@lists.linux.dev>; Fri, 29 May 2026 16:43:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780073008; cv=none; b=g1wIF77nZfZZ8ghLW2BI7rBaXV+hEjVAbeAr/bjlW+dKUhOyCDg9oGbQgW4SqjbLk/llMTTDEDukk3kOABeklZd92TwP2SpQd2DivELCxT9hJp7/kIHDXPgQ4057t1Vdo+WuoI5nb6vaU7jsogv1ld652R/GIJE44WfArSaatWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780073008; c=relaxed/simple;
	bh=OdyDyu8p7T0rithrC0nFg9HevDkps7Fr1U3EVm4fg6U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JVTH5nCCyVcbvD/iFFLzC0y1Dz8aCiRt7krG9WTmEf/sJBJ6TusdF3VZIxaZE5jok4FyTJZOclKmmIFHM5B2NwT+LP62u8TKIPLuPJ5LBY9CNdUHvyMsPzg93mPWe8+Bla+rEDIwnWIYQaKJbBg5Gd4B/OPjZsuvugS8pq5VsCk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=gxLDWAth; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="gxLDWAth"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1780073004;
	bh=OdyDyu8p7T0rithrC0nFg9HevDkps7Fr1U3EVm4fg6U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=gxLDWAthp6raQlDCbuVUCHw8h2NS2WDGU4FPfm3C1vpXDmO32tmb8Dlkw/I0Eeab0
	 SgFdlN/lDGDiHA1/DWCG5NghI2zCv0GcInF1xy5dfYT1SRVfYPTgPrHATn/5YzBfas
	 Kdw/V21TYr/dqlxYdM/g5z+ygl9cH/musZaeEnxw=
From: =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Date: Fri, 29 May 2026 18:43:25 +0200
Subject: [PATCH 4/4] samples/kobject: Constify kobject attributes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260529-sysfs-const-attr-kobj-attr-prep-v1-4-7e667ba3bb85@weissschuh.net>
References: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
In-Reply-To: <20260529-sysfs-const-attr-kobj-attr-prep-v1-0-7e667ba3bb85@weissschuh.net>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 "Rafael J. Wysocki" <rafael@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
 Andrew Morton <akpm@linux-foundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780073003; l=3025;
 i=linux@weissschuh.net; s=20221212; h=from:subject:message-id;
 bh=OdyDyu8p7T0rithrC0nFg9HevDkps7Fr1U3EVm4fg6U=;
 b=bvv4AQI1JttYsaf53S5ld329jS89YUq3g8/D6bw2eR2agP/lT5AvhI9KJUAWXx35S6RN68g7T
 EIswVTu+Z4ADzEMIaxNlgAreHn2mgVMBIi57d+1USpzc1dSbTtcwD6u
X-Developer-Key: i=linux@weissschuh.net; a=ed25519;
 pk=KcycQgFPX2wGR5azS7RhpBqedglOZVgRPfdFSPB1LNw=

Demonstrate that 'const struct kobj_attribute' is now supported by the
kobject core.

Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
---
 samples/kobject/kobject-example.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/samples/kobject/kobject-example.c b/samples/kobject/kobject-example.c
index 7404f310dc45..36f3fbc47fe0 100644
--- a/samples/kobject/kobject-example.c
+++ b/samples/kobject/kobject-example.c
@@ -25,13 +25,13 @@ static int bar;
 /*
  * The "foo" file where a static variable is read from and written to.
  */
-static ssize_t foo_show(struct kobject *kobj, struct kobj_attribute *attr,
+static ssize_t foo_show(struct kobject *kobj, const struct kobj_attribute *attr,
 			char *buf)
 {
 	return sysfs_emit(buf, "%d\n", foo);
 }
 
-static ssize_t foo_store(struct kobject *kobj, struct kobj_attribute *attr,
+static ssize_t foo_store(struct kobject *kobj, const struct kobj_attribute *attr,
 			 const char *buf, size_t count)
 {
 	int ret;
@@ -44,14 +44,14 @@ static ssize_t foo_store(struct kobject *kobj, struct kobj_attribute *attr,
 }
 
 /* Sysfs attributes cannot be world-writable. */
-static struct kobj_attribute foo_attribute =
+static const struct kobj_attribute foo_attribute =
 	__KOBJ_ATTR(foo, 0664, foo_show, foo_store);
 
 /*
  * More complex function where we determine which variable is being accessed by
  * looking at the attribute for the "baz" and "bar" files.
  */
-static ssize_t b_show(struct kobject *kobj, struct kobj_attribute *attr,
+static ssize_t b_show(struct kobject *kobj, const struct kobj_attribute *attr,
 		      char *buf)
 {
 	int var;
@@ -63,7 +63,7 @@ static ssize_t b_show(struct kobject *kobj, struct kobj_attribute *attr,
 	return sysfs_emit(buf, "%d\n", var);
 }
 
-static ssize_t b_store(struct kobject *kobj, struct kobj_attribute *attr,
+static ssize_t b_store(struct kobject *kobj, const struct kobj_attribute *attr,
 		       const char *buf, size_t count)
 {
 	int var, ret;
@@ -79,9 +79,9 @@ static ssize_t b_store(struct kobject *kobj, struct kobj_attribute *attr,
 	return count;
 }
 
-static struct kobj_attribute baz_attribute =
+static const struct kobj_attribute baz_attribute =
 	__KOBJ_ATTR(baz, 0664, b_show, b_store);
-static struct kobj_attribute bar_attribute =
+static const struct kobj_attribute bar_attribute =
 	__KOBJ_ATTR(bar, 0664, b_show, b_store);
 
 
@@ -89,7 +89,7 @@ static struct kobj_attribute bar_attribute =
  * Create a group of attributes so that we can create and destroy them all
  * at once.
  */
-static struct attribute *attrs[] = {
+static const struct attribute *const attrs[] = {
 	&foo_attribute.attr,
 	&baz_attribute.attr,
 	&bar_attribute.attr,
@@ -103,7 +103,7 @@ static struct attribute *attrs[] = {
  * attribute group.
  */
 static const struct attribute_group attr_group = {
-	.attrs = attrs,
+	.attrs_const = attrs,
 };
 
 static struct kobject *example_kobj;

-- 
2.54.0

