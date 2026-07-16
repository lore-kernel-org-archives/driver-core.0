Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4209B3BB9F1
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 08:16:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784189773; cv=none; b=HGnaDeSlKQBXXS8e5Pqos1ysWyYyfZtQ/qmAa6hmTj8WV6uI0rU/VSY/Y8yMgGjooe9Mz8rhivFv5wqpK3AW2h9I+xvvOcj8GWGynRxIg9ABZfBt4OY7DcqLKFBGht4oPJe3aToYnAdhteSKVp5axm0nW16JVaTdtJ9B6IM27zY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784189773; c=relaxed/simple;
	bh=zuqzZXCp/woKXCqBIjwV+EoLx91zzOso8HxOOXoirCM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hLYq8/EeeN+0rZuGZ9wsW4+sCQsrrTxvWeH+sJhQQIyqyw4DTq/2cwe61qOvAn5hTFe156fNxJHav+ft3sSlzRnQwGcpXeV+6y4M/zdr7WGFLJmbCcF3McFt6IqIvq143EKwvLHH/fJxQcIszAL0d7hlkXO1W7Pml1By9sbSgDo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=H058Su1I; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=VzjZkveY; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="H058Su1I";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="VzjZkveY"
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66G7E18J1849096
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 08:16:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=MByGLpxRNW7YQ56ZcsupMkMp3H5PJqKf4yS
	7m1GeFHw=; b=H058Su1IP9RyN71toSHhcAGLg6Lamdv+csQDPI4HBSJkOIG5CaU
	EKriN+UYya8VMmwPvgCzVWj59JfTcSh/y/PSigeGU856HEnQbaoMbIfbtgqc2IW6
	OkhugeFVn7KraLUdPu/VMMJb29JTnEgIM3T+z/hU67Iz64u1rzMq0HZU+yjAzvCM
	yPNLXTkNpt48yXWhgn49EnlzVRepNE17njovsN982ld8ANNFMwL+LP10QLr3OYzX
	2+JIspXVWA6kubTQMb8Yof8PIXZ+vUwBmrrgFXECZbkmV3DKTPCyBKT9cWGPOqFN
	98qgY/F2G4g1Vf4vm/TgMLPPGdE5cbbLwPw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4fetb7rag0-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 08:16:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2ccb6f6a3f4so6728515ad.1
        for <driver-core@lists.linux.dev>; Thu, 16 Jul 2026 01:16:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1784189769; x=1784794569; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=MByGLpxRNW7YQ56ZcsupMkMp3H5PJqKf4yS7m1GeFHw=;
        b=VzjZkveY1Uao+UhnjkNNhOk27CxZKrWbn7AHYtUHAoIYb5BTSs3YMa5hOzAG8+xeE8
         c3Z8oj3eSdayYmVCmErVR+9LVZf7mQaNkyJLZ+rwSrFf3WafPidch7+X8ADTShlmKcMG
         KhcO2IKGaHMKpdE+81kUGGci1ex2XOTD9lvKWoKNdd1kQUv781KfMq9vCHUAMKmbGZ94
         o1U4ykU8Be75nCWjSQlJscREly9FnBDaItC+DTFDgzIpfhLoAchaDxw3V8lYXI+Kx9hG
         8bqRlRTpkeuk8lVL6rTBLmbRzL9jcA+VO/K/lG7w17t61Xy+gsyD3Om5qHpcyamlrOau
         +6qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784189769; x=1784794569;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MByGLpxRNW7YQ56ZcsupMkMp3H5PJqKf4yS7m1GeFHw=;
        b=X6pTt7AeTTlpX8mi8k5BF9GDkZlOJkroDTaV52Dwvs3y4N7M1elnqpAbnRB5MHucq3
         xz7pB559v/Lor2vx09QcPtr5Gy4rkjk8hapHKc6bbEwuIWlxey4krIpjMUuDYexBAAOJ
         MHmk8cF+jplMD6cHv8l2Hj2OY05Ljy3HWmidZbv8SNKFpQ1v86xFQXOBOJtZ+yS2upmD
         swSJr9vzkjQ3dbveSvKQrxQrACNzGhgO+nWIONyffQ7e7FiHrWbUMFPu3lghtPufdwp9
         MCHbFTGmPtf3CSjFDvaIaKCSKk42bDBIUp7JkbfJaEz0v3SRzQcBchmAVs5hhxR8VtQp
         lKtA==
X-Gm-Message-State: AOJu0YzE8DEM6wQdb8zeeO8Y0QVnGQUqy9ag6+b/Sgk0u4lElxbxppBR
	ZYosk0uIQQwVVv3qxRN3f/IlvmwswyWqXCwwQNYidKm+TFGgThgwZbjoBPq+GSsmKgAVz/0HZ4o
	boDWZw9AnGIM2eJf84dZtnALQxi4ybNZLuXsrjAnXDTIqtPBlPQ7eZuVMxrSp6asIZA==
X-Gm-Gg: AfdE7clnWvges3hMiMIQp5Z2B7CZhSPb4DP8gsaeKZS01TMF0ax8RWdrCg76xvWkdhw
	T3XMnXxmp8BvXExaLP1bUCSp8Uk5w/hMVSFRjk6CKP0+vVlIUXmQL0f5vsxHydCxW3prV6CNOe4
	/Kpill3w93pr4DmgT/THofFu9lJWb+zH8cLPF83GWYZNucG4TGjRrPKl0mNDd9g/R+KkHNMAWVJ
	wJJccKfmfvN6a7p4JrZm8ZSNnFZhdOjvErKPSVdrNZVcpcjKoi1KCVrAU0QMVaIUQCrDGlHXzPi
	JRlOlbEO1fDQl5KNHp+Shm+D34gkEIat57Rahtn/25LUi9pUqiVWm2gCyOTGSgi3SZRjl+yywZN
	Ywvs97QuGAyjMwvGd7ZsvPnbN3Ew=
