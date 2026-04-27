Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 326003B3BE2
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 12:19:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777292369; cv=none; b=baoLqzKZcuvyME/HZe0suTPMG+lDHXfUXpNxiREO7USTIS2bkcydiZyD4639hpGSqPbBRBLW9EIjWY56ekZh5lKH0w8rHLFbD64TPVUc8/jDANDI1zwEYnnXiTIVgkxSJ4CfYSmD7Hr3T2xs8C0T82QYgPD8iiDJtUZFWJTvDEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777292369; c=relaxed/simple;
	bh=l4lnny3dGBJZoHOBatk5qgjCf18AZd9xMDIK67fuBWk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nKtshsU4p1ZAiM1aE5sLCk2sUjHUI60NS2FrfJ9meHfa8Cp/zLNDwSiQICJJWjCGKbWHA0/ExWUYNUna5AqemVaYWfoqLqT5RiI7+X/J0FrGYrIBp8NUFbNoe3qHiq+8ZUOTxBRQMf46B/PXp0u73Sc/qYIufJWehcqUTq0Ur0Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=WsivgD1E; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=Icjz+Svu; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="WsivgD1E";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Icjz+Svu"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAVQ2793074
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 12:19:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	iM/iRe3Y9krYEM1ss3kFNB7NzrAjyV60b2tj+n+iAZU=; b=WsivgD1Ea/rClQoc
	gvrzbgIgWeTvUJ70PJEPQQ3Lj9f08eUW9ZybG6HWQUahQ5hRMfSBC7ZHnOVHQZ3u
	t26r9B0hry12hpfYcqvnuqHoB09roK6skdvuZabCcHi0+bnozcIezMNB9Umy8DWt
	z5bv1N2gHl+VweZgqEgtvOtBmdS0CJL8Uvz2WjLa6PbLjUFaX5rq8Lz8kZ8Yo9j4
	TlEkFP4YuGEZhvl7GQ/y/utypQNp5yQ+KYqMJGF4LfNxladVTDB3pKpuAMb/57MU
	2oQQ6fIKYqkrdl38oq+Eo5GfxJyhrzP0nQpVqIF8VW05IXsbYRK6T8ohgUDYcdTz
	yUbCDw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uv3yp-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 12:19:27 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-56ef11518d3so17810810e0c.3
        for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 05:19:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777292366; x=1777897166; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iM/iRe3Y9krYEM1ss3kFNB7NzrAjyV60b2tj+n+iAZU=;
        b=Icjz+Svu0IJx3USGy9z6HuXTCo3iWNO7eAB4k7BLNkh6kmM6QuEsKoDp7u9/NMVM/u
         tvaKTQeNkqPjL/dSoQelJWVE5FLtksQnm+Vk7wRKS0TDrloNIv2QKjqBw6Jbb8St/gxI
         Xztp2aKNaXHyKBG9z40AfGLffytvVu4qctGA2ihhDhGOZGR36huJOiczQP6Ea6HVhJUI
         H2bdr/YqzZAyMrlG1xgMeVI7k5Tvyw43Nl0lGPPWgI/pT1ygiOp/2puIg4wdawPzY38+
         HLuqHxujxqN8xh/xIUSIgs7baa/3F/W3aqe+yeHzCNiukj4jREqMInkMXcEElw4bywtw
         d7VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777292366; x=1777897166;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iM/iRe3Y9krYEM1ss3kFNB7NzrAjyV60b2tj+n+iAZU=;
        b=RzHiTBiCFFRdcShm6KSUGTwtiiEDtpkuofgDyzMK4uklFSrDCwTrVz0K3iJTK5wA8b
         1qsrI/uDgnLm/g+07EfNAc0CA5g5FN4v8Nli/cHwUvZ8xtUO2rDIR8P7ikFOHmoPnewV
         pD6oXuvfzEnt2kUeU775j52J4TJexpTM7puh0ASK5lMnRB9isu7mE6Tyqz/D5d4StBv2
         8G2AKcfNUW/m1HeBhO91QfvOU+Y8MxZgq63Y8zptjBAWlUugvde05edlp8h33XqDpTBA
         Su8Fb344HQsS/hSMvnWsBXqMJG0kzfY9Bkuw6WZJoFdk1UYj5OXEZTpxIyQifFLcqnhn
         f8uA==
