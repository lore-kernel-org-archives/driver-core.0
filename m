Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE45D34CFBE
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771518700; cv=none; b=q/GLz3AKm9ZFt4Xms7dqXexf4Cn5oZY46vFUWtBhNoxCxTr4I8sfEoT+g+rffhL++kXr9+71LW0fbAGXzN41ArqrU81+nGYxVDf+ek+iUmN2wDnCJDTqBJXv53TnUbEICDzLrtScOd2VP1zi96MQIgl/DkXqge7rkzQez79nDgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771518700; c=relaxed/simple;
	bh=A+Wvx+Ty20nDfCj4YJNHGDJvu7T3n9RIyhzQMaq8B2c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gr5CD9YpPcfFJSjVNvmWSLiUl0aZhhITgf2tmwoDfyJH0/I0vZBIjumcIF1Xj03mfNdPGUI3hwKhS5Eq3Q+V/Xi7PCAd2jcVCAuycLzp3MmlWGUmQ2YpxJudajWNlQjmr0iZ8+p8TCY8W/15DjpQUoOYDE6tGf+OJuSj3iqEknc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=iatMQV/g; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ho8cHNOJ; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="iatMQV/g";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ho8cHNOJ"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61JAMrDY3133315
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ABYrK652LfiFcuUIPwfxfXf601qOkzps6FWpqFe+6bo=; b=iatMQV/gdpmIJ65m
	0EgeOXQ+n9QK8nBgOuLi8uWVVSOXWLFvvfPuAgM2qQkDz06D0Op+FRk65MAdM6RC
	7BfzyUTW+OgXZbxoDBPKTlMYkBFJwmIzJZaeBwMaRZk45WTx3aVqKIikolPG1t9v
	bzxiSsGp4fIDsiILQRHouC45X2SOBlvDmATi0X8w8YGJvlKXv9YmM2aavfLXRD8m
	twrQOFXA0XxkirEEC2ZQL7RFP1CrrUmaQ9EDpG+grac2SlER1v97RgjQwhp5TY7Q
	MNUPq8TxbwfyoSp7117qEZ2tIE39NZfahPcm8oLWVbFSTr9/d5HUk2Kc7zr8ixGB
	kK0izg==
