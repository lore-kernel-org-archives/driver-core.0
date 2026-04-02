Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E5AC245020
	for <driver-core@lists.linux.dev>; Thu,  2 Apr 2026 12:54:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775134502; cv=none; b=ovCjEu5XSMVqLgGVtt+H599WuhDzgRvrhQXzZ7x7v+BkBLK3AQn8mJJF5o7C6MivgMW+NJfS5sIlKXvfQm3C3CFyheQbfXPDbBVcnpcihfVYOfkEhzv2tyAj2fxiTPsXWrVAt5pIFpakBD83/zGWMZy6gNxgqAeQw68v94FV6Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775134502; c=relaxed/simple;
	bh=mlZurhMjnNadP6KDAy67g1xVZeEONxV++y8bOiCYR0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rDGss5Gjpn2vIdwX1oa8HhYIPojH3UfU35NzCtqMWkI8a0jypKBUhWEswgzuSImoAkpR4RmeNJpMGbaufMjKdv9ZV6ulZjQ1Ecu/PDYJKgAE8Nr3kXvsYkhXdO3nl7JqxfQs4sZXxn5mh0V0I4PNtnW6qduEvWUnCG0gwiXhnj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EElPktVr; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FkDaPfil; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EElPktVr";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FkDaPfil"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 632ABcOT1551693
	for <driver-core@lists.linux.dev>; Thu, 2 Apr 2026 12:54:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=; b=EElPktVr/2BrPHft
	2rFAdG68Yr+mrWZbiSbrh5m4EpyBYGxgwQKe+GnyQ9si3/8ReGIXAQKmds2AYzMd
	x12Mvd+c7SPGL9FYDgZyPbdvtVPA7RPRRx/4grj0NfJqXkAt1y/le7Ziqe2vHfLf
	uae/Yjd/FVpBgibBZov1ddOCKng69PbzIXKdSjSSxTKNJ0Gv4pK+/MStyv6C6c71
	D8T82hW/vl2agitC89/xfEpPArexbIug/1uO2tFW/TLZpdSp6TJGeDmTjOdBNJRG
	3MC4y2aH3MuM4J0rEUIWwaNiT2uCcIV8s/5/hzOb2cNtYVotpb7boRhLwYOiEZ4W
	0TwqBw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4d9heet2u9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 12:54:52 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-509070bda13so7750251cf.1
        for <driver-core@lists.linux.dev>; Thu, 02 Apr 2026 05:54:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775134492; x=1775739292; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=;
        b=FkDaPfilJEXmIOgJTYV5d1NDMy3aavbs6oWpizypPV3VjsMeYQG5TfRfKJmuCRkiNz
         JVipDhiEqT80paDuhkLDkfuTs2oSwScZ4u6Fi9IX+rN+2axjWEBbRzsVAmV+RrohNqEA
         1GPoOmYdcTMTko+bVgmD1o4vpBOWcKO6UjOqydJVQb3BA+oCIS7rJ0fRZa8a8DM+BaeA
         vyppkHujWVsXYAPcAX4J5GPgc94++BfLGPX8sSF7eAGfNnOjdIWiES3pI4EJVEVNEFTs
         SSSslh0BxhtTbmHBtQ3tFN2NPxkGjir2yWRe4WK/0daPwFHe8hFpyp6exjRRucsUYiqT
         7P8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775134492; x=1775739292;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WLLQEt/bxULlBw9ELKCkgAUAtDDl4p/o2jmjEXGFfa4=;
        b=KinuP+StgG8pnFSrQcAzNSdJjHs6RXPGZvXqJ0qyDNiT4BEDxmv6I4zb0zE3GO9u8K
         agt7RggzUMCPLeKjf3fqiY7FrN5f1MuCsOcPHCpwXX8vmyb7hhTrgbUAd/86oF1xOGkI
         HYoTb5O3BlINqx+v8WPBOb5L3vGvvrfqOyRQOC55ugU6r1hqh2ffnUXDXgsF85vdQfyq
         5aZZuan80rORJar8t7EUF47NUcqQGXnaF/snZvZu6fFqTnBMg8vtyvImUN/Lss4KTY09
         z871Drl5cazfx4BeLgYPENuGei9M4hGU28O3bGzwlS2QKcCPQUT3IU1xCy479Di7ue7r
         WA8Q==
