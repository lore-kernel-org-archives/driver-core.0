Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792750459;
	b=xHkCQfT3tf6vSwnNmubSAn7apIJzIcILx5QqVabF6QGuAytwMWZ/gdYfdyfZuHevHd1/
	 En0DZn5ppwYyEI6zoOJOSiweR4iRpoybsVl1WtEPGtHMIa/p/JUEyvsGO1M4D+c3r0FCT
	 weU6Ts+JsxniqLL9M7z300Bz/CT4mdlw9hcbFqtybHUvi0PdGzWiEjVZ9qfkOHZZy9eT9
	 +9AMGXIHYJ13KB8NPqHk9AclRNUML6aDLOpH07LNinkdWKL31oShB2UbKg6S1Fl1htStv
	 CUz784E+67w71Pl+Vrxl6eqoPvllYw/czjZHhom0soMr8dUdJWq5FYwb7GxZmnegoJg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750459;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-Spam-Info:X-Proofpoint-GUID:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=;
	b=n9UrjoUrXcfhGX/n1HpqL5arvGRVof9npN5J1ewVStG1nkexIogqikuVPW52oxDcTDtP
	 c1rQ3O2aFq3Vz3mj1a6TmXrB4Eo2WnoMuDRLxzRzA/zXjYoTrA+uay5P+ud0KYHAvfRY/
	 qIGusqPTmHqkSMv4Yq9KQFvOAPgEGMY8VGNb0bFAH17a4crGdLSpDl6iE2DI4KwpKX9Q4
	 ExhN/OzCD1lCu3zen3m9jldKLmh8zNfxWySUugDeD3IGxlfSJ4PtCc/S9sVOejxfYOBOa
	 yy5yBFoT5DUNqUuthxK80jPjR4jqUL0E07nCwaVlO/DKyP47supLuf6uUq/oh3VHbcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHFbGogt;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPvVWJll;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25EE2606A32C
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 25EE2606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=JHFbGogt;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DPvVWJll
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NABMVd2491632
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=; b=JHFbGogt9pHGv2hZ
	WbvRokd2fj7sO7Tpxo6nI8vBrmI+dgMDTIFS+Mq67HZmkI3ua/b73cloGr9G2/YT
	llVKyOTOmlMfeQ47ddNrqZOBdtgpCLQC+H3Mcpl/1bv3JqcZgX5WJRvQCfJQ6e57
	ROpL2OHLZ7F3oTVrVZLJR2WR5dSzr4KQe6iESPeFNL7CccE8rRct3d8UjvaDcrU2
	SkCPdeymZWVT0cdMmgENUe0TfNblg/EdFBQuY8ohmYdrEtp48VeZNnPmavhj4P7R
	9hgxbGikth6itn3Vba0B6S2mCSTH3KxL/7TqsZJ45sKeXMZ4PUfo1a+oNjHGWRek
	aNlANg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hftygactg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 10:14:17 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f1f2fafeaso95555285a.2
        for <driver-core@lists.linux.dev>; Fri, 23 Oct 2026 03:14:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792750457; x=1793355257; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=;
        b=DPvVWJllG2a77Yhgmafg4tqYbL/eoPFCm02S5ndfS5EWbU4+uGKRUXbQP/91Opnvy4
         CEU8JfQTlhJA35mILEsoIinbdIlL5mNIyU3pVVu+zcinLIwZX+dfYMvABHfWyVt8rTHr
         fihj0I7QZHJ4A4TnoiOT32rVjFppFoTgH6GheeWCHH+mv4MFPOqh0j0Fu8dV4h43c22Y
         M/VulQy+r9p2InuHPbwACNFAi41TonC+vjRb9BWGehO0OmCsjGhu3FoBfZoQ+OQ0Wv7K
         ILL3YFopUcRaa9Mk3OM5WvkVn4Uk6ul7ePFV3ZI9e5tJLW4IdvRTo0M2e/vpcIuGfkZk
         h09g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792750457; x=1793355257;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lmhSmlqqaQmES60Ho/jdW9XYUfSsWVj3Z2zxTg+dwH8=;
        b=cYEzhwQqL/MX4CWN1rl53P2fisRhrHCXIL0JCFK/HL9xQuJnOT+KLYMNmsuuvnh2zO
         1B8zr0wXgTcscYnPsptaak1zU0YJw1qclDvbF+0ZuNakY2kMdoMZYjMfXLRz3shKXlkG
         dJk+xIwbfLxN2GB1+EOnyXW/kFJ7pENxvmeyGTXstneIjBGRqXfHcjVVaAZfD71ekBLp
         0oWlURqF3WdaZY3O43C2SPwnA38EXSM+t8mnvTAv8HF52309Znbi/7t3Vrv+Dq6euUrq
         7fHr1YVq+E5E0s8kUeXx9SJgs+KxDtws8OnrB6e5nRGTr8Kqva56w/PiabokWGEbE/8n
         VfAA==
