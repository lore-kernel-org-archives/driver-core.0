Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630825;
	b=wup3cK5JVio2Rm+6F2sxivd2J24UNgJnjKAn4p28vkDGbzk1tqDf/TKQD++50lJergSv
	 omIkICIOpaTaCOWBBt7Or6+pSuyZJZeb3xVOK4qI7xiAwbvWI6KbOdSO/imor+BK5dvl4
	 GU3e01XbHwcvSa/fofVox4G9gUJvW4uF+PmTRVgJPT1YpSAqzeaiHb7IKiUT7bCNE+zl9
	 3YFwyUEm4n7MRZJSoR5x7NCqo2K4geiRNDwiA29axQpQX98tiSgDOrCGo2teJEi5/2Px2
	 mrQIJdGnS/NLWSNvKAz1JpyprdZy3RhURBXRp3ziCrotWAsxI549zGW4yIdUz1rU3hQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=;
	b=ft9bbM3+ibVv4Folw9rhhm0GJIDSiHWIc64am8nBi4jdRlSmo0G5bt7QmAIzPsLX/YmF
	 PMuq5ETRQ/rTFPUSxAr+JFrZkAVJrMvq4GXRGDuIl9zUYAhU7VN6mw+jnqxsGKtZMbNad
	 7Im9m2EDRU5ZAoV7hIgjahWffwmhygC8ZRAD3f4OlJxWBY4Qm5xF2Q1uMtR9MmoJOac82
	 /+YcGPMEep4mbv7DVpXBDfQ69hkULiXtdw85Oikv+zHkDz0j5Na311oELw98rJfJiU8kJ
	 NcBDvrVSQuMYkLuAbaZPZ+YiG5yvc8v1RdHHZKxTLd8j57Gfm8y258Q1vlQ6nCwc6KQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b="nYZSh/MJ";
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7spkgA;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF36960A6F57
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 14:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BF36960A6F57
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=nYZSh/MJ;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=IN7spkgA
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpRsW3715882
	for <driver-core@lists.linux.dev>; Mon, 2 Nov 2026 14:47:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=; b=nYZSh/MJpImfDoLt
	fimkIqi99tBaoECD0BbvXHKcK6HLzFQWp0pVl1FQpXnWVc404mzEpvp4rDARHmIj
	3XoSZ2cJygs5hQxqSmOeQpEfuu48+FgnCBGeXDjhoCQ6xKLOrCtXtYqXEB3bPfZu
	X8ZYTc26UQ7V9bFxBYbK7CrAdsIfejidJQPH25nB1OokmK27Lv/hJVenvv1VNOup
	9mT/bZ0gHNHM8ZiodW+qf1gc9MWeditQoIjstT77gKb3YVmE2DErAJoFMQw2qBBc
	kdO4/3UrFoiI1k3YPFwGEAKDR//xHaxPEIXMT42YOCNU942j23DwJwi2WpK6nQWi
	ZMay8w==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com [209.85.217.69])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpka62acd-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 14:47:03 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id ada2fe7eead31-7cc10da5ad4so744704137.2
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630823; x=1794235623; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=;
        b=IN7spkgAcB/C2PsabLrS4fTAexPpfPKB330K6b0mIgiCMG0XQwYK4l7P1RBsA2IZfs
         efRDrloGFBP/tM/RNNsfgad15vVmVX7ybQ1xYjZkO7uvJU3p1/dDjxggt4eNJiAvT7He
         RxO7tgecPND9L4ay2vpB7SDXF64dQQdvfQ3JRoDrePgXzUDW8ywTlht110WJbvl+j91i
         9jJjJskAuCQsEYLJBHnmrrp80ssZBSQEZ5D/p8VcBCwlVfby4bJpaWuoGkxRgUwZRmIB
         j1VbqKfDMMclNy5mXcYeehSslhsyulazrbnJ1eM5TP6qxxRvBAGC5GULmNEU5XHbwbBe
         rKNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630823; x=1794235623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2qrJ3KtJ0cuR3JwG4sVYGEim2RKQKNEp6dMT2f4JvhQ=;
        b=pN6env+x3kON3ZBSsePb+2YvQ0wd9NmmmpeCOB6mrbjY+BCiE2tvgSWmxIl23ClXD2
         mRuYAvBdI7uvcEsS23+qydMlY12B1Z5KE3H3qYHgdyf+IL+H/TqdDWEJ319WZGKq9z9j
         kJm4IEaYsaBIOSu0NCmoNO0Tp4lCC6ALoy7Wfy014CTMNpNlT1jyMFaSdP3aRTnBrtnl
         8kdBQf7aku3VwA5+0vCBAGsun4Qq10gZ3/owthzOgibqaIf3Lc2SSP3ao0LTXEq5jJvd
         xGZS0uN+Ap+8DazoXiFXCLfAxYclcolKnIP3SGYEzFoqO4bO+hHLCBOiJUVFESDCyyDq
         /uwQ==
