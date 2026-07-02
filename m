Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4EAAA374E7A
	for <driver-core@lists.linux.dev>; Thu,  2 Jul 2026 06:08:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782972538; cv=none; b=uXwvHyJZ3TXLPq0g2KDCSz8R24uO5mh0CvBKEuukRJvr+Sug1SBsAF0G6EGyMjts5+k/u6xV5YXqTagDNLkc7wZTqgqq+zrUN95nXOmbwVurpL8bIWU5pDKyr0Wpf9YUidnVumayZhywDnQG4hzVpVb10a8e6SlENJScpwx0+j0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782972538; c=relaxed/simple;
	bh=3gW8zaHZTaZH07dB3PSD2tlZ2KSpbkUIrqHW/ZG2DTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nRXc2ZSFpCbAk4dT/BB0URBQ823hlwZniUZNDj+e3kpkxqei81Hf+mQXzul/ecG8RRGzg16XBANFbIFuniBaT47BRemvqoBPqZtvtTyDPXJGFOFuOBiJiX/w0vDshzqTwUYM2SgWcj95OPjL0zmKkRmLfOeG3T/+dIL8SI0cTw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSSO77wm; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=DDVyqn/h; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSSO77wm";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="DDVyqn/h"
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6621KtZA3069378
	for <driver-core@lists.linux.dev>; Thu, 2 Jul 2026 06:08:56 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	h39sTfM/7b6zwQc9sQowY5+iDwhDzkCtqaJCY9Xe/i4=; b=CSSO77wms8g/Thlh
	QWnP23UVl5YNzU1dblemyAMvjjOaN2OOJjWkEUszw5mgo6v5spXgHnzo0NRBG1St
	vnUvqIm/czvbiWVc1RTDEDk08kHF5TjFON1EprJFbAS1xowuPzOMsms0RoqZ/WVy
	SbcNzfGsb7euAWWUdHlwQ7A7l+V+QGgjQ0Xbrr7xoj6lcJcIoZPecWZyGgeHeWlZ
	JGB1cu17q/v/XuANtgtNW96jHpP/GrTGDJadh7x1GQpIS+Zqfwx7ydPr+hLSMibT
	d2WqRH22Lzc/nhPNEQ411xsLZJPKEeTTbwCkmYXOLq9WgMaleYhtwKqYJf1SD9Zv
	CK628Q==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f510am3qu-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <driver-core@lists.linux.dev>; Thu, 02 Jul 2026 06:08:56 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2c987913b08so19135365ad.2
        for <driver-core@lists.linux.dev>; Wed, 01 Jul 2026 23:08:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1782972536; x=1783577336; darn=lists.linux.dev;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=h39sTfM/7b6zwQc9sQowY5+iDwhDzkCtqaJCY9Xe/i4=;
        b=DDVyqn/hike0kNYn9DPPv2+Jnqp0R+PN7eu/96Q4pD2YX6t6hpiOtuC5EgL0oGBLP1
         au++MaNf650c6Rwm5ccMPYPEXl6dQhn/M+pxwVgNh7hs4mSyPA8ztWPVS7ut/+qlsCdf
         r6g/bYLOzmq3Pr7zc0sw/8T64CImY1Wwj1XDBe22JgzM9f/JTsysAURGJW6peeGi3SJH
         t0NxgDD9vyTIqdS7+EAo86/5El+RVnoYLxwSOJy59JnEvt0bORC3ClKjRcYnqlOefrMv
         Vji1IF9i9d/keWohkJQE9rwR1FsaZvF/6Rl7urOYFAdLeLd3muglmPNORfR/gYzexd48
         AMJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782972536; x=1783577336;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=h39sTfM/7b6zwQc9sQowY5+iDwhDzkCtqaJCY9Xe/i4=;
        b=l1WPoOSefXOWHVEFytrPjCdAgozxtv9DuAwGqJYtOEwqUKUX3SndtAukYkAbcOtz3g
         vNXbRbGLoxyDttJyr3BwB46EOWxJq4MeDPeot/hAZw+CAOoSvSaE5VaNAGD2uwiQUS5n
         AgsM03q3Is8OL7sotLRcmfhYODhWDLaFKpU3Q2g6piuApSI3P7GZQ7ui8pM/aeHNcWkW
         1ZqgpprSdMxfJBpCRrYlzMD1ucXkPdPfxHvfeTxK9ix42/r/AK3DSNXi0iRVPJL9k2hT
         HTClC2DHsHg4jFzhoke4RWG8WDbSPqk8gE8MXsdHMdceA62npsQDJN7XSTNAS7YN1wnf
         kfLg==
