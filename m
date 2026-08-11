Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43684449B34
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786455450; cv=none; b=rGwI2Mbn3AhtQ8mNowkUrPJt3WsIz63Xe/23Kz5m2AoyQHlo1leYQ3BXPbOPeqANqfgbq3BthMp5iGUEpV1Q6EeotmS4I8IxFfOcwYO+sZpEaheBlue1NtUKZMTOKBBAz0R0rEQDwlgyrB6r9Q2JdPZvCEDjVfIR9oi6w4DQSgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786455450; c=relaxed/simple;
	bh=p2xjgmS67aR70B9SMa1nHtDjkQErJq6ajoUB49gceaw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=CZTX9+wHmw24vo1dXXI4ELIjnRFjWmiBCxdU29sCImVEpnRmvzCO6bTTZwRNwcuWEeP/xPRlXwUGOvhLVGk1pbwAfO0bT1e6HN6cwste/2T68QBGJB3nRlSg1T/YLC+aiV8PowWlOj1rDQ1VE6OZlVVnu3EPSeymNU94DPpDMik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=KygOzCr/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=SyTEo/py; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="KygOzCr/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="SyTEo/py"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 67BDWipY809993
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	vwHxw3zAEaI1XPdj+Nn6C5Vg8bm2U0OZGPmMASab6wI=; b=KygOzCr/BtJZeUGu
	wSFu7q+4DUyfg4jUUY6eqKj8NzC6OS23mMWMVZGpnhcN/WcNMoahTpwFv1dYrtz0
	jA3PpEi0GfBtNxt5IAfj7bnLp7I6/Qog9wbXY2GdaLhPSE5Wf7JCAd/XVTn7ee0+
	jUxDoJpZt1c6cHOUd7DzdPTrDAMMVZWl9UqSZUspIWo3oeqHZCrKEZ6NXHIc5opH
	rANkdac3qePhFrEeJ6jJBxjGd0ZZH7DNMnizkXm04ouX1XZ/qSUOlWgqlcb8u/Mw
	6ju0hhPgA3bHWEz8bgHKv6bfESvWGuEJmUmx0W9mPJjyw7oleAwN7oAsZQ9BpL6B
	OZI/Sg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4g049dg5c9-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 13:37:13 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2cfca8558d2so39864975ad.2
        for <driver-core@lists.linux.dev>; Tue, 11 Aug 2026 06:37:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1786455433; x=1787060233; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vwHxw3zAEaI1XPdj+Nn6C5Vg8bm2U0OZGPmMASab6wI=;
        b=SyTEo/pyrOmGWdABOK+tPwazxwZ/JRcRzAjAXagBUSQyMJU7MQxxUCAuAiu9djICj/
         21JscTTja4WtkkYMQ6aKIYmsJAYTpvqpTxmopcNCFKiesw5HgTpGGk+SvdC0UMUaH6Y3
         9RLmotAQ+vQ+GjZKxZk9HE6e586beiJQmZaqaOuvOYUU2zQne7W/Pq5gQoluI4yzPLOn
         3VLVL6WfG+5+GYbjf6Z36ERuqyXycKK4mlW9bNVGm98tHJ/uBGb5W0uC8XKOiIfnLBOE
         LgO/7PqM8cSKrbW8XxHvRakz6fCFnfzx5Z1yTk9QBGlVZOYrHN6pyW1okF4YFuEVbXd5
         yDDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786455433; x=1787060233;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vwHxw3zAEaI1XPdj+Nn6C5Vg8bm2U0OZGPmMASab6wI=;
        b=tLT5fYlqXvxQFP3qZpAZx7jbFuy1Zr8FaF93T9HyqqiwUEyAv6uWmCrqe2UBR+aoNk
         F2+OTzzjce3X967jwKleqvkq9LXLipM3mzwoYK1Xcfj4UM9rmilx9heVFV9O6FS1oJdx
         N5Qtml5NArLJvGN6kmAEY3a75ZOGcI/W7wQxv28RnNDxPzkcKl7nf7B5bftCkb1PW1V/
         c9cl4yw4FpM0JDTrHR5nyxhu4+PWOxSEbBcIIT5i2+LSCY9PbU6ynJ7fIpwwjhUre8GE
         1tGVxntbrtBIe0N/wYtNEE38oRvyK0x5ItYV1inSV9mMS/YteEdOb5rdZ+1A8tNfuUTF
         YorA==
