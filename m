Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C121735979
	for <driver-core@lists.linux.dev>; Thu,  5 Mar 2026 20:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772741642; cv=none; b=Eb9cwb0Rqdxyyz7fVBi2UrgASw+DepoyT93oAbhMVgnIaL5w2q7y69ZYP+ME4pezWbiclkYzLL4/hN4XO0bXigZmAERtDM7WvaDhERtOn8BLvo9Kq8dS97VXlSBVGgJdFuZm+zPcqnqCHQe4HKlO4GNUPwNSlbMvIXPBXBDqukM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772741642; c=relaxed/simple;
	bh=BVSYajjX8QZ2uqBS6QQzCOARY2MJCC4I+vvzD+sr2nw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=m0LyGsRB0FLEQcZi5+B+ux+z7b7Ca7B79/shs1my9PmFhEcS20cL7t+RSkXGSJ8PsfrOrwcjkNSwB44ll84vPOq15QKmQi1VuXqY4LvaEFbFA9Lk/Xnqcq11sWrtwMJVDbEZY8Y9/0BFlrRsgb30/XCCqJNbApZ2l9YLWhMjsgE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsBTFI6N; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I5a7jae5; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsBTFI6N";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I5a7jae5"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 625KALO9720112
	for <driver-core@lists.linux.dev>; Thu, 5 Mar 2026 20:13:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zONKhg6P1Ev6MJUutYDZ+HCNI5aniluPAIz
	4dKN7gG8=; b=UsBTFI6N3Y7HQuy1b8OqU39w3B05RgAUuHTKNpEKF0T8GIo2pC3
	hg+R/27Yw974uzPol74k9cQ4JNztxjkYD+GOGe7Kh9GlRWdkbp7EYBdINTLhm00r
	kgvyZAOa9K4IoxcOnBWDQslx0ol7bVxjoqwBTbvblnUMv4SefqIGeQoMqtqRz+U3
	xSL0nPc+8UckVU32Xh0eyyy/lnUi7KbTl60sF9tjLMRLQ4yocBvdRYJJuRT3Y/nL
	ZLHJMywMmn6csmg8dj8+xd6/ZHNFUmDpVuIW5IHuk1rF3hEw9M+7pYQz2tLNWdE6
	UHUO+iup0iW6NbJPgx/3U4o+0rhOu2u4BsQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cq9srhkc7-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 20:13:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8c70e610242so1770900485a.2
        for <driver-core@lists.linux.dev>; Thu, 05 Mar 2026 12:13:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772741639; x=1773346439; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zONKhg6P1Ev6MJUutYDZ+HCNI5aniluPAIz4dKN7gG8=;
        b=I5a7jae5PHr4uXNaG/4TcR4NefabADx3HEbUuWFCTJjZLz1M5RM+N2YWTv1rtMGYQ0
         g4PVN6hSlcBuncxxhhTcWvD4CFA/kANWEt26ToZqATdam97lq6CTAY+N5lnTGRWvOScn
         zzTaSIxDuCl9NufmxYue/+DhG1fZVjPBKVwreqZqvxMttbd7lo0YfpPkj24LolFDQrR5
         eW9Fa5y7t4W6ELSgY7lSuUqVCYt7i9eXwA3p8q7hpIZHfIAabTm7JWJC6lojcU0m/OJ9
         HvgBlkJunrPyeV5JK+zkzQmXF/WPdCq4cjpELiqxz6LxPlz5uKIPvUFgZf7HaYpBlaDT
         Elog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772741639; x=1773346439;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zONKhg6P1Ev6MJUutYDZ+HCNI5aniluPAIz4dKN7gG8=;
        b=NmC0ngj4B104hr/FDqNc1XmgfXWCVRS60VslThvvehYoDzC3V27SJkBcV+s74yJwRv
         IhXzVb8HmGGM0GHRN0uZfEWpExQC+jV7Oa4J9KQF5IyEUUnFl22MQo/M4eoOCmMj83gH
         eStghI7dtDz6kxsadnaOkPxXdWN+r6yYYt7RQTUJmQjvUgnMWl/ma226ILFQ9r6tGVDE
         X20zKY33LBLC+xUebaT8NOmST6dhkF8KGXviBW1BkVVdvTeB++jUfVs8CZvr2OpuwVin
         5lkOCvGpNrbwX5UwjKEPGGky+KM9Kpr+r7IP6ZjIe02H5snDDVYfe26ofKZ33UBTTWi9
         vsbA==
