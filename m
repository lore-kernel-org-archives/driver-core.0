Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4865A3BADAB;
	Fri, 24 Apr 2026 15:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777044735; cv=none; b=MBBiJiOIFhEYcZb4iEKjNERHh1UeIfUfa1cK3bbqQOgC/UZbRSSmd0UF9l9cJ6bysVP8K8pCAHprVboH15smFCKP2XFEZ8ne7Dj0dqh0IRZfj8bCRpo2PwTtx4LaxbTV9Kd0iIOxaR1ypuqcySXMeZLYDWajArMi5cuMXLnggJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777044735; c=relaxed/simple;
	bh=CtPJaScfMHCSHr1XYLLMMy8pf8RbTxMqrvoiulzlGAM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JHPvbLiSXqQot53seUhNiDAVS26muqQUTMykGkInQWoycA/LMtT2D4UlpIfQ3pYlYYg0Tv6jwdQ8XJfGNgGFzkse1vku7uBAtzNlViXglaWk7ZbsuC3+PDUvqNS3ff/0HF5uqUhDLxuZBAFsKlNLqsxl+z8Rqqm7lfQQk996O+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=k9LMlmAp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="k9LMlmAp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F838C4AF0B;
	Fri, 24 Apr 2026 15:32:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777044735;
	bh=CtPJaScfMHCSHr1XYLLMMy8pf8RbTxMqrvoiulzlGAM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=k9LMlmApd1HsjaQPi6RkcLFSXdQQfBZXtH3dUVlz75I503bX98pAI/I20wPNaXAEZ
	 yxKnJRAFt5Ypf6VcU06jYs24vpbFkPzX1/nhHvqEW+KjxljtuY1NTmv8JgTLhuyVbi
	 WTayb4AENep+tCRGiNTQvUlt/Om/5RBH2DbNXi7OJNz3aLROg2OS4C3FDONcamv4GG
	 fIUHdaWbsSvJvGVd0YGIeIuRorx4YAZQWxhZ8n2nwOqiDOoFD3R0DFPvkjE64gujcr
	 vjtaC+TpllKBRfXT2zOO6eS6FghjITB6H3SoT4AyNGaSKCI4ZuHkdeFpngYbB7h9J7
	 3Mxx7L8toZ9JA==
Received: from johan by xi.lan with local (Exim 4.98.2)
	(envelope-from <johan@kernel.org>)
	id 1wGIVo-0000000B6j1-2wFU;
	Fri, 24 Apr 2026 17:32:12 +0200
From: Johan Hovold <johan@kernel.org>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Johan Hovold <johan@kernel.org>,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] driver core: faux: fix root device registration
Date: Fri, 24 Apr 2026 17:31:26 +0200
Message-ID: <20260424153127.2647405-2-johan@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260424153127.2647405-1-johan@kernel.org>
References: <20260424153127.2647405-1-johan@kernel.org>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A recent change made the faux bus root device be allocated dynamically
but failed to provide a release function to free the memory when the
last reference is dropped (on theoretical failure to register the device
or bus).

Fix this by using root_device_register() instead of open coding.

Also add the missing sanity check when registering faux devices to avoid
use-after-free if the bus failed to register (which would previously
have triggered a bunch of use-after-free warnings).

Fixes: 61b76d07d2b4 ("driver core: faux: stop using static struct device")
Cc: stable@vger.kernel.org	# 7.0
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/base/faux.c | 22 ++++++++++------------
 1 file changed, 10 insertions(+), 12 deletions(-)

diff --git a/drivers/base/faux.c b/drivers/base/faux.c
index fb3e42f21362..3d1d1eafb473 100644
--- a/drivers/base/faux.c
+++ b/drivers/base/faux.c
@@ -133,6 +133,9 @@ struct faux_device *faux_device_create_with_groups(const char *name,
 	struct device *dev;
 	int ret;
 
+	if (!faux_bus_root)
+		return NULL;
+
 	faux_obj = kzalloc_obj(*faux_obj);
 	if (!faux_obj)
 		return NULL;
@@ -232,19 +235,12 @@ EXPORT_SYMBOL_GPL(faux_device_destroy);
 
 int __init faux_bus_init(void)
 {
+	struct device *root;
 	int ret;
 
-	faux_bus_root = kzalloc_obj(*faux_bus_root);
-	if (!faux_bus_root)
-		return -ENOMEM;
-
-	dev_set_name(faux_bus_root, "faux");
-
-	ret = device_register(faux_bus_root);
-	if (ret) {
-		put_device(faux_bus_root);
-		return ret;
-	}
+	root = root_device_register("faux");
+	if (IS_ERR(root))
+		return PTR_ERR(root);
 
 	ret = bus_register(&faux_bus_type);
 	if (ret)
@@ -254,12 +250,14 @@ int __init faux_bus_init(void)
 	if (ret)
 		goto error_driver;
 
+	faux_bus_root = root;
+
 	return ret;
 
 error_driver:
 	bus_unregister(&faux_bus_type);
 
 error_bus:
-	device_unregister(faux_bus_root);
+	root_device_unregister(root);
 	return ret;
 }
-- 
2.53.0