X-Forwarded-Encrypted: i=1; AKwUvBw3baDcPGqmUMYenfcX1V+JR/UpZA0IGnR5MP7UKm1HiJ7Fd18F5XNgHxjFAGs5QmWAKgpdqonevs434w==@lists.linux.dev
X-Gm-Message-State: APuU4Z+CuOR2Sztsfu9X0MLwiLZJmKjTHfVkxoBE0OA3DDZKZ6Z2Dgji
	a8nxllcmQEowLOiJq8pYUwHc99dtJkVUh8wKQoboVq14z7rVuRfByz0SyzWwy0yXXmvkc1tpTW0
	z3nzSkCy4A1nxErqPoYH6HEsbdDCggxluhRBxV8zvv4Z7dzagTiDk833LAyBQRbXsUg==
X-Gm-Gg: AYBFou3OHrXWBtr/C7WTpfbMbtfqSjNBNYTJdIYcG3aXJrztDhQcfLCwVmodpHifaiU
	H/PabYbRa4M2q8Y/B7c43RZcj/bKbm1S8yGidKE+Wl5zlP1ES2GXsq0z6GZitV6ZQXb7I+nEdmU
	RQS9vgMd41GxRsjIzRhccnX2V+9IPzL6GxduCo54StQla+0PqJJAQevW59F59Gwa+wVl+DAdSo4
	Nrxzua8fB66S/6jUTZpjIFJaOKC0og5HJk6UqNoFO+/SagYLSuTOlSYbjfqasc3ngIiCLAgyrUe
	VTeZHQ/FKgQlZIqQxky8DOJofTFfLgE7XUV+ktXszr6LGNUzq1Fq60/pijlpEeXpqoHg/0fpujj
	V1BgFsQGS9DsaDWTYC8jnEerDv42XtBbgacCixzA2ZzXIOQPKWWobc2hI9A==
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr3608533137.3.1793630822548;
        Mon, 02 Nov 2026 06:47:02 -0800 (PST)
X-Received: by 2002:a05:6102:809e:b0:7cc:2152:4f95 with SMTP id ada2fe7eead31-7d0727b11f1mr3608514137.3.1793630821879;
        Mon, 02 Nov 2026 06:47:01 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm4004893f8f.54.2026.11.02.06.47.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:47:01 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:46:51 +0200
Subject: [PATCH 2/2] PM: sleep: Do not arm wakeup IRQs for hibernation
 freeze and quiesce
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Post: <mailto:driver-core@lists.linux.dev>
List-Help: <mailto:driver-core+help@lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
List-Owner: <mailto:driver-core+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261102-b4-pm-sleep-hibernation-fixes-v1-2-51fac96d080d@oss.qualcomm.com>
References: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
In-Reply-To: <20261102-b4-pm-sleep-hibernation-fixes-v1-0-51fac96d080d@oss.qualcomm.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>,
        Bjorn Helgaas <bhelgaas@google.com>, Ulf Hansson <ulfh@kernel.org>
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev, linux-kernel@vger.kernel.org,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2992;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=dmhw+rLh3YLAA0NQErytWkrrn7ttASoaBIZrNZToO5M=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6KJfLC8dxd2kJGunctvD8mTL1bgFM/yemD+25
 uop4+UbEg6JAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiiXwAKCRAbX0TJAJUV
 VlFqEACFoJpTr+nxhgWU8nLWjdloXdv30Zu8UjDTVVI6VhiGDCJN8HDUdxwfeMhXsFpdnIbm6IL
 kkxAjkFUGQ5Ppfj1T/N9zg2PJ2AcgJNLm1J3EP7c29ijV7weV4Bi1u0ppZUihip5RNqsq85xQAi
 MBT+9ZN4aeOFk9Q8pH5jlQTZDa/++MprSuV3BJ8XO0q19IWARVRWRZbWDx/Hi6DZpnSD9gjqXZ+
 kpnilG9KppwnAOXwuE93TPypfVJRlWrs4FcN7HSXadxVUTrvW4JCBE25BVgzzp/zMdAFQdtjIi9
 vWX4jFReWhAJmSwvjDHMwaWC08CX03MaJ4ANLZ8eXcctavIT4O/mk1go/TaBeUS3b0Ku+d6Fxy4
 057eYlCMCLwKu7Athi8RqiRYNVTiX1II+9ipE6RGgqFdVlvlmDmgQZhcFFFy4yDGrEeyHpyoWBl
 Ss4PmzxIqqve3K4jHz/4I5UHI5CbXZcV5ITOQB7xE7e6KVn3c6bLtL9F1U9YbryvWM09pxdspMG
 zAZNLhK5Djh6UkYK6NhLZBkWj3dE432ss99d1KxKPsTf7D2LqUp6vvoAyg2R4tREHAJkEj1khoY
 DTH7rP/357LoMvta+WR1/vts16R/Yab3R/vx+vB/DoCbbf1w53B6BKWCoSU/MDbLP8GuQ2UvcQW
 zQZMEXmB+UsGdKg==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: -XKChhOYUvw5oTjZL7VjpCy7WJrLeyWF
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX6lpN4WVJ302z
 BWJNbUH4tOBUGYrXEoOL8HuGudhonwU4vYlhTtoyt8IxORIWF7mPsoB/XzwNwoJbwHcGPnYWOpe
 CRlO3HBvvJRSiytTWVVPcwnKoqRBuwg=
