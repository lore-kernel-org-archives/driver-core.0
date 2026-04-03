Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803ED3368AB
	for <driver-core@lists.linux.dev>; Fri,  3 Apr 2026 13:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775224333; cv=none; b=hnA44b6t9Nr9+IN+t8+7H84jBxUrwbZYkjyksZGRptyi27AiYOZqi6ZjWU+SEJrFGhR7Nog3IslodeeiB+aeGct6Z9XKVlqTFldQs15n24vz1ljByMWgiWU7/lB8wIOS0SlhE3AKNcJxsyI9+r/EAjUOPEwsOD43Z36cRvAagkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775224333; c=relaxed/simple;
	bh=tSBsw89+EgLqL9rsGM6nffcOTxXCKvBjsnCc9VJADCU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GCmPJZANQzcZ0A5C3dC2czcHQkmu4qaHdsXinCEVUevP0jnmHeCzqmsrGxoOWODWPnwWt5zV9GNbDCSXzDL3rRbU+3ERQVjqtC/ZDibyYk3/kSGaXPqkJSYCzt6Ap0QyQP67vKLlM8GbVde9NCxx4WwoEQNhKT7RtO6f732u7Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=kA4hAnnZ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZCkbgMTX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="kA4hAnnZ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZCkbgMTX"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 633DVvhU2360451
	for <driver-core@lists.linux.dev>; Fri, 3 Apr 2026 13:52:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=; b=kA4hAnnZmv5H94x/
	OTYim2w+MWizJGnpmVBblBDjCY9Ah8uQeLEo+7iB9qhrzm/zZgfLY2s/YZ4G5Z5r
	iRqP5tgj3s87OM+I61p/MBUqcs97aQ88XPHIq6ONTUnG1m040D9U1m2zJNGT8wEH
	z1Pig7dAfbRcELP+uJJj7sOaG5RWTRTvkzovCieE4PMejVV14FKg8TEO0bqRrrfA
	lDjRUKAq4JfMWiv4mTZw0yKL1Mw8YRaRw12rCsJF/0T0pLiJVDIzKcKjnEE1ReC4
	dIx2qA+Y6ryIqjQBONPEENriM+qUZZNvy9a07DUD2cteSjNFma8IEAB5IbGI/WmC
	mnzQIQ==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4daeh1g1wd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 13:52:08 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-50d5e32bd79so26059851cf.0
        for <driver-core@lists.linux.dev>; Fri, 03 Apr 2026 06:52:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775224328; x=1775829128; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=;
        b=ZCkbgMTX8Prl0MW39BFULILNQaDdT6bLUByfiVTZjFzmMZlV0v1kVPAUWv3rKnMVyp
         nd9G2RQOxDomruj0QG141pkw3j34OYiCCQFkg0p2/TmRJjvJcopin3gFUXbmldNyhdkz
         hOPnpGNi7YCrdzsTs6bGuS7agA9BHlqKizb7P6OV0TA7TdGau2chvAW+VSMvPM9vB8u6
         uEvVIuNJYFFoD7dgt7I1fDxo1m3uA0urnBU2fkry9GGrYwFBfFtAUKpvuECZ9Y7GfGSH
         lEk3XV7NEfOA38O5HPZuyPFDicNOy0743UOO5qPDmq40sVc0UXZFigdWGnib0ArnHoSN
         Y8Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775224328; x=1775829128;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=QVHUekEa3pqz/senHC7o9aOSki/Kup0i+jAEW3TxX5g=;
        b=EFP3/yBm1XJy9TIcfKf6fJxVDeeXpB/pOTQaNjD3oxf/HiQC68t3eFhXMRYYm4ELfn
         7JmtNML3H1UxistD7di10PZ6i1DkETV5GcJmjj7FRT6ylLWKAI/72OhYLKOLsHhXxjnm
         6YrhdO2a3GfJr8HfLjW40Z6i3PSU4eWC9BVu2w1lYjOUKGNVs+uQqXRj1BFA5k9+e1On
         22X8TTErh+zN5iTytjJPRf/QHWZk9o8JL7f8vWeA6NJEScYJQLPqx0bkKDxQ4nnxL4e7
         9X9lLhlLshkBCEh6+lF4pZhpI502Yw+yoRu0Ape4OTuPA5eLjDp+RXOrhxqCzKumVt8q
         c6mw==
