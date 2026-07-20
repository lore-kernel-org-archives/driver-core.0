Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 770AF3B9DA8
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539533; cv=none; b=f5EHY8OLj4UV95DU0vf1J/c+/zGpookOzCESNAW9RM0ANOrRp/1CrIt33xBRneKZoZPjydRQ4pJ2pXlwQReKyBK+3882kqGq5zMJAfW0xIXxtaPwf0LQYnvwYvtPB0rCu0lIwSlhQiYZbP0rfU7ZGE31qYW/Yq5160fHnLGjOI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539533; c=relaxed/simple;
	bh=sj3G1vA76GGMvTxTrnIke6x7OVx8A1wtoaHoSynVfU0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=SWHfpGtsiBLAliNz8kGFTk1O3G5sTes6kbRJWvRDxk0wm9TG5yvgHNYqBogU0cGhF1L0hea+dcCcUWCNEckbtz6NFCgbEO/HzLKhFx1sX7hmlJNK1g6ik1XzyihnV+QyvnK+fgZvpWWi8fJsYKFDswx61bTEj/AbNTPL2czhYN8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=fJtWX/f4; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=YM2FtPai; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="fJtWX/f4";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YM2FtPai"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7YDit2043791
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	AI+EfZ7yUUjRJ/yYVPoEI2N0HcqWmjq7EqyYmjIn1lw=; b=fJtWX/f4Pep3nCDv
	t0l7qxrd7PP/pB2HZ9HkVtp29x85Der5J18aJuKzkok6pooxZYFA8Lm6LDHDCGZZ
	x+giSv7G8qFthdMi5GIv+8a8nKxnwzx5PpVRYDfvJfbh/yRbqr1r+onEP6AKMmc9
	xEFPtzMvhnGbchF6++xB8cDcp0xiSvd+d9maFoHbBycn1acsNhvtZ/IBa1J7MMj8
	w0lBhF6VlFeiOho+nKC9pmVYk4vXEWJCzSyFE7xCliPCyPUksUX4eFpDWGDmsmFT
	ZD0BB3+DYaqd3N1K1UqlOQ7Ohqg505rr5uvVmvirKZ6tOoDnPlAfLYBjl4bm533x
	EFD/Ww==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com [209.85.160.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfdcggru-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:29 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id d75a77b69052e-51c0408254aso82758151cf.0
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 02:25:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539528; x=1785144328; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AI+EfZ7yUUjRJ/yYVPoEI2N0HcqWmjq7EqyYmjIn1lw=;
        b=YM2FtPaigo/JRuD7E98tpRAtfpuS6FhbBPnqcQJGQq78UWHXhSH5TuvkfkK2g9FkS+
         1zHqudWF0R3Ix/71ZEm35BwGgx/SwCXLZJXSo/JRL8E9SYlRTe3H4n3xIeZ9ADZoJdRL
         qVtoZGQM9cn59uR6sARuW8GSrlfDcUbsTHRMIPQ+Vj3JlyHSHgw+y0eRg0tnQrRe/Bdz
         6WqNrbKEBahgKBGSKOgr+X1tp5I5Y1RkytSFWiYOTJuShiHgcrrSOQrD5HhSX3mh8KJr
         GFxyTh3gc0Fe8tscrIqzrBplLcoZoGt4a9K+2zaRgb0H2HOfodJRxXkOIEN7QB/JOSOM
         cfNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539528; x=1785144328;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=AI+EfZ7yUUjRJ/yYVPoEI2N0HcqWmjq7EqyYmjIn1lw=;
        b=Tvjrav7lS2zO3wQykLrxvHo0fA9dNo7z1Ef+x5rG6NiK5Hts/kRMafgbEo40zRM0mf
         cXwTTSW9IYYe9zZbt7THPwrnMXP4ZSrdQ/YdRGrsqVorJrP8JMkZoWRVj+T1WWC3BXD5
         UDFq0U7Feu0tkUet+knb7nq1XtnOi/X5ZcSLoRKF3Iyfg12nDaqxLyecmuDRcHSFHxac
         nAVZ/ZmrFx7sotn+kdDw882w+a6UI8b03SIpOC/g6aP1Q6qRq3buecABcWXBjkvynHhO
         Jw4d50kMYKnFFQZnfObhES9jbE2iPBybvTEVxhcPchFOzKJcPkvbQuG1Gj5JqLGPEBBI
         g1Qw==
X-Forwarded-Encrypted: i=1; AHgh+Ro95dKGCNwGFNGh3gMYCo9IhnN4F1mmvqoKP0Ofshkym4eNZpbqIUldc1fcFdHztN8QoGzKu52jBje5xQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YzgGWU/OrTQ6XI+EZ2zyH3x/yJLu0w0uEfD48wASN6Whdy2jYRT
	3bNS0nKsBzAzg/N0TNorr6vPJOaEKoBAYlzQbXC3KeP7orjmf5yt9jg2AaXih/FQMd0UpFNiaB6
	+kdcbwPZ6bOwDZ04nV93uajUv7YZ8f6lQuV6qIV5mvcCWqZKX7raAQP73F2E3IYqZOw==
X-Gm-Gg: AfdE7clTRpj4E/1+D+rZWWhOW0jlnLkrqOlJ7xpjX+7kBK2XAOCSzahcDz6PpHtQyVB
	Y3yR3ECb91bKvO6D5ya0iqQKNHi+yK6N9iRB+j5uJexvsyXHWGebi5xSNaUbECTUv2hXvTfjMx7
	5TsNhWCXRo/2DpsDhhsOfuqOrVgTQHrKwGbYsr0ZFNf1ikwPDXZAWrNaG8QQrKIMDTFtLCSFeku
	m+JQ8iMWf45zGhRA/r836GeNCPZyFi2rLMQ2se7Xh+J/69w8UI6+yWuC4te9AB6TVFwStZOg1XD
	z5S2rvFc6lFmph+eIIfBM97ku+eQdRXv6aujWIDzVc2H61EKN//jv6PipvCR5ZQDV/V3Sflx0iN
	SVyzk7+Ky2mPZ677dt4OkG4exXO5BLw==
X-Received: by 2002:ac8:5850:0:b0:51c:753:4679 with SMTP id d75a77b69052e-51fc129313amr171953771cf.28.1784539528204;
        Mon, 20 Jul 2026 02:25:28 -0700 (PDT)
X-Received: by 2002:ac8:5850:0:b0:51c:753:4679 with SMTP id d75a77b69052e-51fc129313amr171953301cf.28.1784539527779;
        Mon, 20 Jul 2026 02:25:27 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:26 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:48 +0200
Subject: [PATCH 1/8] powerpc/powermac: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-1-2dee93f42c54@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1029;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=sj3G1vA76GGMvTxTrnIke6x7OVx8A1wtoaHoSynVfU0=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel4ao2b6PC8YcfYlmQvKjVNTYAN1ewTrHVv4
 VS/GA/4xYaJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3peAAKCRAFnS7L/zaE
 w3NgD/9l2EbcigcAHxvPVoK36otzZzzZAcLLE1rOxvRGlo6hSfTfqwyjacSMxamoCAzMy7RJjY4
 O1Q9Ez1UjISjLIv7zC2yWIvgwDNXQoqYzZNNPk0nE+DkNW5mh9IYSXJXoSWusyc33i9/0/0RHEG
 dHMiRRQ1Mrwm399I4y0GsSUsuCaB4vaNtyu724qEMD82zpNS2bhn37rTUp0ySxFBdnrFYjbHDh2
 ihyPtPJ2bV48l6uhV1ZWpQbnsiWKLrv3jq2ZvSLH2nwSMYEeor9SRF8DE9Ox/CMBlHs+x4BHcAO
 FOc9zwL/KMXVNgGr/v/x5tfU2uoYCOhSv0VbVg5tztPlS0Nytl8m7TbbYS338vEYXe9DeA+gXoV
 OlfG8Gh+v0cTkDkG7mjFAJ3cBxadQxInBHxvd2/ehlw/G7xlFJcxGEK9YPdqcV0X27XKvZdWAhC
 rLW9Hgvx2nHvvrwx5BwFbRBMyOGBIfmoyzp3OT8dkY9Af0TC2TTM7jQLdBo5pLVwhkEdvVdoR5G
 iizZ+VtdCoawhMt4eV6NqRz8JGdSfq5WVQiiPbPD4zkDOC+zTiE4k8YwxWGVkBs0DwhL61wlCWg
 3x6Oek9Hdyi64mhLonLyra44rbLzUixYPetQ31t2fI8SGC4jqzgPC2nEKFZ9JEaogvOH+qz+7l5
 cGgc2lbHIuybUhA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-ORIG-GUID: oZKc6JYAwGoONJ3R0nGoUhUGw8us1RAV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX82zPrTvH8pCj
 EV0DlLS1JXjzuWSFmHVanxkRnitnS17KGrpV/cdMBFeFRZVdlLATG/YAYM7mpUUFvUvyTNi2bJj
 8g4zDIS1qJVVfbW0otdL3A+RqQhAIGiNN+Nn4ZnsUAYZzEulAfSda1fhbLms8AkeWBM3ZUFmrRz
 mL7sLNja7PLv8GOOfLbtPwdAJOOCdHQu9z7IRSB6n9GSNWYtzN3Oos++rcFKipbQRtL6nMP64jH
 aZmZOr4HCGcdYaXX22x8RubBOPo3Cz3N0hE4//E+RfOMl/JH39fSHsPlc0VAO1ASrjVkH5+bdb8
 iWl4BVNpqVvFipc/PpvdraXNulB9sIoub9Xr1V6kuOE9ja8NmIaBjUeglDzzakTq95jXsQWl3YQ
 /4foOQQcPLJUr/AHH9drZvdvQfh6GrUbz91nZJMhLGDFS7Y4u8tejuOZhf90KLeA/9YPERZRVNV
 u6VYqOSYEJPGGIe3VJw==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX+zLTwH7JBLO1
 Yg94qjZZ+m8pJ2DZobUPWBpsIzXd+3/Abl7ytPVoCTIZHkS3oq7/ke/XeF7hn2cNYzaBXB+AUnv
 ycHCnTtigCaBGOd7omHaN9qthRIJJV0=
X-Proofpoint-GUID: oZKc6JYAwGoONJ3R0nGoUhUGw8us1RAV
X-Authority-Analysis: v=2.4 cv=bv58wkai c=1 sm=1 tr=0 ts=6a5de989 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=EUspDBNiAAAA:8
 a=xOXlHDOaurapFSMEQ2YA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
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
 arch/powerpc/platforms/powermac/low_i2c.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/powerpc/platforms/powermac/low_i2c.c b/arch/powerpc/platforms/powermac/low_i2c.c
index a175a32a222bab4cc7400f6ab6071f5630db2cb8..eda35534cfd72e828616f27b5f8319189d68285e 100644
--- a/arch/powerpc/platforms/powermac/low_i2c.c
+++ b/arch/powerpc/platforms/powermac/low_i2c.c
@@ -1471,7 +1471,7 @@ static int __init pmac_i2c_create_platform_devices(void)
 		if (bus->platform_dev == NULL)
 			return -ENOMEM;
 		bus->platform_dev->dev.platform_data = bus;
-		platform_device_set_of_node(bus->platform_dev, bus->busnode);
+		platform_device_set_fwnode(bus->platform_dev, of_fwnode_handle(bus->busnode));
 		platform_device_add(bus->platform_dev);
 	}
 

-- 
2.47.3

