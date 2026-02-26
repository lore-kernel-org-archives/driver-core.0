Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9DFC3A0EBD
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 09:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772099809; cv=none; b=qXBYpWPieQj4S1DXiA6ftX5GA+CY3dg8LZbCmokeJtKElxSd6t5AVGZsqANUhlpuHa2J5XgRuZmWH3e4WFPRoTSQhn4ZZkwOmwkc2bUiRTo4ltoku+WMfWzrDVJGokarVMBUF09cgfWx8ONdyBQd5jfW/BT/8V4HumDKnPY85uQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772099809; c=relaxed/simple;
	bh=kItaKAqyxjdvGZtBXO3UKNJA2wkkDFA5lJJiBNSJYJg=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=H7carcmY95OHWHQBCVzlqSYyQG5Vv6b1g4QqEhTUwL7YlWSzwzn1PbR54AVPNte+Sxvubt41el6bFuSSXr86k3+z59BSIhtETFLZsmywkMfKucliXx/LELSN4rpQVIxGuPkFQlrPLs+bEfvWg3mDqp9pdnFGnuSZN+OOZglqww8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=AQOHqq+H; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SZAMQgOV; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="AQOHqq+H";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SZAMQgOV"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61Q4Vlu31280897
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 09:56:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=B/JzSCAM22A18oBaej0zWP
	9dP40bO9wNTPlDvXSSlGw=; b=AQOHqq+Hm8bZ6Xlpyyxj9IACVBM4R2qLUWDl6l
	o/1yd6D+ZsHNdRWdvjgEtWYkz1nqEBrorNQ0LL2aKQkEQJW/SB/5gKmwK7+mlc5t
	ESgycFiaFZ906lauHCmn0YFL15guTpMFfHvyuEbqlF+R+0NccFX25K6xFXYxtIdJ
	JysS6HeoiW8pNLtOuEsE+53m1zIv2Mb+OhhdopNwEIj0WJpTvEGuxIf3MswWVaR5
	JEDLLJ4gKDWTI5p6k/+81cf4UEbpNNwO76oBzAiqOqIS3z6sjvVMrDygMUBHt3Yb
	mEfwn2wt+M1f/c29cv8H+y/bpK0KlhzIhik1oOQ0AbU5E8pQ==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4chx39m80s-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 09:56:45 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-896f84e69b6so110032886d6.0
        for <driver-core@lists.linux.dev>; Thu, 26 Feb 2026 01:56:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1772099804; x=1772704604; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=B/JzSCAM22A18oBaej0zWP9dP40bO9wNTPlDvXSSlGw=;
        b=SZAMQgOV+C5D2kHf9NELgNWR4Rt0FDLy/xGpqKZPlf3XkzbbenqVdZDLAQO5xyr8qG
         T7P8B0x3VKYYL1d74sy57Z0B/giLgYSHiI5xzAnaKnW3DsQBOh2iQdSPT6KPUGD4q9zg
         xiLp2cwPWKqMPvTM5CftK5fO5Jt8WYxYSXxRqwr0AFBuKJNlQS8ga6H0bbnWqWaxjjJw
         CJVKCepdKlVudRBw0N1bc0KNtBt+TjpKO4YaAwTfjtqDs9RNcBxlzoObKrNl1+zyTLD1
         6HAjG0XZUbWlcTLimzQGfqEc6AAkc/RtA5XvGKVVEypGUdhThj4uAckMewvosR0kf3OA
         CKQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772099804; x=1772704604;
        h=cc:to:message-id:content-transfer-encoding:mime-version:subject
         :date:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B/JzSCAM22A18oBaej0zWP9dP40bO9wNTPlDvXSSlGw=;
        b=Qebxkb4bTSwhAP2iW1E+NP9omLoCwCqU19smnOb1AxfboQ1gU9uVIX8sJvAOrHkxkR
         CerncnXNOdHybtSssgkI2YSIMHN/odWtTUOpZOoXWsO+tF4ORhRIFWGaVTq6tHBfZ0cj
         M+an3dVc3gKCZSEhj5ZmDgxkZWV4LU+A9JjVg2u/5WKwg3uRdyLz5FoifypF//6xJA4Z
         7Ee8N9rP7aiuZ2d0HKjS3qY1fr6KFHOYxivnQOl2lzt4epO4jU1d2+mAn2J2QkcRPjWo
         ON+QlReyAmxVPxIcX72NtaERcPWosplhkkBPI7NpWlI8tXMzxzlt2yCIz0EgUtfGnTSq
         YbnQ==
