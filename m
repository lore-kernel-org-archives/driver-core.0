Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F38E21A6816
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 02:29:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775788176; cv=none; b=GO+gzzQlWiFIoZy9cdld5eM9KsvB7tjmLXKvoi44hD+ZmflHOtytPPsniBYkjozu6Lx19FC5G7xDPWa9W3It7zI9LOLtM/BF9jLK8Exqp1gbDbouoSK5K+sPvOu1w1ylxaitGIIfHchvLYpKCvlPNwk4Uy0eqLNojhftd/cBoqg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775788176; c=relaxed/simple;
	bh=l5KEfslGNVkn91f1hb7vNEbKJ34uCRzTdLz+dFg3XlE=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=gap/Iioawi5Nrcc0uF8Fw3vyxc/5rNZtQcMIZAdVdEE4c13tUMz9EKwbVVQFOtN+0jK2PvhJ262/mqV+G6e5/6f99TpaERGUMjBCmK8Lce+ZnrkPQqD3Ijs52U1kv0lbS+x6mWbiMvUzq46s7G6Lt4WTL2+t23VCYoq0PeaB7K4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: 1982ba8e348511f1aa26b74ffac11d73-20260410
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:a8ab2710-d1eb-4e78-8e36-2ef6334d9961,IP:0,U
	RL:0,TC:0,Content:-25,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:3c57213d640dce1dbb63888ae58e4b25,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:102|850|898,TC:nil,Content:0|15|50,EDM:5
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 1982ba8e348511f1aa26b74ffac11d73-20260410
X-User: xiaopei01@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <xiaopei01@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 902534431; Fri, 10 Apr 2026 10:29:28 +0800
From: Pei Xiao <xiaopei01@kylinos.cn>
To: broonie@kernel.org,
	linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev
Cc: Pei Xiao <xiaopei01@kylinos.cn>
Subject: [PATCH] regmap: i3c: Add non-devm regmap_init_i3c() helper
Date: Fri, 10 Apr 2026 10:29:24 +0800
Message-Id: <a81256a8866b163979a20406abf01df7d7440104.1775788105.git.xiaopei01@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add __regmap_init_i3c() and the corresponding regmap_init_i3c() macro to
allow creating a regmap for I3C devices without using the device-managed
version. This mirrors the pattern already established for other buses
such as I2C, SPI and so on, giving drivers more flexibility when
the regmap lifetime is not directly tied to the device.

Signed-off-by: Pei Xiao <xiaopei01@kylinos.cn>
---
 drivers/base/regmap/regmap-i3c.c | 10 ++++++++++
 include/linux/regmap.h           | 17 +++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/drivers/base/regmap/regmap-i3c.c b/drivers/base/regmap/regmap-i3c.c
index 863b348704dc..5af583d472dd 100644
--- a/drivers/base/regmap/regmap-i3c.c
+++ b/drivers/base/regmap/regmap-i3c.c
@@ -46,6 +46,16 @@ static const struct regmap_bus regmap_i3c = {
 	.read = regmap_i3c_read,
 };
 
+struct regmap *__regmap_init_i3c(struct i3c_device *i3c,
+				 const struct regmap_config *config,
+				 struct lock_class_key *lock_key,
+				 const char *lock_name)
+{
+	return __regmap_init(&i3c->dev, &regmap_i3c, &i3c->dev, config,
+				  lock_key, lock_name);
+}
+EXPORT_SYMBOL_GPL(__regmap_init_i3c);
+
 struct regmap *__devm_regmap_init_i3c(struct i3c_device *i3c,
 				      const struct regmap_config *config,
 				      struct lock_class_key *lock_key,
diff --git a/include/linux/regmap.h b/include/linux/regmap.h
index f1c5cb63c171..df44cb30f53b 100644
--- a/include/linux/regmap.h
+++ b/include/linux/regmap.h
@@ -693,6 +693,10 @@ struct regmap *__regmap_init_sdw_mbq(struct device *dev, struct sdw_slave *sdw,
 				     const struct regmap_sdw_mbq_cfg *mbq_config,
 				     struct lock_class_key *lock_key,
 				     const char *lock_name);
+struct regmap *__regmap_init_i3c(struct i3c_device *i3c,
+				 const struct regmap_config *config,
+				 struct lock_class_key *lock_key,
+				 const char *lock_name);
 struct regmap *__regmap_init_spi_avmm(struct spi_device *spi,
 				      const struct regmap_config *config,
 				      struct lock_class_key *lock_key,
@@ -999,6 +1003,19 @@ bool regmap_ac97_default_volatile(struct device *dev, unsigned int reg);
 	__regmap_lockdep_wrapper(__regmap_init_sdw_mbq, #config,	\
 				dev, sdw, config, mbq_config)
 
+/**
+ * regmap_init_i3c() - Initialise register map
+ *
+ * @i3c: Device that will be interacted with
+ * @config: Configuration for register map
+ *
+ * The return value will be an ERR_PTR() on error or a valid pointer to
+ * a struct regmap.
+ */
+#define regmap_init_i3c(i3c, config)					\
+	__regmap_lockdep_wrapper(__regmap_init_i3c, #config,		\
+				i3c, config)
+
 /**
  * regmap_init_spi_avmm() - Initialize register map for Intel SPI Slave
  * to AVMM Bus Bridge
-- 
2.25.1