X-Authority-Analysis: v=2.4 cv=ZbyIpcVA c=1 sm=1 tr=0 ts=6ae8a267 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=YW8Bwjmn6SJj6jUQKWgA:9 a=QEXdDO2ut3YA:10
 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfXwY54MYN4OLUH
 ZIvrnhgW09CiCewqJarDFH9bbhQWXhxAf2QzasZX/TKLQHz5tj+aXIo9s55ySX8ZryvEaA1t7F0
 y2Ne63MtAtXfo6CHVblltfBz6auf64iFJFBEW+ZeHBcv2OTbmCWKQPy2CgvRi0fdMVk/ZiugoXf
 AsaYaYCcEiTjwbMqSzkWBhqvsdWB2uGD/ypR8xRxI99+QyC9/0iqM5TsYW6kvFTHTU04MU3GMCl
 WPjc3sPo11u7SfZu+lzufMhCnfwxWD6A8G/d7//b/2UxgQmJUirAXRu4sqVWeg6NhMgb9h8JGvc
 AacOmho7/b7nhOSh7hvrFqut8ru5Bu/OgiRKi4gLUBWrukT5KDVxsLZaReHfF/dkCwSmmcWmlcY
 9USnd8vFL3DjA/6gKPycc3vHC4kZR2uCR2QGxQE29EigplbG9PaMQnR4Vpaex1lYKEKwQBdjfQw
 6dg3+gxf9/XJC8HV3bQ==
X-Proofpoint-GUID: -XKChhOYUvw5oTjZL7VjpCy7WJrLeyWF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 suspectscore=0 malwarescore=0
 phishscore=0 adultscore=0 clxscore=1015 bulkscore=0 impostorscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610300000
 definitions=main-2611020058

Freezing devices to take a hibernation image and quiescing them before
jumping into one go through the regular noirq suspend path, which arms
the wakeup IRQs of all devices that may wake up the system. A wakeup
IRQ firing then aborts the hibernation or the restore:

  PM: Triggering wakeup from IRQ 180
  Wakeup pending. Abort CPU freeze
  PM: hibernation: Failed to load image, recovering.

On a Qualcomm Glymur CRD this happens on every hibernation and every
restore. The WWAN modem keeps asserting WAKE# once its root port goes
down, after its driver has shut it down for the freeze, and the WAKE#
GPIO of a PCIe port is a dedicated wakeup IRQ with wakeup enabled by
default.

Neither transition is one the system can be woken up from, as nothing
goes to sleep, and Documentation/driver-api/pm/devices.rst already says
that in the freeze_late and freeze_noirq phases a device "should not be
allowed to generate wakeup events". Do not arm the wakeup IRQs for
them, and only disarm them in the noirq resume path if they have been
armed. Wakeup IRQs are still armed for the final transition to sleep,
PM_EVENT_HIBERNATE, and for suspend.

Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/base/power/main.c | 21 +++++++++++++++++++--
 1 file changed, 19 insertions(+), 2 deletions(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 16a1f017051e..34ba0e5941a3 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -949,6 +949,9 @@ static void dpm_noirq_resume_devices(pm_message_t state)
 	trace_suspend_resume(TPS("dpm_resume_noirq"), state.event, false);
 }
 
+/* Whether dpm_suspend_noirq() has armed the wakeup IRQs of devices */
+static bool dpm_wake_irqs_armed;
+
 /**
  * dpm_resume_noirq - Execute "noirq resume" callbacks for all devices.
  * @state: PM transition of the system being carried out.
@@ -961,7 +964,11 @@ void dpm_resume_noirq(pm_message_t state)
 	dpm_noirq_resume_devices(state);
 
 	resume_device_irqs();
-	device_wakeup_disarm_wake_irqs();
+
+	if (dpm_wake_irqs_armed) {
+		device_wakeup_disarm_wake_irqs();
+		dpm_wake_irqs_armed = false;
+	}
 }
 
 static void async_resume_early(void *data, async_cookie_t cookie);
@@ -1685,7 +1692,17 @@ int dpm_suspend_noirq(pm_message_t state)
 {
 	int ret;
 
-	device_wakeup_arm_wake_irqs();
+	/*
+	 * Freezing devices to take a hibernation image, and quiescing them
+	 * before jumping into one, are not transitions the system can be woken
+	 * up from, as nothing goes to sleep. A wakeup IRQ of a device that
+	 * signals for attention once its link goes down, like a PCIe endpoint
+	 * asserting WAKE#, would only abort the hibernation or the restore.
+	 */
+	if (state.event != PM_EVENT_FREEZE && state.event != PM_EVENT_QUIESCE) {
+		device_wakeup_arm_wake_irqs();
+		dpm_wake_irqs_armed = true;
+	}
 	suspend_device_irqs();
 
 	ret = dpm_noirq_suspend_devices(state);

-- 
2.54.0

