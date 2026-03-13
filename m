Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF45D366DA5
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773385749; cv=none; b=MwyFSPuq6JD4IgRILcvu//Tcm7ZtAofLjqFGV+ibwEJD0KaMH5Bd/0hnhgykPyN3CL0cB97b4lj08IIvoPy2t+L2w7jgDGNuAND9KN84SuA2o+fotkVg3FLbyTTdJl/DkCdkpRAlPRHE6visUEHtYHOhPsp3DKw+DoqE4Gr6BeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773385749; c=relaxed/simple;
	bh=RJyJVigQaOLM0F29T8s/4IhVwmKqS4ZNXPoeDAhzrkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rRMjRdWYyL71DM7J/E2DuNUH52+fMMYqkAWz9LOraycrjYvmt/CXhPSPPSFFduN4X6c8H3QxKgLrVlpL+KQ3egShGgMX6R7vGE6hgfhmKX71i1OEI5zKsLznjdY5F7gfR6bGPxHwMKhg8Cw1i+eJuD8tq6+OIf0bKIDGcBW7UrM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=QnBwfq7R; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=dgzX2lYP; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="QnBwfq7R";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dgzX2lYP"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 62D5tjPE052423
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZBGna102s7UxMKQ9bLg8nid6z7Q/g4WSEiY00RCl3L0=; b=QnBwfq7RRGsS3fGU
	Js0PO1nYVjvfiAJCG45vb7H4EMdm7X/FyaN9eqS2/9BUbqjcOMG1Orztb2eyy0JD
	bTcegnnN4N1BK1c0OAbWET1IivwkcjZZ6tdluibyaEZjn0Eh92Z8s5AgTGZlBek0
	gB0SA/7CQe6KWMRHn4tUjqDSb/2ledeWJiAmcFsxkCR7jVGuz6LNAWYA4dR7NYQz
	LJ8c5PQf7HGm5yOHBztsbdNZ12NIPDBYk4Ue8C96LEcyxjCtZjIsZILdK/jlHDi3
	OOMQJFcz4ZXarzx7S0e1TlcapeluhzVe5+CmWxRfxZm/l5yqQ/JPVUL3gCiclzI5
	YAOl9g==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com [209.85.210.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cuh4w4yew-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 07:09:05 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id d2e1a72fcca58-8298150caddso1529807b3a.3
        for <driver-core@lists.linux.dev>; Fri, 13 Mar 2026 00:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1773385745; x=1773990545; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZBGna102s7UxMKQ9bLg8nid6z7Q/g4WSEiY00RCl3L0=;
        b=dgzX2lYPl3u2xWz3Dp3aOicbygEiM8UXCaTLQ4Arsp4JEiw8KJ+pqW4RrMmHymBmdn
         ySAXnlwqcqgpcXbBm4w4AtcGXaub/S3wb8m+GF259Dx7005HY/OTK7dTmXnf0TfEt7+G
         hqC+kFaeM2dwHp5dmonXrHcSOaN5AMooahwcDbAH9gb0WD6wHB4+k0qNdM6+Wwvu4eTT
         oJsYWpgqeG6joDj2SkR3uXu2AAiIJ1Dx/X31J8eAt0y/b9sY4Qm1aOorOy383ll5jASG
         Ab7CqAIqnm5gxcsi9aaWUdcxyP1z3I9P/jpX+AVzsc5tXnPeC/VFlQlWgY+IGqDxA1N3
         oi2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773385745; x=1773990545;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ZBGna102s7UxMKQ9bLg8nid6z7Q/g4WSEiY00RCl3L0=;
        b=gir7gfZVsn623rW7YtRolVKVKR0oR/xrO0tzVVP31SvpUy0rXhzchUJez+XxZsJTd1
         CE2Cze1g1TrsEvusNFqpw1BB89VOegAJIrqZqWZ6OS4xq4Ty9D7WAPHbsUmpdnQNEXBZ
         WpdVlCup2llvBpTdAPqinS16dTv10eXk2w6E7+pYpvD2iLMnrld6XeEvIMP+p62zso3P
         53TpS3xSoyxhfEuuvJpEDMoeAZfhHKODzEPpkNpMgUoF+3pvi6N6i2Bb/7S1e3WRxSVt
         eDIhcWEVgikbIlWLGJd4jXA2bI9/7Ak2/R762JpqfpifU5R9/kgWeFHopWIB33k0pgBs
         m5KQ==
X-Forwarded-Encrypted: i=1; AJvYcCVRy7/ux5Wpo53TBb4PhxdAQL9gjrgcvotWfWabSFo+VWWkN8E9i7BuHswVdqm+luzOatYXUfDYjGLinQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yy3Dsb/FYujLTbZSAb69Lw5kL4dD5zVg/Tkvh3r+kFLTncZTNVB
	4Yq0du5sr790pBqWMh4dypNxlKb2k6lRMSm+kcdwXMunGAZHqDlR1QkN9YyE2xLVyMaJxNAykG7
	kS/h2kiRH8ll1oscGKmP2h3/bSXuUBw/gNJ18nyvuKWFlQ7r6bj4V4Zt51E+kwLmFdP1jayI38A
	==
X-Gm-Gg: ATEYQzy+qW1IePtMCodsh7AjfA69i85fvwbspCGmYzLxJuT1NR3l09zEqT2xO1+Slan
	1AGoufL52dkbFsuXsH+olsSWv8/9AHoox7AkPMb81myIfO6B9EFj40VtI0RBdPZmghHAv/LOD+Q
	ndQpQ5X6CsQLyU+tTexG1lvKzOGp44W6pOWaXacgDbtT/SSftDSyQhLbYpqEEpsbKB5tZY9Vhip
	+OT0UOs/W/PfFyUbMlKWGRGUTtMuKkMihG0u3dPZhS2oYORksEL5Sg4I9L56pJ2017xA8bh4VMa
	HlljEZe/UQZvZqXALi/sWCZ4muGiNFn5a600/GCqGlhOP+PciunaTOg3D3shCoht0z+4wGt/XWg
	TNJGaNrN6KYGMtM6Xui8MUQ8YfiTnwGxXmbEo1dqc4e42Fsar0jAVpLZ+
X-Received: by 2002:a05:6a00:928a:b0:81e:4476:f67c with SMTP id d2e1a72fcca58-82a196d976emr1922397b3a.3.1773385744773;
        Fri, 13 Mar 2026 00:09:04 -0700 (PDT)
X-Received: by 2002:a05:6a00:928a:b0:81e:4476:f67c with SMTP id d2e1a72fcca58-82a196d976emr1922376b3a.3.1773385744317;
        Fri, 13 Mar 2026 00:09:04 -0700 (PDT)
Received: from hu-krichai-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82a07340518sm5148536b3a.34.2026.03.13.00.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Mar 2026 00:09:03 -0700 (PDT)
From: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
Date: Fri, 13 Mar 2026 12:38:41 +0530
Subject: [PATCH v8 2/3] gpio: Add fwnode_gpiod_get() helper
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260313-wakeirq_support-v8-2-48a0a702518a@oss.qualcomm.com>
References: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
In-Reply-To: <20260313-wakeirq_support-v8-0-48a0a702518a@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>, Linus Walleij <linusw@kernel.org>,
        Bartosz Golaszewski <brgl@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>,
        Linus Walleij <linusw@kernel.org>
Cc: linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-pci@vger.kernel.org, linux-gpio@vger.kernel.org,
        quic_vbadigan@quicinc.com, sherry.sun@nxp.com,
        driver-core@lists.linux.dev, devicetree@vger.kernel.org,
        Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>,
        Manivannan Sadhasivam <mani@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773385725; l=1348;
 i=krishna.chundru@oss.qualcomm.com; s=20230907; h=from:subject:message-id;
 bh=RJyJVigQaOLM0F29T8s/4IhVwmKqS4ZNXPoeDAhzrkA=;
 b=D8zrgRQtWArQCv0Zo1sugUcPcd6RMCLTFZxMCAirCh1759Ub3bZFRNHVBFJlIJBo9VhI1BjAH
 n+15tflY2ABAjeEzI0mPp3HJ+vk9sBQ+glRmAnvJ+fcrsp15205EQG5
X-Developer-Key: i=krishna.chundru@oss.qualcomm.com; a=ed25519;
 pk=10CL2pdAKFyzyOHbfSWHCD0X0my7CXxj8gJScmn1FAg=
X-Proofpoint-GUID: XOa4hYNae6T4mQyQAvynhDhY-J4f9MgM
X-Authority-Analysis: v=2.4 cv=Cpays34D c=1 sm=1 tr=0 ts=69b3b811 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Ocqi7cVID08-S0eeb-IA:9 a=QEXdDO2ut3YA:10
 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-ORIG-GUID: XOa4hYNae6T4mQyQAvynhDhY-J4f9MgM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEzMDA1NiBTYWx0ZWRfXzVIXjT7cj8kB
 EWxkbG0ZIj1lNXYgVZJ/+imrDtQ4azrmAOmqpT68Ti/3uWnTyQzmBZRsjn7bvIRKLJGfr1VwDfm
 dubLQLW2V/jegbrGP0nC3/S8ZuaSuPKn3n+hHE15dnkO7T28/ucKzAIu2Xc8gp3GOhuL/43yZP9
 bZkLPZGvXROzYG+kaZhfiBccnUEZoxDkIGed7u91zdfI3VZvW+DFb5DXh6hIWabDsbdxlnWa09C
 Z/vQNeLgKChkfIVrhIMpmgBIleUb//63PqnHlQ996QbPjeP+nA99P9S6OhcPaIpLelvtGrXjTPT
 uMfiX/zEcLvr7hhMfoVXQ4+DkinTzFVBy3gfwLAtnhev7nyhf5IPWv1iuVv+cgePAyfxcClYmNw
 Jg9USj7cWBXiVbpn+Vr022sLtkNW8kueXoUbkyHAzp+sT/1+mO4RMUbIIddNHIzJuUj3GjrX9o8
 7D7r9YqJP0osmt7JyoA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-13_01,2026-03-12_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 adultscore=0 clxscore=1015 lowpriorityscore=0
 malwarescore=0 suspectscore=0 spamscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2603050001 definitions=main-2603130056

Add fwnode_gpiod_get() as a convenience wrapper around
fwnode_gpiod_get_index() for the common case where only the
first GPIO is required.

This mirrors existing gpiod_get() and devm_gpiod_get() helpers
and avoids open-coding index 0 at call sites.

Suggested-by: Manivannan Sadhasivam <mani@kernel.org>
Acked-by: Manivannan Sadhasivam <mani@kernel.org>
Reviewed-by: Linus Walleij <linusw@kernel.org>
Signed-off-by: Krishna Chaitanya Chundru <krishna.chundru@oss.qualcomm.com>
---
 include/linux/gpio/consumer.h | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/include/linux/gpio/consumer.h b/include/linux/gpio/consumer.h
index 0d8408582918680bfea6a04ccedfc0c75211907a..fee926c0262ce9dc4b9a3c151e74f2cf37470a49 100644
--- a/include/linux/gpio/consumer.h
+++ b/include/linux/gpio/consumer.h
@@ -596,6 +596,15 @@ static inline int gpiod_disable_hw_timestamp_ns(struct gpio_desc *desc,
 }
 #endif /* CONFIG_GPIOLIB && CONFIG_HTE */
 
+static inline
+struct gpio_desc *fwnode_gpiod_get(struct fwnode_handle *fwnode,
+				   const char *con_id,
+				   enum gpiod_flags flags,
+				   const char *label)
+{
+	return fwnode_gpiod_get_index(fwnode, con_id, 0, flags, label);
+}
+
 static inline
 struct gpio_desc *devm_fwnode_gpiod_get(struct device *dev,
 					struct fwnode_handle *fwnode,

-- 
2.34.1