X-Forwarded-Encrypted: i=1; AFNElJ/Xc+WVCGwbftgJ7WB+bD3hUJUOcg9lVQKDLfckGnylR37H7NlWdS4+Iolq8YG+BvuhI9h+mufcEz1Cag==@lists.linux.dev
X-Gm-Message-State: AOJu0Yw6Z01NdxVn2Yy9IMQFoOXgRRLMq6J2kpQ6fxC49gctlBTOHywr
	0USzLizN/o9Ql3QX4LUD+m3il42+LoV8k9AHqKsAfLpmja6mR4CELOBHXUzR8aHagsp76YaNKj5
	F9nEMm584yQ8d0X5DR619XzqcmsAZEplQcLV718n1oZxFep6EfICXsydoGdaT5WvtfA==
X-Gm-Gg: AeBDieuYWiVELRHHi5ZiGb4W0M1S27iFQLWtiLviSUyuqfWbyvwpt4lqKBMKrOEETCr
	DAWZaOLv+ymZLg14ojpfN5Yk9uHziQWdbY+BcOQOxqVSEUq8EpTJb4RWUIEzwfHj/83jF1Rr+L4
	+pDZTSsvgQb6+VMkBSnNkMTQ/uBrdZCDZKeiYLjSZ5fTeasI875LsHGUE1jB4Sj2hwsqKjxsgrN
	5YpQB9xrVWLbLVvDcAQ9RxJxtsFZvZtcBAF69qsW5v+w3RGflbuo7/t2MgmA13vec3IkBhalMpH
	LBuEkJNuT7JPJTlZRts2cmgHuaiXn9fh9PcenR/R2djHp1fbLnw/s6F311qDiMkP5R89440nYca
	SWIUosRo8gac04+y7f7vm7C46RgMrSnhZssAkSCRLawPtzT638W5GZjjmLZ/bJA==
X-Received: by 2002:a05:6122:45a0:b0:56e:f1d2:c3ca with SMTP id 71dfb90a1353d-56fa587e117mr23130380e0c.2.1777292366123;
        Mon, 27 Apr 2026 05:19:26 -0700 (PDT)
X-Received: by 2002:a05:6122:45a0:b0:56e:f1d2:c3ca with SMTP id 71dfb90a1353d-56fa587e117mr23130321e0c.2.1777292365598;
        Mon, 27 Apr 2026 05:19:25 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:83be:e944:7b0e:ef3d])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4891bb3d121sm882844295e9.14.2026.04.27.05.19.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 05:19:24 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 14:19:11 +0200
