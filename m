Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8A713DA5A8
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539560; cv=none; b=qY5usPA20xouCtzJMdDkc9PZEiiKlNbbpIIfN0WxmOnmc4nz5JR4X7R4fuhLhgLQW/GnoQzhQCl591+Kj9vdzNHL+x75SiV9hemA3JAA9KJNPbVqwkzgCzWMrf7vs1u7ilR9UzoTLtcnUuPqB11L3IuuR189iBan3F9CQ3wA/n8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539560; c=relaxed/simple;
	bh=5dZucFiY5F1RZ51PQHBmBTY1Q9tlwcM2jWxPuS3OYck=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BaG4Ia4CIm2SN21eBoDZBhSUKyb4+hiJ3CAmLCn8lpNacldi/v9PAG+YwzetlVoYpMqL4gsm9MUjT6MeOvn+vLzJ7OjUHuxjvG1EGdgxRHISvqjviGqYc75E9SaWJZadkXxHHDcLsLi3M6RFgfo0DCHXWoUaDK+xars9ebYPCYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hQU8ohY7; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=RF3lXuVB; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hQU8ohY7";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="RF3lXuVB"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YNun2044270
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=; b=hQU8ohY7JoqMaw2o
	gJQ8ERonvZCbG53rd6f9Hj6Cy0YgpXa0kbaTI5/QqqOon0C02V4LNJ2+EsdouW+d
	TTdw5/a4an0Mxixvb4u7sUgDtxyyaoLg4OGI+V4czR5cPkZVb0VZK2oZ8NKRrKYN
	HaV/bbPfTsJmJJOWjOy0oW6uywW1yCdiBV3uKsuJMdUsS5/OwiAbrrLMkLjl8pCw
	6PkjRX/plQV5ge+glDz88N4CyiChe2nKkBfMigG7FqSutZKY+CKqclYBBWtNiH3n
	aIzeYqIjbaH+v1wG+u5THy8VWCAsa18Pi8ZjeTQ4HFBwVptu8nrxT1cEE4jW/2xB
	ba8Jjw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcggvy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:54 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-51c1d30035dso127075361cf.2
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 02:25:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539553; x=1785144353; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=;
        b=RF3lXuVBpbhcaC0l2uK9ssUnPwYINKuk/tm6wr4DpHmQYWW4gsT6tXCqsZslbkRK+1
         MGjlDpXYkDGVFiyOFBap/TPDfoFhKczco+IS8Kmyzmv6oxeW5SKHjesB4Uj5v6Rs8/Tr
         QZWwEH9yMi+qR1kEsVHdSzFagsV5+o575MlnNrQolGFuceR02Ec2E0lsZN4CONeJXPQJ
         jCt89zyRzGOC/8rGs0Z/eAfd0IO6c1tSkqFHbcWPTs1TGJO08PD6ew3dUnFJFflOd4R/
         BjjIo/YDXDqOGy+3u5M5TXHDC2g6MqRrGeQzauwA8TAmMG1krIYQ6WwWNRtVYiDhnjBw
         fVSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539553; x=1785144353;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LRiqxWscnzoXzK5RzWgNrb1z34B4tTlhuTiV6c1388Y=;
        b=SCPUqg9jL1uh0HD4MMMMW+DV0Twt7PBcG7+fjj18GX0jxRwsRmiMvV0Y53eUOnBtlD
         JTRMgNZw69/O4kbGmKdQH6yhmviH7XCciBp8wESnqEwzp3xRPYCwIwvBBtsUXFJ7ZfzB
         weqBMRdaFJw1zqVcBlKNzjYJXMy+ZyeBHQ+HxPEYYZPuq3j3m5EGB9j9aqxDs7m41mEE
         PDY6h5qA4CKyXWR9Z34EIYHxbn3dQ48P4KyR3oPin19QhLOnWT6c/YfAa2tI7pVPGbrA
         V5GnsRCWnmVDNI33Odm5dZV1Kky7SUK8Bh0vLSpQSQGFrdjZcMe1KBMLB2K4TwFXCOKO
         8X8Q==
