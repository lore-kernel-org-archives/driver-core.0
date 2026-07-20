Received: from mailgw.kylinos.cn (mailgw.kylinos.cn [124.126.103.232])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E145841A783
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 12:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=124.126.103.232
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784551874; cv=none; b=tH7ojtE4QXXKLzBRvNzGLzoy07t/80JU+ysSiyRPU3JOmIS3O+FOln6dPaiWJsQpH/UVEvY1OTzdPNw0i6H5iLSDA8tB6dgE4Fx130zCKm8i+/wi2/nMmVfebE7MiGrfZ9GU0l19Gzak4cYz4WFaSNlsa+drQF7dYqypnzhQ5ho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784551874; c=relaxed/simple;
	bh=5yys8wsdRYKcUKjq+2Lxai67aVb9YbfeB/CjIRgpBmc=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=HmFqpK3jZqq0VOb87yBr9OXuqI6kImp7EPU/vDMFz/rcMs+6uh7DhIx9raA4QjIyLfTu4kmI/bNESIpMkk7LGEBGGMv05ZvgMJjx2OS9CWNc52Ans7hJu1huwXHjDpRwH1PWClJDCfniVodQdwLssYLJcAHrRpV2Thmj0Kl4kzk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn; spf=pass smtp.mailfrom=kylinos.cn; arc=none smtp.client-ip=124.126.103.232
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=kylinos.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kylinos.cn
X-UUID: ab510f66843911f1aa26b74ffac11d73-20260720
X-CTIC-Tags:
	HR_CC_COUNT, HR_CC_DOMAIN_COUNT, HR_CC_NAME, HR_CC_NO_NAME, HR_CTE_8B
	HR_CTT_MISS, HR_DATE_H, HR_DATE_WKD, HR_DATE_ZONE, HR_FROM_NAME
	HR_SJ_LANG, HR_SJ_LEN, HR_SJ_LETTER, HR_SJ_NOR_SYM, HR_SJ_PHRASE
	HR_SJ_PHRASE_LEN, HR_SJ_WS, HR_TO_COUNT, HR_TO_DOMAIN_COUNT, HR_TO_NO_NAME
	IP_TRUSTED, SRC_TRUSTED, DN_TRUSTED, SA_EXISTED, SN_EXISTED
	SPF_NOPASS, DKIM_NOPASS, DMARC_NOPASS, CIE_GOOD, CIE_GOOD_SPF
	GTI_FG_BS, GTI_RG_INFO, GTI_C_BU, AMN_GOOD, ABX_MISS_RDNS
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:dc8bd994-4ecc-41b3-8e4f-6f61092a4cb1,IP:15,
	URL:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTI
	ON:release,TS:-10
X-CID-INFO: VERSION:1.3.12,REQID:dc8bd994-4ecc-41b3-8e4f-6f61092a4cb1,IP:15,UR
	L:0,TC:0,Content:-25,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION
	:release,TS:-10
X-CID-META: VersionHash:e7bac3a,CLOUDID:27033dd4995ba192f578a49bbfc07779,BulkI
	D:260720205104TXGZVKPI,BulkQuantity:0,Recheck:0,SF:10|38|66|78|102|127|850
	|865|898,TC:nil,Content:0|15|50,EDM:-3,IP:-2,URL:0,File:nil,RT:nil,Bulk:ni
	l,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE
	:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: ab510f66843911f1aa26b74ffac11d73-20260720
X-User: yijiangshan@kylinos.cn
Received: from localhost.localdomain [(116.128.244.171)] by mailgw.kylinos.cn
	(envelope-from <yijiangshan@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 788305533; Mon, 20 Jul 2026 20:51:04 +0800
From: Jiangshan Yi <yijiangshan@kylinos.cn>
To: johannes@sipsolutions.net,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org
Cc: linux-kernel@vger.kernel.org,
	driver-core@lists.linux.dev,
	13667453960@163.com,
	Jiangshan Yi <yijiangshan@kylinos.cn>
Subject: [PATCH] base: devcoredump: Replace simple_strtol with kstrtol
Date: Mon, 20 Jul 2026 20:50:35 +0800
Message-Id: <20260720125035.891018-1-yijiangshan@kylinos.cn>
X-Mailer: git-send-email 2.25.1
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The disabled_store() function uses simple_strtol(), which is marked
obsolete. simple_strtol() does not provide error handling on invalid
input - it silently returns a partial parse result or 0, which the
'if (tmp != 1) return -EINVAL' check then accepts as a legitimate
non-1 value.

Replace simple_strtol(buf, NULL, 10) with kstrtol(buf, 10, &tmp),
which returns an error code on invalid input. This makes the write-once
lockdown attribute stricter: malformed input (e.g. trailing garbage)
now returns -EINVAL instead of being silently treated as a non-1 value
that the caller wanted to reject anyway.

The behaviour for the legitimate '1' input is unchanged.

Signed-off-by: Jiangshan Yi <yijiangshan@kylinos.cn>
---
 drivers/base/devcoredump.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/base/devcoredump.c b/drivers/base/devcoredump.c
index 8bb1763083dd..f346729bee1b 100644
--- a/drivers/base/devcoredump.c
+++ b/drivers/base/devcoredump.c
@@ -210,7 +210,12 @@ static ssize_t disabled_show(const struct class *class, const struct class_attri
 static ssize_t disabled_store(const struct class *class, const struct class_attribute *attr,
 			      const char *buf, size_t count)
 {
-	long tmp = simple_strtol(buf, NULL, 10);
+	long tmp;
+	int ret;
+
+	ret = kstrtol(buf, 10, &tmp);
+	if (ret < 0)
+		return ret;
 
 	/*
 	 * This essentially makes the attribute write-once, since you can't
-- 
2.25.1