Received: from mail-ua1-f72.google.com (mail-ua1-f72.google.com [209.85.222.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cdmxvttk0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 16:31:38 +0000 (GMT)
Received: by mail-ua1-f72.google.com with SMTP id a1e0cc1a2514c-948bc7cf21bso1452088241.3
        for <driver-core@lists.linux.dev>; Thu, 19 Feb 2026 08:31:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771518698; x=1772123498; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ABYrK652LfiFcuUIPwfxfXf601qOkzps6FWpqFe+6bo=;
        b=ho8cHNOJHiXJcwXu175SsTMCiw/VlLV//ewrv+VfutP4l/w3uPtsfWPcaz1tEicEM4
         G9oYx1Y+gMYj5ddO9R+d01XmxbNiK2CIXg9F6zIdxkBXtbN2mQ68UkJfRTTH5CYeZAWJ
         toVG6dUkaj/U0YN+N4IrdKw5MT71mw0Dl56C5pSZwov6CfOum6+DLZO7CtYjM79GyGh/
         /zvACbWc6PkkjDeRD9LbrmDvEz5/ozp9tPcikDWo0QOCd7j9WYln9MfZLYWnavs3zbhr
         hBTCBfMFBQU3FajgoZ9744AwnzfNCV1ALWpp0PmUvSehJy5UOuYJh0PbPTHOak3yyHN+
         ziSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771518698; x=1772123498;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ABYrK652LfiFcuUIPwfxfXf601qOkzps6FWpqFe+6bo=;
        b=WkZLD8pvgOd54b5odiaQbYISL5U2KFnGcTUkwpVlbJLlq53C6+CIEF37WsX7phYMNP
         PYJHgLe1IGe2OPgpskFPZozF+ddGGI0Zvo3X8EJvvpMy997rZ069KYni+1TVx2EhJIT0
         XJHihrYDyakSRSIXBg2rubgv083zB5JM9WVezMTyM1q0OzBDHODdcZIlPj+rI8culU8r
         PJCtD4MpoeaVmvYv90S/GXsjbTy6H/2UiJufNKfbFznUbRZAN/R5Xlyt4FBtwHHdRtId
         1T6JHuontN0f/yvTaZrSLJrbeBum+sU5KUdmWK8Lg1q5a5p2/pi1SD/0GDXuuQv0K/9S
         7O9A==
X-Gm-Message-State: AOJu0YwUUP52oQERzrNdXeHh3H7FfQzug0lvQ1iQ4dROZcnDpny4Xx2P
	ZhGG2quvV/knWQ6/sfu/xamWoqR7q3c61TFlkpRWeWF1MvKX5zlxD504ARNfInwf3mjijosFQ3z
	aRUbpDeLBPEjMqAPXDK5NET54+hcWdKjn29WrPxMwiheB2e55nOjQuyQ8MpyRJw/v8g==
X-Gm-Gg: AZuq6aJ3iV1pYtgj0D8Yn5RCpeqGT4wk4+YDON3Udo5iteTOOKzTlXXxana0rnCILAj
	wdIUTl6fIqckMV14YbIg8X5TWqpkA9IGSLVSNJM4Uw7w47l65FZ9HZxBR1s/OeK89VmGhGuYSUs
	RhICJMbk8iTdoSVRZJKEtDFpakbQ/7vU081Rh/rlM+tIpSgxbi8to755Pd6aG3sGrguJHYF+HLK
	A2/sQ53mu3zE4XoK0tHP/gTlCHKCc8Kz9NwGNZIuxAZ/k9Xdr6DYvEaT4JtERvX62gT9zcS7jA6
	8gzIRB5iDG4hZu6Nq3y/hfxM6ujosR+l5NcXHI3veRc9EJEZmQ2x8h2TeGPNif92vc7AtpNIXFU
	U8rTucBJHwEy8jSQ+LdpNpW880WE4X5m9tTixs6ph5RMqkn3th3Gw
X-Received: by 2002:a05:6102:2913:b0:5f5:2638:9f3f with SMTP id ada2fe7eead31-5fe16c0367amr7758244137.8.1771518696177;
        Thu, 19 Feb 2026 08:31:36 -0800 (PST)
X-Received: by 2002:a05:6102:2913:b0:5f5:2638:9f3f with SMTP id ada2fe7eead31-5fe16c0367amr7758139137.8.1771518695481;
        Thu, 19 Feb 2026 08:31:35 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:bfd6:96b4:947a:52ff])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a31c56d8sm20272365e9.8.2026.02.19.08.31.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Feb 2026 08:31:34 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 19 Feb 2026 17:31:22 +0100
Subject: [PATCH 1/2] driver core: provide device_match_fwnode_ext()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260219-device-match-secondary-fwnode-v1-1-a64e8d4754bc@oss.qualcomm.com>
References: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
In-Reply-To: <20260219-device-match-secondary-fwnode-v1-0-a64e8d4754bc@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1899;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=A+Wvx+Ty20nDfCj4YJNHGDJvu7T3n9RIyhzQMaq8B2c=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBplzrgzLcXpABDe6dzdVFnbsyGtIt/+ASW7D7lf
 /JKGdeK8oGJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZc64AAKCRAFnS7L/zaE
 wyJ9D/oDrLGviOsBuke64wEQOu4gSFHPmXghPeKN28Fvjr+J/ib9T8R2Z+UlVXNO05AsA2XsrHk
 lZ4Ser3QjGx7lQA+TjMjKJEjgwNnQ3bDUmASVz6DfHFJHSJVRKluFQ0fFuyEAZBUZCnrHhLP3lO
 n0mKUXDKkjBRugAHBGZC4x03IcIm2PDSKycF9xnxuBgtZY8zJQNyi+sRc3k+qTgz+L+g4qFA5WM
 yFL37AQ1yzs0CWtGTKcFNs2azfMz4yCuMXYAgdnJVhALMSC91XwrBk5vdImd9QPeNq64y59/lb9
 sszV/07PZDA/8wjNPiW0fdw++54Ca09Cx92Bhzw8nn900ZcsIIM1stwMFjT4+U2k3jrg1Dfr/4y
 Ibj0UVnj3Wamf1JNkWYZdtSblPjP814RH7728Xy6kMsfRtLHXLsiOz99p9pXu2AGqQjHbncuXIx
 8ft/suh61IkjFWgN1b8v1MSc34IH+UX4xvt52ZgRA0XaiYz2XkzCKGZJKBD+Hq3vbjlzSFp1kWL
 53xla3ibtcVgsZ4WxZIp1pVJVm9xyR5dArzjV0Oi54Ypl+Mna8zE+CyPXwJeKO1pPa+kSlmtdu5
 3po0s46e1JyGia9r+W8bjguRnOjIGhqko0Yc1pfBn5sVD+HqJCVbJ7RwxVufkDyQsN5v8zTtFMy
 iQfL26OBm0PIPAA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: o3F7Cm6xYqjeDu8g-PbMeolkfm6ndgJt