X-Forwarded-Encrypted: i=1; AJvYcCV9+Qb+6LQ8FqTdCdS5PxUDTx/u4ACFCKs3pM43PvfcM9kxDjuZXoN75YelXFqoiRfUycLf1mfznkc5pg==@lists.linux.dev
X-Gm-Message-State: AOJu0YySzPxAlMcDg9yR+7PicqvB498AsNEsbXi1fglQG6qwM7P8DUXQ
	vbPvhZ5NzYsgZ5g08AWHhu7C/IK2U29IQS3nJUCVW3z18Ww3LWQxpxRXFOZj8G6ncze3cttYEYw
	iNpXuBP64k6/U9SjshLXHo/L1aSHCr9iYstUSPF0RmDgRYK3tXDt6wtTwL3svabOn0A==
X-Gm-Gg: ATEYQzwgzcuGS9TeNJF05qen1AK5jFkqvMrHEIM5FojejZtgNeL03IR8e8AeNjA7kii
	gcIhF5HgpG04f5LSY7JiMQCspsp4lAzFHyyMqaR3SI/go3iWEvY+1MqmhmBh9o/HHumnVubYQH1
	K2B47CjEwXGIakHNpBYgpbMSUQjC5/IGSDC3ep9kh9f3KEP1tOY0DLK/2DBg9fGyth1zxhzsxIE
	TF5I/oPQg2f3EOwT/yWIYHI7zV04lRQ28hnhgl54Y6fGRCQqjZZBgk0ipNN49Ic2aj/dQ94P0f0
	IAtZ/owHJjCr5yFB/OdR7rkerRhy2/tJ2evWCz0FZAx6a5Au10tPtI9Ur6UobzKnnzprvL+Ey/e
	J/RS2i52C1Ea2wqshgCy263JQUw+qAIdiGfanGjmgrwA4xyljeqR5
X-Received: by 2002:a05:622a:8d10:b0:509:451c:ff45 with SMTP id d75a77b69052e-50d4fa36175mr23346541cf.9.1775134491719;
        Thu, 02 Apr 2026 05:54:51 -0700 (PDT)
X-Received: by 2002:a05:622a:8d10:b0:509:451c:ff45 with SMTP id d75a77b69052e-50d4fa36175mr23346091cf.9.1775134491332;
        Thu, 02 Apr 2026 05:54:51 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:4ff1:3e57:22ec:dadc])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4887e735532sm235790765e9.0.2026.04.02.05.54.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Apr 2026 05:54:50 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 02 Apr 2026 14:54:28 +0200