X-Forwarded-Encrypted: i=1; AHgh+RqP7dVAbRqpDbmCMEg5WqzbfuSil2ixwdpcbdLiKz+b+rOrDqAdOUO/mOWFEkLojdj0wbDlnJul1ACG2A==@lists.linux.dev
X-Gm-Message-State: AOJu0YyrDaoLRl+z0ok9V2dPnwV45EwnzrtWZ78SwNQMXMEqifnaoUff
	E7929cLz7Qx4vUffTCoPnzozm20z7Zx9hpQyqv8sMMoFRN4hMmyFOVTlyJRmYENcCzsHjWZgpZ8
	raM85w6PrBYhnYgYIccyLpQxpMzxxQqZJCf1K4LR6+/vFJfAcL6NzpOxj97+VDM86rw==
X-Gm-Gg: AfdE7ckK1xw8210a+E72UTIFvlW+Y5byWXkmxuztV0b9Nb6EkNGqvm7dwJjTegenBRI
	woMqo8wPi9inLoWXdlLK8a2vbamzlrwKfQVe9i6+z2LZoI/XcMfkWAQ2TApyuin6y3MeTVp+EVz
	0TGYkWvtKovTtzh6wT0rBxb+AvNgIZeHcH6WBbPducvToMs/Zp/Zj9C8qR9AJAbCNf00b51KMlO
	9Qipw6r5ZTSyzJ2f40VMVErJLj1QGF3gadZbNF3U4EJ8jdmB2CNqZYtKAGRsWgKzLIO5kYoLwdX
	EFo1HwBaX4p+rjBjhCWSdoSayz+7KcEsidORmwTAFmBUSRbsatCxbasM5eO7Ci19PBn/fZmRxa/
	m2xoC1y7Yg9qDtB0+W1kT/wslFkox0A==
X-Received: by 2002:ac8:7f83:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-5213daa20eemr117920931cf.51.1784539553335;
        Mon, 20 Jul 2026 02:25:53 -0700 (PDT)
X-Received: by 2002:ac8:7f83:0:b0:516:e062:1a83 with SMTP id d75a77b69052e-5213daa20eemr117920471cf.51.1784539552960;
        Mon, 20 Jul 2026 02:25:52 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:52 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:55 +0200
Subject: [PATCH 8/8] slimbus: qcom-ngd-ctrl: use
 platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-8-2dee93f42c54@oss.qualcomm.com>
References: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
In-Reply-To: <20260720-pdev-set-fwnode-instead-of-of-node-v1-0-2dee93f42c54@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Madhavan Srinivasan <maddy@linux.ibm.com>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Nicholas Piggin <npiggin@gmail.com>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Andi Shyti <andi.shyti@kernel.org>,
        "Joerg Roedel (AMD)" <joro@8bytes.org>, Will Deacon <will@kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Doug Berger <opendmb@gmail.com>,
        Florian Fainelli <florian.fainelli@broadcom.com>,
        Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
        Andrew Lunn <andrew+netdev@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Ulf Hansson <ulfh@kernel.org>,
        Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>, Lee Jones <lee@kernel.org>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Srinivas Kandagatla <srini@kernel.org>
