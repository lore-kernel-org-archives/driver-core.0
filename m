Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2071D3A1E9B
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:50:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775821859; cv=none; b=iVJ8hbSuIuEQ/ScpqnqVvlB57G/qn0E1eFWJ0qhYKsmuVkR9DN9mhXZEj45p5zmNV48n4EZFjmuokx77f2V2PFHL1XxgApJwNE8t4gNF30zYEEOiPUVOnBHi0shKuQLbVHdzcJfciTDQL7Kh/xUgZuYzQHfWhXSvLK80W1P4bo8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775821859; c=relaxed/simple;
	bh=Am/qluYupPgFvPSC0fQyiILgcgHRys2NcbqvSAT5mc8=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=D0exr3vASFvcfCBwmB1r4UULcyiNHrhN16z6Nnj3fCl9Pd39QNz1jgDFr+KxbEnmhPf8kydODqLzX/MJbGJqwusGQ5t7Ex9Y3T/C411tY0rwUWagrQhQtbBCG0Bqpfbubf8Wmk4lvedJ5T2HZPORuBjhdjKuCzev49mqn66w1s0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=mJ5Kvoxy; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=FysP9/IX; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="mJ5Kvoxy";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FysP9/IX"
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 63AAZeb02698298
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:50:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=HKwy8Ck5W3T9VnpQrRaRjZ
	91XmgZ+iJb5Sp4WEwV4Yw=; b=mJ5KvoxycUta8ZeH/sgmC90T8pvLWJtf9fzuPl
	sPTsK/LCNtFu2FTmZBT7AIeEcqTTxLk3UJr+zQ0W1sjv8HWoEEIx1uQSarzjvhmd
	VIJz7LcBxvc7g9FZ7EWqIyckDXC6HkXyrckjjEAfDzUnjiZ1pnc0C/nm/aDORhq0
	La8Qlxn3W5pi4Gky6D/ybjXaBmY27n742Y8HpeR5scbe9zNMS7ZVVgIDfAdiZMP5
	+jBArZ7znrtZFAZiVDX6wl7sDHXoRU71a7l22PCzJ8chQtRdc069bKeW3bNYcoYr
	KsDREEVK9xF6i05uG0aDIuu6ymSDWE85wXJ1mOGZomPbyATg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4degt9u0d2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 11:50:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-50d68dbb77bso38005241cf.2
        for <driver-core@lists.linux.dev>; Fri, 10 Apr 2026 04:50:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1775821856; x=1776426656; darn=lists.linux.dev;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HKwy8Ck5W3T9VnpQrRaRjZ91XmgZ+iJb5Sp4WEwV4Yw=;
        b=FysP9/IX9UpW0rHuVm85SRo8Wk4YT9AEtb7oGMjKAExXXIIVToQkBtqR0fWUDCqHU2
         KRW8ACIFmO5CJ99M77tILs8E36DV0NYBMZkr8pmboirBdwZD56YKnQjwbz7qczU9KDXo
         6Eh0VDuLQL127ZAXKAaHNUrrQSyLWRTfrQzlaGSZl1zbfHS4jEkiT0hbPZ0zxGo+8shf
         WhNSfzPmsU5xeTW8+q0HM0698m8i3TURogpHRXdbdExHRQub1bHOEOuk3C1fNnfYnHzq
         h/1lfe4ChV5ioM/SS4BOBNVO53vmuTCLd5Rhdkwdg1Apr7q/1aW+rH89Za74B4sjX6TD
         dhSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775821856; x=1776426656;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HKwy8Ck5W3T9VnpQrRaRjZ91XmgZ+iJb5Sp4WEwV4Yw=;
        b=ad5tDDdqxIC0nDux0+rvpXvWogibwnV3UKDp1Jy4EG87b+6M+uTbAguhpaCwrpfsl9
         Z7mjz0/33JZgFo640nuhW7ssm2WNi7n4HrvVg27nhTwoIs1E6QgHOYHIIDlK9ycpocSW
         94QM+m9V7jYt7Fqo2Hij8f6dt34JnirpDGA5TIo8gnTolyphEbLysx+0DFGp0ujrakOc
         jiTOFJL3/U31JYjJYowk0+YjvGFznkmfZ1h4bEPsI96RiA4xdwvlAB+ybMYa+/0rTeNa
         23iBYrVrY6GVtUVULsvKmujw9Nct+vM482aD2EMHGP8f1ktocosSVeAivfe6DRV9IizA
         bmlA==
