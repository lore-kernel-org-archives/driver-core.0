Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793801052;
	b=HJaNJDJhhz8AKz5dzjywBB/UEB0TaF5e0S2WC0/fB4pvFdkN95ji6A6YNTlmabJWvDXF
	 ubUmo/6qW9nF08506eCNhbSgWjwde1HVIgUYLBlsRovnNNIjW8BWRwASkBB9zWoX9Hiub
	 rCHtHtG1sXpaT/zXY7RqLsqn92ByqQp/831kHu6feqeEIrf7WhCv8XW55gLjuGTpBZ62k
	 8zAHQ+wdR638YCHyi/MTfgO0NHtnLxEUdq74vLteMYKdwzJiA6FCATZk3h/CYZaA7WjaX
	 bcIQfWg0OW8GLjVWv9AHP81nxJrAIXsP/DRGki1ZgQdKvHLO7f+Hkk9FBa1gezqcIpQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793801052;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
	b=pdafwUAb3WznHC3ehXWXQ19viXkod4QW42XmmRr18eUo1EBoihh0MofztRERbhcSdBdl
	 E0XtdRk9xwpRfD8b8iIrZA4HiC7t5AHrEG0ESirvZ5Vd5HpqnP4/UsoLeHWTlb6gf2ja7
	 L98FQVKzlAZ37lONb5jBfGTP5R7UIK5x9sRCtQBqk7KQZDFmOxIegX9J9XvXhX9kEK3wS
	 9XwVhMnyUFjliT/cucNonPZsqwp3ceV0nUPeLV06y/68fH9xFnBnLKlcjnrxKGVOJmxDp
	 Js3JFaPSJrP/zk19a/+00PMX7y9Q+4ZKJgh2Uo8w3kO30SgiQL1p3gjGIokSov0yJmw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F673EwGM;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0838606A326
	for <driver-core@lists.linux.dev>; Wed,  4 Nov 2026 14:04:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0838606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hUrJSP0M;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=F673EwGM
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A4Ba3rl2284306
	for <driver-core@lists.linux.dev>; Wed, 4 Nov 2026 14:04:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=; b=hUrJSP0Mt8gOwM89
	5KbD6f1dJANQXZnFSR2CcGYiV3U7yoRkZhd1NTf0ix8a+F5TXzpgjSDBq7yCUqw0
	GAMse+xcJdgSfPtL4CqWLceUFzTW48Gegyvj9VZJRBu4eWz8QZHrny9HV/AARVZC
	Jdqzp+ya2b2KmUaiZhPm9RNgccFgI/9QAqZS0YvuOif9nxZJUP4zw9niVCspry4X
	eQAQaird7ZE8wsa2OhzgUH8gslTW/92WrZBgUo9M8l3CpI60Hw6l/yrplW4KL/M+
	2O2K0vYLXBkErIh1/qG/G/z8MJ94F4n4n+hBxyqV0imU1U24j/nT+CyLmbc2tE61
	cyQWEA==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hr284s02y-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 14:04:10 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5ec3e1962c2so681734e0c.0
        for <driver-core@lists.linux.dev>; Wed, 04 Nov 2026 06:04:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793801050; x=1794405850; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=F673EwGMp5LQX5xlxww+nlpNg1obr08BqfngFDyX51eUxgJLZDt91jsqWw0k/tqoYO
         PbhQcgHn8pqsY6/ggug/JFU4kYCq/QcAwQT7Y/aa4TQxckBe/OCn3VHe8/LVeP/AgH5v
         htal78EaU0AtvVAIQsLNfPsvQI+UYGm1rWlPFCMg1HfP7/pzsuLGN1i8dvkbQwH6cZk3
         40kzOXF7J7kWK472Ji11P2vtgosZZqyz/Kdz3mzkA6HbD9iSgzIPFKrh0Mi9d1ZxiNGp
         MnTWhqu6hcPtih9q/nECOXen+JwQgY/Tsufho7nODOSputMmlmuuOKGkoA99RTTOAP1e
         0eVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793801050; x=1794405850;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qrkh36gwGx93R5sU14vg6GOc2oh+UNDuUKbm1kAlsEY=;
        b=ICZbC1RcbgPPwBVEkGjmNAPeDRxLtzNFzsb9Hn9gEDDgfcHr6UXbGomVz3oq9Oekp/
         o/2tQj45dXlnrw6utj1ni7+qQcICw7XixyxuwBEY+viiyM66i2nTKfzAwtLcFT5qS2Jc
         yqvlXlufqvcxposDsTyeGj7uDg9L1WfVyay2SGh/E2tfQ7vwOE2/emVh+y6jW7dU8VoF
         tSFtIZxx+OMsHmJyFFQB1lLlM5D2DYGt1ey5tLNdACI45tZbjvfhI+VyKDByV0enl7Y+
         YMZbJQbz/PBsiX3VO3HlFymiMgsPPMO+BdBdSVFhZxIuH6xe/26iXp8vfirGOM5czVnF
         di/w==