Subject: [PATCH v3 2/2] platform/x86: x86-android-tablets: enable fwnode
 matching of GPIO chips
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-baytrail-real-swnode-v3-2-0003e4c1708c@oss.qualcomm.com>
References: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com>
In-Reply-To: <20260427-baytrail-real-swnode-v3-0-0003e4c1708c@oss.qualcomm.com>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Mika Westerberg <mika.westerberg@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Hans de Goede <hansg@kernel.org>,
        =?utf-8?q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Len Brown <lenb@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org,
        platform-driver-x86@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5641;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=l4lnny3dGBJZoHOBatk5qgjCf18AZd9xMDIK67fuBWk=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp71RFQPCa08eCDZLrsx3NrxOmhQb+WV6JL+Q9e
 /PvrPWI3IyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae9URQAKCRAFnS7L/zaE
 w6G0D/9vQO3vVjL4oGvGOqANm4yOADnbbRmTrXxnt0HaNS2ePiUIHzIP+11cmq1rxlNgzdLs3P5
 uEf9NFzJPpQCCuy+/jjF47XrvZ/sw4IlCgyhPuCmTwcDttVtA/CqtDLM97EKyLmMG/Nd6OBoLHz
 DsGdBaIq7JEJwUDQ0aSVV28rbS1qj7hhJuSCkBuF5QiH5yY/dB5MrtuQnzVZJ61h58hObXtejX6
 iDjtPZb/cy6KPKH//q/KwhdSLuB8A7m90bECsQgslk2nLMRPWdSUTo+W0GfWK8O3cGk7OTLXm9Y
 HXz0uZqLHR6hltlMU2O7Qnh0zUf8nywg7dS3M6plhh0jvIUXaaVbRuS3V0RpopsLFcyE5gYXGV0
 jDwmkFeAU2GCMrC+4JmJKiEYbz2Wp/TGTxmuQ7tYeS3Nk/uNjkRolZ9570M+ZmX6AbHx0uUxo9D
 2UWEY417Io21ladfzxNEDWMsYDqGeAjaKSC/O+dYsgiQfe5T90qauuGl28N+HNP6qCigk/F/Ie9
 GoJNwVuc5ryz7XvJP4rLoBeVAj32TI2T/DqJgO5NfLiTPIcU4tzul5Ujpny1OqszYkenqo0HBOv
 5C1tdqMDtVnAd8xVLQfDh9Kdrj9cz1Bsry0XmD4AKvnqWTz7k63v5DXm2vtEIZc09m8C7Biggdq
 lO0Hm3DvTKIboRg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: P7L4iZJuya-MhbQ-9F12Yvhk9EkdTcHc
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDEzMCBTYWx0ZWRfX0VI/+OThA1iQ
 /RyLrgMd3IKCoAaRBbF0X6fcM5aUO90MhH9WwPCpkvkVE0Kcym+/rM8JqzZGSlSxKSNZnKWD4TR
 rX+s3FzfXgRHpeYTkSNX4IBcdOJEGWvup4HqxJ4C+oY1mDogaiu+C5Gq1zXLzP34lM9w+NKTeW7
 9Ow4s/RVH9m5RXHpBDOYtboYknkkwnPS5Pnh7mgqpJWvQ4sjzXRE9RTJlGQ8K8521opsCb2mStO
 tG+pRz9Dq88acmcnGlU94F5lfZ5OrXXuPRI9L5+Z8HPz+MJT92Ft8JVzY+17cPQhF9aWF0K8ztJ
 0beGnRvu+igtXNtwuT2F0zyEkDl2Wmnw5wl2rp1oDRl2R6xuDEz+8aO3+lOtos6MRLBwtIQcJ+x
 UJNS+WITAYdIePSKO5Mwfxeox4ZzcL48oTeES+y6u+TW1HDN8f5oc8KhSN+Ny4oDZaRkrlta+uD
 ZZluDTNbISyQFAgf07w==
X-Proofpoint-ORIG-GUID: P7L4iZJuya-MhbQ-9F12Yvhk9EkdTcHc
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef544f cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=6VCG6zWJw881NgsJBYMA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270130

In order to allow GPIOLIB to match cherryview and baytrail GPIO
controllers by their firmware nodes instead of their names, we need to
attach the - currently "dangling" - existing software nodes to their
target devices dynamically.

We deal with devices described in ACPI so set up a bus notifier waiting
for the ADD events. We know the name of the device we're waiting for so
match against it and - on match - assign the appropriate software node
as the secondary firmware node of the underlying ACPI node. In case the
event was emitted earlier than this driver's probe: also make sure the
device was not added before.

Scheduling fine-grained devres actions allows for proper teardown and
unsetting of the secondary firmware nodes.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/platform/x86/x86-android-tablets/core.c | 127 +++++++++++++++++++++++-
 1 file changed, 124 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/x86/x86-android-tablets/core.c b/drivers/platform/x86/x86-android-tablets/core.c
index 021009e9085bec3db9c4daa1f6235600210a6099..9e6e8f272dfe16cda421b569802045c3d94fc0ab 100644
--- a/drivers/platform/x86/x86-android-tablets/core.c
+++ b/drivers/platform/x86/x86-android-tablets/core.c
@@ -13,10 +13,12 @@
 #include <linux/acpi.h>
 #include <linux/device.h>
 #include <linux/dmi.h>
+#include <linux/fwnode.h>
 #include <linux/gpio/consumer.h>
 #include <linux/gpio/machine.h>
 #include <linux/irq.h>
 #include <linux/module.h>
+#include <linux/notifier.h>
 #include <linux/pci.h>
 #include <linux/platform_device.h>
 #include <linux/serdev.h>
@@ -360,6 +362,124 @@ static const struct software_node *cherryview_gpiochip_node_group[] = {
 	NULL
 };
 