X-Forwarded-Encrypted: i=1; AJvYcCW0JpoqLWHbgPuS2GwrPBVZI4VRAYa8/hcYiJrR9w9u6PnmUMLwfyfUQ8ike1h0JAbmDcevK1eTmS8cRw==@lists.linux.dev
X-Gm-Message-State: AOJu0Yywr5GvF9p3aKm69B+3XvklMh6/SgiduS7fwnzDtv9z2jv/uhP8
	ret0JTZbFctmDlyUu+5hT+U7wOCdfrgijh+H2Y+Y+IsDx5rN/NdcmqtyFMWHGVatgxx9erx6zyx
	jMq+qsy7sQPWlxSFuloH0+p93H9M8mcYMKtQR/D4e2y0gYTGh0XlELQwmuJjpdE8VWA==
X-Gm-Gg: ATEYQzz5dRbYicQs5RuKPMFz0gbOhzE2r2fxEGbv1ylFuxFfZRWnu50BfIWEz8Dwjbd
	y/grwpMK9+i4c4Bv6itCbwfkHn4Jx66ujheND39AXp4iu5Iqc5TKD9Uw3VOVZySbr7V9XTlSHvG
	WyhcBLsAhy75lwVnlbVL3KxdB0hs7GFSl9IfxwTzyONlevOlpZOn11G9VcbLgFK1tN/s2cbcGin
	oYK66lW2mFL7i8Ajm2D/wCtwzIUA+H1ZPVPDcapdvFuFOQnvVWb3gI4g9FzXheTICS7gkpPVm7l
	iyisHZ0UZp/DjUsPMegUE/lh62sH4+qPHy+HBQPKbcPpbgrzoIsBt/fFDK3w/BxsbU5ZyS0cvVC
	BNmNx9Ca/mRutvMUmdshuSFYsjHMp7jWHIZQfRmW6WuzZGbKwBmsM
X-Received: by 2002:a05:622a:1f88:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50d62b4fa9fmr43413081cf.22.1775224328254;
        Fri, 03 Apr 2026 06:52:08 -0700 (PDT)
X-Received: by 2002:a05:622a:1f88:b0:50b:6a79:45c5 with SMTP id d75a77b69052e-50d62b4fa9fmr43412841cf.22.1775224327844;
        Fri, 03 Apr 2026 06:52:07 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:129d:59e8:f7c9:47ca])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d1e4d29bbsm16948132f8f.21.2026.04.03.06.52.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2026 06:52:06 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 03 Apr 2026 15:51:51 +0200