X-Forwarded-Encrypted: i=1; AKwUvBxWC7aJkmnzJRQcTd5U5Ze4LsXWIjXl/rKaoky51CDL3sHdXLAbMaGSZ7HNBeIelnPZwkLgmIjyBb33ug==@lists.linux.dev
X-Gm-Message-State: APuU4Z9g/poyuzeTJztSClpRaWDJNbUOqOb+U6J7NkKx/VrV7FMaDM6m
	TYnEgYyQAyScVFhaNSKJ40VsLlyxxIRdzfwqQaFbcxOQbxGvCTMDGIg2ym2OXDWLDxxCZUBEuXc
	t60QTXEUrYzag0l7Gz5ug+1kQ1VWHFXBXFJ3J0DICN6bRxKvjzT4OeUqLbWpYh/zreQgK/9awQA
	==
X-Gm-Gg: AYBFou0QbgI/irjZqT9STtlfMG07UIQazJCl7AP9HLSRa3D+0H0r6mffgAi5KP0f43B
	r3ScL607jG1shgmSTQdR5P1F46EotgP5f6EeHhJlDnqaAMzSmzkTOUgxg1fQiIaOGN8chUyxnaH
	/ugDot4TEzf8o9yHcTqHPJSUsEfAY4RivUnzMYt5xLrdr7hapKnCkXu/Y8jQ0XPDliunspaDgOh
	MSQEUwUIDkHyHOKjxBBnQqzLllhMBMNrzYIZjMz2xwynJ1k/uexGLXWmqLjWb5dS/g7wXleAjKF
	ALERcCrA7SquwUqwTCSk2Krap9xlRtWh8iE1DZENxqxVoaxQHCETXCMsnZ5Bccf6haH1/bZtJCS
	ynioZ2XS/Xd1fpbeBWjxMIFK+1H3ASxYaSWBS//xP8HWoJmA16fk+hsJdRJEtL72PcmR+oZ/9er
	oWKg==
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134476e0c.3.1793801048585;
        Wed, 04 Nov 2026 06:04:08 -0800 (PST)
X-Received: by 2002:a05:6122:6081:b0:5ea:c6c8:7985 with SMTP id 71dfb90a1353d-5ec6851faaamr7134392e0c.3.1793801047851;
        Wed, 04 Nov 2026 06:04:07 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48fec8d87b5sm3968358f8f.11.2026.11.04.06.04.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 06:04:06 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Wed, 04 Nov 2026 15:03:43 +0100
