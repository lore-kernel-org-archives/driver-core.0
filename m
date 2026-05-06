Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D0A426EAE
	for <driver-core@lists.linux.dev>; Wed,  6 May 2026 11:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778068634; cv=none; b=r4nROWmJ+CEZ4a1VkTnHOxqnO+1WhS3Bx7Ui+xP6VDMF1+lG1r0mBgJ5Ci8ZgRT8VHbuDUDuDiBKAu72A0GiXWpA5r/anQAIAog1aE5IIBfiQYZxcaKz7l9tj8XjLboNgQ53Pyjmc7IBnG8ObERhGmchwJpVpa22yCZwlHVqkUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778068634; c=relaxed/simple;
	bh=87NP7XwywOn9x/iXWB+eXS5eWuDkx8j+CF4L7FZPusM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=TSfllhdeU3ksB+D4MvyMccokySVaLkmSRmNXhh8iSiTMp3qL0HphT3+t5m8HbAMZucm8lApWDgScePaw1gfGRQUvQ6+tjOIG4LCRnJpiqSJt9QYszufWDjtZBEe7zzf1+/YN6a9Fl1V+R14cv1OZVFiIQkFv5H9Jm+Y1EJTbVOc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=es7gRqPv; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ZUusy9yg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="es7gRqPv";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZUusy9yg"
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6465vNSP153474
	for <driver-core@lists.linux.dev>; Wed, 6 May 2026 11:57:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=Odr8obAqI6YzuQA1Xf0eZUfZcXB+THZa+6j
	Hl6jpP9g=; b=es7gRqPvfcWjkrWR2L584axIUuruZrtV6MWjOIfz7Lh1qSod49p
	Oy8XigTxcm9eNpkWcayHLBAGl0VvVqQhYUX+SAh5f6n1w6RBEaEAo83Xz/Hv7Du9
	6VYjwznv6cbl85IlV5FtzNpAORbLU2D5fShggV9A7NJSBQG78P/4evOrheeLY16/
	zXNVzW1+4+M90DyGoFSd5J6MZJFsKQq+Arruncd7eXWyloeYem9HlCXF9iXelcZs
	w/eEXlA7LzMN1Gh02d605dI+kI1YO4/cQ2Fhpn7o6dRaV2qyU4zWmPdQI/XppJX7
	zekoMJJwlhQya9WcC2w3j4dbsIiuETzuaOg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4dyj80ch97-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Wed, 06 May 2026 11:57:12 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d9a6a853bso159195241cf.0
        for <driver-core@lists.linux.dev>; Wed, 06 May 2026 04:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1778068631; x=1778673431; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=Odr8obAqI6YzuQA1Xf0eZUfZcXB+THZa+6jHl6jpP9g=;
        b=ZUusy9yghT578ucmNvuLbV/Z3LfBky6PqAyMXtlwSeCf9d8E3z1VT7VIVa5lFkWF6g
         dquMgYCiOvGVz1L4UNNGbVXQXZRYPbvc+pJzcEfBQGKYPm8YXvhv9Eyh9pmogbbVL/Wg
         y0+0qQXKDIH9fknm8c4WblfawII4Qm3/5y56fBvR3BysND2u8cXPtEwtmMSgfvZVkeFt
         dfn+Y9/nPJ/wDzxs65PEM9uvprJrNcpkqjjdU4LWrFp2C8rLcLqmV3TQ+bIBW7tWzxkM
         fJ7hNNCO8khAOUIhKxsDpd6iMSyrCYxgQIyurTyYsbY1KQoi/oezBuW/n/3/iAPMNdhw
         VFoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778068631; x=1778673431;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Odr8obAqI6YzuQA1Xf0eZUfZcXB+THZa+6jHl6jpP9g=;
        b=YpJ7Hf/v9TcwJ0MU3PcDTvvQSQuyTyhZ9CsiQ9jXXbr3SO9BpfEKahRQHjhlv1EaWu
         s1Kni7n4JzzXsUqs5JpQ/o30grdHG/pjkAzeIKlfeifMQuWQW+Ptklq4iY3dbsIHjbsW
         +fO3Z0SfjQTxRVqBH5lYo1kl7hWZ45jDjNO/CbAzFYXTBwLoLgW9PDGunjbMVXRH6GM6
         c3dZGxrVj4xS6v8QGpeZWwyn5PCGxrBTj0QVZeeBhnzNAu+QfmpGyCQZ7ySm3K3J6xOF
         LHLI16GIafZG+uYV1myEoXDJheyspnya2JwI84CzTb4zqVmL1mo5kNZUMZ18EifiaEKR
         7Phg==
X-Gm-Message-State: AOJu0Ywd0VClOjPO3Gms03e8U+UFLGy9PM1VO5fjvjY74Xm7LMaXiUsW
	jH3oGAsbXhnGTWlEPrfIpLEMsXW3Ss2AfoxXYd3ydspHgghR8b68BkGlSOI98U1xLj36jZoAhBc
	EZYR0RBtUfDWnU2+ngeQPy5OGDcvINidzmBlHPVMDZgFLrxqxk4VDRXd1OJyQHpXJEg==
