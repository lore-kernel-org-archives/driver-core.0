Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685810;
	b=heJ1ayn8tZyJ2NZ1fuhLcO39doRFUwWxqlHHnX50RAa1LF65b8aj7QtwZLWUVBEPppKr
	 6FV9tkAwWj4QW9GJuRt0GZMcE+05ddguVe3n2ZWZv8LwHSPWQFLS+CSijWW6QEbEd9iLL
	 wCD8nfkBLJpS2HIWbrQc7CFRNI5KtisBWB45uOdZIYDYPfY98fHQsGUb5ZcsnpW+GuemR
	 t2rjIg0ko0ypk4BwUOutOTyB/M7JvnNYgc5AOssQukuh9X+UQhAHiY24+9km1JcWZ4nYV
	 8WxmAxvatZNxuaB6R3/uaVr0ba8fv7UDHieF82nJD5V+zffrHK+tu0rj0+yDXgLwC9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685810;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=mEMMDHsUXIBzU/RTv8XkcGI1IxFzKcC8FBEMfzo53jQ=;
	b=NH/KRdUP2WwTr//WMdq1niiBO/R7oR4AXfu6Jsd0DNw24MBaBa0DQru/w2jT3+IwTdBY
	 sdT38ufRSI2Rr9W0117nN1moyQDIl0kwgqVFD1SCsAqN8bdC+VapBUUGSzaak+FUU8wRg
	 wIh8A6KwtDZE/esu38dXrcCmPcs1hQa4SU2noIMnWCNGmdTOH5KqMqihAjx02rFC0lbOx
	 yEt37mIeNQD8Kbq3bA4DjJwoRkomSNT5NDZqdf133yOCu2/d4bUfqRTFVd0VfIcSkMMVE
	 jxtFw5UBVG9eB0aaVYj09UnJzV0sjD7rEZ+zzhEUsDjDGGt4kuYeni3bGNUKpKjn9yA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dVNbdQCN;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSuWycPE;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE603606A6A1
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BE603606A6A1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=dVNbdQCN;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=jSuWycPE
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AQ7BLFe920141
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	mEMMDHsUXIBzU/RTv8XkcGI1IxFzKcC8FBEMfzo53jQ=; b=dVNbdQCN5dksSFRe
	nG7Ht4ozxLUe2nuiYweCiIKsEwsHYaZYwlahrqrzrgDDofZXccgIlto+IQwWZm9/
	vPjEZH7kGh54VLNDUIN5bLhVLGFXMN19qVi5Qh1u4aJNQWrQEwEgeInUKGph05d8
	fNiLH5qiO1JstyaGugtMkVv4XXx6GKiakXE04xkkN6IZ9aePNKSc6uhAiBeXITmO
	vNugnmKTlMYDntHdYgRZLqFbI9Cz7BcBJZwMxoHPY9dOaBPIppnaqDLyEoZBs8Y9
	prkT9LrdIK8b7MuTxzUszibL7K2JDVCrolhBuEGU858yncuzinAjbfAsEeiuBCDi
	7L9F1A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j662y2f23-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 09:36:49 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-948d83322f6so520064085a.1
        for <driver-core@lists.linux.dev>; Thu, 26 Nov 2026 01:36:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795685808; x=1796290608; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mEMMDHsUXIBzU/RTv8XkcGI1IxFzKcC8FBEMfzo53jQ=;
        b=jSuWycPEtBuxEokwNqyuHHy8KmjZUw9ohw9TUsOypyXxeD0tX0HllsWZqXKNHyFJ1e
         6cbpVL0u4EnYu2Aqj5abh9m3aYB8ClEaiy8vkoT/6m/jKh0p+stwkwQQ94PMomtYQp1v
         uz5ELlMmzS9I+zDnT1n/2XQDSOeLMLDGlHhwKLf+NauhFnNPpxT/B15dxLegPJBv57pK
         xVprSCZyXBEmvwqGDG7k9c8gGTiOx7aOYwzY5kGnzoCrs+Vo/Gwlf2OFJHY8emtgjgyg
         WOZdHvNHhI0lODXfa9f3TdJCyGiEST99zcmfCDMyR34u/L29BIykrPe2l5/DBMbZNXRN
         CYIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685808; x=1796290608;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEMMDHsUXIBzU/RTv8XkcGI1IxFzKcC8FBEMfzo53jQ=;
        b=hXbpuTYCgMEzXu+NuRfvIzKTniaT9+lTEmFZ0rujgTUtcE6cYGgP8WHSO+24ZDzWGn
         WRfA5tnYfNl3lQ209Ar/ozqkFK9wdCq3Ru/cR5IdA0kLM6MLtbCHiySxLopgZ7ntTSgf
         LbhdUzbq/mjEib8p1dKcZbscIAvNKLe/o9qo91hvjFRUVDBmmTkwakL50UHod3YT4NpC
         Sj5rZPETxnDKBKSSq3ZEWfLHYx1SBgF4CrvyzJ0QI7xNQpnGYK/6JgTDAeN1cifVKqHc
         UZyzbv23jus5xuA9qEDMNJS9/L6F/vXw2wWWto/g/0JjA0JNfJYNH7iiqlZwQOPrlRSr
         h56A==
