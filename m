Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62D61322B7D
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772014359; cv=none; b=KI1vmPYZh4S7ZYtPzLxHyIS7DhN2P83yZgneaHZKu8RCseioVTjCH5t7S5iD8uZt6e3TI1ENcPDyDJeaUvU2yyvrRPz5kuSIyIuyY6i++xbuh9cHedUB1JB9A7y3TVDDD5/Kk+RA+IU/D7R9Mr3REiX3oz4Zl2a2aXJs6ifah7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772014359; c=relaxed/simple;
	bh=Y22JRh9xvQfJncGH7gL+X+J/7Dt0gtPhEvqzsi3dp5c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=aB/8uUesUIJiMYwP10jcp/a2OMNY5fanExsFCYCvR1viqxHY9Q0e4/b2nWJWT2hyY7COdK2LwjxLTNSLs1WmMA21owRVs3s9sTR5AcyIusjUxSAS3ij66WMphzzBF7gEd8ie3rrbrCc5EnIGSNPjsLiw3jhrSsIkCupWjMRLPrI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pb9Dig/0; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=EnnBjiHn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pb9Dig/0";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EnnBjiHn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61P9TPjA583478
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 10:12:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=sZiX6+x00Prlmosf5CSqBN
	8ltuHXD+PUom5YlTd56Cw=; b=Pb9Dig/0Rl1g0zOx+eNcao7++MrN2j9aGpqt96
	mwZP3zNonSLuwgxJy2RTVqwtckwMNZqjqpsDMgPMNtUZF9w7WJW94TkOVizP/3gu
	e/5tXQN7OHVbw6j5sJtj2rbUtGwZaUTb4ksUtGu8K62vpsqLZ9ELoRFT18FK/WPV
	qKRqX+zqL4m9KbbR383cnFTK5BlP9FrGY5KwFEvZmnVDM/e5GirgE0OWTxoSt2/C
	vHbqFHCZnJzNPStRpZYEuXwoz8FeY2zzYZciXdVOdKQ3v8zzM50nGnpoOYrHGBeb
	oPXBjmHgB3RhmjGev+09T9gHlQ76JTVJoNx/RqRWe4ZDai/Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chekjb9au-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 10:12:37 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8c70cff1da5so4476322385a.2
        for <driver-core@lists.linux.dev>; Wed, 25 Feb 2026 02:12:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772014357; x=1772619157; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=sZiX6+x00Prlmosf5CSqBN8ltuHXD+PUom5YlTd56Cw=;
        b=EnnBjiHn8LmD8ga1kdfZRf/8i+KFxBtQbat6Xv5+/h4QJHw5N7+Aczc7fO74CIJWy6
         eKQ7Sf91vasF4S/BGeFISe9wG76Np1leSyENWtqRSSR+WblKHvA9lKSDpLCH1EhXBYBe
         iPPFIbz9gEArzruPJww2s6mdYR4FeM9AWZl/NItzW1L6QjG0Q4XD6BDKrLui+sLn3imB
         KZlYnI//3VY10A4NUGu+iHlZWgML9dtg2KIHSyyRVgGe+wP/U9lOZRIAaDa4ixspV+pO
         yYKzuMN+Gf1+zU4pumerjmJraoHzlYxWWN3e2lXOJ8BAQmVW1Gnj8KXmqOa4KUjHUfm3
         fgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772014357; x=1772619157;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sZiX6+x00Prlmosf5CSqBN8ltuHXD+PUom5YlTd56Cw=;
        b=GYefKkIM3llW1WuLOAYcriiJWcURoWL5oOLlnxd9BKq+mqqcqKxaFWUzY4uESQr6XL
         lS7Pw2Hw+/kBFxxWZ/cgkZXwqd99Hjy+bFmndw7vPUcBqpF2NUDI2jrypEqylXNr/1oW
         Mqg3hCe0Oti2rdBAR8e2gJfWjO9KUDYSpc32QA+Cz4bWcbpKchew++mb9z555vC536ZD
         GTaVdk6hcJFkaMCrFucqNSNKXFSLjgoeAf+dpgvDrAWgIko45JNtJC5MIoKXJIQibxSP
         JzrXyue/09R3UtZFMxYY2iueNHBZbJD+2A1vlLKf5HpInOliQ49mKYx+eNc2OCS6ItKS
         cFIg==