X-Forwarded-Encrypted: i=1; AHgh+Rojib86DfW1L0lSjthVagLMfAY7I+zyQoPYUs/OqlusCrnnRg3LwsLR6QRI1wUsQb0Pyd2r5OxL+Al/Mg==@lists.linux.dev
X-Gm-Message-State: AOJu0Yx2perwTUTDxdvrVzEZzIYUqmKLcxSNSdaAVfanoRN3KSDVrgUF
	J/JIZCVfuliTgXhiAzMaQBKQDBXcMRUyBQE9doeBn0upxTSjG7CUKt+kGoO7rObfeN+/GgrxDrX
	kNNGHYXugzH+LXmvnybhmWP/vs5dKYoM8aOwbswCoYCexi2zZvgsTfLmApNharHGsbA==
X-Gm-Gg: AfdE7cmQi5TGBvssM4h8jJa7SNRJtgM1NGYHqOdR4SvnSMsbZMSMxPN+cxzPJ2iw2mm
	ViAbjd2BUv+OCbVRb0TL8a9edZswPrieTR8u8jRRjqqrWIWrUCKHNUrZPb2OmW+o7hTStZz193q
	JxLrvSdgVm2+cxttJ5p8hCgg16W7lVyd8lkwkvQ0HrnCI9o1MGDehiQ81gaDkPH4VyjRnfP8tt/
	40VdK/e2aRvTeBeNXCibDC7knXc/TINMJ9L49sS3CN9j1h/vNDJdh+MJCqWllPSJuCp++tWxLuO
	VkQwvtERAljGLWAfSCy5NuBjP9d4ZTqZVJSK1rep9PMZHfANl1+eB2HiK1sxtxM7QZm7QF0F5bU
	JzVNSHvqx5JZOKtmZ0z1Ep2cf16lbs6Pc79thJpqu1JMR
X-Received: by 2002:a17:902:cf0a:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ca7e919a7fmr47080315ad.39.1782972535645;
        Wed, 01 Jul 2026 23:08:55 -0700 (PDT)
X-Received: by 2002:a17:902:cf0a:b0:2c9:b480:f5d0 with SMTP id d9443c01a7336-2ca7e919a7fmr47079835ad.39.1782972535001;
        Wed, 01 Jul 2026 23:08:55 -0700 (PDT)
Received: from hu-ptalari-hyd.qualcomm.com ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca9aa00970sm8176325ad.71.2026.07.01.23.08.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 23:08:54 -0700 (PDT)
From: Praveen Talari <praveen.talari@oss.qualcomm.com>
Date: Thu, 02 Jul 2026 11:38:21 +0530
Subject: [PATCH 2/4] spi: core: fix sticky -EINVAL after
 pm_runtime_get_sync() failure
Precedence: bulk
X-Mailing-List: driver-core@lists.linux.dev
List-Id: <driver-core.lists.linux.dev>
List-Subscribe: <mailto:driver-core+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:driver-core+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-2-6ddc317011c0@oss.qualcomm.com>
References: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
In-Reply-To: <20260702-fix_sticky_-einval_after_pm_runtime_api_failure-v1-0-6ddc317011c0@oss.qualcomm.com>
To: Mark Brown <broonie@kernel.org>, Dilip Kota <dkota@codeaurora.org>,
        Stephen Boyd <swboyd@chromium.org>,
        Girish Mahadevan <girishm@codeaurora.org>,
        Alok Chauhan <alokc@codeaurora.org>, bjorn.andersson@oss.qualcomm.com,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
        Pavel Machek <pavel@kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Danilo Krummrich <dakr@kernel.org>,
        Douglas Anderson <dianders@chromium.org>
Cc: linux-spi@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        Mukesh Kumar Savaliya <mukesh.savaliya@oss.qualcomm.com>,
        aniket.randive@oss.qualcomm.com, chandana.chiluveru@oss.qualcomm.com,
        jyothi.seerapu@oss.qualcomm.com, linux-pm@vger.kernel.org,
        driver-core@lists.linux.dev,
        Praveen Talari <praveen.talari@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782972515; l=2420;
 i=praveen.talari@oss.qualcomm.com; s=20251114; h=from:subject:message-id;
 bh=3gW8zaHZTaZH07dB3PSD2tlZ2KSpbkUIrqHW/ZG2DTo=;
 b=29q6KRWQU8V4i4fHxADGTApIS279oVcDa3pNLRh5g5n1yTQmxQyfbqUR7NucTYjcZ8NTVr/Wp
 J3HsIQgJDIfANgr4Q9vXDiaSNg2+I7qAPx/Gz4pOL/3+cx5wLvxkVUM
X-Developer-Key: i=praveen.talari@oss.qualcomm.com; a=ed25519;
 pk=NGK/88fjyHXgfhIKwag7+uIytOmyOypvZ/hDFaYPEss=