X-Forwarded-Encrypted: i=1; AL+hErHjaxYbP9sRDP5GnM1DZB3yNAonR4F+oWTb4eBptmEUKl6q4rjrzWk7o23rFbP6Md15Ob0WOjU6IUhA6Q==@lists.linux.dev
X-Gm-Message-State: APuU4Z/7XaLqpl9T6n4F7Bu86WME6HRD/pDKc4F04JznH0rU7eX62tm4
	z1mbILoVO112Iwu5CspO5fZQ0SZa8ogZTkil2Dnt1k8rrp3Q4mAz1I1GU21yoQRQbFKdTC0VJYH
	qqbAoLyr44L2Y11joEV2tXITjq7PNTxwNU6y7qsmrBMygJ2RgnU5sFJD2DHvfFNX9BQ==
X-Gm-Gg: AZFdTZeH0oRzPpyxxS0bjbsYVgIKRnUe9wbNxOfuoV+iK/dIYW6YFUz4IcI41k6YSOh
	Z9/VhLchcg0Rg53eb2i2qRVJrpBna5+nymTh8PxOR1F9K5mswXnQiz1NFd5/wV4OWTMU6QJPyEX
	RJaKduYlLba65Tq6pYg0q89koan9UI5lQIPQsJkqHQNu9fD2FdqfZKUIlOyW/WIn6H6wfRD5pBd
	wA/4twduO4ib80C6Mov1Pksb2MUZp7jqpvtjDV3wkcZxwthb/407/qWMEWjVaI4bkdEORbtordI
	9rNlGZSdOTUpbK6JgbQq5mX7qH07iFxt5edee1WtN+iSJ4cQAW+suZbkljVJWlLNcsquTW8D7c9
	56GSMBDlfeo/ilqGCrUfdEtsjmnZKiVnBOGTAuhRQhrrK2XHxo6hIq14mFx1BE9PVeijtQ8tLEV
	6kKg==
X-Received: by 2002:a05:620a:8909:b0:949:472f:2273 with SMTP id af79cd13be357-949bab23f19mr3809033585a.58.1795685807853;
        Thu, 26 Nov 2026 01:36:47 -0800 (PST)
X-Received: by 2002:a05:620a:8909:b0:949:472f:2273 with SMTP id af79cd13be357-949bab23f19mr3809029785a.58.1795685807373;
        Thu, 26 Nov 2026 01:36:47 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb8960068fsm227079335e9.4.2026.11.26.01.36.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 01:36:46 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 26 Nov 2026 10:36:27 +0100