X-Gm-Message-State: AOJu0Yz6zdngUeJ/QEKLsnJfoXhf99InWr7VdVTqKxuGYXlgjozRDEA/
	W0B35nGiqu+/+qChQvN87JgYEM/oYomrHCkFRquRDnC0iQPw8zHV/G4btZf/aYdsfa4gvgSSv4r
	KGmWbK1wxFNcjU9Q/VxCMHzDjUYVvRofL9Y764ujsSmlycIfZQL1uV3qdWDLCXmPPXA==
X-Gm-Gg: ATEYQzy8uxYNI+ZE9JQgVo9PbQxSM6ibxshLOe6/9SYP3JfItbomG6JqXcOFSROZGC2
	l7dWGNpO9Z2FJpZH02L+n+hsBxFprOCGHYMh4QDS6wFdQ5BEXwBKgMlkoMfQkP+c9stAIG8AJb7
	UQGSAeHlEtTNhWHNp7ZhKd1Yc7a/IUwwC4Qn7T9QSeSzBAqD/+enpcdmMvI5jZbVVllHAz191Uo
	G48DGag/0GxfJtv1nU/9amu/TAFA0de8uJR+qdsK4eSc8aJklwxsgQAA+cxyZ0YK2DWnwpe+Opa
	4de5sJMJShg2srNMdb226yR3rALxntZatv2gxEAKxVj7h4ER/9OZ3zII3cL/c1PEDd4qMNnXYcM
	IgKIblORDTv2U5OoaW+QrNYJ1uvu31TU9aB0JxYsJvN6v4D6f/gA=
X-Received: by 2002:a05:620a:19a1:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cbbcdee7a6mr464043885a.0.1772099804265;
        Thu, 26 Feb 2026 01:56:44 -0800 (PST)
X-Received: by 2002:a05:620a:19a1:b0:8ca:ffe3:33a3 with SMTP id af79cd13be357-8cbbcdee7a6mr464041185a.0.1772099803749;
        Thu, 26 Feb 2026 01:56:43 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:961d:5276:3187:97af])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483bd75dfaasm114555355e9.12.2026.02.26.01.56.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Feb 2026 01:56:43 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Feb 2026 10:56:36 +0100
