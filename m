Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793376596;
	b=cR39fwyR98ybn1AcmjbONkRyJBkZgahA7n+T5MhbE1d+QkXgJH0hOwOI3DCV81sD5TXD
	 KlKkQfHAGXc7JvwOlBcOSaEW1ZS8yer1ryGqTraIl7ugVSe9ZPgBG4bhkq7NJXVQg0nr0
	 TFxH0x+g3wSSI79o/ehwFoFqUaz5OEwAhrE1sAafhgeqmqUv9O6PFbCveQkkUg1ZdbKK+
	 gLwiVKqnD1shBYmBOUFkX/ANLhOtJP5SsWNDKsilAmc84F92AUunQs+MI5qmKbJa+sKh2
	 CHUmnkOviz7GJeRXTawiqi2zkbf4+GEqedtfVfGmG5y02efgwVzTIacS6VcI3gu5HvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793376596;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:X-Mailer:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=1AYa/vYlLDzFz5Cu7GUcbH8FmJ6yEd4e4C14u7b+OtQ=;
	b=v2zn/0ZVWwnICirG6hK0/RHKdREQFfK1RGrOM+prUyQj6OLvMkvkwjX/hP34BAHACezh
	 QsjPE+vgN2H2PHeM8ebJhDSLnqplVNgbpkeghtkf+i/omcuaNocNY5/lUOb1AWDcBAbYz
	 2qoR4EWg7uXY9ujPvrQvbO92muoq0Q7bxcXIzY1/vjF9UrJAr6mq1SXc7YOebNx0FKHk1
	 LrGfZ0w5EQCov35VHuBeLtOhJoVAz47p1SssLKkJenOldzcE6kudyFpvUvkMFj0WSGbWv
	 UK6hMwOISa5CMj7/77vhkfTpxeeMXpuOeNl3pgQy5HqYV+6Twar9Q+FElGv3lYp7wzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ay4KeWRO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuOHU6n9;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46DF9606A321
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 16:09:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46DF9606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Ay4KeWRO;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PuOHU6n9
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERB3U2494580
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 16:09:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=qcppdkim1; bh=1AYa/vYlLDzFz5Cu7GUcbH
	8FmJ6yEd4e4C14u7b+OtQ=; b=Ay4KeWROteb22jNsNnpmqiD9vdwZdIDane//9R
	MRyU9iQCSeI5A4bZuP/skHDNo8pkiXeGYAagPkOt6AdO+zJO44L0H++osXtjnyFK
	fjnOfKdV3GtWSYnY4ZyS83w0NmhETl2/BAWSimvAUAdHRreKE3zjpmLEhadH6A1F
	vyC/uclG0HvyGh1it4rm7H89hautcvNge/65WoPDoYj2/fcvggd3lZrfs9T8lZi+
	wstwkmCX04y0Z9uIRqXN+rVCBes6JPFzkub6jfifEtjuVSWoivOiYWysfrW7ThlN
	VZ5rFoVeiO2HimC7DOfaQnYOpUM3ftb2R+f3kTfPLQ6D5iEg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3y9r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 16:09:54 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7cb225252f4so1393640137.0
        for <driver-core@lists.linux.dev>; Fri, 30 Oct 2026 09:09:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793376594; x=1793981394; darn=lists.linux.dev;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=1AYa/vYlLDzFz5Cu7GUcbH8FmJ6yEd4e4C14u7b+OtQ=;
        b=PuOHU6n9cWepYmfclVKLd+hp2z/+r75moNP0NPi41+QvWidXISNy0+BgrWDscqHNaN
         ZlmKu9dYwJ2nqRN5tLc1XavikYk5JgHvT+IOZqYor/ZTubGLLVbcrCTKQTEz4O6ZyvUq
         vSlY2+ym7r3T3WBMV15t36VWME4MR7dntbfA1RXb4T87oBeNQNEQKilJmIQTvLdjibTX
         8nfPO+VusnxrzZpOcFC9r0JHF600+6gzVNcchUaK4hPm7ZxzpuvfdADXSbymi0aFxvrQ
         EcgF2LL1i5Afam9SInJKxWwXJRo4JrF2FtV0JtUHDLtJ8hd0uTZKKtbwqlgs8jiLY4l4
         eTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793376594; x=1793981394;
        h=cc:to:message-id:content-transfer-encoding:content-type
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=1AYa/vYlLDzFz5Cu7GUcbH8FmJ6yEd4e4C14u7b+OtQ=;
        b=FScc34rW0kQliTFRVhMKQB3GmpaTl9twOGE3CEWpvEjuFEh3w7q+tolvWCfBwLnPud
         +b6VFgYA/aWfsCfL6i/NI1sz5boKZJaJbSJNBD335a6X8Szn+qy59c17uIuxgrnWOz1X
         z3oTfNFiVycNFaWIR9rac+FyApQnA4hgSVJ7tjM8x3pPPbRCO4cLDS2SupmDFeU+X7xX
         sGK0XQ4givAhu+H8cF926J2NVwV/TTK9D2tKVKDmKfVguOMTyRoZJiSc2LVpkDXMCyTn
         3QdNqbo0sIoneqGiFAtRBsF9KYGCl7sLlrw7xOs50EmBNgeUX3KJS0671w3W2zJMWtV8
         WXrg==