X-Forwarded-Encrypted: i=1; AHgh+RqHCv0fuiBa5AkpN2WAMozdX6eFVrC5YwY6p+76tY7USfJBzBO9MZLm347/MxXzCDqQudRYmFi9sQE1DA==@lists.linux.dev
X-Gm-Message-State: AOJu0YxDXgjN+6oomXlQPnfSSmPHhzujIg7vPrNNnR4XRQgkeyQMg3mw
	XqHJldbiVIafDQdrl8ntWSkKG1npXR3DlRgy3sl1ffDIqpIbq325/1yqd/AlxUVmTaJhcm3o5t+
	KLjY1oZPxbz2p+qMcCh0a966f1EKYZpfS1EzWDf2j3RnrlZ15cblghhoJ/wNHpfN6tQ==
X-Gm-Gg: AR+sD10iILB9oiuBHO2jcpVH7lEGlbYIdBL8V/6Q3mKvdnR9XfI6M9olUabbQdO3n6c
	Y14Talb4cNwrGUDJXHf1BpI8IbfWvDFjZHyDWrWAxWVK5By6kIcqJSd/9lzhs9wWZTjZbonczaU
	tJ7RhvC5205o4VHIE3XAGepqCr7Md+hkNXEl49L7enl9gfyMiqKrvd3HCJshXgh4W+WE6/zUOe/
	aHiet+xMj49S6/29dKUQ0wxX2dUpynRHF5SgWxfAkymGj9H9N3y4vKDhXkNyHYabPFqO6MulQrx
	Mf/vKxVoeoRJRV5xmFk97mxdjtBt6IhNbzPS7Ljqx0ahn4px+n5ozXJc61xMoXDCW6pA6ToSZL2
	fFU1w5fbomj+tOTsRQbdo7Yf0ZJ33lB7Su90x/YMBQ6v4FJfh6SmOXRpq
X-Received: by 2002:a17:903:1a90:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d31792ccf2mr43115795ad.18.1786455433217;
        Tue, 11 Aug 2026 06:37:13 -0700 (PDT)
X-Received: by 2002:a17:903:1a90:b0:2cf:9344:b80c with SMTP id d9443c01a7336-2d31792ccf2mr43114925ad.18.1786455432749;
        Tue, 11 Aug 2026 06:37:12 -0700 (PDT)
