Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50B69535FA9
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792075615; cv=none; b=MJRfJxNKkjDyGIAoMkSdkAyyfAJEfVyFCo6zyrjqe2z/QXTi2LrWSHoRlKyMos2L5ckhuleVrcI4KP/0lvjnXAK4H/+Tx4gCBlibGW+vJPVoICIps0az8mpFQbl9gjr292Lpq/TX6+1uNT2tU20JuttKCUWTuoQiTr+b2hO7isY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792075615; c=relaxed/simple;
	bh=b5psEhGu33J6XAeJBkiV8PWWEXQuiHu7lH/f7ufztzM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OMohAU87JthB3yN1GAZFhenxdSqcTk10C8j5ipgivhYMrkntH4/9ZovDIK6oj8BTmBrBu972GADgIFUpLSZg1FDciMCo1hFvI9LgcxayhCeS36iT9kvNHZXVrRKVd51LXYTL9vet3Lxz1GKqI4NNvNG5tK+x7kJa0zAOnUQPDms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=Pj2pRZXh; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=ViNfvyvU; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="Pj2pRZXh";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ViNfvyvU"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69FAPdfU4100193
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=; b=Pj2pRZXhZDHAO6o2
	1L0M/W8QrYfyPW/n8w/EwEIrtBLG5biGjdFyOSRjGVKzAQLzU+F/AjpU7syRPgP1
	aAHX8ynWAVeDtyyaV3Aab4KcrYC00QC+e4x2Jhl0uE1X2K8KFEM5coSJn+vzaLKb
	8aYBGUEW706t6LjZM/A8CZITR+le8OXM9a0HRtbm1n1mOzfHX2BTiVds+txQVcVJ
	W8+Ajh5uA1RAIBdxmstYNh63jbCIfH7TX3Um0hxjFv5KKD/ZmukIpQdkIrlVdQm+
	eyAwD/grVieLjnhedaYd0Or4Pe5hR5Wm71R5AomlTlE0TBLvrIjvAMghYRmXH26t
	xCTzow==