X-Forwarded-Encrypted: i=1; AKwUvByXRwc83vDyF1khYSLuox3y366LHp9se4cANIJOU7PTifzw5jN5xpqObV9yCwWBMsUq3/SsfBZxDpXrMw==@lists.linux.dev
X-Gm-Message-State: AFq9FYI1Dj7jmxuWY4v7UeF+bmFlYierumBTqMBfRnXUVjKIG/Nj+Sn3
	OxMKOZ+S0BRBtXtTF/HMUzYgZO+QXdh9YP+V0ORxzgnm3rsLqUxUnS37Lr4yRl1oWmlhpTW0x4B
	7AWaKJLNpBP0nhs+Lumd3+z2f5/Qy8CCLBQ+S9KDOhhu5qAi8s3yo3TboGnlfSYBQKw==
X-Gm-Gg: AYBFou2Jd518OBa1gGSTZ3vKwyBG5TEFAmfEG9DItU5e71CHEZHrzUHDRr+emHSRmlC
	6uUBB89KwTgk8A3KRycfFX7AfvJwBXpDfvjo0XjWv3lBYfMCslEb2sMtjZijsdCFsL+7tTcQkUD
	JDPVBw0M8PMc0AFhGXP7BLQCLRrApJJWVScdMsyvD+GgOD00kUQQktx0s27wsqEhQO7ts2zhv37
	SNqB0ooZorybyaRUK/UMZ1v+auqewirsT2lO6kf2z363k8eEqdWTNUgDhrK4kNDzxFZeLQsos5Q
	JPw3nE1VZcpCpAP/HYaLG0mHUyndf1M3WtBlbBbvBpyU6aDcp2j1pxg2PsagYBi3kg0pgSt1Y+V
	4aNlMMrOlKPHiqTnc57n6Mj3nkRyGb9QLPreWy9ddm6ASZGSGLfYoZE3AfniJpKrYX4znP9Zrji
	JxHLJbm4Qwzegwx6O7jvmsg7l3WVgFpHY9lLU92lIEwef0gwMoleRlzeg14PGQX0jJBlDiEABqW
	k9dT76dlPJzEmHQuQmyAwEq5/P7
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7d05432ac0amr2197848137.33.1793376594322;
        Fri, 30 Oct 2026 09:09:54 -0700 (PDT)
X-Received: by 2002:a05:6102:370d:b0:7cb:cfcf:3d01 with SMTP id ada2fe7eead31-7d05432ac0amr2197839137.33.1793376593802;
        Fri, 30 Oct 2026 09:09:53 -0700 (PDT)