X-Gm-Message-State: AOJu0YxBPpAkPLtl1gjtYrWe2WgZFnBehpYQ4gJZ4AIDMx+XTHn31hTg
	UR+PXTOCxhbTL4QV5IBTczeH38ea/NDVDHAcQJ/hfa0ErH0vWTptomShM0p02+mQ5RbyTKdrE5+
	B5+h6uzDFIde6nCtfWVMrI31LMypDtzmN0hOmi/J4in/9sJmvHPysARC5gfzb8y3FhQ==
X-Gm-Gg: ATEYQzwap0X82W95yhteJC0n6gB82FBymDi2VerpRkD386fN+ygj31OuZqzBwn1ZY1w
	p24tLk7CvUPTEX+QQ1SEN8KM010CXLQ69qIDolV1xLlpJ1Wv6BgL7pGeNBIPphkGvkpTYrszVGh
	1vGjlUZGGVqoJ7c1KApQsJeGquMeN3xUnlOlKnZciLbkGeQoegR3PKqQCOR2C7uX3lnJKBlyK/D
	N2e3oYuSSPzIvDIXg0zUtkFT4nzPNw2iL5FtibrXtZQHh/B3OIi96gt6/r78xkQq1Dkcgh7WzCB
	KD9TX1jW4v8fIQPl4Q0ixs9MHT4ZEiHt7hPa8yVNuJnMefPnlWN5308ytGgahWrDAIZCSO6qayL
	lYPs0BL7pxhR5voNWQSzBdO9CGqyfKNEmGhGcnrJgkjee0Gmel4g=
X-Received: by 2002:a05:620a:44c3:b0:8cb:4543:c5a8 with SMTP id af79cd13be357-8cb8c9fad83mr1971177285a.21.1772014356511;
        Wed, 25 Feb 2026 02:12:36 -0800 (PST)
X-Received: by 2002:a05:620a:44c3:b0:8cb:4543:c5a8 with SMTP id af79cd13be357-8cb8c9fad83mr1971172885a.21.1772014355971;
        Wed, 25 Feb 2026 02:12:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:44ca:6a2e:7fc:1024])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d5463dsm30382107f8f.34.2026.02.25.02.12.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Feb 2026 02:12:35 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 25 Feb 2026 11:12:25 +0100
Subject: [PATCH v3] gpiolib: match secondary fwnode too in
 gpio_device_find_by_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260225-device-match-secondary-fwnode-v3-1-a7152054135a@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAAnLnmkC/43NQQ7CIBAF0KsY1tIARWpdeQ/jgg5TS2JBoaJN0
 7tLu3JhoptJ/uTn/YlEDBYjOWwmEjDZaL3LodxuCHTaXZBakzMRTCgmeE1NLgHSXg/Q0YjgndF
 hpO3TeYNUAnBVIsgKkWTjFrC1r9U/nXPubBx8GNe5xJfvv3LilFGtJO6NrHaygaOPsbg/9BV83
 xf5kGUgiQ9UlL9QkdFaKWAMakRsvqDzPL8B7tKUHiYBAAA=