Subject: [PATCH v2 3/4] ACPI: bus: export the acpi_bus_type symbol
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-baytrail-real-swnode-v2-3-6f5054a4cc07@oss.qualcomm.com>
References: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
In-Reply-To: <20260402-baytrail-real-swnode-v2-0-6f5054a4cc07@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=718;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=mlZurhMjnNadP6KDAy67g1xVZeEONxV++y8bOiCYR0E=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpzmcR38lBliGpLPueBMGx9l4N7WOldUY1iBLmL
 X6A/uXsiF2JAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCac5nEQAKCRAFnS7L/zaE
 w00jD/4znR5f8K/Iokc6CIJ3HPZwuzAtasXmeQnN75p0PzsPVZ0WR2aF9kObUCbmbf3mICyf+dz
 LhJ3MMW4QgNUxwZUy6xVGziyg4I1h5Pha4y9/AhyXK9QNArzf6t4QlxAsSmISxe5qCBo8p9Ch9O
 jOYbJ5Z+RNE/4aTnWPt+37S24FedD7XPG55pVszr4qvRH6Rw70kZKrRXGxJhUSu4uD5qKav+soO
 JMPN4NdeyhvFGa19GEXkkMld3fVQu9ySuN8RNBT/77MjDRHXJFCv9cw9zXbbl1Smo4+cTFXVi7t
 6ypKXLMPYYx03xB7oCCq1XH3chd/TxUxiWguTx57hrcLV/YgelUlMJy+3U+PJoxrXIBOkl5AKGJ
 6SQv08QIsrsXsgFzbTvRPCxicboVTcEo+2TKkX9CBAavhKI8/tqPjnPGePiRiVRAL6yc13abxgc
 yj2dpGf/IekmsWJ2S8gS2MledhgY0HIMP688XuqQC/ZM7jgF8Q77RbvRh67+gzARXLi0Gpr1PQb
 qYEPG80KGj9wqm1zN9CuY17yd5W4iAf+51VQN74CRZPQNlemBSxf0bwNlcl7aKwqgk1w4IYG+PI
 YcxOWDtz9E0ah7XmGDZquiTV7WK6dpnYEbO4sag1P92CtkkiwFkJ7jU9vnCOryMSygeLt5+Xmgx
 vrnpDJlLHqhIx2Q==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: x-Rru0uiy-uahbK8q3N-sIR-TY3rFpoz
X-Authority-Analysis: v=2.4 cv=VY36/Vp9 c=1 sm=1 tr=0 ts=69ce671c cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22 a=EUspDBNiAAAA:8
 a=KKT4v_QfTO29Hm7g8h4A:9 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10
 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: x-Rru0uiy-uahbK8q3N-sIR-TY3rFpoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDAyMDExNSBTYWx0ZWRfX2M9DHdnKq7BT
 knbq1GLcKiLyzmpvIWKa+jdmCzynGdsA0NbvlX6YKbVjGPz55c6/LxEl0jIIDcOrZdfUyinGvxX
 3P39OmEKr56uXFzyyX+M3+Wdfw/lY55kaOHgOmSFoUcjutErMjkQaBuMotVrWkI8M+cb4QQTlof
 xmML6Mzs+ePo9/dzdTnzdzMGNW+wDBLtHrQOFJBq6uOnNMVuytA/NPIv8RWZel4KGwh9Fo70yNu
 Fc53T+zlhVb8K9588SzX1ldt/GpnRZu2pvZjbodmTTdLDPKm6uBQZuRhQf/Bw+CMWzIXfYcN8Xa
 fHvxYovWmnKYiZ3F19SbE7v0dzpo3XDPS8n0ac2jkoJLz0fZJY6KrIKggRuS/fpwST6yeAe/pI9
 4a60kOYD60LCpi1WpBBIiw7CmhRN4RCJBmxw99Eck2zxoT07Qp75lieZElsZtdcSo9lbdcYce6H
 SHEZmSHE1iU4SAIh47A==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-02_01,2026-04-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 clxscore=1015 priorityscore=1501
 malwarescore=0 spamscore=0 adultscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2604020115

In order to allow loadable modules to access the ACPI bus type struct,
export the relevant symbol.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/acpi/bus.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/acpi/bus.c b/drivers/acpi/bus.c
index 2ec095e2009e40b0645f654fb051429e5679dc7c..d4da76607905473de2e25e50352450c10f598784 100644
--- a/drivers/acpi/bus.c
+++ b/drivers/acpi/bus.c
@@ -1174,6 +1174,7 @@ const struct bus_type acpi_bus_type = {
 	.remove		= acpi_device_remove,
 	.uevent		= acpi_device_uevent,
 };
+EXPORT_SYMBOL_GPL(acpi_bus_type);
 
 int acpi_bus_for_each_dev(int (*fn)(struct device *, void *), void *data)
 {

-- 
2.47.3