X-Received: by 2002:a17:903:3204:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2cf1f578795mr17372815ad.26.1784189768643;
        Thu, 16 Jul 2026 01:16:08 -0700 (PDT)
X-Received: by 2002:a17:903:3204:b0:2c7:c385:c5a7 with SMTP id d9443c01a7336-2cf1f578795mr17372395ad.26.1784189768022;
        Thu, 16 Jul 2026 01:16:08 -0700 (PDT)
Received: from hu-mojha-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf1073a3c2sm15891595ad.83.2026.07.16.01.16.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jul 2026 01:16:07 -0700 (PDT)
From: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
To: Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>,
        Danilo Krummrich <dakr@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Anirudh Rayabharam <mail@anirudhrb.com>,
        Shuah Khan <skhan@linuxfoundation.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Subject: [PATCH] firmware_loader: do not queue completed sysfs fallback requests
Date: Thu, 16 Jul 2026 13:46:01 +0530
Message-ID: <20260716081601.1674470-1-mukesh.ojha@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzE2MDA4NCBTYWx0ZWRfX3cmTQv6aimBL
 dYJVNoqZg5r2JxxOVqzP5Ey0SzwQH+Lxohw7cPe20Tjuk96j4SKc3nhh5NkTRflyhCdla40euTE
 xRMkZuV18XLs03Iu2ST54jTuqZKmugA=
X-Authority-Analysis: v=2.4 cv=dM2WXuZb c=1 sm=1 tr=0 ts=6a589349 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22 a=EUspDBNiAAAA:8
 a=LoHWregEG7KfMwwwpb0A:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzE2MDA4NCBTYWx0ZWRfX/oNBC2yIvwyb
 tmzz1MSJ2LmcMxtFH5+1c0dGY1X0RFU0honSVnoOgzIE/at0wGU/Fkk3PamCeusW0Zy5MN+q8Zk
 d5hEXwUNMV/8oyhitKbrvBUTDVo76ZyBv4ODZbb/fHaHprXSQ6qzBug1rBtMq1xkvMC7jQRTqlx
 G5vXnEJyrpvkSGAk05aQRrO4z+m27CEgQmYSOACVXuH1QpCWcC0UqyVxL1uu6ceY6KKMwky3i6U
 pd3HPzZJiOVkZ5hlVhJee/E4n9k1JfnHNqYu37sCCCeiKM/k9DIAuYT3/G3e1HX6dXLuECtWDDs
 Ax0Yvj356sG90yOJlLS7lGz71iIrbGj+cLU/SV//bSH13/Mzg4DcSNFoOneHW2NH0pJJitTL7in
 x8WdKQFSCnjTMi8ET1dsCMculehMFop3cY2vh1OOQ2/U9ztNnpmrk/TjcNpJjlOlymGqys0N40h
 htfKEr0R9WGBikxVwKQ==
X-Proofpoint-ORIG-GUID: AXdexfxsn3aJt0WWUboCItokeVIfvFq6
X-Proofpoint-GUID: AXdexfxsn3aJt0WWUboCItokeVIfvFq6
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-16_03,2026-07-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 adultscore=0 spamscore=0
 lowpriorityscore=0 phishscore=0 bulkscore=0 clxscore=1011 malwarescore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607160084

fw_load_sysfs_fallback() calls device_add() before adding the fw_priv to
pending_fw_head. device_add() publishes the fallback loading interface, so
a userspace helper which discovers the device by scanning sysfs can write 0
to the loading attribute and complete the request before it is queued as
pending.

In that interleaving firmware_loading_store() calls fw_state_done() while
pending_list still points to itself, so it cannot remove an entry from
pending_fw_head. The subsequent unconditional list_add() then queues an
already-completed fw_priv. Once the request is released, pending_fw_head
can retain a pointer to freed memory and the next fallback request can
fault while validating the list.

Only in-flight fallback requests need suspend or reboot abort handling. If
the request is already DONE after device_add(), return success from the
fallback path without sending another uevent, waiting again, or queueing it
as pending. This preserves the invariant that pending_fw_head contains only
active fallback requests.

Fixes: 75d95e2e39b2 ("firmware_loader: fix use-after-free in firmware_fallback_sysfs")
Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
---
 drivers/base/firmware_loader/fallback.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/base/firmware_loader/fallback.c b/drivers/base/firmware_loader/fallback.c
index 3ef0b312ae71..ffe1b3784788 100644
--- a/drivers/base/firmware_loader/fallback.c
+++ b/drivers/base/firmware_loader/fallback.c
@@ -95,6 +95,15 @@ static int fw_load_sysfs_fallback(struct fw_sysfs *fw_sysfs, long timeout)
 		retval = -EINTR;
 		goto out;
 	}
+	/*
+	 * device_add() exposes the loading interface before pending_list is
+	 * linked into pending_fw_head, so fw_state_done() may run first.
+	 */
+	if (fw_state_is_done(fw_priv)) {
+		mutex_unlock(&fw_lock);
+		goto out;
+	}
+
 	list_add(&fw_priv->pending_list, &pending_fw_head);
 	mutex_unlock(&fw_lock);
 
-- 
2.53.0

