Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419D25A2BB
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:38:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771853884; cv=none; b=lUxGV7L+gOO1Tu/cr5eddqOPvgB675G4agWBXIL9ACE9+cgYbpx362qg+XWE8K9+MZgbCDmmoEvaQKF8VU7UTOor/pVSEDWBmCxcnWF0IpO+ZOKe+Zmt4o1ikHY5i4qs5/yEk65a2BPD2xRCanQhel9NkyB2tXEJe3WLM52csZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771853884; c=relaxed/simple;
	bh=KMszzjU3UQ1Jk3+c+DzRdD3TJf0mZEwo6CMTyg8oKHI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WU+iS+Ei9sCqUcCe55aCeNHxyBcQa+pZcdWt2qkEwipWGWVps1SMt5Iy1y/nR3TxM7KVim8LG9Pnm7GHGXGqSFuV70BJAnQxtZnfr1WDY+SL0fS7SPcmPeAijbqhSrB0F4VReLS+yAUbJglKPRr0MTFkh69ZPNmnmHZ+gxWtwi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=LcPCbrpS; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=eSW+/xfn; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="LcPCbrpS";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eSW+/xfn"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61NC2qvJ3152071
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:38:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=; b=LcPCbrpSbRKCIqwN
	9+BLAYNwVHfItZHCbpfdNEb6/duhQGxQ2YYNCDN5J1RJXbduZLRFHYL9xZg+8PyV
	kQMsmjEI/il+4xxv3DisCyESeuiMQBtC2Ak7tHKN5hIAKII2ZrlT/KRdY6aE1lHo
	0uadnjIE45fUbkVxMF27KLjmiLR33YjGhmlAUpZBCN5HBtrEn7rddow52Hr7ElD8
	2HYcj9LTPeKB2iIkme6gSl9kmPJgEhxKZUiEmGqZlG5fRB4D0nQjQWc7SBoHZsb2
	lLZa1q7uxaaGLComc3rjBscS0BzK6/TJkP5uQDQ3C4oBPHdSWm3tVg42iRKlRuk+
	DhNBCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cgpj887cf-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 13:38:01 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c882774f0dso4068143385a.2
        for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 05:38:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771853881; x=1772458681; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=eSW+/xfnA6eYdDvs+aTwPJDL846MUCrDUBKX/EYSGhKCzgHJxO1HS2dkiDQ0LptOAK
         14Ne4qvrBKe69P87wAXJn7j3Luyz5OxPpollBf43iMaBMJOoQxqzUE+6/NZpJXtCYWWM
         ooH5rUfzd51ntern5QGP/Rmar2W/KKJTV1jqyAe8ZM70oO7La/AWCbH9X3H4mroAqZ+c
         zsB1g+0ev25wwtRytrFkN9XoO3gQj1cY1TA9ABPR4cmirOLQU0N2k8jV/EAFUmSuc0GH
         ShQ8nVx6VukN3SEDq+sXZyHECSCdu4L6uIdLv8jMXLfFLhEol+DZ3glHyo1uS/9hvk+h
         c4rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771853881; x=1772458681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=SWvoqMQvd/HR1Whim+d9dj4uZuzbTBCqd+clBYIGe20=;
        b=uwjxrr/KQknKq2+4LbdlYmR9aHs5DAFZ9fXLjcRvzzcTIdEk469plzACrrOVvjUt9n
         rWoJaz83SrxqQnmyk8MYcW3Md2HmEl747/a/tAjGILMeUcgXFUyb3PzCNbH3EJbIb9EW
         R3k87FEMuWkedH+kPS7SgAveHISD9f5LAGwAlhxRBPMl+tUL+mCCqKx/vGyejZsYrYNH
         7LL4QWhCZrwS9fQDQeNLnUYzQ7DnBnUa7+ndoWPNWQXygY+ZfLrsZOPtb2jjl7foWw6a
         oqxvLOhMCLMtF45h74FZ2O+HfCyg5RIiqfNuadDJxXr4Eq4tkcWHv7bWFhZNu6lwvUgt
         iBTA==