Received: from QCOM-eG0v1AUPpu.na.qualcomm.com ([2a01:e0a:830:450:9d77:8e43:b62f:d85d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b7246fsm4044103f8f.19.2026.10.30.09.09.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 09:09:53 -0700 (PDT)
From: Loic Poulain <loic.poulain@oss.qualcomm.com>
Date: Fri, 30 Oct 2026 17:09:52 +0100
Subject: [PATCH] PM: Use IRQ safety to handle sleepable PM clock operations
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
Message-Id: <20261030-clk-leak-v1-1-db8cb68a5a8d@oss.qualcomm.com>
X-B4-Tracking: v=1; b=H4sIAE/B5GoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIzNDA2MD3eScbN2c1MRsXePURLM082TzlEQjUyWg8oKi1LTMCrBR0bG1tQD
 0pZsUWgAAAA==
X-Change-ID: 20261030-clk-leak-3ea6f7c7da25
To: "Rafael J. Wysocki" <rafael@kernel.org>, Pavel Machek <pavel@kernel.org>,
        Len Brown <lenb@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>, Johan Hovold <johan@kernel.org>
Cc: linux-pm@vger.kernel.org, driver-core@lists.linux.dev,
        linux-kernel@vger.kernel.org,
        Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>,
        Loic Poulain <loic.poulain@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfX1UmAXy8Zq8ri
 v8hiuupmx/DjeSvGATERMuFvvi/yhV+DD0o3+bKpyIoZo0fIAs0GEF2RH8qRil+ooPUuAEFeex3
 YDkbek3G0BDZD7vCNSy8sGNKZBaKLAna+AtGbYvnZvR7Z5zd+UvMRbbR4MCodMZW+iV8RfsB78M
 2kWd5/gc42PwOdymWy6RsCn8FVg2f/JRZPTkSLcQ/OENTPRO7XLntjH+IEs/CjWl2CSJtaH68rT
 hp5G8UJFC/sYNQcRKkUOGf0rqWpGnSdwYDQmw7r1mmCYgLmmoIj8OafoigIJx8u4ELHa9gqSN7R
 TmJJPapJWGI6LJYOn4Vmsbv+Eq7BZt8JOJUXB3b1O6Q0U9aE2y4E1lfxQ1vXjjn1bH34g5Etq43
 b4D0jAkIcM2psHgC7TSJFADr5EQhX0sOHyc6Yh4cdFHMO0wXTE+jXwy4VoPuqW5WWHTa4hxNYnF
 1x+T/9dKkX0V51VImAg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2NCBTYWx0ZWRfXyZoGgfOGPZ1C
 e0LfPexTWOB7m2ba3fAYbWvNfzIHpprjWjwiPeZ/g9j7p9w81cnCrWjw6SOWuRndRHbi+amjZyE
 8eRU4RTjFF8ht/HdCtpcy+eudWEl6c8=
X-Proofpoint-ORIG-GUID: DldQpv3spJbPjGIVTCSYCtIlJvANt1iu
X-Proofpoint-GUID: DldQpv3spJbPjGIVTCSYCtIlJvANt1iu
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4c153 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=q1VT6stkq7JPu4EZEUQA:9 a=QEXdDO2ut3YA:10 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300064

The PM clock runtime PM handling currently performs unprepare/prepare
in suspend/resume operations only for clocks that exclusively implement
prepare/unprepare operations.

However, this logic only considers the clock itself and ignores its
parent hierarchy. As a result, a clock that uses enable/disable
operations but has an ancestor that relies solely on prepare/unprepare
may leave permanent prepare references on both itself and its parents.
This prevents those ancestor clocks from being fully disabled.

For example, on Qualcomm platforms, this can keep the RPM XO clock
prepared (and so active) during runtime or system suspend even after
its consumers have been disabled.

Use the device's IRQ-safety setting to determine whether PM clock
operations may sleep. For usual non-IRQ-safe devices, defer clock
preparation and mark the clock operations as sleepable. Suspend can
then use clk_disable_unprepare() to release the clock's prepare and
enable references.

This changes behavior for all pm_clk users. Preparing and unpreparing
clocks across suspend and resume is generally expected, devices that
require PM clock operations to run in atomic context remain IRQ-safe.

Reported-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
---
 drivers/base/power/clock_ops.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/base/power/clock_ops.c b/drivers/base/power/clock_ops.c
index 3b8ba27802a800bac29abd8e21756ccdb0f2a716..b919a1d08cf4611067e626dd1131be870200838b 100644
--- a/drivers/base/power/clock_ops.c
+++ b/drivers/base/power/clock_ops.c
@@ -33,7 +33,7 @@ struct pm_clock_entry {
 	char *con_id;
 	struct clk *clk;
 	enum pce_status status;
-	bool enabled_when_prepared;
+	bool sleepable;
 };
 
 /**
@@ -177,10 +177,10 @@ static void pm_clk_acquire(struct device *dev, struct pm_clock_entry *ce)
 	if (IS_ERR(ce->clk)) {
 		ce->status = PCE_STATUS_ERROR;
 		return;
-	} else if (clk_is_enabled_when_prepared(ce->clk)) {
+	} else if (!dev->power.irq_safe) {
 		/* we defer preparing the clock in that case */
 		ce->status = PCE_STATUS_ACQUIRED;
-		ce->enabled_when_prepared = true;
+		ce->sleepable = true;
 	} else if (clk_prepare(ce->clk)) {
 		ce->status = PCE_STATUS_ERROR;
 		dev_err(dev, "clk_prepare() failed\n");
@@ -223,7 +223,7 @@ static int __pm_clk_add(struct device *dev, const char *con_id,
 
 	pm_clk_list_lock(psd);
 	list_add_tail(&ce->node, &psd->clock_list);
-	if (ce->enabled_when_prepared)
+	if (ce->sleepable)
 		psd->clock_op_might_sleep++;
 	pm_clk_list_unlock(psd);
 	return 0;
@@ -371,7 +371,7 @@ void pm_clk_remove_clk(struct device *dev, struct clk *clk)
 
  remove:
 	list_del(&ce->node);
-	if (ce->enabled_when_prepared)
+	if (ce->sleepable)
 		psd->clock_op_might_sleep--;
 	pm_clk_list_unlock(psd);
 
@@ -485,7 +485,7 @@ int pm_clk_suspend(struct device *dev)
 
 	list_for_each_entry_reverse(ce, &psd->clock_list, node) {
 		if (ce->status == PCE_STATUS_ENABLED) {
-			if (ce->enabled_when_prepared) {
+			if (ce->sleepable) {
 				clk_disable_unprepare(ce->clk);
 				ce->status = PCE_STATUS_ACQUIRED;
 			} else {

---
base-commit: e726cf08ee6ba7e8b852c77760f12c59f90f1338
change-id: 20261030-clk-leak-3ea6f7c7da25

Best regards,
-- 
Loic Poulain <loic.poulain@oss.qualcomm.com>