X-Forwarded-Encrypted: i=1; AJvYcCV/gWN3j0IczrWCjE4wvMJsCBaAeDs3HbILj0FQxRdXNX4khs35cchmPtH7XDUJnfIhG6eqJoe2rTDTBQ==@lists.linux.dev
X-Gm-Message-State: AOJu0YyP7PjKZt220XHjIIRjOnFztnRzHaWjz5NzKnYWEuwjaQpfn6M1
	bEw2dsxclkqvix38/kCySE3jpVxCkeIbPsrthusUzJXVaK8etiVyzDBlwCT1bgC8OGaLULp/1yH
	45x723vZlYwHcAGsQd92pNc72MA0//NKmJLUsvTZ637g//eUrIX3eZXuNvea7xhP1lQ==
X-Gm-Gg: AeBDieuH2NuGoIhOKsYuBHQwlKT+P4GRmfEWmWWuYbuFb01J3zejS+liTfBbRh6Ykf4
	CgxFkHn7Y/6pDVucpkAUi62tSAUSMKpaenKz9K7H7NVVBdu3gBfrggyV+VpOAWab3GhyUfjXabM
	P3Kq4JgqBjMmJDL782bK2kqWHkhGpVc+tactk905M8rMh7zPlmiwlhBEeZQFxGhb1vQExKnx5ww
	DYplmDt0PKpiNvl6hHkOVHnlNK99lFPTpjklMdOTQyR9xCiu27ojEghtEYCbx5XRVcDGPgdGmhg
	UBP1eI0YudYlCdcL1UIF/ZXZ00XsET+nE4PB189eBFDTL1OIHA7g41pa3WoVtGJmKCQbVydQEH+
	2Rykt5qcMxKz0aBKrcpCz5ecJe2S7oNMYr2+Z/k/aUlsSDoPp8A==
X-Received: by 2002:ac8:5a88:0:b0:50d:8a74:8131 with SMTP id d75a77b69052e-50dd5c22d1amr38952451cf.53.1775821856540;
        Fri, 10 Apr 2026 04:50:56 -0700 (PDT)
X-Received: by 2002:ac8:5a88:0:b0:50d:8a74:8131 with SMTP id d75a77b69052e-50dd5c22d1amr38952071cf.53.1775821856029;
        Fri, 10 Apr 2026 04:50:56 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:47f7:9881:2ff:bd1b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43d63ab84cdsm7019329f8f.0.2026.04.10.04.50.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 10 Apr 2026 04:50:55 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Subject: [PATCH 0/2] driver core: remove software node from platform
 devices on device release
Date: Fri, 10 Apr 2026 13:50:44 +0200
Message-Id: <20260410-swnode-remove-on-dev-unreg-v1-0-cd7d305f3db2@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABTk2GkC/x3MQQqDMBAF0KvIrDsQYyjSq5QujPnaWTgpExoF8
 e4NXb7NO6nABIUe3UmGKkWyNvS3jub3pCtYUjN55+8u9I7LrjmBDVuu4KycUPmrhpWDj8scoh/
 iNFILPoZFjn/+fF3XDw32MypsAAAA
