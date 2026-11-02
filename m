Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793630825;
	b=NiDw3xnLet/3k+Iw2FByZ2sGxIfLekiD/pORQIwET+S3dayd88jSYYc9j3uphfoNCgnd
	 IREg7YNIwS+yQl2U5DfFLyCB8+Fv5UvLeblRpi9ENRP6s+NieGhE22v8JgkIJXdJXssgL
	 mZx3ojQj5UWdAANXBzno7tuJTF6ZN8ydMNyDhxN2zbd2mMyPfxXujmkQHXd9EMb5jaXg8
	 vGb9K7bmkTsX+PcR17orldJYDP8FYpuKyaSY6qmtPv8RccNVnfZMK4NTYa9AEamQ85bIQ
	 i1jItQ5gVl09OmOkhEwYJWAI/XA4aOsBeNisD7SGcSJlngeM0+4zNzpIzi9OKMKkhQw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793630825;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=;
	b=RAX2JqHVz9bTWhohtyL2NvjNLTN6wxnngtE8fuM37VazGaMwWoIB2FU2C8tSiI1o1D01
	 +BPGKaJdVm3zS/H4hHr/XAHrmKZHG3YYg//ybdp1Ibx02stcuRFP82uzf1A2w4HbqstCp
	 C6RbwHYgxVWB9EDUIHrZ0ok45lQHXiHPxHwQZm+LzHJ3xmdmQzYFnFUsEJchmQv5EUtOt
	 ASbuETmNOilrXJFMhPjVe/jWCr+J/G1gtf9IkyDyvhX4aeYFgUkuxvLlpJdoT14jHHDXN
	 wYZo8tUZnstWZ5rEcHFSoC0QP2wNy+UIuSQqa//5kl5gqwrlmAWWH1CkIBalJ/iZoLA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJ9h9xzd;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b="ECT2cA/l";
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9257F60A6F56
	for <driver-core@lists.linux.dev>; Mon,  2 Nov 2026 14:47:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9257F60A6F56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=hJ9h9xzd;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ECT2cA/l
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A2DpIFu3102577
	for <driver-core@lists.linux.dev>; Mon, 2 Nov 2026 14:47:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=; b=hJ9h9xzdoubeImHd
	vcfmerxsjcHiCyLKAcY7uxb+2B0hybHzh6vsXXZEtOreZ1TXF14/Y0fh/5RcPGJ/
	VtumWcxgBenL44u1BTfODv9+HwX4c+wfAiuJvEFwDTBXUKI7tZpFRlbG0zZJwBZq
	2JEMHXaICg5FXxcdwCfrSqYoncWPHJO80ynGsKWbySNv0RNA68EEw2r+PMhVihj2
	SjVVJ4uh+3Fgt8c9BTSh9Vbwyyx/KZJl+7wN1FIANE3TwxG2A68jT547S8O5ammQ
	C0LWEs7Xe3ovarg8YPblGq6U3+Gh9Kh2lGUtnKan/Y3tb+XGs9rcKIiCT1R6VdJ4
	5gtvcg==
