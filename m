Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D4183AC0D3
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778485786; cv=none; b=mKQuP998gMlmWd3Mqxg9mxwWtSgsOaH662z0zbjhQHcbCMt96jFnj7rOGQ9LlqxkmI4R86hI/KbuiLd0MAHJIGOKWEuxbsNK+6dvfcRErtwz/7iZJTVlcUxiye5iMaoVatmtxYpxnKqIdcI5km710udLLeFN7FnSpvfALc0OoUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778485786; c=relaxed/simple;
	bh=dfcYwkyuDNYynj44TLY/xzDAGhF6slaoqu29/jCOjLg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=fArXXUU52N0SEeVqputZGzAxNR6YKdSiGWUppHN0voDb1yZPztBDQwGFJjhtpmctHa2KgErP9BNOLnBfNde3uklstasJFHhlgoxureoV3mHluVnyI54Qnp6Nvi2gyzx5eRzbPGfzVs58jdJFazFn6BXLSW3LV+tqyJOEOIE69F0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=R84is9rq; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=UCM3pKtw; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="R84is9rq";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UCM3pKtw"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 64B5MdMt2794543
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:49:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zD0OZ3vl1Z6/q5f1uoJsnOx26bZdUEuAO+g
	pWzawFUc=; b=R84is9rqwSI5OH3TizEVkUFTdeHN+ftcMSJX/hfgCHCf+nfc0JC
	O0KRYqwiUFypzewXzD2GMob62VE+Ndg9lefuFwqwAxpbDC2j1dolRfUkzYcb7Yge
	L6f+TdG8GILv8mWAO7bYISRygcdFIhkOIzvafVewdzQPd3k+rkIeLo/ed+6xdj8N
	tl8oeTBgyByJUWZ3rVJsVzGHvnQJUoc8LAWUd5ayq2cUmlk+Tkhjs83EcXiPwLB9
	uYB5qOZvkMmLps9lmCl39l1t2wb50SZwHPsE9sa7FH9C9BFu95sdq6kzYOheHF5b
	/+zrYYmBg3w2cwXTa1w8HYxwfcjdsBwJEqA==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com [209.85.219.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4e240h47dt-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 11 May 2026 07:49:31 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-8b597b14a22so33328246d6.0
        for <driver-core@lists.linux.dev>; Mon, 11 May 2026 00:49:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778485771; x=1779090571; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=zD0OZ3vl1Z6/q5f1uoJsnOx26bZdUEuAO+gpWzawFUc=;
        b=UCM3pKtwCf+3QlQ4i5sFFgd5spUPB/NedSdVeY5htp0PDc1cCm+462jD0CUDtj2SgS
         Gy1Hl5lZrT44C0+KaxZShQE+fzvwXT5kRb4xDqSmHP8ecnRKOCqZxens5cIJFG07TIjx
         M2wp9/VvUCjKoQrp3zXSobRVrYDI/K316kZ30xzzRYEebGzbN+pSnFCpsk1Ne7RJw6Nr
         mSapy5/7Gey1yzc9VdALFLIHeXE1lrbDfvYNUatIuOoLt6KoeCsBAnx+nB2H65hUZuWU
         sbJQAw2pdfSRpSyBf5uHhH1bbqBo3ps1g/dQfb+MXG0HbbY/nSh2C/DNd9cgyEdRW1uE
         v/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778485771; x=1779090571;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zD0OZ3vl1Z6/q5f1uoJsnOx26bZdUEuAO+gpWzawFUc=;
        b=eJPc1I8dPre+6wcy4LXR66Rg49h+Uk+1h88qE0Vm9+Hrq6fSW6oohvBsn5ST0s+CRL
         oS2iETzOjKKsjZO1TYOfNmBJhvF9eKegmJ+RSAwtrHEze9WXQHn6f5EmkMVqNMDmcCi6
         dwhbVMIGHR/RkRzzglHA+KQyFP/Vg4ISSIB9G9JDmcBqEr9MLTXC68bOsTShWVHe76YQ
         Eu7p2UMFscH05Om/ZRNir+bYFR9EETwbOnCMpEisa7FOkGSWSvoTn/raMOfzRRZp9hlh
         Wo1GiK4tRpzBQOxXYXVv0uzTFZuaJnTbhmIXslqCARYqw/fDPTY1Ip4AIaJaihOBa+lc
         Zf1Q==
X-Forwarded-Encrypted: i=1; AFNElJ/7uiwlBPYg0s16NXr/LQkGv/82pkdYRwMhHw9el7KF3FCiH3dfAnJWXFVSe/Uq3Auhe/Txv95Zs1DlrQ==@lists.linux.dev
X-Gm-Message-State: AOJu0Yws+8b6TLQW09wnOrgJBhaOScz+IurSWv7yIV0bIGD5o+MCZnmT
	lO/A6cqG8ZiQvxDDgMYmyMhtraOHLAR7IDJ/POYizzPnmdhMaSEiz+ZJ5LxzpwVVmTKdEObWbS2
	7Rt34eg7/1O5y3WpezKDpsATuBZZTIO1II4B5Mf1VHSQcg/WliGMax/Nfz73MCmmVEg==
X-Gm-Gg: Acq92OG/k3+5muznKo2R+pAe4Bs7eMXOgkh3H/ZE79Gpl+rHXgwF+LYYSnuHLZD8VkT
	A0rLTk5tOCmVpUuUfkjt/0TG6SGxzP4l/CxiVod5Zk0v71T1G+OxzvI+HKYaAKxdPXDfrG+3h1P
	+j5vpNxLqOYwbcDC9lFD463tetbWbzyGNCs/kO29l9Sa5wrmlktG8XqpB6XCdOlwVO1IfGPXNgI
	OLw72lWFGozzFtlu3G4xsUN7RyTDWJhKCREisgll+Qi1l8t3pnBN4xM/QNCBcGK22Muf72wGog6
	Gx49ogyyul7pj2W359Iwek7zVM6ZZMtsVA2OlqLoh5eonvEN4CnsAFOm2Le9zI3yfj11oRSxYdW
	sO3ESMy091huaDbjvxnc+h+Yo2Xv0A+tAuOc10wx85fwNGv1F1au7hlD32tyR
X-Received: by 2002:a05:6214:2386:b0:89a:1c81:65a6 with SMTP id 6a1803df08f44-8bdb9b59b8emr211043256d6.17.1778485771472;
        Mon, 11 May 2026 00:49:31 -0700 (PDT)
X-Received: by 2002:a05:6214:2386:b0:89a:1c81:65a6 with SMTP id 6a1803df08f44-8bdb9b59b8emr211043146d6.17.1778485771059;
        Mon, 11 May 2026 00:49:31 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:63bd:c2f9:cedb:aa32])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e702ec51fsm147605045e9.12.2026.05.11.00.49.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 May 2026 00:49:30 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Saravana Kannan <saravanak@kernel.org>, Rob Herring <robh@kernel.org>