X-Forwarded-Encrypted: i=1; AJvYcCVsTL//2C75Df+yNUiltif4u6R96oGQS2cYyI7+Yn6L9KC2kf0Nh/9mEadh1W/IvdAJ9FtBOqixEO2C1Q==@lists.linux.dev
X-Gm-Message-State: AOJu0YxVphPUvYd9d6famPAoi3TdfZFifvaU5Pil1c6iwB12gCgpzLdB
	xTUPlYuUVHnJymcBYrZmAflULAxyjAfkW252rmklEbgYTZiKH3pjMS1VxxyHHcQvzVpuZbPrMb4
	Mzoy9wEHe0SELhuwD8ZphXqSsVg0Lj1EBe9l/dqtYd5/Xk8mEmxKm1m6EcvTxGjOr7A==
X-Gm-Gg: ATEYQzx5XgZq1gWoP3wf2eTK/W1mTJKYf1tiv/Y06lY7AUitlsWaaHmWJZAMJSiLInr
	meB/0Cyz3vU2O2xv29MbOOfqK9WEpqu8oNDhYSbZAkUU2jDHM5/CUV/MOwmdW7vkuXzDplNaIl1
	zV4BvvxoNd8JdcUGgjIHcrq9AF6RwoDOjKApRXMHxTjHze0yY1ZEHqFBma7ynmon4eJF8KXhbPi
	3zwblBhcBQ7LrQynJiFhZmfPDmP+2LYsRsetiZXvcRCKbGr/2wANx6LxbEp+YjCRXC2jWI6zyIz
	8LkKf7QgwhTkX1iPsnV6ZVMt/suBqH6VWzzUDzFCPtKfAPSIj2FN6pJveXUIQtSVybbzG6TlyCB
	0zkcjZIgrYZ+eHo6cHbQNLpoaoYpGHH/KX9Cc
X-Received: by 2002:a05:620a:4092:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cd5af8030fmr874672785a.40.1772741639073;
        Thu, 05 Mar 2026 12:13:59 -0800 (PST)
X-Received: by 2002:a05:620a:4092:b0:8ca:2cf9:819c with SMTP id af79cd13be357-8cd5af8030fmr874669885a.40.1772741638630;
        Thu, 05 Mar 2026 12:13:58 -0800 (PST)