Subject: [PATCH 1/9] device property: fix fwnode_name_eq() for empty node
 names
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
Message-Id: <20261104-fwnode-for-each-prop-v1-1-6e28fe1c72c4@oss.qualcomm.com>
References: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
In-Reply-To: <20261104-fwnode-for-each-prop-v1-0-6e28fe1c72c4@oss.qualcomm.com>
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
        Linus Walleij <linusw@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1278;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=R5+4YFOhCFZOKo/xPA+jYi8jqwmw0oVnYVkmsrZp3qo=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq6ztR2VZRR8SSzbH/fsbXq5OEdxvsguiNVfCLx
 Ww5wWSa7BCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaus7UQAKCRAFnS7L/zaE
 w5PBD/980NX1kpJDXHWY0ehLFm7ONkPKAuH/9fpNf1NS3nxrcWUQisefHOE7Rtk/myleJL9pvTZ
 YMTEJgUAddIze2s4CfeWGuQ8XZFF7XDUVZUbEbOtrLh48sNh7UZGAGdmdk0hiu2lX4cpQgRYCSK
 uW+Wi36cN5USM/zBa6uHoUVU16ijpbYdu/5buK2ZDpIuGVch9S4Cdi3QYTY4GuX5TTABbhDhMFv
 7DEAV9ZrMrQ7dAL2gqjtxufFE2m9E4dVq/OPbCMJd4uGCAFlbesp6DVR74ibKRP8u3vU2ZR0Y5p
 9IoMSuYhDCzsg34QdjJIKo6DlnCAH69Bv8z8luC+IjDAhxjCkB/BiSaU5R9/mq+7N+8UjeaIhqA
 GBwQmXvGVSyPqZkUseXbxJRz1zqT44o2PPn4T3Yac1vkXS0a2/FttiXRtpq0Yeuavow36rpt+Y5
 6/jgqc5sChJIQi1fUCFZZZtM45m46b9Zg9iVvaHk5deuUjR8W9Mrepc5mmFJKzrcaiPf0uy/cDO
 K157bZ32oblK2TKDNhw3Vsw3q/WsJ0zudQpSEB5tTuopcYARa1H0I7e/v/UnvXs8HYQ2tMzx9k0
 aT+SQXgewV42y6g5n3wfSwcX2GBztUDAy2y5NR7b3xRzlyDSGDM6IpzefrlsoUKH4riVfSSPn1q
 dT7ZIUbHUkPawWQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Authority-Analysis: v=2.4 cv=JdQpPkKV c=1 sm=1 tr=0 ts=6aeb3b5a cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22 a=EUspDBNiAAAA:8
 a=bz9ZealoQtrIp7hKp04A:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: FAmeorDIjWxBi_bdVREAgJoSzkC_30LN
X-Proofpoint-GUID: FAmeorDIjWxBi_bdVREAgJoSzkC_30LN
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfXxynq3CLruFxk
 OLvkEK9WQK+z+NcEUq+eFc28AH7WEAEkITiV7sgYV6063yV/d9RrInugr8BwC3JXgKUp5EWMWgp
 fjSqSavnYws5LtQ7JZxhgyxnX+z5o36VXCKp9tGcEmxH/5ynTnCqDK6fdkZ7pJaSIj8D3/RkUEh
 P8oFoqLbQaBMflkg1YGSzxBhtbcVyMut0jWcbQoYhMGI7ZYS/3Uz59OUXItw+eonw7hC6bOi9jv
 HLdYC8tDac5ZvN8fRhEytd6WmRsyMYtuj015hFnchdY0abjchwq8r/fo5dOlVGlYPvS4zML9o9G
 i0tyGlGfSYFSHP804ipUap5DGIudSyCWS7pHeQyl263xiAi41MruyKMyPFCjQAGf6lh+DC3ry5D
 qXUfBdR1i+LFdMPM04DMgwrjBPCfD2JPdq2/I/hG3VZqXRieqK3iDqm8KKu/EyVtY/HOCeEQeSW
 atOYEhBty1mR3OAppGg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA0MDA1NSBTYWx0ZWRfX7xqdH+0wqmz0
 hp86hBOeNzIqpVAVSVwq7GG9wxpmjnnJPGacaI10h1M4GQqY7+hFnSe9q7Xt5mKZSHC+fg19cdH
 n0tD5fudAkYqgIp52MNBqePPcs49xFw=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-04_04,2026-11-03_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 impostorscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 suspectscore=0 adultscore=0 clxscore=1015
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611040055

str_has_prefix() returns the prefix length on match and 0 on mismatch,
so the mistmatch case can't be told from "empty prefix matched an empty
string". For instance: the OF root node's name as returned by
fwnode_get_name() is "" and will return 0 for any name matched against
it and since len is 0 too, fwnode_name_eq() will return true.

Do what OF code already does in of_node_name_eq(): check if the length
of the expected name matches the length of the actual node name before
comparing it.

Fixes: a9c8c738066b ("device property: Add fwnode_name_eq()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/property.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index 51109794d7275ddaf4571584d0e77d8573ebb475..a97575ff9199004b4f401f432aed6c95e40d0c25 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -700,7 +700,7 @@ bool fwnode_name_eq(const struct fwnode_handle *fwnode, const char *name)
 
 	len = strchrnul(node_name, '@') - node_name;
 
-	return str_has_prefix(node_name, name) == len;
+	return len == strlen(name) && !strncmp(node_name, name, len);
 }
 EXPORT_SYMBOL_GPL(fwnode_name_eq);
 

-- 
2.47.3