X-Gm-Message-State: AFq9FYKc/6FQrJLqqHmFoSGHdC0M4wsVhznCip6RIrsmE77CnQYHgMhw
	iQV+/KyN1QOhBZtZmqgSmKwVj/nbCR8UUOBA/I2Hxz5KaYFFK6evSvtzr1BW/5Fe9NEHYwvINGq
	qOjfdR6lB+C+zH7vcNb6qKQxumHDg05hFgxCBpzA320067ahBbNm7ANCUEx/i2nzMHw==
X-Gm-Gg: AYBFou3Dn3ilECBRACWrpJwA1yRSkqBdmnHnCYbc0NDRNzr6ENNrOq3Pr96EdYZaXQC
	e4LwBRagAJQshSQi2QLrg+8LMPV/JI4pcw+6+LJ4qu+EOIfra315OsXjN/Rc5cY/DT5UF3dhvx4
	tMtZOIWME1eNCjL40gOdyMM1BJvt46/r9P9JpiLQ1N51S9uwJ2wysLcy1W4egNhV61vZfKQWMZw
	ziAL+S/MlrDkwntXelR+MOSgm65GBr2eNhHO1Y6qlac+treycYg5pR6TFChR3lSo8IIWNPomwcr
	wIP3pk1joP6jgMldsVxCoZ12NglpDAZhBz99Hd8jMcc/fbXeo89eLldOfOn8puj/XKnhW9iC2vS
	qB8ayf9AaqF/gYteGvmnK0bfkbHeA
X-Received: by 2002:a05:620a:40c3:b0:93c:aff9:52c with SMTP id af79cd13be357-93f6f9b5740mr319045485a.60.1792750457378;
        Fri, 23 Oct 2026 03:14:17 -0700 (PDT)
X-Received: by 2002:a05:620a:40c3:b0:93c:aff9:52c with SMTP id af79cd13be357-93f6f9b5740mr319043185a.60.1792750456961;
        Fri, 23 Oct 2026 03:14:16 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38025da3sm4397734f8f.19.2026.10.23.03.14.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 03:14:15 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 12:14:04 +0200
Subject: [PATCH v2 2/3] driver core: provide new device flag -
 DEV_FLAG_SWNODE_NOTIFIER
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
Message-Id: <20261023-swnode-dev-notify-balance-v2-2-948d920a79f6@oss.qualcomm.com>
References: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
In-Reply-To: <20261023-swnode-dev-notify-balance-v2-0-948d920a79f6@oss.qualcomm.com>
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
 bh=z5tLITIjUCn2/wxigJLqLXjNPdX0Bvyssm0baENgvAQ=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq2zNzzS7a9efzMJqoSDafgOOwwGv0/WLtL+ni2
 mZcl/cr7naJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatszcwAKCRAFnS7L/zaE
 w1bJEACxsOujjz9kEdVwyqxkI+xeW0avr/QAZ1MVU84l+Qx7iwBUnDnWO249oRQspS9PHQfzkYq
 8nM5D/01xbF1UKk4aQnZYVv/NIh/ra0zfF+7CPuR6/uGmt+yVHrsbM/NyEpstQ8jxNJxVUi5Tpe
 kPw9YkVSMku9RUBOjCF0N77Lz0EKfrOFb0yLu4rmyhgzxfFGIBTmf33De961W7F30J4jeL4NcF8
 nA20MdOLSD7+x8brHleXbAnsGihBnmXCYYUt8uwHSye280wO7gwcnN6b7RZdgEnEorYx7iEJLVp
 fJufiJ6vb+LX+yfuSpG0tYZ0KGyyUyG8AzHvonITYsN0Y4UqOROkqfO4synwAy3Sv1rNMApcY5i
 rqoFU4TZkAiJPPsE0ZJFQ8MFilWd3eMhkVwsjtAk+U+vPsGP6vSFjix8QfbB1RCikSefj4CqxMU
 92m24sxx9nql3kQ9aat6KaOuHcq0QxPozU6Gfcg4ZkpGvszSOXi5Aew3zawTzpP/bb9UbxtMVXa
 DGahS4WDxJXUjy+OJLtCN9eVw3nuY7I84BbONyRyh1IEHYIgasXdhv7NsgCCJKXqsj05OUQo78q
 3hbUKP3OJqWljTk3pCtExtcwMMWBhJ/l2M6ONsBX4gpHti4RaKfagVOd3gpB+HbiuU/789pVEbe
 0hx55m6hAhM8sQg==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=cZpHPXDM c=1 sm=1 tr=0 ts=6adb337a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=EUspDBNiAAAA:8
 a=pFYeoU0bCXH7zDU5Pl4A:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX1E2Ch4py4yM1
 LIlfarVz+TQtoTREi+zVM8fCYXci+SjmI2Tw3dQgNsei2tgDtLMxhPyQqNRPpU6e43WU9Ynn++5
 4lpmsnv3McTVGDrUaeBZgh7/w4zfD0Q=
