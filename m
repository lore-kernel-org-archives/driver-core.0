Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2A73B4E95
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 10:46:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777286818; cv=none; b=Md0PGUBvK0BN3qotHKVVdh92KEBNYThXJKsRycOxlhUjNavvqWoDZqBmlVYsB3/1qkth8+PLL3PMDfyzWMJ15RasdqqFQdV/hr2dI5LMTau/2C0+Woh16eJoCM1Hha+cgEts3VDk1r76lOmZc0IUtC47JtHI5Gk1KNpmgdHiBSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777286818; c=relaxed/simple;
	bh=V/jdywlesUY0uBqaYDi3Ugol9q+X2MLKHVotp1NpTxY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=LXtpUoQxYGG+JqU8WxyVJXq2BnWqscXaqlD2LePi9AeayRLAl+HEmeV/Lyb39PjqkFX7drzizDEnPxrC18FqMMz1HdMfONd2BoMn/fOQJr1PNN2mWFk6wpnI2iilZmA+hY2bybhjFxASqEkGBWFziTmeIkAJl4SbdGRGGnb5btI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=n13IzVUy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=f8lORa4g; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="n13IzVUy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="f8lORa4g"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63R8TAdD2793056
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 10:46:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	RsbxN8Qz/wnXMZHP/0VohG1ZL4oE2/MEeGUw96S4+dk=; b=n13IzVUyrBWjUim1
	8TcZfdLeoeKQQVrz38vDMMheKdB1uxd6Pnf/v0/u5xrGsCTJjgpQiWgb3eEtpT7u
	e/LnT7n83kCvDDwtgZr2e0c9dlBGErYZMHqvK/ybI2uZN/P3lNrN+gUAWPpBIgU4
	NQmYDfyGma83bXA+9Ec05a53DIKfY+IGpWeYS25Jt3dKk6Y/nzxSFB7bG7xptV5v
	5D0HkNJP0D4g+v9F7oePyYPlmiC8lFQYBBB8HyvonLv83COX4pQwQo7sM26db531
	PvSj0zoMj1a55DcmbuhDUVWExV1p9/4iSmK7TGDJ+zb1NluMv6AwzBYWNyGXU6hq
	3ZiGZQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dsa4uut79-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 10:46:56 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50e136aff17so184205931cf.3
        for <driver-core@lists.linux.dev>; Mon, 27 Apr 2026 03:46:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1777286815; x=1777891615; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=RsbxN8Qz/wnXMZHP/0VohG1ZL4oE2/MEeGUw96S4+dk=;
        b=f8lORa4gIl7WeNttISrCAKX94FW0iWazoQhfrtd9RAknNfjT8/YdzB7So+vtLHcs6W
         Z5H7Ws0CyTTsWdxuoUqaRUhQ/3MMhbZSnUfxBY7pbqtKEucqJD0oVY4JGkyB4LscTuaq
         fayiJZ2JYW0MRlDZjUbcvz9nrlSgc0cgYnecbma3SJ6vT6h9huc3ImhO1SDfHuXmlRqf
         VmELIA32y45TZad0o8gDscsGZMEJGFaB3GltVUFlccFTP5Ot3q5YeqxrSIK6eJ/4K6aL
         RiYjYMGXy8WAKuB0HWfKxF7k77tmW2pEdZjrDH6E8ll02edPWBp01rJIjS3SippcJJlb
         mpug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777286815; x=1777891615;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=RsbxN8Qz/wnXMZHP/0VohG1ZL4oE2/MEeGUw96S4+dk=;
        b=kceYOIpmT7C6XbG82u+AVOeqt7LUoN+Dbev+QL8+CBaCYU+kKrZeDy6sJbDcb3E6xj
         1XC3iXApXQUOdVCyoRbklLpc3b3PBBt+CoTCcZeD1kFIaSu14Cau8D8scTf7CzwArump
         kOZCe7nE1NUKSCiSyRFbyoetmw0lLqXgMmp3kcXpnSkFnIJOWtsybpaxW4C84+FPN1xZ
         ekUoktrVOwuiglUH+DFZKj1GHq2261eoj+E49EgD5T37DtaW4D34++M54vioOyzb4zv+
         JzFttPF9XUH8J0HTlwZTwjNrUdbJJzbMiLOb67hVAOwjx5YKLNowBYDaPnjhgjTV1Rw3
         D5Iw==