X-Change-ID: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: brgl@kernel.org, driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=995;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=Am/qluYupPgFvPSC0fQyiILgcgHRys2NcbqvSAT5mc8=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBp2OQXe5C42Cut1FYh2Cwp6QYzxwkrtwVZ5k316
 wA6thbUnFuJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCadjkFwAKCRAFnS7L/zaE
 w0SaEACSAz80K9LZ+KSXNW4EZLKy//UBKcKmwf/6sEeSMsZShGavSP+Xk4fUHfwUQ9jvDvEET2b
 hyS5KhnPwBk6mLA65mCGXIuiqxc/PVTr0kJclc+TTOOA+KyDMP7KN5aBQFNzG3nEvukKG5Bkmvy
 TcwtmmpsjTv3qMwkAnaTU1J1Jx/bUsVcpHV8XVWkvyPzUJH+il8A6fjxNwpyNGI4ue/QXFRZVmL
 1frTXQ8wgmhiFb9TblrEVYSeD3rFN9htWauxTcezDZ7MzfyPqIUqUUwfvhSVOV9FIA54w5RgNM3
 c3kgJlMWkqLI02eHC4kaZc6QcMvMLVx/g1XSxTTAr1h5IUptPZrlo9lPzC/eDOndXmrYVvEY/y7
 nlgWLIN6xF6GE1UaLcFop+ACl01wfq379H9NP7Kc5FootFKzLB2TOPTi6E494GxoHaBlVBLrh4Q
 EFh+cEaxfXNSV/EuuzB5LZggNiIFptWtin0Kbu4QmX8spfeaKJ42XrtmgeWzReVryZYDppyOMAI
 ypyPBYiLMkIymmJPgl1fFSdMx5WE5hc1du9zDHP/HJ6k7UryVaj+kgaTFU78ePwzuSn+ZkS5s+g
 BNqA5csOB22QjwHoyYy/esCsZPnw8rMxhrpHSMfPwSWHtWhKWqJ8GbI+0DaXWxY32UAO2LV/x+l
 yFiLRDNIXaTEuBQ==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNDEwMDExMSBTYWx0ZWRfX3TCJhsh+ayBt
 QUufYNV4ZnRxMNQSITUluzM1kfmrjTjDe0ReJbcNftdjvTxYitqD0FQ4xCVGXzLC1XkkY9/QSQN
 NGP1Sg5ImbCPO1IQGl5vmQyqXXWzV29yIdGVjZronT1vj8U0r/5xnCYfW9zoKGDoEvY34auHpS1
 O1NTXfzn8O0uaYHY5taUF8crppUEmK47r5nqu2GoVujnrSf56jnk08q7bUOVsXhQVgqJ3yL9eAR
 YlwYYH3PdvRdiAvn4lNYQAYK0Ob0KbAmQo4oc6CMWSn2b3d7c7roC5W9Zlc/mxoms4f9IfIB1/o
 WM5GyyFRr6azLVssR0vYydtRCNs/FHnLaIaf7mkFarleF4E+OmIe7pz5y8uUbSLIzZsIbQdTbGG
 qA4FPdg2HZfT76gaaqTGZMXA48vPTOF/fgPDzGGvZFfOl+rUr1z5HIGcVbvme8mK24/VSNb0zrL
 6z1ZT9tmlsExEKZYLSA==
X-Proofpoint-ORIG-GUID: rqo4qWxuVuIkuG6bjZd5-47DJRTPql-y
X-Proofpoint-GUID: rqo4qWxuVuIkuG6bjZd5-47DJRTPql-y
X-Authority-Analysis: v=2.4 cv=BJyDalQG c=1 sm=1 tr=0 ts=69d8e421 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=A5OVakUREuEA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=3WHJM1ZQz_JShphwDgj5:22 a=EUspDBNiAAAA:8
 a=bAqXJCGjAz13WcJNUhMA:9 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-04-10_03,2026-04-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 suspectscore=0 malwarescore=0 bulkscore=0 adultscore=0
 priorityscore=1501 impostorscore=0 clxscore=1015 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2604010000 definitions=main-2604100111

This fixes an issue in platform device code where, if we specify a
software node for a platform device using struct platform_device_info,
it will not be removed on device .release().

The second patch adds a test-case that can be used to reproduce the
problem and prove that the fix works.

First patch should go into v7.1 while patch 2/2 can be queued for v7.2.

Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
Bartosz Golaszewski (2):
      driver core: platform: remove software node on release()
      driver core: platform: tests: add a test case for correct swnode removal

 drivers/base/platform.c                  |  1 +
 drivers/base/test/platform-device-test.c | 62 ++++++++++++++++++++++++++++++++
 2 files changed, 63 insertions(+)
---
base-commit: 3fa7d958829eb9bc3b469ed07f11de3d2804ef71
change-id: 20260410-swnode-remove-on-dev-unreg-42bfc4b23ba8

Best regards,
-- 
Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>

