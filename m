Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793954444;
	b=WWQC+VokCPls5+8+TInqnftM/65CpmGW1mZgVodZdKSUzqxc9Z2zrkOa6yL+Ocl4rPUe
	 mePBmTa4AIgSr+8yoLYlbHulzxHHyrOFFI2Wt2dxlxshT4PQa0donRDGTnX40C5CvgHcI
	 cNLVJ9PJ4OcIjswUFlqRSkYOTIr43R233NwzZn9OHjn73o134+An4Twr4JgM70HX2x6mG
	 Ce1lA5ZZ4UbHkH2Aou+nPZQ89LqXNQV75Lb81vWAU63mkWi5mETpMLdDQdZ+Gjrk5H98W
	 ag01J/nXLtdug5NZrJLBHk7RWqpPujD8SUkQlgS4QLh0nJU4p2+P3FOgc6fiiLUiyAg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793954444;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-Id:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
	b=NJQ9T2ZEFVUqZbKHbn0yzdxMVLI2bfrEObnCFBQs27nnEuX0Qa9Y0JYqA8cNi7ZTaIed
	 p5EAlLrNq3hvNcpLQt2mBCG9EpyU5406Tfi+ff+oXMNhKhu2V9dDCyNmn8uv9GQTUn9GR
	 ThJWuoz0a00N1yEmrG2g0zyZyePlmk9IE5ChxjO0WSt7ePVdnP1lngBhhAk5TgogV1qvU
	 HYKS58j6zHjPYQNT6dh3iFOXQQE7471l4Ep26N7OHz37VvfAYTlZ9ByHEOncn/nOnSHYS
	 3k6aCe11VTu2BMZhqJ6mCVt6+trBLhhU/b9Z+4Mm67UvbuO8ESXS0O36RLENUquqxyw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DAIgjnN0;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A156F606A338
	for <driver-core@lists.linux.dev>; Fri,  6 Nov 2026 08:40:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A156F606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Y6WAJTZd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=DAIgjnN0
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A67RPDc3906910
	for <driver-core@lists.linux.dev>; Fri, 6 Nov 2026 08:40:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0J
	V95jdOhY=; b=Y6WAJTZd1u/Qf+XFrIvyqrGeuo2yDlYMsDHmlXYf+5EyYBDyOtB
	NRvOvt6gIA1UEqyrDvmUGOoHBU+zqFZcP68cg+hMiSX0y1Tk8fkwJx/xY/5JFHVL
	Bdzs7Sk4OZFW+j+huWxv48H9kfx+q9B0+JdIXzEsGf2o1Dcfo8aElV0OcdLwSjEX
	alGvU4L3CciY5s7lMS6y26b1jCGdFDycoso7PhN55cwEOFIUh+yuy+gcL0ar1mNP
	AYPk8kE1XyTJVdrxnmLsaM8ZWIts9Xp+TmptqgBC2vxvuIT1M+TWOCZQ2di3D4Kn
	b6d62YkDUNJtl9QYNr31+PBMbd+uYG9trqg==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com [209.85.216.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hs3paswcy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 08:40:42 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id 98e67ed59e1d1-3b08364cdc7so545936a91.0
        for <driver-core@lists.linux.dev>; Fri, 06 Nov 2026 00:40:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793954441; x=1794559241; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=DAIgjnN0VUqMTOH0bILMuUqVv1VPZjJwb22dgq21z8qe17TFKh53cUoMtltevVJCZ4
         Uhl7J349GvHv1VBX/Al3U06yKiG45LrkBfGIDmCl45G4inwIwkkFZ1L94+MbRypiWIZZ
         YZwTqvOBTOByx71o6gNjSxY1ykuZJQyaN3fhZWryeDKq4OhdhYEMEk8bzJLvGBKp5m5D
         q44sDW3+q4XqBt0DXa2oGiMNedLAA+GUBoPN9/UYyZJTpFqP2bTj0DNzbWLr4QY19oDc
         yo8KCN7jc5VlJZhUnaowQDxlpzwJYEfAyi5IreHaUEzOnkD6NgSNTuaV3BuyHX0WVqJd
         +Pfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793954441; x=1794559241;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bQeOYnGvqbTAAl7dd0qrq6a1Byn6p6nDr0JV95jdOhY=;
        b=G/Dz51J6qr6wno55o/rHdN6U8/ob0h+wcb54y4c2H67X3fhgQATPOqSAReYfZQJHHi
         k1EiFoIdYQGZDJ5jMj6ZsKzzkFMfxmWMgAgEimNIYFw7UEQRaY08Udx2BWdGLxTYNm+s
         +5XJWzCzz8PYH21gbLOvstzktXFEgy5M1pHWLsVO3/PYYcrmR3gB9WRTInyL7pmlNz9Q
         CDX7BFKQ3hG0siNrD9uKvMnAqZaTATfglsRRuYhhkDO7RGkAml6QD5d7PnDf33dDMRPZ
         VlsevYUCYm68aFyg/Nmz+ze2TxJ8MhjLCpQcpofW73LKeH9SEsS+FIU0i2ypPuYt3YG9
         6BDA==
X-Forwarded-Encrypted: i=1; AL+hErF93NWs0NXZzbfJRY7QU2bG+QqEmUNEXh+rFK044lT3V2YjIff2E/3PjuALgPua+1Eqs+IhgZoyXi/IxA==@lists.linux.dev
X-Gm-Message-State: APuU4Z8HmTSg2TrpI29HHwa9inWnIEWz1LALZNBzbqG4eUoGIV0ENc3w
	g0A9D9ICrgBDE1UMzQiwONcnIimh2tz6P6OOv/JqCaH7NweXIEN/gjmZEabnHV0xhjGyeJYFBvD
	x4xeSJ2Wjvy5J4GI1wdAanm0Ixo7EfFF/6BB5g0EHo4tT32b+brbzhdEQAdvHK7IfTA==
X-Gm-Gg: AYBFou3r+JoXIXQZwJRFl1RlbyxFbNklCuhST6bvqhwLQgrN0+cz6gZfPZsj6eYUdEt
	24zolncK83vtuESgjO4xf156Fu5xeyIEj3XBLp3U3B4Xqufg74TFrEFKQl6qQd3ssjKRBTD0bZn
	/wFmQY3ExuiIzdOvAAMdIiIvsX4xKa8cWjTVX3YRu+eDepONcL0ND5xO5kcQtFKJ1equiI6dB4Y
	b/3nbT0eCOFC4Zb4WgLfq7KV9fU2V3TFG0SWbDGCV3bHuxYcZa3w+G3I4p5hJFtpxfqR7E6lnEQ
	F0nhphUJCLsL4/VujFy+tXkM+HzC1D+OBJzpM9G/n6qneS5EEZRKpYMDQlZZ9udmn0FFmSt5GAQ
	DgQOj4l7DB9PoGV8ZpCLVpuBIQW1e4KyYzO5fhoKYR/ThAf/8qY5umLFfrmBrbckKUsYL1O9EDt
	BGNe3BK2I=
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894986a91.11.1793954441477;
        Fri, 06 Nov 2026 00:40:41 -0800 (PST)
X-Received: by 2002:a17:90b:4b8e:b0:3ab:1481:69e5 with SMTP id 98e67ed59e1d1-3b0db6c998emr1894959a91.11.1793954440903;
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
Received: from ap-cloud-sh02-lnx.qualcomm.com ([114.94.8.21])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0e253e9bbsm683947a91.0.2026.11.06.00.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 00:40:40 -0800 (PST)
From: Songwei Chai <songwei.chai@oss.qualcomm.com>
To: gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org,
        johan@kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org
Cc: Songwei Chai <songwei.chai@oss.qualcomm.com>, songchai@qti.qualcomm.com,
        linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
        coresight@lists.linaro.org, devicetree@vger.kernel.org
Subject: [PATCH v1] driver core: Demote "Fixed dependency cycle(s)" message to debug level
Date: Fri,  6 Nov 2026 16:40:34 +0800
Message-Id: <20261106084034.1579494-1-songwei.chai@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfXxrnP1qXfLSEy
 FmSQeRbEZ+s7K+VHlfQ6kq1p39C3w9YH8yNft2bSZLFSk6a2uZT9xzuI6yMVP8HkDQbIx7D+d79
 dMYeYMoHhrq6goikVLritFYYOJUIKcF18QNUOBYzGY8RHW9+aDaldE9QAzmzs1cMEgYfisY9GpZ
 xTY7NpbCGkGDi1lHxKtLeIXTiRV+IxY8o0nfyNQCN7SAaT1z3VDSEK2TtzRpMIui/aMq2Kj1wv+
 WHYg96sYnFRCA/SMjaGiVzV0oPsY9kYGLXuAc6qyMUWu1QoLgAnf/LaBHg0xVqIidwogowgcO8S
 vOIMLF1iaZUJ6NUPl3dfOA6INl37liCXCozAyXNirf9Iw9orqUb1dkpOAuCfnThHmQtqcaQdvVX
 DlyySJBIDgKRrGghbCPOErOyZurg9zH8rKe2ilQPG3PuY9LckLyrN2tlPO6ynf/YLgfEoa+6XoT
 RAtYKx8ZZIREbaibSrA==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTA2MDAzNCBTYWx0ZWRfXyxVjGxRfojK4
 rnbYalyZe9LTznru1gXgOUy7YpVFGC6fMkApY6sEjkr4siNnC11YnjqPZ6rl+y+FWR1o4E01iI1
 XKkUk14bNlAdGmNoVowFwo3MPccP6d0=
X-Proofpoint-GUID: 33Yh5PHtHdNeZVa3qk9HFYzWKrsVHllT
X-Authority-Analysis: v=2.4 cv=P4ivFSAu c=1 sm=1 tr=0 ts=6aed928a cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=EJ-oiV5rZAYrcyJa4SwA:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: 33Yh5PHtHdNeZVa3qk9HFYzWKrsVHllT
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-06_02,2026-11-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1011 spamscore=0 phishscore=0 suspectscore=0
 bulkscore=0 malwarescore=0 lowpriorityscore=0 priorityscore=1501
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611060034

fw_devlink detects and relaxes dependency cycles automatically, so this
is not an error condition requiring user action. On complex DT
topologies (e.g. CoreSight), this message can fire for many node
pairs and adds noise to the boot log, even though it's primarily
useful for debugging. Switch pr_info() to pr_debug() so it stays
available via dynamic debug when actually needed, without cluttering
default boot logs.

For example, on sm8750 this produces 125 such lines in the boot log in
total, 80 of which are CoreSight-related, e.g.:

[    0.057190] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/stm@10002000
[    0.057211] /soc@0/stm@10002000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057229] /soc@0/funnel@10041000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057249] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/funnel@10041000
[    0.057254] /soc@0/tpdm@1000f000: Fixed dependency cycle(s) with /soc@0/tpda@10004000
[    0.057260] /soc@0/tpda@10004000: Fixed dependency cycle(s) with /soc@0/tpdm@1000f000

Signed-off-by: Songwei Chai <songwei.chai@oss.qualcomm.com>
---
 drivers/base/core.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/base/core.c b/drivers/base/core.c
index cbe05197d4a0..da4f7ff2ebcb 100644
--- a/drivers/base/core.c
+++ b/drivers/base/core.c
@@ -132,7 +132,7 @@ static void __fwnode_link_cycle(struct fwnode_link *link)
 		return;
 
 	link->flags |= FWLINK_FLAG_CYCLE;
-	pr_info("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
+	pr_debug("%pfwf: Fixed dependency cycle(s) with %pfwf\n",
 		link->consumer, link->supplier);
 }
 