Subject: [PATCH v4 10/10] gpio: shared: generalize most code to firmware
 nodes
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-fwnode-for-each-prop-v4-10-d4b370ecfd52@oss.qualcomm.com>
References: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
In-Reply-To: <20261126-fwnode-for-each-prop-v4-0-d4b370ecfd52@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Hans Verkuil <hverkuil@kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Kees Cook <kees@kernel.org>, Andy Shevchenko <andy@kernel.org>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=10626;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Gllu+fpVRBJWSONhi39mHYFZzUmTb85sdWd+KAefAaA=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBrB/2VX+9i6Xly2aL2jEb6anfxeVyINM/HFm5ZC
 feHWQvBFbyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCawf9lQAKCRAFnS7L/zaE
 w3lpEACbHtfacNwl6xATHQ2Nvy8mTKiiUk7yqpL8mq5waAr+WL08JaRBQkfT0usLGhzD/gQL8rf
 z0VUl8EZmr6J9B4UGD4LaclY335PqMrMkotnYrzgWQtklvCB6h8YDH89RIfIwwHpagoCegGU48w
 hBXrsrRb3dPAyv343QrtgmACKJoa6RrrwXgIbJyp04qAONooOxeso8VxE1BkEUUe+q+42ty57cj
 eUP8wP4YwdsmrzRhLTDb1IK2AV8Qn/KTpMGz5VmA4+PxF+5yvcrk++tXTqqgneGTVh5MRL3Jskg
 vBRskLS2sQL2weWPyU3L2tNkAmAnzT32KC0zM+lCzZI/p6pSlOFF9oPXNRHseppU4YLkANceJmo
 3y9FF3JdxVvzgXnYjOCMasorPuLqneRPFp7sy9dz82NTuuBoka8xfucsgDmVwKeVWac6zC1+wLl
 9m6FSDW7+VIk/uDrqZsopZz9uGF96EtvFDnPxz+7baIEz7SEI2wYx5FMXtZGBgl8hQg8ZwIfFFi
 lJzTLzUJdvzLQ4+nsieOB5BEXQ85WlvhvnoUOkK5nnDGlcCBuYBps1f0+idTwo65nZiUnuTmBHW
 CEk5aITdfpx5t4zVVHScLAUYxNfZdSIOIXimDHmCCVu+jPHkrZM8jQTTcZ2RKN1QKAU5LLfp9vo
 8b4XcJ9cS795W/Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfXzdFGSJ5qYv4M
 2tcubo1k3T0h4FtohEbzL0xS4iWnDUHTck4jUnFre/kwK19rkSwanhbwy4YvHlEvJbSrJzSa8JF
 +7CrqUxwazKPptGBo4Jyu15r25KMxHyXWyfklo0C7Nn6um3TKmiM7dmB5EgHBfd9uYQE+rpgmAK
 nig15T0A8S0ge8/x5z/RGa68XVaM5juDajtpJeLhBHUcAghZYFq7I3DYKJVupMUhDxEq1GIGCAS
 MjuHswv2K7pkPa3EPDJHzWCkMHrQ69F2fbC08OtwPiSsGn3UTp54qL+k52QDXAt4e9pl5/lMVxJ
 qBQVKKR76RiaLqm6Ds3yRmKGGbhfi5y2mqLb8eibeoqUNxXtE6ssnyBixf+FcBUBvpLcTbPCUCI
 cRbFliHbXatpCVN3p5q6spWnELKLD/SbITOwxHWIkVPWMTrH9P+9u08rI/+GcWzLDIUFVlBToxF
 cmdfW6DdLcMXjWFxo5w==
X-Proofpoint-GUID: B7NhjsuMooZeEIRXwJEWqV9_wGK47G_O
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI2MDAzNyBTYWx0ZWRfXzNLfgDnlOKpn
 vYOatxSE/nmL9M7Wp8q5+Dxv9NxhT9IY+4OcZC3cUCNCcEvqIbWZVhdillLBfoQxLHu4+aA7/5h
 43bPCmSwpi/vp6DEfH+AfXZkdoUwA8g=
X-Proofpoint-ORIG-GUID: B7NhjsuMooZeEIRXwJEWqV9_wGK47G_O
X-Authority-Analysis: v=2.4 cv=W/KtxhWk c=1 sm=1 tr=0 ts=6b07fdb1 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=ziVQ5hnd3nnfPSIR4FkA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-26_02,2026-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 phishscore=0 malwarescore=0 adultscore=0
 suspectscore=0 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611260037