X-Forwarded-Encrypted: i=1; AJvYcCUyh0S8B/fjav/Xv1G57+jTfcNziLpQdfl49YEBVlXElD8ySNTwxQWOET+OvEqxoNHOZ0vk2k7yy0URcA==@lists.linux.dev
X-Gm-Message-State: AOJu0Yzzpyrewsk9QZiRlp2EazeMrKoX75J4F6ClpVNQAQ/Pl+2jfZVC
	ckC2KUplni03whuKeilcjcfAuPq50UMsGBWbDurdQNREn/SbA/yBlFa+556TIK3HQbDu2xjr673
	N6whZKXab/PtUUWXpc3n1jMw2OYtcjBPm6SPlzrtutz9tt3BlptS1G/mQTfQNZTWixQ==
X-Gm-Gg: AZuq6aI5MA4SJbo35FbQOBYhCSLNeFCEDHa9y6PvkDEhd0fCNxRDXHW0d79dudfnt7T
	/eQ9uyElrVQPYXX0Pi9+XhGtqvtLetdx7/Q6VhoUYmynx+LGWNLy1WMcPEAwz/et0hP7hz0AW+a
	rR6vwryLA4XVy97DcRbj6hyVQFOa3IkDgAweGkCk5gtt3xXNRLeaZObJ+mLeHK7xqx/sOK0naAI
	TuPS9nw4twH79qdXbz4RAQ2OfFcgQvM+s1ulnhubWgVw+Z4IbBl1dQ4ExKU7iFMBW/5+nxewIFO
	i9DrptpOnKoDO1kUChGHy2WCiLujPR/c+PEvwTQ6NbX7vwPxFn3EfreXg3bMuHpTSUll/4N3Wlb
	9Cus9dqx9OnO7htZgnl7zvfbGJUj3IsITiHoI6gOj3aFHLiUOC5o=
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864841785a.56.1771853881078;
        Mon, 23 Feb 2026 05:38:01 -0800 (PST)
X-Received: by 2002:a05:620a:191d:b0:8b2:e827:14bc with SMTP id af79cd13be357-8cb8ca809e2mr864835485a.56.1771853880417;
        Mon, 23 Feb 2026 05:38:00 -0800 (PST)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:3fa4:55d7:7aa4:50d6])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-483a42ea5ccsm89398715e9.16.2026.02.23.05.37.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Feb 2026 05:37:59 -0800 (PST)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 14:37:23 +0100