Cc: brgl@kernel.org, driver-core@lists.linux.dev,
        linuxppc-dev@lists.ozlabs.org, linux-kernel@vger.kernel.org,
        linux-i2c@vger.kernel.org, iommu@lists.linux.dev,
        netdev@vger.kernel.org, linux-pm@vger.kernel.org, imx@lists.linux.dev,
        linux-arm-kernel@lists.infradead.org, mfd@lists.linux.dev,
        linux-arm-msm@vger.kernel.org, linux-sound@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=900;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=5dZucFiY5F1RZ51PQHBmBTY1Q9tlwcM2jWxPuS3OYck=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXemASNLxq4W2lq91kA9NcZIXQVZtNYnprewvw
 3yHlCsy3VqJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pgAAKCRAFnS7L/zaE
 w2uCD/wOU3cBVw4EUJf0UYoXTg1HPMi8P/ZsqqsWmYAwjo7fxHcTqJbrn0eiqRL4DGI4WMyvG60
 V+0SsJlynCdNE7f5EUlwizOq84HOSgkOFhWcy1qO9QHvA5ZUn3pD4p5P/apWnvlfSjMrCgfW6Cv
 j3f/kuCfwhE3zvoQiwbJKsw3Z5I4ZvzyAAKpuw1L2UnIz0c4PF3F3aM8KSrOJAkVj5uvCqWv1ec
 B/AYzpNDdlNiIKEr5nlz5onmZgVYEc488RYdR8D6I/WNggYPzyNFLoESaH43Vxxig+CyAwrsjzZ
 o8d6pZtIyZAaJbH+7hGLtVAdr8JNHyKtv2MeIkWDsOK5t4odmeepq+uGt4Z+wLL5txrMInQNa9i
 CpwMS1b5MsZ2Zzub7p1c+hjtTrFLAtSCsLnDpuZeM0kspndYPXH+9aJ1ikuDaIY8rYYY45PmfVl
 5IPBo0aXvFJ1cF+N5N/gFPL8eHrOSWBGQ4E+1GkdbYVljaIC1z2a0evNxWVYWUlYGAIygMAktf6
 EdLDOWEg9v5RX8qWkht3mSA1zTTRpZyQ2jiUBxOl5UDbZBOGIvc4w71t3cYV6WAk3qn92NyUB+W
 zTJ+U4R83omht6v8g6JVuiBdRHrh1ZIIR1GZDI77FyHqG14uso7dcBQnQYs2bVz/YkOSo5imubp
 GZ+Ni2cPpMJ3VIw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: 8xAajqw6EvoXUTuwIbnvWSMLib1x8GFC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX0wL3yP76OqAG
 hwHpT8+hlHq+v70JMdaG7EVc9O1rfI5qhYQKX4mPM6TOC5CnpOgqbCiZaUiMfqqt2UZgOW/SFn+
 Yj/Y7iH4jLiS5kVe6hOpyxzzojzCtW6jjGFBK/LyvUciO3cEQQlzxBcPSBAv+3N2uL0RDEe0IZy
 7HJcLRRshqHEzuPdoB8kKwVQ1MA/2J8pGFkWOyUce8+E/gORJguDYYMSTnA9viqXPeJ+S8PtyKR
 J7MvlR2e3/xqfRAAONM3wj2u6024G9V7dfG0t7geR++Kej5VX1co1nVcnH4URWbfPeRJbwH/GcL
 FSNB3nFdcw4ly6QTalCJz/QW/1Gmr/qzHs886qMopTaQIi5DjahtqxTRIDLbExlhCvMyy+aOBK7
 wnVs/rwLBJdowOEYjE0kmKxzXtocrox7FJms0k+u/7XK63x4+fkr9zbBiSmxdaFooNl/LB2/qg+
 yAeYWul/rBxE+ZSkEig==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX7rq9o5qwWcF/
 T2PXhumx6x4j3J0PKjQUixLjir9DUmxwUj74jMlWPyjBQP9q+NgfZSiHzj9MH5rgmZKs6/9TxmD
 ujfaqavXHpELOsJikuVQg7OkGcDRYUk=
X-Proofpoint-GUID: 8xAajqw6EvoXUTuwIbnvWSMLib1x8GFC
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5de9a2 cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=Dy7njVIJoQnLZkscNskA:9 a=QEXdDO2ut3YA:10 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 bulkscore=0 priorityscore=1501 spamscore=0 malwarescore=0
 phishscore=0 lowpriorityscore=0 clxscore=1015 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/slimbus/qcom-ngd-ctrl.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/slimbus/qcom-ngd-ctrl.c b/drivers/slimbus/qcom-ngd-ctrl.c
index 934c44c5bc1a92fae98f52bccd12ed849379dca8..bf077f47c9ddd484c11f98b47d2d8d4daf78dcb7 100644
--- a/drivers/slimbus/qcom-ngd-ctrl.c
+++ b/drivers/slimbus/qcom-ngd-ctrl.c
@@ -1538,7 +1538,7 @@ static int of_qcom_slim_ngd_register(struct device *parent,
 			kfree(ngd);
 			return ret;
 		}
-		platform_device_set_of_node(ngd->pdev, node);
+		platform_device_set_fwnode(ngd->pdev, of_fwnode_handle(node));
 		ctrl->ngd = ngd;
 
 		ret = platform_device_add(ngd->pdev);

-- 
2.47.3

