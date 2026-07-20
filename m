Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02B503D75BE
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784539555; cv=none; b=QDa+0XQ2j9gfwMHt1xP4RSGDe+xo68FK234lSp0bFVn8odCICN9x7GxK2y4TDZ/6tirPx0hGtJlqkVCnK/wsxZLBTDc+1XEowuVSoDugl6TILTBS80MMXcWzYrJ1UO7FTuOLBI3uaNR/cCiUUUaFbkdiaf63IjZeKoI5pCLfRK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784539555; c=relaxed/simple;
	bh=RqOeWSIPxWyUUNyaNQX6aGDUFSUyf76Fp8vD0VV4O5I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WPuRI+3fcgcA3zlXhGIGFVscZXUvgfrEsO/CLrvIf/PVqgdVAoJiAY/06ATjIn5w3yuGZ3Rwnr9k1/6qf+JGOfNZawXbgf97+jAX7pB1q3FG3att27X6sOahEnuSo7ipalTvajqdbOPg6rV8ZPZ3onvFZl6+X5qJYcy5hVo2I7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=pDhTnvx2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=IbxhZOMK; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="pDhTnvx2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="IbxhZOMK"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66K7rk132980062
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	a7cvN8ziBliEDlKXepkct2t5ZxCcKqWtksF/xIVyVhA=; b=pDhTnvx2RVHQxDXo
	L74bzKL50Y8XvXYW/tZO/n/eD374mT352KgWjZjr6iAb6e0RHwKmI6PwYGiVL2qg
	zYQPQkOe5ejxbXNkih9928+IhyjhzSc/StiLZ9oh+V7q82QV/W3GEgIZAMek855a
	MFf3bd3xH/Jbia99eklhqrvTT2p3JlcPRWGn2i80jyScu/awSJLAMfR2xk2jdwxr
	vWI89MZ9/NSe3jmaj2AuAJ8l70gBWXPwePtNLKeQbsSvYY/3qXwQkG+UMexoXQNl
	2sxUrrvWDLThto329LYAqNROuXnYs5/Bk4kfqWH3txfDr3D1Gv331NWrdBOJiD4w
	BrBImw==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com [209.85.160.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fhfpg0eqc-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 09:25:44 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id d75a77b69052e-522de3c645dso49423801cf.3
        for <driver-core@lists.linux.dev>; Mon, 20 Jul 2026 02:25:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784539543; x=1785144343; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=a7cvN8ziBliEDlKXepkct2t5ZxCcKqWtksF/xIVyVhA=;
        b=IbxhZOMKISULwXyPYxw383kJTOPcXssr2xx2DpKDK/R31mwPhr4nEp7GfytZ99bHLL
         IbiGcRZx9zWhXC0iCFSZ/plOtFnQdVs1tLMRat6hmLXIMA3rC3dO+6/qwe2YEiJEm16V
         iLeiDLjiHT7Ubgz/Pqkcj3fNFdAChmqXK9/m5waIynfd7bULeBH2mk6IIJ2I1U3Vlx8f
         rq760ywCIYx+XLoLU9LlAatVl1EUMJizXHxmJi/yVcs8X4ebNd+uDQPYVZtapJ2th+y3
         br3wC9ExGrpMVrAc8/ERYhaTAOqZb0P9kgEFlakx0JldzORr9LLiS10TpZSZtVHy5hQn
         1aUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784539543; x=1785144343;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=a7cvN8ziBliEDlKXepkct2t5ZxCcKqWtksF/xIVyVhA=;
        b=CY0wYcM2kMZMVRJypN82iQUiBRC+D1XuF/d108ISrRyFheDGZqrJ8tSRuHH90QsRXi
         kiCpOQVLYUoYp0R0+CTj0pXIHpGry9Na2sCC7OOFrNMSNsRYtbbCoPhDSNrZRzCphh3D
         cE1PIz6+Uz19zO+mES/HlWCD44rbquzOgjF1fKjPeTTfTpuehXialbaaeeCFNCaK87oQ
         fCFjnqskYKGakS7uvF0JJib8HrNiBO+dmPwH8lHyy5tHNAOe4rO6ygXifD+dM21rJbmu
         m1jCyEmual4znlq/MBPpYZucSqL3G03qY4mu9tAI6TBUsK8e6pG5R0QzC3hWDqU1r7+5
         ++bQ==
X-Forwarded-Encrypted: i=1; AHgh+RqMurA4P4WKxZZoxiOmBr/1R1RsPXV/Rm3+9lSeekL+4uecK5nouTJRo8PmE41VK2Q9TOHQhp83q+omUw==@lists.linux.dev
X-Gm-Message-State: AOJu0YyucZ4Kz+3gPF/UTM26OPNhVglaaML6s5hGZA8eiA0+r/dfmabl
	+2Yn3vxZh0bC3zL7DEAjbTMSDAgYk6AQInIZmU9+5o1/zsuuTlEjXOB6d7Uw/6YmnYTI3cCZLU8
	dyjEo3WMJ6873yqAdjY3YedTJm/LczPQpasX+Mp8o9EZYgBwyY7zTFh9z0UHUL35WJw==
X-Gm-Gg: AfdE7ckPPSM3rSKUboDPbaS0u8YO98+Q/NP2BAR6PsBPwuDXQQYDx36YNyRhjfEydLK
	lhKtW/5IlbO2P0xuIwaqSLpRNkqnkgdLbxp/TBmxbHWwV1+k2ysYORB8mtPOKW7hLhuJfHvNABn
	GqXWDcdA734zAJyXcW8d3JPD9LDjMGJK5njG8CF+UueyTdQVFZLDed4050Ooidcfu6XRoDByUro
	RBZOcAM0woPGyEkl8sSRPhp6DPWS3cJLgckKYWVSvjn/0M/Rcirg0zpKvef1VDOkvffEuyEC6S4
	Ew7DsBG9UmDuoPl1ZDNqHOaK1fgMNHl3W8ygjCmwYHRjpgI4n3KMsA2OJwUIrREOfYFgRt7B2zV
	e90KUjKE9akD/N6HEdTcvQyUEz2l54Q==
X-Received: by 2002:a05:622a:1cc4:b0:51a:8c86:bd3e with SMTP id d75a77b69052e-5213cdcae0cmr123372971cf.59.1784539543090;
        Mon, 20 Jul 2026 02:25:43 -0700 (PDT)
X-Received: by 2002:a05:622a:1cc4:b0:51a:8c86:bd3e with SMTP id d75a77b69052e-5213cdcae0cmr123372451cf.59.1784539542656;
        Mon, 20 Jul 2026 02:25:42 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:65fa:60cb:c205:d511])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4955de88951sm62228205e9.3.2026.07.20.02.25.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 02:25:39 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 20 Jul 2026 11:24:52 +0200