Ahead of adding support for sharing of GPIOs for other types of firmware
nodes, convert as much code in gpiolib-shared.c as possible to using
fwnode APIs and guard the remaining OF-specific bits with CONFIG_OF
guards.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-shared.c | 236 ++++++++++++++++++++++--------------------
 1 file changed, 125 insertions(+), 111 deletions(-)

diff --git a/drivers/gpio/gpiolib-shared.c b/drivers/gpio/gpiolib-shared.c
index 610d4b35d37c512eba6e8feab58dca2d9da0a152..dce93585106c712cc82da74ab582dbd4b52ca40a 100644
--- a/drivers/gpio/gpiolib-shared.c
+++ b/drivers/gpio/gpiolib-shared.c
@@ -22,7 +22,7 @@
 #include <linux/printk.h>
 #include <linux/property.h>
 #include <linux/slab.h>
-#include <linux/string.h>
+#include <linux/string_helpers.h>
 
 #include "gpiolib.h"
 #include "gpiolib-shared.h"
@@ -60,7 +60,6 @@ struct gpio_shared_entry {
 static LIST_HEAD(gpio_shared_list);
 static DEFINE_IDA(gpio_shared_ida);
 
-#if IS_ENABLED(CONFIG_OF)
 static struct gpio_shared_entry *
 gpio_shared_find_entry(struct fwnode_handle *controller_node,
 		       unsigned int offset)
@@ -126,157 +125,158 @@ static int gpio_shared_setup_reset_proxy(struct gpio_shared_entry *entry,
 }
 
 /* Handle all special nodes that we should ignore. */
-static bool gpio_shared_of_node_ignore(struct device_node *node)
+static bool gpio_shared_fwnode_ignore(struct fwnode_handle *fwnode)
 {
 	/* Ignore disabled devices. */
-	if (!of_device_is_available(node))
+	if (!fwnode_device_is_available(fwnode))
 		return true;
 
 	/*
-	 * __symbols__ is a special, internal node and should not be considered
-	 * when scanning for shared GPIOs.
+	 * On OF-systems __symbols__ is a special, internal node and should not
+	 * be considered when scanning for shared GPIOs.
 	 */
-	if (of_node_name_eq(node, "__symbols__"))
+	if (fwnode_name_eq(fwnode, "__symbols__"))
 		return true;
 
 	/*
 	 * GPIO hogs have a "gpios" property which is not a phandle and can't
 	 * possibly refer to a shared GPIO.
 	 */
-	if (of_property_present(node, "gpio-hog"))
+	if (fwnode_property_present(fwnode, "gpio-hog"))
 		return true;
 
 	return false;
 }
 
-static int gpio_shared_of_traverse(struct device_node *curr)
+static int gpio_shared_fwnode_scan_property(struct fwnode_handle *curr,
+					    const char *propname)
 {
+	struct fwnode_reference_args args;
 	struct gpio_shared_entry *entry;
 	size_t con_id_len, suffix_len;
-	struct fwnode_handle *fwnode;
-	struct of_phandle_args args;
 	struct gpio_shared_ref *ref;
-	struct property *prop;
 	unsigned int offset;
 	const char *suffix;
-	int ret, count, i;
+	int ret, i, count;
 
-	if (gpio_shared_of_node_ignore(curr))
+	/*
+	 * The standard name for a GPIO property is "foo-gpios"
+	 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
+	 * There are some legacy device-trees which have a different
+	 * naming convention and for which we have rename quirks in
+	 * place in gpiolib-of.c. I don't think any of them require
+	 * support for shared GPIOs so for now let's just ignore
+	 * them. We can always just export the quirk list and
+	 * iterate over it here.
+	 */
+	if (!strends(propname, "-gpios") && !strends(propname, "-gpio") &&
+	    strcmp(propname, "gpios") != 0 && strcmp(propname, "gpio") != 0)
 		return 0;
 
-	for_each_property_of_node(curr, prop) {
-		/*
-		 * The standard name for a GPIO property is "foo-gpios"
-		 * or "foo-gpio". Some bindings also use "gpios" or "gpio".
-		 * There are some legacy device-trees which have a different
-		 * naming convention and for which we have rename quirks in
-		 * place in gpiolib-of.c. I don't think any of them require
-		 * support for shared GPIOs so for now let's just ignore
-		 * them. We can always just export the quirk list and
-		 * iterate over it here.
-		 */
-		if (!strends(prop->name, "-gpios") &&
-		    !strends(prop->name, "-gpio") &&
-		    strcmp(prop->name, "gpios") != 0 &&
-		    strcmp(prop->name, "gpio") != 0)
-			continue;
-
-		count = of_count_phandle_with_args(curr, prop->name,
-						   "#gpio-cells");
-		if (count <= 0)
-			continue;
+	count = fwnode_property_count_references(curr, propname, "#gpio-cells");
+	if (count <= 0)
+		return 0;
 
-		for (i = 0; i < count; i++) {
-			struct device_node *np __free(device_node) = NULL;
-			char *con_id __free(kfree) = NULL;
+	for (i = 0; i < count; i++) {
+		char *con_id __free(kfree) = NULL;
 
-			ret = of_parse_phandle_with_args(curr, prop->name,
-							 "#gpio-cells", i,
+		ret = fwnode_property_get_reference_args(curr, propname,
+							 "#gpio-cells", 0, i,
 							 &args);
-			if (ret)
-				continue;
+		if (ret)
+			continue;
 
-			np = args.np;
+		struct fwnode_handle *fwnode __free(fwnode_handle) = args.fwnode;
 
-			if (!of_property_present(np, "gpio-controller"))
-				continue;
+		if (!fwnode_property_present(fwnode, "gpio-controller"))
+			continue;
 
-			/*
-			 * We support 1, 2 and 3 cell GPIO bindings in the
-			 * kernel currently. There's only one old MIPS dts that
-			 * has a one-cell binding but there's no associated
-			 * consumer so it may as well be an error. There don't
-			 * seem to be any 3-cell users of non-exclusive GPIOs,
-			 * so we can skip this as well. Let's occupy ourselves
-			 * with the predominant 2-cell binding with the first
-			 * cell indicating the hardware offset of the GPIO and
-			 * the second defining the GPIO flags of the request.
-			 */
-			if (args.args_count != 2)
-				continue;
+		/*
+		 * We support 1, 2 and 3 cell GPIO bindings in the
+		 * kernel currently. There's only one old MIPS dts that
+		 * has a one-cell binding but there's no associated
+		 * consumer so it may as well be an error. There don't
+		 * seem to be any 3-cell users of non-exclusive GPIOs,
+		 * so we can skip this as well. Let's occupy ourselves
+		 * with the predominant 2-cell binding with the first
+		 * cell indicating the hardware offset of the GPIO and
+		 * the second defining the GPIO flags of the request.
+		 */
+		if (args.nargs != 2)
+			continue;
 
-			fwnode = of_fwnode_handle(args.np);
-			offset = args.args[0];
+		offset = args.args[0];
 
-			entry = gpio_shared_find_entry(fwnode, offset);
-			if (!entry) {
-				entry = kzalloc_obj(*entry);
-				if (!entry)
-					return -ENOMEM;
+		entry = gpio_shared_find_entry(fwnode, offset);
+		if (!entry) {
+			entry = kzalloc_obj(*entry);
+			if (!entry)
+				return -ENOMEM;
 
-				entry->fwnode = fwnode_handle_get(fwnode);
-				entry->offset = offset;
-				INIT_LIST_HEAD(&entry->refs);
-				mutex_init(&entry->lock);
+			entry->fwnode = fwnode_handle_get(fwnode);
+			entry->offset = offset;
+			INIT_LIST_HEAD(&entry->refs);
+			mutex_init(&entry->lock);
 
-				list_add_tail(&entry->list, &gpio_shared_list);
-			}
+			list_add_tail(&entry->list, &gpio_shared_list);
+		}
 
-			if (strends(prop->name, "gpios"))
-				suffix = "-gpios";
-			else if (strends(prop->name, "gpio"))
-				suffix = "-gpio";
-			else
-				suffix = NULL;
-			if (!suffix)
-				continue;
+		if (strends(propname, "gpios"))
+			suffix = "-gpios";
+		else if (strends(propname, "gpio"))
+			suffix = "-gpio";
+		else
+			suffix = NULL;
+		if (!suffix)
+			continue;
 
-			/* We only set con_id if there's actually one. */
-			if (strcmp(prop->name, "gpios") && strcmp(prop->name, "gpio")) {
-				con_id = kstrdup(prop->name, GFP_KERNEL);
-				if (!con_id)
-					return -ENOMEM;
+		/* We only set con_id if there's actually one. */
+		if (strcmp(propname, "gpios") && strcmp(propname, "gpio")) {
+			con_id = kstrdup(propname, GFP_KERNEL);
+			if (!con_id)
+				return -ENOMEM;
 
-				con_id_len = strlen(con_id);
-				suffix_len = strlen(suffix);
+			con_id_len = strlen(con_id);
+			suffix_len = strlen(suffix);
 
-				con_id[con_id_len - suffix_len] = '\0';
-			}
+			con_id[con_id_len - suffix_len] = '\0';
+		}
 
-			struct fwnode_handle *curr_fwnode =
-				fwnode_handle_get(of_fwnode_handle(curr));
-			ref = gpio_shared_make_ref(curr_fwnode, con_id, args.args[1]);
-			if (!ref) {
-				fwnode_handle_put(curr_fwnode);
-				return -ENOMEM;
-			}
+		ref = gpio_shared_make_ref(fwnode_handle_get(curr), con_id, args.args[1]);
+		if (!ref) {
+			fwnode_handle_put(curr);
+			return -ENOMEM;
+		}
 
-			if (!list_empty(&entry->refs))
-				pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
-					 entry->offset, fwnode_get_name(entry->fwnode));
+		if (!list_empty(&entry->refs))
+			pr_debug("GPIO %u at %s is shared by multiple firmware nodes\n",
+				 entry->offset, fwnode_get_name(entry->fwnode));
 
-			list_add_tail(&ref->list, &entry->refs);
+		list_add_tail(&ref->list, &entry->refs);
 
-			if (strcmp(prop->name, "reset-gpios") == 0) {
-				ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
-				if (ret)
-					return ret;
-			}
+		if (strcmp(propname, "reset-gpios") == 0) {
+			ret = gpio_shared_setup_reset_proxy(entry, args.args[1]);
+			if (ret)
+				return ret;
 		}
 	}
 
-	for_each_child_of_node_scoped(curr, child) {
-		ret = gpio_shared_of_traverse(child);
+	return 0;
+}
+
+static int gpio_shared_fwnode_scan_properties(struct fwnode_handle *curr)
+{
+	char **props;
+	int ret, i;
+
+	ret = fwnode_property_get_names(curr, &props);
+	if (ret <= 0)
+		return ret;
+
+	CLASS(strarray, names)(props, ret);
+
+	for (i = 0; i < names.n; i++) {
+		ret = gpio_shared_fwnode_scan_property(curr, names.array[i]);
 		if (ret)
 			return ret;
 	}
@@ -284,19 +284,33 @@ static int gpio_shared_of_traverse(struct device_node *curr)
 	return 0;
 }
 
-static int gpio_shared_of_scan(void)
+static __maybe_unused int gpio_shared_fwnode_traverse(struct fwnode_handle *curr)
 {
-	if (of_root)
-		return gpio_shared_of_traverse(of_root);
+	int ret;
+
+	if (gpio_shared_fwnode_ignore(curr))
+		return 0;
+
+	ret = gpio_shared_fwnode_scan_properties(curr);
+	if (ret)
+		return ret;
+
+	fwnode_for_each_child_node_scoped(curr, child) {
+		ret = gpio_shared_fwnode_traverse(child);
+		if (ret)
+			return ret;
+	}
 
 	return 0;
 }
-#else
+
 static int gpio_shared_of_scan(void)
 {
+	if (IS_ENABLED(CONFIG_OF) && of_root)
+		return gpio_shared_fwnode_traverse(of_fwnode_handle(of_root));
+
 	return 0;
 }
-#endif /* CONFIG_OF */
 
 static void gpio_shared_proxy_dev_release(struct device *dev)
 {

-- 
2.47.3