Subject: [PATCH v3 2/2] gpio: swnode: defer probe on references to
 unregistered software nodes
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260403-swnode-unreg-retcode-v3-2-7886092b28b4@oss.qualcomm.com>
References: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
In-Reply-To: <20260403-swnode-unreg-retcode-v3-0-7886092b28b4@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1628;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=tSBsw89+EgLqL9rsGM6nffcOTxXCKvBjsnCc9VJADCU=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpz8YAvNkQYAMYU2+XmQ39EqvAL7D+Os1c/agWm
 lWlplJNjyeJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac/GAAAKCRAFnS7L/zaE
 w79xEACi/EvAOBokb2UlYyvQLhzNY58ORTrHqYEOL5dnJ0LMUFJxnRi1gRZPM8kds3AFjqK6s0b
 z9z+08cH2hhRHbHZxxAECRMT+T7StWLJLK7aSMAjsaSvZTbteomdkmQ6QSBYcgNrjx+T4DCGXEy
 XdZZe4WGT2wIJr9c0tvF5G0dKKwJadko2QHV1UBEKkpkmliH1NBD90hCgNoqxriU5v2zVUnM7fh
 pvlMidJ9IQwTBN9tQzHZ2cNdtL6IRIAGXOIdWll9yt0Qjx3q50Jfe5DTdm3MpR+RVFg14neZsBO
 p/dlY3E7/8FzUm9HUWJeNA0QMrauzjLbDegIFuBKDnKEw1t1goj4IeMTF1/wMQFi+f6XELvJ/QX
 SDOGbXxkZafCChsb9luUjhzdwH037EOqsuFKUnN+NfAk+TScsBOsle4H3RUZXGtWedCcXaVE+eC
 n7a8qMWaWBr3nVx3hEZjMDk2dxmqawVHBsJos1xWbHlyGOIjvH5Bc4h4ul1+x43mgWwkkU3BNvZ
 pL9hFxvLwySDRvZbl6H49UmlkLc9UxTDa6Ph6DAm8BmsBMISprLDcDSH8VvFPLbssyyVwRLND7R
 TRyJvIB8CzTBAtuB2XZV3VSUQ6+uGpLqQd/abQmrHqqeWWjk/M+Dd99SYX6lZDBgtA2z4SWuTSB
 sXc+J9OMfBcep9Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: cqoTfZs9v4tLaAElWtOydk_-5l9Z9PPJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAzMDEyMyBTYWx0ZWRfX8qeNaSjW/lja
 DAQl3EKTzHAnJjNFktzQAo7HVjjJuqwLeLQrGYsGynx73OKcK3CqDkkmVyC5qupbRpx4aN20HLR
 AJEu6p53rRilLgG6IZCH5RkA6Gr3lvr8BXEAyPUOqjih6KycX8RhCkl0oD5tWxFUA0pfbQAYON4
 OkYkX/6AAoVtM5HN0OADyCGlQKgBYuEqV4tKQW3fmv9dxkajvMQLvQyFeKaNoTXgKLsqreNgVfG
 F8nQ3xqSxGeG0P61mZri3WlxQ6fYQTgCSxIx7yh+eyXJ24NeEU2O1B2DNGwQTsrKu9ypA/KIKKU
 FgrB/dNIgX6YgNinnmRUa16yDWWHeP7qgHF7wM5euVlYqPS/ZGJAECOf6Oj/A7vUDZqN0MMAFiz
 AX1perqAsdg+SURQWynYyzCD+OiQMnI/PQ7VJEPKBGdYeIRzK8O+kJ47XYa3wiFtGgJwWQYadom
 5RsnWpHZ2vVz6vyR7vQ==
X-Proofpoint-ORIG-GUID: cqoTfZs9v4tLaAElWtOydk_-5l9Z9PPJ
X-Authority-Analysis: v=2.4 cv=JoT8bc4C c=1 sm=1 tr=0 ts=69cfc608 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=H5P8rdbTNIBZEmRUth0A:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-03_04,2026-04-03_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 suspectscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1015 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2603050001
 definitions=main-2604030123

fwnode_property_get_reference_args() now returns -ENOTCONN when called
on a software node referencing another software node which has not yet
been registered as a firmware node. It makes sense to defer probe in this
situation as the node will most likely be registered later on and we'll
be able to resolve the reference eventually. Change the behavior of
swnode_find_gpio() to return -EPROBE_DEFER if the software node reference
resolution returns -ENOTCONN.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/gpio/gpiolib-swnode.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpio/gpiolib-swnode.c b/drivers/gpio/gpiolib-swnode.c
index 0d7f3f09a0b4bee0cf1bbdaa8b7b8ae4cd5de581..77f4a3b00641bc9535ec32f8654ea7f547c34153 100644
--- a/drivers/gpio/gpiolib-swnode.c
+++ b/drivers/gpio/gpiolib-swnode.c
@@ -91,10 +91,19 @@ struct gpio_desc *swnode_find_gpio(struct fwnode_handle *fwnode,
 
 	for_each_gpio_property_name(propname, con_id) {
 		ret = swnode_gpio_get_reference(fwnode, propname, idx, &args);
-		if (ret == 0)
+		if (ret == 0 || ret == -ENOTCONN)
 			break;
 	}
 	if (ret) {
+		if (ret == -ENOTCONN)
+			/*
+			 * -ENOTCONN for a software node reference lookup means
+			 *  that a remote struct software_node exists but has
+			 *  not yet been registered as a firmware node. Defer
+			 *  until this happens.
+			 */
+			return ERR_PTR(-EPROBE_DEFER);
+
 		pr_debug("%s: can't parse '%s' property of node '%pfwP[%d]'\n",
 			__func__, propname, fwnode, idx);
 		return ERR_PTR(ret);

-- 
2.47.3