Subject: [PATCH 5/8] pmdomain: imx: use platform_device_set_fwnode()
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260720-pdev-set-fwnode-instead-of-of-node-v1-5-2dee93f42c54@oss.qualcomm.com>
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
 bh=RqOeWSIPxWyUUNyaNQX6aGDUFSUyf76Fp8vD0VV4O5I=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBqXel98Yq2nzHQpr7zc+lfp9wUTQhIqA4ulbVtz
 ++G9Q0pmKyJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCal3pfQAKCRAFnS7L/zaE
 w817EACiOlcLCBRprjyobSbum4i2BmSVzsdPwYul9dr0OU82QH1C5u8pWbLrvuPsQB634ec3Jfd
 GZqYJlngzIE//uUIpnHd/fmBmZGgAwz/qNkfpmEITHgTZg6wNLiAjJxEkreHpzFaTo1ET2Bvw8i
 5XM5cJ97A/3jhhSnDO32PRFQ7w5NAk+ClsamFytOSAr77WKUfC6ocdJVann+NfsPdU3XTBjQTri
 AXcNA7CIj+llJo1OwaMVdlBTJ76MGAhAYC45kEQGz0qpg4eECtUyY6rc2LS+2cToVao7+l47Q/N
 k1pQ/JjAsRPk5Es4S5jXikd3H9ID0hgAXYV+Ywk0zn3tksl1M3CbG27TGBvRp4yq7xrajuympd1
 XksOBEoVT+Z1ANm0e1sLuXLoFLDMf8miLPLRPXspYL74Ca7tzcEqUuKL4K8pU0LYFGvzufuKltc
 wuWk+hdBIobiw0ZC3/h9X7INj2GAVFOzp9dTL46iWF9O1U0RrZ9NlJnZozrfwixI+GElJFwnuap
 35WtJezSneQjrDCDpBRH/k3iKwb0+6Tw673pzmCpt22LACgFd9gRTdtNMlDYSncH8+e/amevHaV
 CFGCZKeDDNgpp8ixAPR3srPMEHWwcv7Pdr8GwiPFBXrUIkI34fsT1tLgmQ8XDa/MDRM6ztgc1eX
 QaDnELK4pLqXNjA==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX8Twa1JDJb+8m
 Irl8NkCcQyXAafK8cLCSGHIRnch4gl4CMAo67BcaO1FDOivrhI0AQduk0sjSHCZW/OTuaGTYOrs
 xylhlkI7WuTXms+6pbYRVei2hXbyFsg=
