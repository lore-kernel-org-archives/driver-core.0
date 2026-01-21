Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DF01343D60;
	Wed, 21 Jan 2026 10:29:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991397; cv=none; b=FjgTp/VXMdtKmjlp+PvmPLjvPPtrBPQ2HcDY4oMiAVQcaFz8yLST4AZbqXX4pJZYtrPvv1HxNYJLnmaPl77XXbOs2fnB1N5rfPF8sIoZpSzXUuxzU9z1+fXIE2+hZU+X+dnpIMPyw0w9974hMGSnMzCaRAodzUQGJ4X/ddQ9fiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991397; c=relaxed/simple;
	bh=VtkSXzXkjDbXBLKR4EA5zU5zmWvAtuAwf7CSmbXS9Zs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=KpvZUuuU42DYA/K+sDcOLo8GHuxsXjvhd55uEQJuRyVlLXtM4Fpv9JuRlxvwCREeKR70gPj+wqUZrL2jhDMvyQGLqTh0VEo1DCP99XTo2iW5fTbWO1qmb+wsSdeLhYbJQ2IJnyZ4Ky2LA9cjIVX9gE9ZPkGq6XkVMp1TFCl9e/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=QmTSBw8k; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="QmTSBw8k"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1AA52C116D0;
	Wed, 21 Jan 2026 10:29:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1768991396;
	bh=VtkSXzXkjDbXBLKR4EA5zU5zmWvAtuAwf7CSmbXS9Zs=;
	h=From:To:Cc:Subject:Date:From;
	b=QmTSBw8kk9PJjrvXzO5U04npEwbUPQWw6UWqZHzYVQyO38tx15vLOqDjgszXSbFl4
	 BvHfZbeHz/YHULCTV/2Hc0n/hixyMJ0meGbcQe18N8y1vUYdZzXBCzsV1Lc/FClfny
	 YnCiC2M9Pis7s/HgmB+/i7ZuWGA5H0zXVi29IYgA=
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: dakr@kernel.org,
	rafael@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Gui-Dong Han <hanguidong02@gmail.com>
Subject: [PATCH] driver core: faux: stop using static struct device
Date: Wed, 21 Jan 2026 11:29:45 +0100
Message-ID: <2026012145-lapping-countless-ef81@gregkh>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1887; i=gregkh@linuxfoundation.org; h=from:subject:message-id; bh=VtkSXzXkjDbXBLKR4EA5zU5zmWvAtuAwf7CSmbXS9Zs=; b=owGbwMvMwCRo6H6F97bub03G02pJDJkFq2Ye3Z589ijThZ9qk61ZyxaFeQptqXt+/lTV8779k V+Y56eHdcSyMAgyMciKKbJ82cZzdH/FIUUvQ9vTMHNYmUCGMHBxCsBEXrQxLDigY3trbb72+rTN 1g67py3eI+kbNI1hfiCLvnnnMl6LXGYVhe/1BcLie34/BwA=
X-Developer-Key: i=gregkh@linuxfoundation.org; a=openpgp; fpr=F4B60CC5BF78C2214A313DCB3147D40DDB2DFB29
Content-Transfer-Encoding: 8bit

faux_bus_root should not have been a static struct device, but rather a
dynamically created structure so that lockdep and other testing tools do
not trip over it (as well as being the right thing overall to do.)  Fix
this up by making it properly dynamic.

Reported-by: Gui-Dong Han <hanguidong02@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/base/faux.c | 18 +++++++++++-------
 1 file changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index 21dd02124231..23d725817232 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -29,9 +29,7 @@ struct faux_object {
 };
 #define to_faux_object(dev) container_of_const(dev, struct faux_object, faux_dev.dev)
 
-static struct device faux_bus_root = {
-	.init_name	= "faux",
-};
+static struct device *faux_bus_root;
 
 static int faux_match(struct device *dev, const struct device_driver *drv)
 {
@@ -152,7 +150,7 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 	if (parent)
 		dev->parent = parent;
 	else
-		dev->parent = &faux_bus_root;
+		dev->parent = faux_bus_root;
 	dev->bus = &faux_bus_type;
 	dev_set_name(dev, "%s", name);
 	device_set_pm_not_required(dev);
@@ -236,9 +234,15 @@ int __init faux_bus_init(void)
 {
 	int ret;
 
-	ret = device_register(&faux_bus_root);
+	faux_bus_root = kzalloc(sizeof(*faux_bus_root), GFP_KERNEL);
+	if (!faux_bus_root)
+		return -ENOMEM;
+
+	dev_set_name(faux_bus_root, "faux");
+
+	ret = device_register(faux_bus_root);
 	if (ret) {
-		put_device(&faux_bus_root);
+		put_device(faux_bus_root);
 		return ret;
 	}
 
@@ -256,6 +260,6 @@ int __init faux_bus_init(void)
 	bus_unregister(&faux_bus_type);
 
 error_bus:
-	device_unregister(&faux_bus_root);
+	device_unregister(faux_bus_root);
 	return ret;
 }
-- 
2.52.0