Cc: linux-acpi@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH v2] device property: initialize the remaining fields of fwnode_handle in fwnode_init()
Date: Mon, 11 May 2026 09:49:26 +0200
Message-ID: <20260511074927.9473-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTExMDA4MyBTYWx0ZWRfXxghbobeyU0/x
 F98h6TofrezFcP1wrIX0qSScLYRJS+5k3Rm+skroLah7ZMHPMX3bRevUhMbYcdUgLwEZbwv8Do5
 elH0mB64WhyEuKQGCsdARpzZF6ZQW7q0chY6zLerv4LISbpQ5o1ca2sA7X6rtKZa+gCLJXKrTWA
 VwLp59trMCv1EB0/KN/oinGjDQ7D+F/uXeUzY9UHPCVoL0ycNcSdCcu9w2pWYBOrtPNDJw07hsX
 +rnxKhUUjBSB6/OTbYFbupjWCv0zE6JcpgLubsCj6fFNXqhzEGxFXny4lZIfy+wuOALFTDypWZI
 2UEGvleydKWqJa2JNtKvo1bKNyNS/2Wrwv8wJs5CnE8ssuEYoaeJWAHX7xuuREwA1m2xxlBet1o
 OMIZFTxaoX1Gc0HBmn2qe3mLWUoAYAXoBKWnfNbM1lDaYCyH1zIscRTdx85prNXqFOuQUHAE2BM
 a4Y9sY3sJh1eYrl7sIw==
X-Proofpoint-GUID: YFxxRj4jsNYCajdT_nCAa-PaAOB9o9pg
X-Authority-Analysis: v=2.4 cv=X5Bi7mTe c=1 sm=1 tr=0 ts=6a018a0c cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=ZpdpYltYx_vBUK5n70dp:22 a=VwQbUJbxAAAA:8 a=QyXUC8HyAAAA:8 a=EUspDBNiAAAA:8
 a=VQTjnhxCuS3Q28dGhDUA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-ORIG-GUID: YFxxRj4jsNYCajdT_nCAa-PaAOB9o9pg
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-11_02,2026-05-08_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 priorityscore=1501 impostorscore=0 clxscore=1015
 malwarescore=0 bulkscore=0 phishscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604200000 definitions=main-2605110083

If a firmware node is allocated on the stack (for instance: temporary
software node whose life-time we control) or on the heap - but using a
non-zeroing allocation function - and initialized using fwnode_init(),
its secondary pointer will contain uninitalized memory which likely will
be neither NULL nor IS_ERR() and so may end up being dereferenced (for
example: in dev_to_swnode()). Set fwnode->secondary to NULL on
initialization. While at it: initialize the remaining fields of struct
fwnode_handle too just to be sure.

Cc: stable@vger.kernel.org
Fixes: 01bb86b380a3 ("driver core: Add fwnode_init()")
Reviewed-by: Sakari Ailus <sakari.ailus@linux.intel.com>
Reviewed-by: Rafael J. Wysocki (Intel) <rafael@kernel.org>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Changes in v2:
- initialize all remaining fields in struct fwnode_handle too

 include/linux/fwnode.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 80b38fbf2121..c30a9baafc0d 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -208,9 +208,12 @@ struct fwnode_operations {
 static inline void fwnode_init(struct fwnode_handle *fwnode,
 			       const struct fwnode_operations *ops)
 {
+	fwnode->secondary = NULL;
 	fwnode->ops = ops;
+	fwnode->dev = NULL;
 	INIT_LIST_HEAD(&fwnode->consumers);
 	INIT_LIST_HEAD(&fwnode->suppliers);
+	fwnode->flags = 0;
 }
 
 static inline void fwnode_set_flag(struct fwnode_handle *fwnode,
-- 
2.47.3