X-Proofpoint-GUID: PEhoBOBg24v37nBzz1Gha0T6jSL1XORp
X-Proofpoint-ORIG-GUID: PEhoBOBg24v37nBzz1Gha0T6jSL1XORp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzOSBTYWx0ZWRfX9+NlE7jgSNU/
 jWiDjRMmOzE+Yg8tGRmPhsjXRNKqAbGOd52JD/qO4m0oYmWagERHHOFskAsftVqYCggc87SHO3x
 aEwsc7M7tAc7HC5fjV80G/dqZrOtdoYta7c7ydrEYapVWUWXEGBpqP6Lm+rlSTvzSWGaJZ2lGAJ
 HAqq8AnsLGahWSIHdHhRJwnKAjxJtLcL8ozId/prTP/OZwEMsccwLQxLUlxuXRdlGB7ZHHjlL0Q
 S6pg4JWfd7+D9dKiAA82KFWBaKkPxwOeK4d5YgqWqrtjM9EPO/nnu6N1UZGzuC9OkSLyriHF4R9
 UGJX36nf1XnrtXoLYZutrEd0qyTM48zGERZItc3mO6GGR1qIuw+gipwYXuLDH6DR8HKITZ/sAJa
 dG/ZAw5IMuDU93cBOnw4m2V5ok2O6oTSI74TpG2+0J1OfXmqesy4aPjUca70vrRfk1hJGAdzhm1
 IJABkrMltCmN2ohPcNw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 malwarescore=0 adultscore=0 priorityscore=1501
 clxscore=1015 spamscore=0 lowpriorityscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230039

Extend the set of device flags with one that indicates to driver core
that this device was passed as argument to software_node_notify() and
took a reference to this device's software node.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/device.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index f31fd62dca9a89c1c9ad565b1cd673b71b740faf..6b082c638d451deef62a607095335e807b0841e2 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -604,6 +604,10 @@ struct device_physical_location {
  *		ancestor device.
  * @DEV_FLAG_OFFLINE_DISABLED: If set, the device is permanently online.
  * @DEV_FLAG_OFFLINE: Set after successful invocation of bus type's .offline().
+ * @DEV_FLAG_SWNODE_NOTIFIED: Set if software_node_notify() was called for this
+ *		device and took a reference to the device's software node.
+ *		Indicates to software_node_notify_remove() that it should drop
+ *		the reference.
  * @DEV_FLAG_COUNT: Number of defined struct_device_flags.
  */
 enum struct_device_flags {
@@ -617,6 +621,7 @@ enum struct_device_flags {
 	DEV_FLAG_OF_NODE_REUSED = 7,
 	DEV_FLAG_OFFLINE_DISABLED = 8,
 	DEV_FLAG_OFFLINE = 9,
+	DEV_FLAG_SWNODE_NOTIFIED = 10,
 
 	DEV_FLAG_COUNT
 };
@@ -838,6 +843,7 @@ __create_dev_flag_accessors(dma_coherent, DEV_FLAG_DMA_COHERENT);
 __create_dev_flag_accessors(of_node_reused, DEV_FLAG_OF_NODE_REUSED);
 __create_dev_flag_accessors(offline_disabled, DEV_FLAG_OFFLINE_DISABLED);
 __create_dev_flag_accessors(offline, DEV_FLAG_OFFLINE);
+__create_dev_flag_accessors(swnode_notified, DEV_FLAG_SWNODE_NOTIFIED);
 
 #undef __create_dev_flag_accessors
 

-- 
2.47.3