Received: from mail-vs1-f71.google.com (mail-vs1-f71.google.com [209.85.217.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hpk9rjath-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 14:47:03 +0000 (GMT)
Received: by mail-vs1-f71.google.com with SMTP id ada2fe7eead31-7bf3a6cf1c8so2402797137.3
        for <driver-core@lists.linux.dev>; Mon, 02 Nov 2026 06:47:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793630823; x=1794235623; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=;
        b=ECT2cA/l6sY2fTeoGKJq2ai7GdMLn3ny9/X3WHusoALXATSls2TixTLwNQhV2X76z6
         e0rPOPMhwwfIMEWvELdRkKpZNYdqGNT6WhhakPYa+Y8RpdJkEK9zHmdeeoP4mwSlO7tI
         Nt9BlqfBCXpMCSipE95YymPLPp+KtR8Mus+YrAs6UAGgBqW9dT4YnOEkFnep4IVGy0Km
         RNQNxIlUXYWXjtMN5PakWdDy8NItuIURxQ7oYke5K70Ck5NxmtaoCjAGEOWjMokoqwam
         xdUg0k8z8gN2jjIxOKx2SVsNVaIpuHK6+LdLymhMihl9MM8tnsedEZCpCH5I0va2r9tT
         4RLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793630823; x=1794235623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PhtKHNCzvBbYJo7kK2oH/+mQGSC+QziCQO0T5A2ou0Y=;
        b=fue5Z1m4Jo8bCHd7bZadjtC8wyog1zYldUxfQHwbIudifvjd+3q1fjKWJNcxmZ9dJA
         INzXyXso1p8/WlehyPaeauC6fwzGr+V3AZrxLqHhpTmDHixtqf87s6sPlXDUWXQsbhHa
         FPp5AmOmUopn7OyIJt50+VfWqFpE+2UULsxeb56ZhCm/4nOx50is6wPRMv/gUsOFKmGF
         R67DTN21zFNZcHLZ/bFtETJB3/QIXg6wRmfAJF8cszKmb1gpvqpgM5Lnf78G3uOvsqjb
         +t8r3F2pb/LLdMhVEHnCEPF5+t9c9ESs9XSciAFFYmZry/t+ny9f7Q3+oo1Fs23CUOye
         n90Q==
X-Forwarded-Encrypted: i=1; AKwUvBw/On9efUMTWap09LGY0eiR58fUkxe6613TcvKnlqKFs1y40G234NaVMWCpyGhShU2IEV04K7ifb2ZeGQ==@lists.linux.dev
X-Gm-Message-State: APuU4Z+WQL8+JCvwXbIC402RIKBl/vAJCIQbMBpLsrLlaJLkBa4/kuQw
	b5WOMeUJCQTIcIOJDuvO7Tftndr/MucR6LNERp0K79koBa2C9cfzzBOYghehBOuEnTYQp96hPrC
	vOjM4kruogMZK2v1BKeER5undQL/V24VJ5BdXFiZ6ZMQyndMUeOCTech1PpRnRuLvJw==
X-Gm-Gg: AYBFou3XskiH8Iqnk+L/SdAtuPwSibd6sof6yK8XfJirb2vwp9bKA8uPBiuyz4tV5TZ
	05Wffe1teSpuRJErU9eff+gH4Wz+4Nf1GCDac8DumFIZ++gspD6oepZY41RtNCkNH0CfyVXbuG1
	8ZIp4VmZjj+63g1Ocm1crTOPOkcHIj67vkSJwYabpKVMyFyOn7YSuWIft+OlakrF2WvRP7hHojs
	XxL3OkjUe/7liDjwmWT8skrU/w6DwB7cDBfscz4snbWGoa+e/JNHLhI0JUh8Crqaxu1jPQj8dmN
	vltARfdeSSnUjeNiBMRsmUsKh1enbnOhoVxJsGlMW2P/Nr3C/+N7XXIQfbcn4Lg67zVs0KJufyd
	15uGpClv77rIFcRHuxVmbf6akhfmcJe2GBK5vv8a45iY4c5ZBFc1wxG1Jmg==
X-Received: by 2002:a05:6102:5048:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7d072d49698mr4176787137.31.1793630821193;
        Mon, 02 Nov 2026 06:47:01 -0800 (PST)
X-Received: by 2002:a05:6102:5048:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7d072d49698mr4176756137.31.1793630820080;
        Mon, 02 Nov 2026 06:47:00 -0800 (PST)
Received: from [127.0.1.1] ([188.27.161.77])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e86a06078sm4004893f8f.54.2026.11.02.06.46.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 02 Nov 2026 06:46:59 -0800 (PST)
From: Abel Vesa <abel.vesa@oss.qualcomm.com>
Date: Mon, 02 Nov 2026 16:46:50 +0200
Subject: [PATCH 1/2] PM: sleep: Do not mark devices without PM callbacks
 active on resume
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
Message-Id: <20261102-b4-pm-sleep-hibernation-fixes-v1-1-51fac96d080d@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2706;
 i=abel.vesa@oss.qualcomm.com; h=from:subject:message-id;
 bh=WEsPxao1XYRmaV90WeW7n4UXIAWakRV1knJgQrEUYSI=;
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBq6KJeJsN8MIUPJLFJXgCfoWHCZbki870RQaP4M
 1TARZXFMsGJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCauiiXgAKCRAbX0TJAJUV
 VsasD/9sbOdoasu+/OzLpVRMYXtob+9KPgFrS0BcIwPeGa/Eo9qwFxvlxAgqnRmoMYCVYueFOpt
 3H3HUELwkkRC5rijcyROAy1NFiP0zGCZCyyJHq0elWp/OlI4FsqrW8hC/ILrhNHGr+lpf72LTZB
 tOhYALncg+jY4Rizwdp99a8rDLQfv0b1/42ZaIFfqFu7i1Klwd3kjRjff4tlAVYgqBJWNyhGwro
 4NpCrgA4bBLngWf+MySssqn4gsCbG84CS8qFxRJxNXzQMiOa3aM7JQMVjpYo265NExj3eqmif9o
 vtX57KbnbE07o64GJU2JX7VZ5SWsB0schbxo4Af7vsEsKVl1JEUrBLWEW8MLnnN1ljvoqEnxnbi
 0TptMwzFu+v91wnPFSl5FGEAyIBgCBZy4wH3fzpGdzvpXsFq1Ye5oVA6cdSrrM3z/QrZlMnjF5C
 nUgcfoKTxX2OGFm1ZjdSI5b1jd0Xe0wTKpbmBRK7BjBebmNEg0KaCWWxlw7XUVqmmIodzKXUdFm
 0HBVgtJ+NlK5c1kz3GWnoahqhCmBZQ0ShrO1vt0CT2oI2RJmPgp706XXSFkUw65P4NcljsKDtQu
 jT/z9T8xkwZIjqRY+eRZbIhltZY2l6WtpTiP2O/nB2uIclSC4jriBOyIdIBoV6Y9Kj4eGSKqArM
 XVwMzd57ggzqLxQ==
X-Developer-Key: i=abel.vesa@oss.qualcomm.com; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
X-Proofpoint-ORIG-GUID: YkTD3Ua0oGspQ9z0uvPgny5hKrjTbaaa
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX08x+OCSQRJ6t
 FsGjfK18up70BrVK/JMef9CppGQgXBEo73sLfPQIs+drXazttULINgy36mGQuBd6WL379PWuNvL
 8LQ1IkYA1Oj9lmugSlePg5/tma9UaZhdW8UsG8o18GNI6zFVwMkKu7boZ7YX6g8o3/ZZn9bSY0x
 9KS4mmO8daXE29uhxr47ZHlxCww5kHQYPZ3a3HVfUBWgwRIj3BEBMqwl3qJuTk1LB4DyChtVeWj
 1XtviH3pBjFDtmnoJJqFPYeoQVZlc6f+/hyGGY9p9rGCBQdVTKKyofYUnkEq+no0FUjsEJeGIag
 v9SYuVYAuK9Z+eVBHlr78oorA0SuiQpaNG1WwhzqTshPdRR3W4oCs00dVp+RPqYZwed9dGH+QW3
 wSA7JM9i7c5/XqiX/FPg6ukBqo0J11CdFMXLUh9jktI474E5wC+JVInY1GtSfycaZzokEBT0bDB
 9JKE/CYLNtXIPfYlMuw==
X-Proofpoint-GUID: YkTD3Ua0oGspQ9z0uvPgny5hKrjTbaaa
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAyMDA1OCBTYWx0ZWRfX7wxkN+U4SdaB
 /4Zt+yrYv+fSTxqrO8/RsKLjipjuDHXXGmtZQuQPgB+pYGPfJJFKo7H5VtT+XNjiOfJXcByfZUN
 eTH/bEotA2fIsngFrCrFRBAp4+jF//s=
X-Authority-Analysis: v=2.4 cv=LvwHWXdc c=1 sm=1 tr=0 ts=6ae8a267 cx=c_pps
 a=P2rfLEam3zuxRRdjJWA2cw==:117 a=asF+/XNaGoxFafzDDLC1GQ==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=BJxvg6BrSIDu2IxgrNwA:9 a=QEXdDO2ut3YA:10
 a=ODZdjJIeia2B_SHc_B0f:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-02_04,2026-11-02_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0
 phishscore=0 priorityscore=1501 adultscore=0 suspectscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611020058

Devices without system sleep callbacks get power.smart_suspend set in
device_prepare_smart_suspend(), unless their parent or a supplier
prevents it, so device_resume_noirq() sets their runtime PM status to
"active" whenever dev_pm_skip_resume() returns false. That is always
the case for PM_EVENT_RESTORE.

Nothing resumes such a device, though. If its bus or driver manages
resources from runtime PM callbacks, those resources stay off while the
device is now reported as active, and the next runtime suspend releases
them a second time.

AMBA devices are an example, since the AMBA bus only has runtime PM
callbacks, which enable and disable the APB clock. After restoring from
hibernation on a Qualcomm Glymur CRD, the runtime-suspended CoreSight
devices are marked active, and the following runtime suspend of each of
them hits:

  qdss already disabled
  WARNING: drivers/clk/clk.c:1259 at clk_core_disable+0xa4/0xac
  Call trace:
   clk_core_disable+0xa4/0xac (P)
   clk_disable+0x30/0x4c
   amba_pm_runtime_suspend+0x58/0x74
   __rpm_callback+0x48/0x1e0
   rpm_callback+0x58/0x64
   rpm_suspend+0x10c/0x5a4
   pm_runtime_work+0xc8/0xd8

followed by "qdss already unprepared".

On suspend-to-RAM this does not happen, because such devices take the
direct_complete path and device_resume_noirq() returns early for them.

Leave the runtime PM status of devices without PM callbacks as it is.

Fixes: bca84a7b93fd ("PM: sleep: Use DPM_FLAG_SMART_SUSPEND conditionally")
Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
---
 drivers/base/power/main.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/drivers/base/power/main.c b/drivers/base/power/main.c
index 88a31e09e4f3..16a1f017051e 100644
--- a/drivers/base/power/main.c
+++ b/drivers/base/power/main.c
@@ -839,10 +839,15 @@ static void device_resume_noirq(struct device *dev, pm_message_t state, bool asy
 	 * Otherwise, the device is going to be resumed, so set its PM-runtime
 	 * status to "active" unless its power.smart_suspend flag is clear, in
 	 * which case it is not necessary to update its PM-runtime status.
+	 *
+	 * A device without system sleep callbacks is not going to be resumed
+	 * by anyone, though, so leave its PM-runtime status as is. Otherwise,
+	 * resources managed by its runtime PM callbacks, like the bus clock of
+	 * an AMBA device, would end up unbalanced on the next runtime suspend.
 	 */
 	if (skip_resume)
 		pm_runtime_set_suspended(dev);
-	else if (dev_pm_smart_suspend(dev))
+	else if (dev_pm_smart_suspend(dev) && !dev->power.no_pm_callbacks)
 		pm_runtime_set_active(dev);
 
 	if (dev->pm_domain) {

-- 
2.54.0