Received: from quoll ([178.197.219.94])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-485244a5c0esm1294355e9.4.2026.03.05.12.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 12:13:56 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
        driver-core@lists.linux.dev
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] regmap: Simplify devres handling
Date: Thu,  5 Mar 2026 21:13:50 +0100
Message-ID: <20260305201349.32734-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1873; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=BVSYajjX8QZ2uqBS6QQzCOARY2MJCC4I+vvzD+sr2nw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpqeP9h4JLHokM2Fwh2L5ctuREkg08wqWNxUWlV
 crDJS+wjSqJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaanj/QAKCRDBN2bmhouD
 13XcD/9DK0ydGrSvZrVHtTMD4aejjLltiA12r/YErrE7hlQ0QXeJXrxNKAyGbc4eCkQa3btcQiE
 CpvIzxoX+0qMDvamPrW9Ff3bTNDdq66Vo+PAm9xGC3miJCE/RQElN4rzYoEJYZY1/jqu3Hc7yN/
 XHUU2TPRGGDCrLlDXO4LwyXWQTIdnBNqVBwNI4TGplenmbvoSjAU8yLMRs//SYUsnpcC2PzWlRj
 zo3Ybt7NROWeYe/TPM+M6omWjIbMSbjvIza/41+CAnAKj/N7HuVL26A8bg0jeR8AYAiu/a+5gER
 NQo1mLBsawRt94JZ6NoS6pOO/T4/tIhTEgFm4Jw53q76Lsbe1tJBfljd50DSfVWentYuu+AAaQ+
 duoVYXaoEStbwBHn0m6p3w4YV8vZPtDo4CwFEQ/jFkABv1LYU+zyGCGBn8WqJehY/75B7Zt0ZDx
 +diH9AwqGYCh8n1kp/dhS6G6rsnyl+2CpoSpE3ySc2lDU6hsCQ/aLVcplT1c8GIgNEe+ZKZjg7w
 qOsCLBWVcFkCUTrXT72eUU2rZPDlJRus7wKKECZTu9pxZ+flvEFvwTzed3nC1l73g/W6N4wi+uq
 2fOVWTgbU2FthytykhiV6u+j9C+h2hxj4RpxQMmU89mRASmMd18rphSzAkQB9Ta04HHTYYCS1g3 t4Pu0N3D/Knp/eQ==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=a/I9NESF c=1 sm=1 tr=0 ts=69a9e407 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=gOEeR9iKwsj33Yj5oN/cWg==:17
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=X6npvS0fHPtJAOho-mwA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: gujAOlek5wziizxhOKgdywV8rn80DV5-
X-Proofpoint-ORIG-GUID: gujAOlek5wziizxhOKgdywV8rn80DV5-
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE2OSBTYWx0ZWRfX0UKNc3ZiTrhM
 jbou6t+yXZNj1e85bw022sXK4YM5NSSGU2Ew3n7by0mzH4UkPp6YOkadlUF2mR0BKc6URPGiZwB
 geuG/4BsR3s89jwaWW9qWXLL4k5ImYuoGLy8jb25GpnK8NfSpzzFGsB36lmkyQqScFdJT6ArQdI
 vBDQkpKrzJFrgXbIgw4fxIowAfQu6OSbM94m8oIRSBcmyO5a4ahoh3SU3nL4vfziwNEqHdFA8up
 odPBjkq71rb2ZTtzFOhXZKptwxeQGj07210+h2q5CFPny6gM7SWQML/DhOfKoUYHbubuIiWK5Uy
 yqlCbyfftP9BWcPqYpYeb2ZKbmOiSJ4knrkPFr7OgkiKwHpcNU/QU2CG7WXaEKsei9R2osP3JP3
 i/NIvhzrDalZ3q380LjTvpqi8ELRwuiLFWOwmUdhaTxnL+Ic2KVBVgnoSZr5EOrBQ1lT8J+MsJD
 DN05N4mNnIqREGtXMuw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_05,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 impostorscore=0 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050169

The resource-managed devm_regmap_init() can be a bit simpler by using
devm_add_action_or_reset() instead of devres_alloc().  This allows to
drop the less-obvious pointer to pointer (struct regmap **ptr) and make
devm_regmap_release() interface simpler.

Code is functionally equivalent with minor difference: devres_alloc()
will happen now after successful resource init (__regmap_init()).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 drivers/base/regmap/regmap.c | 23 ++++++++++-------------
 1 file changed, 10 insertions(+), 13 deletions(-)

diff --git a/drivers/base/regmap/regmap.c b/drivers/base/regmap/regmap.c
index 607c1246d994..f888a83aa9c3 100644
--- a/drivers/base/regmap/regmap.c
+++ b/drivers/base/regmap/regmap.c
@@ -1182,9 +1182,9 @@ struct regmap *__regmap_init(struct device *dev,
 }
 EXPORT_SYMBOL_GPL(__regmap_init);
 
-static void devm_regmap_release(struct device *dev, void *res)
+static void devm_regmap_release(void *regmap)
 {
-	regmap_exit(*(struct regmap **)res);
+	regmap_exit(regmap);
 }
 
 struct regmap *__devm_regmap_init(struct device *dev,
@@ -1194,20 +1194,17 @@ struct regmap *__devm_regmap_init(struct device *dev,
 				  struct lock_class_key *lock_key,
 				  const char *lock_name)
 {
-	struct regmap **ptr, *regmap;
-
-	ptr = devres_alloc(devm_regmap_release, sizeof(*ptr), GFP_KERNEL);
-	if (!ptr)
-		return ERR_PTR(-ENOMEM);
+	struct regmap *regmap;
+	int ret;
 
 	regmap = __regmap_init(dev, bus, bus_context, config,
 			       lock_key, lock_name);
-	if (!IS_ERR(regmap)) {
-		*ptr = regmap;
-		devres_add(dev, ptr);
-	} else {
-		devres_free(ptr);
-	}
+	if (IS_ERR(regmap))
+		return regmap;
+
+	ret = devm_add_action_or_reset(dev, devm_regmap_release, regmap);
+	if (ret)
+		return ERR_PTR(ret);
 
 	return regmap;
 }
-- 
2.51.0