Received: from mail-ua1-f69.google.com (mail-ua1-f69.google.com [209.85.222.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4haw2r90rg-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 14:46:53 +0000 (GMT)
Received: by mail-ua1-f69.google.com with SMTP id a1e0cc1a2514c-99062be02ddso321246241.3
        for <driver-core@lists.linux.dev>; Thu, 15 Oct 2026 07:46:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792075613; x=1792680413; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=;
        b=ViNfvyvUK8yDiS1Iy7NhVbwn/Ch1P1JYkTC8ny27kxKVqOVd7BsNUj2bjxIIqv8EfY
         pD+xCumyZUdxuq6tNarngvdTqHT5Bpzbj4S6w8FERbegY+HsV52mApuvLdbuwAU0waZ+
         pzFkS4FtS3cELQ8HdyEIAx3jB6d0vSgMjNSTJAxijb+uz7Gisv3iTmPsZnGkfjWIGvcp
         wukVZJWPgJCIHIingHdgLUD5MMR0PYiBf//M3GzmKZdyglD1am/mGiFSXRpwOlYjuGzx
         HmE9M0qy2wj8HAJumfbtsl6nC9Jyp63/9IkMTixY1poC5B78e0FgFCEDtTW2Ic6lMRnF
         JmcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792075613; x=1792680413;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G/BnLC9IlXI4LO5c2UlLKBTCYcBIOSWeobZN8MtWNZ8=;
        b=Y+NKI9Z+vIpSXEVra4CMpV+VLVAFS8W5khj8XUvhbGc1PsN1trcmXkjqRcJ1oBUO8+
         S+twhmxRBfoED/kulEy75Eb7aBzUh3T4i9I/xr5vdGQQ4k6GfQVyc/KB3dT/ugm2gpRT
         f7hVwueOJmgllXOQ+/JPVSG3fhQpWkfKlDuXQcI9Nu6+ZofTX98cRdTkSRQpy22BdmnX
         yBLCKDEabuCYxlITERGjYmGeqh0lT0qqt/EhF+676THzKoTB/PGfMlPd2uNzGEthVO4K
         T5xjtFPKz5+q1jvsRuwS8Wclc7IncNEwyZ6QocgtBKA3irONvRaJ7BdGUcj7u1LwLHiZ
         QzwA==
X-Gm-Message-State: AFq9FYLCnu36BGISLac/8hbWrFdbCYNd7/+53X7bz5eqbcAd8+YETGZc
	/ayMJdQNRBmPOFZZUI7+m/0Kf8dYHC44pJeQWIO+SnLdiVQ/prbibyGEwuJ/oozVGzElN3RtUzV
	HeUsu0zfmlyM/HXLwLDxoRx2QNvLi6d5Js4eIfG8Ijet4ST4hYCVRYHR1d5X/ItXzXw==
X-Gm-Gg: AYBFou2rWI0qtqvBDGR5fQi0hqAQHotVThV/TyYRi0ugBE/5N49RC4skWX7r75Ia3nX
	D66oEWDRbBlLcGBrHzZcN88oJF5Z9HzfqZFgoYfl5o1SL216CAbtr1CXszLyDNdXEWy/jGVivIV
	GzVqPjgRhioCq7BYYO8RLrQNkhNF0JRBzlQLdYvBOo4ALDZVuVXhniJY3KWDn9zJr2Gn3TcHU1I
	VvZSMYP8t/tzDbIffNk4YyRlj22QjTF7xIzYwz0xOJUQp7eXDq1YIuzug4guOTLjUU/8O3qe5wJ
	pFlEvi3XsiU8OEJnFFKH/zOGwdmwrtEdKqqc9jEPrSioam394lgBUf8oDY94Y6km95qE1GKAlgt
	Cdj07krW8hVwV7C6jqFeSv1U4y3Lu
X-Received: by 2002:a05:6122:32c4:b0:5e9:7458:9bb2 with SMTP id 71dfb90a1353d-5e97458aed4mr1657870e0c.5.1792075611135;
        Thu, 15 Oct 2026 07:46:51 -0700 (PDT)
X-Received: by 2002:a05:6122:32c4:b0:5e9:7458:9bb2 with SMTP id 71dfb90a1353d-5e97458aed4mr1657805e0c.5.1792075610187;
        Thu, 15 Oct 2026 07:46:50 -0700 (PDT)
Received: from brgl-qcom.local ([2a01:cb1d:dc:7e00:8916:7b9b:97a2:6c96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a1bd9b8ebdsm86840625e9.10.2026.10.15.07.46.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Oct 2026 07:46:49 -0700 (PDT)
From: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Date: Thu, 15 Oct 2026 16:46:24 +0200
Subject: [PATCH 3/3] software node: fix unbalanced reference counting
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261015-swnode-dev-notify-balance-v1-3-9e7537bd2869@oss.qualcomm.com>
References: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
In-Reply-To: <20261015-swnode-dev-notify-balance-v1-0-9e7537bd2869@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Daniel Scally <djrscally@gmail.com>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Sakari Ailus <sakari.ailus@linux.intel.com>,
        Eduardo Ruiz Duarte <toorandom@gmail.com>,
        Bartosz Golaszewski <brgl@kernel.org>
Cc: driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
        linux-acpi@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>,
        stable@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1783;
 i=bartosz.golaszewski@oss.qualcomm.com; h=from:subject:message-id;
 bh=b5psEhGu33J6XAeJBkiV8PWWEXQuiHu7lH/f7ufztzM=;
 b=owEBbQKS/ZANAwAKAQWdLsv/NoTDAcsmYgBq0OdQPjTd4GxgYuJMtA5lOtb09Ol7UVKoKR4x/
 2YVbc0FKBCJAjMEAAEKAB0WIQSR5RMt5bVGHXuiZfwFnS7L/zaEwwUCatDnUAAKCRAFnS7L/zaE
 w6VxD/9BJiZbpWvTi5865mCNX2ReKRoFB0ADV5QZrYpCJpT5UiUolC9ZnSkJXQ5Jx1SkWXjkQYc
 TJdmeHFxa14DI5LD5CeVMLKuRayuepHi63Yv1/x4AGmKMWGLXiLW3sSjKnHzGy1Npk05hR7UXeD
 uA9ymDAhDBqtEr5pylUu6zgX4xcvcjL60pJ6MGulg/9OCGEoLFS2b8OqfaStyuV2CHDM4OMogUU
 /+a3wCpU6p2D2AflwMBlwWSBJxRs+0o5vBhlPoPomvoY3zzZFo6CQN50DI3uuthPJInedp6ur/9
 5/NmlvCDKpfjyRfb+m0wFcDVle25Dtj+PAg/aYYjGrAAtFS+CdETUQYwybTHLHlMahIohyQ3bsL
 d5SFkTxBsWDwR0iXwE4PqoNdx9A+N/2OCTU6KD+ewUMDj6J+PMJhClEeQlKwDR9DzQEbl42Qend
 0p5pa96qL/lCSttyucBVHmtc06pFpCfGmrm0sA9A4ikWWgQhHkzkCGLfDHhKIexD8gIiikkW9QB
 JHoFqHwyZeCau5ca8i1THq0mKhuXmZDbNJC7y4+L2EmJHyG1MJlmePkNEFf6SqASoLutPA5JcFb
 wJtVAHMUhtngb0fE2YbyQHukrq5C2/u5Q15c04p+ZMzX54k1H01S+8wyuudbreP1ZaHebLdKnME
 o3hg5gIDuarpSfw==
X-Developer-Key: i=bartosz.golaszewski@oss.qualcomm.com; a=openpgp;
 fpr=169DEB6C0BC3C46013D2C79F11A72EA01471D772
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX/RejN0VgB0LX
 tkKE73aNIVTwhvmruIg+M5ZmvHE3qElscUHYXhLAI58r0s3L/g3t4yg8pEek/5aakGS6KD+lAcy
 lxIVrgKrex9icJ3ASLUzAZdkjbGetjU=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDE1MDA1OCBTYWx0ZWRfX/wbO8XqZpJDU
 lh+l8xjPgPrLW75BtqFVEyOKfMOxOTCYPP7Q4tHYlODo6IpX5eEY0k0f9Z6YLfsscEzT/sqMOwP
 r4HkiXb+my7xXWQlIUOpF1CO6+AVrsFLnJjjRWmJMgQdN50u+qkYz4YfLf0jdsA0wgzz+7P7Ysy
 pn+a8+zv9zTo9JM3Rjm+hRydBOQ/2BvcAJSKGNfItEo24CCnSR/PvjonhbF3GtQxYXIVjRZO71q
 ATzLXLBP9tEVZelSvk7KHIuyr+YMMYW8mUV6Uo1B4YzRSRwhW8lek7dxz8OSf6et37WzhPcsgdP
 2zctD2123vgj2ss9bKNWln8sLh29S68vHNVECZ9NlF8KWd3ebx6S5r1SB/g6zJ8r7PNaLVCNals
 RVOh76oKCUnXKs9EeIk+ljKcb7Npgaeg2Q4vTm2Be0ky3HmPGmmH2pECUmWydLiNkRFm55przcW
 4PWJ3+LaY9lNim0EEpQ==
X-Authority-Analysis: v=2.4 cv=BNMmP1QG c=1 sm=1 tr=0 ts=6ad0e75d cx=c_pps
 a=UbhLPJ621ZpgOD2l3yZY1w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22 a=VwQbUJbxAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=HsDmPXzSDgUE5-xNsXYA:9 a=QEXdDO2ut3YA:10
 a=TOPH6uDL9cOC6tEoww4z:22
X-Proofpoint-GUID: YDPIMuGm12mGmYb6T6ge8HRJb7FKZrkw
X-Proofpoint-ORIG-GUID: YDPIMuGm12mGmYb6T6ge8HRJb7FKZrkw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-14_01,2026-10-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610080000 definitions=main-2610150058

software_node_notify() takes a reference to the device's software node.
software_node_notify_remove() drops it unconditionally. A software node
attached with set_secondary_fwnode() after the device was registered
never gets it reference count increased but it gets decreased in
software_node_notify_remove() all the same causing an underflow and a
use-after-free. Use the new device flag to mark a device that needs the
reference to its software node decreased on device_del() and do it
conditionally in software_node_notify_remove().

Cc: stable@vger.kernel.org
Fixes: 384f5a857bae ("software nodes: Split software_node_notify()")
Reported-by: Eduardo Ruiz Duarte <toorandom@gmail.com>
Closes: https://lore.kernel.org/all/20261011131518.48838-1-toorandom@gmail.com/
Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
---
 drivers/base/swnode.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index 84a77ffa3dc4bbcca62bbe67c3390693500b01ea..9207d7f96f20f8cfaff2a4eb8915609c499cce24 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -1176,6 +1176,8 @@ void software_node_notify(struct device *dev)
 		swnode->fwnode.dev = dev;
 
 	swnode_get(swnode);
+	dev_set_swnode_notified(dev);
+
 	ret = sysfs_create_link(&dev->kobj, &swnode->kobj, "software_node");
 	if (ret)
 		return;
@@ -1206,7 +1208,8 @@ void software_node_notify_remove(struct device *dev)
 	if (!device_match_fwnode(dev, &swnode->fwnode) && swnode->fwnode.dev == dev)
 		swnode->fwnode.dev = NULL;
 
-	swnode_put(swnode);
+	if (dev_test_and_clear_swnode_notified(dev))
+		swnode_put(swnode);
 
 	if (swnode->managed) {
 		set_secondary_fwnode(dev, NULL);

-- 
2.47.3