+struct auto_secondary_data {
+	struct notifier_block nb;
+	struct device *parent;
+};
+
+static void auto_secondary_unset(void *data)
+{
+	struct fwnode_handle *fwnode = data;
+
+	fwnode->secondary = NULL;
+}
+
+static int acpi_set_secondary_fwnode(struct device *parent, struct device *dev,
+				     const struct software_node *const swnode)
+{
+	struct acpi_device *device = to_acpi_device(dev);
+	struct fwnode_handle *fwnode;
+	int ret;
+
+	fwnode = software_node_fwnode(swnode);
+	if (WARN_ON(!fwnode))
+		return -ENOENT;
+
+	fwnode->secondary = ERR_PTR(-ENODEV);
+	device->fwnode.secondary = fwnode;
+
+	ret = devm_add_action_or_reset(parent, auto_secondary_unset, &device->fwnode);
+	if (ret)
+		dev_err(parent, "Failed to schedule the unset action for secondary fwnode\n");
+
+	return ret;
+}
+
+static int acpi_auto_secondary_notifier(struct notifier_block *nb,
+					unsigned long action, void *data)
+{
+	struct auto_secondary_data *auto_sec = container_of(nb, struct auto_secondary_data, nb);
+	const struct software_node *const *swnode;
+	struct device *dev = data;
+	int ret;
+
+	switch (action) {
+	case BUS_NOTIFY_ADD_DEVICE:
+		for (swnode = gpiochip_node_group; *swnode; swnode++) {
+			if (strcmp((*swnode)->name, dev_name(dev)) == 0) {
+				ret = acpi_set_secondary_fwnode(auto_sec->parent, dev, *swnode);
+				return ret ? NOTIFY_BAD : NOTIFY_OK;
+			}
+		}
+		break;
+	default:
+		break;
+	}
+
+	return NOTIFY_DONE;
+}
+
+static void auto_secondary_unregister_node_group(void *data)
+{
+	const struct software_node **nodes = data;
+
+	software_node_unregister_node_group(nodes);
+}
+
+static void auto_secondary_unregister_notifier(void *data)
+{
+	struct notifier_block *nb = data;
+
+	bus_unregister_notifier(&acpi_bus_type, nb);
+}
+
+static int auto_secondary_fwnode_init(struct device *parent)
+{
+	const struct software_node *const *swnode;
+	struct auto_secondary_data *data;
+	int ret;
+
+	ret = software_node_register_node_group(gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(parent,
+				       auto_secondary_unregister_node_group,
+				       gpiochip_node_group);
+	if (ret)
+		return ret;
+
+	data = devm_kzalloc(parent, sizeof(*data), GFP_KERNEL);
+	if (!data)
+		return -ENOMEM;
+
+	data->nb.notifier_call = acpi_auto_secondary_notifier;
+	data->parent = parent;
+
+	ret = bus_register_notifier(&acpi_bus_type, &data->nb);
+	if (ret)
+		return ret;
+
+	ret = devm_add_action_or_reset(parent,
+				       auto_secondary_unregister_notifier,
+				       &data->nb);
+	if (ret)
+		return ret;
+
+	/* Device may have been already added. */
+	for (swnode = gpiochip_node_group; *swnode; swnode++) {
+		struct device *dev __free(put_device) =
+			bus_find_device_by_name(&acpi_bus_type, NULL, (*swnode)->name);
+		if (dev) {
+			ret = acpi_set_secondary_fwnode(parent, dev, *swnode);
+			if (ret)
+				return ret;
+		}
+	}
+
+	return 0;
+}
+
 static void x86_android_tablet_remove(struct platform_device *pdev)
 {
 	int i;
@@ -391,7 +511,6 @@ static void x86_android_tablet_remove(struct platform_device *pdev)
 
 	software_node_unregister_node_group(gpio_button_swnodes);
 	software_node_unregister_node_group(swnode_group);
-	software_node_unregister_node_group(gpiochip_node_group);
 }
 
 static __init int x86_android_tablet_probe(struct platform_device *pdev)
@@ -427,9 +546,11 @@ static __init int x86_android_tablet_probe(struct platform_device *pdev)
 		break;
 	}
 
-	ret = software_node_register_node_group(gpiochip_node_group);
-	if (ret)
+	ret = auto_secondary_fwnode_init(&pdev->dev);
+	if (ret) {
+		x86_android_tablet_remove(pdev);
 		return ret;
+	}
 
 	ret = software_node_register_node_group(dev_info->swnode_group);
 	if (ret) {

-- 
2.47.3