X-Change-ID: 20260219-device-match-secondary-fwnode-4cc163ec47ee
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org, brgl@kernel.org,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2381;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Y22JRh9xvQfJncGH7gL+X+J/7Dt0gtPhEvqzsi3dp5c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnssO1FWU86yfB6AvLyJgHK+Yze00jlHC3FlRh
 WgPHa+9Oi+JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZ7LDgAKCRAFnS7L/zaE
 w5lvD/9yAI5DHGZ/FJImETfgbSKTxLD3sxZaQ1Oc2FzDPzkUpOvD8pQNgFoIegRVODiLCMMWJOE
 0Ohz/IYd6IlVs6yAM1DUxRWJN5IyLghlqlFGspHTdAIKTPYHMooT1TKLGQ4Q+T+XM2lDyaWisij
 xOvbyjuYZBEf//oMlVysPN2JfhOO094nevRGtt9CmYsmzKrg15Ua12xcuMFNzXbuVmPqdDDfh4f
 fro2wxPaktgRmQQtIORDr5bquasCx9ZSIp1Va6CJFmXkngp616A7Bqv+FeNRO3GSK1yx7ZSRFN9
 5RdgTF8+AuVUTsO8kPQUvOwBgY4PdXCnkqzln/3qbWyB3Cm8472KGzW6Tpelp3In2jghXxAjaQt
 HrC8N7dM3r3repoLQpcHpXByVlwFXKDwMiYXO3k+3g8Up1Dpgz/2UyEt5hkkVFJyp31LjjaoPkR
 GvoJZt0ldhXrocSLN67fC1D1LtyfFZr5RWunoi2+gZXIGe9BcSBDbpGM6Of/htih1/3W8owsD1G
 eFhywPLvub7LFMwoPL/FBnaT4gsVcPYF2WFpolGzUjMfu23V0J8E42nLGoCj2HEEuxOiUNcVDlP
 JOAwbsYjkQi1a8YBcgUj1Gtrt3YeJvhsDmj4xHioybF7cFIMMJOp3E/sZ97TaGK+XTGaux9UIZs
 rl1iAEdc/hbcWxw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=RNe+3oi+ c=1 sm=1 tr=0 ts=699ecb15 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=GosmCm27k2yXtJg_9XwA:9 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-ORIG-GUID: Geb5YY4wQC935xgGuQ5BEcwB-27zkayb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI1MDA5OSBTYWx0ZWRfX9Xrm24lTQBSc
 KnwcmRUGDIPWJDoD9tA5+mZ0Gy09HnsA5A3I7VEwU/9RDpEU/UyhnH0/CnH6uWjHcXtNfq3RvL3
 U8DqT/EMUp1WDjBnnJiaeQ8oidI2NGevrVy+6k28qRUPXXduZGFL4kWzN8ll1E6ZMm7WXiwB2Tp
 +rocNzrXLD00FUT6DUE39khVZCAKwSjlT+cwOAapVwnFheaLB/jCxd5A0m/cypaq5Eiu+nOtMXY
 fh9t/PXzfKV15DDy246Ur4bkEN80RbB4c91C0VrxSkgX6HzeAn3sQnn6gdCNo9VpmlYBgIfTHLv
 3CC1G18DeMTtC8rUcB+RqX8Hu0a06YKuLfcsuxC8xdvP7K6R7K7Ack5k3KgoHxPJEjym/FiapHz
 prS8iAM53ThxBJT/IKEnhRL7uu6+oxt49I5bfU56EY9cEffeMoubOTyZ96kKCt0a9gmQ91JfUWw
 AgjEuNkq7FBvPtJOfmA==
X-Proofpoint-GUID: Geb5YY4wQC935xgGuQ5BEcwB-27zkayb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-24_03,2026-02-23_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 adultscore=0 priorityscore=1501 phishscore=0
 clxscore=1015 spamscore=0 impostorscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602250099

In GPIOLIB, during fwnode lookup, after having resolved the consumer's
reference to a specific fwnode, we only match it against the primary
node of the controllers. Let's extend that to also the secondary node by
reworking gpio_chip_match_by_fwnode()

Suggested-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Reviewed-by: Danilo Krummrich <dakr@kernel.org>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Link: https://lore.kernel.org/all/aZUIFiOYt6GOlDQx@google.com/
---
Changes in v3:
- Remove the controversial patch 1/2 in favor of hand-coding its
  functionality in patch 2/2
- Link to v2: https://patch.msgid.link/20260223-device-match-secondary-fwnode-v2-0-966c00c9eeeb@oss.qualcomm.com

Changes in v2:
- Fold the code initially put into driver code into GPIOLIB as advised
  by Rafael
- Rework the logic as suggested by Andy
- To that end: make fwnode_is_primary() public
- Link to v1: https://patch.msgid.link/20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com
---
 drivers/gpio/gpiolib.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..0182603de368f2125baf174fcf5f1e893917c154 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -11,6 +11,7 @@
 #include <linux/errno.h>
 #include <linux/file.h>
 #include <linux/fs.h>
+#include <linux/fwnode.h>
 #include <linux/idr.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
@@ -1395,7 +1396,16 @@ EXPORT_SYMBOL_GPL(gpio_device_find_by_label);
 
 static int gpio_chip_match_by_fwnode(struct gpio_chip *gc, const void *fwnode)
 {
-	return device_match_fwnode(&gc->gpiodev->dev, fwnode);
+	struct device *dev = &gc->gpiodev->dev;
+	struct fwnode_handle *node = dev_fwnode(dev);
+
+	if (IS_ERR(fwnode))
+		return 0;
+
+	if (device_match_fwnode(dev, fwnode))
+		return 1;
+
+	return node && !IS_ERR(node->secondary) && node->secondary == fwnode;
 }
 
 /**

---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-device-match-secondary-fwnode-4cc163ec47ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