Subject: [PATCH v4] gpiolib: match secondary fwnode too in
 gpio_device_find_by_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260226-device-match-secondary-fwnode-v4-1-27bd0cfbd8c6@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIANMYoGkC/43NTQrCMBAF4KtI1o7kv9aV9xAXcTLagG000Wopv
 bvRlQtFNwNveHxvZJlSoMxWs5El6kMOsStBz2cMG9cdCIIvmUkuLZeiBl9KSNC6CzaQCWPnXRp
 gf+uiJ9CIwipCXRGxYpwS7cP95W+2JTchX2IaXnO9eH7/lXsBHJzVtPS6MnqH65jz4nx1R4xtu
 yiHPQd6+YZK9QuVBa2tRc6xJqLdF1S9o+YXqkCAq4SR3GihjPuATtP0ACzu92d7AQAA
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2534;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=kItaKAqyxjdvGZtBXO3UKNJA2wkkDFA5lJJiBNSJYJg=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpoBjVuYrsaIA4liDr72biMiWiwhj3FioVCfPax
 k5Fj9gLfQaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaaAY1QAKCRAFnS7L/zaE
 w1aIEACC8eLH11eTqfdYIXHAIFmnXDcFGpxvziZdR8E0LModLvOxjY1VciCd5ihIlA6DHfFHTlH
 ZpiX+ZaFKOMXoWB/ks4mbt0VQ0C8G+aodw7TZe81C+k+a5NPI4rE1wWUS6RDcIrC605gRdPqKcN
 IG/xwy/DAHOGSM7h6XUXo5ZkltnrjkE+YJeTl8UWtFqG6MpVT1EPTN6VkDKSvY6OPrs6wbWhicS
 DNDAJ78+VXmvzzAaTYb2+el2C/eosZGNGbEIj1bYszAuV+il2sMoGbhJcyI7prh5nxZ7tDvrOve
 9SEtVjyP0xTtK5vHtoDEg5zHtLuc31ZFD7Qfjyo1zseeUvUp6SPuAH+tCHst3v+FLajgJyn6g0U
 rA1XcA4pT7qRy0h3aZu7uZO9MeJQ0es52O3gomVZnxTPCre+DRcjHoYXuGyh4GbOqLXlVGs2XpK
 q5gJvQOR8ZNsLTXn5Sq+SmpPQdytWIf4d7lhBFy10C9TM9P7sonjNakgSWiVqVQkmCEPjFGaGZX
 tLuCgdKT02BlCJ1JfNllnNqTRITJXJEryfj8n0U0ab3b7BbZEgvcIfZWlp2YHRiyvyY78cliGJT
 2HWMxAxrVRr+8OO62Thg85kNqLOsaILB5738KnnMatqh+L4pYjs2kpo1/LSzOFuvYFbO4z/W+Zu
 830xOemrGD7BLOQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjI2MDA4OSBTYWx0ZWRfX5rs6bAjD3ct/
 94hBGytpuHkmbHZvfCgeqIfuyGI1RDhGzMZ1UDDtIX0IMwZptvIk57sPMBynfOjip9iDvzBJWqG
 J8/lA7EzEE+TTjR6tqc+eJHVuiLzdh4+yuPlRFP9f1d/q8WnMz7tSRsPtM400+j0R8/fSGv1jqp
 yaZxTz59KNawGfc/xz2GvBaWrLK+AYbE5OPhOHBDA1rhNLFoP7Yqio7YZFAmxMX8KhMDi7lQ0yA
 zZpHurCzdqqm1JI4pFdrhuNcc6k+b3SdSIromjRt+leBWcgJ5jrVypy0nPWnIN3z8ggM52LQDoF
 BMV1KD9n01vpVIf3K+Rim0O+pncTAxvKvWUaC6q3O03NznevM0iLJHJGRECX/j5S628Ni12r5nm
 QXU4m/Ysv68H0BFFRaqd2Fprx8KSwXpkPZCquEot9dv75BR80DRWaTFdeIx48gb9ym4cB75x21x
 r1MSXu1BhGawk+slKTg==
X-Authority-Analysis: v=2.4 cv=FvoIPmrq c=1 sm=1 tr=0 ts=69a018dd cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=VwQbUJbxAAAA:8
 a=1XWaLZrsAAAA:8 a=bC-a23v3AAAA:8 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=GosmCm27k2yXtJg_9XwA:9 a=QEXdDO2ut3YA:10 a=1HOtulTD9v-eNWfpl4qZ:22
 a=FO4_E8m0qiDe52t0p3_H:22
X-Proofpoint-GUID: _e6dahJCipq4ts3t8uHx-ZI6oCLHsmTL
X-Proofpoint-ORIG-GUID: _e6dahJCipq4ts3t8uHx-ZI6oCLHsmTL
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-25_04,2026-02-25_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 impostorscore=0 priorityscore=1501 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602260089

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
Changes in v4:
- Drop redundant !IS_ERR(node->secondary) check
- Link to v3: https://patch.msgid.link/20260225-device-match-secondary-fwnode-v3-1-a7152054135a@oss.qualcomm.com

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
index c52200eaaaff82b12f22dd1ee8459bdd8ec10d81..780e30a033859578dabe3eda984e74db200507f7 100644
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
+	return node && node->secondary == fwnode;
 }
 
 /**

---
base-commit: 50f68cc7be0a2cbf54d8f6aaf17df32fb01acc3f
change-id: 20260219-device-match-secondary-fwnode-4cc163ec47ee

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