Received: from yli42-gv.qualcomm.com (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d315f4819dsm8360885ad.37.2026.08.11.06.37.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Aug 2026 06:37:12 -0700 (PDT)
From: Yin Li <yin.li@oss.qualcomm.com>
Date: Tue, 11 Aug 2026 21:30:38 +0800
Subject: [PATCH RFC 09/15] arm_mpam: Fix MSC MMIO window size to use
 resource_size() instead of end - start
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260811-mpam-resctrl-dt-knp-support-v1-9-ea6397bead59@oss.qualcomm.com>
References: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
In-Reply-To: <20260811-mpam-resctrl-dt-knp-support-v1-0-ea6397bead59@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>,
        Shanker Donthineni <sdonthineni@nvidia.com>,
        Conor Dooley <conor+dt@kernel.org>, Fenghua Yu <fenghuay@nvidia.com>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Reinette Chatre <reinette.chatre@intel.com>,
        Konrad Dybcio <konradybcio@kernel.org>,
        James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-msm@vger.kernel.org, ganapatrao.kulkarni@oss.qualcomm.com,
        trilok.soni@oss.qualcomm.com, devicetree@vger.kernel.org,
        driver-core@lists.linux.dev,
        Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
        Huang Yiwei <huang.yiwei@oss.qualcomm.com>, aiqun.yu@oss.qualcomm.com,
        linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786455325; l=1009;
 i=yin.li@oss.qualcomm.com; s=20260811; h=from:subject:message-id;
 bh=p2xjgmS67aR70B9SMa1nHtDjkQErJq6ajoUB49gceaw=;
 b=RbpW8XOlEMkCJtmVCURN6evSB7XOf+fGyu9WxRbuW2WabuhISd5aQCYdTcyYhgx04KovWyOF2
 hjTScrHcKQHCxWZjooCfOcNcPKW3FbWym9PgHmj+SSH96eJqNobrgJm
X-Developer-Key: i=yin.li@oss.qualcomm.com; a=ed25519;
 pk=e/2LM97aSWGBMrxY240URBi9Zi8/kL5hXgB+VHkYvW0=
X-Proofpoint-Spam-Info: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX2eW7mNu7W5tF
 h3s8FPQy2onKOVhxxsCCzqCNUbEWT5o+dzUVoEnLP6P70Bk0jTMVKIHhpASLvuW2tlKVfCstkcr
 Oy4KuPV3z2/NlRyod7n1XF+eK84pzE8=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwODExMDExNCBTYWx0ZWRfX2tXfq04JquvT
 AkGjRAOno7dEL38DrThERL+Q+cvtTKajvsDOKsKeAP93vbZqESZH7iKdlpDBHp1tgk+7iCN6TKo
 wbXEkjRjiAslmun0RaxQPYamfkqVTsmzRhzbuMdBlqJxkLwR6Nw+FXPTEgMIRfvVRmuNjLHHVAU
 qD/LSAzYWK+uQ/FWnf/+3ANr+E2enJNs9KJ/XkdnawwXFUK9tWFoQwrU4n4xN0Ct6BOQNDfuAXb
 WqgLl7g0OCU9s1zYtNCCUHPy2cPYarCVBdyHw5sCjotM/wbO9GJR9rUivMhTcArcHhX1ztQ6q2E
 XOrlBcyhXKTlv5OuS2PgwRcX7pw/4ZbzutdS+At4JQd6WS9gEJnv/EJR6UzEaeIdpfrYjjAwBMe
 d3VkLvU3LCvqOTMvX1h+EAvinVHb9ULfupN36u/mDo4kqtIKuaIpOYdF3ftjNGAV5z8qYx7WBA3
 b5waphl/1iWKc8AxMHQ==
X-Proofpoint-GUID: 4OrH21RhrJSBYRwSA6iJaaLTP-kCUnAj
X-Authority-Analysis: v=2.4 cv=CbA4Irrl c=1 sm=1 tr=0 ts=6a7b2589 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Sv0fKeRqtYgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=EUspDBNiAAAA:8 a=3CEkA7f0bXxS4P8v5VkA:9 a=+jEqtf1s3R9VXZ0wqowq2kgwd+I=:19
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: 4OrH21RhrJSBYRwSA6iJaaLTP-kCUnAj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-08-11_03,2026-08-10_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 phishscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0
 adultscore=0 impostorscore=0 spamscore=0 malwarescore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2608110114

struct resource uses an inclusive end address, so the correct size is
end - start + 1. The previous calculation of end - start was off by one,
resulting in a mapped window one byte smaller than the actual resource.
Use resource_size() which correctly computes end - start + 1.

Signed-off-by: Yin Li <yin.li@oss.qualcomm.com>
---
 drivers/resctrl/mpam_devices.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
index 1e082fb60e30..5d1854d97371 100644
--- a/drivers/resctrl/mpam_devices.c
+++ b/drivers/resctrl/mpam_devices.c
@@ -2296,7 +2296,7 @@ static struct mpam_msc *do_mpam_msc_drv_probe(struct platform_device *pdev)
 			dev_err_once(dev, "Failed to map MSC base address\n");
 			return ERR_CAST(io);
 		}
-		msc->mapped_hwpage_sz = msc_res->end - msc_res->start;
+		msc->mapped_hwpage_sz = resource_size(msc_res);
 		msc->mapped_hwpage = io;
 	} else {
 		return ERR_PTR(-EINVAL);

-- 
2.34.1