X-Proofpoint-GUID: eTzZUo5spnxFMNcyrXp62A4nRF-WSCXR
X-Proofpoint-ORIG-GUID: eTzZUo5spnxFMNcyrXp62A4nRF-WSCXR
X-Authority-Analysis: v=2.4 cv=c+6bhx9l c=1 sm=1 tr=0 ts=6a5de998 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22 a=EUspDBNiAAAA:8
 a=RoXXKHpjzh-0z6vojJcA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIwMDEwNCBTYWx0ZWRfX40vFPDWl5aes
 KzyNy1E7yS20sHbQ2kMstRjJUhYr8zRmvt6TAYj4v53d48J/Fvb4c4qoGXTpksES0uDj6kaJnXC
 MVKa9E0upQtcgnFJDH9I5mwBEP1bjRFgNkq+cdZ1eIn5k/DW+8XLxMOfxy0/NUnIJ0O96BjOduF
 b7nlCUevgtp45wX45EmCi4t30Md7EeZlipLodSxu/Px2/rR2vZ6Yo4gV5Jl9jX3Y8FvmxaRcK3g
 Sm14IITGnAmVxdJS1C3HQug+HQm5RRFWRRgB0406SWkqUULTUwaEvEwmQOeSHxb3Dy1x07oy89n
 ZJD3vtE37+9Vce2ctuq7L1MDZl7OlzCwPQewudeplPBUlQozMKEKSCgF2d5rDm3SRvycsuO28WO
 FtDQA5l0efS13mbSIDG4ZrnZyanEY8OPWWNXmcYji4tyAeUnoqJcORXGVZ6QKKe2aebtNgbywHZ
 F3rDC1BH5Z8OiJodTeg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-20_01,2026-07-17_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 suspectscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 impostorscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607200104

Prefer the higher-level platform_device_set_fwnode() over the
OF-specific platform_device_set_of_node() for dynamically allocated
platform devices.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/pmdomain/imx/gpc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pmdomain/imx/gpc.c b/drivers/pmdomain/imx/gpc.c
index abca5f449a226fbae4213926e1395c413160c950..c147eaf048ba2b79a744ec87029420981581e48e 100644
--- a/drivers/pmdomain/imx/gpc.c
+++ b/drivers/pmdomain/imx/gpc.c
@@ -487,7 +487,7 @@ static int imx_gpc_probe(struct platform_device *pdev)
 			domain->ipg_rate_mhz = ipg_rate_mhz;
 
 			pd_pdev->dev.parent = &pdev->dev;
-			platform_device_set_of_node(pd_pdev, np);
+			platform_device_set_fwnode(pd_pdev, of_fwnode_handle(np));
 
 			ret = platform_device_add(pd_pdev);
 			if (ret) {

-- 
2.47.3

