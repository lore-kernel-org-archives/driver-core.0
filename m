Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F338D52CCC1
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075612; cv=none; b=lzWkkcSxje7Vw+fDD381b9gAq/qvIc3B9Xk+oNJaphFeTm/WVlNJDmYq//povjq0nwrI/RaDSGL32VafBp/Ll0ztnFHXi9cHw/FUjAQcJcDi6if1zGvEkG0YGXMLLTcH8Z3jAN/nJVg9XzjV1n5/7b+c7ZhqOE+jm5cCHmtd7M8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075612; c=relaxed/simple;
	bh=PNdJgOWRrdyzTTYx+0b8LRvlWIDUWkxVpHQl9VF4oqE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEgNHzKHkb5qmfgavH8zXo7Wn4UGH45Hp5YkdaR38SmAxsir+nDHGMZBVhJRn2j2k+xx+Of2t7ZLeb56tLIfUu3tsi0165nwNz/Gfh4Uc8DpgRoHX01V+hhRUeKBbsS68naWYnq+rDdGnW/fPMG8gNGevrkv0QgLfqgH+IdkQKI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JqQqY3f3; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=X25RTzQT; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JqQqY3f3";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="X25RTzQT"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPwkr1596393
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HWO6GDyq3PQxTwNf8mQmtUFqkh6kAi1lfM6v6Oehdq8=; b=JqQqY3f38CmrCrM5
	4b9gCEVeZZRUcv4Uebfp/Vnzx5/RmNtJuBlM3rCieG/JrlwE1BrWs7yphZsJGNlR
	PMPnhOn6UEX5bOLd7UckkW8Ob80wDaTK06pogBtztOcu4YtSnUgwrPpz3Yf7vJ+z
	xFvRkBWXopsPYBaZ0wDYiU/UcWiz7bSS93Ltn+xPopJ0iGfowH2x+unHG09r33x5
	Gg3yg42eMTk5KvXXaqmAumbhSBYQcUZDLnRWc2ydzaQFEIju03shaihJv2fRkiPk
	c2MRTRa+05Qv8d5D3VmSaQLEeojQuaUoVxYSoJ8UdZHV86/PNDNVJRAjB6/JUeFy
	GiN51w==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com [209.85.221.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2v91bj-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:50 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id 71dfb90a1353d-5e96f90659eso626055e0c.1
        for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 07:46:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075609; x=1792680409; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HWO6GDyq3PQxTwNf8mQmtUFqkh6kAi1lfM6v6Oehdq8=;
        b=X25RTzQTDMkvly9sSwVcHEUiEszBX+hmILCcosLpUOChe31oGV1end/StSc6xPh4jH
         CeS85hCR8HawJPlw/nZlCCDFfeRTYHoVDpugr4aejJ9kKknLRrwZMO+KPra9v7Owdvj9
         oV9P8zOjIMb5/K+VRVtDr/2ull6ewSe+rmQUcznoMCFXgZ43OV/H96XsNneLnXMVcUhI
         Vj54fVcKOc1y7NtP33xd6Y5fvG5hvorWAFe0/SlMYUoDr0tG0U9KYvjcqfcdV4kttMHa
         TP5++UBBkPENYG5ouLqIOjL1uIJavw5Ld/9rVz1AVnaQentCNimHmVyaCURgJRkKeCZv
         8QjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075609; x=1792680409;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HWO6GDyq3PQxTwNf8mQmtUFqkh6kAi1lfM6v6Oehdq8=;
        b=y5RzD1j0knUo5bOyw2QuxME6/mYF7roUeIKs9boZlg/z2073LzDGrkhqQapUMpf7Ke
         Y+c9mfRHQrniRVfkmTgG/WrwRqhvDNNPfBTxyBjIhQ5AMxnIWb5tyj0RWnjWmdhzbeSb
         0ZowPdYiheGnY/jzd5zf+5JeSNeLWEYWzrGOA1kt37QwcmTbeiLdTonFHuXz3zUrey66
         31ywaBSoa2xWfJnY4dsd/O115RKq3f7zf/W5KP9XrcPH1uDxfF/G3jLwZufxWpstE3ce
         XH8XXKt0G62oV2bAaAlQH83j7aIn0070ipeU5aF8BBB++vCh6ClLpoOZR1L/GiIOWR+4
         OIrA==
X-Gm-Message-State: AFq9FYLw4qRC7TYrLufassHu0wQcza5ucXbbFeKnAuZMaKk7DFwWQ4x8
	raDF/xk66j4/ZE03B9SUiICr93qIDgDNBCvaGQL2IOqMWMmqGe7SDNH7a6QgtVvySKIPKIAZxJW
	p2Sr2V9yJvXaLMP3nwreYawKuV3zkZb+ss+8zt51hIpT+12FOXD6M8x7M+7/SitTmCQ==
X-Gm-Gg: AYBFou3LKUlCfQjnw+jG4dNKFcIY9WSa4Li/HyRIvH6SPAiQtpKkbagyWnh99D45+eD
	KwZkPrKvUXsQlr5yMi3xu5MNyJtXC1LKvcSnprC6frsV5lypG3cg+ngwgHEPMmrHCL1lA2C8vYM
	d65OB39EEl0wXc80NsHybdnXW8C0PRnyprCHoy+0uoeOHZ5vP+vZXZIDzyULOTc0Pp83WjzaNc6
	XEcTr+vALp9NiqTnbxhPdIRsL19n2+JwqwmZyQpnnJYNBe1zvwjiA72gne4m/Adn6G2CP2kyjx3
	hoOo/loxA2q61MWNHA4pno6EGElHK8EfNQ6zPN3g+n6zcaxxZbk6lqhiBhLd06pR+UY+b1K0Z9G
	A/r+uP97hfXx6hYxunDb7f+EaDjv8
X-Received: by 2002:a05:6122:4892:b0:5c9:c60a:e9b4 with SMTP id 71dfb90a1353d-5e91f55a9fcmr6144198e0c.20.1792075608935;
        Thu, 15 Oct 2026 07:46:48 -0700 (PDT)
X-Received: by 2002:a05:6122:4892:b0:5c9:c60a:e9b4 with SMTP id 71dfb90a1353d-5e91f55a9fcmr6144135e0c.20.1792075608133;
        Thu, 15 Oct 2026 07:46:48 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm86840625e9.10.2026.10.15.07.46.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:47 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:46:23 +0200
Subject: [PATCH 2/3] driver core: provide new device flag -
 DEV_FLAG_SWNODE_NOTIFIER
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-swnode-dev-notify-balance-v1-2-9e7537bd2869@oss.qualcomm.com>
References: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
In-Reply-To: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1758;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=PNdJgOWRrdyzTTYx+0b8LRvlWIDUWkxVpHQl9VF4oqE=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0OdPiZQqXyRVvBIXUPuGwAoU4udtCy7kp+VfM
 mzL4ByYlWqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatDnTwAKCRAFnS7L/zaE
 wxfEEACyGUZXdcCq5oDMV891HI/JOAHeiDbSgTxeyANCyvf/CDKa14YMhixX7AUZieI/gXZXCVL
 H1pCDnbkKcTT/Ju9Xz3u+Sit/5/0XXiU91xKraUo0Sw3IwnnygHIwnGEjO5dbbXq3hyAitx5ZTJ
 Dgqkeq71E81ostCiKxh8ED8NfM5ha2J5ODHR9cO7/zy97/Eb3Z1rfWVK+RF/JNQX1rpGzXeNZQL
 I8xLhTiSu4Y9U8iiWZZNaVWPhQazdsrCx6CmGyg0blD0VpmEvPnvZr+8qr/CsWr3DVHnVzDB27z
 /MdSZcTRtMw/SGWAtRZ59Ty2Zdm9paBgc6hIpXB7ymiesYy1AT+G8mCEuogQPpZGYQyC/P45Pqt
 R2GFlOFsJ5Uk64zZzLt/pg7pEOfKQ4wUK/6EFtLOY2P76MQPXFSnpvjNUHz/1Nzoq9T2tsXv3Pr
 +ea/2kf4R3ZcxVudDIr+KRibFjFai51dQ7w4fQO0UHgYEpOPX3xOgKHqiOultUukHRXlJt0bZ5R
 Ds6nvzT+2Tb+/yLPB6FXTJAa5xGqBdfVWBdqtc9geCgSb5m5cCEFAClVbAt9Sw4YzhykVnMQ0qi
 4VyZT3945smX72q/BNuz5QQeYF69JhIfSorf8ctQq8WVWC0W8EjtgJwVYQ6B9FtMPKPdJEuWwf9
 DKqaPYgZ1G51kUg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX8aE8YcyTHnth
 D6qTagY/78QJy1/O7Vux2uDQvHoBFSmJMwWTS/nDEgmmM7+9ce/+rLUwOKnUDCozm0bJ2ccWT0A
 PNFSHHQClrV4KzPO36v87Wi8KqKASeUXPEUtXut8WdZa/0tuSwVNW/F/lIBdU/a4jolvypvF0zM
 lXIf3tG9WYsP7NrODTunIt0x+cDiEN5H7nnTvsDgnAorm2mXlfmQCLWO2MDX4R7CrgQQ+oK4J7d
 tppyeU8A1b5CX+RmuruuClHYU/9n3JFVW1er0KoTjfgQA0w3TirWsY2PrNnCk5YtEMKyJeTy0DS
 wOgj8kUgwC3rsOTv3jxRNehc6OZTXvJkH3aOgVjXMB5G9vMQ+C9bHRMgEeTIF/U6MwimsY+/fvK
 xc6HjzRlPsB2V76N24ky+8b8eoqu59hi8B4N5HxZbnhRddxk9PrYLAEJzko+1URlBN/7UJhpJm4
 c5hH4WCwk1fGV3gKnig==
X-Proofpoint-ORIG-GUID: XZQpbyIat2KsEDEdCerlaKP7tS5m4ItU
X-Proofpoint-GUID: XZQpbyIat2KsEDEdCerlaKP7tS5m4ItU
X-Authority-Analysis: v=2.4 cv=G/CJgNk5 c=1 sm=1 tr=0 ts=6ad0e75a cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22 a=EUspDBNiAAAA:8
 a=pFYeoU0bCXH7zDU5Pl4A:9 a=QEXdDO2ut3YA:10 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX2F+q14Gy8z7/
 vyU8zcpmd/fnaMVGGBIYyC98G51KGBgMxe42JhH4xdv7UHLLG2p2ND8AAHKqTx1gJ8Y0Qhzwhy5
 +ME/ptyxhWGQHe9NLKd1XY0r3eiF7ls=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 lowpriorityscore=0 spamscore=0 clxscore=1015 bulkscore=0
 impostorscore=0 suspectscore=0 adultscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

Extend the set of device flags with one that indicates to driver core
that this device was passed as argument to software_node_notify() and
took a reference to this device's software node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/device.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index c8de370d877f978dd4a160f0094812a1d8441078..b8f12d053cd704b12febc41035aaa44afe286351 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -599,6 +599,10 @@ struct device_physical_location {
  *		ancestor device.
  * @DEV_FLAG_OFFLINE_DISABLED: If set, the device is permanently online.
  * @DEV_FLAG_OFFLINE: Set after successful invocation of bus type's .offline().
+ * @DEV_FLAG_SWNODE_NOTIFIER: Set if software_node_notify() was called for this
+ *		device and took a reference to the device's software node.
+ *		Indicates to software_node_notify_remove() that it should drop
+ *		the reference.
  * @DEV_FLAG_COUNT: Number of defined struct_device_flags.
  */
 enum struct_device_flags {
@@ -612,6 +616,7 @@ enum struct_device_flags {
 	DEV_FLAG_OF_NODE_REUSED = 7,
 	DEV_FLAG_OFFLINE_DISABLED = 8,
 	DEV_FLAG_OFFLINE = 9,
+	DEV_FLAG_SWNODE_NOTIFIED = 10,
 
 	DEV_FLAG_COUNT
 };
@@ -833,6 +838,7 @@ __create_dev_flag_accessors(dma_coherent, DEV_FLAG_DMA_COHERENT);
 __create_dev_flag_accessors(of_node_reused, DEV_FLAG_OF_NODE_REUSED);
 __create_dev_flag_accessors(offline_disabled, DEV_FLAG_OFFLINE_DISABLED);
 __create_dev_flag_accessors(offline, DEV_FLAG_OFFLINE);
+__create_dev_flag_accessors(swnode_notified, DEV_FLAG_SWNODE_NOTIFIED);
 
 #undef __create_dev_flag_accessors
 

-- 
2.47.3