X-Forwarded-Encrypted: i=1; AFNElJ9cXdfqHOKNu3N8FW/w6AJZa8U+GPsoj/FMNzbwNJEOeDMVNbvoB5MmpKv5sOt1HUEPKfrGigaHsjti0A==@lists.linux.dev
X-Gm-Message-State: AOJu0YxgFcE1LkFGyF5/yImZfPlOWoRVbEQiiPVTw72KekHWWqa/2bWZ
	jWMQFxcGa0huA3QJgQvRVzb8lG4FEiu0olIHymlbj9kO4mscZTxuN51KcMdb1Lf15K4kH6Bw9tz
	jpHpMOT44Jqtr/ZdYD/lj42VQb7LeXwWLlSAxrmC0SW1Eb2MaM3WnSzEHLkk5wF7tIA==
X-Gm-Gg: AeBDiesPfIgI7oYcM2TS8OJIziBMwyCz4qaJQUOhi4mVKWbakm1R57f1veSfe6Tt27z
	/SQfHh5D4hN0q8Qb14uFnj5u9rHP9OpfCR4D+0x5ACnmazvMDpKqU/gJMb5lS325szRSXF3HV9G
	NuWLSzwMz+YUOcCLo0ApVEr2As/rz30nhuspLfTN7s+ErtSgjWOLpYmVjFlpN+VQTYMmaIyoOII
	hzU24xZNrWzogEscG14+MEuEOaAks1COhBownEZH73fvhHhM2Bz/lJPhalYGwOPcC3p451O7hwe
	0DsNVTL8i+U2hej6mxzpFsYA2KJGxVBklfoEIdAcRBFp/+9zaRNIU4cWNWNA/HXgn2FkgtGN56f
	tgZqYfaabREC1RRgyJtOItFeDz3fgB1gr3dDH5ICrucpBiPPKqKZIyH6KZU9C2A==
X-Received: by 2002:a05:622a:10e:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50e3681d042mr591454701cf.7.1777286815394;
        Mon, 27 Apr 2026 03:46:55 -0700 (PDT)
X-Received: by 2002:a05:622a:10e:b0:50b:29a6:8696 with SMTP id d75a77b69052e-50e3681d042mr591454421cf.7.1777286814970;
        Mon, 27 Apr 2026 03:46:54 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:5062:ae86:23aa:702c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4cc2cacsm80353681f8f.13.2026.04.27.03.46.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 03:46:53 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 27 Apr 2026 12:46:32 +0200
Subject: [PATCH v6 1/3] ARM: omap1: drop unused variable from
 omap16xx_gpio_init()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260427-nokia770-gpio-swnodes-v6-1-b693296c1985@oss.qualcomm.com>