X-Gm-Gg: AeBDies5pGwSGdPft+QP65BenhEANdlduZLOglTdtft76sN07YZaxkdcESfHSTb7sli
	ymZwD5o6bgRgjNiuPcjsm0SYfZ2YBh5CK478L5r1p1tZhvI+vGhiIIUxNVwUoIy7HYZ7BY3nY0n
	5VuLVmNgEgnwwMdC5XrwIFNWVuWQI26TJLiNpsmJq27vrFoFAKwWs6Tss1gLXa3MU5GzNIxwVuL
	9HoTDBJOMw9s+FWam2AzsNXbuFTzI7bh2RTncUpnYAEy3reb0wL225nsRs8PLmTUlAwK5Rbg7gK
	dwHpzQ6lL367vDuhW+TegKXJ8Cg8UVmPNVvzu9XzC3n9cDfjeWf9MkXHae7zAL+yKGpR2KowMk6
	R4LOj4Ox8azbxoRZm09YUx8qVodJqsIVMhs/xmdOSEtpTJBB/zeE/UkEOuHO+
X-Received: by 2002:a05:622a:608c:b0:50e:60b7:bb40 with SMTP id d75a77b69052e-51461157e8emr44080331cf.0.1778068631071;
        Wed, 06 May 2026 04:57:11 -0700 (PDT)
X-Received: by 2002:a05:622a:608c:b0:50e:60b7:bb40 with SMTP id d75a77b69052e-51461157e8emr44079861cf.0.1778068630631;
        Wed, 06 May 2026 04:57:10 -0700 (PDT)
Received: from brgl-qcom.home ([2a01:cb1d:dc:7e00:ebfc:d4d5:c415:532a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4504f4857ffsm11651522f8f.0.2026.05.06.04.57.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 May 2026 04:57:09 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Len Brown <lenb@kernel.org>, Rob Herring <robh@kernel.org>,
        Saravana Kannan <saravanak@kernel.org>
Cc: driver-core@lists.linux.dev, linux-acpi@vger.kernel.org,
        linux-kernel@vger.kernel.org, brgl@kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
Subject: [PATCH] device property: set fwnode->secondary to NULL in fwnode_init()
Date: Wed,  6 May 2026 13:57:00 +0200
Message-ID: <20260506115701.23035-1-bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: git-send-email 2.47.3
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=XvnK/1F9 c=1 sm=1 tr=0 ts=69fb2c98 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=NGcC8JguVDcA:10
 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22
 a=DJpcGTmdVt4CTyJn9g5Z:22 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=oySY2n27BtFPXPS6EewA:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: cVv-s-leHWE0d-GkgcoFf1ph88Kwamkm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNTA2MDExNSBTYWx0ZWRfX3AALU2Q8ZvOA
 cz6VNbLZCr3xWxOEA3rsB1TXyWqfu+E7AVNYbwqcgB5/F+MhxMYI6fYnJvOgCI2IbOtL691tcSH
 LcKnX0ClCx4ccE6Gvsnf0oDZgMs39JQ6AODGv2UXT0wfAvmgR7zvbdpUBo0xsenL6esnP8htfsK
 cHJx77B/Oc7wYNDYeJqVRq/E0RtGZoklTSi3jzNyq7UBL8uIgGUId3JCEsIfyV9l71IP8Xg2MH8
 ezLSvfHCRIOWum+xQWe7iX4OaRWkRCP7q2iIw0F2OGGMPpkXwA6XBK6iDx5a13KS+P1tN2yR9Ud
 OukQLfmvwaVXBJmTk72WQiEFym2l3xOPBQiKBgySwVHrIrYsL6ADl2aCj7b5Ze76y57wnRpzZN1
 uFdoUVKgqhs3hBjRr4JWYxDjEjF+05FNobr9anW7nh2bPhCTxK5h+yzQXJVWVAaf+/bgtoAobBa
 aVrEvZmp8cgtIAbDTiw==
X-Proofpoint-GUID: cVv-s-leHWE0d-GkgcoFf1ph88Kwamkm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-05-05_03,2026-04-30_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 suspectscore=0 priorityscore=1501
 lowpriorityscore=0 adultscore=0 clxscore=1015 spamscore=0 phishscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2604200000
 definitions=main-2605060115

If a firmware node is allocated on the stack (for instance: temporary
software node whose life-time we control) or on the heap - but using a
non-zeroing allocation function - and initialized using fwnode_init(),
its secondary pointer will contain uninitalized memory which likely will
be neither NULL nor IS_ERR() and so may end up being dereferenced (for
example: in dev_to_swnode()). Set fwnode->secondary to NULL on
initialization.

Cc: stable@vger.kernel.org
Fixes: 01bb86b380a3 ("driver core: Add fwnode_init()")
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 include/linux/fwnode.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 80b38fbf2121..31df7608737e 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -208,6 +208,7 @@ struct fwnode_operations {
 static inline void fwnode_init(struct fwnode_handle *fwnode,
 			       const struct fwnode_operations *ops)
 {
+	fwnode->secondary = NULL;
 	fwnode->ops = ops;
 	INIT_LIST_HEAD(&fwnode->consumers);
 	INIT_LIST_HEAD(&fwnode->suppliers);
-- 
2.47.3