X-Proofpoint-GUID: ip7YJXriD8ADG6XD6r0zNwSvyNKKBRjJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX12L3/boG+nUt
 KtpYcI3qi90RIoWson8ZiEUw4k32CJlkdfCXowoDo47lWPW9gwb+sEfoi4gCobBfgv0N4k0hgmt
 fdaGBGRXfoR1aPfRAyzTvVnUD2ppFcwiFIDuss8w8l0vA15t9p3oFFuJ7UYNKVGvFzTeMznBG/x
 5mbC+RbNRRSKXOmb8ItdlpwlLJQOjrvKOWONwHJXNSle8fnSvOIJV1ugEUOgrKr91XbYDkZfos3
 +LhDZ2oZjEN1h2IxFSi/H72HH+Jp/Kd+cz/pKNcx4QjUCTQf3uAyVnjwkSoVQunBCr1mmckp8Lt
 V1Qz7toVXb4q89XoYIvOdYto0E+fQVD4ZGc2t+esyVjdBo7HWLh9H4XgF+nmXCxCyTG/y8l3NHe
 0Wip/fpUXH0+hWu83oPOvv0B9IoRbHBaY/LOGhsJRe/YDNxbsx+BXG8C0h58CdiX3TZG0DQI55f
 HTRlDVCZ/KYuUyeu5Yg==
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzAyMDA2MCBTYWx0ZWRfX9PYkt0Np+Sjw
 hv3nBu5vomNDG+hYRwXXfDvOufRQYmKx+A1ABlcT4zxif3pEcVqwo4xafctXM3EA+x7FdjclfEz
 iJLwyDzlMNcg+MjuSab+SUTWwZRzYV0=
X-Authority-Analysis: v=2.4 cv=JpXBas4C c=1 sm=1 tr=0 ts=6a460078 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=02vcd1kolNyrAxwz3cgA:9 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: ip7YJXriD8ADG6XD6r0zNwSvyNKKBRjJ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-07-02_01,2026-06-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 malwarescore=0 impostorscore=0 clxscore=1011
 spamscore=0 priorityscore=1501 phishscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2607020060

When pm_runtime_get_sync() fails, the RPM core leaves
power.runtime_error set to a non-zero value. Every subsequent call
to pm_runtime_get_sync() returns -EINVAL immediately without
attempting the resume, making the controller permanently unusable
until rebound.

Add pm_runtime_set_suspended() after the pm_runtime_put_noidle()
call in each get_sync() failure path. pm_runtime_set_suspended()
clears power.runtime_error and returns the device to the suspended
state, allowing the next transfer to retry the resume.

Symptoms observed:
spi_master spi2: Failed to power device: -110
spi_master spi2: noqueue transfer failed
geni_spi 988000.spi: Runtime PM usage count underflow!
spi_master spi2: Failed to power device: -22
spi_master spi2: noqueue transfer failed

The -110 is the initial resume timeout; the -22 (EINVAL) on every
subsequent transfer is the sticky runtime_error; the underflow is
from pm_runtime_put() called against an already-balanced count after
the unchecked get_sync failure in the driver.

Signed-off-by: Praveen Talari <praveen.talari@oss.qualcomm.com>
---
 drivers/spi/spi.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index f897789a44d1..8d5c8d7c5a1a 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1746,6 +1746,7 @@ static int __spi_pump_transfer_message(struct spi_controller *ctlr,
 		ret = pm_runtime_get_sync(ctlr->dev.parent);
 		if (ret < 0) {
 			pm_runtime_put_noidle(ctlr->dev.parent);
+			pm_runtime_set_suspended(ctlr->dev.parent);
 			dev_err(&ctlr->dev, "Failed to power device: %d\n",
 				ret);
 
@@ -4016,6 +4017,7 @@ static int spi_set_cs_timing(struct spi_device *spi)
 			status = pm_runtime_get_sync(parent);
 			if (status < 0) {
 				pm_runtime_put_noidle(parent);
+				pm_runtime_set_suspended(parent);
 				dev_err(&spi->controller->dev, "Failed to power device: %d\n",
 					status);
 				return status;
@@ -4121,6 +4123,7 @@ static int __spi_setup(struct spi_device *spi, bool initial_setup)
 	if (spi->controller->auto_runtime_pm && spi->controller->set_cs) {
 		status = pm_runtime_resume_and_get(spi->controller->dev.parent);
 		if (status < 0) {
+			pm_runtime_set_suspended(spi->controller->dev.parent);
 			mutex_unlock(&spi->controller->io_mutex);
 			dev_err(&spi->controller->dev, "Failed to power device: %d\n",
 				status);

-- 
2.34.1