References: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
In-Reply-To: <20260427-nokia770-gpio-swnodes-v6-0-b693296c1985@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Aaro Koskinen <aaro.koskinen@iki.fi>,
        Janusz Krzysztofik <jmkrzyszt@gmail.com>,
        Tony Lindgren <tony@atomide.com>, Russell King <linux@armlinux.org.uk>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Kevin Hilman <khilman@baylibre.com>, Arnd Bergmann <arnd@arndb.de>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-omap@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=993;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=V/jdywlesUY0uBqaYDi3Ugol9q+X2MLKHVotp1NpTxY=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp7z6WM0zyqbh4rTFe9OeYaJ8UORQWZy1TpMzVa
 Fi0Grpi4emJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCae8+lgAKCRAFnS7L/zaE
 w1UuD/9uvinlbPHUtBcDETd4JBQI3tGcCaYm3dMANDM8oRPAx4ZgZRpNut+RMPa+oxZaFwDka3I
 brxWcXTUT3RjbQ0KTNxh4S6x8xNEOEkb0VKj7C70UzoP2RoWJvpwo27eex2M5pofd3hNSGQz1uq
 6FRf233WbY/AjCdPyA3JqEJILDUdvbiVDfJah/hddCsgmcDwtV3qHSSWIVfVajy8nXdR0rX2Ko+
 vzNiLh7BfTV0ysgr/9TjEEES8t5D36TI/Fqc3xhU8CAQ4JxpBwsirpui5JZVFTqYZnEbf0NFbqY
 1NSoKzPsHsS/dSo1cVe55n1AKjDHfgQ0SPavGRlR2VV/3UhINnXx1OSuRXOMOw/z/72LKK6tVPz
 3wgKMQXE1D5WHnkhI/5dUWa1oWrO+NE//q7YLCxpcr0vXVOx4rrYGikiCaxjDsSAu7XaWqjoPVc
 3Dko5ivSBAGNLKokNcJ6uy25dvKI/aKn9A6ihm6GqlbYLeSNhrDqdO9t21JnECFvs3A0xVXq7Qt
 VUaNnCV/lN4GzoNNFedQCEB5il1OeF+QbJFZh7fXUTEVpI2IrljJNcfG8SQ266oT9Vdg44I/mH8
 ctoNnn9h6Qey9aLjAbRvh5Qpg9ODbYJ73uXif6SGYFZfnNM0zi4Ciwis0VrL3hFGnMFTQ35CAIt
 x7mWdFJZKlwvJUw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-GUID: B-PUUGf1c8BNq4Jw0PnEx8-bbSuLXPZ5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDI3MDExNCBTYWx0ZWRfX3Y3RSv+tmx4t
 WCkuy8hPeG4wX36puV1FB9/QZW7BQR4uVI+SzgNmlK7eRoKZCPktYI4pqzWqgwimUMXlEAxxk6E
 S8/GtBp3/oySP8KzDF+zBowvKyR3X2Vn/0n53iX9KBkH6953lDpVaa5N1A+5POA6wLQ3lRk7UEb
 g6OKYoOXPkxR+YkOaTKPqzvOhAM0RYNUOqqZtdI56wYtbBeLaAtsrVY71Bp4cuyVjEnEdvPAVnB
 FS1ZBXPAvZDU1+qMIy1RWbESlvZI7c81sZd1AAZhzLI2MZzYcLKt0rB2zytbzWHXU1Pw35lVLqX
 Gb21sg/2GasSO27XVOdGh4DOkKrqcWPWl0c+yAKb3hJPedsT4FKJ007R/cOtYNWJ6LWOtlVEHcl
 gm+/6hgMkAOfmlia7XDTtgXrjznQz+VXgJ5i/MA1mLzM8HPfiDldANeR6jmAXbTYRCtUsYEaAWr
 uHO1N7N7JQ4tLK0gVgw==
X-Proofpoint-ORIG-GUID: B-PUUGf1c8BNq4Jw0PnEx8-bbSuLXPZ5
X-Authority-Analysis: v=2.4 cv=J/GaKgnS c=1 sm=1 tr=0 ts=69ef3ea0 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=JtOLnEVYxSPUHa-KuBYA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-27_03,2026-04-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 bulkscore=0 spamscore=0 phishscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2604270114

The pdata variable is set but not used. Remove it.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 arch/arm/mach-omap1/gpio16xx.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm/mach-omap1/gpio16xx.c b/arch/arm/mach-omap1/gpio16xx.c
index 55acec22fef4e73f20935473602ef6cb2f4f379c..e8dbe173bd33fae72c7c884f930a530f78096839 100644
--- a/arch/arm/mach-omap1/gpio16xx.c
+++ b/arch/arm/mach-omap1/gpio16xx.c
@@ -212,7 +212,6 @@ static int __init omap16xx_gpio_init(void)
 	void __iomem *base;
 	struct resource *res;
 	struct platform_device *pdev;
-	struct omap_gpio_platform_data *pdata;
 
 	if (!cpu_is_omap16xx())
 		return -EINVAL;
@@ -226,7 +225,6 @@ static int __init omap16xx_gpio_init(void)
 
 	for (i = 0; i < ARRAY_SIZE(omap16xx_gpio_dev); i++) {
 		pdev = omap16xx_gpio_dev[i];
-		pdata = pdev->dev.platform_data;
 
 		res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 		if (unlikely(!res)) {

-- 
2.47.3

