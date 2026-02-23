Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641C34A785
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771831670; cv=none; b=aHAIL6yMO/SSzJEzP3jJ3PcWy6ON3ueToOwOZQQTy7+alztw43Tr/3r6KrQsIDTjlbEateLcEcbYWWDLRff0N+ehu79mV123wpLRVf1vODTQrSZU+ZcwZh3S0K3y8mqcQYk860hwJ9NPUCzLE+WLmv35m2vR2lBsu7s9qmEqh8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771831670; c=relaxed/simple;
	bh=S/iCJqcIsf6jSjmWoog3Z0RGxa/CywDCilklRJJyfQ8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rs8+EYXodRv7fBWnHSmuA157mpf4gl3l6nEV+aZ7l7JBgqJZDDeQf4DpEIhq95OSNDWE1pr5QHITn4K//QSVrAV6CNW/ExsAGRt7xwFbFp/5X1UXfDzQ9TxGS9ptz7ox5iUCRyKWTQJgNJVNoxpcMG87Es6EHOwoaDSRDSaZbAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=IPItmvQe; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DgcMPaTO; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="IPItmvQe";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DgcMPaTO"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61N6WSxH643687
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	W2fzDSwRwHz+xfG1K3EDcnND32iTxMHvxjY9VgqhwwU=; b=IPItmvQeYRgcZ6St
	cSFsWNSei9nDwbD0zwAoGiJ/+EN90CsBogIHT5No6AqFSdZ01cXKrLAYGFyfeEkW
	Msujc0HUxPmIL6pesdwMUAL7DFnW7qxTl1iYaViJage1OxE4uzJ6Xm2H5SQ7TCwJ
	LLzTFI4ji+ajN/sQZB1EHSaTVi9uduE+aN324d/J+IhQlHlAVVjqcIYuCr3yL7AU
	kGivsEcIaDhlGm2P47o7o0zhZv2A66P9MMXdeNtGlz3asMpf/4ZdA5GMeOGetK4U
	KfTBuQgwmJcC4PmF2S/pUjbqp5Mgyl8aRsn6EMOdoxmckoZDZ9nUY8An2KqNSoIu
	Q7aQlg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com [209.85.222.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cf5vukq39-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 23 Feb 2026 07:27:47 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id af79cd13be357-8cb3fae6f60so5290557085a.1
        for <driver-core@lists.linux.dev>; Sun, 22 Feb 2026 23:27:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1771831667; x=1772436467; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=W2fzDSwRwHz+xfG1K3EDcnND32iTxMHvxjY9VgqhwwU=;
        b=DgcMPaTOkNkH+WVi3ogKEOSZM7IAqjGN4YhFgKfiJVxZJEP/Kaww8A+p3aEwYf2pT/
         yS4YD8zY8Vd3QrMePjqmgTV1gv980AtWD+aWikuR3JH/xSHbnDDlZczFjlOhBZEwKzab
         oauJ8YTYyZCNwAYx60zQ+nQ6JlzX5MSUeP7uMWivrLnDfyOELYoEQ7lXKeJYUtji/pLg
         Ia4iZsGq56VgsigrrPQyqZVfYTz1TrOKUHqTpkXWN/5aGLFd+fsz1qAgfGoXCsrWwrhm
         hdv9i1WxUVACWOs+tgMuTi1u0HH4qqiZC1sK4OGLRMbhJ6iByahFjs1fhF7JE5lvshD5
         nh/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771831667; x=1772436467;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=W2fzDSwRwHz+xfG1K3EDcnND32iTxMHvxjY9VgqhwwU=;
        b=U0I6KXzCUWbU+6vDsPNy0lfcOjdPQBMwBtT3rCS+4qZGWHgT2asF/Abol9B3k4Sgt0
         BDBRlZNe8Nd3Zkvpz3+6b1fxiO0wRC2QWWYBN2C9rzEfFzA8rTXyeQ87WPxl1SW8+Sgl
         9y7+H96fwMfrwfrbxg4nOnGGZ1tx7hl3zoGpwd3P16L4pnQoOvHqZDQc8IWQoGJiWUw0
         zUFllKhCPutpOvFAlTDEH980uSsywbzoCVTyfuYoiP9AzgZ1C+MGGWSHwPQtzokpHDw4
         WjDFOIkj0anwvpkVH4W9Gi8oZ7VFhawlYZ28kWnd39jX/hcEIfb+DzIEL3lU3wxIdV3q
         IYBA==
X-Gm-Message-State: AOJu0Yy+Ii+oW4ZgL4+quZETdHcNUHxqlx2/LMGa5/ZV6py5ArQ3FqKA
	ew3j7Tvfmnga5lsDzkcGzJyKE+sr1jXV4mk+FYQfeNfCeiAKBGlitUjtLF7goE6/mBisriWWR7W
	F3OjXI+lCO0x5cMBcSI0nYwmaVs396W22fAvk6yXeG/cZtD0qnGpugkzcIxFiutHMQg==
X-Gm-Gg: AZuq6aIWiDfuwFW4nr/+k2jacvIy2Reb0K4QwvlpnPIOE2N26XPdXBRNk9s/mNk9cPn
	dLd5Olr+8RJ/hTFqmQIvX3G0lcIK4OaLVDzdPnERaqDmYVJ9Yhs2ND/g4TcJcEyorp76vzAdWl/
	bTOMF5hbj1058R8liDstAu9YA1S7haaO4bpngDCO6am0UzeQoIOTnZ5ywptNFWq7zz2zokf8Dn5
	HSvYuHmlYibUTuYAXHoOzhscoMPVr5ZAtZyHlBZ3gR2uumSLRsdz8m/UYuDVKzqL21BIKVzY5f/
	XXblXeO98huFMtkCm5CrdoqCDpQTtFaR7KsDieX1dl+qKFbRZqLEaj6oMwrXFLx3BggBu3z54Gz
	P28+lnfzwDx8eWsjkGnUIIJ+qwTzc+cAA8zjw/PVfcvxIJQ==
X-Received: by 2002:a05:620a:46a8:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cb7be3b839mr1530637385a.6.1771831667093;
        Sun, 22 Feb 2026 23:27:47 -0800 (PST)
X-Received: by 2002:a05:620a:46a8:b0:8c7:79d:f91b with SMTP id af79cd13be357-8cb7be3b839mr1530635385a.6.1771831666656;
        Sun, 22 Feb 2026 23:27:46 -0800 (PST)
Received: from [127.0.1.1] ([178.197.223.140])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970bf9ff5sm18550286f8f.4.2026.02.22.23.27.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:27:46 -0800 (PST)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Date: Mon, 23 Feb 2026 08:27:29 +0100
Subject: [PATCH 1/9] workqueue: devres: Add device-managed allocate
 workqueue
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260223-workqueue-devm-v1-1-10b3a6087586@oss.qualcomm.com>
References: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
In-Reply-To: <20260223-workqueue-devm-v1-0-10b3a6087586@oss.qualcomm.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>, Tejun Heo <tj@kernel.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Tobias Schrammm <t.schramm@manjaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
        Dzmitry Sankouski <dsankouski@gmail.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
        Benson Leung <bleung@chromium.org>, Tzung-Bi Shih <tzungbi@kernel.org>
Cc: driver-core@lists.linux.dev, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Sebastian Reichel <sebastian.reichel@collabora.com>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, chrome-platform@lists.linux.dev,
        Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6407;
 i=krzysztof.kozlowski@oss.qualcomm.com; h=from:subject:message-id;
 bh=S/iCJqcIsf6jSjmWoog3Z0RGxa/CywDCilklRJJyfQ8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBpnAFm0Tv6ZFgGsT5DcytxW+0gXkvsl5c953wDR
 5lE547LmoKJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaZwBZgAKCRDBN2bmhouD
 1y+VD/9A1ukGl2lbgMZJ7jWzPKBdDezAk1X7RP6OkAEE5aR04FHlqMvjH01rHA5671wAZ/XlLXH
 u0mxgS7a+WxdX+brjZ/EJH3CDYDY1PnBzmm51D9Jh4q2HdSXmDRte5LGtqpE30n8WtWl7eQScl0
 6yByEsaNIgXP4Jdo9Guy25J0mBhZDoVIOWNvRa/bzLXSc++UITkn3XMiGZVh9FejwX+49SFX2Wp
 PcCjEAHZY/dHyK5FjPp/eHzvfgoJDPZ2HkN+C6afRgC/QjCwzPs3CWJiGPZ7fk5HRy3w2TRmQBW
 sBWYAUH+6iQjfgbXKOXx3NLx4aVNmkkQADgy0YbW4tOv0w0I2/lAJZQ32G6C8CEiF14ftblmZ2y
 eCYlYOFnGeCe3wsA2kW2RMlXpRtCM7uhKoZXn9PDKlhFBb/n75UwN49CS19TdoUTzEUgGSCs7yl
 5f0z0lerQLkMBn/9DW446KRVIRSm6qGw2rl1MSK/8LVr2A6xub9WyJX2QIFOqmF1Q2Y6b7z9Z4l
 3ByK6rZe559yCZ69+nPTd0sARnancLikTI6X+im7xlOli+GWtukN1N/X8bVj01O7AVFKFCz7Lbh
 LiP1iXGGm++dc94x5/xy1nPudlf+JCH6nz60rVbtJstGSncuw2Yszo+sj1P/cgsDbZQccWR9u8h
 zIR0pmJMqRGoIdw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
X-Authority-Analysis: v=2.4 cv=AL4GpdX7 c=1 sm=1 tr=0 ts=699c0173 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=6nO30s3o7FuWeffXwhKHTA==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=Z6KGZMJaPoknz67Z6hIA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: tEsOT7ILQUDzp2ZWi3b40emsrIxDBZTf
X-Proofpoint-ORIG-GUID: tEsOT7ILQUDzp2ZWi3b40emsrIxDBZTf
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjIzMDA2NCBTYWx0ZWRfX4GdKQ40Z0osQ
 9fO2eBpl6QU3eJMVsAzLeCc5ruZfWMEFC0UU/smL5qacDnfsJri/AzblQCOA4DAKDT/jz4EC2BT
 4nb6dp7OcgvEfWmo5ZaEnYTPs4q/msbf8sdPn/IfoyfM7fjck4VRo/0MgujJweyjTPxRqyvGfP7
 DMkV+PEkvhKqkRmuMQ5YUzdF7bL/yC+LpAEpm7kzlAfkgaam/EHt5tZywss+LPCf3chhHEFb+NS
 Stz6rjFbtFTNm2b38IkV6pH2rEy6PHIRw5EgKj2065gieUB5PDZ2C2kzrSIvwysflZGpfWBYcX+
 th3fzmOUUKPZ5Vx347F0V0LWCaaIzoI77qIh2GH7wfcYyJfXE4j10Hl5FvhxkcwVISSIMOGKDTv
 pYdFhsVJQHNL5jCi6ybSYVI6aTR3d8re8Q7niMJRVCUeEICtdq0rRqrF03R4ghUJ+NjLgObxwGn
 6FCoHkRpp8BcjX10ICw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-23_01,2026-02-20_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 malwarescore=0 bulkscore=0 impostorscore=0 phishscore=0
 clxscore=1011 suspectscore=0 priorityscore=1501 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2602230064

Add a Resource-managed version of alloc_workqueue() to fix common
problem of drivers mixing devm() calls with destroy_workqueue.  Such
naive and discouraged driver approach leads to difficult to debug bugs
when the driver:

1. Allocates workqueue in standard way and destroys it in driver
   remove() callback,
2. Sets work struct with devm_work_autocancel(),
3. Registers interrupt handler with devm_request_threaded_irq().

Which leads to following unbind/removal path:

1. destroy_workqueue() via driver remove(),
   Any interrupt coming now would still execute the interrupt handler,
   which queues work on destroyed workqueue.
2. devm_irq_release(),
3. devm_work_drop() -> cancel_work_sync() on destroyed workqueue.

devm_alloc_workqueue() has two benefits:
1. Solves above problem of mix-and-match devres and non-devres code in
   driver,
2. Simplify any sane drivers which were correctly using
   alloc_workqueue() + devm_add_action_or_reset().

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

All further patches depend on this one.
---
 Documentation/driver-api/driver-model/devres.rst |  7 ++++++
 include/linux/workqueue.h                        | 32 ++++++++++++++++++++++++
 kernel/workqueue.c                               | 32 ++++++++++++++++++++++++
 3 files changed, 71 insertions(+)

diff --git a/Documentation/driver-api/driver-model/devres.rst b/Documentation/driver-api/driver-model/devres.rst
index 7d2b897d66fa..dfc1e85ebfaa 100644
--- a/Documentation/driver-api/driver-model/devres.rst
+++ b/Documentation/driver-api/driver-model/devres.rst
@@ -464,3 +464,10 @@ SPI
 
 WATCHDOG
   devm_watchdog_register_device()
+
+WORKQUEUE
+  devm_alloc_workqueue()
+  devm_alloc_ordered_workqueue()
+  devm_create_workqueue()
+  devm_create_freezable_workqueue()
+  devm_create_singlethread_workqueue()
diff --git a/include/linux/workqueue.h b/include/linux/workqueue.h
index a4749f56398f..583b0c4bd55c 100644
--- a/include/linux/workqueue.h
+++ b/include/linux/workqueue.h
@@ -512,6 +512,26 @@ __printf(1, 4) struct workqueue_struct *
 alloc_workqueue_noprof(const char *fmt, unsigned int flags, int max_active, ...);
 #define alloc_workqueue(...)	alloc_hooks(alloc_workqueue_noprof(__VA_ARGS__))
 
+/**
+ * devm_alloc_workqueue - Resource-managed allocate a workqueue
+ * @dev: Device to allocate workqueue for
+ * @fmt: printf format for the name of the workqueue
+ * @flags: WQ_* flags
+ * @max_active: max in-flight work items, 0 for default
+ * @...: args for @fmt
+ *
+ * Resource managed workqueue, see alloc_workqueue() for details.
+ *
+ * The workqueue will be automatically destroyed on driver detach.  Typically
+ * this should be used in drivers already relying on devm interafaces.
+ *
+ * RETURNS:
+ * Pointer to the allocated workqueue on success, %NULL on failure.
+ */
+__printf(2, 5) struct workqueue_struct *
+devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int flags,
+		     int max_active, ...);
+
 #ifdef CONFIG_LOCKDEP
 /**
  * alloc_workqueue_lockdep_map - allocate a workqueue with user-defined lockdep_map
@@ -568,19 +588,31 @@ alloc_workqueue_lockdep_map(const char *fmt, unsigned int flags, int max_active,
  */
 #define alloc_ordered_workqueue(fmt, flags, args...)			\
 	alloc_workqueue(fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
+#define devm_alloc_ordered_workqueue(dev, fmt, flags, args...)		\
+	devm_alloc_workqueue(dev, fmt, WQ_UNBOUND | __WQ_ORDERED | (flags), 1, ##args)
 
 #define create_workqueue(name)						\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM | WQ_PERCPU, 1, (name))
+#define devm_create_workqueue(dev, name)				\
+	devm_alloc_workqueue(dev, "%s", __WQ_LEGACY | WQ_MEM_RECLAIM | WQ_PERCPU, 1, (name))
+
 #define create_freezable_workqueue(name)				\
 	alloc_workqueue("%s", __WQ_LEGACY | WQ_FREEZABLE | WQ_UNBOUND |	\
 			WQ_MEM_RECLAIM, 1, (name))
+#define devm_create_freezable_workqueue(dev, name)			\
+	devm_alloc_workqueue(dev, "%s", __WQ_LEGACY | WQ_FREEZABLE | WQ_UNBOUND |	\
+			     WQ_MEM_RECLAIM, 1, (name))
+
 #define create_singlethread_workqueue(name)				\
 	alloc_ordered_workqueue("%s", __WQ_LEGACY | WQ_MEM_RECLAIM, name)
+#define devm_create_singlethread_workqueue(dev, name)			\
+	devm_alloc_ordered_workqueue(dev, "%s", __WQ_LEGACY | WQ_MEM_RECLAIM, name)
 
 #define from_work(var, callback_work, work_fieldname)	\
 	container_of(callback_work, typeof(*var), work_fieldname)
 
 extern void destroy_workqueue(struct workqueue_struct *wq);
+extern void devm_destroy_workqueue(struct device *dev, void *res);
 
 struct workqueue_attrs *alloc_workqueue_attrs_noprof(void);
 #define alloc_workqueue_attrs(...)	alloc_hooks(alloc_workqueue_attrs_noprof(__VA_ARGS__))
diff --git a/kernel/workqueue.c b/kernel/workqueue.c
index 72a8b64188b3..fd840c46ba55 100644
--- a/kernel/workqueue.c
+++ b/kernel/workqueue.c
@@ -41,6 +41,7 @@
 #include <linux/mempolicy.h>
 #include <linux/freezer.h>
 #include <linux/debug_locks.h>
+#include <linux/device/devres.h>
 #include <linux/lockdep.h>
 #include <linux/idr.h>
 #include <linux/jhash.h>
@@ -5895,6 +5896,31 @@ struct workqueue_struct *alloc_workqueue_noprof(const char *fmt,
 }
 EXPORT_SYMBOL_GPL(alloc_workqueue_noprof);
 
+__printf(2, 5) struct workqueue_struct *
+devm_alloc_workqueue(struct device *dev, const char *fmt, unsigned int flags,
+		     int max_active, ...)
+{
+	struct workqueue_struct **ptr, *wq;
+	va_list args;
+
+	ptr = devres_alloc(devm_destroy_workqueue, sizeof(*ptr), GFP_KERNEL);
+	if (!ptr)
+		return NULL;
+
+	va_start(args, max_active);
+	wq = alloc_workqueue(fmt, flags, max_active, args);
+	va_end(args);
+	if (wq) {
+		*ptr = wq;
+		devres_add(dev, ptr);
+	} else {
+		devres_free(ptr);
+	}
+
+	return wq;
+}
+EXPORT_SYMBOL_GPL(devm_alloc_workqueue);
+
 #ifdef CONFIG_LOCKDEP
 __printf(1, 5)
 struct workqueue_struct *
@@ -6025,6 +6051,12 @@ void destroy_workqueue(struct workqueue_struct *wq)
 }
 EXPORT_SYMBOL_GPL(destroy_workqueue);
 
+void devm_destroy_workqueue(struct device *dev, void *res)
+{
+	destroy_workqueue(*(struct workqueue_struct **)res);
+}
+EXPORT_SYMBOL_GPL(devm_destroy_workqueue);
+
 /**
  * workqueue_set_max_active - adjust max_active of a workqueue
  * @wq: target workqueue

-- 
2.51.0