Subject: [PATCH v2 8/9] soc: renesas: don't access of_root directly
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-soc-of-root-v2-8-b45da45903c8@oss.qualcomm.com>
References: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
In-Reply-To: <20260223-soc-of-root-v2-0-b45da45903c8@oss.qualcomm.com>
To: Rob Herring <robh@kernel.org>, Saravana Kannan <saravanak@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>, Chen-Yu Tsai <wens@kernel.org>,
        Jernej Skrabec <jernej.skrabec@gmail.com>,
        Samuel Holland <samuel@sholland.org>, Frank Li <Frank.Li@nxp.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
        imx@lists.linux.dev, linux-renesas-soc@vger.kernel.org,
        linux-sunxi@lists.linux.dev, driver-core@lists.linux.dev,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1202;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=KMszzjU3UQ1Jk3+c+DzRdD3TJf0mZEwo6CMTyg8oKHI=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBpnFghOtq7j/iaDL1WAiPG/QAsHsRBHvV9a3nbj
 G82aE3Fd0OJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCaZxYIQAKCRAFnS7L/zaE
 w3ZAEACq76nSv0Z8rSsnvGgmS5/mwpaIREv1PRZlCvVtRhoMKRBufC96Leq9sX5QOvd7hTA4xeB
 WMBn4CRDV8eO7tmNxBUe6TA3bRZwlZGt50fLOQ/x0euytqiolWTednJw9IUH0kbKEhqH3EIpi+2
 gpmgUmMsKkfOFVy3NgtrzdSf/VGpaQQFG33HplYR/ulRhVxY8WIrPe6Aub2FrESs/ostBms1XwF
 jWW4trZ6JRLpYP6rYxHoFg9e7BBbrbHgHnN7HevKXTlG0gqamvekyLeCVQTGueIB265F6p+Iuv0
 TH40PbIdWRK15RqpOKKn+LP7GUy+H0zwPxweyJbMloeXmP1NN1A0tcEQplBHAROaLbjgAHLtZwr
 GdS8OA83zzoPCG+E02zTIAsC4IoN7lOyEm+9ych8d8yrms/dRFYSq4Bx/7amt8tvEvCb6q9modd
 Dm/7N5K1m+gQx+XuqXBeSV4tLpHT1dek9h76Cv5QmAdqK+j6ODcDsLWPukVAYlelvk4QrN6ZXr0
 c0VCHVAZbDI4bl3m1jpvyH8qKa1u19BV4M258yoP324LUlv4MCXh2B87jQt5K3etJbPOVj5v4Nm
 Aea7iEMtxHyRgaAnIMNS5r70A/i/XphbgNOa5UZ3EYdQxIcWG4MOL8227hqj1DnvymIz0K2rUhk
 5ESczUqqojWKsMw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDExNyBTYWx0ZWRfX56JStp8mg2CT
 mQXTA/ke12C14H6NgGUmeyFliEQ3gN+NexAeRP9Hcz3ozffSQubbb7T/3C/pzrWdWJkns3BxW0V
 TjP4Dhqd6IJC3H3OfNyNXjr1LxfpQ8KyubjnpTLW2PJmiCb8aGtMjxdocWjpJKjMOlH4K12nLGI
 59wU6dBpLYIsfxxlZ0VwQBo1RId/etTqrKxei4RHg2elp+Ikc1XL5geu/CYlP22ec3EtTxx7g01
 2F8xnVaLwk87zrwRtRk4aquJQvH4jkoXXDRMLYlHmtN88aDiys/ZznhEZ3+fn/RFuNgF1ql0G1A
 91F2jcQJRXdqJMrEYa57yPOPZptYBXdkNjQ5mbPVla5z9SD1sm47r5aySBSVRlSG46gEkUPdeMd
 hKQhSAr26VybbPmchPJXS9CVlFacigkvSXKBtRbocNkRXmsAVZ7hiHouFG/jnZU38kNB47kkCTY
 uya6hNxHgvHdG9xEPhw==
X-Proofpoint-GUID: CRy3A4CWz0rTKW6uXWNSeSqRgQKJXpFp
X-Authority-Analysis: v=2.4 cv=Z5Lh3XRA c=1 sm=1 tr=0 ts=699c5839 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=hcp4X6t0sg7LPBOUZMsA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-ORIG-GUID: CRy3A4CWz0rTKW6uXWNSeSqRgQKJXpFp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_02,2026-02-23_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 bulkscore=0 adultscore=0 impostorscore=0
 priorityscore=1501 phishscore=0 spamscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230117

Don't access of_root directly as it reduces the build test coverage for
this driver with COMPILE_TEST=y and OF=n. Use existing helper functions
to retrieve the relevant information.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/soc/renesas/renesas-soc.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/soc/renesas/renesas-soc.c b/drivers/soc/renesas/renesas-soc.c
index 38ff0b823bdaf1ba106bfb57ed423158d9103f8d..bd8ba0ac30fa91fcf2a10edd0d58b064650085cf 100644
--- a/drivers/soc/renesas/renesas-soc.c
+++ b/drivers/soc/renesas/renesas-soc.c
@@ -6,6 +6,7 @@
  */
 
 #include <linux/bitfield.h>
+#include <linux/cleanup.h>
 #include <linux/io.h>
 #include <linux/of.h>
 #include <linux/of_address.h>
@@ -468,7 +469,11 @@ static int __init renesas_soc_init(void)
 	const char *soc_id;
 	int ret;
 
-	match = of_match_node(renesas_socs, of_root);
+	struct device_node *root __free(device_node) = of_find_node_by_path("/");
+	if (!root)
+		return -ENOENT;
+
+	match = of_match_node(renesas_socs, root);
 	if (!match)
 		return -ENODEV;
 

-- 
2.47.3