X-Proofpoint-ORIG-GUID: o3F7Cm6xYqjeDu8g-PbMeolkfm6ndgJt
X-Authority-Analysis: v=2.4 cv=XpX3+FF9 c=1 sm=1 tr=0 ts=69973aea cx=c_pps
 a=ULNsgckmlI/WJG3HAyAuOQ==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=EUspDBNiAAAA:8
 a=DAUEkVzOf6JpX_SNRGwA:9 a=QEXdDO2ut3YA:10 a=1WsBpfsz9X-RYQiigVTh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE5MDE0OSBTYWx0ZWRfX3fNAdksDeOzF
 8ZQZ0puN+/XD3pQhgcsa3jwU6hUkbFSJNiYBuYEQ1X9btwOWdykfLI+IUp5pOyQD4ksYelJ31t/
 e7KGKyqNwDa/Q9zYT5icLrk4opDhUiq66YuNNg5RWUxHggIG3taC/6N2V8JT5TG88QqF6yqZ4WA
 N0WwN4kjWuyyZ1hICZUjU/n+KRb24kiKYO+c4kcsV+/DQSStS841wWPWklCugs0xD90N2tK+l0R
 88NwliTCULBzBw2Cb2B6yN6N3lwVjfPde8+9st5taVfEucCLK94hyiHdmbeQAUVDmbUjN+mRL9p
 cGD4pILBzdGFws3E8oktbfBdz4bYajJVIWOTDVoLg7zdZo71HIwA/9GZ8p75mjBjtqbBLzCaEGr
 XQgvqK22NFO8Zr3yXKh1zWfno+5qme/21Vz5uhMbgLBRqZ2KqCJbhMYlq3cF03/+q7QAZqAU8Qz
 uCmoJnCIk7+t2PzuC/Q==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-19_04,2026-02-19_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 suspectscore=0 clxscore=1015 adultscore=0
 priorityscore=1501 lowpriorityscore=0 bulkscore=0 malwarescore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602190149

Provide an extended variant of device_match_fwnode() that also tries to
match the device's secondary fwnode.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/core.c        | 14 ++++++++++++++
 include/linux/device/bus.h |  1 +
 2 files changed, 15 insertions(+)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index f599a1384eec90c104601422b04dc2b4c19d4382..bbf1337978fafc35eb94bda85e0bb7f6879879c0 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -5326,6 +5326,20 @@ int device_match_fwnode(struct device *dev, const void *fwnode)
 }
 EXPORT_SYMBOL_GPL(device_match_fwnode);
 
+int device_match_fwnode_ext(struct device *dev, const void *fwnode)
+{
+	struct fwnode_handle *dev_node = dev_fwnode(dev);
+
+	if (!fwnode)
+		return 0;
+
+	if (dev_node == fwnode)
+		return 1;
+
+	return fwnode_is_primary(dev_node) && dev_node->secondary == fwnode;
+}
+EXPORT_SYMBOL_GPL(device_match_fwnode_ext);
+
 int device_match_devt(struct device *dev, const void *pdevt)
 {
 	return dev->devt == *(dev_t *)pdevt;
diff --git a/include/linux/device/bus.h b/include/linux/device/bus.h
index 99c3c83ea520876ab3577ffa76f159f89f4f86c5..bb6ed08c39aee497feabdba82d2e8f89ca1c8b5f 100644
--- a/include/linux/device/bus.h
+++ b/include/linux/device/bus.h
@@ -137,6 +137,7 @@ int device_match_name(struct device *dev, const void *name);
 int device_match_type(struct device *dev, const void *type);
 int device_match_of_node(struct device *dev, const void *np);
 int device_match_fwnode(struct device *dev, const void *fwnode);
+int device_match_fwnode_ext(struct device *dev, const void *fwnode);
 int device_match_devt(struct device *dev, const void *pdevt);
 int device_match_acpi_dev(struct device *dev, const void *adev);
 int device_match_acpi_handle(struct device *dev, const void *handle);

-- 
2.47.3

